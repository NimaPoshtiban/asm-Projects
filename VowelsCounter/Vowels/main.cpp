#include <iostream>

extern "C" int CountVowels(const char* str);


int main() {
	const char* str = "Some thing";
	int count = CountVowels(str);

	std::cout << "There are " << count << " vowels in " << str << std::endl;

	return 0;
}
