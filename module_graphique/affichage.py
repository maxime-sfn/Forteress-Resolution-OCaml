import pygame
import csv

import csv

csv_file = 'game_board.csv'

def modify_csv_table(file):
    with open(file, mode='r', newline='') as csv_file:
        csv_reader = csv.reader(csv_file)
        data = list(csv_reader)

    for row in range(len(data)):
        for col in range(len(data[row])):
            if (col != 0 and data[row][col-1] in ("51","52") and col != len(data[row]) - 1 and data[row][col+1] in ("51","52")):
                data[row][col] = str(21)
            
            if (row != 0 and data[row-1][col] in ("51","52") and row != len(data) - 1 and data[row+1][col] in ("51","52")):
                data[row][col] = str(22)
            
            if data[row][col] in ("1","12","13","14","15","1213","1214","1215","1314","1315","1415","121314","121315","131415") :
                if row%2 == 0 and col%2 == 0 :
                    if row != 0 :
                        if data[row-1][col] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526","12131415") :
                            if data[row][col] == "1" :
                                data[row][col] = str(12)
                            elif data[row][col] == "12" :
                                data[row][col] = str(12)
                            elif data[row][col] == "13" :
                                data[row][col] = str(1213)
                            elif data[row][col] == "14" :
                                data[row][col] = str(1214)
                            elif data[row][col] == "15" :
                                data[row][col] = str(1215)
                            elif data[row][col] == "1314" :
                                data[row][col] = str(121314)
                            elif data[row][col] == "1315" :
                                data[row][col] = str(121315)
                            elif data[row][col] == "1415" :
                                data[row][col] = str(121415)
                            elif data[row][col] == "131415" :
                                data[row][col] = str(12131415)

                    if row != len(data) - 1 :
                        if data[row+1][col] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526","12131415") :
                            if data[row][col] == "1" :
                                data[row][col] = str(13)
                            elif data[row][col] == "12" :
                                data[row][col] = str(1213)
                            elif data[row][col] == "13" :
                                data[row][col] = str(13)
                            elif data[row][col] == "14" :
                                data[row][col] = str(1314)
                            elif data[row][col] == "15" :
                                data[row][col] = str(1315)
                            elif data[row][col] == "1214" :
                                data[row][col] = str(121314)
                            elif data[row][col] == "1215" :
                                data[row][col] = str(121315)
                            elif data[row][col] == "1415" :
                                data[row][col] = str(131415)
                            elif data[row][col] == "121415" :
                                data[row][col] = str(12131415)
                                
                    if col != 0 :
                        if data[row][col-1] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526","12131415") :
                            if data[row][col] == "1" :
                                data[row][col] = str(14)
                            elif data[row][col] == "12" :
                                data[row][col] = str(1214)
                            elif data[row][col] == "13" :
                                data[row][col] = str(1314)
                            elif data[row][col] == "14" :
                                data[row][col] = str(14)
                            elif data[row][col] == "15" :
                                data[row][col] = str(1415)
                            elif data[row][col] == "1213" :
                                data[row][col] = str(121314)
                            elif data[row][col] == "1215" :
                                data[row][col] = str(121415)
                            elif data[row][col] == "1315" :
                                data[row][col] = str(1315)
                            elif data[row][col] == "121315" :
                                data[row][col] = str(12131415)
                            
                    if col != len(data[row]) - 1 :
                        if data[row][col+1] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526","12131415") :
                            if data[row][col] == "1" :
                                data[row][col] = str(15)
                            elif data[row][col] == "12" :
                                data[row][col] = str(1215)
                            elif data[row][col] == "13" :
                                data[row][col] = str(1315)
                            elif data[row][col] == "14" :
                                data[row][col] = str(1415)
                            elif data[row][col] == "15" :
                                data[row][col] = str(15)
                            elif data[row][col] == "1213" :
                                data[row][col] = str(121315)
                            elif data[row][col] == "1214" :
                                data[row][col] = str(121415)
                            elif data[row][col] == "1314" :
                                data[row][col] = str(131415)
                            elif data[row][col] == "121314" :
                                data[row][col] = str(12131415)
                                
            if data[row][col] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526"):
                if row%2 == 0 and col%2 == 1 :
                    data[row][col] = str(2526)
                elif row%2 == 1 and col%2 == 0 :
                    data[row][col] = str(2324)
                else :
                    if row != 0 :
                        if data[row-1][col] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526"):
                            if data[row][col] == "2":
                                data[row][col] = str(23)
                            elif data[row][col] == "24":
                                data[row][col] = str(2324)
                            elif data[row][col] == "25":
                                data[row][col] = str(2325)
                            elif data[row][col] == "26":
                                data[row][col] = str(2326)
                            elif data[row][col] == "2425":
                                data[row][col] = str(232425)
                            elif data[row][col] == "2426":
                                data[row][col] = str(232426)
                            elif data[row][col] == "2526":
                                data[row][col] = str(232526)
                            elif data[row][col] == "242526":
                                data[row][col] = str(23242526)
                                
                    if row != len(data) - 1 :
                        if data[row+1][col] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526"):
                            if data[row][col] == "2":
                                data[row][col] = str(24)
                            elif data[row][col] == "23":
                                data[row][col] = str(2324)
                            elif data[row][col] == "25":
                                data[row][col] = str(2425)
                            elif data[row][col] == "26":
                                data[row][col] = str(2426)
                            elif data[row][col] == "2325":
                                data[row][col] = str(232425)
                            elif data[row][col] == "2326":
                                data[row][col] = str(232426)
                            elif data[row][col] == "2526":
                                data[row][col] = str(242526)
                            elif data[row][col] == "232526":
                                data[row][col] = str(23242526)
                                
                    if col != 0 :
                        if data[row][col-1] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526"):
                            if data[row][col] == "2":
                                data[row][col] = str(25)
                            elif data[row][col] == "23":
                                data[row][col] = str(2325)
                            elif data[row][col] == "24":
                                data[row][col] = str(2425)
                            elif data[row][col] == "26":
                                data[row][col] = str(2526)
                            elif data[row][col] == "2324":
                                data[row][col] = str(232425)
                            elif data[row][col] == "2326":
                                data[row][col] = str(232526)
                            elif data[row][col] == "2426":
                                data[row][col] = str(242526)
                            elif data[row][col] == "232426":
                                data[row][col] = str(23242526)
                                
                    if col != len(data[row]) - 1 :
                        if data[row][col+1] in ("2","23","24","25","26","2324","2325","2326","2425","2426","2526","232425","232426","232526","242526","23242526"):
                            if data[row][col] == "2":
                                data[row][col] = str(26)
                            elif data[row][col] == "23":
                                data[row][col] = str(2326)
                            elif data[row][col] == "24":
                                data[row][col] = str(2426)
                            elif data[row][col] == "25":
                                data[row][col] = str(2526)
                            elif data[row][col] == "2324":
                                data[row][col] = str(232426)
                            elif data[row][col] == "2325":
                                data[row][col] = str(232526)
                            elif data[row][col] == "2425":
                                data[row][col] = str(242526)
                            elif data[row][col] == "232425":
                                data[row][col] = str(23242526)

    with open(file, mode='w', newline='') as csv_file:
        csv_writer = csv.writer(csv_file)
        csv_writer.writerows(data)

modify_csv_table(csv_file)

WHITE = (255, 255, 255)

pygame.init()

with open('game_board.csv', newline='') as f:
    reader = csv.reader(f)
    game_map = list(reader)
    TILE_SIZE = 60 
    WIDTH = len(game_map[0]) * TILE_SIZE
    HEIGHT = len(game_map) * TILE_SIZE

screen = pygame.display.set_mode((WIDTH, HEIGHT), pygame.RESIZABLE)
pygame.display.set_caption("Fortress")

TILE_SIZES = {
    '0': 60, # Taille des soldats non placé
    '3': 60, # Taille des soldats rouges
    '4': 60, # Taille des soldats bleus
    '1': 60,  # Taille des murs non placé
    '12':60, # Taille des murs (en pointe)
    '13':60, # Taille des murs (en pointe)
    '14':60, # Taille des murs (en pointe)
    '15':60, # Taille des murs (en pointe)
    '1213':60, # Taille des murs (en pointe)
    '1214':60, # Taille des murs (en pointe)
    '1215':60, # Taille des murs (en pointe)
    '1314':60, # Taille des murs (en pointe)
    '1315':60, # Taille des murs (en pointe)
    '1415':60, # Taille des murs (en pointe)
    '121314':60, # Taille des murs (en pointe)
    '121315':60, # Taille des murs (en pointe)
    '121415':60, # Taille des murs (en pointe)
    '131415':60, # Taille des murs (en pointe)
    '2': 60,  # Taille des murs placé
    '21': 60, # Taille des murs horizontal
    '22': 60, # Taille des murs vertical
    '23': 60, # Taille des murs placé (tout n'est pas rempli)
    '24': 60, # Taille des murs placé (tout n'est pas rempli)
    '25': 60, # Taille des murs placé (tout n'est pas rempli)
    '26': 60, # Taille des murs placé (tout n'est pas rempli)
    '2324': 60, # Taille des murs placé (tout n'est pas rempli)
    '2325': 60, # Taille des murs placé (tout n'est pas rempli)
    '2326': 60, # Taille des murs placé (tout n'est pas rempli)
    '2425': 60, # Taille des murs placé (tout n'est pas rempli)
    '2426': 60, # Taille des murs placé (tout n'est pas rempli)
    '2526': 60, # Taille des murs placé (tout n'est pas rempli)
    '232425': 60, # Taille des murs placé (tout n'est pas rempli)
    '232426': 60, # Taille des murs placé (tout n'est pas rempli)
    '232526': 60, # Taille des murs placé (tout n'est pas rempli)
    '242526': 60, # Taille des murs placé (tout n'est pas rempli)
    '23242526' : 60,
    '12131415': 60,
    '51':60, # Taille de la forteresse
    '52':60, # Taille de la tour
    '-1': 60, # Taille des cases inutilisable
}

tile_images = {
    '0': pygame.transform.scale(pygame.image.load('empty_piece.png'), (TILE_SIZES['0'], TILE_SIZES['0'])),
    '3': pygame.transform.scale(pygame.image.load('soldat_rouge.jpg'), (TILE_SIZES['3'], TILE_SIZES['3'])),
    '4': pygame.transform.scale(pygame.image.load('soldat_blue.jpg'), (TILE_SIZES['4'], TILE_SIZES['4'])),
    '1': pygame.transform.scale(pygame.image.load('mur1.jpeg'), (TILE_SIZES['1'], TILE_SIZES['1'])),
    '12': pygame.transform.scale(pygame.image.load('mur12.jpg'), (TILE_SIZES['12'], TILE_SIZES['12'])),
    '13': pygame.transform.scale(pygame.image.load('mur13.jpg'), (TILE_SIZES['13'], TILE_SIZES['13'])),
    '14': pygame.transform.scale(pygame.image.load('mur14.jpg'), (TILE_SIZES['14'], TILE_SIZES['14'])),
    '15': pygame.transform.scale(pygame.image.load('mur15.jpg'), (TILE_SIZES['15'], TILE_SIZES['15'])),
    '1213': pygame.transform.scale(pygame.image.load('mur1213.jpg'), (TILE_SIZES['1213'], TILE_SIZES['1213'])),
    '1214': pygame.transform.scale(pygame.image.load('mur1214.jpg'), (TILE_SIZES['1214'], TILE_SIZES['1214'])),
    '1215': pygame.transform.scale(pygame.image.load('mur1215.jpg'), (TILE_SIZES['1215'], TILE_SIZES['1215'])),
    '1314': pygame.transform.scale(pygame.image.load('mur1314.jpg'), (TILE_SIZES['1314'], TILE_SIZES['1314'])),
    '1315': pygame.transform.scale(pygame.image.load('mur1315.jpg'), (TILE_SIZES['1315'], TILE_SIZES['1315'])),
    '1415': pygame.transform.scale(pygame.image.load('mur1415.jpg'), (TILE_SIZES['1415'], TILE_SIZES['1415'])),
    '121314': pygame.transform.scale(pygame.image.load('mur121314.jpg'), (TILE_SIZES['121314'], TILE_SIZES['121314'])),
    '121315': pygame.transform.scale(pygame.image.load('mur121315.jpg'), (TILE_SIZES['121315'], TILE_SIZES['121315'])),
    '121415': pygame.transform.scale(pygame.image.load('mur121415.jpg'), (TILE_SIZES['121415'], TILE_SIZES['121415'])),
    '131415': pygame.transform.scale(pygame.image.load('mur131415.jpg'), (TILE_SIZES['131415'], TILE_SIZES['131415'])),
    '12131415' : pygame.transform.scale(pygame.image.load('mur2.jpg'), (TILE_SIZES['2'], TILE_SIZES['2'])),
    '2': pygame.transform.scale(pygame.image.load('mur2.jpg'), (TILE_SIZES['2'], TILE_SIZES['2'])),
    '21': pygame.transform.scale(pygame.image.load('mur21.jpg'), (TILE_SIZES['21'], TILE_SIZES['21'])),
    '22': pygame.transform.scale(pygame.image.load('mur22.jpg'), (TILE_SIZES['22'], TILE_SIZES['22'])),
    '23': pygame.transform.scale(pygame.image.load('mur23.jpg'), (TILE_SIZES['23'], TILE_SIZES['23'])),
    '24': pygame.transform.scale(pygame.image.load('mur24.jpg'), (TILE_SIZES['24'], TILE_SIZES['24'])),
    '25': pygame.transform.scale(pygame.image.load('mur25.jpg'), (TILE_SIZES['25'], TILE_SIZES['25'])),
    '26': pygame.transform.scale(pygame.image.load('mur26.jpg'), (TILE_SIZES['26'], TILE_SIZES['26'])),
    '2324': pygame.transform.scale(pygame.image.load('mur2324.jpg'), (TILE_SIZES['2324'], TILE_SIZES['2324'])),
    '2325': pygame.transform.scale(pygame.image.load('mur2325.jpg'), (TILE_SIZES['2325'], TILE_SIZES['2325'])),
    '2326': pygame.transform.scale(pygame.image.load('mur2326.jpg'), (TILE_SIZES['2326'], TILE_SIZES['2326'])),
    '2425': pygame.transform.scale(pygame.image.load('mur2425.jpg'), (TILE_SIZES['2425'], TILE_SIZES['2425'])),
    '2426': pygame.transform.scale(pygame.image.load('mur2426.jpg'), (TILE_SIZES['2426'], TILE_SIZES['2426'])),
    '2526': pygame.transform.scale(pygame.image.load('mur2526.jpg'), (TILE_SIZES['2526'], TILE_SIZES['2526'])),
    '232425': pygame.transform.scale(pygame.image.load('mur232425.jpg'), (TILE_SIZES['232425'], TILE_SIZES['232425'])),
    '232426': pygame.transform.scale(pygame.image.load('mur232426.jpg'), (TILE_SIZES['232426'], TILE_SIZES['232426'])),
    '232526': pygame.transform.scale(pygame.image.load('mur232526.jpg'), (TILE_SIZES['232526'], TILE_SIZES['232526'])),
    '242526': pygame.transform.scale(pygame.image.load('mur242526.jpg'), (TILE_SIZES['242526'], TILE_SIZES['242526'])),
    '23242526': pygame.transform.scale(pygame.image.load('mur2.jpg'), (TILE_SIZES['2'], TILE_SIZES['2'])),
    '51': pygame.transform.scale(pygame.image.load('forteress_bleu.jpg'), (TILE_SIZES['51'], TILE_SIZES['51'])),
    '52': pygame.transform.scale(pygame.image.load('tour_bleu.jpg'), (TILE_SIZES['52'], TILE_SIZES['52'])),
    '-1': pygame.transform.scale(pygame.image.load('black.jpg'), (TILE_SIZES['-1'], TILE_SIZES['-1'])),
}

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill(WHITE)

    for y, row in enumerate(game_map):
        for x, tile in enumerate(row):
            if tile in tile_images:
                tile_size = TILE_SIZES[tile]
                screen.blit(tile_images[tile], (x * tile_size, y * tile_size))

    pygame.display.flip()

pygame.quit()