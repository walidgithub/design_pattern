import 'package:flutter/material.dart';

import 'expression_context.dart';
import 'expression_helpers.dart';

class ExpressionSection extends StatefulWidget {
  final String postfixExpression;

  const ExpressionSection(
    this.postfixExpression,
  ) : assert(postfixExpression != null);

  @override
  _ExpressionSectionState createState() => _ExpressionSectionState();
}

class _ExpressionSectionState extends State<ExpressionSection> {
  final ExpressionContext _expressionContext = ExpressionContext();
  final List<String> _solutionSteps = List<String>();

  void _solvePrefixExpression() {
    var solutionSteps = List<String>();
    var expression =
        ExpressionHelpers.buildExpressionTree(widget.postfixExpression);
    var result = expression.interpret(_expressionContext);

    solutionSteps
      ..addAll(_expressionContext.getSolutionSteps())
      ..add('Result: $result');

    setState(() {
      _solutionSteps.addAll(solutionSteps);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.postfixExpression,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: LayoutConstants.spaceM),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          firstChild: PlatformButton(
            child: Text('Solve'),
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: _solvePrefixExpression,
          ),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (var solutionStep in _solutionSteps)
                Text(
                  solutionStep,
                  style: Theme.of(context).textTheme.subtitle2,
                )
            ],
          ),
          crossFadeState: _solutionSteps.isEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
        const SizedBox(height: LayoutConstants.spaceXL),
      ],
    );
  }
}
