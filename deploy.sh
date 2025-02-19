#!/bin/bash

echo "Pulling latest changes from GitHub..."
git pull origin main

echo "Installing dependencies..."
npm install

echo "Building Next.js app..."
npm run build

echo "Restarting PM2..."
pm2 stop nextjs-app
pm2 start npm --name "nextjs-app" -- start
pm2 save
