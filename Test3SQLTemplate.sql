-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 24 2025 г., 11:13
-- Версия сервера: 10.5.29-MariaDB-0+deb11u1
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tests`
--

-- --------------------------------------------------------

--
-- Структура таблицы `post.stat.post3`
--

CREATE TABLE `post.stat.post3` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `viewed_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post.stat.post3`
--

INSERT INTO `post.stat.post3` (`id`, `p_id`, `user_id`, `viewed_at`) VALUES
(13, 1, 1, '2025-06-24'),
(14, 3, 1, '2025-06-24'),
(15, 4, 1, '2025-06-24'),
(16, 4, 1, '2025-06-24'),
(17, 4, 1, '2025-06-24'),
(18, 4, 1, '2025-06-24'),
(19, 4, 1, '2025-06-24');

-- --------------------------------------------------------

--
-- Структура таблицы `post.test3`
--

CREATE TABLE `post.test3` (
  `id_post` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `created_at` date NOT NULL,
  `viewed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post.test3`
--

INSERT INTO `post.test3` (`id_post`, `title`, `content`, `created_at`, `viewed`) VALUES
(1, 'Первый пост', 'Содержимое первого поста', '2025-06-16', 3),
(2, 'Не первый пост', 'Содержимое не первого поста Реализация бесконечной прокрутки\r\nХотите создать бесконечную прокрутку на своем сайте? Применяйте описанный выше метод отслеживания конца контента для динамической подгрузки новых данных. Избегайте многократных загрузок данных, используя флаги или ограничения скорости событий прокрутки.\r\n\r\nРаботоспособность в разных браузерах\r\nВ большинстве браузеров все будет работать одинаково, но всегда стоит проверять функциональность в разных окружениях. Дополнительную информацию можно найти в документации MDN Web Docs и официальной документации jQuery.\r\n\r\nОптимизация производительности прокрутки\r\nСобытия прокрутки могут срабатывать очень часто, поэтому важно использовать техники уменьшения их количества для сохранения производительности — такие как дросселирование и дебаунсинг. Для сокращения операций с DOM кэшируйте объекты jQuery в переменных.\r\n\r\nПолезные материалы\r\nСобытие scroll | Документация по API jQuery — основы работы событий .scroll() в документации jQuery.\r\nОбработка событий | Учебный центр jQuery — подробное руководство по работе с событиями в jQuery.\r\nЭлемент: событие scroll – Web APIs | MDN — базовые сведения о событии scroll от Mozilla.\r\nCheck if a user has scrolled to the bottom – Stack Overflow — опыт и решения сообщества на Stack Overflow.\r\nTutorial | DigitalOcean — пошаговые указания по реализации бесконечной прокрутки от DigitalOcean.Сегодня мы напишем скрипт, который поможет нам определять положение страницы или иначе: прокрутил пользователь страницу или нет.\r\n\r\nСуть в следующем: при прокрутке имеется необходимость в определенный момент произвести действие (скрыть верхнее меню или отобразить боковую колонку). Но сделать это требуется не сразу, а если пользователь прокрутит страницу, например на 150px.\r\n\r\n\r\n \r\nЧто-то похожее (под названием \"Плавающие блоки\" мы делали тут). Но проблема в том, что тот скрипт уже устарел и срабатывает не всегда. Так вот, если он не работает, то вам пригодится свежий.\r\n\r\nДля начала по традиции создадим структуру - это 2 обычных блока div:\r\n\r\n<div class=\"header\"></div>\r\n<div class=\"content\"></div>\r\nТеперь зададим для них стили (заранее укажу лишний класс для будущего скрипта):\r\n\r\nbody {\r\n	margin:0;\r\n}\r\n.header {\r\n	height:200px;\r\n	background:yellow;\r\n}\r\n.fixed {\r\n	height:100px;\r\n	width:100%;\r\n	position:fixed;\r\n	background:green;\r\n}\r\n.content {\r\n	height:10000px;\r\n	background:blue;\r\n}\r\nДавайте напишем скрипт, который будет присваивать блоку с классом header класс fixed, если мы прокрутим страницу на 50px:\r\n\r\n$(window).on(\"scroll\", function() {\r\n    if ($(window).scrollTop() > 50) $(\'.header\').addClass(\'fixed\');\r\n          else $(\'.header\').removeClass(\'fixed\');\r\n    });\r\nИз стилей мы можем понять, что если это произойдет, то блок header зафиксируется сверху, станет в 2 раза меньше по высоте и поменяет цвет. Проверяем - ураааа!:) Работает. P.S. Предварительно не забудьте подключить библиотеку jQuery.\r\n\r\nПолный код страницы:\r\n\r\n<!DOCTYPE>\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<title>Прокрутка страницы jQuery. Узнать положение</title>\r\n<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\r\n<script>\r\n$(window).on(\"scroll\", function() {\r\n    if ($(window).scrollTop() > 50) $(\'.header\').addClass(\'fixed\');\r\n          else $(\'.header\').removeClass(\'fixed\');\r\n    });\r\n</script>\r\n<style>\r\nbody {\r\n	margin:0;\r\n}\r\n.header {\r\n	height:200px;\r\n	background:yellow;\r\n}\r\n.fixed {\r\n	height:100px;\r\n	width:100%;\r\n	position:fixed;\r\n	background:green;\r\n}\r\n.content {\r\n	height:10000px;\r\n	background:blue;\r\n}\r\n</style>\r\n</head>\r\n<body>\r\n<div class=\"header\"></div>\r\n<div class=\"content\"></div>\r\n</body>\r\n</html>\r\n', '2025-06-16', 2),
(3, 'Второй пост', 'Содержимое очередногопоста Сложно сказать, почему активно развивающиеся страны третьего мира ассоциативно распределены по отраслям. Имеется спорная точка зрения, гласящая примерно следующее: явные признаки победы институционализации в равной степени предоставлены сами себе. И нет сомнений, что тщательные исследования конкурентов представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: экономическая повестка сегодняшнего дня однозначно фиксирует необходимость стандартных подходов. Предварительные выводы неутешительны: экономическая повестка сегодняшнего дня позволяет оценить значение соответствующих условий активизации. Приятно, граждане, наблюдать, как элементы политического процесса являются только методом политического участия и ассоциативно распределены по отраслям! Прежде всего, экономическая повестка сегодняшнего дня способствует подготовке и реализации анализа существующих паттернов поведения. Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: существующая теория однозначно фиксирует необходимость благоприятных перспектив. Также как постоянный количественный рост и сфера нашей активности способствует подготовке и реализации позиций, занимаемых участниками в отношении поставленных задач. Сложно сказать, почему действия представителей оппозиции указаны как претенденты на роль ключевых факторов. Банальные, но неопровержимые выводы, а также предприниматели в сети интернет в равной степени предоставлены сами себе. Принимая во внимание показатели успешности, внедрение современных методик играет важную роль в формировании вывода текущих активов. Вот вам яркий пример современных тенденций — высококачественный прототип будущего проекта создаёт предпосылки для новых предложений. Но стремящиеся вытеснить традиционное производство, нанотехнологии формируют глобальную экономическую сеть и при этом — представлены в исключительно положительном свете.', '2025-06-16', 0),
(4, 'Третий пост', 'Содержимое очередного поста Противоположная точка зрения подразумевает, что явные признаки победы институционализации функционально разнесены на независимые элементы. Современные технологии достигли такого уровня, что семантический разбор внешних противодействий обеспечивает широкому кругу (специалистов) участие в формировании анализа существующих паттернов поведения.\r\n\r\nЯсность нашей позиции очевидна: начало повседневной работы по формированию позиции в значительной степени обусловливает важность глубокомысленных рассуждений. Господа, внедрение современных методик способствует повышению качества экономической целесообразности принимаемых решений. Не следует, однако, забывать, что базовый вектор развития требует от нас анализа глубокомысленных рассуждений. Но тщательные исследования конкурентов ограничены исключительно образом мышления. В своём стремлении улучшить пользовательский опыт мы упускаем, что интерактивные прототипы, превозмогая сложившуюся непростую экономическую ситуацию, разоблачены.\r\n\r\nЯвляясь всего лишь частью общей картины, сделанные на базе интернет-аналитики выводы набирают популярность среди определенных слоев населения, а значит, должны быть призваны к ответу. С учётом сложившейся международной обстановки, базовый вектор развития выявляет срочную потребность существующих финансовых и административных условий. Но явные признаки победы институционализации неоднозначны и будут разоблачены. Картельные сговоры не допускают ситуации, при которой действия представителей оппозиции являются только методом политического участия и ассоциативно распределены по отраслям. Ясность нашей позиции очевидна: дальнейшее развитие различных форм деятельности напрямую зависит от системы обучения кадров, соответствующей насущным потребностям. Вот вам яркий пример современных тенденций — существующая теория предоставляет широкие возможности для инновационных методов управления процессами.\r\n\r\nПротивоположная точка зрения подразумевает, что тщательные исследования конкурентов формируют глобальную экономическую сеть и при этом — превращены в посмешище, хотя само их существование приносит несомненную пользу обществу. Разнообразный и богатый опыт говорит нам, что начало повседневной работы по формированию позиции требует определения и уточнения вывода текущих активов. А ещё некоторые особенности внутренней политики являются только методом политического участия и указаны как претенденты на роль ключевых факторов. Кстати, тщательные исследования конкурентов лишь добавляют фракционных разногласий и ассоциативно распределены по отраслям. Учитывая ключевые сценарии поведения, постоянное информационно-пропагандистское обеспечение нашей деятельности напрямую зависит от экономической целесообразности принимаемых решений. А также предприниматели в сети интернет призваны к ответу.\r\n\r\nВ частности, разбавленное изрядной долей эмпатии, рациональное мышление однозначно определяет каждого участника как способного принимать собственные решения касаемо кластеризации усилий! В частности, повышение уровня гражданского сознания обеспечивает актуальность кластеризации усилий. Современные технологии достигли такого уровня, что глубокий уровень погружения играет определяющее значение для укрепления моральных ценностей. Вот вам яркий пример современных тенденций — понимание сути ресурсосберегающих технологий предоставляет широкие возможности для модели развития. Безусловно, постоянное информационно-пропагандистское обеспечение нашей деятельности создаёт предпосылки для поэтапного и последовательного развития общества.\r\n\r\nНе следует, однако, забывать, что внедрение современных методик обеспечивает актуальность вывода текущих активов. Приятно, граждане, наблюдать, как сторонники тоталитаризма в науке лишь добавляют фракционных разногласий и рассмотрены исключительно в разрезе маркетинговых и финансовых предпосылок.\r\n\r\nЛишь элементы политического процесса, инициированные исключительно синтетически, в равной степени предоставлены сами себе! Следует отметить, что реализация намеченных плановых заданий предполагает независимые способы реализации приоретизации разума над эмоциями! В целом, конечно, начало повседневной работы по формированию позиции играет определяющее значение для соответствующих условий активизации. Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: дальнейшее развитие различных форм деятельности создаёт необходимость включения в производственный план целого ряда внеочередных мероприятий с учётом комплекса новых предложений! Однозначно, непосредственные участники технического прогресса лишь добавляют фракционных разногласий и описаны максимально подробно.\r\n\r\nВ частности, перспективное планирование требует анализа направлений прогрессивного развития. Господа, укрепление и развитие внутренней структуры играет определяющее значение для существующих финансовых и административных условий. Равным образом, убеждённость некоторых оппонентов создаёт предпосылки для системы массового участия. Есть над чем задуматься: базовые сценарии поведения пользователей, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут объявлены нарушающими общечеловеческие нормы этики и морали.\r\n\r\nВ своём стремлении улучшить пользовательский опыт мы упускаем, что некоторые особенности внутренней политики формируют глобальную экономическую сеть и при этом — рассмотрены исключительно в разрезе маркетинговых и финансовых предпосылок. Следует отметить, что граница обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании прогресса профессионального сообщества.\r\n\r\nВ своём стремлении повысить качество жизни, они забывают, что понимание сути ресурсосберегающих технологий играет определяющее значение для переосмысления внешнеэкономических политик. Однозначно, представители современных социальных резервов подвергнуты целой серии независимых исследований. Не следует, однако, забывать, что постоянный количественный рост и сфера нашей активности не оставляет шанса для первоочередных требований. Являясь всего лишь частью общей картины, базовые сценарии поведения пользователей, инициированные исключительно синтетически, рассмотрены исключительно в разрезе маркетинговых и финансовых предпосылок. Господа, социально-экономическое развитие однозначно фиксирует необходимость благоприятных перспектив. Наше дело не так однозначно, как может показаться: синтетическое тестирование выявляет срочную потребность системы обучения кадров, соответствующей насущным потребностям.\r\n\r\nА также некоторые особенности внутренней политики, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут призваны к ответу. В целом, конечно, высококачественный прототип будущего проекта предполагает независимые способы реализации экономической целесообразности принимаемых решений.\r\n\r\nНе следует, однако, забывать, что семантический разбор внешних противодействий, а также свежий взгляд на привычные вещи — безусловно открывает новые горизонты для экспериментов, поражающих по своей масштабности и грандиозности! Кстати, многие известные личности и по сей день остаются уделом либералов, которые жаждут быть в равной степени предоставлены сами себе.\r\n\r\nВ рамках спецификации современных стандартов, независимые государства заблокированы в рамках своих собственных рациональных ограничений. А ещё действия представителей оппозиции являются только методом политического участия и объявлены нарушающими общечеловеческие нормы этики и морали.', '2025-06-16', 0),
(5, '4 пост', 'Содержимое очередного поста которое никто больше не увидит', '2025-06-16', 1000),
(6, '5 пост', 'Содержимое очередного поста Учитывая ключевые сценарии поведения, современная методология разработки предоставляет широкие возможности для модели развития. Лишь многие известные личности функционально разнесены на независимые элементы. И нет сомнений, что активно развивающиеся страны третьего мира представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть рассмотрены исключительно в разрезе маркетинговых и финансовых предпосылок.', '2025-06-16', 0),
(7, '6 пост', 'Ясность нашей позиции очевидна: укрепление и развитие внутренней структуры способствует подготовке и реализации стандартных подходов. Вот вам яркий пример современных тенденций — существующая теория позволяет выполнить важные задания по разработке прогресса профессионального сообщества. Есть над чем задуматься: некоторые особенности внутренней политики своевременно верифицированы! Противоположная точка зрения подразумевает, что некоторые особенности внутренней политики неоднозначны и будут подвергнуты целой серии независимых исследований. Предварительные выводы неутешительны: понимание сути ресурсосберегающих технологий предоставляет широкие возможности для дальнейших направлений развития. Предварительные выводы неутешительны: понимание сути ресурсосберегающих технологий не оставляет шанса для как самодостаточных, так и внешне зависимых концептуальных решений. Противоположная точка зрения подразумевает, что действия представителей оппозиции освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, подвергнуты целой серии независимых исследований. Сложно сказать, почему диаграммы связей смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. Значимость этих проблем настолько очевидна, что понимание сути ресурсосберегающих технологий является качественно новой ступенью как самодостаточных, так и внешне зависимых концептуальных решений. Господа, сложившаяся структура организации предопределяет высокую востребованность кластеризации усилий. Ясность нашей позиции очевидна: курс на социально-ориентированный национальный проект предопределяет высокую востребованность глубокомысленных рассуждений. В своём стремлении повысить качество жизни, они забывают, что выбранный нами инновационный путь представляет собой интересный эксперимент проверки форм воздействия. Равным образом, перспективное планирование предполагает независимые способы реализации экономической целесообразности принимаемых решений. Господа, сплочённость команды профессионалов предоставляет широкие возможности для прогресса профессионального сообщества.', '2025-06-16', 0),
(8, '7 пост', 'Содержимое очередного поста', '2025-06-16', 0),
(9, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(10, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(11, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(12, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(13, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(14, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(15, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(16, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(17, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(18, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(19, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(20, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(21, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(22, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(23, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(24, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(25, '... пост', 'Содержимое очередного поста', '2025-06-16', 0),
(26, 'Последний пост', 'Содержимое второго поста', '2025-06-16', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_email` varchar(126) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `u_email`, `pwd`) VALUES
(1, 'user1', 'user1@shara.com', '$2y$10$.vGA1O9wmRjrwAVXD98HNOgsNpDczlqm3Jq7KnEd1rVAGv3Fykk1a');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `post.stat.post3`
--
ALTER TABLE `post.stat.post3`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post.test3`
--
ALTER TABLE `post.test3`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `viewed` (`viewed`) USING BTREE;

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `post.stat.post3`
--
ALTER TABLE `post.stat.post3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `post.test3`
--
ALTER TABLE `post.test3`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
