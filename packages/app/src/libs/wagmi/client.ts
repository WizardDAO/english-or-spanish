import { injected, walletConnect } from '@wagmi/connectors';
import { createConfig, getAccount, getPublicClient, http, reconnect } from '@wagmi/core';
import type { Chain } from 'viem';

import { PUBLIC_WALLETCONNECT_PROJECT_ID } from '$env/static/public';
import { base } from 'viem/chains';
import { createWeb3Modal, defaultWagmiConfig } from '@web3modal/wagmi';

const projectId = PUBLIC_WALLETCONNECT_PROJECT_ID;

const chains: [Chain, ...Chain[]] = [base];

export type ValidChainIds = number;

const metadata = {
  name: 'zkFlex',
  description: 'flex your assets',
  url: 'https://zkflex.xyz/',
  icons: ['https://zkflex.xyz/'],
};

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
  defaultChain: base,
  allowUnsupportedChain: true,
});

export function getCurrentAddressOrNull(): `0x${string}` | undefined {
  const { address } = getAccount(wagmiConfig);
  return address;
}
