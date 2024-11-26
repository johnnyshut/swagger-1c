﻿Перем СтруктураОписания;

#Область ПрограммныйИнтерфейс

//
//
Функция Объект(ИмяОбъекта) Экспорт

	Если ПустаяСтрока(ИмяОбъекта) Тогда
		ВызватьИсключение "Объект: имя объекта не может быть пустым";
	КонецЕсли;
	
	Если СтруктураОписания = Неопределено Тогда
		СтруктураОписания = Новый Структура;
	КонецЕсли;
	
	СтруктураОписания.Вставить("ИмяОбъекта", ИмяОбъекта);
	
	ДобавитьПоследнийОбъектВМассивОбъектов();
	
	// Новый текущий объект
	СтруктураОписания.Вставить("ТекущийОбъект",
		Новый Структура("Имя, Свойства", ИмяОбъекта));
	
	// Новый локальный массив свойств
	СтруктураОписания.Вставить("МассивСвойств", Новый Массив);
	
	Возврат ЭтотОбъект;
	
КонецФункции

//
//
Функция Свойство(ИмяСвойства) Экспорт
	
	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ИмяОбъекта") Или
		ПустаяСтрока(СтруктураОписания.ИмяОбъекта) Тогда
		
		ВызватьИсключение "Свойство: нельзя задавать свойство объекта для неопределенного объекта";
	КонецЕсли;
	Если ПустаяСтрока(ИмяСвойства) Тогда
		ВызватьИсключение "Свойство: имя свойства объекта не может быть пустым";
	КонецЕсли;
	
	СтруктураОписания.Вставить("ТекущееСвойство", ИмяСвойства);
	
	МассивСвойств = Новый Массив;
	Если СтруктураОписания.Свойство("МассивСвойств") И ТипЗнч(СтруктураОписания.МассивСвойств) = Тип("Массив") Тогда
		МассивСвойств = СтруктураОписания.МассивСвойств;
	КонецЕсли;
	
	МассивСвойств.Добавить(Новый Структура("ИмяСвойства, Описание, Тип, Nullable,
			|Формат, Схема, Пример, Перечисление",
		ИмяСвойства, , , Ложь));
	СтруктураОписания.Вставить("МассивСвойств", МассивСвойств);
	
	Возврат ЭтотОбъект;
	
КонецФункции

//
//
Функция Описание(СтрокаОписания) Экспорт

	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ТекущееСвойство") Или
		ПустаяСтрока(СтруктураОписания.ТекущееСвойство) Тогда
		
		ВызватьИсключение "Описание: нельзя задавать описание для неопределенного свойства объекта";
	КонецЕсли;
	
	УстановитьПараметрВМассивеСвойств("Описание", СтрокаОписания);
	
	Возврат ЭтотОбъект;

КонецФункции

//
//
Функция ТипЗначения(Тип) Экспорт

	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ТекущееСвойство") Или
		ПустаяСтрока(СтруктураОписания.ТекущееСвойство) Тогда
		
		ВызватьИсключение "ТипЗначения: нельзя задавать тип значения для неопределенного свойства объекта";
	КонецЕсли;
	Если ПустаяСтрока(Тип) Тогда
		ВызватьИсключение "ТипЗначения: тип свойства не может быть пустым";
	КонецЕсли;
	Если Не НРег(Тип) = "number" И Не НРег(Тип) = "integer" И Не НРег(Тип) = "string" И
		Не НРег(Тип) = "boolean" И Не НРег(Тип) = "object" И Не НРег(Тип) = "array" Тогда
		
		ВызватьИсключение "ТипЗначения: тип свойства должен быть одним из следующего списка - number, integer, string, boolean, object или array";
	КонецЕсли;
	
	УстановитьПараметрВМассивеСвойств("Тип", Тип);
		
	Возврат ЭтотОбъект;
	
КонецФункции

//
//
Функция ДопускаетNull() Экспорт
	
	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ТекущееСвойство") Или
		ПустаяСтрока(СтруктураОписания.ТекущееСвойство) Тогда
		
		ВызватьИсключение "ДопускаетNull: нельзя задавать признак допущения null для неопределенного свойства объекта";
	КонецЕсли;
	
	УстановитьПараметрВМассивеСвойств("Nullable", Истина);
	
	Возврат ЭтотОбъект;
	
КонецФункции

//
//
Функция ФорматЗначения(СтрокаФормата) Экспорт
	
	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ТекущееСвойство") Или
		ПустаяСтрока(СтруктураОписания.ТекущееСвойство) Тогда
		
		ВызватьИсключение "Формат: нельзя задавать формат для неопределенного свойства объекта";
	КонецЕсли;
	
	// TODO: контроль в зависимости от типа
	
	УстановитьПараметрВМассивеСвойств("Формат", СтрокаФормата);
	
	Возврат ЭтотОбъект;
	
КонецФункции

//
//
Функция Схема(ТипОбъекта) Экспорт
	
	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ТекущееСвойство") Или
		ПустаяСтрока(СтруктураОписания.ТекущееСвойство) Тогда
		
		ВызватьИсключение "Схема: нельзя задавать схему для неопределенного свойства объекта";
	КонецЕсли;
	
	СвойствоТипЗначения = ПолучитьСвойствоВМассивеСвойств();
	Если Не СвойствоТипЗначения = Неопределено И
		Не СвойствоТипЗначения.Тип = Неопределено И
		Не СвойствоТипЗначения.Тип = "object" И
		Не СвойствоТипЗначения.Тип = "array" Тогда
		
		ВызватьИсключение "Схема: схему можно определять только для свойств с типом object или array";
	КонецЕсли;
	
	УстановитьПараметрВМассивеСвойств("Схема", ТипОбъекта);
		
	Возврат ЭтотОбъект;

КонецФункции

//
//
Функция Пример(Пример) Экспорт

	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ТекущееСвойство") Или
		ПустаяСтрока(СтруктураОписания.ТекущееСвойство) Тогда
		
		ВызватьИсключение "Пример: нельзя задавать пример для неопределенного свойства объекта";
	КонецЕсли;
	
	УстановитьПараметрВМассивеСвойств("Пример", Пример);
	
	Возврат ЭтотОбъект;
	
КонецФункции

//
//
Функция ЗначениеПеречисления(Значение) Экспорт
	
	Если СтруктураОписания = Неопределено Или
		Не СтруктураОписания.Свойство("ТекущееСвойство") Или
		ПустаяСтрока(СтруктураОписания.ТекущееСвойство) Тогда
		
		ВызватьИсключение "ЗначениеПеречисления: нельзя задавать элементы перечисления для неопределенного свойства объекта";
	КонецЕсли;

	СвойствоТипЗначения = ПолучитьСвойствоВМассивеСвойств();
	Если Не СвойствоТипЗначения.Тип = Неопределено И
		Не СвойствоТипЗначения.Тип = "string" И
		Не СвойствоТипЗначения.Тип = "integer" Тогда
		
		ВызватьИсключение "ЗначениеПеречисления: перечисление можно устанавливать только для свойства типов string и integer";
	КонецЕсли;

	Перечислене = Новый Массив;
	Если СвойствоТипЗначения.Свойство("Перечисление") И ТипЗнч(СвойствоТипЗначения.Перечисление) = Тип("Массив") Тогда
		Перечислене = СвойствоТипЗначения.Перечисление;
	КонецЕсли;

	Перечислене.Добавить(Значение);
	УстановитьПараметрВМассивеСвойств("Перечисление", Перечислене);
	
	Возврат ЭтотОбъект;
	
КонецФункции

//
//
Функция Сформировать() Экспорт
	
	ДобавитьПоследнийОбъектВМассивОбъектов();
	
	МассивОписанийОбъектов = Новый Массив;
	Если СтруктураОписания.Свойство("МассивОбъектов") И
		ТипЗнч(СтруктураОписания.МассивОбъектов) = Тип("Массив") Тогда
		
		Для каждого Объект Из СтруктураОписания.МассивОбъектов Цикл
			МассивОписанийОбъектов.Добавить(
				Swag_ФормированиеОписаний.ОписаниеОбъекта(Объект.Имя, "object", Объект.Свойства));
		КонецЦикла;
	КонецЕсли;
	
	Возврат МассивОписанийОбъектов;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура УстановитьПараметрВМассивеСвойств(ИмяПараметра, Значение)
	
	Для каждого Свойство Из СтруктураОписания.МассивСвойств Цикл
		Если Свойство.ИмяСвойства = СтруктураОписания.ТекущееСвойство Тогда
			Свойство[ИмяПараметра] = Значение;
			Возврат;
		КонецЕсли;
	КонецЦикла;
	
	ВызватьИсключение СтрШаблон("УстановитьПараметрВМассивеСвойств: в массиве свойств не найдено свойство с именем ""%1""",
		СтруктураОписания.ТекущееСвойство);
	
КонецПроцедуры

Функция ПолучитьСвойствоВМассивеСвойств()
	
	Для каждого Свойство Из СтруктураОписания.МассивСвойств Цикл
		Если Свойство.ИмяСвойства = СтруктураОписания.ТекущееСвойство Тогда
			Возврат Свойство;
		КонецЕсли;
	КонецЦикла;
	
	ВызватьИсключение СтрШаблон("ПолучитьСвойствоВМассивеСвойств: в массиве свойств не найдено свойство с именем ""%1""",
		СтруктураОписания.ТекущееСвойство);
	
КонецФункции

Процедура ДобавитьПоследнийОбъектВМассивОбъектов()

	Если СтруктураОписания.Свойство("ТекущийОбъект") И
		ТипЗнч(СтруктураОписания.ТекущийОбъект) = Тип("Структура")
		И Не СтруктураОписания.ТекущийОбъект.Количество() = 0 Тогда
		
		ДобавитьСвойстваВОбъект(СтруктураОписания.ТекущийОбъект);
		
		МассивОбъектов = Новый Массив;
		Если СтруктураОписания.Свойство("МассивОбъектов") И
			ТипЗнч(СтруктураОписания.МассивОбъектов) = Тип("Массив") Тогда
			
			МассивОбъектов = СтруктураОписания.МассивОбъектов;
		КонецЕсли;
		
		МассивОбъектов.Добавить(СтруктураОписания.ТекущийОбъект);
		СтруктураОписания.Вставить("МассивОбъектов", МассивОбъектов);
	КонецЕсли;

КонецПроцедуры

Процедура ДобавитьСвойстваВОбъект(ТекущийОбъект)
	
	МассивСвойствОбъекта = Новый Массив;

	Если СтруктураОписания.Свойство("МассивСвойств") И
		ТипЗнч(СтруктураОписания.МассивСвойств) = Тип("Массив") Тогда
		
		Для каждого СвойствоОбъекта Из СтруктураОписания.МассивСвойств Цикл
			
			МассивСвойствОбъекта.Добавить(Swag_ФормированиеОписаний.ОписаниеСвойстваОбъекта(
				СвойствоОбъекта.ИмяСвойства,
				СвойствоОбъекта.Описание,
				СвойствоОбъекта.Тип,
				СвойствоОбъекта.Nullable,
				СвойствоОбъекта.Формат,
				?(СвойствоОбъекта.Тип = "array" Или СвойствоОбъекта.Тип = "object",
					СвойствоОбъекта.Схема, Неопределено),
				СвойствоОбъекта.Пример,
				СвойствоОбъекта.Перечисление));
				
		КонецЦикла;
	
	КонецЕсли;
	
	ТекущийОбъект.Свойства = МассивСвойствОбъекта;
	
КонецПроцедуры

#КонецОбласти
