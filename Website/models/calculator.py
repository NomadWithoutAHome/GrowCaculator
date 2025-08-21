"""
Pydantic models for calculator requests and responses.
"""
from typing import List, Optional
from pydantic import BaseModel, Field


class PlantData(BaseModel):
    """Plant data model."""
    name: str
    base_weight: float
    base_price: int
    rarity: int


class VariantData(BaseModel):
    """Variant data model."""
    name: str
    multiplier: int


class MutationData(BaseModel):
    """Mutation data model."""
    name: str
    value_multi: int


class CalculationRequest(BaseModel):
    """Request model for plant value calculation."""
    plant_name: str = Field(..., description="Name of the plant")
    variant: str = Field(default="Normal", description="Plant variant")
    weight: float = Field(..., gt=0, description="Weight in kg")
    mutations: List[str] = Field(default=[], description="List of mutation names")
    plant_amount: int = Field(default=1, ge=1, le=10000, description="Number of plants")


class CalculationResponse(BaseModel):
    """Response model for plant value calculation."""
    plant_name: str
    variant: str
    weight: float
    mutations: List[str]
    mutation_multiplier: float
    base_value: float
    weight_ratio: float
    final_value: int
    plant_amount: int
    total_value: int  # final_value * plant_amount


class PlantListResponse(BaseModel):
    """Response model for plant list."""
    plants: List[str]


class VariantListResponse(BaseModel):
    """Response model for variant list."""
    variants: List[VariantData]


class MutationListResponse(BaseModel):
    """Response model for mutation list."""
    mutations: List[MutationData]
