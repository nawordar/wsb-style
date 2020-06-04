# wsb-style
Nieoficjalna klasa i styl bibliografii pracy inżynierskiej dla Wyższej Szkoły Bankowej w Gdańsku, kompatybilny z LuaTeX oraz XeTeX\
[Przykładowy plik pdf wyrenderowany z użyciem tego stylu](https://github.com/nawordar/wsb-style/blob/master/sample/sample.pdf).

## Notice
This is an unofficial LaTeX style, not endorsed in any way by Wyższa Szkoła Bankowa.
Therefore, **compliance with official style guidelines IS NOT warranted**.
If the file generated using this style is not compliant with the guidelines, please report the issue here.

As of now, only Polish is supported. The style guidelines for English language theses are not clearly defined yet.

## Instalacja
Ten styl do działania wymaga silnika LaTeXa LuaTeX lub XeTeX.
Do instalacji zalecane są programy GNU make oraz git, przy czym do komplilacji za pomocą make wymagany jest program kpsewhich zawarty w większości dystrybucji LaTeXa.

Na systemach bazowanych na Debianie, Ubuntu oraz pochodnych programy te można zainstalować za pomocą komendy:
```shell
sudo apt install make git
```

Aby zainstalować styl należy sklonować to repozytorium oraz uruchomić polecenie `make localinstall` wewnątrz sklonowanego folderu:
```shell
git clone https://github.com/nawordar/wsb-style.git
cd wsb-style
make localinstall
```

Systemy niekompatybilne ze standardem POSIX nie są i nigdy nie będą wspierane.

## Użycie
Aby użyć stylu w swojej pracy, najprostszym sposobem jest przekopiowanie pliku [sample/sample.tex](https://github.com/nawordar/wsb-style/blob/master/sample/sample.tex) oraz dostosowanie go do własnych potrzeb.

### Opcje paczki
- `tocchapter` — Dodaje "Rozdział" przed numerem rozdziału w spisie treści;
- `tocchapterdots` — Dodaje kropki między nazwą rozdziału a numerem w spisie treści;
- `sectionnumberdot` — Dodaje kropkę po numerze sekcji.

### Komendy
Klasa `wsbthesis` dostarcza kilka komend do wygenerowania strony tytułowej:
- `\faculty{}` — wydział uczelni
- `\degree{}` — kierunek studiów
- `\albumnumber{}` — numer albumu
- `\supervisor{}` — imię i nazwisko promotora w dopełniaczu, np. _dr. inż. Jana Kowalskiego_
- `\wyear{}` — Rok napisania pracy

### Środowiska
Na chwilę obecną klasa dostarcza jedno środowisko — `introduction`. Jest ono
bazowane na makrze `\chapter*`, ale nie są w nim drukowane numery stron.
