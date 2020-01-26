# wsb-style
Klasa i styl bibliografii pracy inżynierskiej dla Wyższej Szkoły Bankowej w Gdańsku, kompatybilny z LuaTeX\
[Przykładowy plik pdf wyrenderowany z użyciem tego stylu](https://github.com/nawordar/wsb-style/blob/master/sample/sample.pdf).

## Notice
As of now, only Polish is supported. The standards for English language theses are still not clearly defined.

## Instalacja
Do użycia tego stylu wymagany jest silnik LaTeXa LuaTeX.\
Na systemach operacyjnych z zainstalowanym programem GNU Make, aby zainstalować wystarczy uruchomić polecenie `make localinstall`.

## Użycie
Aby użyć stylu w swojej pracy, najprostszym sposobem jest przekopiowanie pliku [sample/sample.tex](https://github.com/nawordar/wsb-style/blob/master/sample/sample.tex) oraz dostosowanie go do własnych potrzeb.

### Komendy
Klasa `wsbthesis` dostarcza kilka komend do wygenerowania strony tytułowej:
- `\faculty{}` — wydział uczelni
- `\degree{}` — kierunek studiów
- `\albumnumber{}` — numer albumu
- `\supervisorgenitive{}` — imię i nazwisko promotora w dopełniaczu, np. _dr. inż. Jana Kowalskiego_
- `\wyear{}` — Rok napisania pracy
