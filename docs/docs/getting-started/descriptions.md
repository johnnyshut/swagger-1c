---
sidebar_position: 0
tags: [Начало]
---

# Создание описаний для HTTP сервисов

Поиск описаний происходит среди общих модулей. Наименование общего модуля должно быть построено по шаблону: "&lt;Наименование_HTTP_сервиса&gt;Описание".

![image](../../static/img/description.png)

В общем модуле должны быть две экспортные функции. Первая:
```bsl
Функция ПолучитьОбъектыHTTPСервиса() Экспорт

	Объекты = Новый Массив;
	
	...

	Возврат Объекты;

КонецФункции
```
для описания объектов принимаемых и возвращаемых HTTP-сервисами. И вторая:
```bsl
Функция ПолучитьОписаниеHTTPСервиса() Экспорт
	
	Методы = Новый Массив;

	...

	Возврат Методы;

КонецФункции
```
для, соответственно, описания методов HTTP-сервисов.
