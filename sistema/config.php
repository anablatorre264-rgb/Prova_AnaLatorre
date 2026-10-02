<?php
// Ajuste estes dados conforme seu XAMPP ou Laragon.
const DB_HOST = '127.0.0.1';
const DB_PORT = 3307;
const DB_USER = 'root';
const DB_PASS = '';
const DB_NAME = 'saep_db';
const TEMPO_SESSAO = 900; // 

// Chave didática, compatível com os CPFs de exemplo do SQL.
// Em produção, use segredo externo e planeje a migração dos dados.
const SEGREDO_CPF = 'SAEP-clinica-chave-didatica-2026';
date_default_timezone_set('America/Sao_Paulo');