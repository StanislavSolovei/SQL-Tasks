-- ===========================================================================
-- BAZA CWICZENIOWA "HURTOWNIA"  -  wersja dla MySQL / MariaDB
--
-- Jak uruchomic:
--   phpMyAdmin: zakladka SQL, wklej calosc, przycisk Wykonaj.
--   Visual Studio Code: rozszerzenie SQLTools + sterownik MySQL,
--   szczegoly w pliku README.md
--
-- Baza zawiera celowo przygotowane pulapki:
--   - dwa produkty, ktorych nigdy nie sprzedano
--   - jeden sprzedawca, ktory nic nie sprzedal
--   - jeden produkt bez podanej nazwy i ceny (wartosci NULL)
-- ===========================================================================

-- Ustawiamy kodowanie polaczenia. Bez tej linii polskie znaki moga sie
-- zepsuc przy wczytywaniu skryptu z wiersza polecen albo przez import pliku.
-- W phpMyAdmin dzieje sie to automatycznie, ale lepiej miec to w pliku.
SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS hurtownia
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_polish_ci;

USE hurtownia;

-- Kasujemy tabele, gdyby skrypt byl uruchamiany ponownie.
-- Kolejnosc ma znaczenie: najpierw tabela, ktora odwoluje sie do innych.
DROP TABLE IF EXISTS sprzedaz;
DROP TABLE IF EXISTS produkty;
DROP TABLE IF EXISTS sprzedawcy;

-- ---------------------------------------------------------------------------
-- TABELE
-- ---------------------------------------------------------------------------

CREATE TABLE produkty (
    -- AUTO_INCREMENT: baza sama nadaje kolejne numery.
    id_prod   INT AUTO_INCREMENT PRIMARY KEY,
    nazwa     VARCHAR(60),
    -- DECIMAL(6,2) to liczba o dokladnie dwoch miejscach po przecinku.
    -- Do cen nigdy nie uzywamy typu FLOAT, bo zaokragla niedokladnie.
    cena      DECIMAL(6,2),
    kategoria VARCHAR(40)
);

CREATE TABLE sprzedawcy (
    id_sprz  INT AUTO_INCREMENT PRIMARY KEY,
    imie     VARCHAR(60) NOT NULL,
    nazwisko VARCHAR(60) NOT NULL,
    miasto   VARCHAR(60)
);

CREATE TABLE sprzedaz (
    id_sprzedazy INT AUTO_INCREMENT PRIMARY KEY,
    id_prod      INT  NOT NULL,
    id_sprz      INT  NOT NULL,
    ilosc        INT  NOT NULL,
    data_sp      DATE NOT NULL,

    -- KLUCZ OBCY: wartosc w tej kolumnie musi istniec w tabeli produkty.
    -- Dzieki temu nie da sie zapisac sprzedazy nieistniejacego produktu.
    CONSTRAINT sprzedaz_produkty_fk FOREIGN KEY (id_prod) REFERENCES produkty (id_prod),
    CONSTRAINT sprzedaz_sprzedawcy_fk FOREIGN KEY (id_sprz) REFERENCES sprzedawcy (id_sprz)
);

-- ---------------------------------------------------------------------------
-- DANE
-- ---------------------------------------------------------------------------

INSERT INTO produkty (id_prod, nazwa, cena, kategoria) VALUES
    (1,  'Masło',            8.00,  'nabiał'),
    (2,  'Mleko',            4.50,  'nabiał'),
    (3,  'Ser żółty',        22.00, 'nabiał'),
    (4,  'Woda niegazowana', 2.00,  'napoje'),
    (5,  'Sok pomarańczowy', 7.50,  'napoje'),
    (6,  'Mąka pszenna',     4.00,  'sypkie'),
    (7,  'Cukier',           5.50,  'sypkie'),
    (8,  'Ryż',              6.00,  'sypkie'),
    (9,  'Chleb',            5.00,  'pieczywo'),
    (10, 'Bułka',            1.20,  'pieczywo');

-- Produkt bez nazwy i bez ceny. Sluzy do cwiczenia wartosci NULL.
INSERT INTO produkty (id_prod) VALUES (11);

-- Produkt, ktorego nigdy nie sprzedano. Potrzebny do zadania o LEFT JOIN.
INSERT INTO produkty (id_prod, nazwa, cena, kategoria) VALUES
    (12, 'Kasza gryczana', 6.50, 'sypkie');

INSERT INTO sprzedawcy (id_sprz, imie, nazwisko, miasto) VALUES
    (1, 'Weronika', 'Jankowska',   'Toruń'),
    (2, 'Mateusz',  'Wiśniewski',  'Gdańsk'),
    (3, 'Jakub',    'Chmielewski', 'Warszawa'),
    (4, 'Patryk',   'Nowak',       'Gdynia'),
    (5, 'Anna',     'Lewandowska', 'Gdańsk'),
    -- Ten sprzedawca nic nie sprzedal. Potrzebny do zadania 1b.
    (6, 'Tomasz',   'Zielinski',   'Toruń');

INSERT INTO sprzedaz (id_sprzedazy, id_prod, id_sprz, ilosc, data_sp) VALUES
    (1,  1,  3, 2, '2026-03-02'),
    (2,  2,  1, 5, '2026-03-02'),
    (3,  2,  4, 3, '2026-03-03'),
    (4,  4,  4, 10, '2026-03-03'),
    (5,  5,  2, 4, '2026-03-04'),
    (6,  1,  1, 1, '2026-03-05'),
    (7,  9,  5, 6, '2026-03-05'),
    (8,  10, 5, 20, '2026-03-06'),
    (9,  3,  2, 2, '2026-03-06'),
    (10, 6,  1, 4, '2026-03-09'),
    (11, 7,  3, 3, '2026-03-09'),
    (12, 2,  2, 6, '2026-03-10'),
    (13, 9,  4, 2, '2026-03-10'),
    (14, 5,  5, 1, '2026-03-11'),
    (15, 1,  2, 3, '2026-03-12'),
    (16, 10, 1, 15, '2026-03-12'),
    (17, 8,  3, 2, '2026-03-13'),
    (18, 2,  5, 4, '2026-03-13'),
    (19, 4,  1, 8, '2026-03-16'),
    (20, 9,  2, 3, '2026-03-16');

-- ---------------------------------------------------------------------------
-- SPRAWDZENIE
-- ---------------------------------------------------------------------------

SELECT 'produkty' AS tabela, COUNT(*) AS wierszy FROM produkty
UNION ALL
SELECT 'sprzedawcy', COUNT(*) FROM sprzedawcy
UNION ALL
SELECT 'sprzedaz', COUNT(*) FROM sprzedaz;
