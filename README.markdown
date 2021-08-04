# RetailCRM API

API wrapper для RetailCRM API v5


# Оглавление
0. [Установка](#install)
    1. [Использование Rails](#using_rails)
    2. [Использование Ruby](#using_ruby)
    3. [Debug Logging](#debug_logging)
    4. [Custom logger](#custom_logger)
1. [Расходы](#costs)
    1. [Получение списка расходов, удовлетворяющих заданному фильтру](#get--api-v5-costs)
    2. [Создание расхода](#post--api-v5-costs-create)
    3. [Пакетное удаление расходов](#post--api-v5-costs-delete)
    4. [Пакетная загрузка расходов](#post--api-v5-costs-upload)
    5. [Получение информации о расходе](#get--api-v5-costs-id)
    6. [Редактирование расхода](#post--api-v5-costs-id-edit)
    7. [Удаление расхода](#custom-fields)
2. [Пользовательские поля](#custom-fields)
    1. [Получение списка пользовательских полей, удовлетворяющих заданному фильтру](#get--api-v5-custom-fields)
    2. [Получение списка справочников, удовлетворяющих заданному фильтру](#get--api-v5-custom-fields-dictionaries)
    3. [Создание справочника](#post--api-v5-custom-fields-dictionaries-create)
    4. [Получение информации о справочнике](#get--api-v5-custom-fields-dictionaries-code)
    5. [Редактирование справочика](#post--api-v5-custom-fields-dictionaries-code-edit)
    6. [Создание пользовательского поля](#post--api-v5-custom-fields-entity-create)
    7. [Получение информации о пользовательском поле](#get--api-v5-custom-fields-entity-code)
    8. [Редактирование пользовательского поля](#post--api-v5-custom-fields-entity-code-edit)
3. [Клиенты](#customers)
    1. [Получение списка клиентов, удовлетворяющих заданному фильтру](#get--api-v5-customers)
    2. [Объединение клиентов](#post--api-v5-customers-combine)
    3. [Создание клиента](#post--api-v5-customers-create)
    4. [Массовая запись внешних ID клиентов](#post--api-v5-customers-fix-external-ids)
    5. [Получение истории изменения клиентов](#get--api-v5-customers-history)
    6. [Получение заметок](#get--api-v5-customers-notes)
    7. [Создание заметки](#post--api-v5-customers-notes-create)
    8. [Удаление заметки](#post--api-v5-customers-notes-id-delete)
    9. [Пакетная загрузка клиентов](#post--api-v5-customers-upload)
    10. [Получение информации о клиенте](#get--api-v5-customers-externalId")
    11. [Редактирование клиента](#post--api-v5-customers-externalId-edit)
4. [Корпоративные клиенты](#customers-corporate)
    1. [Получение списка корпоративных клиентов, удовлетворяющих заданному фильтру](#get--api-v5-customers-corporate)
    2. [Объединение корпоративных клиентов](#post--api-v5-customers-corporate-combine)
    3. [Создание корпоративного клиента](#post--api-v5-customers-corporate-create)
    4. [Массовая запись внешних ID корпоративных клиентов](#post--api-v5-customers-corporate-fix-external-ids)
    5. [Получение истории изменения корпоративных клиентов](#get--api-v5-customers-corporate-history)
    6. [Получение заметок](#get--api-v5-customers-corporate-notes)
    7. [Создание заметки](#post--api-v5-customers-corporate-notes-create)
    8. [Удаление заметки](post--api-v5-customers-corporate-notes-id-delete)
    9. [Пакетная загрузка корпоративных клиентов](#post--api-v5-customers-corporate-upload)
    10. [Получение информации о корпоративном клиенте](#get--api-v5-customers-corporate-externalId)
    11. [Список адресов корпоративного клиента](#get--api-v5-customers-corporate-externalId-addresses)
    12. [Создание адреса для корпоративного клиента](#post--api-v5-customers-corporate-externalId-addresses-create)
    13. [Редактирование адреса корпоративного клиента](#post--api-v5-customers-corporate-externalId-addresses-entityExternalId-edit)
    14. [Список компаний корпоративного клиента](#get--api-v5-customers-corporate-externalId-companies)
    15. [Создание компании для корпоративного клиента](#post--api-v5-customers-corporate-externalId-companies-create)
    16. [Редактирование компании корпоративного клиента](#post--api-v5-customers-corporate-externalId-companies-entityExternalId-edit)
    17. [Список контактных лиц корпоративного клиента](#get--api-v5-customers-corporate-externalId-contacts)
    18. [Создание связи корпоративного клиента с контактным лицом](#post--api-v5-customers-corporate-externalId-contacts-create)
    19. [Редактирование связи корпоративного клиента с контактным лицом](#post--api-v5-customers-corporate-externalId-contacts-entityExternalId-edit)
    20. [Редактирование корпоративного клиента](#post--api-v5-customers-corporate-externalId-edit)
5. [Доставки](#delivery)
    1. [Расчёт стоимости доставки](#post--api-v5-delivery-calculate)
    2. [Обновление статусов доставки](#post--api-v5-delivery-generic-subcode-tracking)
    3. [Получение списка отгрузок в службы доставки](#get--api-v5-delivery-shipments)
    4. [Создание отгрузки](#post--api-v5-delivery-shipments-create)
    5. [Получение информации об отгрузке](#get--api-v5-delivery-shipments-id)
    6. [Редактироване отгрузки](#post--api-v5-delivery-shipments-id-edit)
    7. [Запрос на получение данных для автокомплит поля](#callback_get--integrationModule_integrations__delivery__actions__autocomplete_)
    8. [Расчет стоимости доставки](#callback_post--integrationModule_integrations__delivery__actions__calculate_)
    9. [Удаление заявки на доставку](#callback_post--integrationModule_integrations__delivery__actions__delete_)
    10. [Получение данных доставки](#callback_get--integrationModule_integrations__delivery__actions__get_)
    11. [Печатные формы службы доставки](#callback_post--integrationModule_integrations__delivery__actions__print_)
    12. [Создание и редактирование доставки](#callback_post--integrationModule_integrations__delivery__actions__save_)
    13. [Удаление заявки на отгрузку](#callback_post--integrationModule_integrations__delivery__actions__shipmentDelete_)
    14. [Список терминалов приема посылок](#callback_get--integrationModule_integrations__delivery__actions__shipmentPointList_)
    15. [Создание и редактирование отгрузки](#callback_post--integrationModule_integrations__delivery__actions__shipmentSave_)
    16. [Список тарифов](#callback_get--integrationModule_integrations__delivery__actions__tariffList_)
6. [Файлы](#files)
    1. [Получение списка файлов, удовлетворяющих заданному фильтру](#get--api-v5-files)
    2. [Загрузка файла на сервер](#post--api-v5-files-upload)
    3. [Получение информации о файле](#get--api-v5-files-id)
    4. [Удаление файла](#post--api-v5-files-id-delet)
    5. [Скачивание файла](#get--api-v5-files-id-download)
    6. [Редактирование файла](#post--api-v5-files-id-edit)
7. [Интеграция](#integration)
    1. [Получение интеграционного модуля](#get--api-v5-integration-modules-code)
    2. [Создание/редактирование интеграционного модуля](#post--api-v5-integration-modules-code-edit)
    3. [Уведомление об изменении статуса активности или заморозки модуля](#callback_post--integrationModule_actions__activity_)
8. [Лояльность](#loyalty)
    1. [Добавление клиента в программу лояльности](#post--api-v5-loyalty-account-create)
    2. [Получение информации об участии в программе лояльности](#get--api-v5-loyalty-account-id)
    3. [Активация участия в программе лояльности](#post--api-v5-loyalty-account-id-activate)
    4. [Начисление бонусов участию в программе лояльности](#post--api-v5-loyalty-account-id-bonus-credit)
    5. [История бонусного счета](#get--api-v5-loyalty-account-id-bonus-operations)
    6. [Редактирование участия в программе лояльности](#post--api-v5-loyalty-account-id-edit)
    7. [Список участий в программе лояльности](#get--api-v5-loyalty-accounts)
    8. [Расчёт максимальной скидки](#post--api-v5-loyalty-calculate)
    9. [Список программ лояльности](#get--api-v5-loyalty-loyalties)
    10. [Получение информации о программе лояльности](#get--api-v5-loyalty-loyalties-id)
9. [Заказы](#orders)
    1. [Получение списка заказов, удовлетворяющих заданному фильтру](#get--api-v5-orders)
    2. [Объединение заказов](#post--api-v5-orders-combine)
    3. [Создание заказа](#post--api-v5-orders-create)
    4. [Массовая запись внешних ID заказов](#post--api-v5-orders-fix-external-ids)
    5. [Получение истории изменений заказов](#get--api-v5-orders-history)
    6. [Создание связи между заказами](#post--api-v5-orders-links-create)
    7. [Применение бонусов по программе лояльности](#post--api-v5-orders-loyalty-apply)
    8. [Отмена бонусных операций по программе лояльности](#post--api-v5-orders-loyalty-cancel-bonus-operations)
    9. [Добавление платежа](#post--api-v5-orders-payments-create)
    10. [Удаление платежа](#post--api-v5-orders-payments-id-delete)
    11. [Редактирование платежа](#post--api-v5-orders-payments-id-edit)
    12. [Получение списка статусов заказов](#get--api-v5-orders-statuses)
    13. [Пакетная загрузка заказов](#post--api-v5-orders-upload)
    14. [Получение информации о заказе](#get--api-v5-orders-externalId)
    15. [Редактирование заказа](#post--api-v5-orders-externalId-edit)
10. [Комплектация заказов](#orders_packs)
    1. [Получение списка паков, удовлетворяющих заданному фильтру](#get--api-v5-orders-packs)
    2. [Создание пака](#post--api-v5-orders-packs-create)
    3. [Получение истории комплектации заказа](#get--api-v5-orders-packs-history)
    4. [Получение информации о паке](#get--api-v5-orders-packs-id)
    5. [Удаление пака](#post--api-v5-orders-packs-id-delete)
    6. [Редактирование пака](#post--api-v5-orders-packs-id-edit)
11. [Платежи](#payment)
    1. [Проверка инвойса](#post--api-v5-payment-check)
    2. [Создание инвойса](#post--api-v5-payment-create-invoice)
    3. [Изменение инвойса](#post--api-v5-payment-update-invoice)
    4. [Подтверждение оплаты](#callback_post--integrationModule_integrations__payment__actions__approve_)
    5. [Отмена оплаты](#callback_post--integrationModule_integrations__payment__actions__cancel_)
    6. [Создание оплаты](#callback_post--integrationModule_integrations__payment__actions__create_)
    7. [Возврат](#callback_post--integrationModule_integrations__payment__actions__refund_)
12. [Рекомендации](#recommendation)
    1. [Запрос рекомендуемых товаров](#callback_get--integrationModule_integrations__recommendation__actions__recommendation_)
13. [Справочники](#reference)
    1. [Получение списка групп расходов](#get--api-v5-reference-cost-groups)
    2. [Редактирование группы расходов](#post--api-v5-reference-cost-groups-code-edit)
    3. [Получение списка статей расходов](#get--api-v5-reference-cost-items)
    4. [Редактирование статьи расходов](#post--api-v5-reference-cost-items-code-edit)
    5. [Получение списка кодов доступных стран](#get--api-v5-reference-countries)
    6. [Получение списка курьеров](#get--api-v5-reference-couriers)
    7. [Создание курьера](#post--api-v5-reference-couriers-create)
    8. [Редактирование курьера](#post--api-v5-reference-couriers-id-edit)
    9. [Получение списка служб доставки](#get--api-v5-reference-delivery-services)
    10. [Создание/редактирование службы доставки](#post--api-v5-reference-delivery-services-code-edit)
    11. [Получение списка типов доставки](#get--api-v5-reference-delivery-types)
    12. [Создание/редактирование типа доставки](#post--api-v5-reference-delivery-types-code-edit)
    13. [Получение списка юридических лиц](#get--api-v5-reference-legal-entities)
    14. [Создание/редактирование юридического лица](#post--api-v5-reference-legal-entities-code-edit)
    15. [Получение списка MessageGateway каналов](#get--api-v5-reference-mg-channels)
    16. [Получение списка способов оформления заказов](#get--api-v5-reference-order-methods)
    17. [Создание/редактирование способа оформления заказа](#post--api-v5-reference-order-methods-code-edit)
    18. [Получение списка типов заказов](#get--api-v5-reference-order-types)
    19. [Создание/редактирование типа заказа](#post--api-v5-reference-order-types-code-edit)
    20. [Получение списка статусов оплаты](#get--api-v5-reference-payment-statuses)
    21. [Создание/редактирование статусов оплаты](#post--api-v5-reference-payment-statuses-code-edit)
    22. [Получение списка типов оплаты](#get--api-v5-reference-payment-types)
    23. [Создание/редактирование типа оплаты](#post--api-v5-reference-payment-types-code-edit)
    24. [Получение списка типов цен](#get--api-v5-reference-price-types)
    25. [Создание/редактирование типа цены](#post--api-v5-reference-price-types-code-edit)
    26. [Получение списка статусов товаров в заказе](#get--api-v5-reference-product-statuses)
    27. [Создание/редактирование статуса товара в заказе](#post--api-v5-reference-product-statuses-code-edit)
    28. [Получение списка магазинов](#get--api-v5-reference-sites)
    29. [Создание/редактирование магазина](#post--api-v5-reference-sites-code-edit)
    30. [Получение списка групп статусов заказа](#get--api-v5-reference-status-groups)
    31. [Получение списка статусов заказа](#get--api-v5-reference-statuses)
    32. [Создание/редактирование статуса заказа](#post--api-v5-reference-statuses-code-edit)
    33. [Получение списка складов](#get--api-v5-reference-stores)
    34. [Создание/редактирование сведений о складе](#post--api-v5-reference-stores-code-edit)
    35. [Получение списка единиц измерений](#get--api-v5-reference-units)
    36. [Создание/редактирование единицы измерения](#post--api-v5-reference-units-code-edit)
14. [Сегменты](#segments)
     1. [Получение списка пользовательских сегментов](#get--api-v5-segments)
15. [Настройки](#settings)
     1. [Получение настроек системы](#get--api-v5-settings)
16. [Склад](#store)
     1. [Получение остатков и закупочных цен](#get--api-v5-store-inventories)
     2. [Обновление остатков и закупочных цен](#post--api-v5-store-inventories-upload)
     3. [Обновление цен торговых предложений](#post--api-v5-store-prices-upload)
     4. [Получение списка групп товаров, удовлетворяющих заданному фильтру](#get--api-v5-store-product-groups)
     5. [Получение списка товаров с торговыми предложениями, удовлетворяющих заданному фильтру](#get--api-v5-store-products)
     6. [Получение списка свойств товаров, удовлетворяющих заданному фильтру](#get--api-v5-store-products-properties)
     7. [Обновление остатков и закупочных цен](#callback_post--integrationModule_integrations__store__actions__inventoriesUpload_)
     8. [Актуализация остатков после обращения к складской системе](#callback_post--integrationModule_integrations__store__actions__reserve_)
17. [Задачи](#tasks)
    1. [Получение списка задач](#get--api-v5-tasks)
    2. [Создание задачи](#post--api-v5-tasks-create)
    3. [Получение информации о задаче](#get--api-v5-tasks-id)
    4. [Редактирование задачи](#post--api-v5-tasks-id-edit)
18. [Телефония](#telephony)
    1. [События звонка](#post--api-v5-telephony-call-event)
    2. [Загрузка телефонных звонков](#post--api-v5-telephony-calls-upload)
    3. [Получение ответственного менеджера](#get--api-v5-telephony-manager)
    4. [Оповещение о смене статуса](#callback_get--integrationModule_integrations__telephony__changeUserStatusUrl_)
    5. [Инициация звонка](#callback_get--integrationModule_integrations__telephony__makeCallUrl_)
    6. [Переход в личный кабинет](#callback_post--integrationModule_integrations__telephony__personalAccountUrl_)
    7. [Прослушивание звонка](#callback_get--recordUrl)
19. [Пользователи](#users)
    1. [Получение списка групп пользователей](#get--api-v5-user-groups)
    2. [Получение списка пользователей, удовлетворяющих заданному фильтру](#get--api-v5-users)
    3. [Получение информации о пользователе](#get--api-v5-users-id)
    4. [Смена статуса пользователя](#post--api-v5-users-id-status)
20. [Верификация](#verification)
    1. [Подтверждение верификации](#post--api-v5-verification-sms-confirm)
    2. [Проверка статуса верификации](#get--api-v5-verification-sms-checkId-status)
21. [Статистика](#get--api-v5-statistic)
    1. [Обновление статистики](#get--api-v5-statistic-update")

 
# <a name="install"></a> Установка

## Ruby
    $ gem install retailcrm-api
## Rails
добавьте в Gemfile:
    gem 'retailcrm-api'

и запустите `bundle install`.

Затем:
    rails g retailcrm_api:install
## Требования

Необходимо получить api key https://demo.retailcrm.ru/admin/api-keys

## <a name="using_rails"></a> Использование Rails

В файл `config/retailcrm_api.yml` вставьте ваши данные

## <a name="using_ruby"></a> Использование Ruby

Сначала создайте экземпляр объекта `RetailcrmApi::Request`:

```ruby
retailcrm = RetailcrmApi::Request.new(api_key: "your_api_key")
```

Вы можете изменять `api_key`, `timeout`, `open_timeout`, `faraday_adapter`, `proxy`, `symbolize_keys`, `logger`, и `debug`:

```ruby
RetailcrmApi::Request.api_key = "your_api_key"
RetailcrmApi::Request.timeout = 15
RetailcrmApi::Request.open_timeout = 15
RetailcrmApi::Request.symbolize_keys = true
RetailcrmApi::Request.debug = false
```

Либо в файле `config/initializers/retailcrm_api.rb` для Rails.

## <a name="debug_logging"></a> Debug Logging

Измените `debug: true` чтобы включить логирование в STDOUT.

```ruby
retailcrm = RetailcrmApi::Request.new(api_key: "your_api_key", debug: true)
```

### <a name="custom_logger"></a> Custom logger

`Logger.new` используется по умолчанию, но вы можете изменить на свой:

```ruby
retailcrm = RetailcrmApi::Request.new(api_key: "your_api_key", debug: true, logger: MyLogger.new)
```

Или:

```ruby
RetailcrmApi::Request.logger = MyLogger.new
```

# <a name="examples"></a> Примеры
## <a name="costs"></a> Расходы

### <a name="get--api-v5-costs"></a> [Получение списка расходов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-costs)
```ruby
params = {
  filter: {
    minSumm: 0
  }
}
RetailcrmApi::Request.costs.retrieve(params: params).body
# => {:success=>true, :pagination=>{:limit=>20, :totalCount=>296, :currentPage=>1, :totalPageCount=>15}, :costs=>[{:id=>296, :dateFrom=>"2021-07-29", :dateTo=>"2021-07-29", :summ=>13996, :costItem=>"products-purchase-price", :createdAt=>"2021-07-29 00:34:35", :order=>{:id=>36, :number=>"36C"}, :sites=>["b12-skillum-ru"]}]}
```
### <a name="post--api-v5-costs-create"></a> [Создание расхода](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-create)
```ruby
body = {
  site: "deppa-ru",
  cost: {
    summ: 100,
    costItem: "office-expenses",
    dateFrom: (DateTime.now - 1.day).strftime("%Y-%m-%d"),
    dateTo: DateTime.now.strftime("%Y-%m-%d")
  }
}
RetailcrmApi::Request.costs.create(body: body).body
# => {:success=>true, :id=>297}
```
### <a name="post--api-v5-costs-delete"></a> [Пакетное удаление расходов](https://docs.retailcrm.ru/Developers/APIhttps://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-delete)
```ruby
body = {
  ids: [297]
}
RetailcrmApi::Request.costs.create(body: body, suffix: "delete").body
# => {:success=>true, :count=>1, :notRemovedIds=>[]}
```
### <a name="post--api-v5-costs-upload"></a> [Пакетная загрузка расходов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-upload)
```ruby
body = {
  costs: [
    {
      sites: ["deppa-ru"],
      summ: 100,
      costItem: "office-expenses",
      dateFrom: (DateTime.now - 1.day).strftime("%Y-%m-%d"),
      dateTo: DateTime.now.strftime("%Y-%m-%d")
    }
  ]
}
RetailcrmApi::Request.costs.create(body: body, suffix: "upload").body
# => {:success=>true, :uploadedCosts=>[298]}
```
### <a name="get--api-v5-costs-id"></a> [Получение информации о расходе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-costs-id)
```ruby
RetailcrmApi::Request.costs(298).retrieve.body
# => {:success=>true, :cost=>{:id=>298, :dateFrom=>"2021-08-02", :dateTo=>"2021-08-03", :summ=>100, :costItem=>"office-expenses", :createdAt=>"2021-08-03 22:12:34", :sites=>["deppa-ru"]}} 
```
### <a name="post--api-v5-costs-id-edit"></a> [Редактирование расхода](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-id-edit)
```ruby
body = {
  site: "deppa-ru",
  cost: {
    summ: 200,
    costItem: "office-expenses",
    dateFrom: (DateTime.now - 1.day).strftime("%Y-%m-%d"),
    dateTo: DateTime.now.strftime("%Y-%m-%d")
  }
}
RetailcrmApi::Request.costs(298).update(body: body).body
# => {:success=>true, :id=>298}
```
### <a name="custom-fields"></a> [Удаление расхода](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-id-delete)
```ruby
RetailcrmApi::Request.costs(298).delete.body
# => {:success=>true}
```

## <a name="custom-fields"></a> Пользовательские поля
### <a name="get--api-v5-custom-fields"></a> [Получение списка пользовательских полей, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-custom-fields)
```ruby
params = {
  filter: {
    type: "date"
  }
}
RetailcrmApi::Request.custom_fields.retrieve(params: params).body
# =>{:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customFields=>[]}
```
### <a name="get--api-v5-custom-fields-dictionaries"></a> [Получение списка справочников, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-custom-fields-dictionaries)
```ruby
params = {
  limit: 100,
  filter: {
    name: "test"
  }
}
RetailcrmApi::Request.custom_fields.dictionaries.retrieve(params: params).body
# => {:success=>true, :pagination=>{:limit=>100, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customDictionaries=>[]} 
```
### <a name="post--api-v5-custom-fields-dictionaries-create"></a> [Создание справочника](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-custom-fields-dictionaries-create)
```ruby
body = {
  customDictionary: {
    code: "test_custom",
    name: "test custom",
    elements: [
      {
        name: "Тест",
        code: "test"
      }
    ]
  }
}
RetailcrmApi::Request.custom_fields.dictionaries.create(body: body).body
# => {:success=>true, :code=>"test_custom"}
```
### <a name="get--api-v5-custom-fields-dictionaries-code"></a> [Получение информации о справочнике](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-custom-fields-dictionaries-code)
```ruby
RetailcrmApi::Request.custom_fields.dictionaries("test_custom").retrieve.body
# => {:success=>true, :customDictionary=>{:name=>"test custom", :code=>"test_custom", :elements=>[{:name=>"Тест", :code=>"test", :ordering=>50}]}} 
```
### <a name="post--api-v5-custom-fields-dictionaries-code-edit"></a> [Редактирование справочика](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-custom-fields-dictionaries-code-edit)
```ruby
body = {
  customDictionary: {
    name: "test custom update",
    elements: [
      {
        name: "Тест update",
        code: "test"
      }
    ]
  }
}
RetailcrmApi::Request.custom_fields.dictionaries("test_custom").update(body: body).body
# => {:success=>true, :code=>"test_custom"}
```
### <a name="post--api-v5-custom-fields-entity-create"></a> [Создание пользовательского поля](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-custom-fields-entity-create)
```ruby
entity = ["order", "customer", "customer_corporate", "company"].sample
body = {
  customField: {
    name: "Тест",
    code: "test",
    type: "string"
  }
}
RetailcrmApi::Request.custom_fields(entity).create(body: body).body
# => {:success=>true, :code=>"test"}
```
### <a name="get--api-v5-custom-fields-entity-code"></a> [Получение информации о пользовательском поле](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-custom-fields-entity-code)
```ruby
RetailcrmApi::Request.custom_fields(entity, "test").retrieve.body
# => {:success=>true, :customField=>{:name=>"Тест", :code=>"test", :required=>false, :inFilter=>true, :inList=>true, :inGroupActions=>false, :type=>"string", :entity=>"customer", :ordering=>50, :viewMode=>"editable"}}
```
### <a name="post--api-v5-custom-fields-entity-code-edit"></a> [Редактирование пользовательского поля](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-custom-fields-entity-code-edit)
```ruby
body = {
  customField: {
    name: "Тест update",
    code: "test",
    type: "boolean"
  }
}
RetailcrmApi::Request.custom_fields(entity, "test").update(body: body).body
# => {:success=>true, :code=>"test"} 
```

## <a name="customers"></a> Клиенты
### <a name="get--api-v5-customers"></a> [Получение списка клиентов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers)
```ruby
params = {
  limit: 100,
  filter: {
    sex: "male"
  }
}
RetailcrmApi::Request.customers.retrieve(params: params).body
#=> {:success=>true, :pagination=>{:limit=>100, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customers=>[]} 
```
### <a name="post--api-v5-customers-combine"></a> [Объединение клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-combine)
```ruby
body = {
  resultCustomer: {
    id: 58
  },
  customers: [
    {
      id: 57
    }
  ]
}
RetailcrmApi::Request.customers.create(body: body, suffix: "combine").body
#=> {:success=>true}
```
### <a name="post--api-v5-customers-create"></a> [Создание клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-create)
```ruby
body = {
  site: "deppa-ru",
  customer: {
    externalId: 333,
    vip: true,
    firstName: "Павел",
    lastName: "Осетров"
  }
}
RetailcrmApi::Request.customers.create(body: body).body
#=> {:success=>true, :id=>59}
```
### <a name="post--api-v5-customers-fix-external-ids"></a> [Массовая запись внешних ID клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-fix-external-ids)
```ruby
body = {
  customers: [
    {
      id: 59,
      externalId: 555
    }
  ]
}
RetailcrmApi::Request.customers.create(body: body, suffix: "fix-external-ids").body
#=> {:success=>true} 
```
### <a name="get--api-v5-customers-history"></a> [Получение истории изменения клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-history)
```ruby
params = {
  filter: {
    customerId: 59
  }
}
RetailcrmApi::Request.customers.history.retrieve(params: params).body
#=> {:success=>true, :generatedAt=>"2021-08-04 13:31:04", :history=>[{:id=>276, :createdAt=>"2021-08-04 13:24:26", :created=>true, :source=>"api", :field=>"id", :apiKey=>{:current=>true}, :oldValue=>nil, :newValue=>59, :customer=>{:type=>"customer", :id=>59, :externalId=>"333", :isContact=>false, :createdAt=>"2021-08-04 13:24:26", :vip=>true, :bad=>false, :site=>"deppa-ru", :contragent=>{:contragentType=>"individual"}, :marginSumm=>0, :totalSumm=>0, :averageSumm=>0, :ordersCount=>0, :customFields=>[], :personalDiscount=>0, :cumulativeDiscount=>0, :segments=>[], :firstName=>"Павел", :lastName=>"Осетров", :presumableSex=>"male"}}, {:id=>277, :createdAt=>"2021-08-04 13:28:46", :source=>"api", :field=>"external_id", :apiKey=>{:current=>true}, :oldValue=>"333", :newValue=>"555", :customer=>{:id=>59, :externalId=>"555", :site=>"deppa-ru"}}], :pagination=>{:limit=>100, :totalCount=>2, :currentPage=>1, :totalPageCount=>1}}
```
### <a name="get--api-v5-customers-notes"></a> [Получение заметок](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-notes)
```ruby
params = {
  filter: {
    customerIds: [59]
  }
}
RetailcrmApi::Request.customers.notes.retrieve(params: params).body
#=> {:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :notes=>[]} 
```
### <a name="post--api-v5-customers-notes-create"></a> [Создание заметки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-notes-create)
```ruby
body = {
  site: "deppa-ru",
  note: {
    text: "Просит скидки",
    customer: {
      id: 59
    }
  }
}
RetailcrmApi::Request.customers.notes.create(body: body).body
#=> {:success=>true, :id=>44} 
```
### <a name="post--api-v5-customers-notes-id-delete"></a> [Удаление заметки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-notes-id-delete)
```ruby
RetailcrmApi::Request.customers.notes(44).delete.body
#=> {:success=>true}
```
### <a name="post--api-v5-customers-upload"></a> [Пакетная загрузка клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-upload)
```ruby
body = {
  customers: [
    {
      externalId: 999,
      vip: true,
      firstName: "Юкихиро",
      lastName: "Мацумото"
    },
    {
      externalId: 666,
      bad: true,
      firstName: "Расмус",
      lastName: "Лердорф"
    }
  ]
}
RetailcrmApi::Request.customers.create(body: body, suffix: "upload").body
#=> {:success=>true, :uploadedCustomers=>[{:id=>60, :externalId=>"999"}, {:id=>61, :externalId=>"666"}]} 
```
### <a name="get--api-v5-customers-externalId"></a> [Получение информации о клиенте](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-externalId)
```ruby
params = {
  by: "id"
}
RetailcrmApi::Request.customers(60).retrieve(params: params).body
#=> {:success=>true, :customer=>{:type=>"customer", :id=>60, :externalId=>"999", :isContact=>false, :createdAt=>"2021-08-04 13:41:05", :vip=>true, :bad=>false, :site=>"deppa-ru", :contragent=>{:contragentType=>"individual"}, :tags=>[], :marginSumm=>0, :totalSumm=>0, :averageSumm=>0, :ordersCount=>0, :customFields=>[], :personalDiscount=>0, :segments=>[{:id=>20, :code=>"nizkiy-sredniy-chek", :name=>"Низкий средний чек", :createdAt=>"2021-07-29 00:34:14", :isDynamic=>true, :customersCount=>4, :active=>true}, {:id=>31, :code=>"pol-ne-ukazan", :name=>"Пол не указан", :createdAt=>"2021-07-29 00:34:15", :isDynamic=>true, :customersCount=>4, :active=>true}, {:id=>26, :code=>"bez-otmen", :name=>"Без отмен", :createdAt=>"2021-07-29 00:34:15", :isDynamic=>true, :customersCount=>4, :active=>true}], :firstName=>"Юкихиро", :lastName=>"Мацумото", :presumableSex=>"female", :phones=>[]}} 
```
### <a name="post--api-v5-customers-externalId-edit"></a> [Редактирование клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-externalId-edit)
```ruby
body = {
  site: "deppa-ru",
  customer: {
    isContact: true
  }
}
params = {
  by: "id"
}
RetailcrmApi::Request.customers(61).update(body: body, params: params).body
#=> {:success=>true, :id=>61}
```
## <a name="customers-corporate"></a> Корпоративные клиенты
### <a name="get--api-v5-customers-corporate"></a> [Получение списка корпоративных клиентов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate)
```ruby
params = {
  limit: 100,
  filter: {
    vip: "1"
  }
}
RetailcrmApi::Request.customers_corporate.retrieve(params: params).body
#=> {:success=>true, :pagination=>{:limit=>100, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customersCorporate=>[]}
```
### <a name="post--api-v5-customers-corporate-combine"></a> [Объединение корпоративных клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-combine)
```ruby
body = {
  resultCustomer: {
    id: 63
  },
  customers: [
    {
      id: 64
    }
  ]
}
RetailcrmApi::Request.customers_corporate.create(body: body, suffix: "combine").body
#=> {:success=>true}
```
### <a name="post--api-v5-customers-corporate-create"></a> [Создание корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-create)
```ruby
body = {
  customerCorporate: {
    externalId: 333,
    vip: true,
    nickName: "dhh"
  }
}
RetailcrmApi::Request.customers_corporate.create(body: body).body
#=> {:success=>true, :id=>62}
```
### <a name="post--api-v5-customers-corporate-fix-external-ids"></a> [Массовая запись внешних ID корпоративных клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-fix-external-ids)
```ruby
body = {
  customersCorporate: [
    {
      id: 63,
      externalId: 12
    },
    {
      id: 62,
      externalId: 13
    }
  ]
}
RetailcrmApi::Request.customers_corporate.create(body: body, suffix: "fix-external-ids").body
#=> {:success=>true} 
```
### <a name="get--api-v5-customers-corporate-history"></a> [Получение истории изменения корпоративных клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate-history)
```ruby
params = {
  filter: {
    customerId: 63
  }
}
RetailcrmApi::Request.customers_corporate.history.retrieve(params: params).body
#=> {:success=>true, :generatedAt=>"2021-08-04 20:04:14", :history=>[{:id=>9, :createdAt=>"2021-08-04 19:58:50", :created=>true, :source=>"api", :field=>"id", :apiKey=>{:current=>true}, :oldValue=>nil, :newValue=>63, :customer=>{:type=>"customer_corporate", :id=>63, :externalId=>"44", :nickName=>"ryzhikov", :createdAt=>"2021-08-04 19:58:50", :vip=>false, :bad=>true, :site=>"deppa-ru", :marginSumm=>0, :totalSumm=>0, :averageSumm=>0, :ordersCount=>0, :customFields=>[], :personalDiscount=>0, :cumulativeDiscount=>0}}, {:id=>12, :createdAt=>"2021-08-04 20:03:15", :source=>"api", :field=>"external_id", :apiKey=>{:current=>true}, :oldValue=>"44", :newValue=>"12", :customer=>{:id=>63, :externalId=>"12", :site=>"deppa-ru"}}], :pagination=>{:limit=>100, :totalCount=>2, :currentPage=>1, :totalPageCount=>1}}
```
### <a name="get--api-v5-customers-corporate-notes"></a> [Получение заметок](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate-notes)
```ruby
params = {
  filter: {
    customerIds: [63]
  }
}
RetailcrmApi::Request.customers_corporate.notes.retrieve(params: params).body
#=> {:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :notes=>[]}
```
### <a name="post--api-v5-customers-corporate-notes-create"></a> [Создание заметки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-notes-create)
```ruby
body = {
  site: "deppa-ru",
  note: {
    text: "Very bad",
    customer: {
      id: 63
    }
  }
}
RetailcrmApi::Request.customers_corporate.notes.create(body: body).body
#=> {:success=>true, :id=>45} 
```
### <a name="post--api-v5-customers-corporate-notes-id-delete"></a> [Удаление заметки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-notes-id-delete)
```ruby
RetailcrmApi::Request.customers_corporate.notes(45).delete.body
#=> {:success=>true}
```
### <a name="post--api-v5-customers-corporate-upload"></a> [Пакетная загрузка корпоративных клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-upload)
```ruby
body = {
  customersCorporate: [
    {
      externalId: 44,
      bad: true,
      nickName: "ryzhikov"
    },
    {
      externalId: 22,
      bad: true,
      nickName: "buytaert"
    }
  ]
}
RetailcrmApi::Request.customers_corporate.create(body: body, suffix: "upload").body
#=> {:success=>true, :uploadedCustomers=>[{:id=>63, :externalId=>"44"}, {:id=>64, :externalId=>"22"}]}
```
### <a name="get--api-v5-customers-corporate-externalId"></a> [Получение информации о корпоративном клиенте](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate-externalId)
```ruby
params = {
  by: "externalId"
}
RetailcrmApi::Request.customers_corporate(12).retrieve(params: params).body
#=> {:success=>true, :customerCorporate=>{:type=>"customer_corporate", :id=>63, :externalId=>"12", :nickName=>"ryzhikov", :createdAt=>"2021-08-04 19:58:50", :vip=>false, :bad=>true, :site=>"deppa-ru", :tags=>[], :marginSumm=>0, :totalSumm=>0, :averageSumm=>0, :ordersCount=>0, :customFields=>[], :personalDiscount=>0}} 
```
### <a name="get--api-v5-customers-corporate-externalId-addresses"></a> [Список адресов корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate-externalId-addresses)
```ruby
params = {
  by: "id"
}
RetailcrmApi::Request.customers_corporate(63).addresses.retrieve(params: params).body
#=> {:success=>true, :addresses=>[], :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}}
```
### <a name="post--api-v5-customers-corporate-externalId-addresses-create"></a> [Создание адреса для корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-externalId-addresses-create)
```ruby
params = {
  by: "id"
}
body = {
  site: "deppa-ru",
  address: {
    city: "Санкт-Петербург"
  }
}
RetailcrmApi::Request.customers_corporate(63).addresses.create(params: params, body: body).body
#=> {:success=>true, :id=>42} 
```
### <a name="post--api-v5-customers-corporate-externalId-addresses-entityExternalId-edit"></a> [Редактирование адреса корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-externalId-addresses-entityExternalId-edit)
```ruby
params = {
  by: "id",
  entityBy: "id"
}
body = {
  site: "deppa-ru",
  address: {
    city: "Вятка"
  }
}
RetailcrmApi::Request.customers_corporate(63).addresses(42).update(params: params, body: body).body
#=> {:success=>true, :id=>42}
```
### <a name="get--api-v5-customers-corporate-externalId-companies"></a> [Список компаний корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate-externalId-companies)
```ruby
params = {
  by: "id"
}
RetailcrmApi::Request.customers_corporate(63).companies.retrieve(params: params).body
#=> {:success=>true, :companies=>[], :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}}
```
### <a name="post--api-v5-customers-corporate-externalId-companies-create"></a> [Создание компании для корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-externalId-companies-create)
```ruby
params = {
  by: "id"
}
body = {
  site: "deppa-ru",
  company: {
    name: "DEPPA",
    site: "https://deppa.ru"
  }
}
RetailcrmApi::Request.customers_corporate(62).companies.create(params: params, body: body).body
#=> {:success=>true, :id=>16}
```
### <a name="post--api-v5-customers-corporate-externalId-companies-entityExternalId-edit"></a> [Редактирование компании корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-externalId-companies-entityExternalId-edit)
```ruby
params = {
  by: "id",
  entityBy: "id"
}
body = {
  site: "deppa-ru",
  company: {
    isMain: true
  }
}
RetailcrmApi::Request.customers_corporate(62).companies(16).update(params: params, body: body).body
#=> {:success=>true, :id=>16}
```
### <a name="get--api-v5-customers-corporate-externalId-contacts"></a> [Список контактных лиц корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate-externalId-contacts)
```ruby
params = {
  by: "id"
}
RetailcrmApi::Request.customers_corporate(62).contacts.retrieve(params: params).body
#=> {:success=>true, :contacts=>[], :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}}
```
### <a name="post--api-v5-customers-corporate-externalId-contacts-create"></a> [Создание связи корпоративного клиента с контактным лицом](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-externalId-contacts-create)
```ruby
params = {
  by: "id"
}
body = {
  site: "deppa-ru",
  contact: {
    isMain: true,
    customer: {
      externalId: "555"
    }
  }
}
RetailcrmApi::Request.customers_corporate(62).contacts.create(params: params, body: body).body
#=> {:success=>true, :id=>16}
```
### <a name="post--api-v5-customers-corporate-externalId-contacts-entityExternalId-edit"></a> [Редактирование связи корпоративного клиента с контактным лицом](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-externalId-contacts-entityExternalId-edit)
```ruby
params = {
  by: "id",
  entityBy: "externalId"
}
body = {
  site: "deppa-ru",
  contact: {
    isMain: false
  }
}
RetailcrmApi::Request.customers_corporate(62).contacts("555").update(params: params, body: body).body
#=> {:success=>true, :id=>16}
```
### <a name="post--api-v5-customers-corporate-externalId-edit"></a> [Редактирование корпоративного клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-externalId-edit)
```ruby
params = {
  by: "id"
}
body = {
  site: "deppa-ru",
  customerCorporate: {
    personalDiscount: 99.9
  }
}
RetailcrmApi::Request.customers_corporate(62).update(params: params, body: body).body
#=> {:success=>true, :id=>62}
```
## <a name="delivery"></a> Доставки
### <a name="post--api-v5-delivery-calculate"></a> [Расчёт стоимости доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-delivery-calculate)
### <a name="post--api-v5-delivery-generic-subcode-tracking"></a> [Обновление статусов доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-delivery-generic-subcode-tracking)
### <a name="get--api-v5-delivery-shipments"></a> [Получение списка отгрузок в службы доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-delivery-shipments)
### <a name="post--api-v5-delivery-shipments-create"></a> [Создание отгрузки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-delivery-shipments-create)
### <a name="get--api-v5-delivery-shipments-id"></a> [Получение информации об отгрузке](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-delivery-shipments-id)
### <a name="post--api-v5-delivery-shipments-id-edit"></a> [Редактироване отгрузки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-delivery-shipments-id-edit)
### <a name="callback_get--integrationModule_integrations__delivery__actions__autocomplete_"></a> [Запрос на получение данных для автокомплит поля](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--integrationModule_integrations__delivery__actions__autocomplete_)
### <a name="callback_post--integrationModule_integrations__delivery__actions__calculate_"></a> [Расчет стоимости доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__delivery__actions__calculate_)
### <a name="callback_post--integrationModule_integrations__delivery__actions__delete_"></a> [Удаление заявки на доставку](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__delivery__actions__delete_)
### <a name="callback_get--integrationModule_integrations__delivery__actions__get_"></a> [Получение данных доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--integrationModule_integrations__delivery__actions__get_)
### <a name="callback_post--integrationModule_integrations__delivery__actions__print_"></a> [Печатные формы службы доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__delivery__actions__print_)
### <a name="callback_post--integrationModule_integrations__delivery__actions__save_"></a> [Создание и редактирование доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__delivery__actions__save_)
### <a name="callback_post--integrationModule_integrations__delivery__actions__shipmentDelete_"></a> [Удаление заявки на отгрузку](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__delivery__actions__shipmentDelete_)
### <a name="callback_get--integrationModule_integrations__delivery__actions__shipmentPointList_"></a> [Список терминалов приема посылок](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--integrationModule_integrations__delivery__actions__shipmentPointList_)
### <a name="callback_post--integrationModule_integrations__delivery__actions__shipmentSave_"></a> [Создание и редактирование отгрузки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__delivery__actions__shipmentSave_)
### <a name="callback_get--integrationModule_integrations__delivery__actions__tariffList_"></a> [Список тарифов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--integrationModule_integrations__delivery__actions__tariffList_)
## <a name="files"></a> Файлы
### <a name="get--api-v5-files"></a> [Получение списка файлов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-files)
### <a name="post--api-v5-files-upload"></a> [Загрузка файла на сервер](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-files-upload)
### <a name="get--api-v5-files-id"></a> [Получение информации о файле](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-files-id)
### <a name="post--api-v5-files-id-delete"></a> [Удаление файла](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-files-id-delete)
### <a name="get--api-v5-files-id-download"></a> [Скачивание файла](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-files-id-download)
### <a name="post--api-v5-files-id-edit"></a> [Редактирование файла](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-files-id-edit)
## <a name="integration"></a> Интеграция
### <a name="get--api-v5-integration-modules-code"></a> [Получение интеграционного модуля](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-integration-modules-code)
### <a name="post--api-v5-integration-modules-code-edit"></a> [Создание/редактирование интеграционного модуля](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-integration-modules-code-edit)
### <a name="callback_post--integrationModule_actions__activity_"></a> [Уведомление об изменении статуса активности или заморозки модуля](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_actions__activity_)
## <a name="loyalty"></a> Лояльность
### <a name="post--api-v5-loyalty-account-create"></a> [Добавление клиента в программу лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-loyalty-account-create)
### <a name="get--api-v5-loyalty-account-id"></a> [Получение информации об участии в программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-loyalty-account-id)
### <a name="post--api-v5-loyalty-account-id-activate"></a> [Активация участия в программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-loyalty-account-id-activate)
### <a name="post--api-v5-loyalty-account-id-bonus-credit"></a> [Начисление бонусов участию в программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-loyalty-account-id-bonus-credit)
### <a name="get--api-v5-loyalty-account-id-bonus-operations"></a> [История бонусного счета](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-loyalty-account-id-bonus-operations)
### <a name="post--api-v5-loyalty-account-id-edit"></a> [Редактирование участия в программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-loyalty-account-id-edit)
### <a name="get--api-v5-loyalty-accounts"></a> [Список участий в программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-loyalty-accounts)
### <a name="post--api-v5-loyalty-calculate"></a> [Расчёт максимальной скидки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-loyalty-calculate)
### <a name="get--api-v5-loyalty-loyalties"></a> [Список программ лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-loyalty-loyalties)
### <a name="get--api-v5-loyalty-loyalties-id"></a> [Получение информации о программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-loyalty-loyalties-id)
## <a name="orders"></a> Заказы
### <a name="get--api-v5-orders"></a> [Получение списка заказов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-orders)
### <a name="post--api-v5-orders-combine"></a> [Объединение заказов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-combine)
### <a name="post--api-v5-orders-create"></a> [Создание заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-create)
### <a name="post--api-v5-orders-fix-external-ids"></a> [Массовая запись внешних ID заказов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-fix-external-ids)
### <a name="get--api-v5-orders-history"></a> [Получение истории изменений заказов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-orders-history)
### <a name="post--api-v5-orders-links-create"></a> [Создание связи между заказами](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-links-create)
### <a name="post--api-v5-orders-loyalty-apply"></a> [Применение бонусов по программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-loyalty-apply)
### <a name="post--api-v5-orders-loyalty-cancel-bonus-operations"></a> [Отмена бонусных операций по программе лояльности](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-loyalty-cancel-bonus-operations)
### <a name="post--api-v5-orders-payments-create"></a> [Добавление платежа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-payments-create)
### <a name="post--api-v5-orders-payments-id-delete"></a> [Удаление платежа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-payments-id-delete)
### <a name="post--api-v5-orders-payments-id-edit"></a> [Редактирование платежа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-payments-id-edit)
### <a name="get--api-v5-orders-statuses"></a> [Получение списка статусов заказов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-orders-statuses)
### <a name="post--api-v5-orders-upload"></a> [Пакетная загрузка заказов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-upload)
### <a name="get--api-v5-orders-externalId"></a> [Получение информации о заказе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-orders-externalId)
### <a name="post--api-v5-orders-externalId-edit"></a> [Редактирование заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-externalId-edit)
## <a name="orders_packs"></a> Комплектация заказов
### <a name="get--api-v5-orders-packs"></a> [Получение списка паков, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-orders-packs)
### <a name="post--api-v5-orders-packs-create"></a> [Создание пака](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-packs-create)
### <a name="get--api-v5-orders-packs-history"></a> [Получение истории комплектации заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-orders-packs-history)
### <a name="get--api-v5-orders-packs-id"></a> [Получение информации о паке](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-orders-packs-id)
### <a name="post--api-v5-orders-packs-id-delete"></a> [Удаление пака](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-packs-id-delete)
### <a name="post--api-v5-orders-packs-id-edit"></a> [Редактирование пака](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-orders-packs-id-edit)
## <a name="payment"></a> Платежи
### <a name="post--api-v5-payment-check"></a> [Проверка инвойса](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-payment-check)
### <a name="post--api-v5-payment-create-invoice"></a> [Создание инвойса](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-payment-create-invoice)
### <a name="post--api-v5-payment-update-invoice"></a> [Изменение инвойса](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-payment-update-invoice)
### <a name="callback_post--integrationModule_integrations__payment__actions__approve_"></a> [Подтверждение оплаты](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__payment__actions__approve_)
### <a name="callback_post--integrationModule_integrations__payment__actions__cancel_"></a> [Отмена оплаты](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__payment__actions__cancel_)
### <a name="callback_post--integrationModule_integrations__payment__actions__create_"></a> [Создание оплаты](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__payment__actions__create_)
### <a name="callback_post--integrationModule_integrations__payment__actions__refund_"></a> [Возврат](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__payment__actions__refund_)
## <a name="recommendation"></a> Рекомендации
### <a name="callback_get--integrationModule_integrations__recommendation__actions__recommendation_"></a> [Запрос рекомендуемых товаров](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--integrationModule_integrations__recommendation__actions__recommendation_)
## <a name="reference"></a> Справочники
### <a name="get--api-v5-reference-cost-groups"></a> [Получение списка групп расходов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-cost-groups)
### <a name="post--api-v5-reference-cost-groups-code-edit"></a> [Редактирование группы расходов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-cost-groups-code-edit)
### <a name="get--api-v5-reference-cost-items"></a> [Получение списка статей расходов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-cost-items)
### <a name="post--api-v5-reference-cost-items-code-edit"></a> [Редактирование статьи расходов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-cost-items-code-edit)
### <a name="get--api-v5-reference-countries"></a> [Получение списка кодов доступных стран](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-countries)
### <a name="get--api-v5-reference-couriers"></a> [Получение списка курьеров](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-couriers)
### <a name="post--api-v5-reference-couriers-create"></a> [Создание курьера](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-couriers-create)
### <a name="post--api-v5-reference-couriers-id-edit"></a> [Редактирование курьера](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-couriers-id-edit)
### <a name="get--api-v5-reference-delivery-services"></a> [Получение списка служб доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-delivery-services)
### <a name="post--api-v5-reference-delivery-services-code-edit"></a> [Создание/редактирование службы доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-delivery-services-code-edit)
### <a name="get--api-v5-reference-delivery-types"></a> [Получение списка типов доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-delivery-types)
### <a name="post--api-v5-reference-delivery-types-code-edit"></a> [Создание/редактирование типа доставки](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-delivery-types-code-edit)
### <a name="get--api-v5-reference-legal-entities"></a> [Получение списка юридических лиц](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-legal-entities)
### <a name="post--api-v5-reference-legal-entities-code-edit"></a> [Создание/редактирование юридического лица](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-legal-entities-code-edit)
### <a name="get--api-v5-reference-mg-channels"></a> [Получение списка MessageGateway каналов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-mg-channels)
### <a name="get--api-v5-reference-order-methods"></a> [Получение списка способов оформления заказов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-order-methods)
### <a name="post--api-v5-reference-order-methods-code-edit"></a> [Создание/редактирование способа оформления заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-order-methods-code-edit)
### <a name="get--api-v5-reference-order-types"></a> [Получение списка типов заказов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-order-types)
### <a name="post--api-v5-reference-order-types-code-edit"></a> [Создание/редактирование типа заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-order-types-code-edit)
### <a name="get--api-v5-reference-payment-statuses"></a> [Получение списка статусов оплаты](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-payment-statuses)
### <a name="post--api-v5-reference-payment-statuses-code-edit"></a> [Создание/редактирование статусов оплаты](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-payment-statuses-code-edit)
### <a name="get--api-v5-reference-payment-types"></a> [Получение списка типов оплаты](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-payment-types)
### <a name="post--api-v5-reference-payment-types-code-edit"></a> [Создание/редактирование типа оплаты](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-payment-types-code-edit)
### <a name="get--api-v5-reference-price-types"></a> [Получение списка типов цен](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-price-types)
### <a name="post--api-v5-reference-price-types-code-edit"></a> [Создание/редактирование типа цены](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-price-types-code-edit)
### <a name="get--api-v5-reference-product-statuses"></a> [Получение списка статусов товаров в заказе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-product-statuses)
### <a name="post--api-v5-reference-product-statuses-code-edit"></a> [Создание/редактирование статуса товара в заказе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-product-statuses-code-edit)
### <a name="get--api-v5-reference-sites"></a> [Получение списка магазинов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-sites)
### <a name="post--api-v5-reference-sites-code-edit"></a> [Создание/редактирование магазина](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-sites-code-edit)
### <a name="get--api-v5-reference-status-groups"></a> [Получение списка групп статусов заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-status-groups)
### <a name="get--api-v5-reference-statuses"></a> [Получение списка статусов заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-statuses)
### <a name="post--api-v5-reference-statuses-code-edit"></a> [Создание/редактирование статуса заказа](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-statuses-code-edit)
### <a name="get--api-v5-reference-stores"></a> [Получение списка складов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-stores)
### <a name="post--api-v5-reference-stores-code-edit"></a> [Создание/редактирование сведений о складе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-stores-code-edit)
### <a name="get--api-v5-reference-units"></a> [Получение списка единиц измерений](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-reference-units)
### <a name="post--api-v5-reference-units-code-edit"></a>  [Создание/редактирование единицы измерения](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-reference-units-code-edit)
## <a name="segments"></a> Сегменты
### <a name="get--api-v5-segments"></a> [Получение списка пользовательских сегментов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-segments)
## <a name="settings"></a> Настройки
### <a name="get--api-v5-settings"></a> [Получение настроек системы](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-settings)
## <a name="store"></a> Склад
### <a name="get--api-v5-store-inventories"></a> [Получение остатков и закупочных цен](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-store-inventories)
### <a name="post--api-v5-store-inventories-upload"></a> [Обновление остатков и закупочных цен](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-store-inventories-upload)
### <a name="post--api-v5-store-prices-upload"></a>  [Обновление цен торговых предложений](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-store-prices-upload)
### <a name="get--api-v5-store-product-groups"></a> [Получение списка групп товаров, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-store-product-groups)
### <a name="get--api-v5-store-products"></a> [Получение списка товаров с торговыми предложениями, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-store-products)
### <a name="get--api-v5-store-products-properties"></a> [Получение списка свойств товаров, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-store-products-properties)
### <a name="callback_post--integrationModule_integrations__store__actions__inventoriesUpload_"></a> [Обновление остатков и закупочных цен](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__store__actions__inventoriesUpload_)
### <a name="callback_post--integrationModule_integrations__store__actions__reserve_"></a> [Актуализация остатков после обращения к складской системе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__store__actions__reserve_)
## <a name="tasks"></a> Задачи
### <a name="get--api-v5-tasks"></a> [Получение списка задач](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-tasks)
### <a name="post--api-v5-tasks-create"></a> [Создание задачи](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-tasks-create)
### <a name="get--api-v5-tasks-id"></a> [Получение информации о задаче](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-tasks-id)
### <a name="post--api-v5-tasks-id-edit"></a> [Редактирование задачи](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-tasks-id-edit)
## <a name="telephony"></a> Телефония
### <a name="post--api-v5-telephony-call-event"></a> [События звонка](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-telephony-call-event)
### <a name="post--api-v5-telephony-calls-upload"></a> [Загрузка телефонных звонков](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-telephony-calls-upload)
### <a name="get--api-v5-telephony-manager"></a> [Получение ответственного менеджера](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-telephony-manager)
### <a name="callback_get--integrationModule_integrations__telephony__changeUserStatusUrl_"></a> [Оповещение о смене статуса](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--integrationModule_integrations__telephony__changeUserStatusUrl_)
### <a name="callback_get--integrationModule_integrations__telephony__makeCallUrl_"></a> [Инициация звонка](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--integrationModule_integrations__telephony__makeCallUrl_)
### <a name="callback_post--integrationModule_integrations__telephony__personalAccountUrl_"></a> [Переход в личный кабинет](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_post--integrationModule_integrations__telephony__personalAccountUrl_)
### <a name="callback_get--recordUrl"></a> [Прослушивание звонка](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#callback_get--recordUrl)
## <a name="users"></a> Пользователи
### <a name="get--api-v5-user-groups"></a> [Получение списка групп пользователей](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-user-groups)
### <a name="get--api-v5-users"></a> [Получение списка пользователей, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-users)
### <a name="get--api-v5-users-id"></a> [Получение информации о пользователе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-users-id)
### <a name="post--api-v5-users-id-status"></a> [Смена статуса пользователя](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-users-id-status)
## <a name="verification"></a> Верификация
### <a name="post--api-v5-verification-sms-confirm"></a> [Подтверждение верификации](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-verification-sms-confirm)
### <a name="get--api-v5-verification-sms-checkId-status"></a> [Проверка статуса верификации](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-verification-sms-checkId-status)
## <a name="get--api-v5-statistic"></a> Статистика
### <a name="get--api-v5-statistic-update"></a> [Обновление статистики](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-statistic-update)