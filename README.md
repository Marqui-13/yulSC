# MyContract - Yul Smart Contract

`MyContract` is a smart contract developed in Yul, the intermediate language for Ethereum. This contract demonstrates basic banking operations, including depositing, withdrawing, and checking the balance of an account. It's designed to showcase the use of Yul for smart contract development and its interaction with the Ethereum Virtual Machine (EVM).

## Features

- Get Balance: Allows querying the balance of an account.
- Deposit Funds: Enables depositing funds into the contract.
- Withdraw Funds: Allows withdrawing funds from the contract.

## Contract Interface

The contract defines the following functions:

- `getBalance(address account) public view returns (uint256)`: Returns the balance of the specified account.
- `deposit() public payable`: Deposits funds into the contract.
- `withdraw(uint256 amount) public`: Withdraws the specified amount of funds from the contract.

## Yul Implementation

The contract logic is implemented in Yul within an `assembly` block, showcasing the use of low-level operations, storage manipulation, and event logging. Key aspects include:

- Storage slot management for account balances.
- Function selector handling for `getBalance`, `deposit`, and `withdraw`.
- Direct manipulation of EVM storage and call data.

## Deployment

To deploy `MyContract`, you will need:

- An Ethereum development environment like [Remix IDE](https://remix.ethereum.org/) or a local development setup with [Truffle](https://www.trufflesuite.com/) or [Hardhat](https://hardhat.org/).
- Sufficient Ethereum (ETH) for contract deployment gas fees.

### Using Remix IDE

1. Copy the contract code into a new file in Remix IDE.
2. Compile the contract using the Solidity compiler (select a compiler version that supports Yul).
3. Deploy the contract to your chosen network (Ethereum mainnet, testnet, or a local Ethereum VM).

## Interacting with the Contract

After deployment, interact with the contract through your chosen Ethereum development environment or through a frontend application using a web3 library like [web3.js](https://web3js.readthedocs.io/) or [ethers.js](https://docs.ethers.io/v5/).

- To deposit funds, send a transaction with ETH to the contract's `deposit` function.
- To withdraw funds, call the `withdraw` function with the desired amount.
- To *get the balance, call the `getBalance` function with the account address.

## Testing

The contract can be tested using [Jest](https://jestjs.io/) for JavaScript testing alongside Ethereum testing frameworks such as [Waffle](https://getwaffle.io/) or [Hardhat](https://hardhat.org/tutorial/testing-contracts.html).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## Acknowledgments

- Ethereum community for providing comprehensive documentation and tools for smart contract development.
- The creators of Yul for offering an efficient way to write contracts closer to the EVM.