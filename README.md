# MatchYourVibe Dating App

A cutting-edge dating platform leveraging intelligent matching technologies to create meaningful human connections through innovative digital interactions.

## Features

- User registration and profile management
- Mood-based matching algorithm
- Real-time chat messaging system
- Date recommendations based on user preferences
- Facial verification system for enhanced security
- Premium subscription features
- Mobile-responsive design

## Technology Stack

### Core Technologies
- React frontend with mobile-responsive design
- Node.js backend with comprehensive validation
- Database options:
  - PostgreSQL (default)
  - MongoDB (alternative backend)
- TypeScript for type-safe development
- Tailwind CSS for responsive styling
- ESM module support for modern JavaScript development
- Nodemailer for secure email communication

### External Services
- AWS S3 (optional, for file storage with MongoDB backend)
- SMTP Email provider for notifications

## Getting Started

### Prerequisites
- Node.js 18+ and npm
- PostgreSQL database (for default backend) or MongoDB (for alternative backend)
- AWS S3 bucket (for MongoDB backend only)

### Installation

1. Clone the repository
```
git clone [repository-url]
cd matchyourvibe
```

2. Install dependencies
```
npm install
```

### Running the Application

#### Option 1: PostgreSQL Backend (Default)

1. Set up your environment variables in `.env` file
```
DATABASE_URL=your_postgres_connection_string
SESSION_SECRET=your_session_secret
EMAIL_USER=your_email
EMAIL_PASSWORD=your_email_password
```

2. Start the development server
```
npm run dev
```

#### Option 2: MongoDB Backend (Alternative)

1. Set up MongoDB environment variables
```
node scripts/setup-mongodb-env.mjs
```

2. Start both frontend and backend servers
```
node scripts/start-mongodb-app.mjs
```

### Migrating from PostgreSQL to MongoDB

If you're switching from PostgreSQL to MongoDB and want to migrate your existing data:

```
node scripts/migrate-pg-to-mongo.mjs
```

## Development

The application supports two distinct backend implementations:

1. **PostgreSQL Backend** (TypeScript)
   - Uses Drizzle ORM
   - Files: `server/index.ts`, `server/storage.ts`, etc.

2. **MongoDB Backend** (JavaScript/ESM)
   - Uses Mongoose ODM
   - Files: `server/server-mongo.mjs`, `server/utils-mongo/*`, etc.

## Configuration

The application uses different configuration approaches depending on the backend:

- **PostgreSQL Backend**: Environment variables in `.env` file
- **MongoDB Backend**: Configuration in `server/utils-mongo/config.mjs`

## Running in Production

For production deployment:

1. Build the application
```
npm run build
```

2. Start the production server
```
npm start
```

## Additional Scripts

- `scripts/delete-unverified.mjs` - Remove unverified email accounts
- `scripts/delete-no-photos.mjs` - Delete profiles without photos
- `scripts/delete-incomplete-profiles.mjs` - Remove incomplete user profiles

## License

[MIT License](LICENSE)