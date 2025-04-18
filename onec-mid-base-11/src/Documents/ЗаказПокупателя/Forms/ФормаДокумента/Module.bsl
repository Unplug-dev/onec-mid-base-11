
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	// Шевелев, выведение реквизита СогласованнаяСкидка на форму
	// Добавление реквизита       
	СледующийЭлемент = Элементы.Найти("Страницы");
	ТипРеквизита = Новый ОписаниеТипов("Число");
	ДобавляемыеРеквизиты = Новый Массив;
	Реквизит = Новый РеквизитФормы("СогласованнаяСкидка", ТипРеквизита, "", "СогласованнаяСкидка");
	ДобавляемыеРеквизиты.Добавить(Реквизит); 
	
	ИзменитьРеквизиты(ДобавляемыеРеквизиты);
	НовыйЭлемент = Элементы.Вставить("СОгласованнаяСкидка", Тип("ПолеФормы"),,СледующийЭлемент);
	НовыйЭлемент.ПутьКДанным = "Объект.СогласованнаяСкидка";
	НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
	НовыйЭлемент.УстановитьДействие("ПриИзменении", "СогласованнаяСкидкаПриИзменении");
	//
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры


&НаСервере
Процедура ПриЗакрытииНаСервере()
	// Шевелев,обработка параметра для внешней обработки
	ДополнительнаяОбработка = Параметры.ДополнительнаяОбработкаСсылка.ПолучитьОбъект();
	Настройки = Перечисления.СтатусЗаказа;
	ДополнительнаяОбработка.ХранилищеНастроек = Новый ХранилищеЗначения(Настройки);
	ДополнительнаяОбработка.Записать();
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	ПриЗакрытииНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Асинх Процедура СогласованнаяСкидкаПриИзменении(Элемент)
	// Шевелев, событие ПриИзменении для СогласованнаяСкидка, с целью вывода вопроса о пересчетё скидки
	// Добавление команда
	Если Элементы.Услуги.ТекущиеДанные <> Неопределено Или Элементы.Товары.ТекущиеДанные <> Неопределено Тогда
		РежимВопроса = РежимДиалогаВопрос.ДаНет;
		Ответ = Ждать ВопросАсинх("Изменен процент скидки. Пересчитать строку таблицы товаров?", РежимВопроса);  
		Если Ответ = КодВозвратаДиалога.Да  Тогда
				ЦиклПересчетаСуммы();
		Иначе
			Возврат;
		КонецЕсли;
	КонецЕсли; 
	//
КонецПроцедуры


&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	// Шевелев, изменение события Рассчитать сумму, чтобы изменялась сумма с учётом скидки
	// Добавление команда
	КоэффициентСкидки = 1 - (ТекущиеДанные.Скидка + Объект.СогласованнаяСкидка) / 100;
	Если КоэффициентСкидки < 0 Тогда
		Отказ = Истина;
		ТекущиеДанные.Сумма = 0;
		ТекстСообщения = "Сумма скидок для товара %1 превышает 100 процентов";
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = СтрШаблон(ТекстСообщения, ТекущиеДанные.Номенклатура);
		Сообщение.Поле = ТекущиеДанные.Скидка;
		Сообщение.Сообщить(); 
	Иначе
		ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	КонецЕсли;

	//
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура ЦиклПересчетаСуммы()
	
	Для Каждого Строка Из Объект.Товары Цикл   
		
		РассчитатьСуммуСтроки(Строка);
	КонецЦикла;
	
	Для Каждого Строка Из Объект.Услуги Цикл
		
		РассчитатьСуммуСтроки(Строка);
	КонецЦикла;
	РассчитатьСуммуДокумента();

КонецПроцедуры


&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
