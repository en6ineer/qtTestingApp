#ifndef TABLESQL_H
#define TABLESQL_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QVariant>
#include <QString>
#include <QStringList>
#include <QDebug>



class TableSQL : public QObject {
    Q_OBJECT
public:
    explicit TableSQL(QObject *parent = nullptr); // Конструктор
    ~TableSQL(); // Деструктор

    Q_INVOKABLE bool createTable();
    Q_INVOKABLE bool insertQuestion(const QString &question, const QStringList &answers, int correctAnswerIndex);
    Q_INVOKABLE QString getFirstQuestion(); // Функция для теста

private:
    QSqlDatabase db;
};

#endif // TABLESQL_H


// class TableSQL
// {
// public:
//     TableSQL();  // Конструктор, устанавливает соединение с БД
//     ~TableSQL(); // Деструктор, закрывает соединение

//     bool createTable(); // Создает таблицу, если её нет
//     bool insertQuestion(const QString& question, const QStringList& answers, int correctAnswerIndex);
//     QSqlQuery getQuestions(); // Получение всех вопросов

// private:
//     QSqlDatabase db;
// };

// #endif // TABLESQL_H
