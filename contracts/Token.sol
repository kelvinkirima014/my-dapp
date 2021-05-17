pragma solidity ^0.8.4;
//SPDX-License-Identifier: MIT

contract Token { 
    //string type variables to identify the token
    //'public modidfier makes a variable readable from outside the contract'
    string public name = "My Token";
    string public symbol = "FMT";

    uint256 public totalSupply = 100000000;

    //An address type variable is used to store ethereuum accounts
    address public owner;

    //A mapping is a key-value pair. Here we store each  acct balance
    //the address is the key and balances is the value
    mapping (address => uint) public balances;
     
     //contract initialization
     //the constructor is executed only once when the contract is created
    constructor(){
        //totalSupply is assigned to transaction sender,
        //which is the account that's deploying the contract.
        balances[msg.sender] = totalSupply;
        owner = msg.sender;

    }
    //a function transfer the tokens
    //the *external* modifier makes the function
    //*only* callable from outside the contract

    function transfer (address to, uint256 amount) external{
        //require checks if the argument has met certain conditions
        //if it evaluates to false, the transaction will revert
        require(balances[msg.sender] >= amount, 'Not enough tokens');
        //transfer the amount
        balances[msg.sender] -= amount; 
        balances[to] += amount;    
    }

    //Read only function to retreive the token balance of a given amount
    //The `view` modifier indicates it doesn't change the contract's state
    //which allows us to call it without executing  a transaction

    function balanceOf(address account) external view returns (uint256){
        return balances [account];
    }
 

}

