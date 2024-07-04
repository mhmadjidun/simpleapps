# Gunakan Node.js sebagai base image
FROM node:16

# Install dependencies
#RUN apt-get update && apt-get install -y openssl default-mysql-client

# Buat direktori kerja untuk aplikasi
WORKDIR /usr/src/app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin seluruh file ke dalam direktori kerja
COPY . .

# Installa migrations:
# RUN npx prisma migrate dev --name init

# Expose port yang akan digunakan oleh aplikasi
EXPOSE 8080

# Command untuk menjalankan aplikasi
CMD ["node", "index.js"]
