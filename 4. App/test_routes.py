# prueba_rutas.py (en la raíz de tu proyecto)

import requests

def main():
    url = "http://127.0.0.1:8000/api/routes"
    params = {
        "source": 12,
        "destination": 47,
        # Ahora enviamos varios parámetros `filters=`
        "filters": [11, 8]   # 11 → ascensor, 8 → seguro
    }

    # requests transformará automáticamente list → query multiple:
    # ?filters=11&filters=8
    resp = requests.get(url, params=params, timeout=5)
    print("STATUS:", resp.status_code)
    try:
        resp.raise_for_status()
    except requests.HTTPError:
        # Mira aquí el detalle
        try:
            print("BODY:", resp.json())
        except ValueError:
            print("BODY:", resp.text)
        return
    

    rutas = resp.json()

    print(f"Se han devuelto {len(rutas)} ruta(s):\n")
    for idx, ruta in enumerate(rutas, start=1):
        print(f"[Ruta {idx}] {ruta['description']} — {ruta['time']} min")
        for paso in ruta["path"]:
            print(f"   • {paso['station_name']} (Línea {paso['line']})")
        print()

if __name__ == "__main__":
    main()
