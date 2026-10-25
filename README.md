SQL OD ZERA - BAZA "HURTOWNIA"
Zadania dla poczatkujacych. MySQL / phpMyAdmin.

Imie i nazwisko: Stanislav Solovei  Klasa: 3KL

JAK PRACOWAC

1. Uruchom XAMPP Control Panel, wlacz Apache i MySQL.
2. Wejdz na adres: http://localhost/phpmyadmin
3. Po lewej stronie kliknij baze hurtownia.
4. Zakladka SQL, wpisz zapytanie, nacisnij Wykonaj.

W nawiasie przy kazdym zadaniu podana jest liczba wierszy, ktora powinna wyjsc.
Jesli sie zgadza, przechodz dalej. Jesli nie, poszukaj bledu.

Swoje zapytania zapisuj w osobnym pliku tekstowym, bo okno w phpMyAdmin
czysci sie po kazdym uruchomieniu.

CO JEST W BAZIE

produkty      id_prod, nazwa, cena, kategoria
sprzedawcy    id_sprz, imie, nazwisko, miasto
sprzedaz      id_sprzedazy, id_prod, id_sprz, ilosc, data_sp

Tabela sprzedaz laczy dwie pozostale: kolumna id_prod mowi, jaki produkt
sprzedano, a id_sprz mowi, kto go sprzedal.

CZESC A. PIERWSZE ZAPYTANIA

A1.  Wyswietl wszystko, co jest w tabeli produkty.                  (12 wierszy)

A2.  Wyswietl wszystko z tabeli sprzedawcy.                          (6 wierszy)

A3.  Wyswietl wszystko z tabeli sprzedaz.                           (20 wierszy)

A4.  Wyswietl tylko nazwy produktow, bez pozostalych kolumn.        (12 wierszy)

A5.  Wyswietl nazwy i ceny produktow.                               (12 wierszy)

A6.  Wyswietl imiona i nazwiska sprzedawcow tak, zeby kolumny
     nazywaly sie na ekranie Imie i Nazwisko.                        (6 wierszy)
     Podpowiedz: SELECT imie AS Imie, ...

CZESC B. WYBIERANIE WIERSZY, CZYLI WHERE

B1.  Wyswietl produkty z kategorii nabial.                           (3 wiersze)

B2.  Wyswietl produkty tansze niz 5 zl.                              (4 wiersze)

B3.  Wyswietl produkty drozsze lub rowne 6 zl.                       (5 wierszy)

B4.  Wyswietl produkty, ktore kosztuja od 5 do 8 zl wlacznie.        (6 wierszy)

B5.  To samo co B4, ale uzyj slowa BETWEEN.                          (6 wierszy)

B6.  Wyswietl produkty z kategorii napoje albo pieczywo.             (4 wiersze)

B7.  To samo co B6, ale uzyj slowa IN.                               (4 wiersze)

B8.  Wyswietl produkty z kategorii sypkie, ktore kosztuja
     mniej niz 6 zl.                                                 (2 wiersze)

B9.  Wyswietl sprzedawcow z Gdanska.                                 (2 wiersze)

B10. Wyswietl sprzedawcow, ktorzy nie mieszkaja w Toruniu.           (4 wiersze)
     Podpowiedz: nierownosc zapisuje sie jako <> albo !=

B11. Wyswietl produkty, ktorych nazwa zaczyna sie na litere M.       (3 wiersze)
     Podpowiedz: WHERE nazwa LIKE 'M%'
     Znak procenta zastepuje dowolny ciag znakow.

B12. Wyswietl produkty, ktorych nazwa zawiera slowo pszenna.          (1 wiersz)

B13. Wyswietl produkt, ktory nie ma podanej ceny.                     (1 wiersz)
     UWAGA: zapis WHERE cena = NULL nie zadziala i nie zglosi bledu,
     tylko zwroci pusty wynik. NULL to nie wartosc, tylko brak wartosci,
     wiec nie da sie go z niczym porownac. Sluzy do tego IS NULL.

B14. Wyswietl transakcje, w ktorych sprzedano wiecej niz 4 sztuki.   (7 wierszy)

B15. Wyswietl transakcje z 10 marca i pozniej.                       (9 wierszy)
     Podpowiedz: date zapisujemy w apostrofach: '2026-03-10'

CZESC C. PORZADKOWANIE WYNIKOW

C1.  Wyswietl produkty posortowane po cenie od najtanszego.         (12 wierszy)

C2.  To samo, ale od najdrozszego.                                  (12 wierszy)
     Podpowiedz: ORDER BY cena DESC

C3.  Wyswietl sprzedawcow posortowanych po nazwisku alfabetycznie.   (6 wierszy)

C4.  Wyswietl trzy najdrozsze produkty.                              (3 wiersze)
     Podpowiedz: ORDER BY plus LIMIT

C5.  Wyswietl trzy najtansze produkty. Zobacz, co wyladowalo
     na pierwszym miejscu, i zastanow sie dlaczego.                  (3 wiersze)

C6.  Wyswietl liste kategorii, kazda tylko raz.                      (5 wierszy)
     Podpowiedz: SELECT DISTINCT ...

C7.  Wyswietl liste miast, w ktorych mieszkaja sprzedawcy,
     kazde tylko raz.                                                (4 wiersze)

C8.  Wyswietl produkty z kategorii sypkie, posortowane
     po cenie malejaco.                                              (4 wiersze)

CZESC D. LICZENIE

W tej czesci wynikiem jest zwykle jedna liczba, a nie lista.

D1.  Policz, ile jest produktow w bazie.                             (wynik: 12)
     Podpowiedz: SELECT COUNT(*) FROM produkty;

D2.  Policz, ilu jest sprzedawcow.                                    (wynik: 6)

D3.  Policz, ile transakcji jest w bazie.                            (wynik: 20)

D4.  Policz, ile produktow nalezy do kategorii nabial.                (wynik: 3)

D5.  Podaj cene najdrozszego produktu.                            (wynik: 22.00)

D6.  Podaj cene najtanszego produktu.                              (wynik: 1.20)

D7.  Policz, ile sztuk towaru sprzedano lacznie.                    (wynik: 104)

D8.  Podaj srednia cene produktu.                     (wynik okolo 6.5636363636)

D9.  To samo co D8, ale zaokraglij wynik do dwoch miejsc
     po przecinku.                                                 (wynik: 6.56)
     Podpowiedz: ROUND(AVG(cena), 2)

D10. Policz, ile transakcji przeprowadzil sprzedawca o numerze 1.      (wynik: 5)

CZESC E. GRUPOWANIE

Grupowanie to liczenie osobno dla kazdej wartosci.

E1.  Policz, ile produktow jest w kazdej kategorii.                  (5 wierszy)
     Podpowiedz: SELECT kategoria, COUNT(*) FROM produkty
                 GROUP BY kategoria;

E2.  Podaj srednia cene w kazdej kategorii.                          (5 wierszy)

E3.  Policz, ilu sprzedawcow mieszka w kazdym miescie.               (4 wiersze)

E4.  Policz, ile transakcji przeprowadzil kazdy sprzedawca.
     Wystarczy numer, bez nazwiska.                                  (5 wierszy)
     Zastanow sie, dlaczego wyszlo piec wierszy,
     skoro sprzedawcow jest szesciu.

E5.  Dla kazdego produktu policz, ile razy sie sprzedal.
     Wystarczy numer produktu.                                      (10 wierszy)

CZESC F. DWIE TABELE NARAZ

Tu zaczyna sie wlasciwy SQL. Na razie dwa zadania, zeby zobaczyc, o co chodzi.

F1.  Przepisz i uruchom ponizsze zapytanie.                         (20 wierszy)

     SELECT sprzedaz.id_sprzedazy, produkty.nazwa, sprzedaz.ilosc
     FROM sprzedaz
     JOIN produkty ON sprzedaz.id_prod = produkty.id_prod;

     W linii po slowie ON mowimy bazie, po czym ma polaczyc wiersze
     z obu tabel.

F2.  Zrob to samo, ale zamiast nazwy produktu pokaz nazwisko
     sprzedawcy.                                                    (20 wierszy)

F3.  Polacz wszystkie trzy tabele: pokaz nazwe produktu,
     nazwisko sprzedawcy, ilosc i date.                             (20 wierszy)
     Podpowiedz: drugie zlaczenie dopisujesz jako kolejna linie JOIN.

NA KONIEC

Zapisz swoje zapytania i pokaz nauczycielowi. Przy sprawdzaniu liczy sie to,
czy zapytanie dziala i czy zwraca to, o co pytano, a nie dlugosc kodu.
