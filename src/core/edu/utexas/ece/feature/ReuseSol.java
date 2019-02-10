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

import edu.mit.csail.sdg.alloy4.A4Reporter;
import edu.mit.csail.sdg.ast.Command;
import edu.mit.csail.sdg.ast.Module;
import edu.mit.csail.sdg.parser.CompModule;
import edu.mit.csail.sdg.translator.A4Options;
import edu.mit.csail.sdg.translator.A4Solution;
import edu.mit.csail.sdg.translator.TranslateAlloyToKodkod;
import edu.utexas.ece.feature.GetDepInCmd.SingleDepOutput;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Solution Reuse in iAlloy
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public abstract class ReuseSol {

  public static final String SEP = File.separator;

  public List<SingleDepOutput> output4Dep;
  public String xmlRoot;
  public String paramRoot;
  public String modelName;
  public CompModule module;
  public String modelPath;
  public int rerun;
  public int reuse;

  public ReuseSol(
      List<SingleDepOutput> output4Dep,
      String modelXmlRoot,
      String paramRoot,
      String modelName,
      CompModule module,
      String modelPath) {
    this.output4Dep = output4Dep;
    this.xmlRoot = modelXmlRoot;
    this.paramRoot = paramRoot;
    this.modelName = modelName;
    this.module = module;
    this.modelPath = modelPath;
    rerun = 0;
    reuse = 0;
  }

  public abstract boolean checkReuse(
      CompModule world,
      String cmdName,
      List<String> predFacts,
      Map<Set<String>, Set<String>> type2Sol,
      Set<String> paramSet)
      throws Exception;

  public void RunAgain(
      Module world,
      String modelPath,
      String cmdName,
      Command cmd,
      Map<Set<String>, Set<String>> type2Sol,
      Set<String> paramSet)
      throws Exception {

    TimeoutThread thd = new TimeoutThread(world, cmd, modelPath);
    thd.start();
    thd.join(30 * 1000);
    thd.stop();

    String modelParamPath = paramRoot + SEP + cmdName;
    String modelXmlPath = xmlRoot + SEP + cmdName + ".xml";
    A4Solution solution = thd.sol;

    if (solution != null && solution.satisfiable()) {
      BufferedWriter out = new BufferedWriter(new FileWriter(modelParamPath));
      for (String p : paramSet) {
        out.write(p + "\n");
      }
      out.close();

      solution.writeXML(modelXmlPath);
    }
    thd.interrupt();
  }

  public void execute() throws Exception {
    Map<Set<String>, Set<String>> type2Sol = new HashMap<Set<String>, Set<String>>();

    for (SingleDepOutput sdo : output4Dep) {
      String cmdName = sdo.cmdName;
      List<String> predFacts = sdo.predFacts;
      Set<String> paramSet = sdo.paramSet;
      Command cmd = sdo.cmd;

      if (!predFacts.isEmpty()) {
        if (!checkReuse(module, cmdName, predFacts, type2Sol, paramSet)) {
          rerun++;
          RunAgain(module, modelPath, cmdName, cmd, type2Sol, paramSet);
        } else {
          reuse++;
        }
      } else {
        rerun++;
        RunAgain(module, modelPath, cmdName, cmd, type2Sol, paramSet);
      }
    }
  }

  /**
   * thread for time out
   *
   * @author Wenxi Wang
   * @version 1.0
   */
  public class TimeoutThread extends Thread {
    public A4Solution sol;
    public String modelPath;
    public Module world;
    public Command cmd;

    public TimeoutThread(Module world, Command cmd, String modelPath) {
      this.world = world;
      this.cmd = cmd;
      this.modelPath = modelPath;
    }

    public void run() {
      A4Reporter rep = new A4Reporter();
      A4Options opt = new A4Options();
      opt.originalFilename = modelPath;
      opt.solver = A4Options.SatSolver.SAT4J;
      sol =
          TranslateAlloyToKodkod.execute_commandFromBook(
              rep, world.getAllReachableSigs(), cmd, opt);
    }
  }
}
