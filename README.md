# AcAIA Max 🤖

[![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)](https://www.docker.com/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.104+-green?logo=fastapi)](https://fastapi.tiangolo.com/)
[![Next.js](https://img.shields.io/badge/Next.js-15.3+-black?logo=next.js)](https://nextjs.org/)
[![Python](https://img.shields.io/badge/Python-3.11+-blue?logo=python)](https://www.python.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0+-blue?logo=typescript)](https://www.typescriptlang.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **AcAIA Max** je moderna AI Assistant platforma koja kombinuje FastAPI backend sa Next.js frontend-om, dizajnirana za kreiranje inteligentnih AI asistenata koristeći OpenAI API.

## ✨ Funkcionalnosti

- 🤖 **AI Assistant** - OpenAI GPT integracija
- 🌐 **Modern Web Interface** - Next.js 15 sa Turbopack
- 🔧 **RESTful API** - FastAPI backend sa automatskom dokumentacijom
- 🐳 **Docker Support** - Potpuno kontejnerizovana aplikacija
- 🔄 **Hot Reload** - Automatsko osvežavanje kod promena
- 📱 **Responsive Design** - Optimizovano za sve uređaje
- 🚀 **Production Ready** - Spreman za deployment

## 🛠️ Tech Stack

### Backend
![FastAPI](https://img.shields.io/badge/FastAPI-0.104+-green?logo=fastapi)
![Python](https://img.shields.io/badge/Python-3.11+-blue?logo=python)
![Uvicorn](https://img.shields.io/badge/Uvicorn-ASGI%20Server-lightgrey)
![OpenAI](https://img.shields.io/badge/OpenAI-API-orange)

### Frontend
![Next.js](https://img.shields.io/badge/Next.js-15.3+-black?logo=next.js)
![TypeScript](https://img.shields.io/badge/TypeScript-5.0+-blue?logo=typescript)
![Turbopack](https://img.shields.io/badge/Turbopack-Ultra%20Fast%20Bundler-blue)
![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-Utility%20First-38B2AC?logo=tailwind-css)

### DevOps
![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker)
![Docker Compose](https://img.shields.io/badge/Docker%20Compose-Multi%20Container-orange?logo=docker)

## 🚀 Brzo pokretanje

### 📋 Preduslovi

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (za Docker opciju)
- [Node.js 18+](https://nodejs.org/) (za lokalno pokretanje)
- [Python 3.11+](https://www.python.org/) (za lokalno pokretanje)
- [OpenAI API ključ](https://platform.openai.com/api-keys)

### 🐳 Opcija 1: Docker (Preporučeno)

```bash
# 1. Kloniraj repozitorijum
git clone https://github.com/sgazz/AcAIA.git
cd AcAIA

# 2. Konfiguriši API ključ
cp docker.env .env
# Uredite .env fajl i dodajte svoj OpenAI API ključ

# 3. Pokreni sa Docker skriptom
./docker-start.command
```

### 💻 Opcija 2: Lokalno pokretanje

```bash
# 1. Kloniraj repozitorijum
git clone https://github.com/sgazz/AcAIA.git
cd AcAIA

# 2. Postavi API ključ
export OPENAI_API_KEY="sk-your-actual-api-key-here"

# 3. Pokreni sa skriptom
./ACAI_Assistant.command
```

### 🔧 Opcija 3: Ručno Docker pokretanje

```bash
# Build i pokretanje
docker-compose up --build -d

# Pogledaj logove
docker-compose logs -f

# Zaustavi
docker-compose down
```

## 🌐 Pristup aplikaciji

Nakon pokretanja, aplikacija je dostupna na:

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8001
- **API Dokumentacija**: http://localhost:8001/docs

## 📁 Struktura projekta

```
AcAIA Max/
├── 📁 backend/
│   ├── 🐍 main.py              # FastAPI aplikacija
│   ├── 📋 requirements.txt     # Python zavisnosti
│   ├── 🐳 Dockerfile          # Backend Docker image
│   └── 📁 venv/               # Virtualno okruženje
├── 📁 frontend/
│   ├── 📁 src/
│   │   ├── 📁 app/            # Next.js app router
│   │   └── 📁 components/     # React komponente
│   ├── 📋 package.json        # Node.js zavisnosti
│   ├── 🐳 Dockerfile          # Frontend Docker image
│   └── ⚙️ next.config.ts      # Next.js konfiguracija
├── 🚀 ACAI_Assistant.command  # Lokalno pokretanje skripta
├── 🐳 docker-start.command    # Docker pokretanje skripta
├── ⚙️ docker-compose.yml      # Docker Compose konfiguracija
├── 🔐 docker.env              # Docker environment varijable
└── 📖 README.md               # Ova dokumentacija
```

## 🔧 Development

### Backend Development

```bash
cd backend
python3 -m venv venv
source venv/bin/activate  # Na Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload --port 8001
```

### Frontend Development

```bash
cd frontend
npm install
npm run dev
```

## 🐳 Docker Komande

<details>
<summary>📋 Kliknite za detaljne Docker komande</summary>

```bash
# Build image-ova
docker-compose build

# Pokreni kontejnere
docker-compose up -d

# Pogledaj logove
docker-compose logs -f

# Zaustavi kontejnere
docker-compose down

# Restart kontejnera
docker-compose restart

# Uđi u kontejner
docker-compose exec backend bash
docker-compose exec frontend sh

# Pogledaj status kontejnera
docker-compose ps

# Očisti Docker resurse
docker-compose down --volumes --remove-orphans
```
</details>

## 🚀 Deployment

### 🌐 Cloud Deployment

Projekat je spreman za deployment na:

| Platforma | Status | Link |
|-----------|--------|------|
| **AWS EC2** | ✅ Spreman | [AWS Guide](https://aws.amazon.com/ec2/) |
| **Google Cloud Run** | ✅ Spreman | [GCP Guide](https://cloud.google.com/run) |
| **Azure Container Instances** | ✅ Spreman | [Azure Guide](https://azure.microsoft.com/services/container-instances/) |
| **DigitalOcean App Platform** | ✅ Spreman | [DO Guide](https://www.digitalocean.com/products/app-platform) |
| **Heroku** | ✅ Spreman | [Heroku Guide](https://heroku.com/) |

### 🖥️ Lokalni Server

```bash
# 1. Instaliraj Docker
sudo apt update && sudo apt install docker.io docker-compose

# 2. Kloniraj projekat
git clone https://github.com/sgazz/AcAIA.git /opt/AcAIA

# 3. Pokreni
cd /opt/AcAIA
docker-compose up -d --build
```

## 🐛 Troubleshooting

<details>
<summary>🔧 Česti problemi i rešenja</summary>

### Port je zauzet
```bash
# Proveri koji proces koristi port
lsof -i :3000
lsof -i :8001

# Zaustavi postojeće procese
lsof -ti:3000,8001 | xargs kill -9
```

### Docker problemi
```bash
# Proveri Docker status
docker info

# Restart Docker Desktop
# Pogledaj Docker logove
docker-compose logs
```

### API ključ problemi
```bash
# Proveri environment varijable
docker-compose exec backend env | grep OPENAI
```

### Performance problemi
```bash
# Očisti Docker cache
docker system prune -a

# Rebuild bez cache
docker-compose build --no-cache
```
</details>

## 📊 Performanse

| Metrika | Vrednost |
|---------|----------|
| **Backend startup** | ~5-10 sekundi |
| **Frontend startup** | ~15-20 sekundi |
| **Hot reload** | Instant |
| **Docker build** | ~90s (prvi put), ~1s (cache) |
| **Memory usage** | ~200MB (backend) + ~150MB (frontend) |

## 🤝 Doprinosi

Doprinosi su dobrodošli! Molimo vas da pratite ove korake:

1. 🍴 Fork repozitorijum
2. 🌿 Kreiraj feature branch (`git checkout -b feature/AmazingFeature`)
3. 💾 Commit promene (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push na branch (`git push origin feature/AmazingFeature`)
5. 🔄 Otvori Pull Request

### 📋 Development Guidelines

- Koristite TypeScript za frontend kod
- Pratite PEP 8 za Python kod
- Dodajte testove za nove funkcionalnosti
- Ažurirajte dokumentaciju kada je potrebno

## 📄 Licenca

Ovaj projekat je licenciran pod [MIT licencom](LICENSE).

## 📞 Podrška

- 🐛 **Bug Reports**: [Otvorite issue](https://github.com/sgazz/AcAIA/issues)
- 💡 **Feature Requests**: [Otvorite issue](https://github.com/sgazz/AcAIA/issues)
- 📧 **Email**: sgazz@example.com
- 💬 **Discord**: [Pridružite se serveru](https://discord.gg/acaia)

## ⭐ Zvezde

Ako vam se sviđa ovaj projekat, molimo vas da mu date zvezdicu! ⭐

---

<div align="center">

**AcAIA Max** - Napravljeno sa ❤️ za AI Assistant platformu

[![GitHub stars](https://img.shields.io/github/stars/sgazz/AcAIA?style=social)](https://github.com/sgazz/AcAIA)
[![GitHub forks](https://img.shields.io/github/forks/sgazz/AcAIA?style=social)](https://github.com/sgazz/AcAIA)
[![GitHub issues](https://img.shields.io/github/issues/sgazz/AcAIA)](https://github.com/sgazz/AcAIA/issues)

</div> 