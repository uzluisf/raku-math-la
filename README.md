# Math::LinearAlgebra Module

## Usage

```
use LinearAlgebra::Vector;

my $v = LinearAlgebra::Vector.new(4, 7);
my $w = LinearAlgebra::Vector.new(10, 1);
say $v.dot-product($w); #=> 47
```

## Vector Class

### Methods

* `method new` — return a new vector object.
* `method magnitude` — returns the vector's magnitude.
*  `method norm` — same as magnitude.
* `method normalize` — returns the vector's normalized version.
* `method angle` — returns the angle between the invocant and another vector.
*  `method round` — returns a new vector rounded to the given precision.
* `method elems` — returns how many elements the vector has.
*  `method dot-product` — takes the vector's dot product and return it.
* `method cross-product` — take the vector's cross  product and return it.
* `method is-parallel` — returns whether two vectors (invocant and argument) are parallel.
* `method is-perpendicular` — returns whether two vectors (invocant and argument) are perpendicular.
* `method is-independent` — returns whether two vectors are independent.
* `method is-zero` — returns whether all the vector's values are zero.
 
### Operations

* `+` — adds two `Vector`s and returns the result.
* `-` — subtracts two `Vector`s and returns the result.
* `*` — same as finding the dot product.
* `*` — scales a `Vector`s by a number.
* `==` — returns whether two `Vector`s are equal (meaning they've the same components, not that they're the same object).
 
## Matrix Class

### Methods

* `method determinant` — returns the matrix's determinant.
* `method transpose` — returns the transpose of matrix.
* `method identity` — returns an identity of dimension `nxn`.
* `method row-echelon` — returns the matrix in row-echelon form.
* `method inverse` — returns the inverse of matrix.
* `method elems` — returns the number of rows and columns of a matrix.

### Operations

* `+` — returns the result of adding two `Matrix`es.
* `-` — returns the result of subtracting two `Matrix`es.
* `*` — returns the result of multiplying two `Matrix`es.
* `==` — returns whether two `Matrix`es are equal (meaning they've the same components, not that they're the same object).

