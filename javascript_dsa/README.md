# Estruturas de Dados em JavaScript

Implementações clássicas de **estruturas de dados** em **JavaScript (ESM)**, com foco em prática de algoritmos.

## Estruturas Implementadas

- **Listas Encadeadas**
  - Lista Simplesmente Encadeada (Singly Linked List)

## Stack

- **Node.js** (ESM) — recomendado **>= 20**
- Testes: [`node:test`](https://nodejs.org/api/test.html) + `assert`

> Observação: como usamos `import`/`export`, o projeto usa `"type": "module"` no `package.json`.

---

## Como rodar os testes

Sem Docker

```bash
npm run test
```

Com Docker

```bash
docker compose build

docker compose run --rm javascript_dsa npm run test
```
