# Installation
Die abgaben.cls Datei und abgabebspecifics.sty in den root Ordner der Abgaben verschieben. In den Unterordnern können die Abgaben erstellt werden.
```
\abgaben.cls
\abgabebspecifics.sty
Übung1\Übung.tex
...
Übungn\Übung.tex
```

## Abgaben

Jede Abgabe sollte minimal folgende Information enthalten

```latex
\documentclass[DoubleHeader, Abgabe]{../abgaben}
\setexercisenumber{XY}

\begin{document}

\Task{Die erste tolle Aufgabe}{9}

\end{document}
```

## Folien
Die Folien basieren auf dem Metropolis-Theme
