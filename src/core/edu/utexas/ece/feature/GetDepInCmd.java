/*
 * This file is part of iAlloy. iAlloy is free software: you can redistribute it
 * and/or modify it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * iAlloy is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with iAlloy.
 * If not, see <https://www.gnu.org/licenses/>.
 */

package edu.utexas.ece.feature;

import static parser.etc.Context.logger;

import edu.mit.csail.sdg.ast.Command;
import edu.mit.csail.sdg.parser.CompModule;
import edu.utexas.ece.util.CheckSumVisitor;
import edu.utexas.ece.util.DependentParagraphCollector;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import parser.ast.nodes.Assertion;
import parser.ast.nodes.Check;
import parser.ast.nodes.Cmd;
import parser.ast.nodes.Function;
import parser.ast.nodes.ModelUnit;
import parser.ast.nodes.Node;
import parser.ast.nodes.Paragraph;
import parser.ast.nodes.Predicate;
import parser.ast.nodes.Run;
import parser.etc.Names;

/**
 * Regression command selection
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public class GetDepInCmd {

  public List<SingleDepOutput> collectDep(CompModule module, String dependRoot, String modelName)
      throws IOException {
    ModelUnit modelUnit = new ModelUnit(null, module);

    // Maps a command name with all paragraphs (sigs, facts, predicates, functions and assertions)
    Map<Command, Collection<Node>> cmd2nodes = new LinkedHashMap<>();

    for (Check c : modelUnit.getCheckCmdList()) {
      putCmd2Nodes(c, modelUnit, cmd2nodes);
    }
    for (Run r : modelUnit.getRunCmdList()) {
      putCmd2Nodes(r, modelUnit, cmd2nodes);
    }

    List<SingleDepOutput> outPut4Dep = new ArrayList<SingleDepOutput>();
    cmd2nodes.forEach(
        (Command, usedParagraphs) -> {
          String commandName = Command.label;
          CheckSumVisitor visitor = new CheckSumVisitor(commandName);
          usedParagraphs.forEach(
              para -> {
                para.accept(visitor, null);
              });
          Map<String, String> para2String = visitor.getNodeStringMap();
          Map<String, String> predFacts2String = visitor.getPredsFactsList();
          Set<String> paramSet = visitor.getCmdParamSet();
          List<String> predFacts = new ArrayList<String>();

          Map<String, String> para2Hash = new HashMap<String, String>();
          for (String k : para2String.keySet()) {
            para2Hash.put(k, String.valueOf(para2String.get(k).hashCode()));
          }

          SortedSet<String> sortedKeys = new TreeSet<>(para2String.keySet());
          String mcFileName = commandName + ".dep";
          String mcPath = dependRoot + File.separator + mcFileName;
          File mcFile = new File(mcPath);

          if (mcFile.exists()) {
            Map<String, String> oldPara2Hash = new HashMap<String, String>();
            FileReader fileReader;
            try {
              fileReader = new FileReader(mcFile);
              BufferedReader bufferedReader = new BufferedReader(fileReader);
              String line;
              while ((line = bufferedReader.readLine()) != null) {
                String oldKey = line.split(" ")[0];
                String oldHash = line.split(" ")[1];
                oldPara2Hash.put(oldKey, oldHash);
              }
              fileReader.close();

              if (!twoMapsEqual(oldPara2Hash, para2Hash)) {
                if (twoMapsCmdEqual(oldPara2Hash, para2Hash)
                    && twoMapsSigEqual(oldPara2Hash, para2Hash)) {
                  for (String para : predFacts2String.keySet()) {
                    predFacts.add(predFacts2String.get(para));
                  }
                }
                SingleDepOutput sdo =
                    new SingleDepOutput(commandName, Command, paramSet, predFacts);
                outPut4Dep.add(sdo);

                WritetoDepFile(mcPath, sortedKeys, para2Hash);
              }
            } catch (FileNotFoundException e) {
              e.printStackTrace();
            } catch (IOException e) {
              e.printStackTrace();
            }
          } else {
            WritetoDepFile(mcPath, sortedKeys, para2Hash);
            SingleDepOutput sdo = new SingleDepOutput(commandName, Command, paramSet, predFacts);
            outPut4Dep.add(sdo);
          }
        });

    return outPut4Dep;
  }

  private void putCmd2Nodes(Cmd c, ModelUnit modelUnit, Map<Command, Collection<Node>> cmd2nodes) {
    String commandName = c.getName();
    String NcommandName = commandName.replace(Names.DOLLAR, Names.UNDERSCORE);
    Paragraph para = findInvokedParagraph(modelUnit, NcommandName);
    if (para == null) {
      logger.error("Cannot find a paragraph with name " + NcommandName);
      return;
    }
    Collection<Node> usedNodes = DependentParagraphCollector.collect4open(modelUnit, para);
    usedNodes.add(c);
    cmd2nodes.put(c.getCommand(), usedNodes);
  }

  private void WritetoDepFile(
      String mcPath, SortedSet<String> sortedKeys, Map<String, String> para2Hash) {
    try {
      BufferedWriter out = new BufferedWriter(new FileWriter(mcPath));
      for (String key : sortedKeys) {
        out.write(key + " " + para2Hash.get(key) + "\n");
      }

      out.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private boolean twoMapsEqual(Map<String, String> oldM, Map<String, String> newM) {
    if (oldM == newM) return true;
    if (oldM.size() != newM.size()) {
      // System.out.println("size diff!!!!!!!!!!!!!!!!!!!");
      return false;
    }

    for (String oldk : oldM.keySet()) {
      String oldv = oldM.get(oldk);
      String newv = newM.get(oldk);

      if (!oldv.equals(newv)) {
        // System.out.println("value diff!!!!!!!: " + "oldv: " + oldv + " newv: "+ newv);
        return false;
      }
      oldk.startsWith("sig");
    }

    return true;
  }

  private boolean twoMapsSigEqual(Map<String, String> oldM, Map<String, String> newM) {
    Map<String, String> oldSigM = new HashMap<String, String>();
    Map<String, String> newSigM = new HashMap<String, String>();
    for (String oldk : oldM.keySet()) {
      if (oldk.startsWith("sig")) oldSigM.put(oldk, oldM.get(oldk));
    }

    for (String newk : newM.keySet()) {
      if (newk.startsWith("sig")) newSigM.put(newk, newM.get(newk));
    }

    // if newSigM is the subset of oldSigM => true;
    if (newSigM.size() < oldSigM.size()) {
      for (String newk : newSigM.keySet()) {
        String oldv = oldSigM.get(newk);
        String newv = newSigM.get(newk);
        if (!oldv.equals(newv)) return false;
      }
      return true;
    }

    return twoMapsEqual(oldSigM, newSigM);
  }

  private boolean twoMapsCmdEqual(Map<String, String> oldM, Map<String, String> newM) {
    String oldCmdHash = "";
    String newCmdHash = "";

    for (String oldk : oldM.keySet()) {
      if (oldk.startsWith("run") || oldk.startsWith("check")) oldCmdHash = oldM.get(oldk);
    }

    for (String newk : newM.keySet()) {
      if (newk.startsWith("run") || newk.startsWith("check")) newCmdHash = newM.get(newk);
    }

    return oldCmdHash.equals(newCmdHash);
  }

  private Paragraph findInvokedParagraph(ModelUnit modelUnit, String commandName) {
    for (Predicate pred : modelUnit.getPredDeclList()) {
      if (pred.getName().replaceAll("\\" + Names.DOLLAR, Names.UNDERSCORE).equals(commandName)) {
        return pred;
      }
    }
    for (Function fun : modelUnit.getFunDeclList()) {
      if (fun.getName().replaceAll("\\" + Names.DOLLAR, Names.UNDERSCORE).equals(commandName)) {
        return fun;
      }
    }
    for (Assertion assertion : modelUnit.getAssertDeclList()) {
      if (assertion
          .getName()
          .replaceAll("\\" + Names.DOLLAR, Names.UNDERSCORE)
          .equals(commandName)) {
        return assertion;
      }
    }

    return null;
  }

  /**
   * Collect the dependency graph of one command
   *
   * @author Wenxi Wang
   * @version 1.0
   */
  public class SingleDepOutput {
    public String cmdName;
    public Command cmd;
    public Set<String> paramSet;
    public List<String> predFacts;

    public SingleDepOutput(
        String cmdName, Command cmd, Set<String> paramSet, List<String> predFacts) {
      this.cmd = cmd;
      this.cmdName = cmdName;
      this.paramSet = paramSet;
      this.predFacts = predFacts;
    }
  }
}
