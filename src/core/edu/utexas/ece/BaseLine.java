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

package edu.utexas.ece;

import edu.mit.csail.sdg.alloy4.A4Reporter;
import edu.mit.csail.sdg.alloy4.Err;
import edu.mit.csail.sdg.alloy4.ErrorWarning;
import edu.mit.csail.sdg.ast.Command;
import edu.mit.csail.sdg.ast.Module;
import edu.mit.csail.sdg.parser.CompUtil;
import edu.mit.csail.sdg.translator.A4Options;
import edu.mit.csail.sdg.translator.A4Solution;
import edu.mit.csail.sdg.translator.TranslateAlloyToKodkod;
import java.io.File;
import java.util.Arrays;

/**
 * Baseline: normal evolving alloy analysis
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public class BaseLine {

  public static final String SEP = File.separator;

  public static void main(String[] args) throws Err, InterruptedException {
    int cmdNum = 0;
    int sumTime = 0;
    int totalTime = 0;

    String modelRootPath = args[0];
    File modelRoot = new File(modelRootPath);

    String[] elementList = modelRootPath.split(SEP);
    String modelName = elementList[elementList.length - 1];

    A4Reporter rep =
        new A4Reporter() {
          // For example, here we choose to display each "warning" by printing it to System.out
          @Override
          public void warning(ErrorWarning msg) {
            System.out.print("Relevance Warning:\n" + (msg.toString().trim()) + "\n\n");
            System.out.flush();
          }
        };
    File[] modelDirs = modelRoot.listFiles();
    Arrays.sort(modelDirs);
    for (File modelDir : modelDirs) {
      String modelFilePath = modelDir.getAbsolutePath() + SEP + modelName + ".als";

      // Run a4reporter and count time consumption
      long startTime = System.currentTimeMillis();
      Module world = CompUtil.parseEverything_fromFile(rep, null, modelFilePath);
      A4Options options = new A4Options();
      options.solver = A4Options.SatSolver.SAT4J;

      for (Command command : world.getAllCommands()) {

        TimeoutThread hyt = new TimeoutThread(world, command, modelFilePath);
        hyt.start();
        hyt.join(30 * 1000);
        hyt.stop();
        A4Solution ans = hyt.sol;
        if (ans != null && ans.satisfiable()) {
          ans.writeXML("alloy_example_output.xml");
        }
      }
      long stopTime = System.currentTimeMillis();
      long executeTime = stopTime - startTime;

      String[] tmpElementList = modelFilePath.split(SEP);
      String version = tmpElementList[tmpElementList.length - 2];
      cmdNum =
          world.getAllCommands().size(); // get the total number of the commands in the Alloy model
      if (!version.equals("v1")) {
        sumTime += executeTime;
      }
      totalTime += executeTime;

      System.out.println(
          modelName
              + ","
              + version
              + ","
              + cmdNum
              + ","
              + cmdNum
              + ","
              + cmdNum
              + ","
              + 0
              + ","
              + executeTime);
    }

    System.out.println(
        modelName
            + ","
            + "v1_v2"
            + ","
            + cmdNum * 2
            + ","
            + cmdNum * 2
            + ","
            + cmdNum * 2
            + ","
            + 0
            + ","
            + totalTime);
  }
}

/**
 * Thread for A4Reporter
 *
 * @author Wenxi Wang
 * @version 1.0
 */
class TimeoutThread extends Thread {
  public A4Solution sol;
  protected String ModelPath;
  protected Module world;
  protected Command cmd;

  public TimeoutThread(Module world, Command cmd, String ModelPath) {
    this.world = world;
    this.cmd = cmd;
    this.ModelPath = ModelPath;
  }

  public void run() {
    A4Reporter rep = new A4Reporter();
    A4Options opt = new A4Options();
    opt.originalFilename = ModelPath;
    opt.solver = A4Options.SatSolver.SAT4J;
    sol =
        TranslateAlloyToKodkod.execute_commandFromBook(rep, world.getAllReachableSigs(), cmd, opt);
  }
}
