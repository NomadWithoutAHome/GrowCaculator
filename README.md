# 🌱 GrowCalculator - Complete Plant Value Calculator

**The most accurate plant value calculator for Roblox Grow a Garden** - featuring both a **Windows Desktop Application** and a **Modern Web Application**. Built with reverse-engineered game source code to achieve **96-100% accuracy** in all calculations.

## 🎯 Project Overview

Grow Calculator is a comprehensive tool that helps players calculate the exact value of their crops in Roblox Grow a Garden. The project consists of two main components:

1. **🌐 Web Application** - FastAPI-based web app with modern UI
2. **🖥️ Windows Desktop App** - Native Python/Tkinter application

Both applications use the same core calculation engine, ensuring consistent and accurate results across all platforms.

## 🚀 Key Features

### **🎯 Unmatched Accuracy**
- **96-100% accuracy** based on exact game source code
- **High-value plants (500k+)**: 100% accurate
- **Medium-value plants (1k-100k)**: 98-99% accurate  
- **Low-value plants (<1k)**: 96-97% accurate (±1-2 Sheckles)

### **💰 Complete Game Coverage**
- **176 plants** with exact base weights, prices, and rarities
- **72 mutations** with precise value multipliers
- **4 variants** (Normal, Silver, Gold, Rainbow) with correct multipliers
- **Additive mutation formula** exactly matching game behavior

### **⚡ Advanced Functionality**
- **Real-time calculations** with instant updates
- **Bulk value calculations** for multiple plants
- **Expected weight ranges** for realistic expectations
- **Interactive mutation selection** with search functionality
- **Shareable results** with 24-hour expiration
- **Mobile-responsive design** for web app

## 🏗️ Project Architecture

```
GrowCalculator/
├── 🌐 Website/                    # FastAPI Web Application
│   ├── main.py                   # FastAPI app entry point
│   ├── routes/                   # API routes and HTML pages
│   ├── services/                 # Business logic services
│   ├── models/                   # Pydantic data models
│   ├── templates/                # Jinja2 HTML templates
│   ├── static/                   # CSS, JS, and images
│   └── data/                     # Game data JSON files
├── 🖥️ GrowCalculatorUI.py        # Windows Desktop Application
├── 🧠 core_logic/                # Shared calculation engine
│   └── plant_calculator.py       # Core calculation algorithms
├── 📊 data/                      # Game data files
│   ├── plants.json               # Complete plant database
│   ├── variants.json             # Variant multipliers
│   └── mutations.json            # Mutation value multipliers
├── 🛠️ tools/                     # Data processing utilities
│   └── parse_mutations.py        # Mutation data parser
└── 📚 Documentation & Licenses
```

## 🖥️ Windows Desktop Application

### **Features**
- **Native Windows GUI** built with Tkinter
- **Compact interface** with collapsible design
- **Real-time calculations** as you type
- **Mutation selection popup** with search
- **Weight validation** with expected ranges
- **Professional dark theme** with green accents

### **Installation & Usage**
```bash
# Install required dependencies
pip install tkinter

# Run the desktop application
python GrowCalculatorUI.py
```

### **Screenshots & Interface**
- **Main Window**: Plant selection, variants, mutations, and weight input
- **Mutation Popup**: Searchable list of all 72 mutations
- **Results Display**: Real-time calculation updates
- **Responsive Design**: Adapts to different screen sizes

## 🌐 Web Application

### **Technology Stack**
- **Backend**: FastAPI (Python)
- **Frontend**: HTML5, Tailwind CSS, JavaScript (ES6+)
- **Database**: SQLite for shared results
- **Templates**: Jinja2 templating engine
- **Styling**: Custom CSS with responsive design

### **Key Pages**
- **Main Calculator** (`/`) - Complete plant value calculator
- **Mutation Calculator** (`/mutation-calculator`) - Dedicated mutation tool
- **About Page** (`/about`) - Project information and accuracy details
- **Share Results** (`/share/{id}`) - Temporary shared calculation pages

### **API Endpoints**
- `POST /api/calculate` - Calculate plant values
- `GET /api/plants` - Get all available plants
- `GET /api/variants` - Get variant multipliers
- `GET /api/mutations` - Get mutation data
- `POST /api/share` - Create shareable results
- `GET /api/share/{id}` - Retrieve shared results

### **Installation & Setup**
```bash
# Navigate to website directory
cd Website

# Install dependencies
pip install -r requirements.txt

# Run development server
python start.py

# Or use uvicorn directly
uvicorn main:app --host 127.0.0.1 --port 8000 --reload
```

## 🧠 Core Calculation Engine

### **Mathematical Formula**
The calculator uses the exact formula from the game:

```
Final Value = Round(Base Price × Mutation Multiplier × Variant Multiplier × (Weight Ratio)²)
```

Where:
- **Base Price**: Plant's unique base Sheckle value
- **Mutation Multiplier**: 1 + Σ(mutation.ValueMulti - 1)
- **Variant Multiplier**: Normal(×1), Silver(×5), Gold(×20), Rainbow(×50)
- **Weight Ratio**: Actual weight / Base weight (clamped to minimum 0.95)

### **Data Sources**
- **Plants**: 176 crops with exact base prices and weights
- **Mutations**: 72 environmental mutations with precise multipliers
- **Variants**: 4 rarity levels with correct game multipliers
- **All data extracted directly from game source code**

## 🛠️ Development & Contributing

### **Prerequisites**
- Python 3.8+
- pip package manager
- Git for version control

### **Local Development Setup**
```bash
# Clone the repository
git clone <repository-url>
cd GrowCalculator

# Install dependencies for both apps
pip install -r Website/requirements.txt

# Run web app
cd Website
python start.py

# Run desktop app (in another terminal)
cd ..
python GrowCalculatorUI.py
```

### **Project Structure Details**
- **`core_logic/`**: Shared calculation algorithms used by both apps
- **`data/`**: JSON files containing all game data
- **`tools/`**: Utilities for data processing and validation
- **`Website/`**: Complete FastAPI web application
- **`GrowCalculatorUI.py`**: Windows desktop application

## 📊 Performance & Accuracy

### **Calculation Speed**
- **Web App**: <50ms response time for calculations
- **Desktop App**: Real-time updates as you type
- **API Endpoints**: Optimized for high throughput

### **Data Validation**
- **Input Validation**: Weight ranges, mutation combinations
- **Error Handling**: Graceful fallbacks for invalid inputs
- **Data Integrity**: Consistent results across all platforms

## 🌟 Why Choose Grow Calculator?

1. **🎯 Unmatched Accuracy** - Based on actual game source code
2. **🔄 Cross-Platform** - Web app + Windows desktop app
3. **⚡ Real-Time** - Instant calculations and updates
4. **📱 Responsive** - Works on all devices and screen sizes
5. **🔧 Open Source** - Transparent, auditable code
6. **📊 Complete Data** - All 176 plants and 72 mutations
7. **🎨 Modern UI** - Beautiful, intuitive interfaces
8. **🚀 Fast Performance** - Optimized for speed and efficiency

## 📄 License

This project is licensed under the terms specified in the LICENSE file. The calculator uses reverse-engineered game mechanics for educational purposes.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests to improve the calculator.

## 📞 Support

For questions, issues, or feature requests:
- Check the existing issues in the repository
- Create a new issue with detailed information
- Include game version and specific calculation examples

---

**🌱 GrowCalculator** - The definitive tool for Roblox Grow a Garden players who demand accuracy and reliability.

