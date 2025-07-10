# Frontend Dockerfile
FROM node:18-alpine

# Postavi radni direktorijum
WORKDIR /app

# Kopiraj package.json i package-lock.json
COPY package*.json ./

# Instaliraj zavisnosti
RUN npm ci --only=production

# Kopiraj frontend kod
COPY . .

# Izloži port
EXPOSE 3000

# Komanda za pokretanje
CMD ["npm", "run", "dev"] 