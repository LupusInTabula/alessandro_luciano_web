# Alessandro Luciano - Tecnico Elettromeccanico

Sito web aziendale di presentazione e catalogo prodotti per la ditta **Alessandro Luciano**, sviluppato in **Flutter Web** con linguaggio **Dart**.

La ditta è specializzata nell'assistenza tecnica elettromeccanica, nella riparazione e nella compravendita di pezzi di ricambio per macchine destinate al settore delle calzature.

---

## 🚀 Collegamenti Utili

* **Sito Web Live:** [https://lupusintabula.github.io/alessandro_luciano_web/](https://lupusintabula.github.io/alessandro_luciano_web/)

---

## 🛠️ Caratteristiche del Progetto

* **Interfaccia Responsiva:** Ottimizzata per la visualizzazione su dispositivi Mobile, Tablet e Desktop.
* **Vetrina Brevetti:** Sezione dedicata sulla Home Page per l'esposizione (con supporto a foto e video) delle innovazioni proprietarie ad aria compressa:
  * **Pinza pneumatica brevettata**
  * **Martello pneumatico brevettato**
* **Struttura Modulare:** Layout pulito con gestione centralizzata dei testi per facilitare futuri aggiornamenti e manutenzioni.
* **Pagine Incluse:**
  * **Home:** Presentazione aziendale e vetrina strumenti ad aria compressa.
  * **Chi Siamo / Storia:** Background dell'azienda nel settore dell'automazione e della meccanica industriale.
  * **Contatti / Dove Siamo:** Recapiti aziendali e informazioni sulla localizzazione.

---

## 💻 Sviluppo Locale e Deployment

Se desideri apportare modifiche alla struttura o aggiornare i contenuti multimediali dei brevetti, segui queste procedure dal terminale:

### Compilazione e Aggiornamento del Sito Live
Per rigenerare la build web e pubblicare automaticamente le modifiche su GitHub Pages, esegui:

```powershell
# Compila l'applicazione impostando il base-href corretto
flutter build web --base-href "/alessandro_luciano_web/"

# Carica la cartella compilata sul branch di pubblicazione gh-pages
$env:CACHE_DIR=".cache"
gh-pages -d build/web