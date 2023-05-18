#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void generateTokens(){

}

void lexicalPhase(){
    int noOfTestFiles=5;
    for(int i=0;i<noOfTestFiles;++i){
        FILE    *textFile;
        char    line[200];
        
        char inputFileName[] ="tests/Input";
        strcat(inputFileName,"0");
        inputFileName[strlen(inputFileName)-1]='0'+i+1;
        strcat(inputFileName,".c");
        printf("Running test on file: %s\n",inputFileName);
        printf("-----------------------------------------------------\n");
        textFile = fopen(inputFileName, "r");

        if(textFile == NULL){
            printf("File Cannot be open or no file exist with name : %s \n",inputFileName);
            continue;
        }
        int lineCount=0;
        while(fgets(line, 100, textFile)){
            lineCount++;
            // generate all tokens and save all in a folder lexOutput
            generateTokens(line); 
        }
        printf("Lines = %d\n",lineCount);

        printf("-----------------------------------------------------\n\n");
        fclose(textFile);
    }
}

int main(){

    lexicalPhase();
    
    
    return 0;
}