// @ts-ignore
import { ethers } from "hardhat";

async function main() {
  const Trial = await ethers.getContractFactory("Imaginations");
  //   const trial = await Trial.deploy();
  //   await trial.deployed();

  //   console.log("our address:", trial.address);
  const trial = await Trial.attach(
    "0x44166897A08D3144cb53865bF988CAf4515e6cF8"
  );
  const create = await trial.create("gbenga", 221660674129);
    const get = await trial.get(0);

  console.log("your Name", create);
     console.log("get your details", get);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
