pragma solidity >=0.5.0;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ERC20.sol";


interface BonusToken is ERC20 {
    address public admin;

    constructor() ERC20('Bonus Token', 'BTK') public {
        admin = msg.sender;
    }

    function setLiquidator(address _liquidator) external {
        require(msg.sender == admin, 'only admin');
        liquidator = _liquidator;
    }


    function mint(address to, uint amount) external  {
        require(msg.sender == liquidator, 'only liquidator');
        _mint(to, ammount);
    }

}
