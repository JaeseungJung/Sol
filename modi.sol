pragma solidity 0.8.6;

contract contractName{
    function functionName() public () {

}

modifier onlyOwner () {
  require(msg.sender == owner);
  _;
}

 function withdraw() public onlyOwner {

        payable(msg.sender).transfer(address(this).balance);

    }

}     