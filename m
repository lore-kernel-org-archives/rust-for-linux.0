Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCFC49A3CA;
	Mon, 12 Oct 2026 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821549; cv=fail; b=Oj93uPDFTMeZ0OUPCLfAf48u89sIuk840o09MAnt4Bfnw1Pei2nJ19VJS9smIYfZwTqj5j8eowwdWYWmPXRC7/Y7ii9DTFv81zX0xUTYW79q9yrLolvug8avncMKAjr86tcqpi5jH4NDeJ3uft13PmCIitYHkuCWxy0SdlLgm8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821549; c=relaxed/simple;
	bh=Uv4uQ1ZlxW9xRKUQiLKNR+lQWNBKbzmn45j83rurtr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ABaLeILYsrA9NC5vpImOG0f4n3iPLjmaM6wE/0OB+KDq1nqoYKAyhLB2ydEBgqiK9JqP41NSUFQ4n1cATzqDoD0V7peBgfpFvX4FYKJsKo0fD+sMeNCUmD+Qt4ZVH9JfYePc/9JDwaovTHTQU+3PAct+ocfGd/Xn/dzMcrgPu2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O+f3DP1I; arc=fail smtp.client-ip=52.101.56.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O+f3DP1I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aw3zswUajVjM43hdYErrl73rVZpopG4azUfbNFf+fQeSkncsj6DqaqdhGGVy4e6y9vRLnEkbwC1zOZJYMEDgzMnPNXsd7GCsUnnoPYeLBCNbnekqJjsED4SPSLGAI9Utm39NLvwRNo5/4lteJ9uMyVHFk9PTDuKmFWN7ZB05bF7h7CqgmGepq1Ji27XkH+ppy2rDPJu1BxGMTsce39ROUq4SufW6rV4kBt9K/n+BDGTXE18nrwvif6DdwmXF6G/gpuZejdwLjbfpNTEgnKPP7K8qYwCRZXJtbItAHyawkbFYKC99b1+P8LVK62VJdn7Gknhlxc+HC5Fz0DrUGMa6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oea5Zvwu+xIBj+NjsM2vXJdhydOVW6ptgojX1uOoe5Y=;
 b=cz639zWqaU4Kz/TZJoMaVPEH9huMki3Owi61G3iiF7825M95/64gLm7X7M2x5MoHeAa1c2PMjVKqlcZQop2tD87eO8tmUdhxhsThqos97yTfXK2uZl4r+92t5CNraZLZQHXfyX4VXGuQPmNvrBy3c08jEoCK+XRk70oFc6mQmhqNS4tFbufEz6dw5j+vzGt2Qp/v4dzxJltWLjt9d08MQMdhQpg+e5Ox577qsRDS/4w5RexCkSPEY3kLbk516GrXEhcN4ZK6CL5RNj30VHBC3GS+zb+LG9X4hhK5+web5gAGul8Ae59HFcNeETEYtEcon7/P1AtH+PUy+km/J5Q3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oea5Zvwu+xIBj+NjsM2vXJdhydOVW6ptgojX1uOoe5Y=;
 b=O+f3DP1I5GrHqAip9bSv72sbuJSb6WnjM7QHrqc0ZO09iCj4OuPxYp+6uvsE4+xzXIpb6Qk1ZOdKnudINIX64p3bwLlfqg1RkNguSPDuhEd4JyXDRl67mXUzMmwcSYm8X3Yp84s6HT/px0DUb99bcvDNtzy+rz9sTdXTwDQjEruL0PcgAEmM/GdlxUwpKMOaONeKE9DR/H88O87SZkaVOkakbYzfjY4sA1Fgy/b0Fy0orD/cmIA+IcVCjmomXCNkuEDiYEzoXBOZbDRX1zUT4sAtbZXB4rUhszo0tB87uecMXud2+HkAwRW0DO8+hF+551xO4VHBLsy3/1GtP1Culw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 16:12:23 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 16:12:23 +0000
Date: Mon, 12 Oct 2026 12:12:21 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/3] rust: add a wrapper for the `nr_online_nodes` C
 function
Message-ID: <as0G5Sgm-mREu3RO@yury>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-cpu-helpers-v3-2-e968ce5ee613@kernel.org>
X-ClientProxiedBy: BN9PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:408:f7::30) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b2c3d2-23bf-4439-81ff-08df287b995b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10070799003|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	l0kadTVngKN2HbGhiZorpevmGMLUF2blA8OoMaIJJ6UxZ++/ptF1igVZ9wwY4ISaJ9l8Zk4c4pTMQtSLb8KESvjEGVImgLqtCdMyA4KIrheNImpDiOqOvRi+ABQsyX29JIOMbMFWAgbW0nSgjWIO06gjK5m3NtWaddB40kRZdeJ/w16j9RU7FUdpnGo74/kAOZ8jUZbNG3XSwgclJUmL2KQrZ6vjT+yGYzTQiCmW9N7F3Eu7i5yT47S9AZxjqMZlZVXItB/ap5DIzOybbnC/fC9BHP5q8pDA0P9th20iEXcTR71hgMPVTnwUChTQ+PrBVIUnONFR7aYfIjDfd1GcbLd71JobO6fU640d4SrPu8pOL5MuwGzMYvwgd58qNiGYzc6uKGh78eSItJZH7davsW0mVGJbXCGBX1Tc/10hjoKhYI7R0ubMm/W1W/ONjtUHrznvIOChgoxQ2dexlZa31IRO/bx8zq9tEuJ5Czwld4N+Y9fHxqapjegHR/3XT0aP8YNh5s9nt/ORKONBixITnaFh/vEBuJSRcRFs45yQo/gF7It+ZuPemFI9VB6vptxnVSft0AWU77VjgIU/LDJHo0HVflqC1qIU0HFdlhz4fhDxdrclrEDGu6NMK+45z9RN+b/OUi6ZGpenhN9k9vZ8/5XGaaNLZ92ybGdluyAYtzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10070799003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7iIY5j15BBkZljfn8OSZba4tOYSPEBzt0opdNzCyasx124R7J17VWObe2WiT?=
 =?us-ascii?Q?6LQ1VX65h8+DqAmAAhWvs4pTzFgBx8//dw9JMQsmZNZpvgNFiNrdY02HgzHi?=
 =?us-ascii?Q?YLyeGNFcEvs1d3+HyqGc20m7jhgeqxw9QUNe4YTUomXIl+pDZwwxaNGKg2bX?=
 =?us-ascii?Q?oGq52dnA1+Yq4PWzS2YDUjAFBb4V0qL5+a1numP99weC0ZphUq+qaFFrlGPz?=
 =?us-ascii?Q?hQH4yAO9NzXB5+fmuKXrlxI2r353sw5K50iYx44K8xdcC+d527ZtnicOvrwC?=
 =?us-ascii?Q?kLdikWskLxaWmWJ1rHzxn+dHa0hIAQl838YwfIufy2mhGii7f9ovHQM5mGZW?=
 =?us-ascii?Q?2WhlNjc11jef4kuWGNT247Wn2v31jLIvvzHfKNGmMNKcbPkniLn7jpZmZnvk?=
 =?us-ascii?Q?bwSlelO8ZbI+JQo5DOcGLy3SzSGNHqlvMUEy3J2R3MGYDrm2FiUWAPSiUOv0?=
 =?us-ascii?Q?axAtGaCAqBj9kbPdP50jkFjYnW6L0YOkbrg/ozvF3IyZLIHPMfl5pWq+m6C5?=
 =?us-ascii?Q?XQdXK3NyHN3apuYRX0x+HQFNIsZlSKGP8+NHYaBwB7uUMvXDQ07JlMVhhXDP?=
 =?us-ascii?Q?bNT7yvJ+DnmPiotNNKgAWgGAq9glc79L2znoGBfkfEsRdUWDu2JHidZN323b?=
 =?us-ascii?Q?Bu+xCyweq9jn/A96yGx+bJNaSNbHvJem1n/AQ+aaHRh2c/1Rg4LmWhnKxvwB?=
 =?us-ascii?Q?uLoRFehvItnKDdTKZ7ZO+F4smevRAW9ngH+95ssB1JJ+n1gaZ47T+AAaxUv6?=
 =?us-ascii?Q?NOb5/lD9VCRJQuifkfRm3PD4rFfvx8IbxIyWY5xKpGQitDGHwLXbYyeoh8Vf?=
 =?us-ascii?Q?wGnia/8p6wYCsyhCzd19ojNgG2qeXeR1ZhwuVimo2O5EzfSdByBpL78akVXb?=
 =?us-ascii?Q?MAHMpvB4bPrqPUOiQvfFSe/7uy29qdP3/gL/BN32YoyYbQ9NLBtxpqiJNOZR?=
 =?us-ascii?Q?6BKCrJxV0fpqh5uadwMbYcmTg1+TTB+ohSGbAA7s8BnixxWSNfk7okxUmHT1?=
 =?us-ascii?Q?CruaGYL0oYVzVeDUz384/XAOkV2uialGVCfk8HqodlrtR4VlhVeqqkJRTLrF?=
 =?us-ascii?Q?BwY5IfGb0V0UfUJu0UqqIytVsMBE3uJtC4BEiCtXHoUVGNn5wX1duA5k5Irm?=
 =?us-ascii?Q?+B4jh6rkZTGXYkjb5DLfQ1h63Oui2zbWy+ShQ7ds3V49Vf8UvaktsG2Toi1a?=
 =?us-ascii?Q?fHN9q4hjF9ES+abbZBorkNF9NpwFzOetKCsnFOeAF17xpNPtygDr7xgW7mCV?=
 =?us-ascii?Q?TE+uMUXre5YSLqTZX6kEEEyB3NuehFph30pl0bZ4OhC7YjWVzA1ziFVH6oD0?=
 =?us-ascii?Q?1Tmlgy69GmYetGbFhEeaFwcMI5a5RcQWQB7akY47ypvrOIlb9Tnpf1jefyT/?=
 =?us-ascii?Q?P7Wbg8jIlMkrPbl2OzYCog6kTgyCniRpCoegLdCbCtd/NT5Yw6YfiVGuTR0B?=
 =?us-ascii?Q?uO9MlHuOVDUTAkWK59gx5Arzob7IkDj3QR7Az1BF8iRs6LwNnQyNO+c4G6mh?=
 =?us-ascii?Q?iHtE4x7XGnllUGyDc+LXiovbFZTAvFVyBFsDoS50ARFWRGxI9vDuvmNgnH9b?=
 =?us-ascii?Q?/cJPzZbtRQSWwYpf+pq/Q28wooXIU/pVS5C9GZf/jhJmDERbIh9ifdH4mhE0?=
 =?us-ascii?Q?NHVFwv2XKgEW4HToCtjJ/P2YBTq8FXHKkoI2x0RoUY8hy18WOUZ6jXYPpfUO?=
 =?us-ascii?Q?vEmwKmiut8bkJNbvQH/Gb6pU/RXdEm5xtOsOlhRtv7zLg7rKbGqcZkCuvCVF?=
 =?us-ascii?Q?qVSphLbzXIzjFrPbY1sYEwxVQaLuxY4kdUYyIjG9pd7IsDOrLDjY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b2c3d2-23bf-4439-81ff-08df287b995b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 16:12:23.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNFCSdNrGOjRXzVLZ0t9F10Zu4+eHx7qYeEs/gTnoD4g2GNvladBAd/Lz2M+aE/e5Os+OQIV+mVtwV96Rl4/zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055

On Tue, Sep 29, 2026 at 07:56:49PM +0200, Andreas Hindborg wrote:
> This function returns the number of online NUMA nodes.
> 
> The wrapper is needed by the Rust null block driver.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Yury Norov <ynorov@nvidia.com>

> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/numa.rs | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4d5c96ddc49c..a7b1c9cf454f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -105,6 +105,7 @@
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod num;
> +pub mod numa;
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
> new file mode 100644
> index 000000000000..164e622d325f
> --- /dev/null
> +++ b/rust/kernel/numa.rs
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! NUMA topology utilities.
> +//!
> +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
> +
> +use crate::bindings;
> +#[cfg(CONFIG_NUMA)]
> +use crate::sync::atomic::{
> +    Atomic,
> +    Relaxed, //
> +};
> +
> +/// Returns the number of online NUMA nodes.
> +#[inline]
> +pub fn num_online_nodes() -> u32 {
> +    #[cfg(CONFIG_NUMA)]
> +    {
> +        // SAFETY: `nr_online_nodes` is a global variable that is valid for the lifetime of the
> +        // kernel. The C side updates it with plain writes during node hotplug and reads it with
> +        // plain reads. A relaxed load is the Rust equivalent of `READ_ONCE()`, which is the best
> +        // we can do on the reader side.
> +        unsafe { Atomic::from_ptr(&raw mut bindings::nr_online_nodes) }.load(Relaxed)
> +    }
> +    #[cfg(not(CONFIG_NUMA))]
> +    {
> +        bindings::nr_online_nodes
> +    }
> +}
> 
> -- 
> 2.54.0
> 
> 
