#DESAFIO 1 MAQUINA DE CAFE


lista_de_notas=(50000,20000,10000,5000,2000,1000,500) # tuplo com o valor em centimos de todas as notas
moedas=(200,100,50,20,10,5,2,1) # tuplo com o valor em centimos de todas as moedas


def pedir_cafe():
    while True: # Ate que o valor inserido seja um numero inteiro ele repete o codigo
        print ("""
    Nossos cafes
  1. Americano
  2. Latte
  3. Expresso
  4. Cappuccino
        """)
        try: 
            cafe = int(input('Qual a sua escolha :'))
        except ValueError:
            print("Tens de introduzir um NUMERO de 1 a 4")
            continue
        if cafe == 1:
            print('O valor do cafe e 0,50')
            return 50 #desta forma guardamos o preco do cafe dentro da variavel usada ao chamar a funcao
        elif cafe == 2:
            print('O valor do cafe e 0,40')
            return 40
        elif cafe == 3:
            print('O valor do cafe e 0,40')
            return 40
        elif cafe == 4:
            print('O valor do cafe e 0,80')
            return 80
        else:
            print('Cafe nao reconhecido selecione outro : ')
            return pedir_cafe() #para o caso de o utilizador introduza um numero relativo a um cafe que nao exista este return volta a correr toda a funcao     
        
def verificar_notas():#esta funcao verifica se o valor inserido pelo utilizador e realmente um nota 
    while True:# o while true volta ser usado para repetir o try ate que um valor inteiro seja utilizado
        try:
            notas = int(input ("""
  Insira uma nota de 5 a 500: """))
        except ValueError: 
            print("Tens de introduzir uma NOTA de 5 a 500 ")
            continue
        notas = notas * 100  # como o valor nos tuplos estao em centimos e preciso transformar o valor em euros das notas para centimos 
        x=0 # variavel local 
        for cont in lista_de_notas:
            if notas == cont: #se o input que o user introduz for igual ao contador que corre a lista de notas conta a nota introduzida
                x+=1
        if x == 0:
            print('Valor de pagamento nao aceite,') #se a nota nao existir no passo em cima deu 0 por isso e uma nota que nao existe
            return verificar_notas()
        return notas
                       
def devolver_troco(dinheiro, preco): #esta funcao calcula o troco do utilizador e indica quais as moedas seram entregues ao consumidor
    troco = (dinheiro - preco)#calcula o troco
    trocoeuros = troco / 100
    print("""
O seu troco e de """, trocoeuros, ' Euros')
    for cont in moedas: #corre a lista de moedas
        quantidade = troco // cont  #calcula quantas moedas seram entregues ao consumidor
        troco = troco % cont # calcula quanto dinheiro ainda e necessario entregar ao consumidor
        if quantidade > 0: # este if faz com que so sejam mostradas as moedas que seja entregues, ou seja nao e mostrado algo do genero '0 moedas de 2 euros'
            if cont >= 100: # se a moeda for de 100 centimos ou superior, ou seja, moedas de 1 euro ou de 2 o print e diferente
                cont = cont//100
                print (quantidade,'moedas de',cont,'euros',)
            else:
                print (quantidade,'moeda de',cont,'centimos',)              
    return (0)


def cafe ():  #funcao que controla o programa
    while True:
        preco=0
        dinheiro=0       
        print ("""
Selecione
  1. Tirar um cafe
  
  0. Sair
        """) 
        try:
            pedir = int(input('Opcao: '))
        except ValueError:
            print("Input Invalido")
            continue    
        if pedir == 1:
            
            preco = pedir_cafe()
            
            dinheiro = verificar_notas()  
            
            devolver_troco(dinheiro, preco)
            
        else :
            return ("Obrigado pela visita")
        
#chama a funcao cafe
print(cafe())