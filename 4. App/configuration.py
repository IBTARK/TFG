TRANSFER_TIME = 4

# Generate the rewards, penalizations and filter classification
FILTERS_RANKING = {
    "limpio": "medium",
    "grande": "soft",
    "nuevo": "soft",
    "bonito": "soft",
    "accesible": "hard",
    "intransitado": "medium",
    "tranquilo": "medium",
    "seguro": "hard",
    "luminoso": "medium",
    "mecanico": "medium",
    "ascensor": "hard"
}

REWARDS = {
    "hard": 0.6,
    "medium": 0.75,
    "soft": 0.88
}

PENALTIES = {
    "hard": 1.5,
    "medium": 1.25,
    "soft": 1.1
}