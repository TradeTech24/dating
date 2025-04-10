import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
  ],
  resolve: {
    alias: {
      '@': resolve(__dirname, './client/src'),
      '@shared': resolve(__dirname, './shared'),
    },
  },
  root: resolve(__dirname, 'client'),
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:5001', // Updated to MongoDB server port
        changeOrigin: true,
      },
      '/ws': {
        target: 'ws://localhost:5001', // Updated to MongoDB server port
        ws: true,
      }
    },
  },
});