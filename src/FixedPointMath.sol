pragma solidity >=0.8.8;

/// @dev An unsigned 256 bit 18 decimal fixed point number
/// @dev Commonly called WAD (https://github.com/makerdao/dss/blob/master/DEVELOPING.md#units)
type UFixed256x18 is uint256;

using {
    FixedPointMath.add,
    FixedPointMath.sub,
    FixedPointMath.mul,
    FixedPointMath.div,
    FixedPointMath.ceil,
    FixedPointMath.floor,
    FixedPointMath.round,
    FixedPointMath.unwrap
} for UFixed256x18 global;

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
        assembly {
            if mul(mul(x, y), gt(x, div(MAX_UINT256, y))) {
                revert(0, 0)
            }
        }
        result = unsafeMul(x, y);
    }

    /// @dev Divides two unsigned 256 bit 18 decimal fixed point numbers
    /// @param x The unsigned 256 bit 18 decimal fixed point number to divide
    /// @param y The unsigned 256 bit 18 decimal fixed point number to divide by
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function div(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        assembly {
            if or(iszero(y), mul(x, gt(x, div(MAX_UINT256, X18_DIVISION_FACTOR)))) {
                revert(0, 0)
            }
        }
        result = unsafeDiv(x, y);
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

    /// @dev Multiplies two unsigned 256 bit 18 decimal fixed point numbers without checking for overflow
    /// @param x The first unsigned 256 bit 18 decimal fixed point number
    /// @param y The second unsigned 256 bit 18 decimal fixed point number
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function unsafeMul(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        assembly {
            let z  := div(mul(x, y), X18_MULTIPLICATION_FACTOR)
            result := div(add(z, mod(z, 10)), 10)
        }
    }

    /// @dev Divides two unsigned 256 bit 18 decimal fixed point numbers without checking for division by zero or overflow
    /// @param x The unsigned 256 bit 18 decimal fixed point number to divide
    /// @param y The unsigned 256 bit 18 decimal fixed point number to divide by
    /// @return result The resulting unsigned 256 bit 18 decimal fixed point number
    function unsafeDiv(UFixed256x18 x, UFixed256x18 y) internal pure returns (UFixed256x18 result) {
        assembly {
            let z  := div(mul(x, X18_DIVISION_FACTOR), y)
            result := div(add(z, mod(z, 10)), 10)
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
    /// @param value The unsigned 256 bit 18 decimal fixed point number to truncate
    /// @return result The integer component of the number
    function truncate(UFixed256x18 value) internal pure returns (uint256 result) {
        result = floor(value);
    }

    /// @dev Unwraps an unsigned 256 bit 18 decimal fixed point number into an unsigned 256 bit integer
    /// @dev Alias for `UFixed256x18.unwrap`
    /// @param value The unsigned 256 bit 18 decimal fixed point number to unwrap
    /// @param result The unsigned 256 bit integer
    function unwrap(UFixed256x18 value) internal pure returns (uint256 result) {
        result = UFixed256x18.unwrap(value);
    }
}