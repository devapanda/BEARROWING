pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Metadata.sol";
import "./ITokenizer.sol";
import "./ILoanPool.sol";
import "./ICERC20.sol";
import "./LoanHolder.sol";
import "./UniversalERC20.sol";

contract FulcrumTokenization is ERC721, ERC721Metadata("Fulcrum Position Token", "iPosition"), ILoanPoolLoaner, ITokenizer {

    using UniversalERC20 for IERC20;

    modifier onlyTokenOwner(uint256 tokenId) {
        require(tokenId == 0 || ownerOf(tokenId) == msg.sender, "Wrong tokenId");
        _;
    }

    function enterMarkets(
        uint256 tokenId,
        address controller,
        address[] calldata cTokens
    )
        external
        onlyTokenOwner(tokenId)
        returns(bytes memory ret)
    {
        // LoanHolder holder = LoanHolder(address(tokenId));

        // ret = holder.perform(address(controller), 0, abi.encodeWithSelector(
        //     controller.enterMarkets.selector,
        //     cTokens
        // ));
    }

    function migrate(
        ILoanPool pool,
        IERC20 collateralToken,
        uint256 collateralAmount,
        IERC20 borrowedToken,
        IERC20 borrowedUnderlyingToken,
        uint256 borrowedAmount,
        address msgSender
    )
        public
        withLoan(
            pool,
            borrowedUnderlyingToken,
            borrowedAmount = ICERC20(address(borrowedToken)).borrowBalanceCurrent(msgSender)
        )
    {
        // LoanHolder holder = new LoanHolder();
        // _enterMarket(holder, borrowedToken.comptroller(), address(collateralToken), address(borrowedToken));

        // // Extract loan
        // borrowedUnderlyingToken.universalApprove(address(borrowedToken), borrowedAmount);
        // borrowedToken.repayBorrowBehalf(msgSender, borrowedAmount);
        // collateralToken.universalTransferFrom(msgSender, address(holder), collateralAmount);

        // // Create new loan
        // holder.perform(address(borrowedToken), 0, abi.encodeWithSelector(
        //     borrowedToken.borrow.selector,
        //     _getExpectedReturn()
        // ));

        // // Return loan
        // if (borrowedToken == ICERC20(0)) {
        //     holder.perform(address(msgSender), _getExpectedReturn(), "");
        // } else {
        //     holder.perform(address(borrowedUnderlyingToken), 0, abi.encodeWithSelector(
        //         borrowedUnderlyingToken.transfer.selector,
        //         address(pool),
        //         _getExpectedReturn()
        //     ));
        // }

        // // Transfer position
        // _mint(msgSender, uint256(address(holder)));
    }

    function mint(
        uint256 tokenId,
        IERC20 cToken,
        IERC20 token,
        uint256 amount
    )
        external
        onlyTokenOwner(tokenId)
        payable
    {
        // LoanHolder holder = LoanHolder(address(tokenId));
        // if (tokenId == 0) {
        //     holder = new LoanHolder();
        //     _enterMarket(holder, cToken.comptroller(), address(cToken), address(0));
        //     _mint(msg.sender, uint256(address(holder)));
        // }

        // token.universalTransferFrom(msg.sender, address(this), amount);
        // token.universalApprove(address(token), amount);
        // if (msg.value == 0) {
        //     cToken.mint(amount);
        // } else {
        //     (bool success,) = address(cToken).call.value(msg.value)(
        //         abi.encodeWithSignature("mint()")
        //     );
        //     require(success, "");
        // }
        // IERC20(address(cToken)).universalTransfer(
        //     address(holder),
        //     IERC20(address(cToken)).universalBalanceOf(address(this))
        // );
    }

    function redeem(
        uint256 tokenId,
        IERC20 cToken,
        IERC20 token,
        uint256 amount
    )
        external
        onlyTokenOwner(tokenId)
    {
        // LoanHolder holder = LoanHolder(address(tokenId));

        // holder.perform(address(cToken), 0, abi.encodeWithSelector(
        //     cToken.redeem.selector,
        //     amount
        // ));

        // if (token != IERC20(0)) {
        //     holder.perform(address(token), 0, abi.encodeWithSelector(
        //         token.transfer.selector,
        //         msg.sender,
        //         token.universalBalanceOf(address(holder))
        //     ));
        // } else {
        //     holder.perform(msg.sender, token.universalBalanceOf(address(holder)), "");
        // }
    }

    function borrow(
        uint256 tokenId,
        IERC20 cToken,
        IERC20 token,
        uint256 amount
    )
        external
        onlyTokenOwner(tokenId)
    {
        // require(ownerOf(tokenId) == msg.sender, "Wrong tokenId");
        // LoanHolder holder = LoanHolder(address(tokenId));

        // holder.perform(address(cToken), 0, abi.encodeWithSelector(
        //     cToken.borrow.selector,
        //     amount
        // ));

        // if (token != IERC20(0)) {
        //     holder.perform(address(token), 0, abi.encodeWithSelector(
        //         token.transfer.selector,
        //         msg.sender,
        //         token.universalBalanceOf(address(holder))
        //     ));
        // } else {
        //     holder.perform(msg.sender, token.universalBalanceOf(address(holder)), "");
        // }
    }

    function repay(
        uint256 tokenId,
        IERC20 cToken,
        IERC20 token,
        uint256 amount
    )
        public
        onlyTokenOwner(tokenId)
        payable
    {
        // LoanHolder holder = LoanHolder(address(tokenId));

        // uint256 borrowAmount = cToken.borrowBalanceCurrent(msg.sender);
        // if (amount > borrowAmount) {
        //     amount = borrowAmount;
        // }

        // token.universalTransferFrom(msg.sender, address(this), amount);
        // token.universalApprove(address(cToken), amount);
        // if (token != IERC20(0)) {
        //     cToken.repayBorrowBehalf(address(holder), amount);
        // } else {
        //     (bool success,) = address(cToken).call.value(msg.value)(
        //         abi.encodeWithSignature(
        //             "repayBorrowBehalf(address)",
        //             address(holder)
        //         )
        //     );
        //     require(success, "");
        // }
    }
}
