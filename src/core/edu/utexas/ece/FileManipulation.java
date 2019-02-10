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

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

/**
 * Generate test cases
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public class FileManipulation {
  public static final String SEP = File.separator;

  /** Main method */
  public static void main(String[] args) throws Exception {

    String modelRootPath = "/home/wenxiw/realbugs";
    File[] modelFiles = new File(modelRootPath).listFiles();

    String baseSinglePath = "/home/wenxiw/base_single";
    File[] baseFiles = new File(baseSinglePath).listFiles();

    for (File modelFile : modelFiles) {
      String rawModelName = modelFile.getName();
      String modelName = rawModelName.split(".als")[0];

      for (File base : baseFiles) {
        if (modelName.contains(base.getName())) {
          System.out.println("base.getname: " + base.getName() + " name: " + modelName);
          mkdir(modelRootPath + SEP + modelName + SEP + "v1");

          String srcPath = base.getAbsolutePath() + SEP + "v1" + SEP + base.getName() + ".als";
          File srcFile = new File(srcPath);

          String dstPath = modelRootPath + SEP + modelName + SEP + "v1" + SEP + modelName + ".als";
          File dstFile = new File(dstPath);
          copy(srcFile, dstFile);
        }
      }
    }
  }

  /**
   * Recursively delete the file f
   *
   * @param f: root file
   */
  public static void deleteRecursive(File f) throws FileNotFoundException {
    if (f.isDirectory()) {
      for (File subFile : f.listFiles()) {
        deleteRecursive(subFile);
      }
    }
    if (!f.delete()) {
      throw new FileNotFoundException("Failed to delete file: " + f);
    }
  }

  /**
   * Create a directory when it does not exist
   *
   * @param dirName: directory name
   */
  public static void mkdir(String dirName) {
    File theDir = new File(dirName);
    // If the directory does not exist, create it
    if (!theDir.exists()) {
      try {
        theDir.mkdir();
      } catch (SecurityException se) {
        System.out.println(se);
      }
    }
  }

  /**
   * Copy a file
   *
   * @param srcFile: source file
   * @param dstFile: destinaton file
   */
  public static void copy(File srcFile, File dstFile) throws IOException {
    FileChannel srcChannel = new FileInputStream(srcFile).getChannel();
    FileChannel dstChannel = new FileOutputStream(dstFile).getChannel();
    if (dstChannel != null && srcChannel != null) {
      dstChannel.transferFrom(srcChannel, 0, srcChannel.size());
    }
    if (srcChannel != null) {
      srcChannel.close();
    }
    if (dstChannel != null) {
      dstChannel.close();
    }
  }
}
