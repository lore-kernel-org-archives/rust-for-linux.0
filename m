Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021089.outbound.protection.outlook.com [52.101.100.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4223F266;
	Wed, 15 Jan 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941366; cv=fail; b=sQokOvP2lXffROtK92lpsUd+hvQ50n/9rDifTsUYxrGIxV4TTZvwU3vfypzfgJX+P6vAtHE8yN+FjzAxqaCMSYLXc6ETqx42O2/iMcbLI7r+WOyUiq4gYLvsU8uqsxTBRDWonI0rRPcfeZlqUpm3Tr5/sxobyaPeaLKQ8vP8nyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941366; c=relaxed/simple;
	bh=7pR7QlH0rqQYjsMx0cRAJxguTgICNLUqGmmL+C09dDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RPn6ZT6DotmpHtUznyH1yY9VEKkwQMTUg+Cnu2QOkpx471yYe/33UfNJMGbEGvR3P/a5h05bgZ3cslJEG+GEjQdBrR2/36uptNccBK2wVTdTk+8dqkbfFdIrt/1U447+92fNwyS1wxC/D2KA4HRhaLoDvUUWO8kTXOwe8ZHAhwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=h9UvUckO; arc=fail smtp.client-ip=52.101.100.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="h9UvUckO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDqhBdmHuiCNSj8Xb4bxUC5uJzg0LeFhiVXMtWK6N0HwsD+Y5b+L+nWHZqhO94oQGKvtrdFTxOLu7/7802iMXECJ0B+fAwUdUjmE+IMCyJe/EzwOv9AZFo2VNBWFNz9FwYTkusm24wQNzFnVz6RusWw5MEktlbaU30gSvwmIE3PwpEmYJmW5bO3xA6I1Hu3z1RJ23AZXhTyZY7WqVV5+ASmJbI51z8giKpDgBUaO1HsXcylb9t39glck1Q+Y+bTUehflWPIHrn4u1Bge7KLFkxU+jOLi1QVQ9ZaxZxfi3hRcP56s30VxfEanzFt+DXKcG1UsLaq8NQRQodFfhg5IxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07lwWwfGF2F1JFzhKt9PApm2AB1PzDI0vv7zwp/f9C4=;
 b=Ibg9rwP2ati6Kcq512+Wi4+U2SqewaXDXkngJEkVOtlpZSbWbuFbv+I69HYs8vSxtTC5lo/qZLb1tMfQroZQR9WW3v8du3aqCzCbmaITYHJ7BFVhcIHIsmcwYt6OO5Ev4TOY3dD60FDjwmVt5G2/ajfe2aEhB0ZrVDrTQskqyosTgbEH6cBpHdSswOteXFaICwh6TvQNZMi4G7iALj/kv2UPEABScS6ppaQQBLj3hFlsxxwXFx3SLZV7rVEHsjxFyxXo4bXtrAQTJKTXq0I0rdXeYGPUHwJYdO0QwxyxniS+UmUG7mbh5ofNroyHPL389jISvoRYTz1ujfruo8vZfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07lwWwfGF2F1JFzhKt9PApm2AB1PzDI0vv7zwp/f9C4=;
 b=h9UvUckOwKH/esKTDfJgSw5qAMV/I2rXjNDxnbvOyqprWEyjTIwqcP+6FMnjtigGlyw9xWCRMI6CK8PRQ3yiZDFcEVO+s9EPZAzmDur4z7w3FLst7yKZMQxS0Im5of2z1cwf/T6y666PEGRzSJBqYm8NB9CZzIlnQduE//019IM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB7331.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:42:42 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:42:42 +0000
Date: Wed, 15 Jan 2025 11:42:38 +0000
From: Gary Guo <gary@garyguo.net>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: irq: add support for request_irq()
Message-ID: <20250115114238.3ff83439.gary@garyguo.net>
In-Reply-To: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::16) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 74929462-6f51-4051-fe07-08dd3559b85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6EWhn8Qxo70jWxbtemoYzOtc5oP+l6c8aEvFkuta98mKnSF+txvchXapE1QL?=
 =?us-ascii?Q?ShL1H8XSJ0akrTvkjg26aKMu4ZdFf2YSrIMoLoPRFi/pRShTuhoG27236vVZ?=
 =?us-ascii?Q?kc6RyDYVq2eWe2jMcFqsw2RP5riHz5kkuGSdPWyvwWfxeCqyWtKbyWOR072d?=
 =?us-ascii?Q?QRpsyyWSRSol4mr2fDDc5ljGd7MluYqAPVM34UcGPHfcDQPiYgS1guoR9SNI?=
 =?us-ascii?Q?KHiGS3nGDQdUuOrifFMHt9E3whqYlzLbyqE24X4ApPvxDU9P6mF3R7vzjnaD?=
 =?us-ascii?Q?C6nnRECBzWCnGNNkhri38uDgDgoBgr/+NbKeFl3u9WOcoTcuNKrO+1UP37Gr?=
 =?us-ascii?Q?arWPVpL0Mk9q6DYvmm5Y3pSuv+009VKbQ9sAcjm3nk2PnnHmnkY+U7uWZt/K?=
 =?us-ascii?Q?juW5gLW90h5YcTqmvWzZakdaxfWs6PaZmUXQ04pUHYcOypGpSF+GHfl2Z6Tr?=
 =?us-ascii?Q?YpGE0mdsHXRh0IeAV3hYJnwEc0kA6GcPxsotiExt29m5HarEQbNUS4nW5u6I?=
 =?us-ascii?Q?TuK1Ok20O5ft2/49NFnZPt3Ddk+q5zPjDsu24gt5awekKMVAvYT89/P6ieKN?=
 =?us-ascii?Q?7czJ/K8LFP+tlAyo00tlmMDerLuEWXTATA15AGVtMGm5Jzc4BBgDjgZlrxdG?=
 =?us-ascii?Q?iqYpkAcLDrqHidiQGPmpP5fvgboOJTMVz399nBAJHidBumIxgiFjGUPGfVfg?=
 =?us-ascii?Q?jLXUERoPa8e6IvTy4wYApDyStdCXrZyL3SJKdQpgQY9OijzzcprkeL8JanA+?=
 =?us-ascii?Q?cWSWQioiUmlPFAxM9N4XNJGH/sx5GlRj2A4Ck0BnhHAE9Si3HCVGM32YGUo0?=
 =?us-ascii?Q?RrMKjWpLN3iah+6IhiL51CWo8Ep7L1FYghTJ9JtT5EcThbdHmwOPiekY74dP?=
 =?us-ascii?Q?PixiMRtBWdQKRyQREnsLZdy5HRsxMqvXjXrYbzW5HnJM34dVPxiDz2zKkyhl?=
 =?us-ascii?Q?IumeUx+qcE59RHJJA3q/GE5Bi33vhXhfmHuE+qshriSmcMkAcrDGdQF2K/Mm?=
 =?us-ascii?Q?vmJYmPqu2SzE33nO+3ahv7lWAG4sUPLliy3FG6kWUSA57FTapZel6KlafYT2?=
 =?us-ascii?Q?LhiE1JJIwhi8cMHXkKBbOF9UP4Ma0UHkj6dO0NF0kwK2/CDevi1M7m95mdKU?=
 =?us-ascii?Q?0CBNF6J1FhBpQ4ZCp3jMt9lsfqBOJnUlGdujy+Mqqnl6djyjWe+XzLoqjZTW?=
 =?us-ascii?Q?5ivGgMs4GtGp84Yz0DZFZKFcaXnIhblCkkWWAHPAru0lq+enapJ78rnbwMG9?=
 =?us-ascii?Q?SNYSxd4DyshJxZDIOe4FlQmkhSka9W6oH324vnsSB2ls1nXtnNr+Y7GwwXar?=
 =?us-ascii?Q?dlwtwBGLeANLrRBrzJpEdykX4fRszWjuHyyrqu4tqBJFUuRSzSMQnQM60ik+?=
 =?us-ascii?Q?mbx6CGlJOGeqDAHE2nuutqiG7CFa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IReCasgyaw5IXnV4i7/mAzHrm7yAjrtenPsQLlIZZXjoVfwkKSsqGGH5ck56?=
 =?us-ascii?Q?yKCDQOaYk+5rCwNfLpCnm8oekkkjm4pDV0VEsaZUaENaPoV1veNAGpeTCEf7?=
 =?us-ascii?Q?e2PiajS390b86DmpvzWygQoA6Ih38V1bTkhVwLNPE8CJXLCYhN3m4OdbbKlZ?=
 =?us-ascii?Q?B4nbsUAQfCjdOHLz2/vpQu0xFY8l3m9vC7ipCuTpWCfhAXucVDci1qbOHfL3?=
 =?us-ascii?Q?CCvRK+gKutXrWBhfMv7B9xbXYNu/U3DNGZSflacUqfhicU+U6dNExEZMfElz?=
 =?us-ascii?Q?BTNBXgtBkbQqp6KqIXELP/uiO7e+TQ5ydLdKhmJwx3sihUwsP0znXBLSRclS?=
 =?us-ascii?Q?m2khGkSKXWXLkuizbDUB95N4P3fyu44bCapy9rPksj18aa+fuBopXDg+OzmX?=
 =?us-ascii?Q?SnS0MRWr0dOld6oSsSavMrh4fv+wpIZxmSBQls391NQWoaGTNwaY3Ndfw1T0?=
 =?us-ascii?Q?5YQykXu1dVxFihr+T0G4TrocPhhJRZAmY0/LuUZA4yWQbhgrjcm9KSdT+byo?=
 =?us-ascii?Q?qEBGyQqFSSocY58CweqoWlB4+dlyestN2tIpngb+gX08kl2PwAoEgjeTw8PD?=
 =?us-ascii?Q?SFfzeZkTwiFTSb5BZ9rtXi7kKW2bGA+s621FG9GOVywKCWpc6fzvMqjYbgz5?=
 =?us-ascii?Q?xy35rYfeEnbK0+bTxMWzFIibtitq24b7GK33U4T+R9P30nV5koOFvkAn8WSa?=
 =?us-ascii?Q?Osnc6nDspfCvTRfbvNjcOD0qCrblAnJUR9YDWRZOLfW3B6RXZu4GeG9BYAmZ?=
 =?us-ascii?Q?KYOCtr6S3Zx5ZXlkK4Vu7iL6nGOEaPwRt/eCZjl098PvcqwhfQwCfk5YbT/v?=
 =?us-ascii?Q?C9Sad9+temxWiH5bRBKTe6jEbe2LIhoNp6HQp18aQ1cukxq6s56U9ZoOe8u1?=
 =?us-ascii?Q?WWjjs6nhP3002Uq86Ms/XIjL3Mx5IfrXqQ0Nizee8IMIdw2cssmWtWZbeB5l?=
 =?us-ascii?Q?obd9fTRT9UphTm3RI/nKYD3TOODxavyTsY1MmnDtDWarDjNpxgfI/9PqJRlg?=
 =?us-ascii?Q?8edXUQKdp2hmdLCMklaMjbqijaO7n5cmQDnf/a303JU9NX0Sa0ViNgk3V7vv?=
 =?us-ascii?Q?MnOwgEi5bqXWKtpxazV8oJ/fSfUXpAjVbMKhiWVQ+a2m97tdAfo438TVgd0Z?=
 =?us-ascii?Q?ggANcuD6XS//CrUUNyT7ytMFglyHGB5lR2rzZkfaw8rgpX7QoVSSl4EgbXVm?=
 =?us-ascii?Q?3LcI//asg5EjOlQgZrhY5vJQ0/ytKosCgf7t0iuRtepWr+ELg1FffNoewDdD?=
 =?us-ascii?Q?tr6GMmz7btpkqbxjAEb5ruHWUEpI34y0HDB6uSRgwYe6K0KlsiwOaDy+OjKN?=
 =?us-ascii?Q?TFThN8uZebZuhTbw2ikQupmNifvRXnrKkpcLd4uedJwd+Qjd98ZBWzT7yDEA?=
 =?us-ascii?Q?dkv4UV4DrJTe+wGvvM/vQRZu1PmvBXG6VNxQy/gkcNTW/UT6UudOtEEQ4km7?=
 =?us-ascii?Q?me8hCt43nCc6esx4JJK9RNVynOokMy6ACmekFpNkxHDuJoQXc2D5NR/NUVWn?=
 =?us-ascii?Q?XP0ObHy3LHscqjPsA5LDkpNj6N0p+th975J8GGlsMWTq+cKEfPAQCapx2oYH?=
 =?us-ascii?Q?mRtFl90UTrkO+sIhyJlpOdfvEGVtsM+Z9z3a5pMKxu8u2Rrcq/AMFuSWdAVz?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 74929462-6f51-4051-fe07-08dd3559b85f
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:42:41.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnlw+tUAojk1VDrEfusBwEj/ll4j8n8TKTOBGDMyoGyrwRB9ae0YUMdaDN3DYV5FzbZQz9LxyW1dCouvH3GGzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7331

On Thu, 24 Oct 2024 11:20:02 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> Both regular and threaded versions are supported.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/irq.c              |   9 +
>  rust/kernel/irq.rs              |   6 +
>  rust/kernel/irq/request.rs      | 450 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   1 +
>  6 files changed, 468 insertions(+)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index ae82e9c941afa17c48737d2b2e49ac6d26f670b1..f1c35b334f5f7d2adcacb1def72182a09db2ac6c 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -13,6 +13,7 @@
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/firmware.h>
> +#include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/mdio.h>
>  #include <linux/phy.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 30f40149f3a969f9e8eb747aabdc17a8cb06936b..0bb48df454bd87def8271444ea58c781b792e34c 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -12,6 +12,7 @@
>  #include "build_assert.c"
>  #include "build_bug.c"
>  #include "err.c"
> +#include "irq.c"
>  #include "kunit.c"
>  #include "mutex.c"
>  #include "page.c"
> diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..1faca428e2c047a656dec3171855c1508d67e60b
> --- /dev/null
> +++ b/rust/helpers/irq.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/interrupt.h>
> +
> +int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
> +			    unsigned long flags, const char *name, void *dev)
> +{
> +	return request_irq(irq, handler, flags, name, dev);
> +}
> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..3ab83c5bdb831e84f5e035d9ef56f8e373fa572d
> --- /dev/null
> +++ b/rust/kernel/irq.rs
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! IRQ abstractions
> +
> +/// IRQ allocation and handling
> +pub mod request;
> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..4b5c5b80c3f43d482132423c2c52cfa5696b7661
> --- /dev/null
> +++ b/rust/kernel/irq/request.rs
> @@ -0,0 +1,450 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright 2019 Collabora ltd.
> +
> +//! IRQ allocation and handling
> +
> +use crate::error::to_result;
> +use crate::prelude::*;
> +use crate::str::CStr;
> +use crate::types::Opaque;
> +
> +/// Flags to be used when registering IRQ handlers.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`flags`] module.
> +#[derive(Clone, Copy)]
> +pub struct Flags(u64);
> +
> +impl core::ops::BitOr for Flags {
> +    type Output = Self;
> +    fn bitor(self, rhs: Self) -> Self::Output {
> +        Self(self.0 | rhs.0)
> +    }
> +}
> +
> +impl core::ops::BitAnd for Flags {
> +    type Output = Self;
> +    fn bitand(self, rhs: Self) -> Self::Output {
> +        Self(self.0 & rhs.0)
> +    }
> +}
> +
> +impl core::ops::Not for Flags {
> +    type Output = Self;
> +    fn not(self) -> Self::Output {
> +        Self(!self.0)
> +    }
> +}
> +
> +/// The flags that can be used when registering an IRQ handler.
> +pub mod flags {
> +    use super::Flags;
> +
> +    use crate::bindings;
> +
> +    /// Use the interrupt line as already configured.
> +    pub const TRIGGER_NONE: Flags = Flags(bindings::IRQF_TRIGGER_NONE as _);
> +
> +    /// The interrupt is triggered when the signal goes from low to high.
> +    pub const TRIGGER_RISING: Flags = Flags(bindings::IRQF_TRIGGER_RISING as _);
> +
> +    /// The interrupt is triggered when the signal goes from high to low.
> +    pub const TRIGGER_FALLING: Flags = Flags(bindings::IRQF_TRIGGER_FALLING as _);
> +
> +    /// The interrupt is triggered while the signal is held high.
> +    pub const TRIGGER_HIGH: Flags = Flags(bindings::IRQF_TRIGGER_HIGH as _);
> +
> +    /// The interrupt is triggered while the signal is held low.
> +    pub const TRIGGER_LOW: Flags = Flags(bindings::IRQF_TRIGGER_LOW as _);
> +
> +    /// Allow sharing the irq among several devices.
> +    pub const SHARED: Flags = Flags(bindings::IRQF_SHARED as _);
> +
> +    /// Set by callers when they expect sharing mismatches to occur.
> +    pub const PROBE_SHARED: Flags = Flags(bindings::IRQF_PROBE_SHARED as _);
> +
> +    /// Flag to mark this interrupt as timer interrupt.
> +    pub const TIMER: Flags = Flags(bindings::IRQF_TIMER as _);
> +
> +    /// Interrupt is per cpu.
> +    pub const PERCPU: Flags = Flags(bindings::IRQF_PERCPU as _);
> +
> +    /// Flag to exclude this interrupt from irq balancing.
> +    pub const NOBALANCING: Flags = Flags(bindings::IRQF_NOBALANCING as _);
> +
> +    /// Interrupt is used for polling (only the interrupt that is registered
> +    /// first in a shared interrupt is considered for performance reasons).
> +    pub const IRQPOLL: Flags = Flags(bindings::IRQF_IRQPOLL as _);
> +
> +    /// Interrupt is not reenabled after the hardirq handler finished. Used by
> +    /// threaded interrupts which need to keep the irq line disabled until the
> +    /// threaded handler has been run.
> +    pub const ONESHOT: Flags = Flags(bindings::IRQF_ONESHOT as _);
> +
> +    /// Do not disable this IRQ during suspend. Does not guarantee that this
> +    /// interrupt will wake the system from a suspended state.
> +    pub const NO_SUSPEND: Flags = Flags(bindings::IRQF_NO_SUSPEND as _);
> +
> +    /// Force enable it on resume even if [`NO_SUSPEND`] is set.
> +    pub const FORCE_RESUME: Flags = Flags(bindings::IRQF_FORCE_RESUME as _);
> +
> +    /// Interrupt cannot be threaded.
> +    pub const NO_THREAD: Flags = Flags(bindings::IRQF_NO_THREAD as _);
> +
> +    /// Resume IRQ early during syscore instead of at device resume time.
> +    pub const EARLY_RESUME: Flags = Flags(bindings::IRQF_EARLY_RESUME as _);
> +
> +    /// If the IRQ is shared with a NO_SUSPEND user, execute this interrupt
> +    /// handler after suspending interrupts. For system wakeup devices users
> +    /// need to implement wakeup detection in their interrupt handlers.
> +    pub const COND_SUSPEND: Flags = Flags(bindings::IRQF_COND_SUSPEND as _);
> +
> +    /// Don't enable IRQ or NMI automatically when users request it. Users will
> +    /// enable it explicitly by `enable_irq` or `enable_nmi` later.
> +    pub const NO_AUTOEN: Flags = Flags(bindings::IRQF_NO_AUTOEN as _);
> +
> +    /// Exclude from runnaway detection for IPI and similar handlers, depends on
> +    /// `PERCPU`.
> +    pub const NO_DEBUG: Flags = Flags(bindings::IRQF_NO_DEBUG as _);
> +}
> +
> +/// The value that can be returned from an IrqHandler;
> +pub enum IrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None = bindings::irqreturn_IRQ_NONE as _,
> +
> +    /// The interrupt was handled by this device.
> +    Handled = bindings::irqreturn_IRQ_HANDLED as _,
> +}
> +
> +/// Callbacks for an IRQ handler.
> +pub trait Handler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in IRQ
> +    /// context.
> +    fn handle_irq(&self) -> IrqReturn;
> +}
> +
> +/// A registration of an IRQ handler for a given IRQ line.
> +///
> +/// # Invariants
> +///
> +/// * We own an irq handler using `&self` as its private data.
> +///
> +/// # Examples
> +///
> +/// The following is an example of using `Registration`:
> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::irq;
> +/// use kernel::irq::Registration;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::lock::SpinLock;
> +///
> +/// // Declare a struct that will be passed in when the interrupt fires. The u32
> +/// // merely serves as an example of some internal data.
> +/// struct Data(u32);
> +///
> +/// // [`handle_irq`] returns &self. This example illustrates interior
> +/// // mutability can be used when share the data between process context and IRQ
> +/// // context.
> +/// //
> +/// // Ideally, this example would be using a version of SpinLock that is aware
> +/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that is not yet
> +/// // implemented.
> +///
> +/// type Handler = SpinLock<Data>;
> +///
> +/// impl kernel::irq::Handler for Handler {
> +///     // This is executing in IRQ context in some CPU. Other CPUs can still
> +///     // try to access to data.
> +///     fn handle_irq(&self) -> irq::IrqReturn {
> +///         // We now have exclusive access to the data by locking the SpinLock.
> +///         let mut handler = self.lock();
> +///         handler.0 += 1;
> +///
> +///         IrqReturn::Handled
> +///     }
> +/// }
> +///
> +/// // This is running in process context.
> +/// fn register_irq(irq: u32, handler: Handler) -> Result<irq::Registration<Handler>> {
> +///     let registration = Registration::register(irq, irq::flags::SHARED, "my-device", handler)?;
> +///
> +///     // You can have as many references to the registration as you want, so
> +///     // multiple parts of the driver can access it.
> +///     let registration = Arc::pin_init(registration)?;
> +///
> +///     // The handler may be called immediately after the function above
> +///     // returns, possibly in a different CPU.
> +///
> +///     // The data can be accessed from the process context too.
> +///     registration.handler().lock().0 = 42;
> +///
> +///     Ok(registration)
> +/// }
> +///
> +/// # Ok::<(), Error>(())
> +///```
> +#[pin_data(PinnedDrop)]
> +pub struct Registration<T: Handler> {
> +    irq: u32,
> +    #[pin]
> +    handler: Opaque<T>,
> +}
> +
> +impl<T: Handler> Registration<T> {
> +    /// Registers the IRQ handler with the system for the given IRQ number. The
> +    /// handler must be able to be called as soon as this function returns.
> +    pub fn register(
> +        irq: u32,
> +        flags: Flags,
> +        name: &'static CStr,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {
> +            irq,
> +            handler: Opaque::new(handler)
> +        })

This creates `Self` immediately which is problematic because destructor
of `Self` will be executed regardless if `request_irq` returns
successfully or not.

> +        .pin_chain(move |slot| {
> +            // SAFETY:
> +            // - `handler` points to a valid function defined below.
> +            // - only valid flags can be constructed using the `flags` module.
> +            // - `devname` is a nul-terminated string with a 'static lifetime.
> +            // - `ptr` is a cookie used to identify the handler. The same cookie is
> +            // passed back when the system calls the handler.
> +            to_result(unsafe {
> +                bindings::request_irq(
> +                    irq,
> +                    Some(handle_irq_callback::<T>),
> +                    flags.0,
> +                    name.as_char_ptr(),
> +                    &*slot as *const _ as *mut core::ffi::c_void,
> +                )
> +            })?;
> +
> +            Ok(())
> +        })
> +    }
> +
> +    /// Returns a reference to the handler that was registered with the system.
> +    pub fn handler(&self) -> &T {
> +        // SAFETY: `handler` is initialized in `register`.
> +        unsafe { &*self.handler.get() }
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T: Handler> PinnedDrop for Registration<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY:
> +        // - `self.irq` is the same as the one passed to `reques_irq`.
> +        // -  `&self` was passed to `request_irq` as the cookie. It is
> +        // guaranteed to be unique by the type system, since each call to
> +        // `register` will return a different instance of `Registration`.
> +        //
> +        // Notice that this will block until all handlers finish executing, so,
> +        // at no point will &self be invalid while the handler is running.
> +        unsafe { bindings::free_irq(self.irq, &*self as *const _ as *mut core::ffi::c_void) };
> +    }
> +}

In addition to what Alice said I think this doesn't drop `handler` in
any circumstance at all.

Best,
Gary
