// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract malimaToken{

    // public variables here
    string public tokenName = 'MalimaToken';
    string public tokenAbbrev = 'MLT';
    uint public totalSupply = 0;
    
    // mapping variable here
    mapping(address => uint) public balance;

    // mint function
    function mint(address sender, uint _amount) public {
        require(_amount > 0 , "amount cannot be less than zero ");
        totalSupply += _amount;
        balance[sender] += _amount;
    }
    
    // burn function
    function burn(address _sender, uint _amount) public {
         if( _sender != msg.sender){
            revert("you are not the owner");
        }
        totalSupply -= _amount;
        balance[_sender] -= _amount;
    }
    // transfer function
    function transfer( address _recipient, uint _amount) public{
        require(msg.sender != _recipient,"you can not transfer to yourself ");
        assert(balance[msg.sender] >= _amount );
        balance[msg.sender] -= _amount;
        balance[_recipient] += _amount;
        //  assert(balance[msg.sender] + balance[_recipient] == balance[msg.sender] + _amount);

    }


}
