:- dynamic entidade/1, pergunta_feita/2.

conta_caracteristica(Caracteristica, Valor, Contagem) :-
    findall(Pokemon, (
        entidade(Pokemon),
        call(Caracteristica, Pokemon, Valor)
    ), Lista),
    length(Lista, Contagem).

impacto_pergunta(Caracteristica, Valor, Impacto) :-
    conta_caracteristica(Caracteristica, Valor, Sim),
    findall(Pokemon, (
        entidade(Pokemon),
        \+ call(Caracteristica, Pokemon, Valor)
    ), ListaNao),
    length(ListaNao, Nao),
    Impacto is min(Sim, Nao).


processar_resposta(Resposta, Caracteristica, Valor, _) :-
    (Resposta = "s" ->
        findall(Pokemon, (
            entidade(Pokemon),
            call(Caracteristica, Pokemon, Valor)
        ), Lista),
        atualizar_base(Lista)
    ;
        findall(Pokemon, (
            entidade(Pokemon),
            call(Caracteristica, Pokemon, Valor)
        ), Lista),
        remover_da_base(Lista)
    ).

atualizar_base(Lista) :-
    forall(entidade(Pokemon), (
        \+ member(Pokemon, Lista) -> retract(entidade(Pokemon)) ; true
    )).

remover_da_base(Lista) :-
    forall(member(Pokemon, Lista), retract(entidade(Pokemon))).

caracteristicas([tipo, altura, peso, formato, habitat, cor]).
