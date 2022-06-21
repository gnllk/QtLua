#include <QCoreApplication>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    printf("Lua编译器");
    return a.exec();
}
