Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022092.outbound.protection.outlook.com [52.101.96.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5B38DFC
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 22:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728166927; cv=fail; b=UFft0ZMyGAT9xQwegP1WNUfDlljagk2Z4cPCxgCZi4wZyZj07a0lSdzktZIXGtLxRuaZDs+nUHF7UZP7mS8QkD2PO1+P+drSkUTlmlc5xDMSVk7V/pWXe5JJLRCfuLYDKI2YulT+Nc6pu4d16DZfgh/bIYO30j9Itrzji6a9Pl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728166927; c=relaxed/simple;
	bh=+xcVU2yPlph+Gg8f9Xst3pJWN7Esmg8ExktD/NTPxQs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TJOM7pK90uAW/FEDFFiXfHG5h5VmafFyjeVdGZK//HhQKifH1fpNSEYSrOQER+C/643vPe/OTwHaJwDuheIWXVn3v/O3Mq5UpdcTFLd2uOHuorVGboaFz0WsjTx2iouWsS7PSGRgvQoFv80w2LOw3BS4SjejOtpEezIHRkBtCrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=teYkAsJt; arc=fail smtp.client-ip=52.101.96.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="teYkAsJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/uwDe+cntBQOaA4hXjYvhdqaatJIv5yZqlPGdyBoYa3MJkmyjphBi0pL0gzGAdRiRd+xxvH+mlBn8OCBIGKeCCF9EKwhQYnif4wZssjzqDpSZyZJ5/xa1rP8rsijvejN7tsfKrE4YCuHr6HN4/tFvn2e3YVf5GCqxhLNfoiHZqFH0eVc56sszF5jR45MLRyI5U742ApyElvN7J0K+FybFYq3sz/IHWbNKn4rVDgsbUqfqOqWyooFse4tp9jDgu9BPhsyZ4ni7OkQAg3++7MObtYOmUqgwVafdSD+pMOtwd/jhX8bZwODxHP90qiw3SmNftJTe7sVyE+TyIL0wNg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NDSHskXbse0AU5aXDz+tP0oFFNpcxkdQJASke1f1P4=;
 b=usBSMugFqc1nnmtLpE1fjbKfMH6CmS54qvcJxig0MrFR7cH9QlaFif0aOtPdoPmVs4yL4qnQG1I9j9uzKncYHluYo4ibSaDQIBU9lbjb1ZBzF3nEwSCAN5G3dmuMQiYYAy4wJmcI0YNhumYiS1lplDF4Q1XJgTBwru55zVyzC587Uk34QkqTE/HxUwYZ5+1GFTsnIwKUw3vVZoNezOpD2gDqM3E1Qbp6UmJlwvhP4lniMRalta39sgUaC8If5YXTGpBr1W2PFqcu2+yvEOcBxRuQsz7T2Rae3RTT77+QFEWQG2em4FjanLTuMig4bP1JKeo7aTjixzQySKa4zH9ouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NDSHskXbse0AU5aXDz+tP0oFFNpcxkdQJASke1f1P4=;
 b=teYkAsJtt3IYn9dU6rmBx1dLtn5ZJCLuMSsUH1LyEIP03tZud/fO871YqY05P4AqVHpteGiggdJlOLAKcfnJaqXda3B2FmJwgzTSHQQ+aehcUomfszYC2byXpjUJHcvUmHZNIZmfZ0fcv2Uf0+X8hxAIFa0Qk8bTbdV1y6a8/fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO6P265MB6874.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:326::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sat, 5 Oct
 2024 22:22:00 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.8026.019; Sat, 5 Oct 2024
 22:22:00 +0000
Date: Sat, 5 Oct 2024 23:21:55 +0100
From: Gary Guo <gary@garyguo.net>
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Benno Lossin <benno.lossin@proton.me>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: optimize error type to use nonzero
Message-ID: <20241005232155.0e8df070.gary@garyguo.net>
In-Reply-To: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
References: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO6P265MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f15b9e-9430-46a5-0e63-08dce58c21a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o4eylScAL4pIljBUvJ/X0tGpRjtXqOwqnycL4XPY5dS2HqSvbI1avudVSLDS?=
 =?us-ascii?Q?3xuV7xWki3ea9Lo53Sn7jokF7YAfd1hGUj9p1o+QyG13O+YxooBOGG44pTIk?=
 =?us-ascii?Q?psZ5dBF5ln2ZqVs1GMm7RZshuFnUI801Qmr8uPOevkkw7PZsV2NU1tK4ZZdv?=
 =?us-ascii?Q?u5Xu7ZBLa4QRjCTxj28Vs6PU4EqXtvrt4ugQyKVEmDIQVkbSC6CFY2/XGwz+?=
 =?us-ascii?Q?vyXm+LqSrK/0SJXyEu8Kx+3nXo35dnt2othc8lj3Ut8CtyFKKZ4mfMQSCvLl?=
 =?us-ascii?Q?JhWSClZrDmaU15Pn6+tUAQbCRfLX6Lcyx3jwmMHV295ZmMzWWYe4Il4rknfo?=
 =?us-ascii?Q?cklIBKbcHsOmTP6nM9QGGUPrTIVgp8+nrjF9jWcuKJETJ3pq/ISPKqQUItvD?=
 =?us-ascii?Q?kc7bGJEGBAtFvv4Z0GVHo38SOWTZWWRF3CyPsKxpscKJ9TQPF/PCjk+xxM+/?=
 =?us-ascii?Q?3yH5naq7Z/4Gq+bZqI4Jb2Y+7T5oxw/d2vVc+6jjmHekyTo8DqXr8nxr3cVL?=
 =?us-ascii?Q?mxwCajvhrgTaTYprszdlaXkzlzovBIsJM4C9bPtpFu5j79fFkZrZySkZaSBl?=
 =?us-ascii?Q?9NCjXTS/FX54kL7EvVJrYMlT0HRz8aA4FcI9XFlfrgKosXHv6LY/lEfelvC5?=
 =?us-ascii?Q?RM/veNp+BqfT4xmpJzRWxnfILq9DbnzM1Y8OZFzyrddvx+R0OUC59W23RsCh?=
 =?us-ascii?Q?LTwQMyhr9TPpmY1lYd8J7jL1ueP0YzEz6zdDKVoAYIzJhGXgkfANSIKmHno8?=
 =?us-ascii?Q?uX5s/65ic8YNwB9UezfjGKeKA8rF9YJeavzAPgznKrkva/GgX0c+3URJbfQX?=
 =?us-ascii?Q?ieuHyNvvY4iwySyfaF/WjNx2LPUNJz7pPseslRKqUiYF9LlozQbcY3eJ3VrL?=
 =?us-ascii?Q?n9DK5YRKag22rE3KMT92VX+BABsyz63AZJTk+NHdaRP+MMn06PXsvDiWd8cn?=
 =?us-ascii?Q?Cs1rFhAovGh+fkwj2DJHvOlJwtySCE8HY+NjVCtPuT8yo+VrJWmWRKQfoByY?=
 =?us-ascii?Q?FOHEZYmzS0TwASVb/y7fdR+1crpLlqrm1ZH2iGKlTSO18ocYxfvPxEt/XDdx?=
 =?us-ascii?Q?Icvy1AWgsaJsi6Zc1KRu24ZY8AQpoHNuKPCpbRSL4WiFcpHHWy+SzwV4yUp/?=
 =?us-ascii?Q?lylLrgRWwJFTKI0DityapF4kDthe4p48nOjOuOtqsdc8eLiPiHXKrdyIjQkn?=
 =?us-ascii?Q?JDTvCIxTcBdSRxHBhYKxLZ22zf1HnoeXdP19FJP8ROJk5o9QCitU8oj89LvF?=
 =?us-ascii?Q?Jkbduq1JVkc2NaBs11cw/b6Hk+TAsJNkkoJCU4Iy5g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BnRO0dqRy4nIPkcszsZMM6Aw3FH+furBO60GY6gAac9VHELerq2/p+dBS91O?=
 =?us-ascii?Q?FfaxITNVyKfcoyVKHHk7n9NLFMKnHCsApY0doupIzLOFCwdT4I2zuBfvDWVP?=
 =?us-ascii?Q?Lbk/igYRcFKLfmbSZ6KZxLOMrhDPuvySSXo8IRxPnB/ynY/2ioOO3H+BpxAT?=
 =?us-ascii?Q?CjjfU5ZV/f3QudYuTOUVxKxMyWtUrnp+n2ehVFOROVcKW5nYEQifCGjommTB?=
 =?us-ascii?Q?uf7UPkKZIlImtXhpfI9jGd6WpU8+XdZuUon+u1kOTqL7e33sSHXfE4/X5YZ7?=
 =?us-ascii?Q?fBrmOVzgUcgK1d8cDdYRYK+HarCyHsQsxmknMcl+2kQf/9DfFKHwBRRGwjH6?=
 =?us-ascii?Q?BPSnvbwHvNd91waLPOHK72XfvlYYUzXdfkORHZYp+5J5nfb4f06kbFqIkbmt?=
 =?us-ascii?Q?5bcFuLv5y2towFwlVt3YBIJnB3MROwQNOBiVBdoHX8jZFN/vk4epM3jJ3WZj?=
 =?us-ascii?Q?r4nqgtbsOqexUXULeUuQ0ODwF9cxpt1o8MtLSsbo45g2KHV6Otj8euJ8kK5c?=
 =?us-ascii?Q?uUqcjFbA+wMgop7VGnv5GllOKDu16q9FqA09NPrFw0iAwDKNFz8GacGGJCKK?=
 =?us-ascii?Q?RMM3IcMgE3GQreHaP1BMMndA+TNS5PwCDgPYgo4u1YXza/CDGRMYMfKjA2xC?=
 =?us-ascii?Q?35C1qQrSxo/ZF2OMs8f+OhD96GXOYoekRvasYEhNw1KAhqp//IzZc2crN/r4?=
 =?us-ascii?Q?ZOHFd35bdttkNfIkpTfzmCPfizyxJJUGSSRca1OjK6TU4zUa0Hw0apnPIzMc?=
 =?us-ascii?Q?DnbH84CgkB7YJeOYlpwj8rah9C91Zh8KI0k4IQ9QLTKGBuAHVlSjoj/uekA9?=
 =?us-ascii?Q?pWxJIYbKqy0bmPt8q9ZeiQEr1M7YwoXidxZkeem5XcPhr3WpGUDayHSkNq4A?=
 =?us-ascii?Q?Et7j6dHgStGccoqSbMOL3r8Hr0xHcm6RpuG7oqoKT5NeQL4CJhiPQOUIK54z?=
 =?us-ascii?Q?5y+3ZnZ0NgfQR9Ot+2IPnq+0Z8Q25UK9PqkozO1ffYQgywgA6+DVRWfqmGo5?=
 =?us-ascii?Q?XeQ929S/KhbEWXoYTKycXH/loty6JNLtYTzx381+YvCz/phfeKuB8KU7QdEb?=
 =?us-ascii?Q?xCPdMgZDACb4kmlTFUY63zU9H3CETkrKMECMMcHt/JtlB/FwbBImzjdlU4FB?=
 =?us-ascii?Q?syERM1ll3FlJjGkj7u27vDi2SrdY2h7JUnXqob+SZ+K/C4xuSN26UJwLR3mO?=
 =?us-ascii?Q?UTmbuw6G7RkT67WszFKQPvM+t/2XTpWMIZVE3GnTcykxRVdt9f1iaiTKUikQ?=
 =?us-ascii?Q?yDipKihFEfQkCYSpGSflbjKgZhU0B5ve4VvMryTE8QOApl1zQR7+fTfyRw4n?=
 =?us-ascii?Q?hC/PyyuwPnP5B42OW1xZhrEppopQQvusGmXcjyGi42eVoA38N6pW8m7EJJT5?=
 =?us-ascii?Q?QRq+49oSFakPl2D0papiRyBqpn0p/bH/dEHPKolsIk3rb/0p/8Vv6mMMzj/O?=
 =?us-ascii?Q?M8V/lq8+z+iGLacG1xPpd9t60ghTGKf/TsFJjOMzsc3wUiwXgVcv5TvYRiz4?=
 =?us-ascii?Q?6yaUscnSmA5GOyev+hRJp+bWSsfDtUvn9289OEs+PENb2OuvyeK8ho3GMR+B?=
 =?us-ascii?Q?No/SP5B5ObCJ2gSvJib9eaKxYVXQ+K3+Ty/vJG3/FYQp57g+ZlwJqaBLKufe?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f15b9e-9430-46a5-0e63-08dce58c21a7
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2024 22:22:00.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KjpLMZ11sDyCzZei54EyykOguKxTnG1Xy5+1fgzQrelwt6+BDIZWogbijQ4b24BzG0OeeujEldsjw+/W7BwEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6874

On Sat, 5 Oct 2024 19:51:23 +0000
Filipe Xavier <felipe_life@live.com> wrote:

> Optimize `Result<(), Error>` size by changing `Error` type to 
> `NonZero*` for niche optimization.
> 
> This reduces the space used by the `Result` type, as the `NonZero*` 
> type enables the compiler to apply more efficient memory layout.
> For example, the `Result<(), Error>` changes size from 8 to 4 bytes.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1120
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

It seems that we have interchangably use c_int with i32 all over the
places in the code. Probably worth just replacing these `c_int` with
i32, given that this always hold in the kernel, and our code already
assumes so. No need to change this for this patch, given that this is
about existing code (although you added one more instance).

Best,
Gary

> ---
> Changes in v4:
> - Created const fn try_from_errno to use on macro.
> - Adjusted macro declare_err to use try_from_errno and remain safe.
> Link to v3: https://lore.kernel.org/rust-for-linux/BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com/
> 
> Changes in v3:
> - Adjusted safety comment of function from_errno.
> - Adjusted macro declare_err to check if error code is valid and 
>   its safety comment fixed.
> Link to v2: https://lore.kernel.org/rust-for-linux/BL0PR02MB49141A172569679932EBA20CE9712@BL0PR02MB4914.namprd02.prod.outlook.com/
> 
> Changes in v2:
> - Adjusted on commit message.
> - Added safety comment on macro.
> - Reverted signature of function from_errno.
> - Removed explicit type on function to_ptr.
> Link to v1: https://lore.kernel.org/rust-for-linux/BL0PR02MB49142BDF011175DADD6E79D0E9702@BL0PR02MB4914.namprd02.prod.outlook.com/
> 
>  rust/kernel/error.rs | 38 +++++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index d7965ded2973..36015ed7b258 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -9,6 +9,7 @@
>  use alloc::alloc::LayoutError;
>  
>  use core::fmt;
> +use core::num::NonZeroI32;
>  use core::num::TryFromIntError;
>  use core::str::Utf8Error;
>  
> @@ -20,7 +21,12 @@ macro_rules! declare_err {
>              $(
>              #[doc = $doc]
>              )*
> -            pub const $err: super::Error = super::Error(-(crate::bindings::$err as i32));
> +            pub const $err: super::Error = {
> +                match super::Error::try_from_errno(-(crate::bindings::$err as i32)) {
> +                    Some(err) => err,
> +                    None => panic!("Invalid errno in declare_err!"),
> +                }
> +            };
>          };
>      }
>  
> @@ -88,7 +94,7 @@ macro_rules! declare_err {
>  ///
>  /// The value is a valid `errno` (i.e. `>= -MAX_ERRNO && < 0`).
>  #[derive(Clone, Copy, PartialEq, Eq)]
> -pub struct Error(core::ffi::c_int);
> +pub struct Error(NonZeroI32);
>  
>  impl Error {
>      /// Creates an [`Error`] from a kernel error code.
> @@ -107,7 +113,20 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {
>  
>          // INVARIANT: The check above ensures the type invariant
>          // will hold.
> -        Error(errno)
> +        // SAFETY: `errno` is checked above to be in a valid range.
> +        unsafe { Error::from_errno_unchecked(errno) }
> +    }
> +
> +    /// Creates an [`Error`] from a kernel error code.
> +    ///
> +    /// Returns `None` if `errno` is out-of-range.
> +    const fn try_from_errno(errno: core::ffi::c_int) -> Option<Error> {

^ this was what I was referring. We take a c_int but then compare it
with an i32.

> +        if errno < -(bindings::MAX_ERRNO as i32) || errno >= 0 {
> +            return None;
> +        }
> +
> +        // SAFETY: `errno` is checked above to be in a valid range.
> +        Some(unsafe { Error::from_errno_unchecked(errno) })
>      }
>  
>      /// Creates an [`Error`] from a kernel error code.
> @@ -115,21 +134,22 @@ pub fn from_errno(errno: core::ffi::c_int) -> Error {
>      /// # Safety
>      ///
>      /// `errno` must be within error code range (i.e. `>= -MAX_ERRNO && < 0`).
> -    unsafe fn from_errno_unchecked(errno: core::ffi::c_int) -> Error {
> +    const unsafe fn from_errno_unchecked(errno: core::ffi::c_int) -> Error {
>          // INVARIANT: The contract ensures the type invariant
>          // will hold.
> -        Error(errno)
> +        // SAFETY: The caller guarantees `errno` is non-zero.
> +        Error(unsafe { NonZeroI32::new_unchecked(errno) })
>      }
>  
>      /// Returns the kernel error code.
>      pub fn to_errno(self) -> core::ffi::c_int {
> -        self.0
> +        self.0.get()
>      }
>  
>      #[cfg(CONFIG_BLOCK)]
>      pub(crate) fn to_blk_status(self) -> bindings::blk_status_t {
>          // SAFETY: `self.0` is a valid error due to its invariant.
> -        unsafe { bindings::errno_to_blk_status(self.0) }
> +        unsafe { bindings::errno_to_blk_status(self.0.get()) }
>      }
>  
>      /// Returns the error encoded as a pointer.
> @@ -137,7 +157,7 @@ pub fn to_ptr<T>(self) -> *mut T {
>          #[cfg_attr(target_pointer_width = "32", allow(clippy::useless_conversion))]
>          // SAFETY: `self.0` is a valid error due to its invariant.
>          unsafe {
> -            bindings::ERR_PTR(self.0.into()) as *mut _
> +            bindings::ERR_PTR(self.0.get().into()) as *mut _
>          }
>      }
>  
> @@ -145,7 +165,7 @@ pub fn to_ptr<T>(self) -> *mut T {
>      #[cfg(not(testlib))]
>      pub fn name(&self) -> Option<&'static CStr> {
>          // SAFETY: Just an FFI call, there are no extra safety requirements.
> -        let ptr = unsafe { bindings::errname(-self.0) };
> +        let ptr = unsafe { bindings::errname(-self.0.get()) };
>          if ptr.is_null() {
>              None
>          } else {

