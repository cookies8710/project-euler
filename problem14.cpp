#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

const long long problemSize = 1000000;
const long reclimit = 500, ilimit = 527359244;

long long calcLength(long long n, std::vector<long long>& vec, int recursionDepth)
{
	if(n == 1)
		return 1;

	if(recursionDepth > reclimit || n > ilimit)
		return 9999;

	if(n >= vec.size())
	{
	//	cout << "Index too big, resizing to " << 2*n << endl;
		vec.resize(2*n);
	}	

//cout << "accessing "<<n<<endl;
	if(vec[n] != 0)
		return vec[n];
	
	long long nextStep; 
	if(n % 2)
		nextStep = 3*n+1;
	else
		nextStep = n / 2;

//cout<<"next step: " << nextStep << endl;

	long long nsl = calcLength(nextStep, vec, recursionDepth + 1);
	
	vec[n] = 1 + nsl;	
	//cout << "Added length for " << n << ": " << vec[n] << endl;

	return vec[n];	
}

int main(void)
{
	std::vector<long long> lengths;

	cout << "Project Euler - Problem 14" << endl;


	std::vector<int> haskell;



	for (int i = 1; i < problemSize; ++i)
	{
	//	if(i % 1000 == 0)
	//		cout << i << endl;
		long long len = calcLength(i, lengths, 0);
		if(len > reclimit)
			haskell.push_back(i);
	}

	std::vector<int>::const_iterator hi = haskell.begin(), he = haskell.end();

	cout << "has = [";
	int r = 0;
	while(hi != he)
	{
		cout <<  *hi++ << ", ";
		if(++r > 10)
		{
			cout << endl;
			r = 0;
		}
	}
	//cout << "Done - haskell size: " << haskell.size() << endl;

	cout << "]" << endl;

	return 0;
}