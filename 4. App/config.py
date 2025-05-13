TRANSFER_TIME = 4

# Generate the rewards, penalizations and filter classification
FILTERS_RANKING = {
    1: "medium", # limio
    2: "soft", # grande
    3: "soft", # nuevo
    4: "soft", # bonito
    5: "hard", # accesible
    6: "medium", # intransitado
    7: "medium", # tranquilo
    8: "hard", # seguro
    9: "medium", # luminoso
    10: "medium", # mecanico
    11: "hard" # ascensor
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

# Database 
ENGINE_URI = "mysql+pymysql://root@localhost:3306/tfgmetro?charset=utf8mb4"