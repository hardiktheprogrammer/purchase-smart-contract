// SPDX-License-Identifier: MIT

pragma solidity >=0.8.13 <0.9.0;

contract PurchaseAggreement{
    uint public value;
    address payable public seller;
    address payable public buyer;
     
    enum State { Created, Locked, Release , Inactive}
    State public state;

    constructor() payable {
       seller  = payable(msg.sender);

    }
    // the Function cannot be called at the current  state.
    error   InvalidState();

    modifier inState(State state_) { // argument for modifier  
        if(state!= state_){
            revert  InvalidState();
        }
        _; 
    }

    function  confirmPurchase() external inState(State.Created) payable {
        require(msg.value == (2 *value),"Please send in 2x the purchase amount " );

        buyer = payable(msg.sender);
        state = State.Locked;//     



    }

    // conform recieve money function
    

}
