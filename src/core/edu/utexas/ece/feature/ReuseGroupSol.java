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
import edu.mit.csail.sdg.alloy4.XMLNode;
import edu.mit.csail.sdg.ast.Expr;
import edu.mit.csail.sdg.ast.Module;
import edu.mit.csail.sdg.parser.CompModule;
import edu.mit.csail.sdg.parser.CompUtil;
import edu.mit.csail.sdg.translator.A4Solution;
import edu.mit.csail.sdg.translator.A4SolutionReader;
import edu.utexas.ece.feature.GetDepInCmd.SingleDepOutput;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Reuse the previous solution across the predicates within the same group based on the arguments
 * partial order
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public class ReuseGroupSol extends ReuseSol {

  public ReuseGroupSol(
      List<SingleDepOutput> output4Dep,
      String xmlRoot,
      String paramRoot,
      String modelName,
      CompModule module,
      String modelPath) {
    super(output4Dep, xmlRoot, paramRoot, modelName, module, modelPath);
  }

  public boolean checkReuse(
      CompModule world,
      String cmdName,
      List<String> predFacts,
      Map<Set<String>, Set<String>> type2Sol,
      Set<String> paramSet)
      throws Exception {
    File folder = new File(paramRoot);
    File[] listOfFiles = folder.listFiles();

    Set<String> CandFileNames = new HashSet<String>();
    for (int i = 0; i < listOfFiles.length; i++) {
      if (listOfFiles[i].isFile()) {
        String ParamFileName = listOfFiles[i].getName();
        Set<String> FileParamSet = readFromFile(listOfFiles[i].getAbsolutePath());
        if (FileParamSet.containsAll(paramSet)) {
          CandFileNames.add(ParamFileName);
        }
      }
    }

    for (String cmdname : CandFileNames) {
      String modelXmlPath = xmlRoot + File.separator + cmdname + ".xml";
      if (checkReuse4SingleXml(modelXmlPath, predFacts)) {
        return true;
      }
    }
    return false;
  }

  public boolean checkReuse4SingleXml(String modelXmlPath, List<String> predFacts)
      throws IOException {
    File xmlFile = new File(modelXmlPath);
    if (xmlFile.exists()) {
      A4Reporter rep = new A4Reporter();

      XMLNode xmlNode = new XMLNode(new File(modelXmlPath));
      String alloySourceFilename = xmlNode.iterator().next().getAttribute("filename");

      Module deserilWorld = CompUtil.parseEverything_fromFile(rep, null, alloySourceFilename);
      A4Solution deserilAns = A4SolutionReader.read(deserilWorld.getAllReachableSigs(), xmlNode);
      assert deserilAns.satisfiable();

      for (String porF : predFacts) {
        Object evalResult = null;
        try {
          Expr e = CompUtil.parseOneExpression_fromString(deserilWorld, porF);
          evalResult = deserilAns.eval(e);
        } catch (Exception ex) {
          return false;
        }
        if (evalResult.toString().equals("false")) return false;
      }
      return true;
    }
    return false;
  }

  public Set<String> readFromFile(String fileName) throws IOException {
    Set<String> paramSet = new HashSet<String>();
    BufferedReader br = new BufferedReader(new FileReader(fileName));
    try {

      String line = br.readLine();

      while (line != null) {
        paramSet.add(line);
        line = br.readLine();
      }

    } finally {
      br.close();
    }
    return paramSet;
  }
}
