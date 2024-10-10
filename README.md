## Links
[Last installer file & bin folder ](https://drive.google.com/drive/folders/1Hb-j8Zmo-gKFZlAstXp-daeYdYgUizCx?usp=sharing)



## Features

- **WebView2 Integration**: Embeds a WebView2 control to access the Flip2PDF service for PDF conversions.
- **Silent Installation**: The installer supports silent mode with parameters for tracking affiliates via affid and subid.
- **Custom Installer**: The project includes a custom installer with an icon, desktop shortcuts, and automatic launch after installation.
- **Cross-Platform Deployment**: Utilizes .NET 8.0 for building the application with Windows WPF support.

## Prerequisites

- **.NET 8.0 SDK**: Ensure that .NET 8.0 SDK is installed.
- **WebView2 Runtime**: The application relies on the WebView2 runtime, which is automatically installed if not already present on the system.

## Building the Project

1. Open the `Installer.iss` 
2. Change the parameter `CodeFile` at the top of the ISS file to the local path where the source code files are.
3. Change the parameter `ThankYou` to your thank you page link.
4. Change the parameter `Affid`.
5. Change the parameter `Subid`.
6. Run `Installer.iss`.
7. After run `Installer.iss` you can find the install file (.exe) on `PDFConverterWebView2/Installers`.


## Installation

1. End users will get the exe file in the `PDFConverterWebView2/Installers` folder.
2. Run the installer. (silent installation).
3. The application will automatically launch after installation and a thank you page will be opened in a browser.
4. Users will also be able to run the app at any time via a shortcut on their desktop.
5. The file `PDFConverter` will be installed in folder `C:\`.

## Building the Project

```
PDFConverterWebView2/
│
├── bin/Release/                       # Output folder for compiled binaries
├── Installers/                        # Folder containing the installer
├── Resources/                         # Folder for application icons and other resources
│   └── Logo.ico                       # Icon used for the application
├── App.xaml                           # Application startup XAML definition
├── App.xaml.cs                        # App.xaml C# logic
├── MainWindow.xaml                    # Main application window XAML with WebView2
├── MainWindow.xaml.cs                 # MainWindow logic
├── PDFConverterWebView2.csproj        # Project file
└── Installer.iss                          # Inno Setup script for building the installer
```

## Usage

Once installed, the application launches a window with a web interface for the Flip2PDF service. Users can easily convert their files by navigating to the Flip2PDF site within the embedded WebView2 control.

## Developer Comments

We were unable to activate the icon in the top bar of the application

