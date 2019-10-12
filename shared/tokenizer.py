#!/usr/bin/env python3

import re
from collections import namedtuple

class Tokenizer:

  Token = namedtuple('Token', 'name text span')

  def __init__(self, tokens):
    self.tokens = tokens
    pat_list = []
    for tok, pat in self.tokens:
      pat_list.append('(?P<%s>%s)' % (tok, pat))
    self.re = re.compile('|'.join(pat_list))

  def iter_tokens(self, file, ignore_ws=True):
    with open(file, 'r') as file:
        input = file.read().replace('\n', '')
        for match in self.re.finditer(input):
            if ignore_ws and match.lastgroup == 'WHITESPACE':
                continue
            yield Tokenizer.Token(match.lastgroup, match.group(0), match.span(0))

  def tokenize(self, input, ignore_ws=True):
    return list(iter_tokens(input, ignore_ws))

# test program
if __name__ == "__main__":

  TOKENS = [
    ('NIL'        , r"nil|\'()"),
    ('TRUE'       , r'true|#t'),
    ('FALSE'      , r'false|#f'),
    ('NUMBER'     , r'\d+'),
    ('STRING'     , r'"(\\.|[^"])*"'),
    ('SYMBOL'     , r'[\x21-\x26\x2a-\x7e]+'),
    ('SENTENCE'   , r'([A-Z][^\.!?]*[\.!?])'),
    ('QUOTE'      , r"'"),
    ('LPAREN'     , r'\('),
    ('RPAREN'     , r'\)'),
    ('DOT'        , r'\.'),
    ('WHITESPACE' , r'\w+')
  ]
  

  for t in Tokenizer(TOKENS).iter_tokens("krzyzacy.txt"):
    print(t)