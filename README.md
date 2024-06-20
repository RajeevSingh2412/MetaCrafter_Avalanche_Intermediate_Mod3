# VEDIC TOKEN CONTRACT

This Solidity program is a simple "TOKEN CONTRACT" that represents the great Indian Scripture VEDIC as a token abbreviated by VED, along with functionalities for managing its total supply through mint and burn functions.

## DESCRIPTION

This program is a smart contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract represents a token named "VEDIC TOKEN" with the symbol "VED" and includes functionalities to mint (create) and burn (destroy) tokens, which affects the total supply using OpenZeppelin ERC20 implementation.
Additionally, it uses a mapping of addresses to balances, which enables the contract to keep track of the balance of VED tokens held by each address. The contract also allows for token transfers between addresses

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. Follow the steps below to get started:

    1. Go to the Remix Ethereum IDE.
    2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
    3. Save the file with a .sol extension (e.g., VedicToken.sol).
    4. Copy and paste the following code into the file:

```solidity
//SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VedicToken is ERC20{

    address public owner;
    uint256 private _totalSupply=0;

    constructor() ERC20("VEDIC TOKEN","VED"){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(owner==msg.sender,"Only Owner Can Access");
        _;
    }

    function mint(address _reciever, uint256 _amount) public onlyOwner {
        _mint(_reciever, _amount);
        _totalSupply+=_amount;
         emit Transfer(address(0), _reciever, _amount);
    }

    function burn(uint256 _amount) public {
        require(balanceOf(msg.sender)>=_amount,"Insufficient Balance");
        _burn(msg.sender,_amount);
        _totalSupply-=_amount;
        emit Transfer(msg.sender, address(0), _amount);
    }

    function transfer(address _reciever,uint256 _amount) public override returns (bool){
        require(msg.sender!=_reciever,"You Can't Transfer To Yourself");
        require(balanceOf(msg.sender)>=_amount,"Insufficient Balance");

        _transfer(_msgSender(),_reciever,_amount);
        return true;

    }

    function totalSupply() public view override onlyOwner returns (uint256){
        return _totalSupply;
    }

}
```

### Compiling the Code
    1. Click on the "Solidity Compiler" tab in the left-hand sidebar.
    2. Ensure the "Compiler" option is set to "0.8.25" (or another compatible version).
    3. Click on the "Compile VedaToken.sol" button.

### Deploying the Contract

    1. Go to the "Deploy & Run Transactions" tab in the left-hand sidebar.
    2. Select the "VedicToken" contract from the dropdown menu.
    3. Click on the "Deploy" button.

### Interacting with the Contract

Once the contract is deployed, you can interact with it by calling the mint and burn functions. You can also retrieve the values of the public variables owner, totalSupply, and check balances.



#### Mint Tokens:

    1. Select the mint function.
    2. Enter the address and the number of tokens to mint.
    3. Click on the "transact" button.
    
#### Burn Tokens:

    1. Select the burn function.
    2. Enter the address and the number of tokens to burn.
    3. Click on the "transact" button.

### Transfer Tokens:

    1. Select the transfer function.
    2. Enter the recipient address and the number of tokens to transfer.
    3. Click on the "transact" button.

#### Check Balances:

    1. Select the BalanceOf Function.
    2. Enter the address and click on "call" button.
    3. Balance of entered address will be visible.

#### View Token Details

    Retrieve the values of owner and totalSupply from the deployed contract.

## Authors

Rajeev Singh
[[@rajeevsingh]()](https://www.linkedin.com/in/rajeevsingh2412/)
