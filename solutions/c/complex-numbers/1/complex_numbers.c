#include "complex_numbers.h"
#include <math.h>

complex_t c_add(complex_t a, complex_t b)
{
  complex_t res = {.real = a.real + b.real, .imag = a.imag + b.imag};
  return res;
}

complex_t c_sub(complex_t a, complex_t b)
{
  complex_t res = {.real = a.real - b.real, .imag = a.imag - b.imag};
  return res;
}

complex_t c_mul(complex_t a, complex_t b)
{
  double real = (a.real * b.real) - (a.imag * b.imag);
  double imag = (a.real * b.imag) + (a.imag * b.real);
  complex_t res = {.real = real, .imag = imag};
  return res;
}

complex_t c_div(complex_t a, complex_t b)
{
  complex_t b_conj = c_conjugate(b);
  complex_t numerator = c_mul(a, b_conj);
  complex_t denominator = c_mul(b, b_conj);
  complex_t res = {.real = numerator.real / denominator.real,
                   .imag = numerator.imag / denominator.real};
  return res;
}

double c_abs(complex_t x)
{
  double res = sqrt(pow(x.real, 2) + pow(x.imag, 2));
  return res;
}

complex_t c_conjugate(complex_t x)
{
  x.imag = -x.imag;
  return x;
}

double c_real(complex_t x)
{
  return x.real;
}

double c_imag(complex_t x)
{
  return x.imag;
}

complex_t c_exp(complex_t x)
{
  double real = exp(x.real) * (cos(x.imag));
  double imag = exp(x.real) * sin(x.imag);
  complex_t res = {.real = real, .imag = imag};
  return res;
}
