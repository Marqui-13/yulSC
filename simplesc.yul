// SPDX-License-Identifier: MIT
pragma abicoder v2;

// Define the contract and its interface
contract MyContract {
    function getBalance(address account) public view returns (uint256);
    function deposit() public payable;
    function withdraw(uint256 amount) public;
}

// Define the contract implementation in Yul
assembly {
    // Define the storage slot for the contract balance
    let balanceSlot := 0

    // Define the function selector for `getBalance(address)`
    let getBalanceSelector := 0x12065fe0

    // Define the function selector for `deposit()`
    let depositSelector := 0xd0e30db0

    // Define the function selector for `withdraw(uint256)`
    let withdrawSelector := 0x3ccfd60b

    // Define the function to get the balance from storage
    function getBalance() public view {
        // Load the account argument from calldata
        calldatacopy(0, 0, calldatasize())
        let account := mload(0)

        // Load the balance from storage
        sload(balanceSlot)

        // Return the balance on the stack
        return(0, 32)
    }

    // Define the function to deposit funds into the contract
    function deposit() public payable {
        // Load the value argument from calldata
        calldatacopy(0, 0, calldatasize())
        let value := mload(0)

        // Add the value to the balance in storage
        sload(balanceSlot)
        add
        dup1
        sstore(balanceSlot)

        // Emit an event to log the deposit
        log1(0, value, 0)
    }

    // Define the function to withdraw funds from the contract
    function withdraw() public {
        // Load the amount argument from calldata
        calldatacopy(0, 0, calldatasize())
        let amount := mload(0)

        // Subtract the amount from the balance in storage
        sload(balanceSlot)
        amount
        sub
        sstore(balanceSlot)

        // Transfer the amount to the caller's address
        caller
        amount
        call
        pop

        // Emit an event to log the withdrawal
        log1(1, amount, 0)
    }

    // Define the contract entry point
    function main() public {
        // Load the function selector from calldata
        calldatacopy(0, 0, 4)
        let selector := mload(0)

        // Call the appropriate function based on the selector
        switch selector
        case getBalanceSelector {
            getBalance()
        }
        case depositSelector {
            deposit()
        }
        case withdrawSelector {
            withdraw()
        }
        default {
            // Throw an exception if an invalid function is called
            revert(0, 0)
        }
    }
}
