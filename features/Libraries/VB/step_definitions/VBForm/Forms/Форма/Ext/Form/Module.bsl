﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Служебная функция.
Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	ДобавитьШагВМассивТестов(ВсеТесты,"ЯНажмаюНаКнопкуVanessa_Behavior(Парам01)","ЯНажмаюНаКнопкуVanessa_Behavior","Когда я нажмаю на кнопку Vanessa-Behavior ""Начать запись поведения""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока(Парам01,Парам02)","ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока","Тогда В реквизите Vanessa-Behavior ""СгенерированныйСценарий"" будет содержаться строка ""ываыва""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВерсияПоставкиВанессыТогда(Парам01)","ВерсияПоставкиВанессыТогда","Если версия поставки Ванессы ""standart"" тогда","","","Условие");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда я нажмаю на кнопку Vanessa-Behavior "Начать запись поведения"
//@ЯНажмаюНаКнопкуVanessa_Behavior(Парам01)
Процедура ЯНажмаюНаКнопкуVanessa_Behavior(ИмяКнопки) Экспорт
	Если ИмяКнопки = "Начать запись поведения" Тогда
		Ванесса.НачатьЗаписьДействийПользователя();
	ИначеЕсли ИмяКнопки = "Закончить запись поведения" Тогда
		Ванесса.ЗавершитьЗаписьДействийПользователя();
	ИначеЕсли ИмяКнопки = "Забыть состояние формы TestClient" Тогда
		Ванесса.ЗабытьСостояниеФормыTestClient();
	ИначеЕсли ИмяКнопки = "ПолучитьИзмененияФормыGherkin" Тогда
		Ванесса.ПолучитьИзмененияФормыGherkin();
	ИначеЕсли ИмяКнопки = "Запомнить состояние формы TestClient" Тогда
		Ванесса.ЗапомнитьСостояниеФормыTestClient();
	Иначе	
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не описано действие для кнопки <%1>");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяКнопки);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли; 
КонецПроцедуры

&НаКлиенте
//Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка "ываыва"
//@ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока(Парам01,Парам02)
Процедура ВРеквизитеVanessa_BehaviorБудетСодержатьсяСтрока(Имяреквизита,ОжидаемаяСтрока) Экспорт
	Поз = Найти(Ванесса.Объект[Имяреквизита],ОжидаемаяСтрока);   
	
	Если Поз = 0 Тогда
		Стр1 = СтрЗаменить(Ванесса.Объект[Имяреквизита],"""","'");
		Стр2 = СтрЗаменить(ОжидаемаяСтрока,"""","'");
		Поз = Найти(Стр1,Стр2);   
	КонецЕсли;	 
	
	Если Поз = 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Строка %1 не найдена в реквизите %2");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ОжидаемаяСтрока);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",Имяреквизита);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли; 
КонецПроцедуры

&НаКлиенте
//Если версия поставки Ванессы "standart" тогда
//@ВерсияПоставкиВанессыТогда(Парам01)
Процедура ВерсияПоставкиВанессыТогда(ВерсияПоставки) Экспорт
	Если Ванесса.Объект.ВерсияПоставки = ВерсияПоставки Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
	Иначе	
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;	 
КонецПроцедуры
