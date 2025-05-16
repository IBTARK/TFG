import networkx as nx
import matplotlib.pyplot as plt
import matplotlib.lines as mlines
from collections import defaultdict
import numpy as np
import textwrap
from sqlalchemy import select, func
#from db import Session, Station, Connection, Line, StationCharacteristics, StationsLines, Characteristic
from collections import defaultdict
import itertools

from config import TRANSFER_TIME

def printSimpleGraph(G, align_lines = False, show_labels = True, show_transfers = True, nodes_size = 300):
    # line colors
    color_map = {
        1: "#5BBAD5", 2: "#D93F2D", 3: "#FFD400", 4: "#8B4513",
        5: "#A4C53A", 6: "#B9B1A8", 7: "#F29F05", 8: "#F4AFCB",
        9: "#A8389C", 10: "#005DAA", 11: "#008941", 12: "#A39B12",
        13: "#FFFFFF", 14: "#E3EEF9", 15: "#E8D6EC", 16: "#FDE3DB",
    }

    # 1) Generate positions
    if align_lines:
        line_ids = sorted(color_map.keys(), key=int)
        line_node_coords = defaultdict(list)
        for line in line_ids:
            edges_line = [(u, v) for u, v, data in G.edges(data=True)
                          if data.get('lineId') == line]
            H = nx.Graph()
            H.add_edges_from(edges_line)
            if H.number_of_nodes() == 0:
                continue
            ends = [n for n, d in H.degree() if d == 1]
            start = ends[0] if ends else next(iter(H.nodes()))
            order = list(nx.dfs_preorder_nodes(H, source=start))
            for idx, node in enumerate(order):
                line_node_coords[node].append((idx, -line))
        pos = {}
        for node, coords in line_node_coords.items():
            xs, ys = zip(*coords)
            pos[node] = (sum(xs) / len(xs), sum(ys) / len(ys))
        rest = [n for n in G.nodes() if n not in pos]
        if rest:
            spring = nx.spring_layout(G.subgraph(rest), seed=42, scale=2.0)
            pos.update(spring)
    else:
        pos = nx.spring_layout(G, seed=42)

    # 2) Generate labels
    labels = {}
    for n in G.nodes():
        label = ', '.join(map(str, n)) if isinstance(n, tuple) else str(n)
        labels[n] = '\n'.join(textwrap.wrap(
            label, width=15,
            break_long_words=False,
            break_on_hyphens=False
        ))

    # 3) Drawing
    fig, ax = plt.subplots(figsize=(10, 6))

    nx.draw_networkx_nodes(G, pos,
                           node_size=nodes_size,
                           node_color='lightgray',
                           ax=ax)
    if show_labels:
        nx.draw_networkx_labels(G, pos,
                                labels=labels,
                                font_size=10,
                                ax=ax)

    # 4) Edges and legend proxies
    legend_proxies = {}
    edge_groups = defaultdict(list)
    for u, v, data in G.edges(data=True):
        pair = tuple(sorted((u, v)))
        edge_groups[pair].append((u, v, data))

    for edges in edge_groups.values():
        u, v, data = edges[0]
        line = data.get('lineId')
        # if it's a transfer and transfers are not shown, skip
        if line is None and not show_transfers:
            continue
        # assign color and width
        if line is None:
            color = 'k'
            width = 1
            label_key = 'Transfer'
        else:
            color = color_map.get(line, 'k')
            width = 2
            label_key = f"Line {line}"

        patch = nx.draw_networkx_edges(
            G, pos,
            edgelist=[(u, v)],
            width=width,
            edge_color=[color],
            connectionstyle='arc3,rad=0',
            arrows=True,
            arrowstyle='-',
            ax=ax
        )[0]

        # store proxy for legend (lines and transfers if shown)
        legend_proxies.setdefault(label_key, patch)

    # 5) Legend only with present items
    handles = []
    labels_ley = []
    # present lines
    for line in sorted(color_map.keys(), key=int):
        key = f"Line {line}"
        if key in legend_proxies:
            handles.append(legend_proxies[key])
            labels_ley.append(key)
    # transfers if present and enabled
    if show_transfers and 'Transfer' in legend_proxies:
        handles.append(legend_proxies['Transfer'])
        labels_ley.append('Transfer')

    if handles:
        leg = ax.legend(handles, labels_ley,
                        title='Legend', loc='upper left', fontsize=8)
        leg.set_draggable(True)

    ax.axis('off')
    plt.tight_layout()
    plt.show()

def printMultiGraph(G):
    # 1) Layout y colores
    pos = nx.spring_layout(G, seed=42)
    # colores de líneas
    color_map = {
        1: "#5BBAD5",
        2: "#D93F2D",
        3: "#FFD400",
        4: "#8B4513",
        5: "#A4C53A",
        6: "#B9B1A8",
        7: "#F29F05",
        8: "#F4AFCB",
        9: "#A8389C",
        10: "#005DAA",
        11: "#008941",
        12: "#A39B12",
        13: "#FFFFFF",
        14: "#E3EEF9",
        15: "#E8D6EC",
        16: "#FDE3DB",
    }

    # 2) Envolver etiquetas sin cortar palabras
    labels = {
        n: '\n'.join(textwrap.wrap(n, width=15,
                                break_long_words=False,
                                break_on_hyphens=False))
        for n in G.nodes()
    }

    # 3) Agrupar aristas para curvarlas
    edge_groups = defaultdict(list)
    for u, v, key, data in G.edges(keys=True, data=True):
        pair = tuple(sorted((u, v)))
        edge_groups[pair].append((u, v, key, data))

    # 4) Dibujado
    fig, ax = plt.subplots(figsize=(4, 4))

    # 4a) Nodos y etiquetas
    nx.draw_networkx_nodes(G, pos, node_size=300, node_color='lightgray', ax=ax)
    nx.draw_networkx_labels(G, pos, labels=labels, font_size=8, ax=ax)

    # 4b) Aristas curvas con más curvatura para distinguirlas mejor
    legend_proxies = {}
    for pair, edges in edge_groups.items():
        n = len(edges)
        # ahora usamos factor 0.2 en lugar de 0.05
        radii = [(i - (n - 1)/2)*0.2 for i in range(n)]
        for rad, (u, v, key, data) in zip(radii, edges):
            lc = nx.draw_networkx_edges(
                G, pos,
                edgelist=[(u, v)],
                width=2,
                edge_color=[color_map[data['lineId']]],
                connectionstyle=f'arc3,rad={rad}',
                ax=ax
            )[0]
            if data['lineId'] not in legend_proxies:
                legend_proxies[data['lineId']] = lc

    # 4c) Leyenda draggable
    handles = [legend_proxies[line] for line in sorted(legend_proxies)]
    labels_ley = [f"Línea {line}" for line in sorted(legend_proxies)]
    leg = ax.legend(handles, labels_ley, title='Líneas', loc='upper left', fontsize=8)
    leg.set_draggable(True)

    # 5) Ajustar límites para incluir etiquetas
    fig.canvas.draw()
    renderer = fig.canvas.get_renderer()
    x_text, y_text = [], []
    for text in ax.texts:
        bbox = text.get_window_extent(renderer)
        corners = np.array([[bbox.x0, bbox.y0],[bbox.x1, bbox.y0],[bbox.x1, bbox.y1],[bbox.x0, bbox.y1]])
        data_corners = ax.transData.inverted().transform(corners)
        x_text.extend(data_corners[:,0]); y_text.extend(data_corners[:,1])

    xs, ys = zip(*pos.values())
    all_x = list(xs) + x_text; all_y = list(ys) + y_text
    min_x, max_x = min(all_x), max(all_x); min_y, max_y = min(all_y), max(all_y)
    dx, dy = max_x - min_x, max_y - min_y; pad = 0.05
    ax.set_xlim(min_x - pad*dx, max_x + pad*dx)
    ax.set_ylim(min_y - pad*dy, max_y + pad*dy)

    # 6) Mostrar
    ax.axis('off')
    plt.tight_layout()
    plt.show()


"""subway = nx.Graph()

subway.add_node(
                ("San Bernardo", 4),
                name = "San Bernardo",
                address = "San Bernardo",
                description = "San Bernardo",
                characteristics =  {}
)

subway.add_node(
                ("Ventura Rodriguez", 3),
                name = "Ventura Rodriguez",
                address = "Ventura Rodriguez",
                description = "Ventura Rodriguez",
                characteristics =  {}
)

subway.add_node(
                ("Príncipe Pío", 6),
                name = "Príncipe Pío",
                address = "Príncipe Pío",
                description = "Príncipe Pío",
                characteristics =  {}
)

subway.add_node(
                ("Arguelles", 6),
                # Information to save in the node
                name = "Arguelles",
                address = "Arguelles",
                description = "Esta en Arguelles",
                characteristics =  {}
            )

subway.add_node(
                ("Arguelles", 3),
                # Information to save in the node
                name = "Arguelles",
                address = "Arguelles",
                description = "Esta en Arguelles",
                characteristics =  {}
            )

subway.add_node(
                ("Arguelles", 4),
                # Information to save in the node
                name = "Arguelles",
                address = "Arguelles",
                description = "Esta en Arguelles",
                characteristics =  {}
            )

subway.add_node(
                ("Moncloa", 3),
                # Information to save in the node
                name = "Moncloa",
                address = "Moncloa",
                description = "Esta en Moncloa",
                characteristics =  {}
            )

subway.add_node(
                ("Moncloa", 6),
                # Information to save in the node
                name = "Moncloa",
                address = "Moncloa",
                description = "Esta en Moncloa",
                characteristics =  {}
            )

subway.add_node(
                ("Ciudad Universitaria", 6),
                # Information to save in the node
                name = "Ciudad Universitaria",
                address = "Ciudad Universitaria",
                description = "Esta en Ciudad Universitaria",
                characteristics =  {}
            )

subway.add_edge(
                ("San Bernardo", 4),
                ("Arguelles", 4),
                time = 3,
                weight = 3,
                lineId = 4
            )

subway.add_edge(
                ("Ventura Rodriguez", 3),
                ("Arguelles", 3),
                time = 3,
                weight = 3,
                lineId = 3
            )

subway.add_edge(
                ("Príncipe Pío", 6),
                ("Arguelles", 6),
                time = 3,
                weight = 3,
                lineId = 6
            )

subway.add_edge(
                ("Moncloa", 3),
                ("Arguelles", 3),
                time = 3,
                weight = 3,
                lineId = 3
            )

subway.add_edge(
                ("Moncloa", 6),
                ("Arguelles", 6),
                time = 3,
                weight = 3,
                lineId = 6
            )

subway.add_edge(
                ("Ciudad Universitaria", 6),
                ("Moncloa", 6),
                time = 3,
                weight = 3,
                lineId = 6
            )

subway.add_edge(
                ("Arguelles", 3),
                ("Arguelles", 4),
                time = 3,
                weight = 3,
                lineId = None
            )

subway.add_edge(
                ("Arguelles", 3),
                ("Arguelles", 6),
                time = 3,
                weight = 3,
                lineId = None
            )

subway.add_edge(
                ("Arguelles", 4),
                ("Arguelles", 6),
                time = 3,
                weight = 3,
                lineId = None
            )

subway.add_edge(
                ("Moncloa", 3),
                ("Moncloa", 6),
                time = 3,
                weight = 3,
                lineId = None
            )

printSimpleGraph(subway)"""