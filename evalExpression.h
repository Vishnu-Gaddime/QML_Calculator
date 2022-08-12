#ifndef EVALEXPRESSION_H
#define EVALEXPRESSION_H

#include <iostream>
#include <string>

int precedence(char op);
char associativity(char op);
bool isoperator(char op);
std::string modify(std::string s);
std::string to_postfix(std::string exp);
double result(double a, double b, std::string o);
double EvaluateExpression(std::string exp);
double percentage(std::string exp);

#endif // EVALEXPRESSION_H
