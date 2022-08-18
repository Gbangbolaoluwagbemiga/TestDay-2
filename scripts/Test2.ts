import { ethers } from "hardhat";

// 
async function main() {

  const BNBAddress = "0xB8c77482e45F1F44dE1745F52C74426C631bDD52";
  const MATICAddress = "0x6B175474E89094C44Da98b954EedeAC495271d0F";
  const UNIRouter = "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";
  const amountOut = 2000;

  const helpers = require("@nomicfoundation/hardhat-network-helpers");
  const BNBHolder = "0xf584f8728b874a6a5c7a8d4d387c9aae9172d621";
  await helpers.impersonateAccount(BNBHolder);
  const impersonatedSigner = await ethers.getSigner(BNBHolder);

  const BNB = await ethers.getContractAt(
    "IERC20",
    BNBAddress,

    impersonatedSigner
  );
  const MATIC = await ethers.getContractAt("IERC20", MATICAddress);
  const ROUTER = await ethers.getContractAt(
    "IUniswap",
    UNIRouter,
    impersonatedSigner
  );
  
  await BNB.approve(UNIRouter, amountOut);
  //   const BNBBal = await BNB.balanceOf(BNBHolder);
  //   const MATICBal = await MATIC.balanceOf(BNBHolder);

  //   console.log("balance before swap", BNBBal);

  await ROUTER.swapTokensForExactTokens(
    amountOut,
    0,
    [BNBAddress, MATICAddress],
    BNBHolder,
    1660674129
  );

  //   const BNBBalAfter = await BNB.balanceOf(BNBHolder);
  //   const MATICBalAfter = await MATIC.balanceOf(BNBHolder);

  //   console.log("balance after swap", BNBBalAfter, MATICBalAfter);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
