
# Meeting Manager iOS App

A beautiful and intuitive SwiftUI-based iOS application for managing meetings and events. Built with modern SwiftUI components and featuring a clean, user-friendly interface.

## 📱 Features

- **Meeting Categories**: Filter meetings by categories (Upcoming, On Hold, Past, Canceled)
- **Interactive Meeting Cards**: View meeting details with time, participants, and join options
- **Avatar Stack**: Display participant avatars with overlapping design
- **Category Filtering**: Smooth animated transitions between different meeting categories
- **Toggle Controls**: Enable/disable meeting notifications
- **Modern UI**: Clean design with custom colors and rounded corners

## 🛠️ Technologies Used

- **SwiftUI**: Modern declarative UI framework
- **Swift 5.0+**: Latest Swift language features
- **iOS 15.0+**: Target deployment
- **Xcode**: Development environment

## 🏗️ Project Structure

The app is built with a modular SwiftUI architecture:

### Core Components

- **ContentView**: Main app interface with scrollable meeting list
- **HeaderView**: Top navigation with user profile and add button
- **CategoryBtn**: Interactive category filter buttons
- **CardView**: Individual meeting card display
- **AvatarView & AvatarStack**: User profile image components
- **nameView**: Welcome message and title section

### Data Models

- **Category**: Enum for meeting categories
- **CardItem**: Meeting data model with mock data support

## 🎨 UI Components

### Meeting Cards
Each meeting card displays:
- Meeting time and duration
- Meeting title
- Number of participants
- Participant avatars (overlapping design)
- Join button
- Toggle for notifications

### Category Navigation
- Horizontal scrollable category buttons
- Animated selection states
- Green accent color for active category

### Color Scheme
- Custom app background (`appBG`)
- Category-specific card colors (`appBrown`, `appGreen`, `appLightblue`)
- White text with opacity variations

## 📋 Mock Data

The app includes sample meeting data with:
- Different meeting types (Development, New Site, Interview)
- Various time slots
- Multiple participant counts
- Different categories for filtering

  ## 📋 UIImage
<img width="322" height="616" alt="Screenshot 2025-09-09 at 23 06 47" src="https://github.com/user-attachments/assets/2d463795-58f5-4bdd-8992-725817f58d7e" />

## 🚀 Getting Started

### Prerequisites
- Xcode 14.0 or later
- iOS 15.0 or later
- Swift 5.0 or later


