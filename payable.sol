pragma solidity 0.5.0;

contract Test {
  address owner;
       
   constructor() public payable {
       owner = msg.sender;
       
       
   }
   
   function withdraw() public {
      require(msg.sender == owner);
       msg.sender.transfer(address(this).balance);
   }
}





