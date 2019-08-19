#ifndef MAIN_H
#define MAIN_H

char* names[100];
ine set[100];
int count = 0;
double value[100];

//将变量名加入数组
int add(char* name){
    int i;
    for(i=0;i<count;i++){
        if(strcmp(name,names[i])==0){
            return i;
        }
    }
    count++;
    names[i] = strdup(name);
    return i;
}
//设置变量值
int setValue(int index,double variable){
    value[index] = variable;
    set[index] = 1;
    return variable;
}
#endif