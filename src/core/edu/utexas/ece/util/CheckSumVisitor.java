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

import static parser.etc.Names.COMMA;
import static parser.etc.Names.DOLLAR;
import static parser.etc.Names.NEW_LINE;
import static parser.etc.Names.UNDERSCORE;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import parser.ast.nodes.Assertion;
import parser.ast.nodes.BinaryExpr;
import parser.ast.nodes.BinaryFormula;
import parser.ast.nodes.Body;
import parser.ast.nodes.CallExpr;
import parser.ast.nodes.CallFormula;
import parser.ast.nodes.Check;
import parser.ast.nodes.ConstExpr;
import parser.ast.nodes.ExprOrFormula;
import parser.ast.nodes.Fact;
import parser.ast.nodes.FieldDecl;
import parser.ast.nodes.FieldExpr;
import parser.ast.nodes.Function;
import parser.ast.nodes.ITEExpr;
import parser.ast.nodes.ITEFormula;
import parser.ast.nodes.LetExpr;
import parser.ast.nodes.ListExpr;
import parser.ast.nodes.ListExpr.ListOp;
import parser.ast.nodes.ListFormula;
import parser.ast.nodes.ModelUnit;
import parser.ast.nodes.ModuleDecl;
import parser.ast.nodes.OpenDecl;
import parser.ast.nodes.ParamDecl;
import parser.ast.nodes.Predicate;
import parser.ast.nodes.QtExpr;
import parser.ast.nodes.QtFormula;
import parser.ast.nodes.RelDecl;
import parser.ast.nodes.Run;
import parser.ast.nodes.SigDecl;
import parser.ast.nodes.SigExpr;
import parser.ast.nodes.UnaryExpr;
import parser.ast.nodes.UnaryFormula;
import parser.ast.nodes.VarDecl;
import parser.ast.nodes.VarExpr;
import parser.ast.visitor.*;

/**
 * Check sum visitor for regression command selection
 *
 * @author Wenxi Wang
 * @version 1.0
 */
public class CheckSumVisitor implements GenericVisitor<String, Object> {

  protected boolean inSigDecl;
  protected boolean inSigFact;
  protected Formatting formatting;
  protected Map<String, String> nodeStringMap;
  protected Map<String, String> predsFacts;
  protected String checkCmdName;
  protected Set<String> cmdParamSet;

  public CheckSumVisitor(String commandName) {
    this.inSigDecl = false;
    this.inSigFact = false;
    this.formatting = new Formatting(true);
    this.nodeStringMap = new LinkedHashMap<>();
    this.predsFacts = new LinkedHashMap<>();
    this.checkCmdName = commandName;
    this.cmdParamSet = new HashSet<String>();
  }

  protected String putInMap(String n, String res) {
    nodeStringMap.put(n, res);
    return res;
  }

  public Map<String, String> getNodeStringMap() {
    return nodeStringMap;
  }

  protected void addPredsFacts(String n, String res) {
    predsFacts.put(n, res);
  }

  public Map<String, String> getPredsFactsList() {
    return predsFacts;
  }

  public Set<String> getCmdParamSet() {
    return cmdParamSet;
  }

  @Override
  public String visit(ModelUnit n, Object arg) {
    String sigDecls =
        String.join(
            NEW_LINE,
            n.getSigDeclList().stream()
                .map(signature -> signature.accept(this, arg))
                .collect(Collectors.toList()));
    String predDecls =
        String.join(
            NEW_LINE,
            n.getPredDeclList().stream()
                .map(predicate -> predicate.accept(this, arg))
                .collect(Collectors.toList()));
    String funDecls =
        String.join(
            NEW_LINE,
            n.getFunDeclList().stream()
                .map(function -> function.accept(this, arg))
                .collect(Collectors.toList()));
    String factDecls =
        String.join(
            NEW_LINE,
            n.getFactDeclList().stream()
                .map(fact -> fact.accept(this, arg))
                .collect(Collectors.toList()));
    String assertDecls =
        String.join(
            NEW_LINE,
            n.getAssertDeclList().stream()
                .map(assertion -> assertion.accept(this, arg))
                .collect(Collectors.toList()));
    String runCmds =
        String.join(
            NEW_LINE,
            n.getRunCmdList().stream()
                .map(run -> run.accept(this, arg))
                .collect(Collectors.toList()));
    String checkCmds =
        String.join(
            NEW_LINE,
            n.getCheckCmdList().stream()
                .map(check -> check.accept(this, arg))
                .collect(Collectors.toList()));
    return String.join(
        NEW_LINE,
        Arrays.<CharSequence>asList(
            sigDecls, predDecls, funDecls, factDecls, assertDecls, runCmds, checkCmds));
  }

  @Override
  public String visit(ModuleDecl n, Object arg) {
    return putInMap(
        "module:" + n.getModelName(),
        String.join(" ", Arrays.<CharSequence>asList("module", n.getModelName())));
  }

  @Override
  public String visit(OpenDecl n, Object arg) {
    ModelUnit modelUnit = new ModelUnit(null, n.getModule());
    return visit(modelUnit, arg);
  }

  @Override
  public String visit(SigDecl n, Object arg) {
    inSigDecl = true;
    String sigDeclAsString =
        (n.isAbstract() ? "abstract " : "")
            + n.getMult()
            + "sig "
            + n.getName()
            + " "
            + (n.isTopLevel()
                ? ""
                : (n.isSubsig() ? "extends" : "in") + " " + n.getParentName() + " ")
            + "{"
            + (n.getFieldList().size() > 0
                ? NEW_LINE
                    + String.join(
                        COMMA + NEW_LINE,
                        n.getFieldList().stream()
                            .map(field -> field.accept(this, arg))
                            .collect(Collectors.toList()))
                    + NEW_LINE
                : "")
            + "}";
    inSigDecl = false;
    inSigFact = true;
    sigDeclAsString +=
        (n.hasSigFact() ? "{" + NEW_LINE + n.getSigFact().accept(this, arg) + NEW_LINE + "}" : "");
    inSigFact = false;
    return putInMap("sig:" + n.getName(), sigDeclAsString);
  }

  @Override
  public String visit(FieldDecl n, Object arg) {
    return visitRelDecl(n, arg);
  }

  @Override
  public String visit(ParamDecl n, Object arg) {
    return visitRelDecl(n, arg);
  }

  @Override
  public String visit(VarDecl n, Object arg) {
    return visitRelDecl(n, arg);
  }

  private String visitRelDecl(RelDecl n, Object arg) {
    return (n.isDisjoint() ? "disj " : "")
        + String.join(
            COMMA,
            n.getVariables().stream()
                .map(variable -> variable.accept(this, arg))
                .collect(Collectors.toList()))
        + ": "
        + n.getExpr().accept(this, arg);
  }

  @Override
  public String visit(ExprOrFormula n, Object arg) {
    return n.accept(this, arg);
  }

  @Override
  public String visit(SigExpr n, Object arg) {
    return n.getName();
  }

  @Override
  public String visit(FieldExpr n, Object arg) {
    String name = n.getName();
    if (inSigFact) {
      name = "@" + name;
    }
    return name;
  }

  @Override
  public String visit(VarExpr n, Object arg) {
    return n.getName();
  }

  @Override
  public String visit(UnaryExpr n, Object arg) {
    String subAsString = n.getSub().accept(this, arg);
    if (n.getOp() == UnaryExpr.UnaryOp.NOOP) {
      return subAsString;
    }
    return "(" + n.getOp() + subAsString + ")";
  }

  @Override
  public String visit(UnaryFormula n, Object arg) {
    return "(" + n.getOp() + n.getSub().accept(this, arg) + ")";
  }

  @Override
  public String visit(BinaryExpr n, Object arg) {
    if (inSigDecl) {
      if (n.getLeft() instanceof VarExpr) {
        String value = ((VarExpr) n.getLeft()).getName();
        if (value.equals("this")) {
          return n.getRight().accept(this, arg);
        }
      }
    }

    return "(" + n.getLeft().accept(this, arg) + n.getOp() + n.getRight().accept(this, arg) + ")";
  }

  @Override
  public String visit(BinaryFormula n, Object arg) {
    return "(" + n.getLeft().accept(this, arg) + n.getOp() + n.getRight().accept(this, arg) + ")";
  }

  @Override
  public String visit(ListExpr n, Object arg) {
    if (n.getOp() == ListOp.TOTALORDER) {

      return n.getOp().getLabel()
          + "["
          + String.join(
              COMMA,
              n.getArguments().stream()
                  .map(expr -> expr.accept(this, arg))
                  .collect(Collectors.toList()))
          + "]";
    }
    return "("
        + String.join(
            n.getOp().toString(),
            n.getArguments().stream()
                .map(expr -> expr.accept(this, arg))
                .collect(Collectors.toList()))
        + ")";
  }

  @Override
  public String visit(ListFormula n, Object arg) {
    boolean flattenList = false;
    if (n.getParent() instanceof ListFormula) {
      ListFormula parent = (ListFormula) n.getParent();
      if (parent.getOp() == n.getOp()) {
        flattenList = true;
      }
    }
    String innerString =
        String.join(
            n.getOp().toString(),
            n.getArguments().stream()
                .map(expr -> expr.accept(this, arg))
                .collect(Collectors.toList()));
    if (flattenList) {
      return innerString;
    }
    return "(" + innerString + ")";
  }

  @Override
  public String visit(CallExpr n, Object arg) {

    return "("
        + n.getName()
        + "["
        + String.join(
            COMMA,
            n.getArguments().stream()
                .map(argument -> argument.accept(this, arg))
                .collect(Collectors.toList()))
        + "]"
        + ")";
  }

  @Override
  public String visit(CallFormula n, Object arg) {

    return "("
        + n.getName()
        + "["
        + String.join(
            COMMA,
            n.getArguments().stream()
                .map(argument -> argument.accept(this, arg))
                .collect(Collectors.toList()))
        + "]"
        + ")";
  }

  @Override
  public String visit(QtExpr n, Object arg) {
    String qtExpr =
        n.getOp()
            + String.join(
                COMMA,
                n.getVarDecls().stream()
                    .map(varDecl -> varDecl.accept(this, arg))
                    .collect(Collectors.toList()))
            + " "
            + n.getBody().accept(this, arg);

    if (n.getOp() == QtExpr.Quantifier.COMPREHENSION) {
      qtExpr = "{ " + qtExpr + " }";
    }

    return "(" + qtExpr + ")";
  }

  @Override
  public String visit(QtFormula n, Object arg) {
    String qtExpr =
        n.getOp()
            + String.join(
                COMMA,
                n.getVarDecls().stream()
                    .map(varDecl -> varDecl.accept(this, arg))
                    .collect(Collectors.toList()))
            + " "
            + n.getBody().accept(this, arg);

    return "(" + qtExpr + ")";
  }

  @Override
  public String visit(ITEExpr n, Object arg) {

    return "("
        + n.getCondition().accept(this, arg)
        + " => "
        + n.getThenClause().accept(this, arg)
        + " else "
        + n.getElseClause().accept(this, arg)
        + ")";
  }

  @Override
  public String visit(ITEFormula n, Object arg) {

    return "("
        + n.getCondition().accept(this, arg)
        + " => "
        + n.getThenClause().accept(this, arg)
        + " else "
        + n.getElseClause().accept(this, arg)
        + ")";
  }

  @Override
  public String visit(LetExpr n, Object arg) {

    return "(let "
        + n.getVar().accept(this, arg)
        + " = "
        + n.getBound().accept(this, arg)
        + " "
        + n.getBody().accept(this, arg)
        + ")";
  }

  @Override
  public String visit(ConstExpr n, Object arg) {
    return n.getValue();
  }

  @Override
  public String visit(Body n, Object arg) {
    String aux = formatting.isUsingNewLine() ? NEW_LINE : "";
    return "{" + aux + n.getBodyExpr().accept(this, arg) + aux + "}";
  }

  @Override
  public String visit(Predicate n, Object arg) {
    List<ParamDecl> paramDeclList = n.getParamList();
    if (!paramDeclList.isEmpty()) {
      ParamDecl paramDecl = paramDeclList.get(0);
      if (paramDecl.getNames().size() == 1 && paramDecl.getNames().get(0).equals("this")) {

        return putInMap(
            "pred:" + n.getName(),
            "pred "
                + paramDecl.getExpr().accept(this, arg)
                + "."
                + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE)
                + "["
                + String.join(
                    COMMA,
                    paramDeclList.subList(1, paramDeclList.size()).stream()
                        .map(parameter -> parameter.accept(this, arg))
                        .collect(Collectors.toList()))
                + "] "
                + n.getBody().accept(this, arg));
      }
    }

    return putInMap(
        "pred:" + n.getName(),
        "pred "
            + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE)
            + "["
            + String.join(
                COMMA,
                n.getParamList().stream()
                    .map(parameter -> parameter.accept(this, arg))
                    .collect(Collectors.toList()))
            + "] "
            + n.getBody().accept(this, arg));
  }

  @Override
  public String visit(Function n, Object arg) {
    List<ParamDecl> paramDeclList = n.getParamList();
    if (!paramDeclList.isEmpty()) {
      ParamDecl paramDecl = paramDeclList.get(0);
      if (paramDecl.getNames().size() == 1 && paramDecl.getNames().get(0).equals("this")) {
        return putInMap(
            "fun:" + n.getName(),
            "fun "
                + paramDecl.getExpr().accept(this, arg)
                + "."
                + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE)
                + "["
                + String.join(
                    COMMA,
                    paramDeclList.subList(1, paramDeclList.size()).stream()
                        .map(parameter -> parameter.accept(this, arg))
                        .collect(Collectors.toList()))
                + "] : "
                + n.getReturnType().accept(this, arg)
                + " "
                + n.getBody().accept(this, arg));
      }
    }
    return putInMap(
        "fun:" + n.getName(),
        "fun "
            + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE)
            + "["
            + String.join(
                COMMA,
                n.getParamList().stream()
                    .map(parameter -> parameter.accept(this, arg))
                    .collect(Collectors.toList()))
            + "] : "
            + n.getReturnType().accept(this, arg)
            + " "
            + n.getBody().accept(this, arg));
  }

  @Override
  public String visit(Fact n, Object arg) {

    addPredsFacts("fact: " + n.getName(), n.getBody().accept(this, arg));

    return putInMap(
        "fact:" + n.getName(),
        "fact "
            + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE)
            + " "
            + n.getBody().accept(this, arg));
  }

  @Override
  public String visit(Assertion n, Object arg) {
    if (n.getName().equals(checkCmdName))
      addPredsFacts("assert: " + n.getName(), n.getBody().accept(this, arg));

    return putInMap(
        "assert:" + n.getName(),
        "assert "
            + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE)
            + " "
            + n.getBody().accept(this, arg));
  }

  @Override
  public String visit(Run n, Object arg) {
    return putInMap(
        "run:" + n.getName(),
        "run " + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE) + n.getScopeAsString());
  }

  @Override
  public String visit(Check n, Object arg) {
    return putInMap(
        "check:" + n.getName(),
        "check " + n.getName().replaceAll("\\" + DOLLAR, UNDERSCORE) + n.getScopeAsString());
  }
}
