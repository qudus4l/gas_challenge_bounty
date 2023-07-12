// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    // Implement Fixed-Size Array Technique Here
    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // Function to check for sum of array
    // No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }

    // Implement Remaining Gas Optimization Techniques Here
    // Sum of elements in the numbers array should equal 0
    // Optimize gas using Caching State Variable technique
    function optimizedFunction() public {
        // introduce unchecked block to skip certain checks
        unchecked {
            uint len = numbers.length; // Cache the length of the array

            uint i = 0; // Initialize loop variable
            // replace the for loop with a while loop to eliminate the overhead of the loop initialization and incrementation in the for loop.
            while (i < len) {
                numbers[i] = 0;
                i++; // Increment loop variable
            }
        }
    }
}
