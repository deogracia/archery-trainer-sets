import os
import re
from datetime import datetime

def main():
    # Extraction de la version depuis l'environnement GitHub Actions
    github_ref = os.environ.get('GITHUB_REF', '')
    if github_ref.startswith('refs/tags/'):
        raw_version = github_ref.split('/')[-1]
        num_version = raw_version.lstrip('v')
    else:
        raw_version = 'v-dev'
        num_version = 'dev'
        
    date_str = datetime.now().strftime('%Y/%m/%d')
    print(f"Injection de la version : {raw_version} ({date_str})")
    
    # 1. Modification de la classe (.cls)
    cls_path = 'tex/ficheseance.cls'
    with open(cls_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Regex cherche: [YYYY/MM/DD vX.Y.Z 
    content = re.sub(r'\[\d{4}/\d{2}/\d{2} [^ ]+ ', f'[{date_str} {raw_version} ', content)
    
    with open(cls_path, 'w', encoding='utf-8') as f:
        f.write(content)
        
    # 2. Modification des documentations (.tex)
    for doc in ['doc/archery-trainer-sets-fr.tex', 'doc/archery-trainer-sets-en.tex']:
        with open(doc, 'r', encoding='utf-8') as f:
            content = f.read()
            
        # Regex cherche: \newcommand{\pkgversion}{...}
        content = re.sub(r'\\newcommand\{\\pkgversion\}\{[^}]+\}', f'\\\\newcommand{{\\\\pkgversion}}{{{num_version}}}', content)
        
        with open(doc, 'w', encoding='utf-8') as f:
            f.write(content)

if __name__ == "__main__":
    main()