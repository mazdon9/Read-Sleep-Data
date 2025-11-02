# Sleep Data Tracker 🌙

A professional Flutter application that seamlessly integrates with **Health Connect** to provide comprehensive sleep data visualization and tracking capabilities.

## 📱 Overview

Sleep Data Tracker is a modern, intuitive mobile application designed to help users monitor and understand their sleep patterns. The app leverages Google's Health Connect platform to retrieve sleep data from various sources and presents it in a clean, user-friendly interface.

## ✨ Key Features

### 🔐 **Smart Permission Management**
- Automated Health Connect installation detection
- Streamlined permission request flow
- System-level permission dialog integration
- Graceful permission denial handling with retry options

### 📊 **Comprehensive Sleep Data Display**
- **7-Day Sleep History**: View sleep sessions from the last week
- **Professional Source Recognition**: Displays data from Google Fit, Health Connect, Samsung Health, Fitbit, Garmin, and more
- **Detailed Sleep Metrics**: 
  - Sleep duration (hours and minutes)
  - Sleep time range (bedtime to wake time)
  - Relative date formatting (Today, Yesterday, etc.)
  - Data source identification

### 🔄 **Real-time Data Management**
- **Auto-refresh**: Automatic data updates every 5 minutes
- **Pull-to-refresh**: Manual refresh capability
- **Live status indicators**: Last updated timestamp
- **Lifecycle-aware updates**: Refreshes when returning from Health Connect

### 🎨 **Modern User Experience**
- **Custom Splash Screen**: 3-second branded loading experience
- **Responsive Design**: Optimized for all Android screen sizes
- **Professional Typography**: ReadexPro font family
- **Intuitive Navigation**: Clean, Material Design 3 interface
- **Loading States**: Smooth loading indicators and transitions

## 🛠 Technical Architecture

### **State Management**
- **Flutter BLoC**: Robust state management with clear separation of concerns
- **Reactive UI**: Real-time updates based on state changes
- **Error Handling**: Comprehensive error states and recovery mechanisms

### **Data Layer**
- **Health Connect Integration**: Official `health` package v13.2.1
- **Service Pattern**: Clean architecture with dedicated HealthService
- **Data Processing**: Automatic duplicate removal and date sorting

### **UI Components**
- **Custom Widgets**: Reusable components (PrimaryButton, LoadingWidget, etc.)
- **Theme System**: Consistent design language with AppColors and AppDimensions
- **Responsive Layout**: Adaptive sizing for various device configurations

## 📋 Requirements

### **System Requirements**
- **Android**: API level 26 (Android 8.0) or higher
- **Health Connect**: Required for sleep data access
- **Permissions**: Activity recognition and health data access

### **Dependencies**
```yaml
dependencies:
flutter_bloc: ^8.1.6      # Cubit for state management
health: ^13.2.1           # Health Connect integration  
url_launcher: ^6.3.1      # External app launches
cupertino_icons: ^1.0.8   # iOS-style icons
```

## 🚀 Installation & Setup

### 1. **Clone the Repository**
```bash
git clone https://github.com/mazdon9/Read-Sleep-Data.git
cd read_sleep_data
```

### 2. **Install Dependencies**
```bash
flutter pub get
```

### 3. **Configure Health Connect**
- Install Health Connect from Google Play Store
- Grant necessary permissions when prompted
- Ensure sleep tracking is enabled in your preferred health app

### 4. **Run the Application**
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/          # App-wide constants and theme
│   └── utils/             # Utility functions and helpers
├── presentation/
│   ├── cubit/             # BLoC state management
│   ├── screens/           # Main app screens
│   └── widgets/           # Reusable UI components
└── services/              # External service integrations
```

## 🎯 Usage Flow

### **Initial Setup**
1. **App Launch**: Professional splash screen with logo
2. **Health Connect Check**: Automatic installation verification
3. **Permission Request**: System-level permission dialog

### **Data Access**
1. **Permission Grant**: Seamless continuation to data loading
2. **Data Retrieval**: Automatic 7-day sleep data fetch
3. **Display**: Clean list format with comprehensive details

### **Ongoing Usage**
1. **Auto-refresh**: Background updates every 5 minutes
2. **Manual Refresh**: Pull-to-refresh gesture support
3. **Real-time Updates**: App lifecycle-aware data synchronization

## 🔒 Privacy & Security

- **Local Processing**: All data processing occurs on-device
- **No Data Storage**: No personal data is stored permanently
- **Permission-based**: Access only granted user permissions
- **Health Connect Compliance**: Follows Google's health data guidelines

## 🛡 Error Handling

The application provides comprehensive error handling for various scenarios:

- **Health Connect Not Installed**: Direct link to Google Play Store
- **Permission Denied**: Clear messaging with retry options
- **No Data Available**: Informative empty states
- **Network Issues**: Graceful degradation and retry mechanisms

## 🔧 Development

### **Code Quality**
- **Flutter Lints**: Enforced coding standards
- **Clean Architecture**: Separation of concerns
- **Type Safety**: Strong typing throughout
- **Documentation**: Comprehensive code comments

### **Testing Support**
- Widget test infrastructure
- State management testing
- Service layer testing capabilities

## 📱 Screenshots

*Coming soon - Professional screenshots showcasing the app's interface*

## 🤝 Contributing

We welcome contributions to improve Sleep Data Tracker. Please ensure:

1. Code follows Flutter best practices
2. All tests pass before submitting
3. Documentation is updated for new features
4. Commit messages are clear and descriptive

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team**: For the exceptional framework
- **Google Health Connect**: For robust health data integration
- **Open Source Community**: For valuable packages and inspiration

## 📞 Support

For questions, issues, or feature requests, please visit our [GitHub Issues](https://github.com/mazdon9/Read-Sleep-Data/issues) page.

---

**Built with ❤️ using Flutter**

*Sleep Data Tracker - Making sleep insights accessible and beautiful*
