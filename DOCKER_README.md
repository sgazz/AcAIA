# AcAIA Assistant - Docker Setup

Ovo je uputstvo za pokretanje AcAIA Assistant projekta koristeći Docker.

## 🐳 Preduslovi

- Docker Desktop instaliran i pokrenut
- Docker Compose instaliran
- OpenAI API ključ

## 🚀 Brzo pokretanje

### 1. Konfiguracija

Kopirajte `docker.env` fajl i dodajte svoj OpenAI API ključ:

```bash
cp docker.env .env
```

Zatim uredite `.env` fajl i dodajte svoj OpenAI API ključ:

```bash
OPENAI_API_KEY=sk-your-actual-api-key-here
```

### 2. Pokretanje aplikacije

```bash
# Pokreni sve servise
docker-compose up --build

# Ili pokreni u pozadini
docker-compose up -d --build
```

### 3. Pristup aplikaciji

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8001

## 🛠️ Docker komande

```bash
# Pokreni servise
docker-compose up

# Pokreni u pozadini
docker-compose up -d

# Zaustavi servise
docker-compose down

# Rebuild i pokreni
docker-compose up --build

# Pogledaj logove
docker-compose logs

# Pogledaj logove specifičnog servisa
docker-compose logs backend
docker-compose logs frontend

# Uđi u kontejner
docker-compose exec backend bash
docker-compose exec frontend sh
```

## 📁 Struktura projekta

```
AcAIA Max/
├── backend/
│   ├── Dockerfile
│   ├── requirements.txt
│   ├── .dockerignore
│   └── main.py
├── frontend/
│   ├── Dockerfile
│   ├── .dockerignore
│   └── ... (Next.js fajlovi)
├── docker-compose.yml
├── docker.env
└── DOCKER_README.md
```

## 🔧 Konfiguracija

### Backend (FastAPI)
- **Port**: 8001
- **Hot reload**: Uključen
- **CORS**: Konfigurisan za localhost:3000

### Frontend (Next.js)
- **Port**: 3000
- **Hot reload**: Uključen
- **API URL**: http://localhost:8001

## 🐛 Troubleshooting

### Port je zauzet
```bash
# Proveri koji proces koristi port
lsof -i :3000
lsof -i :8001

# Zaustavi postojeće Docker kontejnere
docker-compose down
```

### Problem sa API ključem
```bash
# Proveri da li je API ključ postavljen
docker-compose exec backend env | grep OPENAI
```

### Rebuild potreban
```bash
# Potpuno rebuild
docker-compose down
docker-compose build --no-cache
docker-compose up
```

## 🧹 Čišćenje

```bash
# Zaustavi i ukloni kontejnere
docker-compose down

# Ukloni sve Docker resurse
docker-compose down --volumes --remove-orphans

# Ukloni Docker image-ove
docker rmi acaia-max-backend acaia-max-frontend
```

## 📝 Napomene

- Backend i frontend su u odvojenim kontejnerima
- Volume-ovi su postavljeni za hot reload
- Mreža `acaia-network` omogućava komunikaciju između servisa
- Restart policy je postavljen na `unless-stopped` 