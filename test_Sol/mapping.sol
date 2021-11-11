pragma solidity 0.8.6;

contract mapping {

    mapping (address => uint) count;
    // mapping (address => mapping(uint => uint)) count;

    

    uint nonce;


    constructor () payable {
        nonce = _n;
    }

    function getCount() view public returns (uint) {
        return count[msg.sender];
    }



    function functionName() public () {

}


}     