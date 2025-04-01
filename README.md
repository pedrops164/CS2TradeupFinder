# Tradeup Finder

## 🚀 Overview

A comprehensive web application for Counter-Strike 2 players to discover, track, and calculate profitable trade-up contracts. This tool combines real-time market data with an advanced optimization algorithm to help players maximize their profits from in-game item trade-ups.
CS2 has about 3500 skins, each with their own exteriors and StatTrak status, which makes a brute force approach not effective.

## ✨ Features
🔍 Trade-up Discovery

- Browse a curated list of the most profitable trade-up contracts
- Real-time pricing data updated regularly from Steam Market

## 📊 Trade-up Calculator

- Input your owned items and calculate potential outcomes
- Detailed probability breakdown of all possible results
- Expected value calculations to help you make informed decisions

## 📱 User Dashboard

- Track your favorite trade-up contracts
- Save custom trade-up configurations for later reference

## 🔐 User Authentication

- Secure login via Steam OpenID

## Technical Overview
### Backend Architecture

The application backend is built with a robust architecture:

- Data Models: Well-defined database schema for items, collections, prices, and user data
- API Security: Comprehensive rate limiting and schema validation to ensure service stability
- Authentication: Secure Steam authentication integration using OpenID
- Price Updates: Scheduled jobs that regularly fetch and update skin prices from market sources
- Optimization Algorithm: Custom algorithm to find the most profitable trade-ups based on current market conditions


### Frontend Design

- Public Trade-ups Page: Browse all currently profitable trade-ups with detailed statistics
- Tracked Trade-ups: Personalized dashboard of saved/favorite trade-up contracts
- Calculator Page: Interactive tool to input items and calculate potential outcomes
- Responsive Design: Fully optimized for both desktop and mobile devices

## Running

- Configure env variables like .env.example
- Run "docker-compose up -d --build -f docker-compose-dev.yml" to run the service