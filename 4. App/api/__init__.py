from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager

from services.graph_services import getSubway
from .endpoints import router

"""
FastAPI application object.
The handler builds (or warms) the in-memory graph exactly once per process.
"""


@asynccontextmanager
async def lifespan(app: FastAPI):
    """
    Runs once per process on startup (before the first request)
    and once on shutdown.  We only need the startup side.
    """
    # Build the graph in memory so the first request is fast.
    getSubway()
    yield


app = FastAPI(
    title = "Metro Routing API",
    version = "1.0.0",
    lifespan = lifespan  
)

# Allow calls from any host/port while developing.
# Reduce the list to e.g. ["https://your-frontend.com"] in production.
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register all endpoints under /api by default (optional).
app.include_router(router, prefix="/api")
