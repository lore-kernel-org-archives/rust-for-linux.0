Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021087.outbound.protection.outlook.com [52.101.95.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB02C3768
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027311; cv=fail; b=aoUcQcAg89yfJGRi6UgpW5vt89c7h3O+4PqNo5XFcPuqbX/GHnHCCdR9SYssdjHB3WRVm5D/KOqOOgzKSq+eZmuGiHnXW/XzyrqympJR+o4myWwJdpg9OihYbmRfwvypLMf/bSLiFhwWv94kjHn9TZex26s2q/RTNFrwpFIpfTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027311; c=relaxed/simple;
	bh=OxlvuxylgWTRk+RICkEgTAUwsaIufz0HIENaverYIfQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=AcdVi3sROAfJuN+wu1VyTdqgucAnCXvpAgU096Yb4OPE67jY9rb3kLmqE3CgXhipOvPr5fhCtWjrlLkH+mCCYZSElU8Ea71nj5vXHPXe1c9i+oSzQwo/c6E9gHXn5kA4B2kaJ5ymLvGOjDUDC7AqniEgLQsoaQNDBMZ88fg3YFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mN5W9Ggd; arc=fail smtp.client-ip=52.101.95.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mN5W9Ggd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cP7sWRidJGd8qh4OktRVZ/BpIm6sz2aO65GjL73UtilmIbr1XIBuaoj5pdxQvxKixukO766/OnuTMGwEAz+BqZj2wjE86YP8XmCvATNSGzafkhZApVbh5AcfWggePdG+wLJxF9DQwj/awrtC1/MIRScIWoQs+ubb+1EIZV88VoJjojwubbqI9acHSwG1N1o92CEs+LhnI2qG+kIiYbpPNQyBhFTMJexRo2IwFL+70ly0O5ZNJa9mgqVo+0rF8WmcQYmPFYY9ACH6nJg11e7mdlaeg9Cqa+/is6PlmaboEwFNu3HxAd5TWka/DtDjWIUtkr5eJ+w3KC47fngC3gjlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coIKg0CnpiL5n586TK2W++c4b3asnlnAbWPYBlIuOnM=;
 b=XkbjZHIm0kflzF8LfcB2QAq3/wtu++4CfVa/NBU/lJfEFouBxrx5mKiUzMBc4OIOfWcBUSdFQTVxDa712xp3TpCypmlbeO0AuWxLt8UrVs/u76Yh7CQMYYLnk2Jm3Vb3rNUTYjccUUjiR9qQcVfP7s97eKm1QCkabwJVdNIcj7HY8/1JYkdoTiqe5Ed6sCkU0UO2aA8bkEBBGGassE/h4XC8tRglvu+Oa27yolFm6wTyqLVHOZvo9s3POsnR0tQRi4P4P8W62H3wTa+22WrA0h6a/og+vo5SMlCj2qEizj9+o55+rDzMOtUVvhIPRawc6jOMD2xJ0JNYnxj/7zck9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coIKg0CnpiL5n586TK2W++c4b3asnlnAbWPYBlIuOnM=;
 b=mN5W9Ggdzngo4dr1tHRbZ0gDgnZJaE/CW9eMmKzWBw/Ir2E6+3+2HdSxXOqbBVTzqNCG22evV3QW8eSkg/DMOCZ1RfLqL50sEiIzqfPIoMpZWf9MahQICwieQehSulqBTWiorZ50m9oUzkK6OrpAxSWeLC/1+c46jztXq57Mfwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by CWLP265MB5500.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:41:45 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 14:41:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 15:41:45 +0100
Message-Id: <DKHXU8YP6CK0.1PJTQJKC3VRLB@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RESEND v13 2/2] rust: fmt: route {:p} through HashedPtr
 to prevent address leaks
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
 <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
In-Reply-To: <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
X-ClientProxiedBy: LO4P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::15) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|CWLP265MB5500:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4a3a6c-3f5d-4b2d-1827-08def3c8d6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|23010399003|4143699003|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	02OR15MFLyCTepwAr/ALg6q55OJ5KS+BO94cf6o9c/PKdjceeciKx9GUwkxtTv71VpCQHWtmBa6GIbXen55eHu+WsGHifAD8cS6mqjsroiXxMMuzpjJrTkD8Vp5BCuLjj95AEIVl0klBIty2HO9eHojydWSpkyES9vkCBWvgHDBjEoY2ZHWO79ddFlZgoUopE+gM9d/+HsqXFVDxm0LDyTqqzj6hL1Ph0fazjohb11MzxVP2bHxoskw6dj9YRvPlCv1FXmuaCFboJzZxSaY8LHhsrJNA3Cj/7krLcoY2BNs1Kt8keM6/lsTl4SjKf31xu0FLrvOVtGxhZfRqniKWnXHsuvPaG890ktoYGCeqXZWMRCYYVX3OknMkbMkmRJACKAktuk3k10jvg5/cQJCHR8CgP2Y5w/BzLtQtuBHl22P11QVazmecYTuO5nMAnZp8WpVqfQEtaV+eOdl9vdxpfheDNPr8tR9UtIwvw5xQrdX03U1rfPmUXHMptUT6wotyla2WltntkjS54Q/PcLYc5ZorZ7TmXToa6dfZBc3rRJ0ZPQbNxbKtuKQT9nF16WvY3ozMT8h+sOF03Pj17838RRlsI5d2K9x2kN/GTgR4O/0Py4P2a43A26ReFzdAeXuOdFLQEJf5oF3IR/c59dR10MOmLprTbrJpGLuHXyvjDWB8GFl1wipe7XHqdllaMHVQrl4dq87IxwZ7RzYa/uZ3pA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(23010399003)(4143699003)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJ6UXNMMUlWbEd2bEpJUU1vWkZQdjVNVDBNOWFPYldHM2pWeDR5WGNtS09I?=
 =?utf-8?B?ZG4rcEprYy9aWTN3WGxSTmNtMGZaa2dEenA2RlRDcVg1Z2RQQzFFaGgzWDNN?=
 =?utf-8?B?UWM0QkxOSW5rWGRnb0lVMlVvSFZhUFNtcGR4MTl4Uk9MTURHV0tma3BEMVlj?=
 =?utf-8?B?ZnRsV1c4KytobW93bkkwN2ZGQllmUEdKajN1eHdyeXpXeW0rcFk1eEsya1A0?=
 =?utf-8?B?QUxsTTUzWEZoOVV5d3p3MWFNVHE0bzVjODNDTGJvMzAxb3dpS3dYZ2JGSTNh?=
 =?utf-8?B?SFlaUFh0YXVmbkJ4RjNZSHlJbC9MbmlFV1NyTXBKcjNEVDRzbTZNRWZ2VXY5?=
 =?utf-8?B?ZzJDL25TUXdlL1F1bWtmYXlYQTdOd3M5M2Y3KzVIcGt4YmozMElVVkFOMFYz?=
 =?utf-8?B?UnRua3NHRkNJTkRUN1NQTnZudFVBRjJnN0cwUzdwNWI4WVpSMDVYelROUDFo?=
 =?utf-8?B?blNjTUFJRFJMOUtFdGQ2TWRrQk1uM0xtNzhsSmJ1alR5OVd1MVJmQWZCeWtM?=
 =?utf-8?B?c1pjY21ZcGhKTHlxKzk4VmhxRzhRSy8wYXJhTlg0MnJiU21JeVZzZVFrbEw2?=
 =?utf-8?B?anJzMklrdktLS0ZBK2lSczh0T0FQMUMwMDMxWmRReFVhTWgrbTIyZkp2b1c5?=
 =?utf-8?B?eENXUGFEeFZQZE1URzJVT3Y5Vm9lNnZaZldKQWdEZG94Z3VjV3EvN3dnNHVT?=
 =?utf-8?B?RHhXZmxlVmEzR3kwNnMyYUp5YW5zMFVUQ0FiRXErZWdSSkRJbVUyVHI3N2dY?=
 =?utf-8?B?cWhKQVBsdnJpeUZpNUZaaFVMaWcvbkJ6cUhzMHAwM2VXTU93V2lxZndyaG5P?=
 =?utf-8?B?d3EvSUpxeFdwRllXaFRhcHdlMHFaVmI1NWx4ODVoQVZwdVVJbEdhaDdra1dH?=
 =?utf-8?B?ai9NaXhvLzRFNENYQzFzVVFZOHR2N1lMZXd2cEVCZjdSN0ZzVWlVQmhQaEZS?=
 =?utf-8?B?KzdSSVNHeDFSVWQzaHlVMkhwRWQ4Q1R0TUZZdklONXAwQ3V0ZHhLYnJPR0RN?=
 =?utf-8?B?TUtsMmQwblFhWVJsYjdHd0dCZ3ZSeG1mdEpVSVdLY0g0ZmNDYStiV1lIWTRr?=
 =?utf-8?B?bytXQVRJVjNVMnpJNENzbTlZTW5ueDh6ZTNVTlBOci9RR2dKQlFCMFlpY2pI?=
 =?utf-8?B?dGZWOVRWL2kwMlVISitnQUxiQ3V2cGR4cW5pMnFkSXMzMk81eXFPQ1RKaVg4?=
 =?utf-8?B?QnFBRlJHUWFmcW5kRVdTNjFKWWg1bzhNSWZuTFBaT2NhTmZERXQ3TzJ6Q0ox?=
 =?utf-8?B?ZzNmbXRYOWF0MFh1SXdYRWk1cTRZTG9za0lUTXZMYlFkZEYrUFQvckx2cy9Y?=
 =?utf-8?B?Z25PVVBMODY0RHYvSlA4a0duS01BaFZXUkVlVk9mQkw4SVJ3cFRaQjRDTXEv?=
 =?utf-8?B?Ym1kY0xvTFBMOHVaenplam1xMUZscDRPZk9mRzRmblBXTWlFbXQwUGJNOFMz?=
 =?utf-8?B?STRvcXZwcVg3Qm8wS1RzaEV0blFCem9vYVRtMzdyYm5VTGg0NjgyUXNNWVJH?=
 =?utf-8?B?Y0wrckU5SkxQMDMyWW1lcGUrKzN5cmVCcjdVemxoZHpTWm90aFBpL2NWcjFY?=
 =?utf-8?B?aDI5Q3ErM0pNNzA5b3RYSWpZNFM3amtYWUJwRVJqYksrUkR6Zlp0c0ZEZXR2?=
 =?utf-8?B?TnFObGJWa2xyM0xLZ0JUU1lFSVhxNXlYU0dYVDJ2VmtFQmNaMm9XV2l0ejNE?=
 =?utf-8?B?ZGRLUFRob1l4NlpqQ0d6YkxvbmhtbklZQlBkTjM0Nkd5ODlOS2lIZjlSSnY5?=
 =?utf-8?B?aWM4MVJxMlRIQzBQYmpIeXArT2dlQ1ZnT2xGakdJSmozTlRUenFWUlRLTkZW?=
 =?utf-8?B?TW8zbEZyZ2Vnb205Zm8yZUVIWDkwRmdSN2lGWjZEZnZWbHQ5VjEzQjN5eHh6?=
 =?utf-8?B?ZXlKa2Y2akJ1a2lnZEhWd2NKcGpOZ1k4dHRPbTM1RjlqLzZ2VjE1VWc3RHhz?=
 =?utf-8?B?Rnh5Wmx2cUtUYVkycmhuWkRPY2Vid05WTkxjOGs0Z2syc0pOQy9XWmkrbE9k?=
 =?utf-8?B?NnhxbjhpYUhZc1VubDUzV2U1cDBMOHNsQXBpRFl1Qm9zZ04zKzh0N21yelA1?=
 =?utf-8?B?cE83WXdSY3poSVRid21PZXdQNUQvZjlIZUJlb1ArdTZVUnVhdS9Kd1FpVWtF?=
 =?utf-8?B?UXdXRFhSeWh2VFkyTnNnNFphbkx6SXc2ZWJpQzhZNVladGY2bUtTS0NYMzVW?=
 =?utf-8?B?RS9laVpaQ0dEMnp2RXV0VDZwNTE3eFB0Z1daRWM1anFnalRGTlYzTXRYRHR3?=
 =?utf-8?B?ckFJeGcyaE9hd1JMRlhNK0pWSUNwR2RnQ0FZNU4xU3FWSHRibjNyWVFPSmp0?=
 =?utf-8?B?UHFJaXBrRnY5TlB4VVpCTkZVc2YvUm1adm8vclFUV3RheUN5WTBCdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4a3a6c-3f5d-4b2d-1827-08def3c8d6cc
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:41:45.6894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIM0y9DCZqyPH3RGBAOgPvB2w+pgT5Kp0OlLcrONbPPsVEJ58dUl4NhJuOHZ3xIBc35xKSah42mUUpwwE5VsHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5500

On Mon Jul 6, 2026 at 6:18 AM BST, Ke Sun wrote:
> Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
> so that `{:p}` formatting uses the kernel's `%p` hashed format instead
> of printing raw pointer values, preventing kernel address space leaks.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 166 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 164 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index cd7d9664ff5b9..3d154dad06f64 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -39,13 +39,106 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      LowerExp,
>      LowerHex,
>      Octal,
> -    Pointer,
>      UpperExp,
>      UpperHex, //
>  };
> +use core::ptr::NonNull;
>  impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lowe=
rExp, UpperExp);
> =20
> -impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
> +/// A copy of [`core::fmt::Pointer`] that allows implementing pointer fo=
rmatting for foreign types.
> +///
> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it enables ra=
w pointer formatting to be
> +/// intercepted and routed to [`HashedPtr`] (kernel's `%p` hashed format=
), preventing kernel address
> +/// leaks.
> +///
> +/// [`fmt!`]: crate::prelude::fmt!
> +pub trait Pointer {
> +    /// Same as [`core::fmt::Pointer::fmt`].
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
> +}
> +
> +/// A wrapper for pointers that formats them using kernel's `%p` format =
specifier.
> +///
> +/// By default, `%p` prints a hashed representation of the pointer addre=
ss to prevent kernel address
> +/// leaks. When the `no_hash_pointers` kernel command-line parameter is =
enabled, the real address is
> +/// printed instead (for debugging purposes).
> +pub struct HashedPtr<T: ?Sized>(pub *const T);
> +
> +impl<T: ?Sized> Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        use crate::str::CStrExt as _;
> +
> +        let mut buf =3D [0u8; 32];
> +
> +        // SAFETY: `buf` is a valid, writable buffer of 32 bytes, suffic=
ient for all architectures
> +        // (max 19 bytes for 64-bit). The format string `c"0x%p"` is nul=
l-terminated and `%p`
> +        // matches the pointer argument.
> +        let len =3D unsafe {
> +            crate::bindings::scnprintf(
> +                buf.as_mut_ptr().cast(),
> +                buf.len(),
> +                // Rust's `{:p}` includes a "0x" prefix, the kernel's `%=
p` does not.

`%#p` should do the trick?

> +                c"0x%p".as_char_ptr(),
> +                self.0.cast::<core::ffi::c_void>(),
> +            )
> +        };
> +
> +        // SAFETY: "0x%p" produces only ASCII, which is valid UTF-8.
> +        let hashed_str =3D unsafe { core::str::from_utf8_unchecked(&buf[=
..len as usize]) };
> +
> +        // Handle `{:0width$p}`: insert zeros after "0x" prefix.
> +        if f.sign_aware_zero_pad() {

zero pad can be implemented by `%0*p`.

> +            if let Some(width) =3D f.width() {
> +                if hashed_str.len() < width && hashed_str.starts_with("0=
x") {
> +                    return write!(f, "0x{:0>width$}", &hashed_str[2..], =
width =3D width - 2);
> +                }
> +            }
> +        }
> +
> +        // Use `f.pad` to handle width/alignment formatting.
> +        f.pad(hashed_str)
> +    }
> +}
> +
> +// Raw pointers are formatted via `HashedPtr` (kernel `%p`: hashed by de=
fault, plain with
> +// `no_hash_pointers`).
> +impl<T: ?Sized> Pointer for *const T {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(&HashedPtr(*self), f)
> +    }
> +}
> +
> +impl<T: ?Sized> Pointer for *mut T {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        <*const T as Pointer>::fmt(&(*self).cast_const(), f)

This could just be=20

    Pointer::fmt(&HashedPtr(*self), f)

by making use of `*mut T` -> `*const T` coercion. This would avoid doing
multiple indirection. Same for all other impls below.

Best,
Gary

> +    }
> +}
> +
> +impl<T: ?Sized> Pointer for &T {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
> +    }
> +}
> +
> +impl<T: ?Sized> Pointer for &mut T {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
> +    }
> +}
> +
> +impl<T: ?Sized> Pointer for NonNull<T> {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        <*const T as Pointer>::fmt(&self.as_ptr().cast_const(), f)
> +    }
> +}
> +
> +// `Adapter<&T>` bridges our `Pointer` trait to `core::fmt::Pointer`
> +impl<T: Pointer> core::fmt::Pointer for Adapter<&T> {
>      #[inline]
>      fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>          Pointer::fmt(self.0, f)
> @@ -112,3 +205,72 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},
>  );
>=20
