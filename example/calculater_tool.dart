import 'package:mcp_dart/mcp_dart.dart';

class CalculatorTool extends ToolRunner {
  const CalculatorTool({
    super.inputSchema = const InputSchema(
      type: 'object',
      properties: {
        'operation': {
          'type': 'string',
          'enum': ['add', 'subtract', 'multiply', 'divide'],
        },
        'a': {'type': 'number'},
        'b': {'type': 'number'},
      },
      required: ['operation', 'a', 'b'],
    ),
    super.name = 'calculate',
    super.description = 'Perform basic arithmetic operations',
  });

  @override
  Future<CallToolResult> execute(Map<String, dynamic> args) async {
    final operation = args['operation'];
    final a = args['a'];
    final b = args['b'];
    return CallToolResult(
      content: [
        TextContent(
          text: switch (operation) {
            'add' => 'Result: ${a + b}',
            'subtract' => 'Result: ${a - b}',
            'multiply' => 'Result: ${a * b}',
            'divide' => 'Result: ${a / b}',
            _ => throw Exception('Invalid operation'),
          },
        ),
      ],
      isError: false,
    );
  }
}
