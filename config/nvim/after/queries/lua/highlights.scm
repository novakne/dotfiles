(variable_declarator (identifier) @local.variable)

(condition_expression
  (unary_operation (identifier)) @constant)

((identifier) @constant
  (#match? @constant "^[[:upper:]]"))

(function_call
 (function_call (identifier) @constant))

; (return_statement ["return"] @constant)
