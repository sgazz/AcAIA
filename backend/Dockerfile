# Backend Dockerfile
FROM python:3.11-slim

# Postavi radni direktorijum
WORKDIR /app

# Kopiraj requirements.txt prvo (za bolje caching)
COPY requirements.txt .

# Instaliraj Python zavisnosti
RUN pip install --no-cache-dir --upgrade-strategy eager -r requirements.txt

# Kopiraj backend kod
COPY . .

# Izloži port
EXPOSE 8001

# Komanda za pokretanje
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8001", "--reload"] 