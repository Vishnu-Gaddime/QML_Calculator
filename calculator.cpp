#include "calculator.h"
#include "evalExpression.h"
#include <sstream>
#include <iomanip>

Calculator::Calculator(QObject *parent)
    : QObject{parent}
{

}

QString Calculator::result(QString expression)
{
    expression.remove("=");
    std::string stackString = expression.toStdString();
    if (expression != "")
    {
        std::ostringstream oss;
        oss << std::setprecision(8) << std::noshowpoint << EvaluateExpression(stackString);
        std::string str = oss.str();

        std::cout << str << std::endl;
        return QString::fromStdString(str);
    }
    else {
        return QString::fromStdString("");
    }
}
