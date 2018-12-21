// to generate parser and lexer
antlr4 -Dlanguage=Python3 wReach.g4

// to execute the program
python3 antlr.py input.txt


// if you get 'object takes no parameters' error
// insert the following into wReachListener.py
    def __init__(self, output):
        pass
