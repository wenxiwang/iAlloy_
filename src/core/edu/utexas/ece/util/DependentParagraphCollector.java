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

package edu.utexas.ece.util;

import alloyfl.coverage.visitor.DependencyAnalyzer;
import edu.mit.csail.sdg.parser.CompModule;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;
import java.util.stream.Collectors;
import parser.ast.nodes.ModelUnit;
import parser.ast.nodes.Node;
import parser.ast.nodes.Paragraph;

/**
 * Collect dependency of paragraphs in Alloy model
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public class DependentParagraphCollector {
  public static Collection<Node> collect4open(ModelUnit modelUnit, Paragraph invokedParagraph) {
    DependencyAnalyzer dependencyAnalyzer = new DependencyAnalyzer(modelUnit);

    Set<Node> res = new HashSet<Node>();
    res.addAll(modelUnit.getFactDeclList());
    res.add(invokedParagraph);

    Queue<Paragraph> invokedParagraphs = new LinkedList<>();
    invokedParagraphs.addAll(modelUnit.getFactDeclList());
    invokedParagraphs.add(invokedParagraph);

    while (!invokedParagraphs.isEmpty()) {
      Paragraph toVisit = invokedParagraphs.poll();
      toVisit.accept(dependencyAnalyzer, null);
      dependencyAnalyzer
          .getUsedParagraphs()
          .forEach(
              paragraph -> {
                invokedParagraphs.offer(paragraph);
                res.add(paragraph);
              });
      dependencyAnalyzer.clearUsedParagraphs();
    }
    res.addAll(dependencyAnalyzer.getUsedSigs());
    return res;
  }

  public static Collection<Node> collect(CompModule module, Paragraph invokedParagraph) {
    ModelUnit modelUnit = new ModelUnit(null, module);
    DependencyAnalyzer dependencyAnalyzer = new DependencyAnalyzer(modelUnit);

    Set<Node> res = modelUnit.getOpenDeclList().stream().distinct().collect(Collectors.toSet());
    res.addAll(modelUnit.getFactDeclList());
    res.add(invokedParagraph);

    Queue<Paragraph> invokedParagraphs = new LinkedList<>();
    invokedParagraphs.addAll(modelUnit.getFactDeclList());
    invokedParagraphs.add(invokedParagraph);

    while (!invokedParagraphs.isEmpty()) {
      Paragraph toVisit = invokedParagraphs.poll();
      toVisit.accept(dependencyAnalyzer, null);
      dependencyAnalyzer
          .getUsedParagraphs()
          .forEach(
              paragraph -> {
                invokedParagraphs.offer(paragraph);
                res.add(paragraph);
              });
      dependencyAnalyzer.clearUsedParagraphs();
    }
    res.addAll(dependencyAnalyzer.getUsedSigs());
    return res;
  }
}
