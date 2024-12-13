# Pokenator
 

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 03 <br>
**Paradigma**: Logico <br>

## Alunos
| Matrícula | Aluno                             |
| --------- | --------------------------------- |
| 190124997 | Amanda Nobre                      |
| 200017772 | Fellipe Pereira da Costa Silva    |
| 190028122 | Gabriel Sabanai Trindade          |
| 200037994 | Guilherme Barbosa Ferreira        |
| 190029731 | Ingrid da Silva Carvalho          |
| 190046848 | Laís Portela de Aguiar            |
| 221007653 | Luciano Ricardo da Silva Junior   |
| 190033681 | Luiz Henrique Fernandes Zamprogno |
| 200025449 | Natan Tavares Santana             |
| 200042416 | Pablo Christianno Silva Guedes    |


## Sobre 

Esse projeto corresponde a segunda entrega do Grupo3.

Seu principal objetivo é implementar o jogo Akinator, com o tema de Pokemon, utilizando a linguagem Prolog e a API pokeAPI para o seu desenvolvimento.

### O que é Akinator?
![Imagem Akinator: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwo8ZDig5ElqPJ2XmZMw49csCehTxSxA247w&s](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwo8ZDig5ElqPJ2XmZMw49csCehTxSxA247w&s)


O Akinator é um jogo virtual desenvolvido em 2007 que tem como objetivo adivinhar o personagem em que o usuário esteja pensando atráves de diversas perguntas. Após respondidas, ele traz o resultado baseado nas respostas do jogador. No caso do jogo original, ele é representado por um gênio virtual.

### O que é Pokemon

![Imagem Pokemon: https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/800px-International_Pok%C3%A9mon_logo.svg.png](https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/800px-International_Pok%C3%A9mon_logo.svg.png)

Pokemon é uma franquia de mídia criada em 1995 pela Gamefreak e publicada pela Nintendo. Seu primeiro lançamento corresponde a duas versões do mesmo jogo com o título "Pocket Monsters Red" e "Pocket Monsters Green". A franquia principal e originaria consiste em um jogo de RPG na qual o jogador pode capturar e evoluir monstros de diversos tipos. Devido ao seu enorme sucesso, novos tipos de mídia foram surgindo ao longo dos anos com a criação de jogos spin-off, diversas temporadas de animes e diversos filmes lançados, tendo extrema relevancia em todos. Com isso, Pokemon tem um forte impacto dentro da cultura pop e atualmente corresponde a franquia de mídia mais valiosa do mundo, estimada em US$ 92,121 bilhões.

### Sobre o projeto

Tendo esses dois temas como base, buscamos por desenvolver um jogo na qual o usuário responde diversas perguntas, sobre características de Pokemon, em formato de "sim ou não" e, no final, o programa deve responder o Pokemon correto na qual o jogador esteja pensando.

Dentro do jogo, um Pokemon é referenciado como "entidade" e cada uma das características é definida como "predicado". As caracteristicas são divididas em ***tipos***, ***altura***, ***peso***, ***cor***, ***habitat*** e ***formato***. Para entender mais, acessar [information_base.md](./app/information_base.md).

## Screenshots
### Tela inical
![image](docs/telaInicial.png)
### Tela de pergunta
![pergunta](docs/pergunta.png)
### Tela de acerto
![acerto](docs/acertou.png)
### Tela de erro
![erro](docs/errou.png)

## Instalação 
**Linguagens**: Prolog<br>
**Tecnologias**: Não tem<br> 

## Uso 

Para poder utilizar a aplicação é necessário ter instalado na sua maquina o [***SWI Prolog***](https://www.swi-prolog.org/)

Recomenda-se que faça a instalação via terminal, segue um passo a passo de como instalar:

### Instalação para o Mac

Para instalar no mac, deve-se ter instalado o [***Homebrew***](https://brew.sh/). Sua instalação está bem documentada dentro do seu site (clique em "Homebrew").

Com o [***Homebrew***](https://brew.sh/) instalado, rode o seguinte comando:

```bash
brew install swi-prolog
```

### Instalação para o Linux

#### Para distribuições baseadas no Debian/Ubuntu (como Ubuntu, Linux Mint, etc.):

Abra o terminal e execute os seguintes comandos:

```bash
sudo apt update
sudo apt install swi-prolog
```
#### Para distribuições baseadas no Fedora (Fedora, RHEL, CentOS, etc.):

Abra o terminal e execute:
```bash
sudo dnf install swi-prolog
```

#### caso esteja utilizando uma versão mais antiga do Fedora que usa yum, utilize:

```bash
sudo yum install swi-prolog
```

### Após ter o prolog instalado

1. Entre na pasta app
```bash
cd app
```

2. Execute o arquivo main.pl
```bash
swipl main.pl
```

## Vídeo
<!-- Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min -->

## Participações

Aqui está a tabela com os nomes em ordem alfabética:

| Nome do Membro    | Contribuição                                | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) | Comprobatórios                                                                                                          |
| ----------------- | ------------------------------------------- | ------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| Amanda Nobre      | Adiciona predicado de adivinhacao final     | Excelente                                                                      | [Adiciona predicado de adivinhacao final](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/11)    |
| Fellipe Pereira   | Adiciona predicado de adivinhacao final     | Excelente                                                                      | [Adiciona predicado de adivinhacao final](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/11)    |
| Gabriel Sabanai   | Melhorias no banco de conhecimento          | Boa                                                                            | [Melhorias no banco de conhecimento](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/12)         |
| Guilherme Barbosa | Melhorias no banco de conhecimento          | Boa                                                                            | [Melhorias no banco de conhecimento](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/12)         |
| Ingrid Carvalho   | Criação de banco de conhecimento            | Excelente                                                                      | [Criação de banco de conhecimento](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/7)            |
| Lais Portela      | Criação de banco de conhecimento            | Excelente                                                                      | [Criação de banco de conhecimento](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/7)            |
| Luciano Ricardo   | Interface de jogo                           | Excelente                                                                      | [Interface de jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/9)                           |
| Luiz Henrique     | Implementação incial do motor de inferencia | Excelente                                                                      | [Implementação incial do motor de inferencia](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/8) |
| Natan Tavares     | Interface de jogo                           | Excelente                                                                      | [Interface de jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/9)                           |
| Pablo Christianno | Implementação incial do motor de inferencia | Excelente                                                                      | [Implementação incial do motor de inferencia](https://github.com/UnBParadigmas2024-2/2024.2_G3_Logico_Pokenator/pull/8) |

## Outros 

**Lições Aprendidas:**  
- O desenvolvimento do projeto ajudou a melhorar minha lógica de programação e habilidades de resolução de problemas.  

**Percepções:**  
- O Prolog foi mais dificil comparado ao Haskell.

**Contribuições:** 
- Permitiu entender melhor o paradigma lógico e explorar sua aplicação prática.  

**Fragilidades:**  
- Alguns itens, como peso e altura, possuem representação menos intuitiva (com hífen no meio).  

**Trabalhos Futuros:**  
- Expandir a base de conhecimento para abranger todas as gerações de Pokemon.  
- Implementar a opção "Não sei" como resposta válida.  
- Criar uma interface gráfica para facilitar o uso.  
- Melhorar a representação de informações como peso e altura, utilizando uma tradução mais amigável.  


## Fontes
[**Site oficial da PokeAPI:** https://pokeapi.co/](https://pokeapi.co/)

[**Site oficial do Akinator:** https://pt.akinator.com/](https://pt.akinator.com/)

[**Site oficial do Pokémon:** https://www.pokemon.com/br](https://www.pokemon.com/br)

[**Site oficial do Prolog:** https://www.swi-prolog.org/](https://www.swi-prolog.org/)

[**Site oficial do Homebrew:** https://brew.sh/](https://brew.sh/)

[**Projeto Akinator GOT**](https://github.com/Paradigmas-2-2017/akinator-of-thrones)

## Curiosidades
Essa sessão é apenas curiosidades divertidas, logo será utilizada uma linguagem bem informal. Divirta-se e depois, se quiser, fale na revisão qual é o seu pokemon favorito ❤️.


O melhor pokemon é definitivamente o Squirtle, pega o drip do pai - Sabanai

![Imagem Squirtle: https://uploads.alternativanerd.com.br/wp-content/uploads/2018/07/AN_Squirtle.jpg](https://uploads.alternativanerd.com.br/wp-content/uploads/2018/07/AN_Squirtle.jpg)

O melhor é o Gengar porque eu claramente não tenho personalidade para escolher um pokemon melhor :D - Gui (Escrito por Sabanai)

![Imagem Gengar: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvtBbGBv-qNawyuSYf6CAyg8bmvWMuSHMVWw&s](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvtBbGBv-qNawyuSYf6CAyg8bmvWMuSHMVWw&s)

Meu Pokemon favorito é o Charizard (achei mt normie - Sabanai) porque eu gosto muito de dragões huhu - Natan

![Imagem Charizard: https://criticalhits.com.br/wp-content/uploads/2024/04/Charizard-flying.jpg](https://criticalhits.com.br/wp-content/uploads/2024/04/Charizard-flying.jpg)

