--

pow _ 0 = 1
pow n x = n * pow n (x-1)
