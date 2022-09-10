import 'dart:collection';

import 'package:design_pattern/design_pattern/behavioral/interpreter/terminal_expression/number.dart';

import 'i_expression.dart';
import 'nonterminal_expressions/add.dart';
import 'nonterminal_expressions/multiply.dart';
import 'nonterminal_expressions/subtract.dart';

class ExpressionHelpers {
  static final List<String> _operators = ['+', '-', '*'];

  static IExpression buildExpressionTree(String postfixExpression) {
    var expressionStack = ListQueue<IExpression>();

    for (var symbol in postfixExpression.split(' ')) {
      if (_isOperator(symbol)) {
        var rightExpression = expressionStack.removeLast();
        var leftExpression = expressionStack.removeLast();
        var nonterminalExpression =
            _getNonterminalExpression(symbol, leftExpression, rightExpression);

        expressionStack.addLast(nonterminalExpression);
      } else {
        var numberExpression = Number(int.parse(symbol));

        expressionStack.addLast(numberExpression);
      }
    }

    return expressionStack.single;
  }

  static bool _isOperator(String symbol) {
    return _operators.contains(symbol);
  }

  static IExpression _getNonterminalExpression(
    String symbol,
    IExpression leftExpression,
    IExpression rightExpression,
  ) {

    IExpression expression;

    switch (symbol) {
      case '+':
        expression = Add(leftExpression, rightExpression);
        break;
      case '-':
        expression = Subtract(leftExpression, rightExpression);
        break;
      case '*':
        expression = Multiply(leftExpression, rightExpression);
        break;
      default:
        throw Exception('Expression is not defined.');
    }

    return expression;
  }
}
