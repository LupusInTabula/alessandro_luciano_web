import 'package:flutter/material.dart';

import '../models/media_asset.dart';
import '../models/product_tool.dart';
import '../models/value_item.dart';

/// Single source of truth for all site text, images and video paths.
///
/// To customize the website, edit the values in this file only:
/// - Replace `assets/images/...` / `assets/videos/...` paths with real files
///   (remember to also list new files under `flutter.assets` in pubspec.yaml).
/// - Replace placeholder strings with the final copy (or translate them).
class CompanyContent {
  CompanyContent._();

  // ---------------------------------------------------------------------
  // Brand / general
  // ---------------------------------------------------------------------
  static const String companyName = 'Alessandro Luciano';
  static const String companyTagline =
      'Meccanica ed Elettromeccanica per Macchine Calzaturiere';

  static const String logoFull = 'assets/images/AlessandroLuciano_logo_full.jpeg';
  static const String logoCompact = 'assets/images/alessandro_luciano_logo.png';

  // ---------------------------------------------------------------------
  // Navigation
  // ---------------------------------------------------------------------
  static const List<String> navLabels = [
    'Home',
    'Chi Siamo',
    'Dove Siamo',
  ];

  // ---------------------------------------------------------------------
  // Home / Hero
  // ---------------------------------------------------------------------
  static const String heroTitle =
      'Riparazione e Commercio Ricambi\nper Macchine Calzaturiere';
  static const String heroSubtitle =
      'Da anni al fianco delle aziende calzaturiere italiane con competenza '
      'elettromeccanica, ricambi originali e assistenza rapida e affidabile.';
  static const String heroPrimaryCta = 'Contattaci';
  static const String heroSecondaryCta = 'Scopri i Nostri Utensili';
  static const String heroImage = 'assets/images/AlessandroLuciano_logo_full.jpeg';

  // ---------------------------------------------------------------------
  // Home / Services overview
  // ---------------------------------------------------------------------
  static const String servicesSectionTitle = 'I Nostri Servizi';
  static const String servicesSectionSubtitle =
      'Soluzioni complete per l\'elettromeccanica industriale calzaturiera';

  static const List<ValueItem> services = [
    ValueItem(
      icon: Icons.build_circle_outlined,
      title: 'Riparazione Macchinari',
      description:
          'Interventi tecnici specializzati su macchinari elettromeccanici '
          'per il settore calzaturiero, con diagnosi rapida e precisa.',
    ),
    ValueItem(
      icon: Icons.settings_suggest_outlined,
      title: 'Ricambi Originali',
      description:
          'Ampio catalogo di ricambi per macchine calzaturiere, disponibili '
          'per la vendita con consegna rapida in tutta Italia.',
    ),
    ValueItem(
      icon: Icons.engineering_outlined,
      title: 'Consulenza Tecnica',
      description:
          'Supporto e consulenza specialistica per manutenzione, '
          'ammodernamento e ottimizzazione degli impianti.',
    ),
  ];

  // ---------------------------------------------------------------------
  // Home / Patented pneumatic tools showcase
  // ---------------------------------------------------------------------
  static const String toolsSectionTitle = 'I Nostri Utensili Brevettati';
  static const String toolsSectionSubtitle =
      'Due strumenti pneumatici esclusivi, progettati e brevettati da '
      'Alessandro Luciano per il settore calzaturiero.';

  static const ProductTool pliersTool = ProductTool(
    name: 'Pinza Speciale Pneumatica',
    tagline: 'Precisione e forza in un unico strumento',
    description:
        'Pinza pneumatica brevettata, progettata per garantire massima '
        'precisione e riduzione dello sforzo dell\'operatore durante le '
        'lavorazioni calzaturiere. Alimentata ad aria compressa, offre '
        'affidabilità e durata nel tempo.',
    features: [
      'Brevetto esclusivo Alessandro Luciano',
      'Azionamento ad aria compressa',
      'Riduzione dello sforzo manuale',
      'Costruzione robusta per uso industriale continuo',
    ],
    media: MediaAsset(
      imagePath: 'assets/images/placeholder_pinza.jpg',
      videoPath: 'assets/videos/placeholder_pinza.mp4',
      caption: 'Pinza Speciale Pneumatica in funzione',
    ),
  );

  static const ProductTool hammerTool = ProductTool(
    name: 'Martello Pneumatico',
    tagline: 'Potenza controllata ad aria compressa',
    description:
        'Martello pneumatico brevettato pensato per le lavorazioni più '
        'esigenti del comparto calzaturiero. Garantisce colpi costanti e '
        'controllati, migliorando qualità del lavoro e produttività.',
    features: [
      'Brevetto esclusivo Alessandro Luciano',
      'Azionamento ad aria compressa',
      'Colpo costante e controllato',
      'Ideale per lavorazioni industriali intensive',
    ],
    media: MediaAsset(
      imagePath: 'assets/images/placeholder_martello.jpg',
      videoPath: 'assets/videos/placeholder_martello.mp4',
      caption: 'Martello Pneumatico in funzione',
    ),
  );

  // ---------------------------------------------------------------------
  // Home / Call to action footer band
  // ---------------------------------------------------------------------
  static const String ctaTitle = 'Hai bisogno di assistenza o ricambi?';
  static const String ctaSubtitle =
      'Il nostro team è pronto ad aiutarti: contattaci per un preventivo o '
      'per maggiori informazioni sui nostri prodotti.';
  static const String ctaButton = 'Contattaci Ora';

  // ---------------------------------------------------------------------
  // About Us / History page
  // ---------------------------------------------------------------------
  static const String aboutPageTitle = 'Chi Siamo';
  static const String aboutIntroTitle = 'La Nostra Storia';
  static const String aboutIntroBody =
      'Alessandro Luciano opera da anni nel settore della riparazione e del '
      'commercio di ricambi per macchine calzaturiere, costruendo nel tempo '
      'una solida reputazione basata su competenza tecnica, affidabilità e '
      'passione per la meccanica di precisione. La nostra azienda è cresciuta '
      'affiancando le realtà calzaturiere del territorio, offrendo soluzioni '
      'concrete e personalizzate per ogni esigenza elettromeccanica.';

  static const String aboutMissionTitle = 'La Nostra Missione';
  static const String aboutMissionBody =
      'Garantire continuità produttiva ai nostri clienti attraverso interventi '
      'tempestivi, ricambi di qualità e un\'innovazione costante, testimoniata '
      'anche dallo sviluppo di utensili pneumatici brevettati pensati per '
      'semplificare il lavoro quotidiano in produzione.';

  static const List<HistoryMilestone> history = [
    HistoryMilestone(
      year: 'Le Origini',
      title: 'Nascita dell\'attività',
      description:
          'Avvio dell\'attività di riparazione elettromeccanica per macchine '
          'calzaturiere, con focus sulla qualità del servizio tecnico.',
    ),
    HistoryMilestone(
      year: 'Crescita',
      title: 'Espansione del catalogo ricambi',
      description:
          'Ampliamento dell\'offerta di ricambi originali e compatibili, '
          'a supporto di un numero crescente di aziende calzaturiere.',
    ),
    HistoryMilestone(
      year: 'Innovazione',
      title: 'Sviluppo degli utensili brevettati',
      description:
          'Progettazione e brevetto della Pinza Speciale e del Martello '
          'Pneumatico, frutto dell\'esperienza diretta sul campo.',
    ),
    HistoryMilestone(
      year: 'Oggi',
      title: 'Un partner tecnico di fiducia',
      description:
          'Alessandro Luciano continua a essere un punto di riferimento per '
          'l\'assistenza elettromeccanica nel settore calzaturiero.',
    ),
  ];

  static const List<ValueItem> values = [
    ValueItem(
      icon: Icons.verified_outlined,
      title: 'Affidabilità',
      description: 'Interventi puntuali e ricambi di qualità garantita.',
    ),
    ValueItem(
      icon: Icons.precision_manufacturing_outlined,
      title: 'Competenza Tecnica',
      description: 'Esperienza pluriennale nell\'elettromeccanica industriale.',
    ),
    ValueItem(
      icon: Icons.lightbulb_outline,
      title: 'Innovazione',
      description: 'Sviluppo di utensili pneumatici brevettati ed esclusivi.',
    ),
    ValueItem(
      icon: Icons.handshake_outlined,
      title: 'Vicinanza al Cliente',
      description: 'Un rapporto diretto e continuo con ogni cliente.',
    ),
  ];

  // ---------------------------------------------------------------------
  // Where we are / Contacts page
  // ---------------------------------------------------------------------
  static const String contactsPageTitle = 'Dove Siamo';
  static const String contactsIntro =
      'Vieni a trovarci o contattaci per qualsiasi informazione su '
      'riparazioni, ricambi o sui nostri utensili brevettati.';

  static const String companyAddressLine1 = 'Via dell\'Industria, 12';
  static const String companyAddressLine2 = '00000 Città (XX), Italia';
  static const String companyPhone = '+39 000 000 0000';
  static const String companyEmail = 'info@alessandroluciano.it';
  static const String companyVat = 'P.IVA 00000000000';
  static const String companyHours =
      'Lun - Ven: 8:30 - 12:30 / 14:00 - 18:00';

  static const String mapPlaceholderNote =
      'Mappa interattiva in arrivo — sostituire con Google Maps / '
      'flutter_map integrato oppure con un iframe per il web.';

  // ---------------------------------------------------------------------
  // Contact form labels
  // ---------------------------------------------------------------------
  static const String formTitle = 'Inviaci un Messaggio';
  static const String formNameLabel = 'Nome e Cognome';
  static const String formEmailLabel = 'Email';
  static const String formMessageLabel = 'Messaggio';
  static const String formSubmitLabel = 'Invia Richiesta';
  static const String formSuccessMessage =
      'Grazie! Il tuo messaggio è stato inviato correttamente.';

  // ---------------------------------------------------------------------
  // Footer
  // ---------------------------------------------------------------------
  static String footerCopyright(int year) =>
      '© $year $companyName — Tutti i diritti riservati.';
}
