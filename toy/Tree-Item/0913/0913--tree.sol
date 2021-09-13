// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

// import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/VRFConsumerBase.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * PLEASE DO NOT USE THIS CODE IN PRODUCTION.
 */
contract RandomNumberConsumer is VRFConsumerBase {
    
    bytes32 internal keyHash;
    uint256 internal fee;
    
    mapping(address => uint) public order;
    mapping(bytes32 => address) public ordernum;
    mapping(address => radper_chk) public randomResult_chk;
    
    uint256 public welshcorgi;
    
    struct radper_chk{
        uint requestNumber;
        bool chk;
    }

    
    /**
     * Constructor inherits VRFConsumerBase
     * 
     * Network: Kovan
     * Chainlink VRF Coordinator address: 0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9
     * LINK token address:                0xa36085F69e2889c224210F603D836748e7dC0088
     * Key Hash: 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4
     */
    constructor() 
        VRFConsumerBase(
            0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B, // VRF Coordinator
            0x01BE23585060835E02B77ef475b0Cc51aA1e0709  // LINK Token
        ) public
    {
        keyHash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
        fee = 0.1 * 10 ** 18; // 0.1 LINK (Varies by network)
    }

    /** 
     * Requests randomness 
     */
    function getRandomNumber() public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        require(randomResult_chk[msg.sender].chk == false);
        ordernum[requestRandomness(keyHash, fee)] = msg.sender;
        randomResult_chk[msg.sender].chk = true;
    }

    /**
     * Callback function used by VRF Coordinator
     */
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult_chk[ordernum[requestId]].requestNumber = (randomness % 50) + 1;
        randomResult_chk[ordernum[requestId]].chk = false;
    }
    
    function getmyRandomKey() public view returns(uint256){
       return randomResult_chk[msg.sender].requestNumber;
    }

    // function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract
}