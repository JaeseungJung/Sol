// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract D_Research is ERC1155 {


    address public owner;
    uint256 private constant ticket = 1;
    uint private next_Nft_Id = 2;
    
    mapping(address => uint) private isAdmin;
    mapping(uint => r_Info) private research_Info;
    mapping(address => vc_Uri) private user_To_Vc;
    mapping(uint => uint) private goods_price;

   struct r_Info{
        uint eth_Reward;
        uint nft_Reward;
        mapping(address => uint) is_Applied;
    }

    struct vc_Uri {
        uint is_Member;
        string vc1;
        string vc2;
        string vc3;
    }


     modifier onlyAdmin () {
        require(isAdmin[msg.sender] == 1);
        _;
    }

     modifier onlyMember () {
        uint is_Member = user_To_Vc[msg.sender].is_Member;
        require(is_Member == 1, "no vc data");
        _;
    }

    

    function create_Research(uint _r_Id, uint _eth_Reward, uint _nft_Reward) public onlyAdmin  { 
        research_Info[_r_Id].eth_Reward = _eth_Reward;
        research_Info[_r_Id].nft_Reward = _nft_Reward;
   }

    function edit_Research(uint _r_Id, uint _eth_Reward, uint _nft_Reward) public onlyAdmin  { 
        research_Info[_r_Id].eth_Reward = _eth_Reward;
        research_Info[_r_Id].nft_Reward = _nft_Reward;
   }

     function apply_Research(uint _r_Id) public  { 
        research_Info[_r_Id].is_Applied[msg.sender] = 1;
   }

   function VC_Create(uint _vc_Id, string memory _uri) public { 
        user_To_Vc[msg.sender].is_Member = 1;

        if (_vc_Id == 1) {
        user_To_Vc[msg.sender].vc1 = _uri;
        } else if (_vc_Id == 2) {
        user_To_Vc[msg.sender].vc2 = _uri;
        } else if (_vc_Id == 3) {
        user_To_Vc[msg.sender].vc3 = _uri;
        }
   }

   function VC_Delete() public onlyMember { 
        user_To_Vc[msg.sender].vc1 = "";
        user_To_Vc[msg.sender].vc2 = "";
        user_To_Vc[msg.sender].vc3 = "";
   }


    function Get_Reward(uint _r_Id) public onlyMember { 
        uint isApplied = research_Info[_r_Id].is_Applied[msg.sender];
        require(isApplied == 1, "not applied to research");

        uint get_Eth_amount = research_Info[_r_Id].eth_Reward;
        payable(msg.sender).transfer(get_Eth_amount);

        uint get_Nft_Id = research_Info[_r_Id].nft_Reward;
        _safeTransferFrom(owner, msg.sender, get_Nft_Id, 1, "");
   }

    function set_Goods_Price(uint goods_id, uint price) public onlyAdmin { 
           goods_price[goods_id] = price;
   }

    function buy_Goods(uint goods_id) public onlyMember { 
        uint g_price = goods_price[goods_id];
        require(g_price != 0 , "price 0");
        _safeTransferFrom(msg.sender, owner, g_price, 1, "");
        _safeTransferFrom(owner, msg.sender, 1, goods_id, "");
   }


    
    function setAdmin(address who) private onlyAdmin {
        isAdmin[who] = 1;
    }
    
    
   
    
    
    constructor() public ERC1155("https://raw.githubusercontent.com/JaeseungJung/Sol/main/toy/D-Research/{id}.json")
        
    {
        _mint(msg.sender, ticket, 10**7, "");
     
      
        owner = msg.sender;

        // admin address
        isAdmin[msg.sender] = 1;
   
    }

 
   function Nft_Mint(uint amount) private onlyAdmin  { 
    _mint(msg.sender, next_Nft_Id, amount, "");
    next_Nft_Id += 1;
   }
 
  
    function withdraw() private onlyAdmin {
        payable(msg.sender).transfer(address(this).balance);
    }

  

    receive() external payable {}

}