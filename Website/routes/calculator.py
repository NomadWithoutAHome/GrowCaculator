"""
Main calculator routes for rendering HTML pages.
"""
from fastapi import APIRouter, Request
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse

from services.calculator_service import calculator_service

router = APIRouter()
templates = Jinja2Templates(directory="templates")


@router.get("/", response_class=HTMLResponse)
async def home(request: Request):
    """Main calculator page."""
    return templates.TemplateResponse(
        "index.html",
        {
            "request": request,
            "plants": calculator_service.get_plant_names(),
            "variants": calculator_service.get_variants(),
            "mutations": calculator_service.get_mutations(),
        }
    )


@router.get("/mutation-calculator", response_class=HTMLResponse)
async def mutation_calculator(request: Request):
    """Dedicated mutation calculator page."""
    return templates.TemplateResponse(
        "mutation_calculator.html",
        {
            "request": request,
            "mutations": calculator_service.get_mutations(),
        }
    )


@router.get("/about", response_class=HTMLResponse)
async def about(request: Request):
    """About page."""
    return templates.TemplateResponse(
        "about.html",
        {"request": request}
    )
