Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F925477E;
	Tue, 24 Mar 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362754; cv=fail; b=uPZxVQHp7lPli9shO9/vt6srFDHUx3roh7eRsHB/o0iDAFtqLlwpmsYuc6ui40NEg6n5xDRvfqSzbK3y51ibQlcYnmJrwWar+f+8baPILX613eqtgW6QZd+1VUYTZh9f07TX8nf3RG0EwQ7GBgLEwvsuapA+tCUn4Z0unV9rgcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362754; c=relaxed/simple;
	bh=jDQsMRX9Z8E+74dov8X6jYgYep6OyvDveYtWIKg8+2k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hGt1TsNZ3/WbuAoAuYDuCcRfrSv014aQBr/Lp5xFKD52CSG7M4oMoF/RMBH+E6ceqyrdH0DBBX0Ome6g3bf9ueCKPghYEGhDczcxjxy81MnPoQTZOedzEkNibvCsyIYcrg3IXlzOd6wPy657ofttjt4CYN9CpGjEtWSL0Dj6i50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P73lLMyQ; arc=fail smtp.client-ip=52.101.52.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P73lLMyQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMLWbC2pTGuJ0K+ggMoP0js+f1YcI5RgA7qC7/9I0jIM6aIji7gtfKbuY2Xsj3jp1BlHte7ztmYvzuCLoGLkM6o0a9aW9e3JRqdT3soxAbLdI9qHrQJD5/l7O2I+c3ZyNtFCcZFzIhnAwLKdVfyXVTUs/uwKUaUk3XzwS/1foY/qO4mZ9z888bTjw58kGlZzHMRcD95MACQxb5aUinMzDiFptlosArNMVvTqlOtU2kdbbwDpd2HRifMorXmIhBJ1T9MoHSXiS7kfv9Dya7HDONVAyuZNu4LZRf5tVALobBZsgb3mnfNp1YXNgCT07vrDezX71wBlK5wgsOX5/gZE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej/Z3BkzY8PzgH+PZ7Z6VFy8t4WaIfC6ibCJQa5nQVc=;
 b=qV4U+G97XK6xnYNJfsqRVwfXN9Y9e9ArYSde92DDlW+HWO/njtOjolMOjY5DtKPe/pvttNoI8f1V3woJl0U6/pxOvl+SfdcK6lTneUrPXAUs1fdcz7HrchtbOLNF1p9iUK8rCobTrrkzHoDK8eMmcNjmMIl2UtQ/kXA3Dx//ubvm8SeNRJVmeAB3oeXw/RT4xL5YMpwiEoAso0cwix8NkQhApWrBpML9Ert1uDEXX910Yzp30CzX1+6AsDL6pMmOq+ePSEUQQ75GZ8Qqnsg65zLBF+0Buruet/yRhAwgTx6Kp3k/SjYsOrkTX1nBBfFSxMsdyBmacWKReFobC1pJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej/Z3BkzY8PzgH+PZ7Z6VFy8t4WaIfC6ibCJQa5nQVc=;
 b=P73lLMyQEoLAI/q2CSR96Mwt7/lj+eAixkcqqZF3rqjtdWUrW5AeJAAX7E8iJG6aOS2O5WL23O0urzXNbQBxlt6Di3VzOyZWCZI5MyoO/HqBJlInGuDGFbY/uOcLRF6Ps6XjpbK9IIjz9h4e0riAzIjO0lBlAFEbx/MlhzESf6NAfV7p4kNNjr2ZwdgbRnbNQztnCRcoyEs63BCQHmvFPMJWMUmjVYFX5SX6U2YfXhac1mRDVTk0fV79REoWzBBEv9uiHJYqc+sfUKxlsKtbOxQORMX6k10CIzMkR9wYOaR/CrCYB9VcNBtbrVVXBf8tGpXrwE87631iZXqskn0GWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:32:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 14:32:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 23:32:20 +0900
Message-Id: <DHB33HYZU54X.RIL6UKQ7ORV7@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: sizes: add DeviceSize trait for device
 address space constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260312031507.216709-1-jhubbard@nvidia.com>
 <20260312031507.216709-2-jhubbard@nvidia.com>
In-Reply-To: <20260312031507.216709-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: d68f7d7f-08f8-4f3a-8929-08de89b22a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	+3jLzuMPfbJP0TA1a5MA9gwnAxHcpFvoxQwnaJ163y6KLbMiouCa6AKVPOFbgsXopwpc7stqykfWhqVzTmJieFV9HGZHmM0xbcFW+WmUz0ZqLxD2nZLyOkih6TCdnjwkwUIKu7Z3RZN3VtdM1BXZ5beLZOyblGXl0NTFgjpCjl18ewd1V008vNwZnlImU/eeK+6c9MsFP9J8+tgx9P/yenq3bU8/zFFldhGJ3JS0cxIoYQo6h9zt4MSmQceAGvA5uZMiyr6y++jxWBOEa3BJm7Vcl0hsSwqowHRyuA0t2lS+/DHtgjh2vqyfLDcZ8uzznEFdgjOUMHMtg4SZq6NIxdAXJzhQPwwq8wf8dmT1DAY3tx/hKDku2xcs7n/zw+aMfShAn1Rf/3nPKMQqLZJYd1C4KaQlWW5FYfeZ0frNVQerlSOSMvkpZJjFhi5et3w6GQKu/CIPxb9MkpHdCLOj982RrvKvUQ5QlbYFPeNfjJBHUWeldK75D3nGQ7nCHwtENppDEYj14LdeUYgzve5oWVQDWKD20TiFJRG1WZo0rESG0V8QxZlW9njFrr2Big/WjbYwc0UUGUyOyQfSsvfu7VvLbeuB6BJc4+ixbsl6MCAScXiAM09JeBcimDDdlC6sfnq3Du/NHd9j0ke23V/dsU5XjyUDc2DgqAN9JYedGzpczbLELYnVw5U8naGt/uwum1uGogA20VwJIDUZzBRPyIN05VFNQ0OuwsbMOSbwNSg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm1aaitjNTVjb2xTbzNXd1U5eG4rR2gwNXBPRU5MSVB0QS83Wmg4QmNzYXFa?=
 =?utf-8?B?dWwxaUxGSVhlY01URHF5SXp3bHdQaFdJZ0ZsbVF6SXhkK0x1MnV1TUtnZjlt?=
 =?utf-8?B?N1djRzJBeGR4cTR5ZzFnb3NDK0dIdXQ4c3M1Z09pUWJUSk9SZElNK0pHVlph?=
 =?utf-8?B?NllpV0xtRXZkaTVHMW5MRHZvSFZOMXBuTk03aEFrZlhOWkRuWkRVS2cwRG5x?=
 =?utf-8?B?Z2tyamxDUjVBMmRJOC85MVB3U1l5SUxKVlNHSUJJaUxUTDhidERWZlNqQTJC?=
 =?utf-8?B?ZHNOc09XcFM4YW8yZy9uQ2x4SHgrQ05Ib2l3Zmgxc0pra1dWcUIrNFY4TWpS?=
 =?utf-8?B?MHNKa0VQSEp5ay9IYm1RVUdxNFRxY2lrdlJYb1RpQ1FaRHJlSnpQNGRVbm5j?=
 =?utf-8?B?TTYrbzU2OW1ZQ0paR1NHcEsxcTdNT04zK0NpSGMrRy9BS0duREpFYTZBWFo5?=
 =?utf-8?B?M0lzaUQzUUo0cjBWbTYyT0s0M3NuVW1pZXE1a2wxcmFZTGkxWHFPVW01T2dY?=
 =?utf-8?B?cXBWbzQyRTd2Y0E1MjdZZFEvd1FoMi9ucjc3eFQreFhJamh0VnRaMEVvL1VD?=
 =?utf-8?B?OGw3Wlh6MWgwbzlsWEVRQWZBdU1VMlJmV1pYV0Vha0JadTJZbEoxTERYaHBJ?=
 =?utf-8?B?WGhDU0lIaVBFMi9ZUjhxc2tEdkEzek1HS1Y0YzA1d1VYUysyc1dhRTVkd2hL?=
 =?utf-8?B?bXJUVTRrT0VsVzJWbXVvL1B4eWdqMGIwMVltSzY2cXZ2Y0FzbUROY3B2OVpJ?=
 =?utf-8?B?NW5VMkJ2THZ2OG1ncTIvWkZGS1NMQnhVbjBkNkI0NXlLOWNTRk9ONDQycjhn?=
 =?utf-8?B?U29RV2hadU9NYkZJb0c4RVRQQ09GNG9SQkFXTUtTUnNoSkU0VlRwOWVxTWZY?=
 =?utf-8?B?c0RtQUYzc1BGRlJtYkdpaHo1MzNVNnBXNlNaVGx1azU0clBxZlFXYTBMYk5i?=
 =?utf-8?B?dHBwZFdmOHQyVE92bWZTNlJVODgvNTV0Wk1mclR1Vm9oa1cvbzdXMy9kaGQx?=
 =?utf-8?B?SHZjU3g3ZVpqUXhWT0lSdkhvazdtWWFTM3Bac2s3cUNvR3BXajVPKzlGbWM0?=
 =?utf-8?B?bUpENlU2cHFtN053QTFLTVkrZm1wWURHWVJ0UUxTWlRGWGp1Z3pCaGFWenVB?=
 =?utf-8?B?MTlMSVJYUHF3ZG5zTW5Yclk3cE5nMXE0d3orRjJpdThNUnF5T1ZJYjl3ckJF?=
 =?utf-8?B?SG82Z1VCQjB3bW1KUktJaXpWRk85d1cxYXVBMzN2ZGtpbDJOdUtac05sSFVS?=
 =?utf-8?B?WmFRd3NmQXRRb0ljTUpTTldtMlRIQzQzZ3VZUS9sallvbkFmcXI1cE1sbi85?=
 =?utf-8?B?Y29GS0h1dE8zYUQ5bGhkMmpCY2k3NCtTSWc5aXFGWk1Vd0dLeXFUWFZaSngz?=
 =?utf-8?B?OVN4cVpjU0RIRUhvUy85WEViM0FUZkp6czMvSTh2SEphdFZ6elQ5NzVyWjhp?=
 =?utf-8?B?Y3Z5ZVJPWGh0RkNXZVVUM1RZckYrUXVYUWJibDY4Nlo5VVR5Q0dXRmlCUnh1?=
 =?utf-8?B?K1VXb0lEd20xNXlIV25PUUg4MDNHVkxTWUJncnVOUHBXYUErVEZWMDB2R3cr?=
 =?utf-8?B?QmV1dHlHeHNpOTY0Mi8zWFNmcWNKRkdpTEdMVHR3MXBNa3ZEU0VHOVJVbGJo?=
 =?utf-8?B?bEJLRENwUkh3NFhSTlA1b3I2OVROWVhJRkpFZGt3WkxZVHBKQTlOT2dWbUlr?=
 =?utf-8?B?VTR2TkIxRG0zczdxUkVPdzQvamJsWlF3R2FzdlNsMWFlZnlNVEN3cFBHMFRy?=
 =?utf-8?B?b0daVVI3Y0tuWmtMSzlOVVpUNGhSSitSbjBSZjdjN2JGTmNiNXBwdHFYcUt1?=
 =?utf-8?B?WHJuckdVY210eUQ1akl3dmptSXdRTUNBLzZiUEQyN2FTY0o4dEg1L0NqbWJP?=
 =?utf-8?B?UFRWRHRhRmtxZXdkK1NPR2RqN1dBQnJFckhEZWxqQzY5aG8wSUNnRkVTQkZQ?=
 =?utf-8?B?RkNBSnF2NFlJdUZLYkpkNVJySzRZVmRETDd5enQ4SElWamhUVjQ3MXllS3Ex?=
 =?utf-8?B?T0JMOFdmeHhVY0FVNW14ZlJBa2ZsUXlFUHNDOGFHTEdTdFpUaElvc0RXS2g2?=
 =?utf-8?B?Y29wL1N5d0dIaU4wNmFqZnVVUXFzUHlUcFlqVnJaZ0ZSY2x0Y0c1RnNZK1pE?=
 =?utf-8?B?akRzTkdaY25jYmFJMUdoMGM1eklZTlRPcWx5T0x2a29JUnRrcHg0RVd6TGtU?=
 =?utf-8?B?elFWc3JneTQwQzhzNVVMcEYxTlFheGlKOXBJSFJvMURqV0tKOTFkd1hhY2dN?=
 =?utf-8?B?QWFHSEU3Z2VjTVN3bklGV2hYdGlDM1NoVERoVUZsOHJQQlNUckJOcU9xSWpD?=
 =?utf-8?B?WnNkem5mODNUcVhNeVc5ZmVoK3NHYXI0YkxPbEVzZktwdDF5NUw0cEg0MnR1?=
 =?utf-8?Q?rVQWW2NfsOVzWvXASTobhUQujxhCqI7Q9MVy5Qieki2Ef?=
X-MS-Exchange-AntiSpam-MessageData-1: jlcSZBZAA/L2dA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68f7d7f-08f8-4f3a-8929-08de89b22a37
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:32:24.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EGxdvX1YVSCUlUFY1uZnDfHuq7Epq6LVc7i8wN9vWWczHtzefEa1wVfzS/8aplkkocBBWx9G/iVAuQGFYp6iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919

General note: `make rustfmt` reformats code from the series.

On Thu Mar 12, 2026 at 12:15 PM JST, John Hubbard wrote:
> The SZ_* constants are usize, matching the CPU pointer width. But
> device address spaces have their own widths (32-bit MMIO windows,
> 64-bit GPU framebuffers, etc.), so drivers end up with repeated
> usize-to-u64 or usize-to-u32 conversion calls like
> usize_as_u64(SZ_1M). This adds boilerplate with no safety benefit.

`usize_as_u64` is Nova-only at the moment, so it might not be
well understood in this context.

>
> Add a DeviceSize trait with associated SZ_* constants, implemented for
> u32 and u64. With the trait in scope, callers write u64::SZ_1M or
> u32::SZ_4K to get the constant in their device's native width. All
> SZ_* values fit in a u32, so both implementations are lossless. The
> u32 impl has a const assert to catch any future constant that would
> overflow; the u64 cast from usize is inherently lossless.
>
> Replace the hand-written constant list with a define_sizes! macro that
> generates the usize constants, the trait, and both trait impls from a
> single list of names. Adding a new size or a new target type requires
> changing only one place.
>
> The trait also enables future generic APIs that accept T: DeviceSize,
> so shared infrastructure can work with whatever address width the
> driver declares.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  rust/kernel/sizes.rs | 132 ++++++++++++++++++++++++++++---------------
>  1 file changed, 88 insertions(+), 44 deletions(-)
>
> diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
> index 661e680d9330..6b11ec6d97b3 100644
> --- a/rust/kernel/sizes.rs
> +++ b/rust/kernel/sizes.rs
> @@ -3,48 +3,92 @@
>  //! Commonly used sizes.
>  //!
>  //! C headers: [`include/linux/sizes.h`](srctree/include/linux/sizes.h).
> +//!
> +//! The top-level `SZ_*` constants are [`usize`]-typed, for use in kerne=
l page
> +//! arithmetic and similar CPU-side work.
> +//!
> +//! The [`DeviceSize`] trait provides the same constants as associated c=
onstants
> +//! on [`u32`] and [`u64`], for use in device address spaces where the a=
ddress
> +//! width depends on the hardware. Device drivers frequently need these =
constants
> +//! as [`u64`] (or [`u32`]) rather than [`usize`], because device addres=
s spaces
> +//! are sized independently of the CPU pointer width.
> +//!

There should be a `# Examples` here.

> +//! ```
> +//! use kernel::sizes::{DeviceSize, SZ_1M};
> +//!
> +//! // usize constant (CPU-side)
> +//! let pages: usize =3D SZ_1M / kernel::page::PAGE_SIZE;

Maybe `num_pages_in_1m` to be more precise.

> +//!
> +//! // Device-side constant via the trait
> +//! let heap_size: u64 =3D 14 * u64::SZ_1M;
> +//! let small: u32 =3D u32::SZ_4K;
> +//! ```
> +
> +macro_rules! define_sizes {
> +    ($($name:ident),* $(,)?) =3D> {
> +        // `usize` constants, from the C `SZ_*` defines in `include/linu=
x/sizes.h`.
> +        $(
> +            #[doc =3D concat!("`", stringify!($name), "` as a [`usize`].=
")]

All the information in this doccomment (the value and the type) is
already in the declaration below, which appears both in the
rust-analyzer and the HTML doc.

The original doccomments OTOH were useful and they showed the
hexadecimal value, allowing the reader to understand at a peek which bit
was affected. Right now we don't have this information as the value is
displayed in decimal in the documentation. So I think we should just
keep the original doccomments without any extra ornament.

> +            pub const $name: usize =3D bindings::$name as usize;
> +        )*
> +
> +        /// Size constants for device address spaces.
> +        ///
> +        /// Implemented for [`u32`] and [`u64`] so drivers can choose th=
e width
> +        /// that matches their hardware. All `SZ_*` values fit in a [`u3=
2`], so
> +        /// both implementations are lossless.
> +        ///
> +        /// ```
> +        /// use kernel::sizes::DeviceSize;
> +        ///
> +        /// let gpu_heap: u64 =3D 14 * u64::SZ_1M;
> +        /// let mmio_window: u32 =3D u32::SZ_16M;
> +        /// ```
> +        pub trait DeviceSize {
> +            $(
> +                #[doc =3D concat!("`", stringify!($name), "` for this ty=
pe.")]
> +                const $name: Self;
> +            )*
> +        }
> +
> +        impl DeviceSize for u32 {
> +            $(
> +                const $name: Self =3D {
> +                    assert!(self::$name <=3D u32::MAX as usize);
> +                    self::$name as u32
> +                };
> +            )*
> +        }
> +
> +        impl DeviceSize for u64 {
> +            $(
> +                const $name: Self =3D self::$name as u64;

I know 64-bit is that largest architecture so far, but in order to
protect for an eventual future where larger sizes exist (and for
consistency), let's have the defensive `assert` here as well.

> +            )*
> +        }
> +    };
> +}
> =20
> -/// 0x00000400
> -pub const SZ_1K: usize =3D bindings::SZ_1K as usize;
> -/// 0x00000800
> -pub const SZ_2K: usize =3D bindings::SZ_2K as usize;
> -/// 0x00001000
> -pub const SZ_4K: usize =3D bindings::SZ_4K as usize;
> -/// 0x00002000
> -pub const SZ_8K: usize =3D bindings::SZ_8K as usize;
> -/// 0x00004000
> -pub const SZ_16K: usize =3D bindings::SZ_16K as usize;
> -/// 0x00008000
> -pub const SZ_32K: usize =3D bindings::SZ_32K as usize;
> -/// 0x00010000
> -pub const SZ_64K: usize =3D bindings::SZ_64K as usize;
> -/// 0x00020000
> -pub const SZ_128K: usize =3D bindings::SZ_128K as usize;
> -/// 0x00040000
> -pub const SZ_256K: usize =3D bindings::SZ_256K as usize;
> -/// 0x00080000
> -pub const SZ_512K: usize =3D bindings::SZ_512K as usize;
> -/// 0x00100000
> -pub const SZ_1M: usize =3D bindings::SZ_1M as usize;
> -/// 0x00200000
> -pub const SZ_2M: usize =3D bindings::SZ_2M as usize;
> -/// 0x00400000
> -pub const SZ_4M: usize =3D bindings::SZ_4M as usize;
> -/// 0x00800000
> -pub const SZ_8M: usize =3D bindings::SZ_8M as usize;
> -/// 0x01000000
> -pub const SZ_16M: usize =3D bindings::SZ_16M as usize;
> -/// 0x02000000
> -pub const SZ_32M: usize =3D bindings::SZ_32M as usize;
> -/// 0x04000000
> -pub const SZ_64M: usize =3D bindings::SZ_64M as usize;
> -/// 0x08000000
> -pub const SZ_128M: usize =3D bindings::SZ_128M as usize;
> -/// 0x10000000
> -pub const SZ_256M: usize =3D bindings::SZ_256M as usize;
> -/// 0x20000000
> -pub const SZ_512M: usize =3D bindings::SZ_512M as usize;
> -/// 0x40000000
> -pub const SZ_1G: usize =3D bindings::SZ_1G as usize;
> -/// 0x80000000
> -pub const SZ_2G: usize =3D bindings::SZ_2G as usize;
> +define_sizes! {
> +    SZ_1K,   // 0x0000_0400
> +    SZ_2K,   // 0x0000_0800
> +    SZ_4K,   // 0x0000_1000
> +    SZ_8K,   // 0x0000_2000
> +    SZ_16K,  // 0x0000_4000
> +    SZ_32K,  // 0x0000_8000
> +    SZ_64K,  // 0x0001_0000
> +    SZ_128K, // 0x0002_0000
> +    SZ_256K, // 0x0004_0000
> +    SZ_512K, // 0x0008_0000
> +    SZ_1M,   // 0x0010_0000
> +    SZ_2M,   // 0x0020_0000
> +    SZ_4M,   // 0x0040_0000
> +    SZ_8M,   // 0x0080_0000
> +    SZ_16M,  // 0x0100_0000
> +    SZ_32M,  // 0x0200_0000
> +    SZ_64M,  // 0x0400_0000
> +    SZ_128M, // 0x0800_0000
> +    SZ_256M, // 0x1000_0000
> +    SZ_512M, // 0x2000_0000
> +    SZ_1G,   // 0x4000_0000
> +    SZ_2G,   // 0x8000_0000
> +}

This macro looks like it has its arguments backwards. `SZ_*` is a fixed
list of values from the C headers that is stable and never changes.
OTOH, the types on which we want to implement `DeviceSize` may vary (as
I suggested in patch 3 to also support `usize`). So I think the macro
invocation should be like:

  define_sizes!(usize, u32, u64);

This would make it easier to integrate the doccomment fix I suggested
above. The only drawback is that generating the module-level usize
consts would need an internal macro rule with the SZ_* list, but that
doesn't add much complexity and makes more sense that way IMHO - you
would just be moving the list from the macro call site to the macro
internals.
