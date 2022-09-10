import '../expression_context.dart';
import '../i_expression.dart';

class Subtract implements IExpression {
  final IExpression leftExpression;
  final IExpression rightExpression;

  const Subtract(this.leftExpression, this.rightExpression);

  @override
  int interpret(ExpressionContext context) {
    var left = leftExpression.interpret(context);
    var right = rightExpression.interpret(context);
    var result = left - right;
    context.addSolutionStep('-', left, right, result);

    return result;
  }
}