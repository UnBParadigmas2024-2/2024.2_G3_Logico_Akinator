:- dynamic entidade/1, pergunta_feita/2, contador_perguntas/1.
:- [knowledge_base].
:- [inference_engine].

:- initialization(main).

main :-
    limpar_terminal,
writeln('██████╗  ██████╗ ██╗  ██╗███████╗███╗   ██╗ █████╗ ████████╗ ██████╗ ██████╗ '),
    writeln('██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝████╗  ██║██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗'),
    writeln('██████╔╝██║   ██║█████╔╝ █████╗  ██╔██╗ ██║███████║   ██║   ██║   ██║██████╔╝'),
    writeln('██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ██║╚██╗██║██╔══██║   ██║   ██║   ██║██╔══██╗'),
    writeln('██║     ╚██████╔╝██║  ██╗███████╗██║ ╚████║██║  ██║   ██║   ╚██████╔╝██║  ██║'),
    writeln('╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝  '),
    writeln(''),
    writeln('Bem-vindo ao sistema de inferência Pokémon!'),
    menu,
    halt.

menu :-
    writeln('Escolha uma opção:'),
    writeln('1. Jogar'),
    writeln('2. Sair'),
    read_line_to_string(user_input, OpcaoStr),
    string_lower(OpcaoStr, Opcao),
    (Opcao = "1" ->
        limpar_terminal,
        jogar
    ; Opcao = "2" ->
        writeln('Obrigado por jogar! Até a próxima.'),
        halt
    ;
        writeln('Opção inválida. Tente novamente.'),
        menu
    ).

jogar :-
    inicializar_contador,
    perguntar,
    writeln('Deseja jogar novamente? (s/n):'),
    read_line_to_string(user_input, RespostaStr),
    string_lower(RespostaStr, Resposta),
    (Resposta = "s" ->
        resetar_jogo,
        limpar_terminal,
        jogar
    ;
        writeln('Obrigado por jogar! Até a próxima.'),
        halt
    ).

perguntar :-
    findall(Pokemon, entidade(Pokemon), ListaEntidades),
    length(ListaEntidades, NumEntidades),
    limpar_terminal,
    (
NumEntidades = 0 ->
        writeln('Nenhuma entidade corresponde aos critérios.')
;
    NumEntidades = 1 ->
                exibir_contador_perguntas,
            adivinhar
;
    caracteristicas(Caracteristicas),
    findall(
        (Impacto, Caracteristica, Valor),
        (
            member(Caracteristica, Caracteristicas),
            call(Caracteristica, _, Valor),
            \+ pergunta_feita(Caracteristica, Valor),
            conta_caracteristica(Caracteristica, Valor, Contagem),
            Contagem > 0,
            impacto_pergunta(Caracteristica, Valor, Impacto)
        ),
        OpcoesNaoUnicas
    ),
    (OpcoesNaoUnicas = [] ->
        writeln('Todas as perguntas já foram feitas ou não há critérios válidos restantes.');
    sort(OpcoesNaoUnicas, [(MelhorImpacto, Carac, Valor)|_]),
    incrementar_contador,
    exibir_contador_perguntas,
    format('A entidade possui ~w igual a ~w? (s/n): ', [Carac, Valor]),
    read_line_to_string(user_input, RespostaStr),
    string_lower(RespostaStr, Resposta),
(Resposta = "exit" ->
        writeln('Saindo do jogo...'),
        halt;
    assert(pergunta_feita(Carac, Valor)),
    processar_resposta(Resposta, Carac, Valor, MelhorImpacto),
    perguntar))).

limpar_terminal :-
    write('\33[2J').

resetar_jogo :-
    retractall(entidade(_)),
    retractall(pergunta_feita(_, _)),
    retractall(contador_perguntas(_)),
    consult('knowledge_base.pl'),
    consult('inference_engine.pl').

inicializar_contador :-
    retractall(contador_perguntas(_)),
    assert(contador_perguntas(0)).

incrementar_contador :-
    contador_perguntas(Atual),
    Novo is Atual + 1,
    retract(contador_perguntas(Atual)),
    assert(contador_perguntas(Novo)).

exibir_contador_perguntas :-
    contador_perguntas(Contagem),
    format('Perguntas feitas até agora: ~w~n', [Contagem]).

adivinhar :-
    findall(Pokemon, entidade(Pokemon), ListaEntidades),
    length(ListaEntidades, NumEntidades),
    (
        NumEntidades = 1 ->
            [Pokemon] = ListaEntidades,
            format('O seu Pokémon é ~w. Correto? (s/n): ', [Pokemon]),
            read_line_to_string(user_input, RespostaStr),
            string_lower(RespostaStr, Resposta),
            (Resposta = "s" ->
                writeln('Acertei!!! 😁'),
                jogar
            ;
                writeln('Dessa vez eu falhei... Mas não fique triste, vamos tentar de novo!'),
                jogar
            )
    ;
        perguntar
    ).
