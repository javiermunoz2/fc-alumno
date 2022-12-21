#define ARRAY_SIZE 10

long int array[ARRAY_SIZE] = {10,9,8,7,6,5,4,3,2,1};

int main() {
    int i = 0;
    while(i < ARRAY_SIZE) {
        array[i] = -1;
        ++i;
    }
}
