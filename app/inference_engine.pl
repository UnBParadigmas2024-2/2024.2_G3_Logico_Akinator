:- dynamic caracteristica/2. % Define fatos dinâmicos para características

% Conta Pokémons para cada característica
conta_caracteristica(Caracteristica, Valor, Contagem) :-
    findall(Pokemon, caracteristica(Caracteristica, Valor), Lista),
    length(Lista, Contagem).

% Calcula impacto da pergunta
impacto_pergunta(Caracteristica, Valor, Impacto) :-
    % Conta Pokémon que possuem a característica
    conta_caracteristica(Caracteristica, Valor, Sim),
    % Conta Pokémon que não possuem a característica
    findall(Pokemon, (
        caracteristica(Caracteristica, OutroValor),
        OutroValor \= Valor
    ), ListaNao),
    length(ListaNao, Nao),
    % Impacto é a menor das duas quantidades
    Impacto is min(Sim, Nao).

% Pergunta com base nos fatos dinâmicos
perguntar :-
    caracteristicas(Caracteristicas),  % Obtém a lista de características
    findall(
        (Impacto, Caracteristica, Valor),
        (
            member(Caracteristica, Caracteristicas),
            caracteristica(Caracteristica, Valor),  % Obtém valores para a característica
            impacto_pergunta(Caracteristica, Valor, Impacto)
        ),
        OpcoesNaoUnicas
    ),
    sort(OpcoesNaoUnicas, [(MelhorImpacto, Carac, Valor)|_]), % Seleciona a pergunta com maior impacto
    format('A entidade possui ~w igual a ~w? (s/n): ', [Carac, Valor]),
    read(Resposta),
    processar_resposta(Resposta, Carac, Valor, MelhorImpacto). % Atualiza a base.

% Processa resposta e atualiza a base
processar_resposta(Resposta, Caracteristica, Valor, _) :-
    (Resposta == s ->
        % Mantém apenas os Pokémon que atendem à característica
        retractall(caracteristica(Caracteristica, _)),
        assert(caracteristica(Caracteristica, Valor))
    ;
        % Remove os Pokémon que possuem a característica
        retractall(caracteristica(Caracteristica, Valor))
    ).

% Lista de características disponíveis
caracteristicas([tipo, altura, peso, formato, habitat, cor]).

% Exemplos de fatos dinâmicos para teste
:- assert(caracteristica(tipo, fogo)).
:- assert(caracteristica(tipo, agua)).
:- assert(caracteristica(altura, 0.2)).
:- assert(caracteristica(altura, 0.5)).
:- assert(caracteristica(habitat, floresta)).
:- assert(caracteristica(habitat, montanha)).
