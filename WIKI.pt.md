# Wiki de referência do mod Too Many Craftings

## Instalação
Baixe o arquivo do mob (tmcraftings - master.zip) e descompacte a pasta. Deixe-a com o nome "tmcraftings"<br/>
e coloque no diretório de mods do jogo. [[Ajuda para instalação.](https://dev.minetest.net/Installing_Mods#:~:text=The%20mods%20are%20installed%20globally,in%20globally%20installed%20Minetest%20versions)]

### AVISO: Ative o mod nas configurações de mundo antes de abri-lo pela primeira vez.<br/>Caso contrário, a geração de mundo e de loot não serão efetuadas.

## Mineração
O mod substitui todos os minérios padrão do jogo, exceto o carvão. A ordem de capacidade de mineração é essa:

    madeira < pedra < ferro < tungstênio < titânio < obsidiana
                              prata/ouro < cristal mágico/rubi
                              
Onde a linha mais baixa são minérios apenas de criação, não geram equipamentos ou armaduras.

## Inventário
Foram adicionados 3 novos slots ao inventário, a Safe Bar, esses itens não serão perdidos ao morrer.<br/><br/>
\* As armaduras equipadas também não são perdidas, mas todo o conteúdo restante do inventário é largado após a morte.

## Forja
Para criar uma ferramenta use as mesmas receitas que a do jogo padrão (picareta, pá, machado e espada). As enchadas não foram substituidas.

### Armaduras
As armaduras são feitas de Armor Pieces, ou Peças de armadura, são feitas com a seguinte receita:

    ingot ingot ingot
    ingot _____ ingot
    _____ ingot _____
          
Com 6 peças de armadura e 3 couros é possível fazer uma armadura na bigorna. Mas é necessário ela, obviamente, e um martelo de forja.

Receita do Martelo de forja:
 
    iron iron ____
    iron wood ____
    ____ wood ____
    
Receita da bigorna:

    iron_block iron_block iron_block
    __________ ___iron___ __________
    ___iron___ ___iron___ ___iron___

\* O martelo perde vida útil ao ser utilizado.

Receita da armadura:

    iron_armor_p iron_armor_p iron_armor_p
    iron_armor_p __leather___ iron_armor_p
    __leather___ iron_armor_p __leather___
    ___Hammer___
    
\* As armaduras não possuem vida útil.

## Máquina de compressão
Comprime recursos em seus respectivos itens.

    cobblestone -> stone

Receita:

    tungsten tungsten tungsten
    __iron__ tungsten __iron__
    tungsten tungsten tungsten

## Caixote de metal
Funciona como baú, mas não é obstruído por blocos acima.<br/>
Receita:

    iron iron iron
    iron ____ iron
    iron iron iron

## Escada de metal
Receita:

    iron ____ iron
    iron iron iron
    iron ____ iron

# Itens Mágicos
Todos precisam de cristal mágico/poeira mágica e prata/ferro.

## Lógica dos circuitos
Os blocos mágicos que exercem alguma função mágica precisam ser carregados por um dispersor mágico ou poste mágioco,
que por sua vez, precisam ser carregados por cabos, que pos sua vez são carregados por baterias.

\* Entenda ``Fe/Ag`` como Ferro ou Prata / ``crystal`` como Cristal Mágico / ``dust`` como Poeira mágica / ``core``
como Núcleo Mágico / ``engine`` como Mecanismo (Enferrujado) / ``clock`` como Mecanismo de Relógio / ``wcu`` como
Unidade de Bruxaria /

# Itens de receita:

## Poeira mágica:
Receita: 1 ``crystal`` em qualquer slot

## Núcleo mágico
Receira:

            _Fe/Ag_
    _Fe/Ag_ crystal _Fe/Ag_
            _Fe/Ag_

## Mecanismo e Mecanismo Enferrujado
Receita:

    ____ iron ____
    iron ____ iron
    ____ iron ____
    
  ou
    
    scrap _____ scrap
    _____ scrap _____
    scrap _____ scrap

## Mecanismo de Relógio
Receita:

    _wood__ engine_ _wood__
    engine_ crystal engine_
    _wood__ engine_ _wood__

## Unidade de Bruxaria
Receita:

    Fe/Ag gold_ Fe/Ag
    gold_ dust_ gold_
    Fe/Ag gold_ Fe/Ag

## Cabo
Transmite poder mágico.<br/>
receita: 3 ``Fe/Ag`` em qualquer slot

## Bateria mágica
Receita:

    Fe/Ag Fe/Ag Fe/Ag
    Fe/Ag core_ Fe/Ag
    Fe/Ag Fe/Ag Fe/Ag

## Enterruptor
Liga e desliga o poder mágio ao clicar.<br/>
Receita:

    _Fe/Ag_ crystal _Fe/Ag_
    _Fe/Ag_ engine_ _Fe/Ag_
    _Fe/Ag_ _ruby__ _Fe/Ag_

## Caldeira mágica
Gera poder mágico queimando combustível.<br/>
Receita:

    _Fe/Ag__ _Fe/Ag__ _Fe/Ag__
    _Fe/Ag__ __dust__ _Fe/Ag__
    titanium titanium titanium

## Tic-Tac Mágico
Gera um sinal mágico a cada 2 segundo por 1 segundo.<br/>
Receita:

    Fe/Ag Fe/Ag Fe/Ag
    Fe/Ag clock Fe/Ag
    Fe/Ag Fe/Ag Fe/Ag

## Dispersor
Gera poder mágico para todos os blocos próximos.<br/>
Receita:

    _Fe/Ag_ _Fe/Ag_ _Fe/Ag_
    _Fe/Ag_ crystal _Fe/Ag_
    _Fe/Ag_ _Fe/Ag_ _Fe/Ag_

## Poste mágico
Funciona tanto como dispersor quanto cabo.<br/>
Receita:

    Fe/Ag dust_ Fe/Ag
    Fe/Ag dust_ Fe/Ag
    Fe/Ag dust_ Fe/Ag

## Pensador
Funciona como porta lógica (AND, NAND, OR e XOR). Troca de função ao clicar. Exibe função atual ao apontar.<br/>
Receita:

    Fe/Ag Fe/Ag Fe/Ag
    Fe/Ag _wcu_ Fe/Ag
    Fe/Ag Fe/Ag Fe/Ag
    
 ## Inversor
 Funciona como uma porta lógica NOT.
  
    1 -> inveser -> 0
    0 -> inveser -> 1
  
Receita:

    Fe/Ag Fe/Ag Fe/Ag
    ruby_ core_ ruby_
    Fe/Ag Fe/Ag Fe/Ag

## Portão Mágico
Bloqueia sinal mágico de um lado e permite o fluxo do outro.

    1 -> gate -> 0
    1 <- gate <- 1
    
Receita:

    Fe/Ag Fe/Ag Fe/Ag
    ruby_ dust_ dust_
    Fe/Ag Fe/Ag Fe/Ag
    
## Painel Solar
Gera sinal mágico durante o dia. Exibe o horário atual ao apontar.<br/>
Receita:

    gold_ gold_ gold_
    Fe/Ag clock Fe/Ag
    Fe/Ag Fe/Ag Fe/Ag

# Fornálha Mágica
Cozinha itens sem combustível.<br/>
Receita:

    _Fe/Ag__ _Fe/Ag__ _Fe/Ag__
    _Fe/Ag__ __core__ _Fe/Ag__
    titanium titanium titanium
    
