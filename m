Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022092.outbound.protection.outlook.com [52.101.96.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7C62459F7;
	Mon, 15 Dec 2025 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799728; cv=fail; b=qdeZ7r5btaqKNICqYGtmv0+l5KETXMjxooHY9g0nYx20mDGnLbeE3I5bRBsSB60rj3U9QpnlrQQLm/DdkSFBQft1nCKNC2+lxYHA5hrpFZCk2zjjhU3/rDielmnVyATg5inae7x0Klhpqw6jVUiuu4fwfCpcKWd8p2pybnEq/Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799728; c=relaxed/simple;
	bh=4Q5ompEVFbb6E4GKYORe7fHkHjxNZAeP1nbkdbU0gcA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eaJ4xB1z9vJmQwuQxhjGcImeG2qcd6LB4jSuYJooYXLmz9/I6n91c16vFTDgNtZ51nStE3w95m91mi1JGxmBK7VRktLnUmBe6U94ujnNKk+mEft80AWxqKGwZoYCEc1CP5QW1jM26wTWQnJT9c9VexFgfnmdVzaFdqwv7khF9vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=X8OoouFy; arc=fail smtp.client-ip=52.101.96.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="X8OoouFy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUcC+DfhCNRmkbXVz4wH2Y9F0VobTEBCN7yBVKCHZWwzrrVuSsWsjz0Gqj17uhPeToRfhrkmclJy9tcjF+m1Wxz3aJrPFMp3pFfW1BdyVzs5UrPZt35mq4A4I31nHAA9Zf2FY/LTUJl/lnJZtHO+As2VpWY2Xj6lvjH2Mc0IlP4I2Nj4PFrsWyeIfFk8kn2gmvtaVIYnGfJfMAvQaKDKkRv3GOxeYyWF9624shYES5JiHGzoxS6DcH3OaJM+QQW9nfB+d5VNeg7dJjMp9zprAiJXlB1yqRUSkAX/45MJiRSp3qLZGJF6SdwpSuuYhG8MEfl8GJIXCqDIAfgJdg0eCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO81E+F2QfRr96bvWjLzMkW0Wm5TSLBJUzTcku9QOyE=;
 b=qlMhmqHSoL1A3kX7knV7O86Kp+m9dBlTnXJZvxYe9UyHHFiZFxwXcnq6Ef3gP/9JBN4xa1hz2521rzdtKWfhFRWxGY5C8Vz1Yau4oYraKMjWefSDwZDutz6E+ILVxh65RqS9yqkd1hgsR7hkQdTxnQaeQYysJ7wpiNHY+l2BXog/l/A3Boxv0ncj5Vzaa1e1qqRJ0tH6vsAa7ury7hpxf89a5abKwHD+a/+PJ8rgyMDs/4nrbdUhLPwJKlyLm8xewMR5Rn2AtgUFmCtLYSlxa35E2tIRxEjM5G+B/qeBEDZxbwSHjvGfhVg6CTtWsxV2jNbsj+AC/i1C7a4T+u8sPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO81E+F2QfRr96bvWjLzMkW0Wm5TSLBJUzTcku9QOyE=;
 b=X8OoouFy4vdE5o5LH3zS+7iNvpHi1ibUPf0fu/x3Ad/17udJ8PNS5S1fX08tpV0FYnev1/eOaXQ2QLSYLXAzwlr6PQQDGnP8LxbTjBNsv9VRhoslrJCJ77emKY/DKdTWlteyP01IaaTSnfA9+TiAitkDkU7PlfsYcMav0yo0umI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB1846.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:55:23 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:55:23 +0000
Date: Mon, 15 Dec 2025 11:55:21 +0000
From: Gary Guo <gary@garyguo.net>
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH v6] rust: add new macro for common bitmap operations
Message-ID: <20251215115521.1c85fe23.gary@garyguo.net>
In-Reply-To: <20251205-feat-add-bitmask-macro-v6-1-31fbbf14b15a@gmail.com>
References: <20251205-feat-add-bitmask-macro-v6-1-31fbbf14b15a@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::17) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB1846:EE_
X-MS-Office365-Filtering-Correlation-Id: 1388f0f1-044e-4bb7-51cd-08de3bd0d3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qx0MQUA34AN/0a2Eb3+OYxzemBTeYhQ52p26rB5AkKAH+huQw/4uA/Cbevt2?=
 =?us-ascii?Q?KhzmGrzS7lW9MM7wdl0UV1KnH7CcXm7nPlAKh42sZxUAhM9KvIGvHSaMRHfk?=
 =?us-ascii?Q?m7UbywulQCn36TbePDC9+Lqqa+3Qtenf2Aho4MHOTpLIeIPT1xrW37Yo7w6N?=
 =?us-ascii?Q?vrUtO/12Ca6+yZOl2VYwjJgTvVq498i6B6bbNranuRawBPr0y8varQhe6JG2?=
 =?us-ascii?Q?NW5ieaotiJoKllbBpD8kH/YYJaXJ7G22oEmtqvisQtIytPr3QpeY7q664Owe?=
 =?us-ascii?Q?7xoTnV6pcZt+djkCCSyAN1uCeCKdFWtEVV5Wp5pnkurVu3TB6PgCR2rp4qaY?=
 =?us-ascii?Q?kTZkrP6eWYnZA5B1DYloAVjlJKs9jLxEdMdH7ojHYPWr9mLo7XGBVfgb9BDN?=
 =?us-ascii?Q?+3ZtHtOyCkSM1uD+sZNiICxHA+UlQr1BN+37Q29pi8uhiy4Ui0PzTCjKj87x?=
 =?us-ascii?Q?AWYXD24gKKCVA4lqZfRz0O1JrgXrAnveZtgpb1TZXqjPXHspyeDyHjRfn483?=
 =?us-ascii?Q?WSjehCWB4jGbNrOjo3vNFvon7Nxclqb66uQiImhWvpfpHXLtiTJWeXKGnLwT?=
 =?us-ascii?Q?PJ+jhka7IBQHeYG9Sv1OslMHuk6QdOrIbHXnaWoikuifQrDaAlHQQjrEQq4L?=
 =?us-ascii?Q?XXJ8hLMUVy/UhCO6ub9Uz3PH7Iv08drcPoHvejUTYOP2Gqjf7UvS+Gqju2/h?=
 =?us-ascii?Q?i17loaftKAyPRXvpUbvMs6Tz1+NgS610yom0erlgzdWM6E4Y6x0HkjFDr8aY?=
 =?us-ascii?Q?Zu0BLkqCNpYGWaDIA7ENE4lERoSYU7zALQ/gHzQfs12dv4Xb1OUBLuTdmawB?=
 =?us-ascii?Q?9QgfVdC/c/8xVoer6VukQ26vFrov58OsSKP7e8rgQ/rZwDnjFW8rvTDxol7a?=
 =?us-ascii?Q?xYIRjGsogQStajU7rRRy7D0X+Jrnbqn5q8KqOUGDJlW0r/AHu8UtunjjBnNj?=
 =?us-ascii?Q?996mDRfxjx4ElC6OqWFqJyJ8lqxOdshoJnmGfGKoEhJ1Bwmjc/w7twTym6Hb?=
 =?us-ascii?Q?7TJE+FRNMIbPfPvgDGm83KmaeNx3FlN1WG7HDCYFwnBj/PsRol6vl29fhgF2?=
 =?us-ascii?Q?sdSw6cnm/ZPCjyhmLcm0rdjGmhe/lILlPCxnbDdo69SXbCjwuV8StIdRezjo?=
 =?us-ascii?Q?2CDdmfK9zoPLgKqHk0OEgzh/93Rs3mO+1H1Y/kTthpZgS8IIyuxdDV3Xrxtk?=
 =?us-ascii?Q?fozmFSsOr924r+RQJcmIsv/lauOvGPPSApEwTOiDNU5gBl27Nfi0BeFFZyDM?=
 =?us-ascii?Q?X7cLQeZFn90N9mLan9ldH5amBBDmCthp+wvlbU4I4ax3/WHcx/0cI8MprrmY?=
 =?us-ascii?Q?AIPVdEgtWt4VEW38zlIUhoUVbaN4ghYJDshN75ExZV3I7M/ZQHxZVi5TMshm?=
 =?us-ascii?Q?u9DZfYxFVVwcMSOTXzOE1veitYwiN/S+kAXm+Oy+HKrDTY7h5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G7U9ajGdXYxUoThDF9RiP0Ohg/mjeVHj5veLa+XxI7z+ChmZutgbI4JLxlhp?=
 =?us-ascii?Q?iBHTo6p1eVJylH6fHo7uqxSOnk9pkQZGOqp6K+ye5cn3Gpv2C/VnTVWt+dgb?=
 =?us-ascii?Q?i8++JMHattiU1EuEEoN1eM9wToypLVM6XYtBu8qfYpss/DpQiqhRlYtOyGwj?=
 =?us-ascii?Q?JJph/jUKL9iMlYwCf6CoN5EZQ8RpYHVLx/SkV7nxQ0Qkk+PdNW+6HCfqqtx8?=
 =?us-ascii?Q?zfR3GmdNiFqydf/tK0aQQ+D8PMJyVUAqVy+rrsPlhhq3h56TjmwbH6yuYQRc?=
 =?us-ascii?Q?MO6J8WgejLSZD4lV11fvuYooNEbMuo4bktcJWR7oJaoHx6WIAMq+P1dt59/7?=
 =?us-ascii?Q?psE641yhJ6nAfhozGQGRpMKFnQL4R63HffTpFiJgUTIi9SEAhACKxb19ptG7?=
 =?us-ascii?Q?nmZiuqo1FodIwdx6osk9Zl+kTw4qETTSznwDFcIv5rB5DZjByNJ2uGwMmieS?=
 =?us-ascii?Q?Rl/4Aos1BYK5xuFIF4nfAZmvAal8xIt088NM1i8C3Vks0CeMNYLETj5AO/Kz?=
 =?us-ascii?Q?FcbO9XvQGY4EWK7XfagzSScsVSFQXHdIUOvBo9nOF3gu+dkDDfmHpK/DOXC3?=
 =?us-ascii?Q?mQJXcekMXafe/DU6FAuID8nzGU0rg+IOblOeYzEITorvrnuE7ah+zeBL2RqK?=
 =?us-ascii?Q?XZe/zrMrPbh5vYnZmnDo867oPnUx/Hg34V2ulJPeWGcvJbso9fZkB6JZuG6o?=
 =?us-ascii?Q?6fvmvz+zJRUsst9gprL7it5GIE1qiAVc/I/w7ZexbxU433bF5XuxeqI7mvv2?=
 =?us-ascii?Q?Ig1EOUT3jfWxFqiXUbAitkj/E1Ch5YiA6aujQeFNvbGpR3axDe7foPmJKdCV?=
 =?us-ascii?Q?ahW+JKzQQJjV7hCPo6s9rRCXwK3z1kqIaigSTErZHV9qbKfcxOVixJy3o9kI?=
 =?us-ascii?Q?Pu6PgsuqGb81HurAxbSbSf8tf5tHqVHnvR/2ssmFWgTpI5DwklU4NOrqlwvX?=
 =?us-ascii?Q?PNcstl2jOJUpC3qeF+gBfpRCptC4Tc4Wvm670+gTibol+Qy0GBADabyByzBS?=
 =?us-ascii?Q?JVq214VoWd+bnCW5QHQFLuKQO4EDde+wrd02BloVSjxn+WrFSrnlKzpnsnx+?=
 =?us-ascii?Q?/Ld6y9DiA2DWUPB3nZXrJF0kSoXGx/HLefjzzAIxfc3Ov7bBxWgoXc4csF44?=
 =?us-ascii?Q?1S33PHEpRRXljYwdXVH0fxMapNYFokKrXHocoCG3M5h9eb0aOg/o/wfJCkQv?=
 =?us-ascii?Q?gYhS9i+v8jaSrLTcgSxCkYdnbi/VKp+iIp7Yg1ruO5Qt3Ka5gzZ3P+tLNXov?=
 =?us-ascii?Q?eU8d6P9HAO4a9BDRx4PMPS3DIHBB+xXQhqF7Codov+sdbDZz7WKm3Qsp4wJn?=
 =?us-ascii?Q?kQWTyL2BTqlu1cu5Z27gnpMeVFTxuV1J6f98RInx0Q8Mqi//EVJ47TsPwr5h?=
 =?us-ascii?Q?uXh/ptQevFjKuYtAUzbxIBHseSKU61yuHe5AoL0JeA0jaB0lIATz8nQpdNP9?=
 =?us-ascii?Q?5jPIJD6h2ZxpdOlaa9dUU1vk7Au2+wMF/9VPf9Is2rRPw2TTTr2xfw1jzPxb?=
 =?us-ascii?Q?+a+5qtRT7Fg2Xep9DnH77SpsJredgF5/fYBf8tK/0CK6ZDxKsn5sA88kklNE?=
 =?us-ascii?Q?K0FnnV/BrikpB+x6oUE3GyxaF70lxEWCTSNE6WCmEHvf2desLv/zaJ1pitkj?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1388f0f1-044e-4bb7-51cd-08de3bd0d3ef
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:55:22.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQASX1n+7TeRzCQEcdyEozOylO20mpsj+mgOL3Q/03uAnQGuhc9GULD0NuVrT6WPvdbrtpGofuoCiXA/j3WkSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1846

On Fri, 05 Dec 2025 07:15:17 -0300
Filipe Xavier <felipeaggger@gmail.com> wrote:

> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for BitAnd, BitOr, contains and etc.
> 
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and upcoming GPU drivers.
> 
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Lyude Paul <lyude@redhat.com>
> ---
> Changes in v6:
> - New methods: add new methods contains_any and contains_all.
> - Link to v5: https://lore.kernel.org/r/20251109-feat-add-bitmask-macro-v5-1-9d911b207ef4@gmail.com
> 
> Changes in v5:
> - Docs: improve macro documentation.
> - Link to v4: https://lore.kernel.org/r/20251026-feat-add-bitmask-macro-v4-1-e1b59b4762bc@gmail.com
> 
> Changes in v4:
> - Use enum: changed flag type from struct to enum.
> - Minor fix: airect casting (flag as $ty) instead of field access (.0).
> - Link to v3: https://lore.kernel.org/r/20250411-feat-add-bitmask-macro-v3-1-187bd3e4a03e@gmail.com
> 
> Changes in v3:
> - New Feat: added support to declare flags inside macro use.
> - Minor fixes: used absolute paths to refer to items, fix rustdoc and fix example cases.
> - Link to v2: https://lore.kernel.org/r/20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f@gmail.com
> 
> Changes in v2:
> - rename: change macro and file name to impl_flags.
> - negation sign: change char for negation to `!`. 
> - transpose docs: add support to transpose user provided docs.
> - visibility: add support to use user defined visibility.
> - operations: add new operations for flag, 
> to support use between bit and bitmap, eg: flag & flags.
> - code style: small fixes to remove warnings.
> - Link to v1: https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com
> ---
>  rust/kernel/impl_flags.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs        |   2 +
>  rust/kernel/prelude.rs    |   1 +
>  3 files changed, 246 insertions(+)
> 
> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..aff6f14bc2f6097e78ba21bb13d124ff999b376a
> --- /dev/null
> +++ b/rust/kernel/impl_flags.rs
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/// Common helper for declaring bitflag and bitmask types.
> +///
> +/// This macro handles:
> +/// - A struct representing a bitmask, and an enumerator representing bitflags which
> +/// may be used in the aforementioned bitmask.
> +/// - Implementations of common bitmap op. ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
> +/// - Utility methods such as `.contains()` to check flags.
> +///
> +/// # Examples
> +///
> +/// Defining and using impl_flags:
> +///
> +/// ```
> +/// use kernel::impl_flags;
> +///
> +/// impl_flags!(
> +///     /// Represents multiple permissions.
> +///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> +///     pub struct Permissions(u32);
> +///     /// Represents a single permission.
> +///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +///     pub enum Permission {
> +///         Read    = 1 << 0,
> +///         Write   = 1 << 1,
> +///         Execute = 1 << 2,
> +///     }
> +/// );
> +///
> +/// // Combine multiple permissions using operation OR (`|`).
> +/// let read_write: Permissions = Permission::Read | Permission::Write;
> +///
> +/// assert!(read_write.contains(Permission::Read));
> +/// assert!(read_write.contains(Permission::Write));
> +/// assert!(!read_write.contains(Permission::Execute));
> +/// assert!(read_write.contains_any(Permission::Read | Permission::Execute));
> +/// assert!(read_write.contains_all(Permission::Read | Permission::Write));
> +///
> +/// // Removing a permission with operation AND (`&`).
> +/// let read_only: Permissions = read_write & Permission::Read;
> +/// assert!(read_only.contains(Permission::Read));
> +/// assert!(!read_only.contains(Permission::Write));
> +///
> +/// // Toggling permissions with XOR (`^`).
> +/// let toggled: Permissions = read_only ^ Permission::Read;
> +/// assert!(!toggled.contains(Permission::Read));
> +///
> +/// // Inverting permissions with negation (`!`).
> +/// let negated = !read_only;
> +/// assert!(negated.contains(Permission::Write));

Your implementation of `!` does not specify whether it may contain bit
flags that are not defined. In this example, `negated` contains bit 3~31
as well despite not defined anywhere. Same for `^` implementation.

AFAIK this is a similar behaviour to bitflags crate v1 and in v2 they're
changing the impl to unset unknown flags. For a bitflags that's only ever
used in the driver itself, either behaviour makes sense, but it might be a
safer approach to unset all unknown flags in flag operations.

bitflags 2.x provides a `_ = !0` approach to mark all bits as known.

(Yes I know you currently do not expose any methods to get raw values, but
we'll either have that in the future, or currently you can do `flags.0`
directly in the same module)

Best,
Gary
