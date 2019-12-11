 /* 
  * 词法分析器
  */

%{



%}

 /* 
  * 正则表达式定义
  */
letter [a-zA-Z]+

%%

 /* 
  * 规则 
  * 数字 
  * 变量名  可以是 数字字母和下划线
  * 空白  换行符
  * 逻辑符号  && || ~ 
  */
"+"  {return ADD;}
"-"  {return SUB;}
"*"  {return MUL;}
"/"  {return DIV;} 
"&&" {return AND;}
"||" {return OR;}
"~"  {return NOT;}
{letter}	{return VAR;}
\n	{return EOL;}
[ \t]   { /*忽略空白*/ }
.  yyerror("无效的输入字符");
%%

