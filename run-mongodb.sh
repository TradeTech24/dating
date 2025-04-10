#!/bin/bash

# MatchYourVibe MongoDB Server Runner Script
# This script provides convenient commands for running the MongoDB version of MatchYourVibe

# Print colorful output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Display help message
function show_help {
  echo -e "${BLUE}MatchYourVibe MongoDB Server Runner${NC}"
  echo ""
  echo "Usage: ./run-mongodb.sh [command]"
  echo ""
  echo "Commands:"
  echo "  setup           Setup MongoDB environment variables"
  echo "  start           Start MongoDB server and frontend together"
  echo "  server          Start only the MongoDB server"
  echo "  frontend        Start only the frontend (pointing to MongoDB server)"
  echo "  migrate         Migrate data from PostgreSQL to MongoDB"
  echo "  help            Display this help message"
  echo ""
  echo "Examples:"
  echo "  ./run-mongodb.sh setup       # Setup MongoDB environment"
  echo "  ./run-mongodb.sh start       # Start both server and frontend"
  echo "  ./run-mongodb.sh server      # Start only MongoDB server"
  echo "  ./run-mongodb.sh frontend    # Start only frontend"
  echo ""
}

# Setup MongoDB environment
function setup_mongo {
  echo -e "${YELLOW}Setting up MongoDB environment...${NC}"
  node scripts/setup-mongodb-env.mjs
}

# Start MongoDB server and frontend together
function start_mongo {
  echo -e "${GREEN}Starting MongoDB server and frontend together...${NC}"
  node scripts/start-mongodb-app.mjs
}

# Start only the MongoDB server
function start_server {
  echo -e "${GREEN}Starting MongoDB server only...${NC}"
  echo -e "${YELLOW}To start the frontend in a separate terminal, run:${NC}"
  echo -e "${YELLOW}./run-mongodb.sh frontend${NC}"
  echo ""
  node server/server-mongo.mjs
}

# Start only the frontend (pointing to MongoDB server)
function start_frontend {
  echo -e "${GREEN}Starting frontend only (pointing to MongoDB server)...${NC}"
  echo -e "${YELLOW}Make sure the MongoDB server is running in another terminal with:${NC}"
  echo -e "${YELLOW}./run-mongodb.sh server${NC}"
  echo ""
  node scripts/start-frontend-local.js
}

# Migrate data from PostgreSQL to MongoDB
function migrate_data {
  echo -e "${YELLOW}Migrating data from PostgreSQL to MongoDB...${NC}"
  echo -e "${RED}WARNING: This will add PostgreSQL data to MongoDB.${NC}"
  echo -e "${RED}Make sure both PostgreSQL and MongoDB connection details are in your .env file.${NC}"
  
  read -p "Continue? (y/n): " choice
  case "$choice" in 
    y|Y ) node scripts/migrate-pg-to-mongo.mjs;;
    * ) echo "Migration cancelled.";;
  esac
}

# Main function
function main {
  case "$1" in
    setup)
      setup_mongo
      ;;
    start)
      start_mongo
      ;;
    server)
      start_server
      ;;
    frontend)
      start_frontend
      ;;
    migrate)
      migrate_data
      ;;
    help|--help|-h|"")
      show_help
      ;;
    *)
      echo -e "${RED}Unknown command: $1${NC}"
      show_help
      exit 1
      ;;
  esac
}

# Make script executable
chmod +x run-mongodb.sh

# Run main function
main "$@"