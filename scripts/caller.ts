// @ts-ignore
import { ethers } from "hardhat";

async function main() {
  const Multisig = await ethers.getContractFactory("mappings");
  //   const multisig = await Multisig.deploy();
  const multisig = await Multisig.attach(
    "0x582C758125F5bADc23B486a154Df184e7B461e98"
  );

  //   await multisig.deployed();

  //   console.log("our address:", multisig.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
