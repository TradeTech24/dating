# MatchYourVibe MongoDB & S3 Integration

This file provides instructions for using MatchYourVibe with MongoDB and Amazon S3 for storage. The application can run standalone on your local machine without requiring the Replit environment.

## Available Scripts

Run these scripts using Node.js directly:

```bash
# Set up MongoDB and S3 environment variables
node scripts/setup-mongodb-env.mjs

# Start the MongoDB server
node server/server-mongo.mjs

# Migrate data from PostgreSQL to MongoDB (optional)
node scripts/migrate-pg-to-mongo.mjs

# Build the application for local development (without Replit plugins)
node scripts/build-local.mjs

# Run the local MongoDB server after building (choose one)
node dist/run-local.js    # CommonJS version
node dist/run-local.mjs   # ES modules version
```

> **Note:** We've converted many scripts to use ES modules (`.mjs` extension) for better compatibility with modern JavaScript, as our package.json has `"type": "module"`. You can use either the `.js` (CommonJS) or `.mjs` (ES modules) versions based on your preference.

## Environment Variables

The application reads credentials and configuration from a `.env` file. The setup script helps you create this file with the following variables:

- `MONGO_URI`: MongoDB connection string
- `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, `S3_BUCKET`: AWS S3 credentials
- `EMAIL_USER`, `EMAIL_PASS`, `EMAIL_PASSWORD`: Email sending credentials
- `SESSION_SECRET`: Secret for session encryption
- `PORT`: Server port number
- `CORS_ORIGIN`: Allowed origins for CORS

## Features

The MongoDB & S3 integration provides:

1. **Complete Data Model** - User profiles, matches, messages, and date recommendations
2. **S3 File Storage** - Profile images and verification photos stored in S3
3. **Email Integration** - OTP verification and notifications
4. **Full API Coverage** - All API endpoints from the PostgreSQL version

## Setup Steps for Local Development

The MongoDB version is designed to run completely independently from Replit. Follow these steps to set up the application on your local machine:

1. Clone or download the project to your local system

2. Install required dependencies:
   ```
   npm install
   npm install mongoose aws-sdk multer multer-s3 dotenv cors morgan bcryptjs
   ```

3. Run the setup script to configure your environment:
   ```
   node scripts/setup-mongodb-env.mjs
   ```
   This will create a `.env` file with all necessary configuration.

4. If you have existing data in PostgreSQL, you can optionally migrate it to MongoDB:
   ```
   node scripts/migrate-pg-to-mongo.mjs
   ```

5. Choose one of the following methods to run the application:

   **Option 1: Direct MongoDB Server**
   ```
   node server/server-mongo.mjs
   ```

   **Option 2: Build and Run (Recommended for Production)**
   ```
   # Build frontend and backend for local deployment
   node scripts/build-local.mjs
   
   # Run the built application (choose one)
   node dist/run-local.js     # CommonJS version
   node dist/run-local.mjs    # ES modules version
   ```

6. Access the application in your browser at `http://localhost:5000`

The MongoDB version doesn't rely on any Replit-specific configuration files (like `.replit` or `replit.nix`), making it fully portable for local development or deployment to any hosting platform.

## API Endpoints

The MongoDB version provides these API endpoints:

### Authentication
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/send-otp` - Send verification code
- `POST /api/auth/verify-otp` - Verify OTP code
- `POST /api/auth/reset-password` - Reset password
- `PUT /api/auth/update-profile` - Update user profile

### Matches & Messages
- Various endpoints for matches, messages and date recommendations
- See `docs/mongodb-setup.md` for full details

## File Structure

- `server/models/` - MongoDB schemas
- `server/utils-mongo/` - MongoDB utilities (both `.js` and `.mjs` versions)
- `server/routes-mongo/` - API routes
- `server/server-mongo.js` - Main server file (CommonJS)
- `server/server-mongo.mjs` - Main server file (ES modules)
- `scripts/` - Setup and migration scripts (both `.js` and `.mjs` versions)
- `scripts/build-local.js` - Script to build the application for local development (CommonJS)
- `scripts/build-local.mjs` - Script to build the application for local development (ES modules)
- `dist/run-local.js` - Script to run the locally built application (CommonJS)
- `dist/run-local.mjs` - Script to run the locally built application (ES modules)
- `vite.config.local.js` - Vite configuration for local development (without Replit plugins)