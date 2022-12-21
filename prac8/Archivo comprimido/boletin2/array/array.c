#define ARRAY_SIZE 5
int array[ARRAY_SIZE] = {10,20,30,40,50};
int main() {
    int i=0, sum = 0;
    while(i < ARRAY_SIZE) {
        sum += array[i];
        ++i;        
    }
    return sum;
}
