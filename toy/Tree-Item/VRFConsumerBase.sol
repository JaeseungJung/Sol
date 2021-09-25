// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/JaeseungJung/Sol/blob/main/toy/Tree-Item/VRFRequestIDBase.sol";
import "https://github.com/JaeseungJung/Sol/blob/main/toy/Tree-Item/LinkTokenInterface.sol";


abstract contract VRFConsumerBase is VRFRequestIDBase {
  
  function fulfillRandomness(bytes32 requestId, uint256 randomness) internal virtual;

 
  uint256 private constant USER_SEED_PLACEHOLDER = 0;

  
  function requestRandomness(bytes32 _keyHash, uint256 _fee) internal returns (bytes32 requestId) {
    LINK.transferAndCall(vrfCoordinator, _fee, abi.encode(_keyHash, USER_SEED_PLACEHOLDER));
    
    uint256 vRFSeed = makeVRFInputSeed(_keyHash, USER_SEED_PLACEHOLDER, address(this), nonces[_keyHash]);
  
    nonces[_keyHash] = nonces[_keyHash] + 1;
    return makeRequestId(_keyHash, vRFSeed);
  }

  LinkTokenInterface internal immutable LINK;
  address private immutable vrfCoordinator;

   mapping(bytes32 => uint256)
    private nonces;

  
  constructor(address _vrfCoordinator, address _link) {
    vrfCoordinator = _vrfCoordinator;
    LINK = LinkTokenInterface(_link);
  }

  
  function rawFulfillRandomness(bytes32 requestId, uint256 randomness) external {
    require(msg.sender == vrfCoordinator, "Only VRFCoordinator can fulfill");
    fulfillRandomness(requestId, randomness);
  }
}