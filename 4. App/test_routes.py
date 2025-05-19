import time
import requests
from concurrent.futures import ThreadPoolExecutor, as_completed

API_URL = "http://127.0.0.1:8000/api/routes"
TIMEOUT = 5
TOTAL_THREADS = 20

# Fixed parameters for all requests
PARAMS = {
    "source": 12,
    "destination": 47,
    "filters": [10]   # 11 → elevator, 8 → safe
}

def single_request(idx):
    """
    Performs a GET request to the API, measures elapsed time, and returns:
      (thread_index, status_code, elapsed_seconds, routes_list_or_None)
    """
    start = time.perf_counter()
    try:
        resp = requests.get(API_URL, params=PARAMS, timeout=TIMEOUT)
        elapsed = time.perf_counter() - start
        if resp.ok:
            return idx, resp.status_code, elapsed, resp.json()
        else:
            return idx, resp.status_code, elapsed, None
    except Exception:
        elapsed = time.perf_counter() - start
        return idx, None, elapsed, None

def main():
    results = []

    # 1) Launch all requests in parallel
    with ThreadPoolExecutor(max_workers=TOTAL_THREADS) as executor:
        futures = {executor.submit(single_request, i): i for i in range(1, TOTAL_THREADS + 1)}
        for future in as_completed(futures):
            results.append(future.result())

    # 2) Sort by index and print latency and status for each thread
    results.sort(key=lambda x: x[0])
    latencies = []
    statuses = []
    print("\n--- Latencies and status per thread ---")
    for idx, status, elapsed, _ in results:
        latencies.append(elapsed)
        statuses.append(status)
        st = status if status is not None else "ERROR"
        print(f"Thread {idx:02d}: status={st}   time={elapsed:.3f}s")

    # 3) Latency statistics
    print("\n--- Latency statistics ---")
    print(f"Min: {min(latencies):.3f}s   Avg: {sum(latencies)/len(latencies):.3f}s   Max: {max(latencies):.3f}s")

    # 4) Check that all threads returned status 200
    if any(s != 200 for s in statuses):
        print("\n❌ At least one thread did NOT return status 200. Aborting route verification.")
        return

    # 5) Create sets of routes per thread to compare
    route_sets = []
    for _, _, _, routes in results:
        s = {(r["description"], r["time"]) for r in routes}
        route_sets.append(s)

    unique_sets = {frozenset(s) for s in route_sets}

    # 6) If all sets are identical, print routes only once
    if len(unique_sets) == 1:
        print("\n✅ All responses contain the SAME set of routes.\n")
        print("--- Routes returned (printed once) ---")
        # Use the routes from the first response
        first_routes = results[0][3]
        for i, ruta in enumerate(first_routes, start=1):
            print(f"[Route {i}] {ruta['description']} — {ruta['time']} min")
            for step in ruta["path"]:
                print(f"   • {step['station_name']} (Line {step['line']})")
        print()
    else:
        print("\n⚠️ Responses are NOT identical. Different sets of routes were returned.")
        print(f"Distinct sets found: {len(unique_sets)}")

if __name__ == "__main__":
    main()
