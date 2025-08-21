# 🌱 GrowCalculator - FastAPI Web Application

A modern, intuitive web-based plant value calculator for Roblox Grow a Garden, built with FastAPI, Tailwind CSS, and following best practices for separation of concerns.

## 🚀 Features

- **Accurate Plant Value Calculations** - Uses exact formulas reverse-engineered from the game
- **Interactive Mutation Selection** - Easy-to-use interface for selecting and combining mutations
- **Real-time Calculations** - Instant updates as you modify inputs
- **Mobile-Responsive Design** - Works perfectly on all devices
- **Modern UI/UX** - Beautiful, intuitive interface inspired by modern web design
- **RESTful API** - Clean API endpoints for integration with other tools

## 📁 Project Structure

```
Website/
├── main.py                 # FastAPI application entry point
├── start.py               # Development server startup script
├── requirements.txt       # Python dependencies
├── models/               # Pydantic models
│   ├── __init__.py
│   └── calculator.py     # Request/response models
├── routes/               # API routes
│   ├── __init__.py
│   ├── calculator.py     # HTML page routes
│   └── api.py           # API endpoints
├── services/            # Business logic
│   ├── __init__.py
│   └── calculator_service.py  # Core calculator logic
├── templates/           # Jinja2 HTML templates
│   ├── base.html       # Base template
│   ├── index.html      # Main calculator page
│   ├── mutation_calculator.html  # Mutation calculator
│   └── codes.html      # Codes page
├── static/             # Static assets
│   ├── js/
│   │   └── main.js     # JavaScript functionality
│   └── css/
│       └── style.css   # Custom CSS styles
└── data/               # JSON data files
    ├── plants.json     # Plant data
    ├── variants.json   # Variant data
    └── mutations.json  # Mutation data
```

## 🛠️ Installation & Setup

1. **Clone or navigate to the Website directory:**
   ```bash
   cd Website
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the development server:**
   ```bash
   python start.py
   ```
   
   Or using uvicorn directly:
   ```bash
   uvicorn main:app --host 0.0.0.0 --port 8000 --reload
   ```

4. **Open your browser and visit:**
   ```
   http://localhost:8000
   ```

## 🎯 API Endpoints

### Main Pages
- `GET /` - Main calculator page
- `GET /mutation-calculator` - Dedicated mutation calculator
- `GET /codes` - Grow a Garden codes page

### API Endpoints
- `POST /api/calculate` - Calculate plant value
- `GET /api/plants` - Get all available plants
- `GET /api/variants` - Get all variants
- `GET /api/mutations` - Get all mutations
- `GET /api/plant/{plant_name}` - Get specific plant data
- `POST /api/mutation-multiplier` - Calculate mutation multiplier

## 📊 Key Features

### 🧮 Plant Value Calculator
- Select from 180+ plants
- Choose growth mutations (Normal, Silver, Gold, Rainbow)
- Apply environmental mutations with real-time preview
- Adjust weight and friend boost settings
- Get instant, accurate value calculations

### ✨ Mutation Calculator
- Interactive mutation selection interface
- Real-time multiplier calculations
- Predefined optimal combinations
- Search and filter mutations
- Export and share combinations

### 📱 Responsive Design
- Mobile-first design approach
- Touch-friendly interface
- Optimized for all screen sizes
- Fast loading and smooth animations

## 🔧 Technical Details

### Architecture
- **FastAPI** - Modern, fast web framework
- **Pydantic** - Data validation and serialization
- **Jinja2** - Template engine for server-side rendering
- **Tailwind CSS** - Utility-first CSS framework
- **Vanilla JavaScript** - No heavy frameworks, fast and lightweight

### Data Management
- JSON-based data storage for flexibility
- Service layer for business logic separation
- Type-safe models with Pydantic
- Automatic data validation

### Performance
- Async/await support throughout
- Efficient data loading and caching
- Optimized JavaScript for smooth interactions
- CDN-delivered CSS framework

## 🎨 Design Philosophy

The website is designed with the following principles:
- **User-First**: Intuitive interface that requires no learning curve
- **Performance**: Fast loading and responsive interactions
- **Accessibility**: Works for all users and devices
- **Maintainability**: Clean, well-structured code following best practices

## 🚀 Deployment

For production deployment:

1. **Install production dependencies:**
   ```bash
   pip install gunicorn
   ```

2. **Run with Gunicorn:**
   ```bash
   gunicorn main:app -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
   ```

3. **Or use Docker:**
   ```dockerfile
   FROM python:3.9-slim
   WORKDIR /app
   COPY requirements.txt .
   RUN pip install -r requirements.txt
   COPY . .
   EXPOSE 8000
   CMD ["gunicorn", "main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8000"]
   ```

## 🤝 Contributing

1. Follow PEP 8 style guidelines
2. Maintain separation of concerns
3. Add type hints to all functions
4. Update tests for new features
5. Keep documentation up to date

## 📝 License

This project is for educational purposes. Not affiliated with Roblox or Grow a Garden.

---

**Made with ❤️ for the Roblox Grow a Garden community**
