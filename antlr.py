import sys
from antlr4 import *
from wReachLexer import wReachLexer
from wReachParser import wReachParser
from JsonwReachListener import JsonwReachListener

def main(argv):
    print('mainfunc')
    input = FileStream(argv[1])
    lexer = wReachLexer(input)
    stream = CommonTokenStream(lexer)
    parser = wReachParser(stream)
    tree = parser.chat()

    output = open("output.json","w")
    
    jsonwReach = JsonwReachListener(output)
    walker = ParseTreeWalker()
    walker.walk(jsonwReach, tree)
    output.close()      

if __name__ == '__main__':
    main(sys.argv)
