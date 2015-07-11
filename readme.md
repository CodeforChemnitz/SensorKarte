# Sensorkarte
![App-Logo](https://rawgit.com/CodeForChemnitz/sensor-karte/master/public/img/App_logo.svg)

ein ![Code-for-Logo](https://rawgit.com/CodeForChemnitz/sensor-karte/master/public/img/CFG_logo.svg) Projekt

Im Rahmen der Citizen-Science hat sich das OK Lab Chemnitz zum Ziel gesetzt
eine Plattform zu entwickeln, die zum einen die Erfassung und Verwaltung von Messstation und deren einzelner Sensoren ermöglichen soll.
Zum anderen sollen die Daten von den Sensoren in einer geeigneten hochperformanten Datenplattform abgelegt werden.

Alle Ideen und Gedanken finden sich im [Citizen-Science-Wiki](https://github.com/codeforgermany/citizen-science/wiki/Messdaten-Speicherung)

## Ziel dieser App
Dieses App hier kümmert sich um die Erfassung und Verwaltung der Stationen und deren Sensoren.

** http://codeforchemnitz-sensors.meteor.com **

## Technische Basis
Meteor: Node.JS, Bootstrap, MongoDB.

## Mitwirken
Die Meteor-Plattform macht das mitwirken sehr einfach:

1. git clone https://github.com/codeforchemnitz/sensor-karte
2. cd sensor-karte
3. meteor
4. Browser öffnen: http://localhost:3000

## Kompatiblität
Getested mit Webkit, Firefox, IE9, iPhone, und iPad

## Deployment
Derzeit erfolgt das Deployment noch auf die Meteor-Plattform und ist unter http://codeforchemnitz-sensors.meteor.com erreichbar.

Die Aktualisierung erfolgt durch:

`meteor deploy codeforchemnitz-sensors`

Für den Produktivmodus soll die App auf dem Codefor-Server gehostet werden.

Alternativ findet sich ein PaaS-Spender für die App (Galaxy ist ja gerade noch in der Entwicklung und auf der [Meteor Roadmap](https://trello.com/b/hjBDflxp/meteor-roadmap))

Anleitung für den "harten" Weg es selber zu hosten: https://scotch.io/tutorials/building-a-slack-clone-in-meteor-js-part-5-deployment



## Lizenz
MIT
