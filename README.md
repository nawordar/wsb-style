# wsb-style
Nieoficjalna klasa i styl bibliografii pracy inżynierskiej dla Wyższej Szkoły Bankowej w Gdańsku, kompatybilny z LuaTeX oraz XeTeX\
[Przykładowy plik pdf wyrenderowany z użyciem tego stylu](https://github.com/nawordar/wsb-style/blob/master/sample/sample.pdf).

## Notice
This is an unofficial LaTeX style, not endorsed in any way by Wyższa Szkoła Bankowa.
Therefore, **compliance with official style guidelines IS NOT warranted**.
If the pdf generated using this style is not compliant with the guidelines, please report the issue here.

As of now, only Polish is supported. The style guidelines for English language theses are not clearly defined yet.

## Instalacja
Do użycia tego stylu wymagany jest silnik LaTeXa LuaTeX lub XeTeX.\
Do instalacji tego stylu zalecany jest program GNU Make oraz git.

Aby zainstalować styl należy sklonować oraz uruchomić polecenie `make localinstall` wewnątrz sklonowanego folderu:
```shell
git clone https://github.com/nawordar/wsb-style.git
cd wsb-style
make localinstall
```

Systemy niekompatybilne ze standardem POSIX nie są i nigdy nie będą wspierane.

## Użycie
Aby użyć stylu w swojej pracy, najprostszym sposobem jest przekopiowanie pliku [sample/sample.tex](https://github.com/nawordar/wsb-style/blob/master/sample/sample.tex) oraz dostosowanie go do własnych potrzeb.

### Komendy
Klasa `wsbthesis` dostarcza kilka komend do wygenerowania strony tytułowej:
- `\faculty{}` — wydział uczelni
- `\degree{}` — kierunek studiów
- `\albumnumber{}` — numer albumu
- `\supervisorgenitive{}` — imię i nazwisko promotora w dopełniaczu, np. _dr. inż. Jana Kowalskiego_
- `\wyear{}` — Rok napisania pracy
