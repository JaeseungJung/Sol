pragma solidity 0.5.0;

contract Test {
  address owner;
  uint public bal;
       
   constructor() public payable {
       owner = msg.sender;
       bal = msg.value;
       
       
   }
   
   function withdraw() public {
      require(msg.sender == owner);
       msg.sender.transfer(address(this).balance);
   }
}





