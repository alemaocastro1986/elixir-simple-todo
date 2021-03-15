# Simple Todo

Lista de tarefas a serem realizadas

## Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.


### Pré-requisitos

De que coisas você precisa para instalar o software e como instalá-lo?

```elixir
Erlang/OTP 23 [erts-11.1.8] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Elixir 1.11.3 (compiled with Erlang/OTP 21)
```

### Instalação

você precisa de uma conta no github para prosseguir.

1 - Clone repository
```bash
git clone https://github.com/alemaocastro1986/elixir-simple-todo.git
```
2 - Instalar as dependêcias
```bash
mix deps.get
```
3 - Utilizando o console interativo
```bash
iex -S mix
```
### Comandos:

#### List
```elixir
iex(1)> Todo.list()
```
#### Add
```elixir
iex(1)> Todo.add(%{description: "new todo", start_date: ~D[2021-03-25]})
```
#### update 
```elixir
iex(1)> Todo.update(1, %{description: "updated todo", start_date: ~D[2021-03-25]})
```
#### its_done
```elixir
iex(1)> Todo.its_done(1)
```
#### delete
```elixir
iex(1)> Todo.delete(1)
```
<hr/>


## Executando os testes

```bash
mix test
```


### testes de estilo de codificação

Análise de código estático e consistência de código

```bash
mix credo --strict
```

## Construído com

* [Elixir](https://elixir-lang.org/docs.html) - linguagem
* [Credo](https://github.com/rrrene/credo) - Linter 

