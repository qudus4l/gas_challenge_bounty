const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Deploy Gas Challenge Contract", () => {
  let gas_contract;

  beforeEach(async () => {
    const gas_challenge_contract = await ethers.getContractFactory(
      "gasChallenge"
    );
    gas_contract = await gas_challenge_contract.deploy();
  });

  describe("Compute Gas", () => {
    it("Should return lower gas", async () => {
      await gas_contract.optimizedFunction(); // Call optimizedFunction to modify the array
      await gas_contract.notOptimizedFunction();
    });
  });

  describe("Check Sum Of Array", () => {
    it("Should return 0", async () => {
      await gas_contract.optimizedFunction(); // Call optimizedFunction to modify the array
      const sumOfArray = await gas_contract.getSumOfArray();
      expect(sumOfArray).to.equal(0);
    });
  });
});
