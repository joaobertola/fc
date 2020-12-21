<?php

namespace App\Services\Utils;

/**
 * @author Tiago Franco
 * Classe util para manipulacao e geracao de strings
 */
class CodigoBarrasUtils
{

    public static function geraCodigoBarra8()
    {
        $i = 0;

        $codBarraNovo = 0;

        while ($codBarraNovo == 0) {
            $codBarra = rand(100000000000, 999999999999);

            if ($codBarra >= 200000000000 && $codBarra <= 299999999999) {
                $codBarra = $codBarra + 100000000000;
            }

            if ($codBarra < 0) {
                $codBarra = str_pad(($codBarra * -1), 12, "0", STR_PAD_LEFT);
            }

            $codBarra = self::geradorAEN8($codBarra);
            return $codBarra;
        }
    }


    private static function geradorAEN8($valor)
    {
        $valor = (string) $valor;

        if (strlen($valor) != 7) {
            if (strlen($valor) > 7) {
                $valor = substr($valor, 0, 7);
            } else {
                $valor = str_pad($valor, 7, "0", STR_PAD_LEFT);
            }
        }
        // pega os digitos com posicao par e multiplica sua soma por 3
        $even_sum_three = (substr($valor, 0, 1) + substr($valor, 2, 1) + substr($valor, 4, 1) + substr($valor, 6, 1)) * 3;
        // pega os digitos com posicao impar
        $odd_sum = substr($valor, 1, 1) + substr($valor, 3, 1) + substr($valor, 5, 1);
        // 4. Soma os dois valores acima
        $total_sum = $even_sum_three + $odd_sum;
        // 5. The check character is the smallest number which, when added to the result in step 4,  produces a multiple of 10.
        $digitoValidador = 10 - ($total_sum % 10);

        if ($digitoValidador == 10) {
            $digitoValidador = 0;
        }

        return $valor . $digitoValidador;
    }
}
