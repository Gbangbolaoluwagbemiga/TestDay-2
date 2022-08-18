// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import '.ITest.sol';
import "./Token1.sol"
import "./Token2.sol"
// THE MAIN SWAPPING
contract Token_swap{
    ERC20_LNK public TL;
    ERC20_W3B public TW;
    address public ownerTL;
    address public ownerTW;
    uint public AmountTL;
    uint public AmountTW;

modifier SWAPPING(){
    require(msg.sender==ownerTL || msg.sender==ownerTW, "Not a participant");
    _;
}
    constructor(
    address _tl,
    address _tw,
    address _addrTL,
    address _addrTW,
    uint _amountTl,
    uint _amountTw
    ){

   TL = ERC20_LNK(_tl);
   TW = ERC20_W3B(_tw);
   ownerTL=_addrTL;
   ownerTW=_addrTW;
   AmountTL=_amountTl;
   AmountTW=_amountTw;
    }

    function swap() public SWAPPING{
      require(TL.approve(ownerTL, AmountTL), 'Token Allowance invalid') ;
      require(TW.approve(ownerTW, AmountTW), 'Token Allowance invalid') ;
    TransferTokenFrom(TW, ownerTL, ownerTW, AmountTW);
    TransferTokenTo(TL, ownerTW, ownerTL, AmountTL);
    }

    function TransferTokenFrom(ERC20_W3B tw,address sender, address recipient,uint amount) private {
bool senTW= tw.transferFrom(sender, recipient, amount);
require(senTW, "failed Transfer");
    }
    function TransferTokenTo(ERC20_LNK tl,address sender, address recipient,uint amount) private {
bool senTL= tl.transferFrom(sender, recipient, amount);
require(senTL, "failed Transfer");
    }
}









