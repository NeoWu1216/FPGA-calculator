#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define max_size 169

int toNext(int a) {
  if (a <= 3) 
    return 3;
  return (a%2) ? a : a+1;
}

void print5(int first, int second, int arg0, int arg1, int arg2, int p, int machineNum) {
  printf("  fulladder fa%d(", machineNum);
  if (first == -1) //p 
    printf("p[%d], ", p);
  else
    printf("temp[%d], ", first);
  printf("temp[%d], ", second); 
  int arg[] = {arg0, arg1, arg2};
  for (int i = 0; i < 2; i++) {
    int currArg = arg[i];
    if (currArg > max_size)
      printf("a[%d]&b[%d], ", currArg-300-max_size, p-(currArg-300-max_size));
    else if (currArg >= 0) 
      printf("temp[%d], ", currArg);
    else {
      assert(currArg == -2);
      printf("1'b0, ");
    }
  }
  int currArg = arg[2];
  if (currArg > max_size)
    printf("a[%d]&b[%d]);\n", currArg-300-max_size, p-(currArg-300-max_size));
  else if (currArg >= 0) 
    printf("temp[%d]);\n", currArg);
  else {
    assert(currArg == -2);
    printf("1'b0);\n");
  }
}

int* printCurLevel(int* new, int newSize, int* currtemp, int p, int* machineNum, int* vecSize) {
  int capacity = 1;
  int size = 0;
  int* next = malloc(sizeof(int)*capacity);
  int prevfirst = (newSize==3) ? -1 : (*currtemp)++; //previous term's first formal argument(output-s)
  next[size++] = (*currtemp)++;
  print5(prevfirst, next[0], new[0], new[1], new[2], p, (*machineNum)++);
  assert ((newSize-3)%2==0); 
  int num_iterations = (newSize-3)/2;
  int ixNew = 3;
  for (int i = 0; i < num_iterations; i++) {
    int arg0 = prevfirst; 
    int arg1 = new[ixNew++];
    int arg2 = new[ixNew++]; //can be in same line, just for stype
    assert(ixNew <= newSize);
    prevfirst = (i == num_iterations-1) ? -1 : (*currtemp)++; 
    if (size == capacity) {
      capacity *= 2; 
      next = realloc(next, capacity*sizeof(int));
    }
    next[size++] = (*currtemp)++;
    print5(prevfirst, next[size-1], arg0, arg1, arg2, p, (*machineNum)++);  
  }
  printf("\n");
  free(new);
  next = realloc(next, size*sizeof(int));
  *vecSize = size;
  return (next); 
}

int main() {
  //this c file is for print of wallace7.v
  printf("module wallaceWeird(p, a, b);\n  input [13:0]  a,b;\n  output [13:0]  p;\n"); 
  printf("  assign p[0] = a[0]&b[0];\n  wire [%d:0] temp;\n", max_size-1);
  
  //main body
  int currtemp = 0;
  int* vecNext = NULL;
  int vecSize = 0; //size of vecNext
  int machineNum = 0;
  for (int p = 1; p < 14; p++) {
    int size = toNext(p+1+vecSize);
    int *vecNew = malloc(sizeof(int)*size);
    for (int i = 0; i < p+1; i++) {
      vecNew[i] = i+max_size+300; //choose arbitrary value of max_size+300 increment...
    }
    int *temp = vecNew+p+1;
    for (int i = 0; i < vecSize; i++) {
      temp[i] = vecNext[i];
    }
    temp = vecNew+p+1+vecSize;
    while(temp != vecNew+size)
      *temp++ = -2; //special value for 0
    free(vecNext);
    vecNext = printCurLevel(vecNew, size, &currtemp, p, &machineNum, &vecSize);
  }
  free(vecNext);

  printf("endmodule\n");
  assert (currtemp <= max_size);
}
