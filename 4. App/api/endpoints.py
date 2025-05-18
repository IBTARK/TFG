from fastapi import APIRouter, Query, HTTPException
from services.graph_services import getSubway
from graph.routing import getRoutes
from typing import List

router = APIRouter()


@router.get("/routes")
def routes(
    source: int = Query(..., description = "Origin station ID"),
    destination: int = Query(..., description = "Destination station ID"),
    filters: List[int] = Query(
        [], 
        description="Lista de IDs de características (1–11)"
    )
):
    # 2) Grab the graph (already built by lifespan handler)
    subway, linesPerStation, stationsInfo, connections = getSubway()

    # 3) Execute the routing algorithm
    try:
        result = getRoutes(
            subway,
            linesPerStation,
            stationsInfo,
            source,
            destination,
            filters,
            connections
        )
    except Exception as exc:
        # Convert internal errors into a 400 so the front-end gets a clear signal
        raise HTTPException(status_code=400, detail=str(exc)) from exc

    # 4) FastAPI automatically serialises dict / list objects to JSON
    return result
