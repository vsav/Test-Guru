# README

Учебный проект Тест гуру онлайн-школы Thinknetica

* Ruby - 2.6.3
* Rails - 6.0

Приложение позволяет проходить тесты.

* Тесты отличаются по сложности и имеют ограничение по времени
* Тест считается пройденным, если процент правильных ответов 85 и выше
* Пользователь может создать gist для любого вопроса теста
* За успешное прохождение тестов пользователь получает различные награды
* После прохождения теста пользователю отправляется письмо с результатами

В проекте Test-Guru используются следующие сущности:

* Test - для самих тестов
* Question - для вопросов теста
* Answer - для ответов
* User - для администраторов и пользователей, проходящих тесты
* Result - для результатов тестов
* Badge - для наград
