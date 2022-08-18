// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

  interface IUniswapV2Router {
     function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline) 
     external returns (uint[] memory amounts);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

  }
  
// interface IWETH is IERC20 {
//     function deposit() external payable;

//     function withdraw(uint amount) external;
// }