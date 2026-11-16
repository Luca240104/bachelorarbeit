# LaTeX-Vorlage für die Bachelorarbeit

- In `metadata.tex` Titel, Name und weitere Angaben eintragen.
- Den Text in `chapters/` schreiben und die Gliederung in `main.tex` anpassen.
- Quellen in `literature.bib` eintragen und im Text mit `\cite{schluessel}` zitieren.
- Das optionale Deckblatt und das Tabellenverzeichnis lassen sich in `main.tex` aktivieren.

In PowerShell im Projektordner `.\build.ps1` ausführen. Die PDF liegt anschließend unter `output/main.pdf`. In VS Code kann LaTeX Workshop das mitgelieferte Build-Rezept verwenden.
