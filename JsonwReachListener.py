import sys
import json
from antlr4 import *
from wReachParser import wReachParser
from wReachListener import wReachListener

class JsonwReachListener(wReachListener) :
    def __init__(self, output):
        self.output = output
        self.output.write('{')

    # Enter a parse tree produced by wReachParser#mode_var_list.
    def enterMode_var_list(self, ctx:wReachParser.Mode_var_listContext):
        self.output.write('"mode_var_list": [')

    # Exit a parse tree produced by wReachParser#mode_var_list.
    def exitMode_var_list(self, ctx:wReachParser.Mode_var_listContext):
        self.output.write(']')


    # Enter a parse tree produced by wReachParser#mode_var_decl.
    def enterMode_var_decl(self, ctx:wReachParser.Mode_var_declContext):
        self.output.write('{"mode_var_decl": {')

    # Exit a parse tree produced by wReachParser#mode_var_decl.
    def exitMode_var_decl(self, ctx:wReachParser.Mode_var_declContext):
        self.output.write('}}')


    # Enter a parse tree produced by wReachParser#system_var_list.
    def enterSystem_var_list(self, ctx:wReachParser.System_var_listContext):
        self.output.write('"system_var_list": [')        

    # Exit a parse tree produced by wReachParser#system_var_list.
    def exitSystem_var_list(self, ctx:wReachParser.System_var_listContext):
        self.output.write(']')


    # Enter a parse tree produced by wReachParser#system_var_decl.
    def enterSystem_var_decl(self, ctx:wReachParser.System_var_declContext):
        self.output.write('{"system_var_decl": {')

    # Exit a parse tree produced by wReachParser#system_var_decl.
    def exitSystem_var_decl(self, ctx:wReachParser.System_var_declContext):
        self.output.write('}}')


    # Enter a parse tree produced by wReachParser#var_type.
    def enterVar_type(self, ctx:wReachParser.Var_typeContext):
        self.output.write('"var_type": "TYPE"')

    # Exit a parse tree produced by wReachParser#var_type.
    def exitVar_type(self, ctx:wReachParser.Var_typeContext):
        self.output.write('')


    # Enter a parse tree produced by wReachParser#var_range.
    def enterVar_range(self, ctx:wReachParser.Var_rangeContext):
        self.output.write('"var_range": [')

    # Exit a parse tree produced by wReachParser#var_range.
    def exitVar_range(self, ctx:wReachParser.Var_rangeContext):
        self.output.write(']')


    # Enter a parse tree produced by wReachParser#mode_list.
    def enterMode_list(self, ctx:wReachParser.Mode_listContext):
        self.output.write('"mode_list": [')

    # Exit a parse tree produced by wReachParser#mode_list.
    def exitMode_list(self, ctx:wReachParser.Mode_listContext):
        self.output.write(']')


    # Enter a parse tree produced by wReachParser#mode_decl.
    def enterMode_decl(self, ctx:wReachParser.Mode_declContext):
        self.output.write('{"mode_decl": {')

    # Exit a parse tree produced by wReachParser#mode_decl.
    def exitMode_decl(self, ctx:wReachParser.Mode_declContext):
        self.output.write('}}')


    # Enter a parse tree produced by wReachParser#mode_condition.
    def enterMode_condition(self, ctx:wReachParser.Mode_conditionContext):
        self.output.write('"mode_condition": {')

    # Exit a parse tree produced by wReachParser#mode_condition.
    def exitMode_condition(self, ctx:wReachParser.Mode_conditionContext):
        self.output.write('}')


    # Enter a parse tree produced by wReachParser#cmp.
    def enterCmp(self, ctx:wReachParser.CmpContext):
        self.output.write('"cmp": "CMP"')

    # Exit a parse tree produced by wReachParser#cmp.
    def exitCmp(self, ctx:wReachParser.CmpContext):
        self.output.write('')


    # Enter a parse tree produced by wReachParser#invt.
    def enterInvt(self, ctx:wReachParser.InvtContext):
        self.output.write('"invt":')

    # Exit a parse tree produced by wReachParser#invt.
    def exitInvt(self, ctx:wReachParser.InvtContext):
        self.output.write('')


    # Enter a parse tree produced by wReachParser#invt_list.
    def enterInvt_list(self, ctx:wReachParser.Invt_listContext):
        self.output.write('"invt_list": [')

    # Exit a parse tree produced by wReachParser#invt_list.
    def exitInvt_list(self, ctx:wReachParser.Invt_listContext):
        self.output.write(']')


    # Enter a parse tree produced by wReachParser#invt_decl.
    def enterInvt_decl(self, ctx:wReachParser.Invt_declContext):
        self.output.write('"invt_decl": {')

    # Exit a parse tree produced by wReachParser#invt_decl.
    def exitInvt_decl(self, ctx:wReachParser.Invt_declContext):
        self.output.write('')


    def exitWReach(self, ctx:wReachParser.WReachContext):
        self.output.write('}')
