/**
 *Submitted for verification at BscScan.com on 2022-08-09
*/

// SPDX-License-Identifier: MIT

pragma solidity 0.8.5;

import "/mpc.sol";



contract period_lock{
    address private proxy_owner;
    address public  target_contract;

    
   constructor(address _target_contract) public  {
         proxy_owner = msg.sender; 
         target_contract = _target_contract;
 
  }

  function set_proxy_owner (address new_proxy_owner) public onlyProxyOwner {
     proxy_owner = new_proxy_owner;
  }

   function set_target_contract (address new_target) public onlyProxyOwner {
     target_contract = new_target;
  }

    function proxy_transfer
    (address recipient, uint256 amount) public payable  onlyProxyOwner
    {
        MPC2(target_contract).transfer(recipient, amount);
    }

    function transferOwnership2 (address newOwner) public virtual onlyProxyOwner
    {
         MPC2(target_contract).transferOwnership(newOwner);
    }

       function proxy_multi_lock (uint256 times, uint256 total_amount, uint256 start_release_time, uint256 interval, address multi_lock_address) public virtual onlyProxyOwner
    {
        uint256 once_lock_amount = total_amount/times;
         for (uint256 i = 0; i < times; i++) {
             uint256 next_release_time = start_release_time + (interval*i);
             MPC2(target_contract).lock(multi_lock_address, once_lock_amount,next_release_time);   
            }
        
       
    }


       function proxy_multi_lock_array (uint256 times, uint256 total_amount, uint256 start_release_time, uint256 interval, address [] memory multi_lock_address_array) public virtual onlyProxyOwner
    {
        uint256 once_lock_amount = total_amount/times;
         {for (uint256 i=0; i < multi_lock_address_array.length; i++)
             for (uint256 j = 0; j < times; j++) {
             uint256 next_release_time = start_release_time + (interval*j);
             MPC2(target_contract).lock(multi_lock_address_array[i], once_lock_amount,next_release_time);   
            }
         }
       
    }

     modifier onlyProxyOwner() {
        require(proxy_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

}

