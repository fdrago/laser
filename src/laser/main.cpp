#include "qtquick1applicationviewer.h"
#include "lasermodel.h"
#include <QApplication>
#include <QDeclarativeContext>
#include <QDeclarativeComponent>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
#ifndef QT_DEBUG
    app.setOverrideCursor( QCursor( Qt::BlankCursor ) );
#endif
    LaserModel *laserModel = new LaserModel();

    QtQuick1ApplicationViewer viewer;

    laserModel->setViewer(&viewer);

    viewer.rootContext()->setContextProperty("laserModel", laserModel);

    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QtQuick1ApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/laser/main.qml"));

#ifndef QT_DEBUG
    viewer.showFullScreen();
#else
    viewer.show();
#endif
    return app.exec();
}
