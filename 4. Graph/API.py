from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from graph import getRoutes

app = FastAPI()

# Permite tu frontend (ajusta dominio en producción)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Cambiar en producción
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Modelo esperado desde el frontend
class RutaRequest(BaseModel):
    source: int
    destination: int
    filters: list[int]

@app.post("/ruta")
async def calcularRuta(request: RutaRequest):
    result = getRoutes(request.source, request.destination, request.filters)
    return result
