# 🤝 Doprinosi AcAIA Max projektu

Hvala vam što razmatrate doprinos AcAIA Max projektu! Vaši doprinosi su dobrodošli i cenjeni.

## 📋 Sadržaj

- [Kako doprineti](#kako-doprineti)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Bug Reports](#bug-reports)
- [Feature Requests](#feature-requests)

## 🚀 Kako doprineti

### 1. 🍴 Fork repozitorijum
Kliknite na "Fork" dugme u gornjem desnom uglu GitHub stranice.

### 2. 🌿 Klonirajte vaš fork
```bash
git clone https://github.com/your-username/acaia-max.git
cd acaia-max
```

### 3. 🔗 Dodajte upstream remote
```bash
git remote add upstream https://github.com/original-owner/acaia-max.git
```

### 4. 🌿 Kreirajte feature branch
```bash
git checkout -b feature/amazing-feature
```

### 5. 💾 Napravite promene
- Napravite potrebne izmene u kodu
- Dodajte testove ako je potrebno
- Ažurirajte dokumentaciju

### 6. ✅ Testirajte promene
```bash
# Testirajte lokalno
./ACAI_Assistant.command

# Ili testirajte sa Docker
./docker-start.command
```

### 7. 📤 Commit i push
```bash
git add .
git commit -m "feat: add amazing feature"
git push origin feature/amazing-feature
```

### 8. 🔄 Otvorite Pull Request
Idite na GitHub i otvorite Pull Request sa detaljnim opisom vaših promena.

## 🔧 Development Setup

### Preduslovi
- Python 3.11+
- Node.js 18+
- Docker Desktop
- Git

### Lokalno okruženje
```bash
# Backend setup
cd backend
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt

# Frontend setup
cd frontend
npm install
```

### Docker okruženje
```bash
# Build i pokretanje
docker-compose up --build -d

# Pogledaj logove
docker-compose logs -f
```

## 📝 Coding Standards

### Python (Backend)
- Pratite [PEP 8](https://www.python.org/dev/peps/pep-0008/) stil
- Koristite type hints
- Dodajte docstrings za funkcije i klase
- Maksimalna dužina linije: 88 karaktera (black formatter)

```python
from typing import Optional, List
from fastapi import FastAPI, HTTPException

def process_data(data: List[str]) -> Optional[str]:
    """
    Process the input data and return processed result.
    
    Args:
        data: List of strings to process
        
    Returns:
        Processed string or None if processing fails
    """
    if not data:
        return None
    
    return " ".join(data)
```

### TypeScript (Frontend)
- Koristite TypeScript za sve komponente
- Pratite ESLint pravila
- Koristite Prettier za formatiranje
- Dodajte JSDoc komentare za kompleksne funkcije

```typescript
interface UserData {
  id: string;
  name: string;
  email: string;
}

/**
 * Fetches user data from the API
 * @param userId - The user ID to fetch
 * @returns Promise with user data
 */
async function fetchUserData(userId: string): Promise<UserData> {
  const response = await fetch(`/api/users/${userId}`);
  if (!response.ok) {
    throw new Error('Failed to fetch user data');
  }
  return response.json();
}
```

### Git Commit Messages
Koristite [Conventional Commits](https://www.conventionalcommits.org/) format:

```
type(scope): description

feat(auth): add user authentication
fix(api): resolve CORS issue
docs(readme): update installation instructions
style(ui): improve button styling
refactor(backend): simplify database queries
test(api): add unit tests for user endpoints
chore(deps): update dependencies
```

## 🧪 Testing

### Backend Testing
```bash
cd backend
# Instaliraj test zavisnosti
pip install pytest pytest-asyncio httpx

# Pokreni testove
pytest

# Sa coverage
pytest --cov=app --cov-report=html
```

### Frontend Testing
```bash
cd frontend
# Pokreni testove
npm test

# Sa coverage
npm run test:coverage
```

### E2E Testing
```bash
# Pokreni aplikaciju
./docker-start.command

# Pokreni E2E testove
npm run test:e2e
```

## 🔄 Pull Request Process

### Pre slanja PR-a
- [ ] Kod prati coding standards
- [ ] Dodani su testovi za nove funkcionalnosti
- [ ] Ažurirana je dokumentacija
- [ ] Testiran je kod lokalno
- [ ] Commit messages prate conventional commits format

### PR Template
```markdown
## 📝 Opis
Kratak opis promena

## 🔧 Tip promene
- [ ] Bug fix
- [ ] Nova funkcionalnost
- [ ] Breaking change
- [ ] Dokumentacija

## 🧪 Testiranje
- [ ] Lokalno testiranje
- [ ] Unit testovi
- [ ] E2E testovi

## 📸 Screenshots (ako je potrebno)

## ✅ Checklist
- [ ] Kod je formatiran
- [ ] Dodani su testovi
- [ ] Ažurirana je dokumentacija
- [ ] Nema breaking changes
```

## 🐛 Bug Reports

Kada prijavljujete bug, molimo vas da uključite:

1. **Kratak opis** problema
2. **Koraci za reprodukciju**
3. **Očekivano ponašanje**
4. **Stvarno ponašanje**
5. **Screenshots** (ako je potrebno)
6. **Environment info**:
   - OS: macOS/Windows/Linux
   - Browser: Chrome/Firefox/Safari
   - Node.js verzija
   - Python verzija
   - Docker verzija

### Bug Report Template
```markdown
## 🐛 Bug Description
Kratak opis problema

## 🔄 Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## ✅ Expected Behavior
Šta ste očekivali da se desi

## ❌ Actual Behavior
Šta se zapravo desilo

## 📱 Environment
- OS: [e.g. macOS 14.0]
- Browser: [e.g. Chrome 120]
- Node.js: [e.g. 18.17.0]
- Python: [e.g. 3.11.0]

## 📸 Screenshots
Ako je potrebno, dodajte screenshots
```

## 💡 Feature Requests

Kada predlažete novu funkcionalnost:

1. **Opis funkcionalnosti** - šta želite da se doda
2. **Use case** - zašto je ova funkcionalnost potrebna
3. **Alternativna rešenja** - da li postoje alternativne opcije
4. **Mockup/Prototype** - ako je moguće, dodajte mockup

### Feature Request Template
```markdown
## 💡 Feature Description
Opis nove funkcionalnosti

## 🎯 Use Case
Zašto je ova funkcionalnost potrebna

## 🔄 Alternative Solutions
Da li postoje alternativne opcije

## 📋 Additional Context
Bilo koji dodatni kontekst ili informacije
```

## 📞 Komunikacija

- **Issues**: Koristite GitHub Issues za bug reports i feature requests
- **Discussions**: Koristite GitHub Discussions za opšta pitanja
- **Discord**: Pridružite se našem Discord serveru za live chat

## 🏆 Recognition

Vaši doprinosi će biti prepoznati u:
- README.md fajlu
- Release notes
- Contributors sekciji
- GitHub profile

## 📄 Licenca

Doprinosom kodu, pristajete da vaš kod bude licenciran pod MIT licencom.

---

**Hvala vam na doprinosu AcAIA Max projektu!** 🚀 