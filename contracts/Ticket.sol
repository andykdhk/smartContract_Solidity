// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ticket{

    uint256 tPrice=0.01 ether;
    mapping(address => uint256) public tHolders;
    address owner;

    constructor(){
        owner = msg.sender;
    }



    function withDraw() public {
        require(msg.sender == owner, "you are not the owner.");
        (bool success,) = payable(owner).call{value: address(this).balance}("");
        require(success);
    }

    function addT(address _user, uint256 _amount) internal{
       tHolders[_user] = tHolders[_user]+_amount;
    }

    function buyT(address _user, uint256 _amount) payable public{

        addT( _user,  _amount);
    }

function useT(address _user, uint256 _amount) public{

}

function subT(address _user, uint256 _amount) internal{

}
    
}