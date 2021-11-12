pragma solidity ^0.5.6;

import "./klaytn-contracts/math/SafeMath.sol";
import "./interfaces/IInjeolmi.sol";
import "./interfaces/IInjeolmiPool.sol";

contract InjeolmiPrice {
    using SafeMath for uint256;

    IInjeolmi public ijm;
    IInjeolmiPool public pool;

    constructor(IInjeolmi _ijm, IInjeolmiPool _pool) public {
        ijm = _ijm;
        pool = _pool;
    }

    function price() external view returns (uint256) {
        return address(pool).balance.mul(1e8).div(ijm.balanceOf(address(pool)));
    }
}
