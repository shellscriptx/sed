#!/bin/sed -rf

#-----------------------------------------------------------------------------------------------------------
# Data: 4 de Novembro de 2016
# Criado por: Juliano Santos [SHAMAN]
# Script: horario.sed
# Descrição: Script que demonstra o desvio de fluxo durante aplicação de filtros com expressões regulares.
#            Imprime uma mensagem de comprimento referente ao horário informado pelo usuário.
#-----------------------------------------------------------------------------------------------------------

# 1º Padrão (Parte da manhã)
# Verifico se o padrão das horas está entre o
# intervalo de 0:00 até 11:59 horas.
/^(0[0-9]|1[0-1]):([0-5][0-9])$/{ 
# Troca o buffer padrão e imprime a mensagem.
x;s/^/Bom dia, hora do café da manhã :)/
# Salta para o branch 'fim'
b fim 
}

# 2ª Padrão (Parte da tarde)
# Verifico se o padrão das horas está entre o
# intervalo de 12:00 até as 17:59 horas.
/^(1[2-7]):([0-5][0-9])$/{
# Troca o buffer padrão e imprime a mensagem.
x;s/^/Boa tarde, café de novo. :)/
# Salta para o branch 'fim'
b fim 
}

# 3ª Padrão (Parte da noite)
# Verifico se o padrão das horas está entre o
# intervalo de 18:00 até 23:59 horas.
/^(1[89]|2[0-3]):([0-5][0-9])$/{ 
# Troca o buffer padrão e imprime a menagem.
x;s/^/Boa noite, vamos jantar é nóis. :D/
# Salta para o branch 'fim'
b fim 
}

# Se os padrões anteriores não casarem, imprime a mensagem de erro.
x;s/^/Onde tu mora hein ??\nSó preciso só das horas e minutos, assim ó hh:mm/
# Finaliza o script
q

# Label 'fim' que controi a linha de comando 
# a ser executada com a mensagem armazenada em '&'.
:fim
# Na final da string, anexa ao buffer padrão o valor do buffer reserva.
$G

# Anexa o cabeçalho 'Horas' ao delimitador '\n' nova linha.
s/(\n)/\1Horas: /

#FIM
