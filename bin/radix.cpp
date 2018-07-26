//Will Norvelle
//wmn2bz
//09/19/16 
//prelab4.cpp

#include <iostream>
#include <string>
#include <cmath>
#include <cstdlib>
#include <typeinfo>
#include <sstream>
#include <cstring>

using namespace std;

// converts a decimal number to binary
////// Note that this function has been replaced by the other more flexible functions
void decToBinary(unsigned int x) {
	string binForm;
	
	// loop through powers of two from 2^32 = 4.2949E9 to 2^0 = 1
	// 2^32 is mostly arbitrary but there really shouldn't be numbers bigger than that
	for (int i = 32; i >= 0; i--) {
		// if x is larger than 2^i then we'll add a 1 to the binary representation
		// we also need to subtract 2^i from x
		if (x >= (pow(2, i))) {
			binForm += "1";
			x -= (pow(2, i));
		} else {
			binForm += "0";
		}
	}

	cout << binForm << endl;	
}

// converts integers over 9 to their alphabetical representation
// 10 -> A, 11 -> B, etc
string alphatize(int a) {
	string b;

	// if a is below 10 then we just want to return a string version of a
	if (a < 10) {
		// string streams are an easy way to convert
		stringstream ss;
		ss << a;
		b = ss.str();
		return b;
	} else {
		a = a - 10 + 65; // 10 maps 10 -> 0, adding 65 matches 0 to ASCII A
		string b;
		b = (char) a;
		return b;
	}
}

// effectively the opposite of alphatize, converts letters to numbers
// handles both capital and lowercase letters
// also converts string ints into actual ints, makes decimalConversion simpler
int dealphatize(int b) {
	int a = b;
	if (a <= 57 && a >= 48) {	// 0 - 9 in ASCII is 48 - 57
		a -= 48;	// maps ASCII code 48 -> 0; corresponds to '0' -> 0
	} else if (a <= 90 && a >= 65) {	// A - Z in ASCII is 65 - 90
		a = a - 65 + 10;	// maps ASCII 65 -> 10; corresponds to A -> 10
	} else if (a <= 122 && a >= 97) {	// a -z in ASCII is 97 - 122
		a = a - 97 + 10;	// maps ASCII 97 -> 10; corresponds to a -> 10
	}
	return a;
}

// converts a decimal int to another base from 2 - 36
// defaults to base 2 for conversion
void generalConversion(unsigned long x, int base = 2) {
	string genForm;		// string that will be built up
	bool pad = false;	// will use this to prevent unnessesary padding of zeros

	// loop from base^32 to base^0
	// again, 32 is fairly arbitrary, is a power of 2 though
	for (int i = 32; i >= 0; i--) {
		// the switch statement is used because bases other than 2 need to multiply the base^i by some scalar
		// scalars can be between 0 and base - 1
		switch (base - 1) {		// the switch expression goes to the case with the largest possible scalar
			case 35 :
				if (x >= (35*pow(base, i))) {	// if scalar*base^i is less than x...
					x -= 35 * pow(base, i);		// subtract scalar*base^i from x
					genForm += alphatize(35);	// add alphatized version of scalar to string
					pad = true;					// set pad to true so significant zeros will be included
					break;						// since this scalar worked, don't try any of the others
				}

			case 34 :
				if (x >= (34*pow(base, i))) {
					x -= 34 * pow(base, i);
					genForm += alphatize(34);
					pad = true;
					break;
				}

			case 33 :
				if (x >= (33*pow(base, i))) {
					x -= 33 * pow(base, i);
					genForm += alphatize(33);
					pad = true;
					break;
				}

			case 32 :
				if (x >= (32*pow(base, i))) {
					x -= 32 * pow(base, i);
					genForm += alphatize(32);
					pad = true;
					break;
				}

			case 31 :
				if (x >= (31*pow(base, i))) {
					x -= 31 * pow(base, i);
					genForm += alphatize(31);
					pad = true;
					break;
				}

			case 30 :
				if (x >= (30*pow(base, i))) {
					x -= 30 * pow(base, i);
					genForm += alphatize(30);
					pad = true;
					break;
				}

			case 29 :
				if (x >= (29*pow(base, i))) {
					x -= 29 * pow(base, i);
					genForm += alphatize(29);
					pad = true;
					break;
				}

			case 28 :
				if (x >= (28*pow(base, i))) {
					x -= 28 * pow(base, i);
					genForm += alphatize(28);
					pad = true;
					break;
				}

			case 27 :
				if (x >= (27*pow(base, i))) {
					x -= 27 * pow(base, i);
					genForm += alphatize(27);
					pad = true;
					break;
				}

			case 26 :
				if (x >= (26*pow(base, i))) {
					x -= 26 * pow(base, i);
					genForm += alphatize(26);
					pad = true;
					break;
				}

			case 25 :
				if (x >= (25*pow(base, i))) {
					x -= 25 * pow(base, i);
					genForm += alphatize(25);
					pad = true;
					break;
				}

			case 24 :
				if (x >= (24*pow(base, i))) {
					x -= 24 * pow(base, i);
					genForm += alphatize(24);
					pad = true;
					break;
				}

			case 23 :
				if (x >= (23*pow(base, i))) {
					x -= 23 * pow(base, i);
					genForm += alphatize(23);
					pad = true;
					break;
				}

			case 22 :
				if (x >= (22*pow(base, i))) {
					x -= 22 * pow(base, i);
					genForm += alphatize(22);
					pad = true;
					break;
				}

			case 21 :
				if (x >= (21*pow(base, i))) {
					x -= 21 * pow(base, i);
					genForm += alphatize(21);
					pad = true;
					break;
				}

			case 20 :
				if (x >= (20*pow(base, i))) {
					x -= 20 * pow(base, i);
					genForm += alphatize(20);
					pad = true;
					break;
				}

			case 19 :
				if (x >= (19*pow(base, i))) {
					x -= 19 * pow(base, i);
					genForm += alphatize(19);
					pad = true;
					break;
				}

			case 18 :
				if (x >= (18*pow(base, i))) {
					x -= 18 * pow(base, i);
					genForm += alphatize(18);
					pad = true;
					break;
				}

			case 17 :
				if (x >= (17*pow(base, i))) {
					x -= 17 * pow(base, i);
					genForm += alphatize(17);
					pad = true;
					break;
				}

			case 16 :
				if (x >= (16*pow(base, i))) {
					x -= 16 * pow(base, i);
					genForm += alphatize(16);
					pad = true;
					break;
				}

			case 15 :
				if (x >= (15*pow(base, i))) {
					x -= 15 * pow(base, i);
					genForm += alphatize(15);
					pad = true;
					break;
				}

			case 14 :
				if (x >= (14*pow(base, i))) {
					x -= 14 * pow(base, i);
					genForm += alphatize(14);
					pad = true;
					break;
				}

			case 13 :
				if (x >= (13*pow(base, i))) {
					x -= 13 * pow(base, i);
					genForm += alphatize(13);
					pad = true;
					break;
				}

			case 12 :
				if (x >= (12*pow(base, i))) {
					x -= 12 * pow(base, i);
					genForm += alphatize(12);
					pad = true;
					break;
				}

			case 11 :
				if (x >= (11*pow(base, i))) {
					x -= 11 * pow(base, i);
					genForm += alphatize(11);
					pad = true;
					break;
				}

			case 10 :
				if (x >= (10*pow(base, i))) {
					x -= 10 * pow(base, i);
					genForm += alphatize(10);
					pad = true;
					break;
				}

			case 9 :
				if (x >= (9*pow(base, i))) {
					x -= 9 * pow(base, i);
					genForm += alphatize(9);
					pad = true;
					break;
				}

			case 8 :
				if (x >= (8*pow(base, i))) {
					x -= 8 * pow(base, i);
					genForm += alphatize(8);
					pad = true;
					break;
				}

			case 7 :
				if (x >= (7*pow(base, i))) {
					x -= 7 * pow(base, i);
					genForm += alphatize(7);
					pad = true;
					break;
				}

			case 6 :
				if (x >= (6*pow(base, i))) {
					x -= 6 * pow(base, i);
					genForm += alphatize(6);
					pad = true;
					break;
				}

			case 5 :
				if (x >= (5*pow(base, i))) {
					x -= 5 * pow(base, i);
					genForm += alphatize(5);
					pad = true;
					break;
				}

			case 4 :
				if (x >= (4*pow(base, i))) {
					x -= 4 * pow(base, i);
					genForm += alphatize(4);
					pad = true;
					break;
				}

			case 3 :
				if (x >= (3*pow(base, i))) {
					x -= 3 * pow(base, i);
					genForm += alphatize(3);
					pad = true;
					break;
				}

			case 2 :
				if (x >= (2*pow(base, i))) {
					x -= 2 * pow(base, i);
					genForm += alphatize(2);
					pad = true;
					break;
				}

			case 1 :
				if (x >= (1*pow(base, i))) {
					x -= 1 * pow(base, i);
					genForm += alphatize(1);
					pad = true;
					break;
				}
			default :
				if (pad) {				// only if pad is true should we add 0s
					genForm += "0";
				}
		}
	}
	cout << genForm << endl;
}

// converts a number of another base to decimal
unsigned long decimalConversion(string x, int base) {
	x = string(x.rbegin(), x.rend());			// reverses string so LSB is at x[0]
	unsigned long tot = 0;						// int we'll be adding onto
	for (int i = 0; i < x.length(); i++) {		// loop through every character
		tot += dealphatize(x[i]) * pow(base, i);	// dealphatize x[i] to get base 10 numbers from letters and multiply by base*i
	}
	return tot;
}

int main(int argc, char *argv[]) {
	// TODO: print out a simple help page when no arguments passed, implement -h --h
	if (argc < 2) {
		cout << "You must enter at least one integer" << endl;
		exit(-1);
	}

	/* arguments:
		-o = original value
		-b = base - defaults to 2
		-c = convert to - defaults to 10
	*/

	// ways to later check if flags were set
	// if they weren't set will expect numbers in a certain order
	bool oFound = false;
	bool bFound = false;
	bool cFound = false;
	bool cVal = false;

	// these are used to record the index of options
	int aMark;
	int bMark;
	int cMark;

	for (int i = 1; i < argc; i++) {
		if (strncmp(argv[i], "-o", 2) == 0) {			// check if original number set with flag
			oFound = true;								// set flag marker to true, used so default can be applied if not set
			if (i + 1 != argc) {						// if there is room set marker
				aMark = i + 1;
			} else {									// otherwise error out because they won't get expected results, could cause exception/segfault
				cout << "Must provide value with option '-o': '-o 123'" << endl;
				exit(-1);
			}
		} else if (strncmp(argv[i], "-b", 2)== 0) {		// check if base flag is set
			bFound = true;								// set flag marker to true, used for both setting default and functions that are run
			if (i + 1 != argc) {						// set marker if room
				bMark = i + 1;
			}else {										// otherwise error out because they won't get expected results, could cause exception/segfault
				cout << "Must provide value with option '-b': '-b 8'" << endl;
				exit(-1);
			}
		} else if (strncmp(argv[i], "-c", 2)== 0) {		// check if they want to convert number to another base
			cFound = true;								// set flag, used for choosing to convert
			if (i + 1 != argc) {						// this time won't error out if no next argument because default is switching to 10
				cMark = i + 1;
				cVal = true;							// if this is set will pass a conversion base other than 10
			}
		}
	}

	// default position of original value is first argument
	if (!oFound) {
		aMark = 1;
	}
	// default position of base is second argument
	if (!bFound) {
		bMark = 2;
	}
	
	if (cFound && cVal) {		// if they want to convert to specific base
		// set a to original and b to base doesn't care which arg number
		string a = argv[aMark];
		int b = atoi(argv[bMark]);

		// first convert original to decimal
		unsigned long decConverted = decimalConversion(a, b);

		// then convert to whatever base they want
		generalConversion(decConverted, atoi(argv[cMark]));

	} else if (cFound) {		// if they just want default conversion
		// again, set a to original and b to base doesn't care which arg number
		string a = argv[aMark];
		int b = atoi(argv[bMark]);

		// first convert original to decimal
		unsigned long decConverted = decimalConversion(a, b);

		// then convert to base 10
		generalConversion(decConverted, 10);

	} else if(bFound) {		// if they've set the base, convert original to it, assumes original is base 10
		// again, set a to original and b to base doesn't care which arg number
		unsigned long a = atoi(argv[aMark]);	// setting a to unsigned long so it can take in larger ints
		int b = atoi(argv[bMark]);

		// assume original is base 10, convert, function prints result
		generalConversion(a, b);

	} else {	// this is the default behavior, user only passed a number so convert it to binary
		unsigned long a = atoi(argv[aMark]);

		// generalConversion's second paramater defaluts to 2
		generalConversion(a);
	}
	return 0;
}

// oops, did the stuffs to convert a float...
	/*string sign;
	string mantissa;
	string exponent;
	int e;

	if (x < 0.0) {
		sign = "1";
	} else {
		sign = "0";
	}
	cout << x << endl;
	if (x < 1.0) {
		while (x < 1.0) {
			x *= 2;
			e += 1;
		}
	} else if (x >= 2.0) {
		while (x >= 2.0) {
			x /= 2;
			e += 1;
		}
	}
	cout << e << endl;
	e += 127;
	x -= 1;
	cout << x << endl;

	for (int i = 1; i <= 23; i++) {
		if ((1.0 / pow(2.0, i)) <= x) {
			mantissa += "1";
			x -= (1.0 / pow(2, i));
		} else {
			mantissa += "0";
		}
	}

	for (int i = 7; i >= 0; i--) {
		if (pow(2.0, i) <= e) {
			exponent += "1";
			e -= pow(2.0, i);
		} else {
			exponent += "0";
		}
	}

	cout << sign << exponent << mantissa << endl;*/