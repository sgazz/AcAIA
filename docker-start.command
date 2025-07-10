#!/bin/bash

# AcAIA Assistant - Docker Starter
# Ovaj fajl pokreće AcAIA Assistant u Docker kontejnerima

echo "🐳 Pokretanje AcAIA Assistant u Docker-u..."
echo "=========================================="

# Proveri da li je Docker pokrenut
if ! docker info > /dev/null 2>&1; then
    echo "❌ Greška: Docker nije pokrenut!"
    echo "Molimo vas da pokrenete Docker Desktop i pokušajte ponovo."
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

# Proveri da li postoji docker.env fajl
if [ ! -f "docker.env" ]; then
    echo "❌ Greška: docker.env fajl ne postoji!"
    echo "Molimo vas da kreirate docker.env fajl sa vašim OpenAI API ključem."
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

# Proveri da li je API ključ postavljen
if grep -q "your_openai_api_key_here" docker.env; then
    echo "⚠️  Upozorenje: OpenAI API ključ nije postavljen!"
    echo "Molimo vas da uredite docker.env fajl i dodate svoj API ključ."
    echo "Primer: OPENAI_API_KEY=sk-your-actual-key-here"
    read -p "Pritisnite Enter za nastavak ili Ctrl+C za izlaz..."
fi

echo "🔧 Pokretanje Docker kontejnera..."

# Zaustavi postojeće kontejnere ako postoje
echo "🛑 Zaustavljam postojeće kontejnere..."
docker-compose down

# Pokreni kontejnere
echo "🚀 Pokretanje novih kontejnera..."
docker-compose up --build -d

# Sačekaj da se kontejnere pokrenu
echo ""
echo "⏳ Čekam da se kontejnere pokrenu..."

# Proveri da li backend radi
echo "🔍 Proveravam backend..."
for i in {1..30}; do
    if curl -s http://localhost:8001/ > /dev/null 2>&1; then
        echo "✅ Backend je spreman na http://localhost:8001"
        break
    fi
    echo "   Pokušaj $i/30..."
    sleep 2
done

# Proveri da li frontend radi
echo "🔍 Proveravam frontend..."
for i in {1..30}; do
    if curl -s http://localhost:3000/ > /dev/null 2>&1; then
        echo "✅ Frontend je spreman na http://localhost:3000"
        break
    fi
    echo "   Pokušaj $i/30..."
    sleep 2
done

echo ""
echo "🎉 AcAIA Assistant je pokrenut u Docker-u!"
echo "=========================================="
echo "🌐 Frontend: http://localhost:3000"
echo "🔧 Backend API: http://localhost:8001"
echo ""

# Otvori Safari browser
echo "🌐 Otvaram Safari browser..."
open -a Safari "http://localhost:3000"

echo ""
echo "💡 Docker komande:"
echo "- Pogledaj logove: docker-compose logs"
echo "- Zaustavi: docker-compose down"
echo "- Restart: docker-compose restart"
echo ""

echo "=========================================="
read -p "Pritisnite Enter kada želite da zaustavite Docker kontejnere..."

# Zaustavi kontejnere
echo ""
echo "🛑 Zaustavljam Docker kontejnere..."
docker-compose down

echo "✅ Docker kontejnere su zaustavljeni."
echo "Hvala vam na korišćenju AcAIA Assistant!" 