import { injected, walletConnect } from '@wagmi/connectors';
import { createConfig, getAccount, getPublicClient, http, reconnect } from '@wagmi/core';
import type { Chain } from 'viem';

import { PUBLIC_WALLETCONNECT_PROJECT_ID } from '$env/static/public';
import { base } from 'viem/chains';
import { createWeb3Modal, defaultWagmiConfig } from '@web3modal/wagmi';

const projectId = PUBLIC_WALLETCONNECT_PROJECT_ID;

export type ValidChainIds = number;

const metadata = {
  name: 'zkFlex',
  description: 'flex your assets',
  url: 'https://zkflex.xyz/',
  icons: ['https://zkflex.xyz/'],
};

import { defineChain } from 'viem/utils/chain/defineChain.js';

export const sepolia = /*#__PURE__*/ defineChain({
  id: 11155111,
  name: 'Sepolia',
  nativeCurrency: { name: 'Sepolia Ether', symbol: 'ETH', decimals: 18 },
  rpcUrls: {
    default: {
      http: ['https://rpc.sepolia.dev'],
    },
  },
  blockExplorers: {
    default: {
      name: 'Blockscout',
      url: 'https://eth-sepolia.blockscout.com/',
    },
  },
  contracts: {
    multicall3: {
      address: '0xca11bde05977b3631167028862be2a173976ca11',
      blockCreated: 5022,
    },
  },
});

const chains: [Chain, ...Chain[]] = [sepolia];

// export const wagmiConfig = defaultWagmiConfig({ projectId, chains, metadata, transports: { [hardhat.id]: transport } });
export const wagmiConfig = defaultWagmiConfig({
  projectId,
  chains,
  metadata,
  enableEIP6963: true,
  enableWalletConnect: true,
  enableInjected: true,
});

export const web3Modal = createWeb3Modal({
  wagmiConfig,
  projectId,
  themeMode: 'dark',
  themeVariables: {
    '--w3m-font-family': 'Comic Sans MS',
    '--w3m-color-mix-strength': 10,
    '--w3m-accent': '#1998FC',
    '--w3m-color-mix': '#FFFFFF',
  },
  defaultChain: sepolia,
  allowUnsupportedChain: true,
});

export function getCurrentAddressOrNull(): `0x${string}` | undefined {
  const { address } = getAccount(wagmiConfig);
  return address;
}
