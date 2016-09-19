type
    A = object
        B : string

let a = A(B:"test")

echo declared(A)   #true
echo declared(A.B) #false
echo declared(A.b) #false
echo declared(A.C) #false

echo declared(a)   #true
echo declared(a.B) #false
echo declared(a.b) #false
echo declared(a.C) #false