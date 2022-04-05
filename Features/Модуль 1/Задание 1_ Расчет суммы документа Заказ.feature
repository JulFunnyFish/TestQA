﻿#language: ru

@tree

Функционал: Расчет итоговой суммы документа Заказ

Как Менеджер по продажам я хочу
в документе Заказ вносить изменения в количество и цену товаров 
чтобы отразить актуальные требования заказчика 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Изменение итоговой суммы документа Заказ
И я закрываю все окна клиентского приложения
* Создание документа и заполнение шапки
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Ввод строки в таблицу Товары
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000017' | 'Bosch1234'    |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я завершаю редактирование строки
* Редактирование количества и цены
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '4000'
	И в таблице "Товары" я завершаю редактирование строки		
* Проверка суммы после заполнения
	Тогда таблица "Товары" содержит строки:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Bosch1234' | '4 000,00' | '10'         | '40 000,00' |
	Тогда элемент формы с именем "ТоварыИтогСумма" стал равен '40 000'
* Редактирование количества
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка суммы после изменения количества
	Тогда таблица "Товары" содержит строки:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Bosch1234' | '4 000,00' | '1'          | '4 000,00' |
	Тогда элемент формы с именем "ТоварыИтогСумма" стал равен '4 000'
* Редактирование цены
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2000'
	И в таблице "Товары" я завершаю редактирование строки
*Проверка суммы после изменения цены
	Тогда таблица "Товары" содержит строки:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Bosch1234' | '2 000,00' | '1'          | '2 000,00' |
	Тогда элемент формы с именем "ТоварыИтогСумма" стал равен '2 000'
*Закрытие формы		
	И Я закрываю окно 'Заказ (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'