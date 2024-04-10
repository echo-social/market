#!/bin/sh

find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_NFT_FACTORY_ADDRESS_PLACEHOLDER,$NEXT_PUBLIC_NFT_FACTORY_ADDRESS,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_OPF_COMMUNITY_FEE_COLECTOR_PLACEHOLDER,$NEXT_PUBLIC_OPF_COMMUNITY_FEE_COLECTOR,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_FIXED_RATE_EXCHANGE_ADDRESS_PLACEHOLDER,$NEXT_PUBLIC_FIXED_RATE_EXCHANGE_ADDRESS,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_DISPENSER_ADDRESS_PLACEHOLDER,$NEXT_PUBLIC_DISPENSER_ADDRESS,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_OCEAN_TOKEN_ADDRESS_PLACEHOLDER,$NEXT_PUBLIC_OCEAN_TOKEN_ADDRESS,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_PROVIDER_URL_PLACEHOLDER,$NEXT_PUBLIC_PROVIDER_URL,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_SUBGRAPH_URI_PLACEHOLDER,$NEXT_PUBLIC_SUBGRAPH_URI,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_METADATACACHE_URI_PLACEHOLDER,$NEXT_PUBLIC_METADATACACHE_URI,g" {} \;
find /usr/share/nginx/html -type f -exec sed -i "s,NEXT_PUBLIC_RPC_URI_PLACEHOLDER,$NEXT_PUBLIC_RPC_URI,g" {} \;

exec "$@"
