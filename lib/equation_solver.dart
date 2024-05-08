import 'dart:math';

class Complex {
  final double real;
  final double imaginary;

  Complex(this.real, this.imaginary);

  @override
  String toString() {
    if (imaginary >= 0) {
      return '$real + ${imaginary}i';
    } else {
      return '$real - ${imaginary.abs()}i';
    }
  }
}

class EquationSolver {
  static List<Complex> solveCubic(double a, double b, double c, double d) {
    List<Complex> solutions = [];

    // Calcul discriminant
    double delta0 = b * b - 3 * a * c;
    double delta1 = 2 * b * b * b - 9 * a * b * c + 27 * a * a * d;
    double discriminant = delta1 * delta1 - 4 * delta0 * delta0 * delta0;

    if (discriminant > 0) {
      double phi = acos(delta1 / (2 * sqrt(delta0 * delta0 * delta0)));
      double s = 2 * sqrt(delta0);
      double x1 = (-b + s * cos(phi / 3)) / (3 * a);
      double x2 = (-b + s * cos((phi + 2 * pi) / 3)) / (3 * a);
      double x3 = (-b + s * cos((phi + 4 * pi) / 3)) / (3 * a);
      solutions.addAll([x1, x2, x3].map((x) => Complex(x, 0)));
    } else if (discriminant == 0) {
      double x = (-b + pow(delta1.abs(), 1 / 3)) / (3 * a);
      solutions.add(Complex(x, 0));
    } else {
      double r = sqrt(-delta0 * delta0 * delta0);
      double phi = acos(delta1 / (2 * sqrt(delta0 * delta0 * delta0)));
      double s = 2 * sqrt(delta0);
      double x1 = (-b + s * cos(phi / 3)) / (3 * a);
      double x2 = (-b + s * cos((phi + 2 * pi) / 3)) / (3 * a);
      double x3 = (-b + s * cos((phi + 4 * pi) / 3)) / (3 * a);
      solutions.addAll([x1, x2, x3].map((x) => Complex(x, r)));
    }

    return solutions;
  }
}
