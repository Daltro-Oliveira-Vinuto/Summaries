
#define A 10 
#define B 20 

int main(int argc, char *argv[], char *envp[]) {
	int i, j;

	for(j=0, i = A; i < B ; i++) {
		j+= i;
	}
}