#include "tablesql.h"

TableSQL::TableSQL(QObject *parent) : QObject(parent) {
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("questions.db");

    if (!db.open()) {
        qDebug() << "Ошибка подключения к базе данных:" << db.lastError().text();
    } else {
        qDebug() << "База данных открыта!";
    }
}

TableSQL::~TableSQL() {
    db.close();
}

bool TableSQL::createTable() {
    QSqlQuery query;
    QString createTableQuery =
        "CREATE TABLE IF NOT EXISTS Questions ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "question TEXT NOT NULL, "
        "answer1 TEXT NOT NULL, "
        "answer2 TEXT NOT NULL, "
        "answer3 TEXT NOT NULL, "
        "answer4 TEXT NOT NULL, "
        "answer5 TEXT NOT NULL, "
        "correctAnswer INTEGER NOT NULL"
        ");";

    if (!query.exec(createTableQuery)) {
        qDebug() << "Ошибка создания таблицы:" << query.lastError().text();
        return false;
    }
    return true;
}

bool TableSQL::insertQuestion(const QString &question, const QStringList &answers, int correctAnswerIndex) {
    if (answers.size() != 5) {
        qDebug() << "Ошибка: должно быть ровно 5 ответов!";
        return false;
    }

    QSqlQuery query;
    query.prepare("INSERT INTO Questions (question, answer1, answer2, answer3, answer4, answer5, correctAnswer) "
                  "VALUES (:question, :answer1, :answer2, :answer3, :answer4, :answer5, :correctAnswer)");

    query.bindValue(":question", question);
    query.bindValue(":answer1", answers[0]);
    query.bindValue(":answer2", answers[1]);
    query.bindValue(":answer3", answers[2]);
    query.bindValue(":answer4", answers[3]);
    query.bindValue(":answer5", answers[4]);
    query.bindValue(":correctAnswer", correctAnswerIndex);

    if (!query.exec()) {
        qDebug() << "Ошибка вставки данных:" << query.lastError().text();
        return false;
    }
    return true;
}

QString TableSQL::getFirstQuestion() {
    QSqlQuery query("SELECT question FROM Questions LIMIT 1");
    if (query.next()) {
        return query.value(0).toString();
    }
    return "Вопросов нет!";
}


void TableSQL::loadQuestions(const QString &filePath) {
    qDebug() << "Loading questions from: " << filePath;

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Error opening file!";
        return;
    }

    while (!file.atEnd()) {
        QString line = file.readLine().trimmed();
        qDebug() << "Read line: " << line;
    }

    file.close();
}
