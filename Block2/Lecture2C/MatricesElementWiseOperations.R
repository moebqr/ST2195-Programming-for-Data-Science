mat1 <- matrix(1:4, nrow = 2)
mat2 <- matrix(5:8, nrow = 2)

mat3 <- mat1 + mat2
print(mat3)

powerMat <- mat1 ^ mat2
print(powerMat)

# Standard Matrix Multiplication 
matMat <- mat1 %*% mat2
print(matMat)