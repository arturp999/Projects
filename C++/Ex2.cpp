#include <iostream>
#include <cstdlib>
#include <ctime>
#include <limits>
#include <windows.h>
#include <math.h>
#include <string>
#include <vector>

using namespace std;

enum Position {
    CENTRE
};
int cont, amount, quantity, soma;
int LINELENGTH = 120;
int numbers[5], stars[2];
string header(LINELENGTH, '=');
bool invalid, exist, userInput;
void print(Position pos, string text, int linelength) {
	int spaces = 0;
	switch (pos) {
		case CENTRE:
			spaces = (linelength - text.size()) / 2;
			break;
	}
	if (spaces > 0)
		cout << string(spaces, ' ');
	cout << text << '\n';
}

class Ticket {
	private:
		bool NumberExists(int number, int currentPositon) { // Verifica se o ultimo numero inserido ja existe dentro do array pretendido
			for (int i = 0; i < currentPositon; i++) {
				if (this->Numbers[i] == number) {
					return true;
				}
			}

			return false;
		}

		bool StarExists(int number, int currentPositon) { // Verifica se a ultima estrela inserido ja existe dentro do array pretendido
			for (int i = 0; i < currentPositon; i++) {
				if (this->Stars[i] == number) {
					return true;
				}
			}

			return false;
		}

	public:
		int Numbers[5];
		int Stars[2];

		void randomBet() {   // Gera aleatoriamente 5 numeros e 2 estrelas e define esses valores para um determinado objeto
			for (int i = 0; i < 5; i++) {
				do {
					this->Numbers[i] = rand() % 50 + 1;
				} while (this->NumberExists(this->Numbers[i], i));
			}

			for (int i = 0; i < 2; i++) {
				do {
					this->Stars[i] = rand() % 12 + 1;
				} while (this->StarExists(this->Stars[i], i));
			}
		}

		void newTicket() {   // Pergunta ao utilizador por 5 numeros e 2 estrelas e define esses valores para um determinado objeto
			system("cls");

			cout << header << "\n";
			print(CENTRE, "Euromilhoes", LINELENGTH);
			cout << "\n";
			print(CENTRE, "Numeros: ", LINELENGTH);
			cout << header << "\n";
			for (int i = 0; i < 5; i++) {
				int userInput = true;
				while (userInput) {
					cout << "Number " << i + 1 << ": ";
					cin >> this->Numbers[i];
					if (cin.fail() || this->Numbers[i] <= 0 || this->Numbers[i] > 50 || this->NumberExists(this->Numbers[i], i) == true) {
						cin.clear();
						cin.ignore();
						cout << "Essa opcao nao valida"
						     << "\n";
					} else {
						userInput = false;
					}
				}
			}

			system("cls");

			cout << header << "\n";
			print(CENTRE, "Euromilhoes", LINELENGTH);
			cout << "\n";
			print(CENTRE, "Estrelas: ", LINELENGTH);
			cout << header << "\n";
			for (int i = 0; i < 2; i++) {
				int userInput = true;
				while (userInput) {
					cout << "Star " << i + 1 << ": ";
					cin >> this->Stars[i];
					if (cin.fail() || this->Stars[i] <= 0 || this->Stars[i] > 12 || this->StarExists(this->Stars[i], i)) {
						cin.clear();
						cin.ignore();
						cout << "Essa opcao nao valida"
						     << "\n";
					} else {
						userInput = false;
					}
				}
			}
		}

		void printTicket() { //Exibe todos os valores dentro dos arrays de um determinado objeto
			cout << "\nNumbers: ";
			for (int i = 0; i < 5; i++) {
				cout << this->Numbers[i] << " ";
			}
			cout << "\n";
			cout << "Stars: ";
			for (int i = 0; i < 2; i++) {
				cout << this->Stars[i] << " ";
			}
		}
};

void consultMenu() { // Menu simples para o final do programa
	int opp = 0, i;

	cout << header;

	print(CENTRE, "Euromilhoes", LINELENGTH);
	cout << "\n";

	print(CENTRE, "Consultar Chave", LINELENGTH);


};

void amountOfKeys() { // Pergunta ao utilizador a quantidade de bilhetes deseja inserir
	int i;
	quantity = 0;
	do {
		system("cls");
		cout << header;

		print(CENTRE, "Euromilhoes", LINELENGTH);
		cout << "\n";

		print(CENTRE, "Selecione o tipo de aposta a realizar:\n", LINELENGTH);
		print(CENTRE, "Aposta Simples ", LINELENGTH);
		print(CENTRE, "(1) \n", LINELENGTH);
		print(CENTRE, "Aposta Multipla", LINELENGTH);
		print(CENTRE, "(2 a 5)\n", LINELENGTH);

		cout << header;
		if (cont == 1) {
			cout << "Ultrapassaria o limite de chaves\n";
		} else if (cont == 2) {
			cout << "Valor inserido nao aceite\n";
		}

		cout << "Quantidade: ->";

		while (!(cin >> quantity)) {
			cout << "Valor introduzido incorreto!\nQuantidade: ->";
			cin.clear();
			cin.ignore(numeric_limits<streamsize>::max(), '\n');
			i += 1;

			if (i > 4) {
				i = 0;
				system("cls");
				cout << header;

				print(CENTRE, "Euromilhoes", LINELENGTH);
				cout << "\n";

				print(CENTRE, "Chaves a inserir", LINELENGTH);
				print(CENTRE, "Maximo 5", LINELENGTH);

				cout << header;
				cout << "Valor introduzido incorreto!\nQuantidade: ->";
			}
		}

		if (quantity + amount > 5) {
			cont = 1;
		} else if (quantity > 5 || quantity < 1) {
			cont = 2;
		}

	} while (quantity > 5 || quantity < 1 || quantity + amount > 5);

	amount = amount + quantity;
}

int askInsertType() { // Pergunta ao utilizador se os bilhetes irao ser inseridos de forma automatica ou manual
	char type;
	system("cls");

	do {
		if (cont > 0) {
			cout << "Valor introduzido incorreto!\n";
		}
		cout << header << "\n";

		print(CENTRE, "Euromilhoes", LINELENGTH);
		cout << "\n";

		print(CENTRE, "M -> Inserir Manualmente", LINELENGTH);
		print(CENTRE, "A -> Inserir Automaticamente", LINELENGTH);
		cout << header << "\n";

		cout << "Opcao: ->";
		cin >> type;

		if ((type == 'a') || (type == 'A') || (type == 'm') || (type == 'M')) {
			invalid = false;
			if ((type == 'm') || (type == 'M')) {
				return 0;
			} else {
				return 1;
			}
		} else {
			invalid = true;
			cont += 1;
		}
	} while (invalid);
}

main() {
	Ticket bets[5]; // cria array de objetos
	Ticket winnerTicket; // cria a chave vencedora
	winnerTicket.randomBet(); // define os valores da chave
	int opt, inputError;

	srand(time(NULL));

	amountOfKeys(); // bilhetes a inserir

	if (askInsertType() == 0) { // askInsertType == 0 quer dizer inserir os valores a mão / askInsertType == 1 quer dizer inserir os valores automaticamente
		for (int i = 0; i < quantity; i++) {
			bets[i].newTicket(); // define os valores na determinada posicao do array
		}
		if (quantity > 1) {
			system("cls");
			print(CENTRE, "Chaves inseridas", LINELENGTH);
		} else {
			system("cls");
			print(CENTRE, "Chave inserida", LINELENGTH);
		}
	} else {
		for (int i = 0; i < quantity; i++) {
			bets[i].randomBet(); // define os valores na determinada posicao do array
		}
		if (quantity > 1) {
			system("cls");
			print(CENTRE, "Chaves inseridas", LINELENGTH);
		} else {
			system("cls");
			print(CENTRE, "Chave inserida", LINELENGTH);
		}
	}

	consultMenu();
	cout << "Chave vencedora: ";
	winnerTicket.printTicket();
	cout << "\n";
	cout << header;

	for (int x = 0; x < amount; x++) { // estes for's vao passar por todas as posiçoes dos arrays e compara quantos numeros iguais existe entre a chave vencedora e as inseridas
		soma = 0;
		for (int i = 0; i < 5; i++) {
			for (int y = 0; y < 5; y++) {
				if (winnerTicket.Numbers[i] == bets[x].Numbers[y]) {
					soma += 1;
				}
			}
		}
		for (int i = 0; i < 2; i++) {
			for (int y = 0; y < 2; y++) {
				if (winnerTicket.Stars[i] == bets[x].Stars[y]) {
					soma += 1;
				}
			}
		}
		switch (soma) {
			case 7: // Primeiro premio == todos os numeros e estrelas iguais
				cout << "\n\nBilhete " << x + 1 << ": PRIMEIRO PREMIO";
				bets[x].printTicket();
				break;
			case 6:
				cout << "\n\nBilhete " << x + 1 << ": PREMIO MUITO ALTO";
				bets[x].printTicket();
				break;
			case 5:
				cout << "\n\nBilhete " << x + 1 << ": PREMIO MEDIO ALTO";
				bets[x].printTicket();
				break;
			case 4:
				cout << "\n\nBilhete " << x + 1 << ": PREMIO ALTO";
				bets[x].printTicket();
				break;
			case 3:
				cout << "\n\nBilhete " << x + 1 << ": PREMIO MEDIO";
				bets[x].printTicket();
				break;
			case 2:
				cout << "\n\nBilhete " << x + 1 << ": PREMIO BAIXO";
				bets[x].printTicket();
				break;
			default:
				cout << "\n\nBilhete " << x + 1 << ": SEM PREMIO";
				bets[x].printTicket();
				break;
		}
	}
}
