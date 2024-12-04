% Conta Pokemons para cada característica
conta_caracteristica(Caracteristica, Valor, Contagem) :-
    findall(Pokemon, call(Caracteristica, Pokemon, Valor), Lista),
    length(Lista, Contagem).

% Escolhe melhor pergunta a ser feita
perguntar :-
    findall(
        (Caracteristica, Valor, Contagem),
        (current_predicate(Caracteristica/2), call(Caracteristica, _, Valor), conta_caracteristica(Caracteristica, Valor, Contagem)),
        Opcoes
    ),
    selecionar_melhor_pergunta(Opcoes, MelhorPergunta),
    format('A entidade possui ~w igual a ~w? (s/n) ', MelhorPergunta),
    read(Resposta),
    processar_resposta(Resposta, MelhorPergunta). % Atualiza a base de características e pokemons. (Implementar na filtragem)

% Seleciona pergunta capaz de eleiminar mais Pokemons da base
selecionar_melhor_pergunta(Opcoes, (Caracteristica, Valor)) :-
    sort(3, @>=, Opcoes, [(Caracteristica, Valor, _)|_]).