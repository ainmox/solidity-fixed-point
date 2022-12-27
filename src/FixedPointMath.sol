pragma solidity >=0.8.8;

import {Math} from "solidity-commons/Math.sol";

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

/// @dev A signed 256 bit 18 decimal fixed point number
/// @dev Commonly called WAD (https://github.com/makerdao/dss/blob/master/DEVELOPING.md#units)
type Fixed256x18 is int256;

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

using FixedPointMath for Fixed256x18 global;

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
        result = UFixed256x18.wrap(Math.mulDiv(
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
        result = UFixed256x18.wrap(Math.mulDiv(
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

    /// @dev The natural exponentiation of a signed 256 bit 18 decimal fixed point number
    /// @param x The signed 256 bit 18 decimal exponent
    /// @return result The resulting signed 256 bit 18 decimal fixed point number
    function exp(Fixed256x18 x) internal pure returns (Fixed256x18 result) {
        result = Fixed256x18.wrap(exp(Fixed256x18.unwrap(x)));
    }

    /// @dev The natural exponentiation of a signed 256 bit 18 decimal fixed point number
    /// @dev Taken from Remco Bloemen, see https://xn--2-umb.com/22/exp-ln/. Licensed under MIT.
    /// @param x The 256 bit 18 decimal exponent
    /// @return result The resulting signed 256 bit 18 decimal fixed point number
    function exp(int256 x) private pure returns (int256 result) {
        unchecked {
            // When the result is < 0.5 we return zero. This happens when
            // x <= floor(log(0.5e18) * 1e18) ~ -42e18
            if (x <= -42139678854452767551) return 0;

            // When the result is > (2**255 - 1) / 1e18 we can not represent it as an
            // int. This happens when x >= floor(log((2**255 - 1) / 1e18) * 1e18) ~ 135.
            if (x >= 135305999368893231589) revert("EXP_OVERFLOW");

            // x is now in the range (-42, 136) * 1e18. Convert to (-42, 136) * 2**96
            // for more intermediate precision and a binary basis. This base conversion
            // is a multiplication by 1e18 / 2**96 = 5**18 / 2**78.
            x = (x << 78) / 5**18;

            // Reduce range of x to (-½ ln 2, ½ ln 2) * 2**96 by factoring out powers
            // of two such that exp(x) = exp(x') * 2**k, where k is an integer.
            // Solving this gives k = round(x / log(2)) and x' = x - k * log(2).
            int256 k = ((x << 96) / 54916777467707473351141471128 + 2**95) >> 96;
            x = x - k * 54916777467707473351141471128;

            // k is in the range [-61, 195].

            // Evaluate using a (6, 7)-term rational approximation.
            // p is made monic, we'll multiply by a scale factor later.
            int256 y = x + 1346386616545796478920950773328;
            y = ((y * x) >> 96) + 57155421227552351082224309758442;
            int256 p = y + x - 94201549194550492254356042504812;
            p = ((p * y) >> 96) + 28719021644029726153956944680412240;
            p = p * x + (4385272521454847904659076985693276 << 96);

            // We leave p in 2**192 basis so we don't need to scale it back up for the division.
            int256 q = x - 2855989394907223263936484059900;
            q = ((q * x) >> 96) + 50020603652535783019961831881945;
            q = ((q * x) >> 96) - 533845033583426703283633433725380;
            q = ((q * x) >> 96) + 3604857256930695427073651918091429;
            q = ((q * x) >> 96) - 14423608567350463180887372962807573;
            q = ((q * x) >> 96) + 26449188498355588339934803723976023;

            assembly {
                // Div in assembly because solidity adds a zero check despite the unchecked.
                // The q polynomial won't have zeros in the domain as all its roots are complex.
                // No scaling is necessary because p is already 2**96 too large.
                result := sdiv(p, q)
            }

            // result should be in the range (0.09, 0.25) * 2**96.

            // We now need to multiply result by:
            // * the scale factor s = ~6.031367120.
            // * the 2**k factor from the range reduction.
            // * the 1e18 / 2**96 factor for base conversion.
            // We do this all at once, with an intermediate result in 2**213
            // basis, so the final right shift is always by a positive amount.
            result = int256((uint256(result) * 3822833074963236453042738258902158003155416615667) >> uint256(195 - k));
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

    /// @dev Unwraps a signed 256 bit 18 decimal fixed point number into a signed 256 bit integer
    /// @dev Alias for `Fixed256x18.unwrap`
    /// @param value The signed 256 bit 18 decimal fixed point number to unwrap
    /// @param result The signed 256 bit integer
    function unwrap(Fixed256x18 value) internal pure returns (int256 result) {
        result = Fixed256x18.unwrap(value);
    }
}