:- include('knowledge_base.pl').

% Conta Pokemons para cada característica
conta_caracteristica(Caracteristica, Valor, Contagem) :-
    findall(Pokemon, call(Caracteristica, Pokemon, Valor), Lista),
    length(Lista, Contagem).

caracteristicas([tipo, altura, peso, formato, habitat, cor]).
% Escolhe melhor pergunta a ser feita
% Escolhe melhor pergunta a ser feita
perguntar :-
    caracteristicas(Caracteristicas),  % Obtém a lista de características
    findall(
        (Caracteristica, Valor, Contagem),
        (
            member(Caracteristica, Caracteristicas), 
            call(Caracteristica, _, Valor),          % Obtém valores para a característica
            conta_caracteristica(Caracteristica, Valor, Contagem)
        ),
        OpcoesNaoUnicas
    ),
    sort(OpcoesNaoUnicas, Opcoes), % Remove duplicatas
    selecionar_melhor_pergunta(Opcoes, (Carac, Valor)),
    format('A entidade possui ~w igual a ~w? (s/n): ', [Carac, Valor]),
    read(Resposta). 
    % processar_resposta(Resposta, MelhorPergunta). % Atualiza a base de características e pokemons. (Implementar na filtragem)

% Seleciona pergunta capaz de eleiminar mais Pokemons da base
selecionar_melhor_pergunta(Opcoes, (Caracteristica, Valor)) :-
    maplist(extraia_terceiro, Opcoes, Chaves),
    maplist(inverter_chave, Chaves, ChavesInvertidas), 
    pairs_keys_values(Pares, ChavesInvertidas, Opcoes),
    keysort(Pares, ParesOrdenados),
    pairs_values(ParesOrdenados, [(Caracteristica, Valor, _)|_]).
inverter_chave(Chave, ChaveInvertida) :-
    ChaveInvertida is -Chave.
extraia_terceiro((_, _, Terceiro), Terceiro).