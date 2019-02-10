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
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Reuse the previous solution of the same predicate
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public class ReuseSelfSol extends ReuseSol {

  public static final String SEP = File.separator;

  public ReuseSelfSol(
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
    String modelXmlPath = xmlRoot + SEP + cmdName + ".xml";

    File xmlFile = new File(modelXmlPath);
    System.out.println(xmlFile.getAbsolutePath());
    if (xmlFile.exists()) {
      System.out.println("xmlFile exists!!!!!");
      A4Reporter rep = new A4Reporter();

      XMLNode xmlNode = new XMLNode(new File(modelXmlPath));
      String alloySourceFilename = xmlNode.iterator().next().getAttribute("filename");
      System.out.println("alloySourceFilename: " + alloySourceFilename);
      Module deserilWorld = CompUtil.parseEverything_fromFile(rep, null, alloySourceFilename);
      A4Solution deserilAns = A4SolutionReader.read(deserilWorld.getAllReachableSigs(), xmlNode);
      assert deserilAns.satisfiable();

      for (String porF : predFacts) {
        Object evalResult = null;
        try {
          Expr e = CompUtil.parseOneExpression_fromString(deserilWorld, porF);
          System.out.println("e: " + e);
          evalResult = deserilAns.eval(e);
          System.out.println("eval Result: " + evalResult);
        } catch (Exception ex) {
          System.out.println(ex + " false");
          return false;
        }

        System.out.println(evalResult.toString());
        if (evalResult.toString().equals("false")) {
          return false;
        }
      }

      return true;
    }

    return false;
  }
}
