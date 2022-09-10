import '../expression_context.dart';
import '../i_expression.dart';
import '../i_expression.dart';

class Number implements IExpression {
  final int number;

  const Number(this.number);

  @override
  int interpret(ExpressionContext context) {
    return number;
  }
}