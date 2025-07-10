#!/bin/bash

# AcAIA Assistant - Pokretanje backend i frontend servera
# Ovaj fajl pokreće oba servera i otvara Safari browser

echo "🚀 Pokretanje AcAIA Assistant servera..."
echo "========================================"

# Pronađi direktorijum gde se nalazi ovaj skript
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "📍 Skript se nalazi u: $SCRIPT_DIR"

# Pređi u direktorijum skripta
cd "$SCRIPT_DIR"

# Proveri da li smo u pravom direktorijumu
if [ ! -d "backend" ] || [ ! -d "frontend" ]; then
    echo "❌ Greška: Niste u AcAIA Max direktorijumu!"
    echo "Trenutni direktorijum: $(pwd)"
    echo "Očekivani direktorijum: $SCRIPT_DIR"
    echo "Molimo vas da pokrenete ovaj fajl iz glavnog direktorijuma projekta."
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

echo "✅ Pronađen AcAIA Max direktorijum: $(pwd)"

# Funkcija za proveru da li server radi
check_server() {
    local port=$1
    local max_attempts=30
    local attempt=1
    
    echo "⏳ Čekam da se server pokrene na portu $port..."
    
    while [ $attempt -le $max_attempts ]; do
        if curl -s "http://localhost:$port" > /dev/null 2>&1; then
            echo "✅ Server na portu $port je spreman!"
            return 0
        fi
        
        echo "   Pokušaj $attempt/$max_attempts..."
        sleep 2
        ((attempt++))
    done
    
    echo "❌ Server na portu $port se nije pokrenuo u očekivanom vremenu."
    return 1
}

# Funkcija za pronalaženje dostupnog porta
find_available_port() {
    local start_port=$1
    local port=$start_port
    
    while lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; do
        echo "   Port $port je zauzet, pokušavam sledeći..." >&2
        ((port++))
    done
    
    echo "   Korišćen port: $port" >&2
    echo $port
}

# Dodatna provera za debugging
echo "🔍 Dodatne informacije:"
echo "   Trenutni direktorijum: $(pwd)"
echo "   Backend direktorijum postoji: $([ -d "backend" ] && echo "✅" || echo "❌")"
echo "   Frontend direktorijum postoji: $([ -d "frontend" ] && echo "✅" || echo "❌")"
echo "   Sadržaj trenutnog direktorijuma:"
ls -la | head -10
echo ""

# Pronađi dostupan port za backend
echo "🔍 Tražim dostupan port za backend..."
BACKEND_PORT=$(find_available_port 8001)
echo "🔧 Pokretanje backend servera (port $BACKEND_PORT)..."
cd "$SCRIPT_DIR/backend"

# Proveri da li virtualno okruženje postoji
if [ ! -f "venv/bin/activate" ]; then
    echo "❌ Greška: Virtualno okruženje nije pronađeno u backend/venv/bin/activate"
    echo "Molimo vas da pokrenete: cd backend && python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt"
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

source venv/bin/activate
echo "✅ Virtualno okruženje je aktivirano"

# Proveri da li je uvicorn instaliran
if ! command -v uvicorn &> /dev/null; then
    echo "❌ Greška: uvicorn nije instaliran"
    echo "Molimo vas da pokrenete: pip install -r requirements.txt"
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

uvicorn main:app --reload --port $BACKEND_PORT &
BACKEND_PID=$!
cd "$SCRIPT_DIR"

# Pronađi dostupan port za frontend
echo "🔍 Tražim dostupan port za frontend..."
FRONTEND_PORT=$(find_available_port 3000)
echo "🎨 Pokretanje frontend servera (port $FRONTEND_PORT)..."
cd "$SCRIPT_DIR/frontend"

# Proveri da li je npm instaliran
if ! command -v npm &> /dev/null; then
    echo "❌ Greška: npm nije instaliran"
    echo "Molimo vas da instalirate Node.js i npm"
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

# Proveri da li su node_modules instalirani
if [ ! -d "node_modules" ]; then
    echo "📦 Instaliram npm zavisnosti..."
    npm install
fi

# Pokreni frontend sa specifičnim portom
export PORT=$FRONTEND_PORT
npm run dev &
FRONTEND_PID=$!
cd "$SCRIPT_DIR"

# Sačekaj da se serveri pokrenu
echo ""
echo "⏳ Čekam da se serveri pokrenu..."

# Proveri backend
if check_server $BACKEND_PORT; then
    echo "✅ Backend server je spreman na http://localhost:$BACKEND_PORT"
else
    echo "❌ Backend server se nije pokrenuo"
    kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

# Proveri frontend
if check_server $FRONTEND_PORT; then
    echo "✅ Frontend server je spreman na http://localhost:$FRONTEND_PORT"
else
    echo "❌ Frontend server se nije pokrenuo"
    kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
    read -p "Pritisnite Enter za izlaz..."
    exit 1
fi

echo ""
echo "🎉 Svi serveri su uspešno pokrenuti!"
echo "========================================"
echo "🌐 Frontend: http://localhost:$FRONTEND_PORT"
echo "🔧 Backend API: http://localhost:$BACKEND_PORT"
echo ""

# Otvori Safari browser
echo "🌐 Otvaram Safari browser..."
open -a Safari "http://localhost:$FRONTEND_PORT"

echo ""
echo "💡 Saveti:"
echo "- Serveri će se automatski osvežavati kada napravite izmene"
echo "- Za zaustavljanje servera, zatvorite ovaj terminal"
echo "- Ili pritisnite Ctrl+C u ovom terminalu"
echo ""

# Čekaj da korisnik pritisne Enter za izlaz
echo "========================================"
read -p "Pritisnite Enter kada želite da zaustavite servere..."

# Zaustavi servere
echo ""
echo "🛑 Zaustavljam servere..."
kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
echo "✅ Serveri su zaustavljeni."
echo "Hvala vam na korišćenju AcAIA Assistant!" 