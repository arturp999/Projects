#include <iostream>
#include <cstdlib>
#include <ctime>
#include <limits>
#include <math.h>
using namespace std;


enum Position {CENTRE};
double amountToPay, change;
double payment;

class moneyFunctions {
	private:
		int verify(double number) {  //  verifica o valor
			double confirmValue[7] = {5,10,20,50,100,200,500};
			int exists = false;

			for (int i = 0; i < 7; i++) {
				if(confirmValue[i] == number) {
					if ((number * 100) < amountToPay) {
						exists = 1;
						return exists;
						break;
					} else {
						exists = 2;
						return exists;
						break;
					}
				}
			}
			exists = 0;
			return exists;
		}

	public:
		void inputData() { // aceita o valor de pagamento e confirma se o valor é valido na função verify()
			for (int i = 0; i < 1;) {
				cout << "Insira valor para o pagamento: "; //

				while(!(cin >> payment)) {
					cout << "Valor nao aceitavel. \nInsira valor para o pagamento: ";
					cin.clear();
					cin.ignore(numeric_limits<streamsize>::max(), '\n');
				}

				if (verify(payment) == 0) {
					cout << "Valor incorreto." << "\n";
				} else if (verify(payment) == 1) {
					cout << "Valor insuficiente."<< "\n";
				} else {
					i += 1;
				}
			}
		}
		void getChange() { // indica o valor do troco
			int paymentInCents = payment * 100;

			change = paymentInCents - amountToPay;	
			printf("\nO seu troco e de : %.2lf", change/100 -.005); //0.05 é para depois não arredondar o valor apresentado

			int cents[8] = {200 , 100 , 50 , 20 , 10 , 5 , 2 , 1};
			int rest = 0;
			int amount = 0;

			cout << "\n";
			cout << "\n";

			for (int i = 0; i < 8 ; i++) {
				double now = cents[i];
				amount = change / now;
				rest = change - (amount * now);
				change = rest;

				if (amount > 0) {
					if (amount == 1) {
						switch (i) {
							case 0:
								cout  << amount << " moeda de " << (cents[i] / 100) << " euros" << "\n";
								break;
							case 1:
								cout << amount << " moeda de " << (cents[i] / 100) << " euro" << "\n";
								break;
							case 7:
								cout << amount << " moeda de " << cents[i] << " centimo" << "\n";
								break;
							default:
								cout << amount << " moeda de " << cents[i] << " centimos" << "\n";
								break;
						}
					} else {
						switch (i) {
							case 0:
								cout << amount << " moedas de " << (cents[i] / 100) << " euros" << "\n";
								break;
							case 1:
								cout << amount << " moedas de " << (cents[i] / 100) << " euro" << "\n";
								break;
							case 7:
								cout << amount << " moedas de " << cents[i] << " centimo" << "\n";
								break;
							default:
								cout << amount << " moedas de " << cents[i] << " centimos" << "\n";
								break;
						}
					}
				}
			}


		}
};

void print( Position pos, string text, int linelength ) { //posicionamentos do output
	int spaces = 0;
	switch( pos ) {
		case CENTRE:
			spaces = ( linelength - text.size() ) / 2;
			break;
	}
	if ( spaces > 0 ) cout << string( spaces, ' ' );
	cout << text << '\n';
}

void menu() { //funcao do menu
	const int LINELENGTH = 118;
	string header( LINELENGTH, '=' );

	srand(time(0));  // Initialize random number generator.
	int inteiro = (rand() % 9) + 1; // Gera o numero inteiro
	double decimals = (double) rand()/RAND_MAX; //gera num decimal de 0 a 1

	double rounded_up = ceilf(decimals * 100) /100; //casas decimais para 2 casas

	double value = inteiro + decimals;
	double valuetoPay = inteiro + rounded_up;

	amountToPay = value * 100;

	cout << header << "\n";

	print(CENTRE, "Caixa de Pagamento", LINELENGTH);
	cout << "\n";

	print(CENTRE, "Apenas sao Aceites Notas", LINELENGTH);
	print(CENTRE, "{5 , 10 , 20 , 50 , 100 , 200 , 500}", LINELENGTH);
	cout << "\n";

	cout << "Valor a Pagar: " << valuetoPay << "\n";

	cout << header << '\n';
}

main() {
	menu();
	cout << "\n";

	moneyFunctions park;
	park.inputData();
	park.getChange();

cout << "\n";
	cout << "Press anykey to exit.";
	cin.ignore();
	cin.get();
}
