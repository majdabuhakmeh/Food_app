# Food Delivery App 🍔

A Flutter food delivery application with Google Maps integration.

## 📋 Project Status
🚧 **Work in Progress** - This project is currently under development. Some features may be incomplete or contain bugs.

## 🚨 Current Issue - Help Needed!

**Map/Address Page is not working correctly** - When opening the add address page, the following errors occur:

### Errors:
1. `LateInitializationError: Field '_userModel@69018248' has not been initialized.`
2. Google Map doesn't display or respond properly
3. User data doesn't auto-populate in the form

### Affected Files:
- `lib/Pages/address/add_address_page.dart`
- `lib/controllers/user_controller.dart`
- `lib/controllers/location_controller.dart`

## 🎯 Project Overview

This is a food delivery application built with Flutter and GetX state management. The app features:
- User authentication (login/signup)
- Food menu browsing
- Cart functionality
- Address management with Google Maps
- Order placement

## 🔧 Setup Instructions

1. **Clone the repository:**
```bash
git clone [your-repository-url]
cd food_app
