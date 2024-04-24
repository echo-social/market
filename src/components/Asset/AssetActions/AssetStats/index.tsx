import { useAsset } from '@context/Asset'
import { useUserPreferences } from '@context/UserPreferences'
import Tooltip from '@shared/atoms/Tooltip'
import { formatNumber } from '@utils/numbers'
import React, { useEffect, useState } from 'react'
import { useAccount } from 'wagmi'
import styles from './index.module.css'

export default function AssetStats() {
  const { locale } = useUserPreferences()
  const { asset } = useAsset()
  const { address: accountId } = useAccount()

  return (
    <footer className={styles.stats}>
      {!asset?.stats || asset?.stats?.orders < 0 ? (
        <span className={styles.stat}>N/A</span>
      ) : asset?.stats?.orders === 0 ? (
        <span className={styles.stat}>No sales yet</span>
      ) : (
        <span className={styles.stat}>
          <span className={styles.number}>{asset.stats.orders}</span> sale
          {asset.stats.orders === 1 ? '' : 's'}
        </span>
      )}
    </footer>
  )
}
