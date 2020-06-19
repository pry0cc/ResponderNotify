#!/usr/bin/env python

import sqlite3

def DbConnect():
    cursor = sqlite3.connect("./Responder.db")
    return cursor

def GetResponderCompleteNTLMv2Hash(cursor):
     res = cursor.execute("SELECT fullhash FROM Responder WHERE type LIKE '%v2%' AND UPPER(user) in (SELECT DISTINCT UPPER(user) FROM Responder)")
     Output = ""
     for row in res.fetchall():
         Output += '{0}'.format(row[0])+'\n'
     return Output

cursor = DbConnect()
v2 = GetResponderCompleteNTLMv2Hash(cursor)
print(v2)
