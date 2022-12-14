#define CATCH_CONFIG_MAIN
#include <catch.hpp>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "calculator.h"
#define UNIT_TEST_ENABLED


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterType<Calculator>("Calculator", 1, 0, "Calculator");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    Catch::Session().run(argc,argv);

    return app.exec();
}
