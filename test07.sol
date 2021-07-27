/**
 *Submitted for verification at Etherscan.io on 2021-07-27
*/

pragma solidity 0.8.6;

contract Test7 {
    
    constructor() payable {
        
    }
    
    function withdraw() public {
        require(address(this).balance >= 1 ether);
        payable(msg.sender).transfer(address(this).balance);
    } 
    
}


// test06을 이용하여 고의적으로 destruct하고 수신자를 스마트컨트랙트로한다.
// 이를 통해 해당 스마트컨트랙트의 이더리움의 양을 1보다 더 크게 만듦.
// 그 후 인출조건이 만족됐으므로 인출하면 끝.