/*
 * Test function for testing Key-value Store library for basic functionality with edge cases
 *
 * Author:  Abhijit Shanbhag<abhijit.shanbhag@rutgers.edu>
 * 		    Priyanka Dhingra<pd374@scarletmail.rutgers.edu>
 */
#include "kvstore.h"
#include<stdio.h>
#include<string.h>

int main() {
	int k1 = 55;
	printf("size for key1:%d: is %d\n", k1, size(&k1));

	if (put(&k1, "value1", 10)) {
		printf("put done:\n");
	} else {
		printf("ERROR in put:\n");
	}
	printf("size for key1:%d: is %d\n", k1, size(&k1));

	int k2 = 20;
	printf("size for key1:%d: is %d\n", k2, size(&k2));

	char val1[100];
	if (get(&k1, val1, 50)) {
		printf("get success done:\n");
		printf("value for key1:%d: is %s\n", k1, val1);

	} else {
		printf("key not found:\n");
	}
	int k3 = 100;
	printf("looking for  key:%d: \n", k3);
	if (get(&k3, val1, 50)) {
		printf("get success done:\n");
		printf("value for key1:%d: is %s\n", k3, val1);

	} else {
		printf("key not found:\n");
	}
	printf("size for key1:%d: is %d\n", k1, size(&k1));
	delete(&k1);
	printf("key :%d deleted:\n", k1);
	printf("size for key1:%d: is %d\n", k1, size(&k1));
}

