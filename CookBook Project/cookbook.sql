-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Lis 2019, 13:41
-- Wersja serwera: 10.3.15-MariaDB
-- Wersja PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cookbook`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategorie` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`id`, `kategorie`) VALUES
(1, 'Zupy'),
(2, 'Szybki obiad'),
(3, 'Desery'),
(4, 'Vege');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `idPrzepisu` int(10) UNSIGNED NOT NULL,
  `nick` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `tresc` varchar(1500) COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `comment`
--

INSERT INTO `comment` (`id`, `idPrzepisu`, `nick`, `tresc`, `data`) VALUES
(2, 24, 'Renata', 'Idealny na vege Wielkanoc ! Polecam ', '2019-10-29 14:46:36'),
(4, 14, 'Zofia', 'Idealne na kolacje dla dzieci ', '2019-10-29 14:50:07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przepis`
--

CREATE TABLE `przepis` (
  `id` int(11) UNSIGNED NOT NULL,
  `kategoria` text COLLATE utf8_polish_ci NOT NULL,
  `nazwa_przepisu` text COLLATE utf8_polish_ci NOT NULL,
  `przygotowanie` text COLLATE utf8_polish_ci NOT NULL,
  `skladniki` varchar(1500) COLLATE utf8_polish_ci NOT NULL,
  `photo` varchar(40) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `przepis`
--

INSERT INTO `przepis` (`id`, `kategoria`, `nazwa_przepisu`, `przygotowanie`, `skladniki`, `photo`) VALUES
(1, 'zupy', 'Chłodnik', 'Warzywa umyć i osuszyć. Ogórki obrać ze skórki i zetrzeć na tarce o większych oczkach. Rzodkiewki tak samo zetrzeć. Włożyć do miski.\r\nDodać drobno poszatkowane liście sałaty, szczypiorek, koperek oraz obrany i przeciśnięty przez praskę lub drobno starty czosnek.\r\nDodać kefir, doprawić solą oraz pieprzem i wymieszać. Schłodzić w lodówce.', '2 mniejsze ogórki gruntowe\r\n4 rzodkiewki\r\n2 liście sałaty\r\n3 łyżki posiekanego szczypiorku\r\n2 łyżki posiekanego koperku\r\n1 mały ząbek czosnku\r\n500 ml kefiru (schłodzony)\r\nsól i pieprz', 'chlodnik_01_1.jpg'),
(2, 'zupy', 'Zupa jarzynowa z cukinią i soczewicą', 'W większym garnku umieścić oliwę i masło, podgrzać. Dodać obraną oraz startą na tarce marchewkę, pokrojoną w kostkę cukinię oraz obrany i starty na drobnej tarce czosnek. Mieszając podsmażać przez ok. 2 minuty.\r\nWlać gorący rosół lub bulion i zagotować. Dodać soczewicę oraz obranego i pokrojonego w kostkę ziemniaka. Doprawić solą, pieprzem i kurkumą. Przykryć i gotować przez ok. 10 minut.\r\nDodać obranego i pokrojonego w kostkę pomidora oraz posiekane różyczki brokuła lub kalafiora. Gotować przez ok. 5 minut. Pod koniec dodać tymianek lub koperek. Odstawić z ognia i po kilku minutach wymieszać ze śmietaną.', '1 łyżka oliwy + 1/2 łyżki masła\r\n1 marchewka\r\n1/2 cukinii\r\n2 ząbki czosnku\r\n2 litry rosołu lub bulionu drobiowego\r\n5 łyżek czerwonej soczewicy\r\n1 ziemniak\r\nszczypta kurkumy\r\n1/4 brokuła lub kalafiora\r\n1 pomidor\r\ntymianek lub koperek\r\n1/4 szklanki śmietanki 30%', 'jarzynowa_z_cukinia_soczewica_01.jpg'),
(3, 'zupy', 'Zupa fasolkowa', 'W garnku na oliwie i maśle poddusić pokrojoną w kosteczkę cebulę. Pora opłukać, obrać z zewnętrznych grubszych warstw i odciąć zielone końce. Pozostałą białą i jasnozieloną część przekroić wzdłuż na 4 części, opłukać je i pokroić na plasterki.\r\nDodać do garnka z cebulą i razem podsmażać przez ok. 2 minuty. Pod koniec dodać przeciśnięty przez praskę czosnek.\r\nDodać obraną i pokrojoną na cienkie plasterki marchewkę oraz pietruszkę wymieszać. Ziemniaki obrać i pokroić w kostkę. Dodać do garnka i mieszając podsmażać ok. 2 minuty..\r\nWlać gorący bulion, doprawić solą i pieprzem, dodać kurkumę i zagotować. Przykryć i gotować przez ok. 15 minut. W połowie gotowania dodać opłukaną na sitku (i rozmrożoną jeśli używamy mrożonej) zieloną fasolkę.\r\nOdstawić z ognia i dodać posiekany koperek oraz śmietanę (gęstą z kubka należy wcześniej zahartować kilkoma łyżkami zupy, natomiast słodką śmietankę z kartonika można wlać bezpośrednio do zupy).', '1 łyżka oliwy\r\n1 łyżka masła\r\n1 cebula\r\n1/2 pora\r\n1 ząbek czosnku\r\n1 marchewka\r\n1 mała pietruszka\r\n3 ziemniaki\r\n1 i 1/2 litra bulionu (drobiowego lub jarzynowego)\r\n1/2 łyżeczki kurkumy w proszku\r\n400 g fasolki szparagowej (poza sezonem mrożonej)\r\n1 łyżka posiekanego koperku\r\n200 g śmietany 18% lub 80 ml śmietanki 18% z kartonika (do zup i sosów)', 'zupa_fasolkowa_01.jpg'),
(5, 'zupy', 'Zupa brokułowa', 'W garnku na oliwie zeszklić pokrojoną w kosteczkę cebulę. Odkroić zielone liście pora. Białą i jasnozieloną część dokładnie opłukać, pokroić wzdłuż na 4 części, następnie w poprzek na plasterki. Dodać do cebuli, posolić i smażyć co chwilę mieszając przez około 3 minuty.\r\nW garnku na oliwie zeszklić pokrojoną w kosteczkę cebulę. Odkroić zielone liście pora. Białą i jasnozieloną część dokładnie opłukać, pokroić wzdłuż na 4 części, następnie w poprzek na plasterki. Dodać do cebuli, posolić i smażyć co chwilę mieszając przez około 3 minuty.\r\nWlać gorący bulion, dodać listek laurowy i ziele angielskie, zagotować. Przykryć i gotować przez ok. 10 - 15 minut aż warzywa będą miękkie.\r\nBrokuła umyć, odkroić różyczki, ładnie i zielone łodyżki pokroić na plasterki. Brokuły dodać do zupy, zmniejszyć ogień i gotować przez ok. 5 minut bez przykrycia, aż brokuł zmięknie.\r\nNa koniec dodać rozdrobniony ser topiony i mieszać aż się rozpuści. Zaprawić zupę śmietanką, dodawaną do zupy stopniowo.\r\nZupę posypać szczypiorkiem i opcjonalnie posiekaną bazylią. Można podawać np. z pieczywem.', '1 brokuł\r\n3 ziemniaki\r\n1 marchewka\r\n1 mała cebula\r\n1 por\r\n1 łyżka masła\r\n1 łyżka oliwy extra vergine\r\n1 i 1/2 litra bulionu jarzynowego lub drobiowego lub rosołu\r\n1 listek laurowy i ziele angielskie\r\n1/3 szklanki śmietanki 18% do zup i sosów z kartonika lub 1/4 szklanki śmietanki 30%\r\n100 g serka topionego (śmietankowego)\r\nszczypiorek i opcjonalnie bazylia', 'brokulowa.jpg'),
(6, 'zupy', 'Zupa rybna\r\nz kawałkami panierowanej ryby i tartymi warzywami', 'Warzywa umyć. Marchewkę, pietruszkę i selera obrać i zetrzeć na tarce o większych oczkach. Pora pokroić wzdłuż na 4 części, następnie w poprzek na plasterki. Cebulę pokroić w kosteczkę.\r\nW szerszym garnku na łyżce oliwy i łyżce masła zeszklić cebulę. Następnie dodać pora i smażyć dalej co chwilę mieszając przez ok. 2 minuty.\r\nDodać marchewkę, pietruszkę i selera. Warzywa doprawić solą i pieprzem i smażyć przez około 3 minuty. Dodać przyprawy i wymieszać.\r\nWlać gorący bulion i zagotować. Dodać przecier pomidorowy oraz pomidory (świeżego pomidora należy sparzyć, obrać ze skórki, pokroić w kosteczkę usuwając szypułki).\r\nWlać gorący bulion i zagotować. Dodać przecier pomidorowy oraz pomidory (świeżego pomidora należy sparzyć, obrać ze skórki, pokroić w kosteczkę usuwając szypułki).\r\nRybę opłukać, odciąć skórę i wyjąć ości. Pokroić w kostkę, doprawić solą i włożyć w mleko. Następnie obtoczyć w mące i krótko obsmażyć na patelni z łyżką rozgrzanego masła i łyżką oliwy.\r\nPodsmażoną rybę włożyć do garnka z zupą i gotować przez ok. 2 - 3 minuty. Dodać posiekaną bazylię lub natkę pietruszki. Podawać z pieczywem.', '500 g świeżych filetów ryby np. sandacz, halibut, miruna, sola, dorsz, łosoś pacyficzny\r\n1 i 1/2 litra bulionu jarzynowego\r\nwarzywa: 1/2 cebuli, 1 marchewka, 1 mała pietruszka, 1/4 korzenia selera, 1 mały por\r\n1 świeży pomidor (poza sezonem 1/3 puszki pomidorów)\r\nprzyprawy: sól i świeżo zmielony pieprz, 2 listki laurowe, 4 ziela angielskie, 1 łyżeczka suszonego oregano, 1/2 łyżeczki słodkiej papryki, 1/3 łyżeczki ostrej papryki\r\n1 łyżeczka koncentratu pomidorowego\r\n1 łyżka oliwy i 1 łyżka masła\r\n2 łyżki mąki pszennej\r\nkilka łyżek mleka\r\n1 łyżka posiekanej bazylii lub natki pietruszki', 'zupa_rybna.jpg'),
(7, 'szybki obiad', 'Filety drobiowe w lekkim sosie koperkowym', 'Sznycle rozbić tłuczkiem na filety o grubości ok. 1 cm. Doprawić delikatnie solą oraz pieprzem, następnie obtoczyć w mące pszennej.\r\nRozgrzać patelnię z 2 łyżkami oliwy. Obsmażyć filety z każdej strony, odłożyć na talerz.\r\nNa tę samą patelnię włożyć posiekanego pora i obraną oraz startą na tarce marchewkę. Dodać łyżeczkę masła i mieszając poddusić przez ok. 3 minuty.\r\nWlać bulion i zagotować. Dodać podsmażone filety i zanurzyć je w sosie. Przykryć pokrywą i gotować przez ok. 15 minut, w międzyczasie raz poprzewracać mięso.\r\nPod koniec dodać koperek. Można dodać 2 łyżki śmietanki, ale nie jest to konieczne.\r\n', 'ok. 600 - 800 g sznycli z filetu indyka lub kurczaka\r\n1/2 małego pora\r\n1/2 marchewki\r\n1 szklanka bulionu np. drobiowego\r\n1 łyżeczka posiekanego koperku\r\nmąka pszenna, oliwa, masło, sól i pieprz\r\nopcjonalnie - 2 łyżki śmietanki 30%', 'filety_w_sosie_koperkowym_01_0.jpg'),
(8, 'szybki obiad', 'Quinoa po meksykańsku z jednej patelni', 'Przygotować większą patelnię z pokrywą. Wlać do niej oliwę, dodać przeciśnięty przez praskę czosnek oraz pokrojoną na plasterki połowę papryczki chili. Mieszając chwilę podsmażyć.\r\nDodać surową quinoa, wlać bulion, zwiększyć ogień i dodać przyprawy, wymieszać. Doprawić solą i pieprzem.\r\nWciąż podgrzewając dodać odcedzoną kukurydzę i odcedzoną i przepłukaną fasolkę oraz pomidory z puszki. Wszystko wymieszać, przykryć i zagotować.\r\nZmniejszyć ogień i gotować pod przykryciem przez około 20 minut. Zdjąć pokrywę i wymieszać.\r\nDodać obrane i pokrojone awokado, skropić je połową limonki, posypać pokrojoną drugą połówką papryczki oraz listkami kolendry. Podawać z resztą limonki.', '1 łyżka oliwy\r\n2 ząbki czosnku\r\n1 papryczka chili\r\n1 szklanka quinoa (komosy ryżowej)\r\n1 szklanka bulionu (np. jarzynowego)\r\nprzyprawy: 1 łyżeczka słodkiej papryki, 1/2 łyżeczki ostrej papryki, 1/2 łyżeczki kminu rzymskiego\r\n1 szklanka kukurydzy\r\n1 szklanka ugotowanej czarnej fasoli (lub czerwonej z puszki)\r\n1 puszka krojonych pomidorów\r\nawokado\r\nlimonka\r\nświeża kolendra', 'quinoa_po_meksykansku.jpg'),
(9, 'szybki obiad', 'Makaron z boczkiem i cukinią', 'Makaron ugotować al dente w osolonej wodzie, odcedzić, włożyć z powrotem do garnka. Piekarnik nagrzać do 190 stopni C (jeśli danie będziemy dodatkowo zapiekać).\r\nNa dużej patelni na oliwie zeszklić pokrojonego pora. Dodać drobno starty czosnek a następnie boczek pokrojony w kostkę.\r\nSmażyć co chwilę mieszając przez ok. 5 minut, następnie dodać pokrojoną w kosteczkę cukinię i smażyć przez kolejne 5 minut.\r\nDodać posiekaną natkę pietruszki oraz śmietankę. Zagotować, doprawić solą oraz pieprzem. Dodać makaron i wymieszać.\r\nOpcjonalnie danie można dodatkowo zapiec w piekarniku. W tym celu należy je przełożyć do naczynia żaroodpornego lub blaszki. Posypać tartym serem i zapiekać bez przykrycia przez ok. 10 minut.\r\nJeśli dania nie zapiekamy, możemy posypać je serem już po nałożeniu na talerze.', '250 g makaronu świderki\r\n1 łyżka oliwy\r\n200 g boczku wędzonego\r\n1 por\r\n1 nieduża cukinia\r\n2 ząbki czosnku\r\n2 łyżki posiekanej natki pietruszki\r\n250 ml śmietanki 30% z kartonika\r\n3 łyżki tartego sera twardego typu corregio, parmezan, bursztyn', 'makaron_zapiekany_z_cukinia_boczkiem.jpg'),
(10, 'szybki obiad', 'Schab w sosie koperkowym', 'Mięso pokroić na grube plastry i rozbić (najlepiej poprosić o wystekowanie jeszcze w sklepie w specjalnej maszynie). Rozgrzać dużą patelnię, rozprowadzić po niej olej, włożyć mięso i na dużym ogniu obsmażać po 5 minut z każdej strony.\r\nW międzyczasie zagotować bulion w garnku. Włożyć w niego podsmażone mięso (można ułożyć jeden plaster na drugim), doprawić solą (ok. 1/2 łyżeczki) i pieprzem.\r\nPo zagotowaniu przykryć garnek, zmniejszyć ogień i gotować przez ok. 1 godzinę lub nieco krócej, do kruchości mięsa. W połowie czasu dodać obrany ząbek czosnku, obraną i startą marchewkę oraz pokrojoną w kosteczkę cebulę.\r\nDo ugotowanego mięsa dodać śmietankę oraz (bezpośrednio przez sitko) mąkę pszennę i ziemniaczaną. Wymieszać delikatnie i zagotować. Dodać posiekany koperek i jeszcze pogotować przez ok. 1 minutę.', 'ok. 700 g schabu bez kości (wystekowane plastry)\r\n1 łyżka oleju\r\n500 ml bulionu\r\n1 ząbek czosnku\r\n1/2 marchewki\r\n1/4 cebuli\r\n1/3 szklanki śmietanki 30%\r\npo 1 i 1/2 łyżeczki mąki pszennej i ziemniaczanej\r\n2 łyżki posiekanego koperku', 'schab_w_sosie_koperkowym1.jpg'),
(11, 'szybki obiad', 'Kurczak z warzywami', 'Filety oczyścić z kostek i błonek, pokroić wzdłuż na mniejsze porcje (każdy filet na 3 części). Doprawić solą i pieprzem.\r\nCukinię i papryki pokroić w kostkę. Cebulę w piórka. Czosnek obrać i zetrzeć.\r\nW większym garnku na łyżce oliwy poddusić cebulę, następnie dodać cukinię i papryki. Smażyć co chwilę mieszając przez ok. 5 minut. Odłożyć na talerz.\r\nDo tego samego garnka wlać dodatkową łyżkę oliwy i obsmażyć kurczaka z każdej strony, w sumie przez ok. 8 minut.\r\nDodać masło, starty czosnek oraz odłożone warzywa. Doprawić solą, pieprzem, oregano i ostrą papryczką. Wymieszać i podgrzać.\r\nWlać gorący bulion i zagotować. Przykryć i dusić przez ok. 15 minut aż mięso będzie miękkie i będzie się cząstkować.\r\nPod koniec dodać pokrojone pomidorki koktajlowe jeśli ich używamy oraz natkę i koncentrat pomidorowy.\r\nZagęścić obydwiema mąkami wsypywanymi do wywaru bezpośrednio przez sitko. Wymieszać i pogotować jeszcze 1 minutę.', '2 pojedyncze filety z kurczaka (ok. 500 g)\r\n1 mała cukinia\r\n1 czerwona papryka\r\n1 żółta papryka\r\n1 cebula\r\n1 ząbek czosnku\r\n2 łyżki oliwy\r\n1 łyżk masła\r\n1/2 łyżeczki suszonego oregano\r\nszczypta chili w płatkach lub proszku\r\n1 szklanka bulionu\r\n1 łyżeczka koncentratu pomidorowego\r\n1 łyżka posiekanej natki pietruszki\r\npo 1/2 łyżeczce mąki pszennej i ziemniaczanej\r\nopcjonalnie 4 - 5 pomidorków koktajlowych', 'kurczak_z_warzywami1.jpg'),
(12, 'szybki obiad', 'Łosoś w kremowym sosie z papryką i szpinakiem', 'Odciąć skórę z łososia, pokroić go na porcje, doprawić solą, pieprzem, natrzeć przeciśniętym przez praskę czosnkiem i obtoczyć w mące.\r\nSprawdzić czy szpinak jest gotowy do spożycia, w razie potrzeby opłukać go i dokładnie osuszyć.\r\nRozgrzać patelnię z oliwą, włożyć łososia i na nieco większym ogniu obsmażyć go z dwóch stron, po około 1 minucie (w środku ma pozostać surowy). Delikatnie odłożyć na talerz uważając aby filety się nie rozpadły.\r\nNa tę samą patelnię włożyć pokrojoną w kosteczkę cebulę oraz pokrojoną w kosteczkę czerwoną paprykę. Delikatnie posolić i smażyć przez ok. 5 minut aż warzywa się zeszklą i zmiękną.\r\nWlać śmietankę, doprawić świeżo zmielonym pieprzem, wymieszać. W powstały sos włożyć łososia, posypać koperkiem i gotować przez ok. 2 minuty.\r\nDodać szpinak i delikatnie wcisnąć go w sos. Gotować jeszcze przez pół minuty aż szpinak zmięknie. Odstawić z ognia i podawać np. z ugotowanymi ziemniakami posypanymi koperkiem.', 'ok. 400 g filetów łososia\r\n2 ząbki czosnku\r\n1 łyżka mąki pszennej\r\n1 łyżka oliwy\r\n1/2 cebuli\r\n1/2 czerwonej papryki lub 1 podłużna\r\n125 ml śmietanki 36% lub 30%\r\nok. 50 g szpinaku\r\n1 łyżka posiekanego koperku', 'losos_w_kremowym.jpg'),
(13, 'desery', 'Muffiny z truskawkami', 'Truskawki opłukać, osuszyć i pokroić na kawałki. Piekarnik nagrzać do 180 stopni C. Formę na muffiny wyłożyć 12 papilotkami.\r\nDo miski wlać roztopione masło lub olej roślinny, dodać mleko, jajka i wymieszać np. rózgą.\r\nW drugiej misce wymieszać mąkę razem z proszkiem do pieczenia i cukrem.\r\nWlać składniki z pierwszej miski i delikatnie wymieszać łyżką (tylko do czasu gdy nie będzie widać surowej mąki, nie można mieszać zbyt długo). Pod koniec dodać truskawki i delikatnie wymieszać.\r\nNałożyć równe porcje ciasta do papilotek i wstawić do nagrzanego piekarnika. Piec przez ok. 25 minut.\r\nPo przestudzeniu można polać polewą: roztopić czekoladę i wymieszać z jogurtem. Udekorować plasterkami truskawek i miętą.', '250 g truskawek\r\n100 g roztopionego masła lub oleju roślinnego\r\n125 ml mleka\r\n2 jajka\r\n250 g mąki pszennej\r\n2 łyżeczki proszku do pieczenia\r\n170 g cukru', 'muffiny_z_truskawkami.jpg'),
(14, 'desery', 'Placki twarogowe', 'Do miski włożyć twaróg, dodać żółtka (białka zachować) i rozgnieść praską lub widelcem z dodatkiem cukru wanilinowego i cukru pudru. Dodać mąkę (w przypadku rzadszego sera można dodać jej więcej) i dokładnie wymieszać.\r\nBiałka ubić na sztywną pianę i dodać do masy twarogowej, połączyć składniki delikatnie mieszając łyżką.\r\nNakładać porcje ciasta (po ok. 2 łyżki) na rozgrzaną, suchą patelnię (np. teflonową, naleśnikową) i rozprowadzić je po powierzchni formując kształtnego placka. Smażyć partiami.\r\nZmniejszyć ogień do minimum i smażyć przez ok. 3 minuty lub aż od spodu będą delikatnie zrumienione na złoto. Przewrócić na drugą stronę i powtórzyć smażenie przez ok. 2 minuty.\r\nOdkładać na talerz, następnie umyć patelnię lub przetrzeć wilgotną ściereczką i powtórzyć smażenie placków z reszty ciasta.', '250 g twarogu\r\n3 jajka\r\n1 łyżka cukru wanilinowego\r\n1 łyżka cukru pudru\r\n3 czubate łyżki mąki', 'placki_twarogowe.jpg'),
(15, 'desery', 'Prosta szarlotka', 'Niedużą foremkę o wymiarach ok. 21 x 25 cm lub tortownicę o średnicy 24 cm posmarować masłem i wyłożyć papierem do pieczenia.\r\nZagnieść ciasto kruche: do mąki dodać pokrojone w kosteczkę masło oraz smalec, proszek do pieczenia, cukier i cukier wanilinowy. Siekać składniki lub rozdrabniać dłońmi lub mieszadłem miksera na drobną kruszonkę.\r\nDodać jajko i połączyć składniki w jednolite ciasto. Zawinąć w folię i włożyć do lodówki.\r\nJabłka obrać, pokroić na ćwiartki i wyciąć gniazda nasienne. Pokroić na plasterki i włożyć do garnka. Dodać cynamon i podgrzewać pod przykryciem przez ok. 10 - 15 minut aż jabłka zmiękną i się rozpadną, w międzyczasie od czasu do czasu zamieszać. Można doprawić cukrem jeśli jabłka są bardzo kwaśne.\r\nPiekarnik nagrzać do 180 stopni C. Rozwałkować połowę ciasta podsypując mąką (lub pokroić nożem na plasterki) i wylepić spód formy. Dodać jabłka a na nich położyć drugą część rozwałkowanego ciasta (lub startego na tarce lub pokrojonego na plasterki). Wstawić do piekarnika i piec przez ok. 35 - 40 minut na złoty kolor. Posypać cukrem pudrem.', '300 g mąki pszennej\r\n200 g masła (zimnego) lub masła roślinnego, margaryny\r\n50 g smalcu (lub masła)\r\n1,5 łyżeczki proszku do pieczenia\r\n70 g cukru\r\n1 op. cukru wanilinowego\r\n1 jajko\r\n1,5 kg jabłek\r\n1/2 łyżeczki cynamonu\r\ncukier puder', 'szarlotka_01.jpg'),
(16, 'desery', 'Brownie z malinami', 'Piekarnik nagrzać do 160 stopni C. Przygotować małą prostokątną foremkę o wymiarach 21 cm x 28 cm (lub innej o takiej samej powierzchni np. 24 x 24 cm), natłuścić ją masłem i wyłożyć papierem do pieczenia.\r\nMasło włożyć do rondelka i na minimalnym ogniu roztopić. Dodać obydwie czekolady połamane na kosteczki (2 kosteczki zachować do starcia, na wierzch ciasta) i cały czas mieszając roztopić, odstawić z ognia.\r\nW oddzielnej misce rozmiksować lub wymieszać rózgą jajka z cukrem. Dodać do nich roztopioną czekoladę z masłem i zmiksować lub wymieszać rózgą na gładką masę.\r\nDodać mąkę oraz sól i zmiksować na jednolite ciasto. Wyłożyć do przygotowanej blaszki, wierzch posypać startą na drobnej tarce odłożoną czekoladą.\r\nUłożyć maliny delikatnie wciskając je w ciasto.\r\nWstawić do piekarnika i piec przez ok. 35 minut, aż ciasto delikatnie urośnie. Po upieczeniu i ostudzeniu pokroić na małe kawałeczki i udekorować świeżymi malinami. Można podawać z bitą śmietaną.', '200 g masła\r\n100 g czekolady gorzkiej\r\n100 g czekolady lekko gorzkiej (lub gorzkiej)\r\n3 jajka\r\n250 g cukru\r\n140 g mąki\r\nmała szczypta soli\r\nok. 200 g malin', 'brownie_z_malinami.jpg'),
(17, 'desery', 'Puszyste ciasto z morelami', 'Morele pokroić na ćwiartki, usunąć pestki. Miękkie masło ubić na puszysto, następnie dodawać stopniowo żółtka i cukier puder cały czas dokładnie i długo ubijając.\r\nW oddzielnej misce połączyć przesianą mąkę pszenną, proszek do pieczenia i cukier wanilinowy. Dodać do ubitej masy i dokładnie zmiksować do połączenia się składników.\r\nBiałka ubić na sztywną pianę i dodać do masy, delikatnie wymieszać szpatułką. Wyłożyć do niedużej formy o wymiarach ok. 21 x 25 cm lub tortownicy o średnicy 24 cm.\r\nNa wierzchu rozłożyć kawałki moreli. Wstawić do piekarnika nagrzanego do 180 stopni C i piec przez ok. 35 minut (do suchego patyczka). Ostudzić i posypać cukrem pudrem.', '400 g moreli\r\n200 g masła (w temp. pokojowej)\r\n4 jajka (w temp. pokojowej)\r\n150 g cukru pudru\r\n200 g mąki pszennej\r\n1 łyżeczka proszku do pieczenia\r\n1 łyżka cukru wanilinowego\r\ncukier puder do posypania', 'ciasto_z_morelami.jpg'),
(18, 'desery', 'Ciasto wiewiórka', 'Piekarnik nagrzać do 180 stopni C. Jajka ocieplić w temperaturze pokojowej. Mąkę przesiać do miski, dodać proszek do pieczenia, sodę i szczyptę soli, wymieszać.\r\nRodzynki i żurawinę zalać wrzątkiem i odcedzić na sitku po 10 minutach moczenia.\r\nOrzechy i czekoladę posiekać na kawałeczki.\r\nJabłka obrać i zetrzeć na tarce o dużych oczkach, wymieszać z cynamonem.\r\nJajka ubić z drobnym cukrem lub cukrem pudrem na bardzo puszystą, jasną masę (ok. 10 minut na średnich obrotach miksera). Cały czas ubijając dodać stopniowo roztopione i ostudzone masło.\r\nMąkę z proszkiem do pieczenia, sodą i solą przesiać bezpośrednio do miski z jajkami i zmiksować na minimalnych obrotach miksera, tylko do połączenia się składników.\r\nDodać jabłka, orzechy, rodzynki oraz czekoladę, delikatnie wymieszać łyżką.\r\nFormę o wymiarach około 20 x 30 cm lub tortownicę 30 cm wyścielić papierem do pieczenia, wyłożyć ciasto i wstawić do piekarnika. Piec przez ok. 40 minut (do suchego patyczka).', '4 jajka\r\n2 szklanki mąki\r\n1 łyżeczka proszku do pieczenia\r\n1 łyżeczka sody oczyszczonej\r\n50 g rodzynek\r\n50 g suszonej żurawiny\r\n1 szklanka orzechów włoskich\r\n100 g ciemnej czekolady\r\n4 jabłka\r\n2 łyżeczki cynamonu\r\n3/4 szklanki drobnego cukru lub cukru pudru\r\n5 - 6 łyżek stopionego masła', 'ciasto_wiewiorka.jpg'),
(19, 'vege', 'Smalec z fasoli', 'Fasolę odcedzić zachowując kilka łyżek zalewy. Cebulę obrać i pokroić w kosteczkę, wrzucić na patelnię z olejem i co chwilę mieszając smażyć przez ok. 10 minut, aż cebula zeszkli się, zmięknie, a na koniec lekko się zrumieni. W międzyczasie cebulę posolić i doprawić pieprzem.\r\nDodać do fasoli i całość rozgnieść praską do ziemniaków lub widelcem (nie używamy blendera aby nie zrobiła się \"ciapa\"). W razie potrzeby można dodać trochę zachowanej zalewy gdyby pasta wyszła za sucha.', '1 puszka 400 g białej fasoli lub 250 g fasoli ugotowanej\r\n1 duża cebula\r\n2 łyżki oleju roślinnego\r\nsól i pieprz', 'smalec_z_fasoli.jpg'),
(20, 'vege', 'Tagine z bakłażana', 'Bakłażana pokroić na grubsze plastry, następnie każdy plaster przekroić na pół. Rozgrzać większą patelnię z 1 łyżką oliwy. Włożyć bakłażana i obsmażać z każdej strony, aż się zrumieni z zewnątrz, ale w środku pozostanie jeszcze jędrny.\r\nBakłażana pokroić na grubsze plastry, następnie każdy plaster przekroić na pół. Rozgrzać większą patelnię z 1 łyżką oliwy. Włożyć bakłażana i obsmażać z każdej strony, aż się zrumieni z zewnątrz, ale w środku pozostanie jeszcze jędrny.\r\nDodać sok z cytryny, obranego i pokrojonego w kostkę pomidora oraz wędzoną paprykę, szafran, cukier i pokrojone na połówki suszone morele. Wlać bulion, wymieszać i zagotować.\r\nDodać podsmażonego bakłażana, zanurzyć go w sosie, przykryć i gotować przez ok. 20 minut do miękkości. Następnie zdjąć pokrywę i gotować 2 - 3 minuty aż sos się trochę wygotuje.\r\nPodawać na kuskusie lub kaszy bulgur, z fasolką lub śmietaną / jogurtem oraz miętą.', '1 większy bakłażan\r\n2 łyżki oliwy\r\n1 cebula\r\n1 łyżka soku z cytryny\r\n1 pomidor\r\n1 łyżeczka wędzonej papryki w proszku\r\nszczypta szafranu\r\nszczypta cukru\r\n6 suszonych moreli\r\n125 ml bulionu\r\ndo podania: kuskus lub bulgur, mięta lub natka pietruszki, jogurt, śmietana lub fasolka', 'tagine_z_baklazana.jpg'),
(21, 'vege', 'Gołąbki z soczewicą, pieczarkami, warzywami i ryżem', 'Ryż ugotować zgodnie z instrukcją na opakowaniu, skracając czas gotowania o ok. 5 minut. Ostudzić i włożyć do miski.\r\nSoczewicę zalać 1 szklanką wody, doprawić solą i zagotować. Przykryć i gotować przez ok. 15 minut do miękkości. Następnie dodać paprykę słodką i ostrą oraz kurkumę, wymieszać, odparować i ostudzić, dodać do ryżu.\r\nDodać suchą kaszę bulgur lub jęczmienną, wbić jajko i wymieszać.\r\nCebulę obrać, pokroić w kosteczkę i zeszklić na 1 łyżce oliwy. Dodać drobno pokrojonego pora i mieszając smażyć przez kilka minut, następnie dodać obraną i startą marchewkę i powtórzyć smażenie, w międzyczasie doprawić warzywa solą i pieprzem. Ostudzić.\r\nPieczarki pokroić i smażyć przez ok. 10 minut na maśle, aż całkowicie odparują i zrumienią się, pod koniec dodać posiekaną natkę pietruszki. Ostudzić i posiekać drobniej na desce lub rozdrobnić w melakserze, połączyć z resztą składników.\r\nWyciąć głąb ze środka kapusty, następnie włożyć ją do dużego garnka z wrzątkiem (wyciętą stroną do dołu), gotować przez około 10 minut na małym ogniu. Wyjąć z wrzątku i po przestudzeniu rozebrać kapustę z liści.\r\nNakładać podłużne porcje farszu na liście i zwijać gołąbki. Układać je do szerokiego garnka lub naczynia żaroodpornego wyłożonego pozostałymi liścimi kapusty (np. porwanymi).\r\nZagotować bulion w innym garnku i zalać nim gołąbki. Postawić na gazie, przykryć i gotować na małym ogniu przez około 30 minut lub piec w piekarniku pod przykryciem przez 30 minut w 180 stopniach C. W czasie gotowania nie mieszać.\r\nWywar z gołąbków przelać do innego garnka. Dodać przecier pomidorowy, koncentrat pomidorowy, sos worcestershire, suszone oregano, zioła prowansalskie oraz mąkę uprzednio rozmieszaną z kilkoma łyżkami zimnej wody. Zagotować, w razie potrzeby doprawić solą i pieprzem. Gotować przez ok. 10 minut bez przykrycia.\r\nPrzelać z powrotem do garnka z gołąbkami, dodać posiekany koperek i gotować całość przez kilka minut na małym ogniu, można potrząsnąć garnkiem aby sos równomiernie się rozprowadził.', '1 kapusta włoska\r\n100 g ryżu\r\n50 g kaszy bulgur lub jęczmiennej\r\n1/2 szklanki czerwonej soczewicy\r\n1 mała cebula, por i marchewka\r\n250 g pieczarek\r\n2 gałązki natki pietruszki\r\n1 jajko\r\n1,25 litra bulionu\r\n250 ml przecieru pomidorowego z butelki + 2 łyżki koncentratu\r\n1 łyżka sosu worcestershire\r\n2 łyżki posiekanego koperku\r\n1 łyżka mąki pszennej, oliwa, masło\r\nprzyprawy: 1 łyżeczka czerwonej papryki słodkiej, 1/2 łyżeczki ostrej, 1 łyżeczka kurkumy, 1 łyżka suszonego oregano, 1 łyżka ziół prowansalskich, sól i pieprz', 'golabki_warzywne.jpg'),
(22, 'vege', 'Pasztet wegetariański', 'Cebulę obrać i pokroić w kosteczkę, zeszklić w garnku na oliwie. Dodać posiekany czosnek, obraną i pokrojoną na cienkie plasterki marchewkę oraz imbir. Smażyć przez ok. 2 - 3 minuty.\r\nWlać 250 ml bulionu i gotować pod przykryciem przez ok. 15 minut. Następnie dodać resztę bulionu, suchą soczewicę oraz suchą kaszę jaglaną, doprawić solą, pieprzem, papryką w proszku i kurkumą.\r\nGotować przez ok. 15 minut, aż składniki będą miękkie i wchłoną cały płyn. W razie potrzeby odparować. Dokładnie ostudzić.\r\nOdcedzoną ciecierzycę zmiksować blenderem razem z masłem migdałowym lub orzechowym jeśli ich używamy. Dodać ugotowane warzywa z kaszą jaglaną, zmiksować (można w melakserze). Na koniec dodać jajka i dokładnie wymieszać.\r\nPiekarnik nagrzać do 180 stopni C. Formę keksową wyłożyć papierem do pieczenia, napełnić masą i piec przez ok. 1 godzinę. Ostudzić przed pokrojeniem.', '500 g marchewki\r\n1/3 suchej szklanki kaszy jaglanej\r\n1 szklanka suchej czerwonej soczewicy\r\n250 g ciecierzycy z puszki lub ugotowanej z ok. 125 g suchej\r\n1 cebula\r\n2 łyżki oliwy\r\n1 ząbek czosnku\r\n650 ml bulionu jarzynowego\r\n2 jajka\r\nPrzyprawy: 1 łyżka startego imbiru, 1/3 łyżeczki ostrej papryki w proszku, 1/2 łyżeczki słodkiej papryki, 1/2 łyżeczki kurkumy, opcjonalnie - 3 łyżki masła migdałowego lub orzechowego', 'pasztet_vege.jpg'),
(23, 'vege', 'Wegetariańskie burgery z grillowanym serem halloumi', 'Przygotować bułeczki hamburgerowe. Plasterki obranego ananasa położyć na rozgrzanej patelni grillowej i grillować po około 7 minut z każdej strony.\r\nSer halloumi pokroić na plasterki, obtoczyć w oliwie i grillować po ok. 5 minut z każdej strony, w połowie smażenia podważyć ser łopatką i przewrócić na drugą stronę.\r\nBułeczki przekroić i zrumienić w miejscu rozcięcia (np. na tosterze lub na patelni grillowej). Górną połówkę posmarować musztardą, spód grubszą warstwą ajvaru wymieszanego z łyżeczką majonezu (można też doprawić chili).\r\nW wersji dodatków nr 1 na spodzie bułki ułożyć liście sałaty, plaster ananasa, halloumi i czerwoną cebulę.\r\nW wersji dodatków nr 2 na spodzie bułki ułożyć rukolę, plasterek pomidora, halloumi i pastę z lekko rozgniecionego awokado doprawionego solą, pieprzem i czosnkiem.\r\nPrzykryć drugą połówką bułki i podawać.', 'bułeczki hamburgerowe\r\n250 g sera halloumi (do grillowania)\r\najvar\r\nmusztarda\r\nmajonez\r\nulubione dodatki', 'burger_vege.jpg'),
(24, 'vege', 'Żurek wegetariański', 'Warzywa obrać, opłukać, podzielić na mniejsze kawałki. Włożyć do garnka, wlać 2 litry wody i zagotować. Dodać ziela angielskie, liście i pieprz, 2 ząbki czosnku, suszonego grzyba oraz łyżeczkę soli morskiej. Garnek przykryć i gotować na małym ogniu przez około 45 minut. Pod koniec gotowania dodać pół pęczka natki pietruszki. Następnie wywar przecedzić, z warzyw zachować marchewkę.\r\nWywar postawić na ogniu, doprawić świeżo zmielonym pieprzem, majerankiem, przepołowionym ząbkiem czosnku i szczyptą cukru. Dodać olej roślinny. Butelkę z zakwasem wstrząsnąć aby mąka z dna się wymieszała, odmierzyć 250 ml i dodać do wywaru (można na początek dodać mniej, później dolać więcej, do smaku). Zagotować, zmniejszyć ogień i gotować przez około 2 minuty na małym ogniu.\r\nOdstawić z ognia, dodać posiekane liście natki oraz doprawić zupę chrzanem. Dodać pokrojoną na plasterki marchewkę z wywaru. Jeśli dodajemy tofu, kroimy je w kosteczkę i dodajemy razem z zakwasem. Na koniec zaprawiamy żurek śmietaną, uprzednio wymieszaną ze stopniowo dodawanymi łyżkami zupy. Podawać z ulubionymi dodatkami.', '1 cała włoszczyzna\r\nprzyprawy: 3 ziela angielskie, 3 liście laurowe, 5 ziaren pieprzu, 2 łyżeczki majeranku\r\n3 ząbki czosnku\r\nkawałek suszonego grzybka\r\npęczek natki pietruszki\r\n1,5 łyżki oleju roślinnego\r\n250 ml żurku (zakwasu)\r\n1 łyżeczka chrzanu ze słoiczka lub 1 łyżka świeżego\r\n100 g śmietany 18%', 'zurek_wegetarianski.jpg'),
(55, 'Zupy', 'dobree', 'ghgj', 'jgcjc', 'burger_vege.jpg');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPrzepisu` (`idPrzepisu`);

--
-- Indeksy dla tabeli `przepis`
--
ALTER TABLE `przepis`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `przepis`
--
ALTER TABLE `przepis`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idPrzepisu`) REFERENCES `przepis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
