Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022076.outbound.protection.outlook.com [52.101.96.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4545F2FD7BE;
	Tue,  9 Dec 2025 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282698; cv=fail; b=ZNNM0No0jRfMMkqk2DqB8YQvSnv4FZW2rhISMrWwTfnfTlfGT9gEJwKEqpnAz/ViZEzjIEjU0fSKhzPJRPEtIK+BuUy9unC1jzyTftfvT2sbp5l75d6pPu+zQPEUqL1VC6OaG8pfOb868Ybbpf9hAeBygkEfH+V2qiSOjKop+70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282698; c=relaxed/simple;
	bh=UNUQcQKOLgxxnlq3d/OBBk1TWz9r0DsZGwQSSOUlggM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BLGpwYOaeuTvzErUoKMWqe1HN7wI8Bvi6tt+69/Jfz+bW9zWyZ2KHs33skohJNI/pU6ZbRI5+YX0HBceKaH8XEloWUhFamTKj2ZGjhUv6e5dJmaBFvUoM5AznDk6JJslbKqkVTmnWMD6EX4xxaUi0GsVkE2crI29+F3aMFD054o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=H5CLR+TW; arc=fail smtp.client-ip=52.101.96.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="H5CLR+TW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoMIbjSGksxTInbKSeWooaMpHvEXF8i7bEpQAbU34Vz+shpZNig8a4wQUCH+02qW65jwXwbcoBbGQ4Ml8JL8VM9GxIdxjLguIMGHf05pXi80IxaAiUF9r7X6jCp8myOYICliJRYur7zIO1QVaowlZVSAdHRAo1eg82Hept4BAaGR+h4tX7TRpFUv8VQpn5duCuBfixbz9lbnsxZ9W5TUHEaiCcYCmJ2s8xfUe95a7/DKvKJmKH1/HXBsX41JNlXK3PKfxTm7Ozy7hC09374PS2Mc38W0aaW3MU99ZKZPU7zXa9OiWeOgw/NGm78+lAWwjZh3QopeumpNF4Bkl5mQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB0UlYrWPYxUPYRqzl+Fes9a2TWm8dfIlrFlcMJJlVI=;
 b=hq04fBb2sDkQa5/PFqj0sc/KJwGf2qkyXSAnRenaPFKLrJu4RwBaj8pmsSXLxA76FJQc+a00aCiXyEs9P2byLXNNjrcm3kfnLyRk9In2fswmKoBqgzygePnmE0b1OFsiqXgLD8uAy/36XKr8bo7ZiWbE/Z5v39Lu9BE3ccFrOsGdM2ogNqTWplSFQd1Y9rI5k4CHAnHugiVCOvpjmV6mq8m6xZbNhbPCLqYscsttbUHvP4wZxGQ4R12Uq4wAa2LGinCcoNRVvEuJb9VJL2zBEEh+MUE/Hveccwb5Wm3SyltWgNeBHpTv3w4vLl4/oZZefLXQhIcBCwhUH6Poy3yilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB0UlYrWPYxUPYRqzl+Fes9a2TWm8dfIlrFlcMJJlVI=;
 b=H5CLR+TW61kmfuQ+lIzfWi50BsElJjPcXOdr0Ebziac2zzF0akwqxKkqACSeLGuIqUQYIk/KVUSOyBciFAD0ImcpzsGipg+X7Wr5YAG0hgP+ZdjowR4oCEi9p7jjOJHeu5U4l26oh+60WA+VhAE2h3EGIzNk+PLUMXf9/1ASiv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB2696.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 12:18:07 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 12:18:07 +0000
Date: Tue, 9 Dec 2025 12:18:05 +0000
From: Gary Guo <gary@garyguo.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Eliot Courtney
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
Message-ID: <20251209121805.5ad7b857.gary@garyguo.net>
In-Reply-To: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
References: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0310.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::9) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB2696:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b0d0e6-67ff-4fda-db8e-08de371d02b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ced4wcLD1z1lSzk45KFwY/oMmap2btOmzSVfjfqoJ8OWpP2alMdnSgi3L/LD?=
 =?us-ascii?Q?nqqmKNCYyJpL1/qBQC0DTU1M0w+vfj70P2JApDVKrtcqid3wtPbYQAGRM7y8?=
 =?us-ascii?Q?7EYC1iPC55SRRhbx/KDtSA7nrEbRE1lzSzkhnw+2u6O7yIBPMQ23jld0ejqz?=
 =?us-ascii?Q?YXsKjpKSuQjwXivopsx2vTz4MiQ5adFZ2PuquBWkhFfv5WI0yZZHhMZbzuA+?=
 =?us-ascii?Q?NhELgrZIgCNY1z/GVBWxkddtgGQ7kKxi9lVWneUh35rdyf6Gd0blxqNCkAKw?=
 =?us-ascii?Q?WQ2CF83P0BckjDqvVfjXedL2qnxjnmnXHoVZJSUD6T3HtWLA33uKZL+DJlSn?=
 =?us-ascii?Q?1A9ZNJacmqS/1ffRL6FAuxEw6kNsjqJ8wZDmopLFyM1W+K0zpieoQJvR7XB+?=
 =?us-ascii?Q?S06jcWR1FOmQXt4/vNRxAYMYd/p1TVL/XIKr62c+mjGrDAhAaK2FHCJ0E9rL?=
 =?us-ascii?Q?f0oGsJLMZQF069zRfcXuKGtCMiVxBZrh/dgHPxkodT0bZFu7FFg36L5/gk3K?=
 =?us-ascii?Q?kAEZTKd2xDGKjY3w1Yz6hmefqivuG7R2erM/L08Ufonz2suiDfeLOdx8MHuS?=
 =?us-ascii?Q?HZU7ldaqdwA3q2XJ7rXkwBNlkG85JIK4pT22wV6bigRctyfy94lQi8WNnY5r?=
 =?us-ascii?Q?3KU550wR0hirT+Pssp72m+H7sxnChlcgXB58YLmBUlbDMy4iwABbMsBgBaoC?=
 =?us-ascii?Q?ngVETfUV7rl/760sHcsdpUq2byMC0zBLSwTvaSKkc9o+JoLVNlLzmS6A3Gsa?=
 =?us-ascii?Q?skdNJA/42xO+W5005f9OU8bUi9WTVORn/Ey/92FQAdbGWkRiF7/mrugr/hk2?=
 =?us-ascii?Q?oZSaC6hkmghpAn0oco72f7jjKONrDYUa8IfH+33XJa1j/3tdojmDpj6Z+pwE?=
 =?us-ascii?Q?VC35WkxA6GhRlFKjJPX9JJ2vRUvflvOBvA4520lYFKbo3LZqfc66TvAamA9Y?=
 =?us-ascii?Q?TNFkbpot0VOOmPMgwSR4lbusJbIvsYxtrCls/vlPik2ekVy0I71ynLOogZpt?=
 =?us-ascii?Q?hkIDROjdvwtUauHsamev7ygLAbG//oRPOdAY3pnqO3wMnQpvwWqBg62Ochch?=
 =?us-ascii?Q?maE60HN7oZR7cRc7kAvPj1NPrJ1Y5dI3xoj2UthYKS1cqc47M+aN7PWO6uHB?=
 =?us-ascii?Q?sezWx9tBBzLW7c5uvugSXQq1oLxv0kid4IhZ3MiYPnFcRRP1T7P0LB2jTzby?=
 =?us-ascii?Q?+axF7NJ8caOfQFv7RO+yG1ZyB7dYUgEHVWbZME0vk/B0/4yoXflnuHfCzuaU?=
 =?us-ascii?Q?wFSHbJMJl5+nnzW0/gihGwJWvsZc//Lbi14RVhUtGt3R+EwpIR6sp6ktu9ZS?=
 =?us-ascii?Q?wg5RYAf7iLinCDRGMEbxXzeX8ie6ggZtg9YdleeGDHgQ5Q4TGGW9j9JQTcDR?=
 =?us-ascii?Q?2splzu18Pa+wJz7d14pErgpV2FdlcQg5IjNG3Ur1w4V+TT/rZsutCBRsoSwA?=
 =?us-ascii?Q?zztc+lm522HgOsvkybL/2qhk1imOOfxD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DnRK501v9bJF2rTDhZ1WTlrNCy4ekt8QJVM/I2aQVNvNR/Ebxz4JipPEqbDe?=
 =?us-ascii?Q?GID8GtrJHNXLigNrYAYtcKSOnruyBtVBlFAA/Vn1vmUxNaGRl6QDOp9qyQ+i?=
 =?us-ascii?Q?O3rJrdKB2JFN+abgfVBSlgxHN1t7AJQZsYcZXs/Vx57H7EC9HSLV0H7q+WFg?=
 =?us-ascii?Q?GUC1zqJCKNiCygwSYz2QSlF02QG5i9qmgUDF+dQdjvfP0DsBZ8YTsIeHMMQP?=
 =?us-ascii?Q?UkfU6Uo+A376YQYBeU1MwWiLjgQwCQJ9S9ZReicqDy2Yn88NeN1la3cSa7CW?=
 =?us-ascii?Q?X3wr7NzbtAgJtK3oelwcLdVKTKlB1vouteJwrmT2t4TnZE3IICSDa75fUAII?=
 =?us-ascii?Q?576FMC7/8DLGH/37s5cvYJFCJTmO1Q8tWHCc0RDRIgm0hrQeoTyWZJbQREcR?=
 =?us-ascii?Q?d1YwhAm++m4czzxjIOi4HtmSYxdmc72wPlAppjlr3QoBlAWLXQ5rVfjQTSNm?=
 =?us-ascii?Q?1Lx/2b4yy5ZKaq5yQdtWbM9BxkET9x0U6Fg/63CBjqoZEsvZAViCXD3xVhC4?=
 =?us-ascii?Q?4pXjlBpzrgHS6ib3VHqcxfQ++EiggUNsoGQs8F4K9T8sx8nFbJa7XAxtVMQ+?=
 =?us-ascii?Q?/TkhXp1xhtRt3s6JuwD5RCDcacwYTwkfu3BzZUKT412Zudnm5hHr/fbbYiPI?=
 =?us-ascii?Q?vc8zA0FlBYseQeG9jQC64d5Lp2FwQtzUxnD2t3gNbSnLoduq6egoiuwysFm2?=
 =?us-ascii?Q?SUfHYZdwbqjM6io6jh4gKPGmQxLzBnPlZyxlyQHVmWxD5GUQZTJMw21K82ox?=
 =?us-ascii?Q?ne2LYoGWAVwL50DL8dX/AIJQHi0Uf8d6buwK8Lk7fhVwuSyjEfuUZSRd8ZTq?=
 =?us-ascii?Q?XbGkHrSWoXm7N1ZWTb7XCutM3xDUSKLHTOMV9ADEtyl7/RnPuAXuhV21TwGD?=
 =?us-ascii?Q?31k1Ev8ejNyqA4ZZOGTb8i1u58966P9wWqQeGImnNEu40/6mDf2JGoGdEZqN?=
 =?us-ascii?Q?E7O20rAdLr6u4tIS0whE/pFYx71YUdfw4reUPEt2BNsZ4E00flKSVoRkfW+V?=
 =?us-ascii?Q?tssfu5ExOi2v83d64sOq+h65wO2o8sakYBTM01aRD8Q+YP7Fu8mfhKKUI765?=
 =?us-ascii?Q?WKw0mkF3irUEXmQSB/XwjcKpVYITzQCQzc3w8+eADUJLjdzJfN7oGp6IMRay?=
 =?us-ascii?Q?1IOMtzSjTP8/9MH0KLyYrBJK/Fr5ibrp5vEUkFN08g0XFM4upaoyK0DGXCEU?=
 =?us-ascii?Q?Fiul5thZhuiUjLUBp47tWlEE/dFszWGG5H0M8z6R3DkgsdeAroTbJZaPmzZW?=
 =?us-ascii?Q?sshtowc53vYu3e3Dordb5I9QUKa4ELbFL+iYEUFrLi0dvVjFWxS2pZuoiV01?=
 =?us-ascii?Q?TB3kXzFLG6ML18b4B1hlM3pDfPVZLC+K1lqi+ouC5zUyNxyJAP2ctmGvlM/E?=
 =?us-ascii?Q?kO46VASZdiKv781xkWokSZQIgfijwqjN7QIX8m4ChXqtoZs4EWaYVEKEMSdh?=
 =?us-ascii?Q?ABry64L7lORwf06N+rHtsga6Wc8JZeqyO/k1rCDgk9qIrz4+UDgKkAB6AlNq?=
 =?us-ascii?Q?zWJN09IGXmfHpogUb1K3cJCpAPuDqz+nP5v8N8nHDgKIHWmVWykcO+Htox/i?=
 =?us-ascii?Q?BJzXtcH/oHJG4dyytMCY6wbeQv2rZcm1QhRz7rfTM9Xu2v6rtS5hdlQtdQb0?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b0d0e6-67ff-4fda-db8e-08de371d02b8
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:18:07.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1SCPuk/7HlpUZN3ckaxKeyhfrdxVCaCrN+r3K/RDKnSmDoCaxeptBZjZFGlBQ7PNmSdZQDfZeOhlZaYu1SGSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2696

On Tue, 09 Dec 2025 11:57:58 +0900
Alexandre Courbot <acourbot@nvidia.com> wrote:

> This is useful in Nova's GSP message handling, as some messages are
> empty and we currently need to explicitly use an empty structure for
> them.
> 
> If accepted, I would like to merge it through `drm-rust-next` so Nova
> code can start using this feature quickly.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3:
> - Use better safety statement. (thanks Gary!)
> - Also add `PhantomData`. (thanks Gary!)
> - Link to v2: https://patch.msgid.link/20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com
> 
> Changes in v2:
> - Make use of new feature in Nova.
> - Link to v1: https://patch.msgid.link/20251208-transmute_unit-v1-1-680c7386b5d9@nvidia.com
> 
> ---
> Alexandre Courbot (2):
>       rust: transmute: implement FromBytes and AsBytes for inhabited ZSTs
>       gpu: nova-core: gsp: use () as message type for GspInitDone message
> 
>  drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
>  rust/kernel/transmute.rs              | 8 ++++++++
>  2 files changed, 11 insertions(+), 3 deletions(-)
> ---
> base-commit: ba65a4e7120a616d9c592750d9147f6dcafedffa
> change-id: 20251208-transmute_unit-78ab58ba9e6e
> 
> Best regards,

