# Classes LaTeX pour Entraîneurs de Tir à l'Arc

Ce dépôt a pour vocation de regrouper à terme plusieurs classes LaTeX développées pour répondre aux besoins liés à la formation d'entraîneur de tir à l'arc (pour l'initiation et les débutants). 

Il permet de standardiser et de faciliter la création de documents utiles aux séances d'entraînement (comme les fiches de séance, les évaluations, etc.).

## Licence et Contributions

Ce projet est distribué sous la licence **LPPL** (LaTeX Project Public License). Vous êtes libre de l'utiliser, le modifier et le distribuer selon les termes de cette licence.

Les contributions et modifications sont les bienvenues ! N'hésitez pas à proposer vos améliorations via des *PUll Requests* (PR).
## Installation manuelle (Depuis les Releases GitHub)

La publication sur le réseau CTAN étant actuellement en dormance, voici la procédure pour installer l'archive ZIP `archery-trainer-sets.zip` disponible dans les [Releases GitHub](https://github.com/deogracia/archery-trainer-sets/releases).

### 🪟 Sous Windows (MiKTeX)
1. **Créer un répertoire local (Local TeXMF Root)** : Créez un dossier, par exemple `C:\LocalTeXMF`.
2. **Placer les fichiers** : Dans ce dossier, recréez l'arborescence requise : `C:\LocalTeXMF\tex\latex\archery-trainer-sets\`. Placez-y les fichiers `.cls` de l'archive.
3. **Déclarer le dossier** : Ouvrez la **MiKTeX Console**, allez dans **Settings** > onglet **Directories**. Cliquez sur `+` et ajoutez `C:\LocalTeXMF`.
4. **Mettre à jour la base** : Dans le menu **Tasks**, cliquez sur **Refresh file name database** (ou FNDB).

### 🐧 Sous Linux (TeX Live)
1. **Ouvrir le dossier local de l'utilisateur** : Les paquets personnels doivent être placés dans `~/texmf/`.
2. **Placer les fichiers** : Créez l'arborescence exacte : `mkdir -p ~/texmf/tex/latex/archery-trainer-sets/`. Copiez-y les fichiers `.cls`.
3. **Mettre à jour la base** : Ouvrez un terminal et exécutez la commande : `texhash ~/texmf`.

### 🍏 Sous macOS (MacTeX / TeX Live)
1. **Ouvrir le dossier local** : Le chemin est `~/Library/texmf/`. S'il n'existe pas, créez-le.
2. **Placer les fichiers** : Créez les sous-dossiers : `~/Library/texmf/tex/latex/archery-trainer-sets/`. Placez-y les fichiers `.cls`.
3. **Mettre à jour la base** : Ouvrez le Terminal et tapez : `texhash ~/Library/texmf` (bien que souvent sous macOS, le simple fait de placer les fichiers dans ce dossier suffise).


