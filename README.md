# Solidity Fixed Point

A package which provides fixed point decimal types. This package supports Solidity version 0.8.8 and above.

## Types

### Unsigned Types

- `UFixed256x18` - An unsigned 256 bit fixed point number with 18 decimals of precision

## Operations

All operations only support 256 bit fixed point types. Smaller types (e.g. `UFixed80x18`,`UFixed128x18`, `UFixed16x10`, 
`UFixed32x10`) are expected to be upcasted to their corresponding 256 bit representations before performing calculations
and then converted back to the appropriate type. This was done to keep the library as simple as possible.

Operations that a type supports are globally exported to all importers.

All multiplication and division operations round to the nearest smallest fractional value.

### Supported Operations

- `add(x, y)` - Adds two fixed point numbers with overflow checking
- `sub(x, y)`- Subtracts two fixed point numbers with overflow checking
- `mul(x, y)` - Multiplies two fixed point numbers with overflow checking
- `div(x, y)` - Divides two fixed point numbers with overflow checking
- `unsafeAdd(x, y)` - Adds two fixed point numbers without overflow checking
- `unsafeSub(x, y)` - Subtracts two fixed point numbers without overflow checking
- `unsafeMul(x, y)` - Multiplies two fixed point numbers without overflow checking
- `unsafeDiv(x, y)` - Divides two fixed point numbers without checking for division by zero or overflow
- `ceil(v)` - Rounds a fixed point number up to the nearest integer
- `floor(v)` - Rounds a fixed point number down to the nearest integer
- `round(v)` - Rounds a fixed point number to the nearest integer
- `truncate(v)` - Truncates a fixed point number
- `unwrap(v)` - Alias for `<Type>.unwrap`