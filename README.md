# Obligatorio I

## Scripts
- **algoritmo1.m** : Algoritmo 1 del problema 2
- **algoritmo2.m** : Algoritmo 2 del problema 1
- **algoritmo1_exp.m** : Versión del algoritmo 1 para experimentación de sección 4.1
- **algoritmo2_exp.m** : Versión del algoritmo 2 para experimentación de sección 4.2
- **test_algoritmo1_1.m** : Simulaciones para experimentacion de sección 4.1.1
- **test_algoritmo1_2.m** : Simulaciones para experimentación en sección 4.1.2
- **test_algoritmo2_1.m** : Simulaciones para experimentación en sección 4.2.1

La diferencia entre algoritmo1.m y algoritmo1_exp.m radica en que el segundo utiliza variables y/o funciones las cuales no son necesarias para la ejecución del algoritmo 1 de forma nativa.
Lo mismo ocurre para algoritmo2.m y algoritmo2_exp.m.

## Usage
Se detallará la utilización correcta de los algoritmos y tests de los algoritmos. Se recomienda utilizar Octave (GUI) para realizar las siguientes partes.

### algoritmos
Para ejecutar el algorimo 1 se debe llamar a `algoritmo1(lambda)` o `algoritmo1_exp(lambda)`, siendo lambda el espectro de valores propios de tamaño arbitrario.
Ejemplo:
```
algoritmo1([-1, 2.5, 5, -0.1])

```
