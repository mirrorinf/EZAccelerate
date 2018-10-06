#  EZAccelerate

EZAccelerate aims at provide a simple and safe way to use the highly efficient Accelerate framework. Its design is simple, modern and fast.

## How to use it?

Simply copying the .swift files to your project could be fine. Support for precompiled use is in progress.
EZAccelerate is clean, with no third-party dependencies.

## How it it organized?

Currently there is only wrapper for basic vecLib function. The core is the `EZA2DArray` type. It's a swift value type and can be a vector or a matrix. Elements are of the `Double` type, stored in column-major order.
The vForce pointwise functions are wrapped as computed properties, like `v.log` or `v.sin`. Vector and matrix arithmetic functions are wrapped as operators, and there is some support for basic linear algebra functions.

Notice: Function `EZA2DArray.solve` and computed property  `EZA2DArray.rank` `EZA2DArray.inverse` `EZA2DArray.singularValues` requires use of LAPACK. If the matrix is explictly taken transpose(therefore a mutable instance), `EZA2DArray.prepareForLAPACK` should be called before any of the computation.

Notice: For the sake of efficiency, NO CHECK ON ARRAY DIMENSIONS ARE PERFORMED IN ANY FUNCTION, the user is responsible for giving correct inputs. However, if a matrix is not compatible with LAPACK routines, a fatal error with a message is raised. FOR CERTAIN BAD INPUTS, THE LIBRARY WOULD MISBEHAVE RATHER THAN RAISE ANY ERROR.

Notice: There hasn't been any documentation yet, and is NOT going to be in the near future(after all it's a personal project). The code should be clearly self-documented and intuitive enough. If there is any problem with the functionality, searching Apple's documentation on Accelerate might help.
