pragma solidity >=0.8.8;

/// @dev An unsigned 256 bit 18 decimal fixed point number
/// @dev Commonly called WAD (https://github.com/makerdao/dss/blob/master/DEVELOPING.md#units)
type UFixed256x18 is uint256;

/// @dev An unsigned 64 bit 18 decimal fixed point number
/// @dev Minimum supported value for 18 decimal fixed point numbers
type UFixed64x18 is uint64;

/// @dev An unsigned 80 bit 18 decimal fixed point number
type UFixed80x18 is uint80;

/// @dev An unsigned 96 bit 18 decimal fixed point number
type UFixed96x18 is uint96;

/// @dev An unsigned 112 bit 18 decimal fixed point number
type UFixed112x18 is uint112;

/// @dev An unsigned 128 bit 18 decimal fixed point number
type UFixed128x18 is uint128;

/// @dev An unsigned 192 bit 18 decimal fixed point number
type UFixed192x18 is uint192;

/// @dev An unsigned 256 bit 4 decimal fixed point number
/// @dev Minimum supported value for 4 decimal fixed point numbers
type UFixed256x4 is uint256;

/// @dev An unsigned 16 bit 4 decimal fixed point number
type UFixed16x4 is uint16;

/// @dev An unsigned 24 bit 4 decimal fixed point number
type UFixed24x4 is uint24;

/// @dev An unsigned 32 bit 4 decimal fixed point number
type UFixed32x4 is uint32;

/// @dev An unsigned 64 bit 4 decimal fixed point number
type UFixed48x4 is uint48;

/// @dev An unsigned 64 bit 4 decimal fixed point number
type UFixed64x4 is uint64;

/// @dev An unsigned 80 bit 4 decimal fixed point number
type UFixed80x4 is uint80;

/// @dev An unsigned 96 bit 4 decimal fixed point number
type UFixed96x4 is uint96;

/// @dev An unsigned 128 bit 4 decimal fixed point number
type UFixed128x4 is uint128;

/// @dev An unsigned 128 bit 4 decimal fixed point number
type UFixed192x4 is uint192;

using FixedPointMath for UFixed64x18 global;
using FixedPointMath for UFixed80x18 global;
using FixedPointMath for UFixed96x18 global;
using FixedPointMath for UFixed112x18 global;
using FixedPointMath for UFixed128x18 global;
using FixedPointMath for UFixed192x18 global;
using FixedPointMath for UFixed256x18 global;

/// @title Library for fixed point math operations
/// @custom:coauthor ainmox (ainmox.eth)
library FixedPointMath {
    uint256 private constant MAX_UINT256 = 2**256-1;

    uint256 public constant X18_SCALING_FACTOR = 1e18;
    uint256 public constant X18_MULTIPLICATION_FACTOR = 1e19;
    uint256 public constant X18_DIVISION_FACTOR = 1e17;
    uint256 public constant X18_CEILING_FACTOR = 1e18 - 1;
    uint256 public constant X18_ROUNDING_FACTOR = 1e18 >> 1;

    /// @dev Converts an unsigned 256 bit integer into an unsigned 256 bit 18 decimal fixed point number
    /// @param integer The unsigned 256 bit integer to convert
    /// @return result The unsigned 256 bit 18 decimal fixed point number
    function intoUFixed256x18(uint256 integer) internal pure returns (UFixed256x18 result) {
        assembly {
            if mul(integer, gt(integer, div(MAX_UINT256, X18_SCALING_FACTOR))) {
                revert(0, 0)
            }
            result := mul(integer, X18_SCALING_FACTOR)
        }
    }

    /// @dev Converts an unsigned 64 bit integer into an unsigned 64 bit 18 decimal fixed point number
    /// @param value The unsigned 64 bit integer to convert
    /// @return result The unsigned 64 bit 18 decimal fixed point number
    function intoUFixed256x18(UFixed64x18 value) internal pure returns (UFixed256x18 result) {
        assembly {
            result := value
        }
    }

    /// @dev Converts an unsigned 80 bit 18 decimal fixed point number into an unsigned 256 bit 18 decimal fixed point number
    /// @param value The unsigned 80 bit integer to convert
    /// @return result The unsigned 256 bit 18 decimal fixed point number
    function intoUFixed256x18(UFixed80x18 value) internal pure returns (UFixed256x18 result) {
        assembly {
            result := value
        }
    }

    /// @dev Converts an unsigned 96 bit 18 decimal fixed point number into an unsigned 256 bit 18 decimal fixed point number
    /// @param value The unsigned 96 bit integer to convert
    /// @return result The unsigned 256 bit 18 decimal fixed point number
    function intoUFixed256x18(UFixed96x18 value) internal pure returns (UFixed256x18 result) {
        assembly {
            result := value
        }
    }

    /// @dev Converts an unsigned 112 bit 18 decimal fixed point number into an unsigned 256 bit 18 decimal fixed point number
    /// @param value The unsigned 112 bit integer to convert
    /// @return result The unsigned 256 bit 18 decimal fixed point number
    function intoUFixed256x18(UFixed112x18 value) internal pure returns (UFixed256x18 result) {
        assembly {
            result := value
        }
    }

    /// @dev Converts an unsigned 128 bit 18 decimal fixed point number into an unsigned 256 bit 18 decimal fixed point number
    /// @param value The unsigned 128 bit integer to convert
    /// @return result The unsigned 256 bit 18 decimal fixed point number
    function intoUFixed256x18(UFixed128x18 value) internal pure returns (UFixed256x18 result) {
        assembly {
            result := value
        }
    }

    /// @dev Converts an unsigned 192 bit 18 decimal fixed point number into an unsigned 256 bit 18 decimal fixed point number
    /// @param value The unsigned 192 bit integer to convert
    /// @return result The unsigned 256 bit 18 decimal fixed point number
    function intoUFixed256x18(UFixed192x18 value) internal pure returns (UFixed256x18 result) {
        assembly {
            result := value
        }
    }

    /// @dev Adds two unsigned 256 bit 18 decimal fixed point numbers
    /// @param x The first unsigned 256 bit 18 decimal fixed point number
    /// @param y The second unsigned 256 bit 18 decimal fixed point number
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function add(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        assembly {
            if gt(x, sub(MAX_UINT256, y)) {
                revert(0, 0)
            }
        }
        result = unsafeAdd(x, y);
    }

    /// @dev Subtracts two unsigned 256 bit 18 decimal fixed point numbers
    /// @param x The unsigned 256 bit 18 decimal fixed point number to subtract from
    /// @param y The unsigned 256 bit 18 decimal fixed point number to subtract
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function sub(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        assembly {
            if lt(x, y) {
                revert(0, 0)
            }
        }
        result = unsafeSub(x, y);
    }

    /// @dev Multiplies two unsigned 256 bit 18 decimal fixed point numbers
    /// @param x The first unsigned 256 bit 18 decimal fixed point number
    /// @param y The second unsigned 256 bit 18 decimal fixed point number
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function mul(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        result = UFixed256x18.wrap(mulDiv(
            UFixed256x18.unwrap(x),
            UFixed256x18.unwrap(y),
            X18_SCALING_FACTOR
        ));
    }

    /// @dev Divides two unsigned 256 bit 18 decimal fixed point numbers
    /// @param x The unsigned 256 bit 18 decimal fixed point number to divide
    /// @param y The unsigned 256 bit 18 decimal fixed point number to divide by
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function div(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        result = UFixed256x18.wrap(mulDiv(
            UFixed256x18.unwrap(x),
            X18_SCALING_FACTOR,
            UFixed256x18.unwrap(y)
        ));
    }

    /// @dev Adds two unsigned 256 bit 18 decimal fixed point numbers without checking for overflow
    /// @param x The first unsigned 256 bit 18 decimal fixed point number
    /// @param y The second unsigned 256 bit 18 decimal fixed point number
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function unsafeAdd(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        assembly {
            result := add(x, y)
        }
    }

    /// @dev Subtracts two unsigned 256 bit 18 decimal fixed point numbers without checking for underflow
    /// @param x The unsigned 256 bit 18 decimal fixed point number to subtract from
    /// @param y The unsigned 256 bit 18 decimal fixed point number to subtract
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function unsafeSub(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        assembly {
            result := sub(x, y)
        }
    }

    /// @dev Divides an unsigned 256 bit 18 decimal fixed point number by an unsigned 256 bit integer
    /// @param x The unsigned 256 bit 18 decimal fixed point number to divide
    /// @param y The unsigned 256 bit 18 integer to divide by
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function unsafeDiv(UFixed256x18 x, uint256 y) internal pure returns (UFixed256x18 result) {
        assembly {
            result := div(x, y)
        }
    }

    /// @dev Rounds up an unsigned 256 bit 18 decimal fixed point number to the smallest unsigned 256 bit integer
    ///      greater than or equal to the number
    /// @param value The unsigned 256 bit 18 decimal fixed point number to round up
    /// @return result The smallest unsigned integer greater than or equal to the number
    function ceil(UFixed256x18 value) internal pure returns (uint256 result) {
        assembly {
            if gt(value, sub(MAX_UINT256, X18_CEILING_FACTOR)) {
                revert(0, 0)
            }
            result := div(add(value, X18_CEILING_FACTOR), X18_SCALING_FACTOR)
        }
    }

    /// @dev Rounds down an unsigned 256 bit 18 decimal fixed point number to the largest unsigned 256 bit integer
    ///      less than or equal to the number
    /// @param value The unsigned 256 bit 18 decimal fixed point number to round down
    /// @return result The largest unsigned integer less than or equal to the number
    function floor(UFixed256x18 value) internal pure returns (uint256 result) {
        assembly {
            result := div(value, X18_SCALING_FACTOR)
        }
    }

    /// @dev Rounds an unsigned 256 bit 18 decimal fixed point number to the nearest unsigned 256 bit integer
    /// @param value The unsigned 256 bit 18 decimal fixed point number to round
    /// @return result The nearest unsigned integer
    function round(UFixed256x18 value) internal pure returns (uint256 result) {
        assembly {
            if gt(value, sub(MAX_UINT256, X18_ROUNDING_FACTOR)) {
                revert(0, 0)
            }
            result := div(add(value, X18_ROUNDING_FACTOR), X18_SCALING_FACTOR)
        }
    }

    /// @dev Truncates the fractional component of an unsigned 256 bit 18 decimal fixed point number
    /// @dev Alias for `floor`
    /// @param value The unsigned 256 bit 18 decimal fixed point number to truncate
    /// @return result The integer component of the number
    function truncate(UFixed256x18 value) internal pure returns (uint256 result) {
        result = floor(value);
    }

    /// @dev Compares two unsigned 256 bit 18 decimal fixed point numbers
    /// @param x The first unsigned 256 bit 18 decimal fixed point number
    /// @param y The second unsigned 256 bit 18 decimal fixed point number
    /// @return result `-1` if `x < y`, `0` if `x == y`, or `1` if `x > y`
    function cmp(UFixed256x18 x, UFixed256x18 y) internal pure returns (int256 result) {
        assembly {
            result := or(mul(lt(x, y), MAX_UINT256), gt(x, y))
        }
    }

    /// @dev Unwraps an unsigned 256 bit 18 decimal fixed point number into an unsigned 256 bit integer
    /// @dev Alias for `UFixed256x18.unwrap`
    /// @param value The unsigned 256 bit 18 decimal fixed point number to unwrap
    /// @param result The unsigned 256 bit integer
    function unwrap(UFixed256x18 value) internal pure returns (uint256 result) {
        result = UFixed256x18.unwrap(value);
    }

    /// @dev Multiplies two unsigned 256 bit 18 decimal fixed point numbers and then divides them by an unsigned 256 bit
    ///      integer while checking for overflow
    /// @dev Taken from Remco Bloemen, see https://xn--2-umb.com/21/muldiv/. Licensed under MIT.
    /// @param a The first unsigned 256 bit 18 decimal fixed point number
    /// @param b The second unsigned 256 bit 18 decimal fixed point number
    /// @param denominator The unsigned 256 bit integer to divide by
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function mulDiv(uint256 a, uint256 b, uint256 denominator) private pure returns (uint256 result) {
        // Handle division by zero
        require(denominator > 0);

        // 512-bit multiply [prod1 prod0] = a * b
        // Compute the product mod 2**256 and mod 2**256 - 1
        // then use the Chinese Remainder Theorem to reconstruct
        // the 512 bit result. The result is stored in two 256
        // variables such that product = prod1 * 2**256 + prod0
        uint256 prod0; // Least significant 256 bits of the product
        uint256 prod1; // Most significant 256 bits of the product
        assembly {
            let mm := mulmod(a, b, MAX_UINT256)
            prod0 := mul(a, b)
            prod1 := sub(sub(mm, prod0), lt(mm, prod0))
        }

        // Short circuit 256 by 256 division
        // This saves gas when a * b is small, at the cost of making the
        // large case a bit more expensive. Depending on your use case you
        // may want to remove this short circuit and always go through the
        // 512 bit path.
        if (prod1 == 0) {
            assembly {
                result := div(prod0, denominator)
            }
            return result;
        }

        ///////////////////////////////////////////////
        // 512 by 256 division.
        ///////////////////////////////////////////////

        // Handle overflow, the result must be < 2**256
        require(prod1 < denominator);

        // Make division exact by subtracting the remainder from [prod1 prod0]
        // Compute remainder using mulmod
        // Note mulmod(_, _, 0) == 0
        uint256 remainder;
        assembly {
            remainder := mulmod(a, b, denominator)
        }
        // Subtract 256 bit number from 512 bit number
        assembly {
            prod1 := sub(prod1, gt(remainder, prod0))
            prod0 := sub(prod0, remainder)
        }

        // Factor powers of two out of denominator
        // Compute largest power of two divisor of denominator.
        // Always >= 1 unless denominator is zero, then twos is zero.
        uint256 twos = MAX_UINT256 - (denominator - 1) & denominator;
        // Divide denominator by power of two
        assembly {
            denominator := div(denominator, twos)
        }

        // Divide [prod1 prod0] by the factors of two
        assembly {
            prod0 := div(prod0, twos)
        }
        // Shift in bits from prod1 into prod0. For this we need
        // to flip `twos` such that it is 2**256 / twos.
        // If twos is zero, then it becomes one
        assembly {
            twos := add(div(sub(0, twos), twos), 1)
        }
        prod0 |= prod1 * twos;

        // Invert denominator mod 2**256
        // Now that denominator is an odd number, it has an inverse
        // modulo 2**256 such that denominator * inv = 1 mod 2**256.
        // Compute the inverse by starting with a seed that is correct
        // correct for four bits. That is, denominator * inv = 1 mod 2**4
        // If denominator is zero the inverse starts with 2
        uint256 inv = 3 * denominator ^ 2;
        // Now use Newton-Raphson iteration to improve the precision.
        // Thanks to Hensel's lifting lemma, this also works in modular
        // arithmetic, doubling the correct bits in each step.
        inv *= 2 - denominator * inv; // inverse mod 2**8
        inv *= 2 - denominator * inv; // inverse mod 2**16
        inv *= 2 - denominator * inv; // inverse mod 2**32
        inv *= 2 - denominator * inv; // inverse mod 2**64
        inv *= 2 - denominator * inv; // inverse mod 2**128
        inv *= 2 - denominator * inv; // inverse mod 2**256
        // If denominator is zero, inv is now 128

        // Because the division is now exact we can divide by multiplying
        // with the modular inverse of denominator. This will give us the
        // correct result modulo 2**256. Since the precoditions guarantee
        // that the outcome is less than 2**256, this is the final result.
        // We don't need to compute the high bits of the result and prod1
        // is no longer required.
        result = prod0 * inv;
        return result;
    }
}