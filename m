Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022086.outbound.protection.outlook.com [52.101.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554A5314D21;
	Mon, 15 Dec 2025 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798306; cv=fail; b=aHEjyEVMaCHsu5h1IvOcbmgxaB4gYT1ozEq5cKBjECnAmsOwHaI9PEeGfhetGXriYc/g+5MW8zZMZTEyc2jB4p5Q//V3dqVxeq3HARhe/2P78lA8fo3bmmXMZdMB6fkw+3zj6U+L0FxEU6GVgXi8bckGUTmrSHH8iEfLsx5RIUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798306; c=relaxed/simple;
	bh=xn3eVdqDwy0z+iXFgitDJgZ8EqJcAIZyoxoXU915LGo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uUoH3DVsFUXvgZepPi3/utz0ONHTokkGNyWxmXLcd4J/txmMGibKBE5ssg+NTsbuiCSAvAJaMJW75tqP9GwV7ovLwsMi7mZ+ioKEBVKcOUGSec2/gpPP5QPMYGPTO2cRTLl3aBgvtnlOTTZVhrLmjD3Pdd7GpUaukRnv05u0ikg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XXucbXTp; arc=fail smtp.client-ip=52.101.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XXucbXTp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awRITavu89hKqeucerrAFs4D0oQD8suDDOf0dNF9HmWhlAGEU6JfUoPQyBSneWtllIjSicuP62RCZ2Y+PYemZDKw+EcfqGheN0jOOQdEK4eqYTey9WI2ly73b7GU3y6K+ahj0XJBk+58cfOfYecfQEeI98pTrQ+gKgSu4trOBV0KHAamjNVc/6ePHCF2ZQAol7pCn99LryG8Drswv4jzVP+nTQD7wDN3jSUUSXtm/MmOZTxas30TzdBceTZr0PWi3EMyg0k/PouXIal5fB8g58tC12D2uL1g493hNa+5ne84z7pKpYplRgpUtHoQ3hZjjHQHzUSwcgSAL/xaMHjaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XodJ/r/nRD8qHezUDkpes51xvQbYKFjFDMBZEgVnZ8=;
 b=iVrbOOxq0nfHLWnGFIe4C4Pn9jkFoMpBs3WLtKlmsCo4chnrXWXxxQ96cfEzYjfmJ5IyNB6qurVZPxFpcOD9a1/z2J3ElV0kEYiFO6AFlJr7eUB7qG2KXiX0AGOXIM1mbN0GB8xngjCv6ZKY5TrDYvbATd+sNPnC/X1gpafFntcDQhqdWkNnSYKmrVO/SJsTIvbMs84+r2ni82p5ulsWWlOLTZNIqLesxaQAJGzRez+WuiHatHynGYae3oq5lz3DoUfyITzTJ2GFrxKPblXH5vHCcROfw/+MWmIU29FRNsWCLEJqsjwQR2amgDcNgNe9ngejyFYFF2R1wa7PUQ42pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XodJ/r/nRD8qHezUDkpes51xvQbYKFjFDMBZEgVnZ8=;
 b=XXucbXTpnJx79YKdHt0uejWe096SI6Y9eg4a8agy8AKx/O9ZbLX29ROQluLQJxR9qC6gRO1Fe6D+dT+q3VwxMAhEGnsUtREm+NjEhYa4iaTC/VBibVVxSl/xgD70f5jMqWB20OCxtOA6Xg93QNkOcEWSWKqPf5tun1vGt32VPy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB2838.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:31:40 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:31:40 +0000
Date: Mon, 15 Dec 2025 11:31:34 +0000
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
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
Message-ID: <20251215113134.233fdd1e.gary@garyguo.net>
In-Reply-To: <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
	<20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB2838:EE_
X-MS-Office365-Filtering-Correlation-Id: 66829804-5d5b-419d-32e7-08de3bcd8417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+qfXimtgNw+zOZR8GaOflB373rZnCbeXXiHHkUKlpVOu+ZN3FfwEmGqFiyzs?=
 =?us-ascii?Q?yrLxIM0rogeVUruyFTj1TeY3BIZdv59Q4PlExm7/3RmKUwoPrB4KQIBugNiI?=
 =?us-ascii?Q?Gc0JA6PPMDoapiR8Xe7iltlCARRbfDy3UUTXwPiCVZX2G/fs54ippPpMGt5t?=
 =?us-ascii?Q?NfMbrjywH76yYx9xFrLEHYwbCNO9xV5YUklR7V70JJNvhRo75ISJUQPJOQdX?=
 =?us-ascii?Q?3OsMMrG8orlS3OGqyCmIKszc+rLStYqKj26O1VdbTsVaoQF3gDlsDO6vjsGB?=
 =?us-ascii?Q?ZUyBmyl8jMN7e/Z8fhEEy2nAZVO8Ak3fVeXzLWNzycMZxja1WuzkL7cHni0w?=
 =?us-ascii?Q?nPro58/hcW80aYuITrJwAcNUZ5g4JFo75tkNoN0GpI9i8H87l8hqHr4K7T0D?=
 =?us-ascii?Q?ZAkZpHm6YuNlq2gJ75Evj3p2O7lVH6w6OtwjEmae+QH62hXKnvoJZ/U6Ft5G?=
 =?us-ascii?Q?wrjLnPHRmX2owGHOtU9s3vm2oJwybpQXRoaaCm0RAINijx/6t0s+tPGPviP2?=
 =?us-ascii?Q?NlFeyxmeMwll72axLIEU8n3ut8L3tPFoXfKdcR3O/H4aVbAkMv6QmAFmXBYy?=
 =?us-ascii?Q?4W9frb9gyxtU5MQ/JhFdplYI6Fs6dMTmyqZE2h9KAhdQMlVrbq9puxazB9Ow?=
 =?us-ascii?Q?UFiAGgXG7ZG+6qVrAQBjkxW0M5ogrqUL/zYp2xnq5j/jvPt6/sb1Q2Ke2yod?=
 =?us-ascii?Q?lXOQWDt3Pbmo0m4RHebaSBJq397KkTJjACTvAmOac7AK4o1mP4+e1nJSqzXO?=
 =?us-ascii?Q?/fae9fkgPrRNhTQnBaHvBhieQbV7oknK3KyOCPZguPA1TH5cz28TQqqYkGkc?=
 =?us-ascii?Q?RNDHDCVwkAhaHDo8wnDVYHfWMdMojXb2MhHDKdxUiMnmLOwmhATjIVdTQwfn?=
 =?us-ascii?Q?EDfycAiLVgYAAASc4U+SzTjiognhV0NWGz9N412lV3vH23ju+bDY3rdpZllm?=
 =?us-ascii?Q?LJUus6i6Oo9GAkAfDM60W8/yZin5d36+IuF0mUVVf1zQFh80Zn9fhpnisRNi?=
 =?us-ascii?Q?sOrP/86bEewbR16aYzIUGbnaG7cHCyIcdcYl5gZuYjm570Y45xgqVbFJzCOC?=
 =?us-ascii?Q?FfN20X0VxVlumb1N7EVuxqx2ysk4q++r2fBOPtohpQhQIAMO/I4z7DYG44AA?=
 =?us-ascii?Q?+ILHNQwe2F/qLkrqRiJR5SaxlhdPo7r3mwgtNNZ3IIrGaW25nMLs+sWRjmyT?=
 =?us-ascii?Q?hKkkOmSkLSCLNvAUMHCkrGfkseygPGp0ehEMK7yFCFms1TpnXVmQIdGWBicz?=
 =?us-ascii?Q?Y1lSrlp9i7UAAWpRWlTXO+ZE0qXmKxyO8vWSbGP0djIETIuhJNHKV7rfRtgG?=
 =?us-ascii?Q?AuOkK10hF0I2mxDRZsvT7g6YEHAw1QCGJd6CUDZvM+FDQsK0dKJ+hpetuUzp?=
 =?us-ascii?Q?zpgDXWI5oy5TVofjQB07yxPGcADHXEKvTku5ZQ7eTDzbmSo9nfrXlJjYZYtH?=
 =?us-ascii?Q?csPuTKEwB8sjHtleUnPYqpC+XVBvel4G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gENCG6+FnVqwvE18VSUre2o4/cN01pdd9tduUYy5LjDTiO1nqiTsRNfKqyfo?=
 =?us-ascii?Q?TagjjajvaGO7dE6hjAyj0/7cPpahfPnm5VZp7u7TGl3yBWEBZn3a13qfO8Cj?=
 =?us-ascii?Q?lZg2EaZkPD0mwoTJqsv91qY+ECsaHXIuvPS8fjHZkTH71oORuQdmAvTWjGA0?=
 =?us-ascii?Q?Jrz8rCBQA8+09QSg0PkSID7zUbWqxnn/gIRmBNTYFOJbvbnDv6VFlLtLcaRa?=
 =?us-ascii?Q?vq7ips5Ie+phi0t/i3RzsQHy9ZoFZtZxad1YPDYNWyQ9OoZhRF4EMu7lWL44?=
 =?us-ascii?Q?DaRHWHVNktNG/eTFiQhPbdSauySlIk4Ws//9r1c/cT3RPaei2Ox2e8bL941g?=
 =?us-ascii?Q?1KaK/B4mbpfcYYL0jntBA0O9kDvOF6eqLQkWzPi61qv06pEunC5FVkYJ/gIk?=
 =?us-ascii?Q?cVJ8xxkoJJMnHXZvowPk1BhTehmG0EwslwrC5AOQAKkpcYIyL/WDm3qVmufY?=
 =?us-ascii?Q?miNXEFEUM/d/ZiXFGhqk4bL6ZZeBYdsYjvc6zYNd/y53jYF/csFHkZJBG7+G?=
 =?us-ascii?Q?Ss8QdqeJImhE4AevxPuGi+qBJ48n71GoqlSjoOBKIW2G8KUEFH8af/BjDBDK?=
 =?us-ascii?Q?cuZ0257kepTb6mETdSCotiCNzVV9DooUBhvW0dyh6OHic/O5FU9taKeoxZLI?=
 =?us-ascii?Q?Iy6csb7eu7yzwGXtpfEbfqFAxFOcVMHyuaqweQSHOxQ8hQIUpvOapIKp40vp?=
 =?us-ascii?Q?43TnJ90FfvFLa1d2za+U1ByNu9cSFVPOnVPLm/vyGVbQy3a0s7tSJcZICcQ4?=
 =?us-ascii?Q?6fAz4nYQOvUVT6nT+PPGjHxcaByWl1YYlv5JqvG7YnVC94/MwFf5OILHdpsQ?=
 =?us-ascii?Q?S4JM2G9WAd4FfR4eWZz831pGwtxOg9W9U1/plVZ1U/U3+maMbBI+gTe4mN9x?=
 =?us-ascii?Q?kxLZ/yjIBNMrxGW539vwLty4LIsSU4gjxFEJvUai3wycGfk20QVw1A7OHDwp?=
 =?us-ascii?Q?NhD4fFMlGrmw6MHHmslFvYTVH9QwxdbKxWBZlloaVML4wS3vpssH/sdsP1Oq?=
 =?us-ascii?Q?HX3/eMGGG7qj3hpLFAM9nTwC4c/+EnDejUeuarm3lHCxAKH4E7KsICqPbfTq?=
 =?us-ascii?Q?xIdN5pizbO9L24k8VWRtVWkSZRnJpN6j7LQRG1yAOCSgAcKjJrI92xClm2KP?=
 =?us-ascii?Q?vLoMnNU6s9h0IzpmaXzziLPy+ynpfydAo6zIqlxt6ynJV7X5m8gl6LjhLN/S?=
 =?us-ascii?Q?exqbFTINYdbIHWri/7H7O6a1avlxvFtBNZLHYMqIhY93iQ5ZU5ZtxYCHgeAr?=
 =?us-ascii?Q?jP6XtBvWLEG2GiAQ9UCMmfRbMV8Vp5riLi2b59WJdcg/P3f72j7pIdezJlqr?=
 =?us-ascii?Q?4XM0XDevrZ02ejA9eWOOmUVSFY4Vkjtvy2KZ8S17mTSFEgvtQ7sxOnheuOfS?=
 =?us-ascii?Q?l1AgerflQvjUZFlXdQmKMFMSQPZuwUoSHCkfr/RSlTkAMvDW4b+XoRCzipm3?=
 =?us-ascii?Q?A0wruWGqwGrKMVn1jDn0njWwMdHxu0ZCj81PkCe3bjbacw0borCI65D6tF4y?=
 =?us-ascii?Q?Iu6R3GD15rJdtVYygsnMc1pOq5WkCKYcROoa8QcJ5FMN8fCrPBrOWdiq7URF?=
 =?us-ascii?Q?lR0xfuGW8jBikpzhfT/b/HXLwyWT5zAP4Dya6pVxh+VrzBsMe3xhbVv605yR?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 66829804-5d5b-419d-32e7-08de3bcd8417
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:31:40.5150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNhEZkfuVOXQYDu0089G/MkzbkxCjB6IwC+8w8nkRsYiaj+5uKgyogdgNiGt+bNjqHKTe44cICkw8P/k/CxUKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2838

On Mon, 15 Dec 2025 14:49:09 +0900
Alexandre Courbot <acourbot@nvidia.com> wrote:

> This is useful when using types that may or may not be empty in generic
> code relying on these traits. It is also safe because technically a
> no-op.
> 
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/transmute.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index be5dbf3829e2..5711580c9f9b 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -170,6 +170,10 @@ macro_rules! impl_frombytes {
>  }
>  
>  impl_frombytes! {
> +    // SAFETY: Inhabited ZSTs only have one possible bit pattern, and these two have no invariant.
> +    (),
> +    {<T>} core::marker::PhantomData<T>,
> +
>      // SAFETY: All bit patterns are acceptable values of the types below.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> @@ -230,6 +234,10 @@ macro_rules! impl_asbytes {
>  }
>  
>  impl_asbytes! {
> +    // SAFETY: Inhabited ZSTs only have one possible bit pattern, and these two have no invariant.

Some nit: technically you can turn any ZST into bytes, even those with
invariants or uninhabited. So while the comment is correct, it's kinda
redundant for the object -> bytes direction :)

No change required for this patch.

Best,
Gary

> +    (),
> +    {<T>} core::marker::PhantomData<T>,
> +
>      // SAFETY: Instances of the following types have no uninitialized portions.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> 

