#DESAFIO 2 MELHOR PROGRAMA

programas_horas = {
                         1:{
                             'nome':['Aldeia Global 2019'],
                             'horas':['09:00'],
                             'votos':(0)
                             }, 
                         
                         2:{
                             'nome':['Ano em Revista 2019'],
                             'horas':['09:30'],
                             'votos':(0)
                             }, 
                         
                         3:{
                             'nome':['Assim Nao'],
                             'horas':['10:30'],
                             'votos':(0)
                             }, 
                         
                         4:{
                             'nome':['Ciencia da Idade'],
                             'horas':['11:00'],
                             'votos':(0)
                             }, 
                         
                         5:{
                             'nome':['Dossier de Imprensa 2019'],
                             'horas':['11:30'],
                             'votos':(0)
                             }, 
                         
                         6:{
                             'nome':['Em busca do Museu desconhecido'],
                             'horas':['12:00'],
                             'votos':(0)
                             },  
                         
                         7:{
                             'nome':['Em Entrevista 2019'],
                             'horas':['12:40'],
                             'votos':(0)
                             }, 
                         
                         8:{
                             'nome':['Mulher Fatal'],
                             'horas':['13:30'],
                             'votos':(0)
                             },   
                         
                         9:{
                             'nome':['Nem Mais Nem Menos 2020'],
                             'horas':['14:30'],
                             'votos':(0)
                             },   
                         
                         10:{
                             'nome':['Teoria da Verdade'],
                             'horas':['15:00'],
                             'votos':(0)
                             },  
                         
                         11:{
                             'nome':['Viva a Musica'],
                             'horas':['15:45'],
                             'votos':(0)
                             },   
                         
                         12:{
                             'nome':['Photo Madeira'],
                             'horas':['16:30'],
                             'votos':(0)
                             },  
                         
                         13:{
                             'nome':['Mar, a Ultima Fronteira'],
                             'horas':['17:30'],
                             'votos':(0)
                             },   
                         
                         14:{
                             'nome':['Gunther Maul'],
                             'horas':['18:30'],
                             'votos':(0)
                             },  
                         
                         15:{
                             'nome':['RTP 3 (Madeira)'],
                             'horas':['19:00'],
                             'votos':(0)
                             },  
                         
                         16:{
                             'nome':['Noticias do Atlantico'],
                             'horas':['19:00'],
                             'votos':(0)
                             },  
                         
                         17:{
                             'nome':['Atlantida Madeira 2020'],
                             'horas':['19:27'],
                             'votos':(0)
                             },   
                         
                         18:{
                             'nome':['Telejornal Madeira'],
                             'horas':['21:00'],
                             'votos':(0)
                             },  
                         
                         19:{
                             'nome':['Viva a Musica'],
                             'horas':['21:00'],
                             'votos':(0)
                             },  
                         
                         20:{
                             'nome':['Portugueses pelo Mundo'],
                             'horas':['22:35'],
                             'votos':(0)
                             },                            
                         }

def valida(mensagem, i): #esta funcao e chamada ao longo do programa para validar numeros introduzidos pelo utilizador
    while True: 
        try:
            votacao = int(input(mensagem))
        except ValueError:
            print('Input invalido')
            continue
        if votacao <= 0 or votacao >= i:
            print ('Input invalido')
        else:
            return votacao

def sem_votos():
    cont = 0 
    for x in programas_horas:
        if programas_horas[x]['votos'] == 0:
            cont += 1
    if cont == 20:
        return False

# Parte 1
def pedir_numero_votos():
    retornar = valida('Numero de votos a fazer: ',500) #o numero de votos esta limitado a 499, pois, pelo funcionamento do nosso programa e necessario um limite (o mesmo pode ser alterado para qualquer numero inteiro)
    return retornar

def vota_programa(i):
    for x in programas_horas:
        print(str(x) + ' -> '+ ''.join(programas_horas[x]['nome']) + ' - '+ ''.join(programas_horas[x]['horas']))
    for y in range(0,i):
        programa = (valida('Numero do Programa: ',21))
        print ('Votou no' + ' - ' + ''.join(programas_horas[programa]['nome']))
        programas_horas[programa]['votos'] += 1
    return 0
    
# Parte 2
def ver_programas():
    total=0
    if sem_votos() == False:
        return 'Sem Votos'
    print("""
    Todos os Programas com votos:""")
    for x in programas_horas:
        if programas_horas[x]['votos'] != 0:
            print(x,'-> ', ''.join(programas_horas[x]['nome']) , ' -- Votos -> ', programas_horas[x]['votos'])
    for x in programas_horas:
        total = total + (programas_horas[x]['votos'])
    print ('Numero Total de Votos: ',total)    
    return ''
       
# Parte 3
def percentagem():
    if sem_votos() == False:
        return 'Sem Votos'    
    cont = 0
    lista=[]
    
    for x in programas_horas:
        cont = cont + (programas_horas[x]['votos'])
    print ('Numero de votos: ',cont)
    
    for x in programas_horas:
        if programas_horas[x]['votos'] != 0:
            lista = lista + [x] 
    
    for x in lista:
        i = programas_horas[x]['votos']
        percentagem = i / cont * 100
        aprox = round(percentagem , 2)
        print(x,'-> ', ''.join(programas_horas[x]['nome']) , ' -- Percentagem de votos -> ', aprox, '%')
                

resposta = True
while resposta:
    print ("""
    1.Iniciar votos
    2.Ver Programas votados
    3.Ver Percentagem de votos
    0.Sair
    """)
    try:
        resposta=int(input("Escolha uma opcao: "))
    except ValueError:
        print ("""Opcao nao valida 1""")
        continue
    if resposta == 1:
        x = pedir_numero_votos() #se a opcao for o valor 1, pede a funcao indicada e guardar o valor na var x
        vota_programa(x) #depois usa o valor de x na funcao pedir_votos 
    elif resposta == 2:
        print(ver_programas()) #quando a opcao 2 e selecionada executa a funcao ver_programas cuja funcao e mostrar o valor de votos por programa
    elif resposta == 3:
        percentagem() #quando a opcao 3 e selecionada executa a funcao percentagem 
    elif resposta == 0:
        resposta = False
    else:
        print ("""Opcao nao valida""")