//SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VedicToken is ERC20{

    address public owner;
    uint256 private _totalSupply=0;

    constructor() ERC20("VEDIC TOKEN","VED"){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(owner==msg.sender,"Only Owner Can Access");
        _;
    }

    function mint(address _reciever, uint256 _amount) public onlyOwner {
        _mint(_reciever, _amount);
        _totalSupply+=_amount;
         emit Transfer(address(0), _reciever, _amount);
    }

    function burn(uint256 _amount) public {
        require(balanceOf(msg.sender)>=_amount,"Insufficient Balance");
        _burn(msg.sender,_amount);
        _totalSupply-=_amount;
        emit Transfer(msg.sender, address(0), _amount);
    }

    function transfer(address _reciever,uint256 _amount) public override returns (bool){
        require(msg.sender!=_reciever,"You Can't Transfer To Yourself");
        require(balanceOf(msg.sender)>=_amount,"Insufficient Balance");

        _transfer(_msgSender(),_reciever,_amount);
        return true;

    }

    function totalSupply() public view override onlyOwner returns (uint256){
        return _totalSupply;
    }

}
