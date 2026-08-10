Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022106.outbound.protection.outlook.com [52.101.96.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7278175A72
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359557; cv=fail; b=JJKDh0Jsnz09CI077FIN1XmB+7PLmdT8VYUcFT8I6WYRPKTlcC/dVF8pABh4slGTbYqpbC7gt4i3eRx2JprlgocnWbbv2OgRa7yfUYItAjXEQQCmOiKxLmK11Cdm73r61jRy1QlR/nstEv4Nc1ho0YcO9fhMkIOWHqyYRCKlN8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359557; c=relaxed/simple;
	bh=FM3C1bqE/BO9Gtmps63EH8BmPBXoXv/xNWXgZgjHQ7o=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=J8X49xynBeZ0eOALnuwA0C5fl5Ea6sQzgxeTdv+16W0kLx/H0veoC68kpReGdAkLSukB6WAyCqoFIxHE4S7+AMY+4vPOV/x4oh4Ti3/MtVMowoaIKaTBDHLmBOe4PI12yDOPwB0nUqbObRz7tOcBlrq8MiQyqg2DnwImJn2avBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EjD7mpMl; arc=fail smtp.client-ip=52.101.96.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EjD7mpMl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa1jT7KDqP0cOza64IJvvFk7UaaxdITSMCxeXrYQLn88vNC9Ywmnu3ceE5HEcS1kLuKNOPHfQ/Q23YGKl2V2DtufhbDNwy8+OiJ7BnqXzqgNViiIJf9CFOGnbLNdXkav3oj0ZwShxBSnaxutUiig7vGnf9VY8S5fg7zIoCaLsQQ367emscdGb5uiII5zyP3ktwXq0Wf83kJXHuxQR3Jz/6Rwswwn5ksZmzdMD2shtM/8aDtfaUGC6zNwNkGT+jJhOh7+m5w3bAOY4SFds1aSfb5S9mT2xvJyE0JhxsdG9V7kSB+zHPKTJ7Nx0uic5XUzIuBnE4Q0FO+biePee2dxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi85KyqirDtsFDXSb+cFjupehGus+u/Apa8o7nImJrg=;
 b=WqFMEsXHvV9W73Bk8HmXzZtwZ9MopGlRn/F/woB6j18nU9Tu9A/S7g0v5kJFzBPGpossfovqqueIZVXOm3//FmoeIkiPWDLnzNiWsC76Nfuyfhyvz1YLqffadzErCZ7/3spp2s7KoBOF+mZHA71for/NqGYOxVJ9sqUjISSa3jIj179ewlE6ReoSKGY18xO9Z/bkCwTbMTNKiDGfildJHZu1/qVpIsg2006Y5PxabSiB1CRykkcjD3jfAfJPalZYuzo8uWPtLWw9y1vNyMS5ktk7wxWyzZdKp/keqasR3IugRG+ZioCsa+bs0KQodfEk8E0N5bBpo/XhbqMDZM7y8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi85KyqirDtsFDXSb+cFjupehGus+u/Apa8o7nImJrg=;
 b=EjD7mpMl4luO35+jvI3PBbx/AJG80twwEsMzgHeMVjdz9UNAeUcY0FGq247/szXHp9lIA1bMjd3qQoVIG+6xPO/0tUyenl/Q3Rafq9UaBNZq7ZSX3x20UcmSTnJs1+8wjInsYn7nzPRD4KdgLH2Umk4cco2bUb03GBUZR6vNfG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOYP265MB2272.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:111::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:59:12 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 10:59:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 11:59:10 +0100
Message-Id: <DKL7M0LMCZYZ.1210EJOGSPLU5@garyguo.net>
Subject: Re: [PATCH v15 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
 <20260810-hashedptr-v15-2-eafd27d36476@kylinos.cn>
In-Reply-To: <20260810-hashedptr-v15-2-eafd27d36476@kylinos.cn>
X-ClientProxiedBy: LO4P123CA0618.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOYP265MB2272:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f4a81d-6fa8-4592-fcb4-08def6ce68c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10070799003|22082099003|18002099003|921020|10067099003|56012099006|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1BUo/A31sdlmPH4hDCsLw5VHhgRoN1IOQXXzki6oyCF4K3zRbUH+eTAjc8c2b7Ql/zPIMeU8uzsGFX+Dxx0PHidI5rgWV5YvXCLZ+gU/3oDsRrUdxEqYYvy3vIxPAg3MfAaDGTNpIbLf+cnM/KR/1bu/Tq8a6VGpTDFvu20zvl3hH+UvIs+Soebin9iA5IteYf72/JuYkdvmgOFEL7kLPZcGkftxGzFzV+N1WUCzKf2zfkiGFcPeqawBosHUtNr8px7bwGBLJba5Uj9+zVA/PcN+CcnRpBJyaJ/M6GBKjz318zj587yE+NKPERtXeufEfh6YzEsBFpUUS8dxsHZ0AB3cdQ7fP/badV0ZyNeTD5SlGrSDtlnVmjiuUTnu/CiMD2FHuUANC6WvlLkMtDtY2syTsEawwdGjNMJvNKiOS6ilMKR0Jl8SH+T5Cfe08CxzKXE7QVOZG17cU5wE1IRySKaFzCcdd1oF6ZcvLZ7RMjsOk9kNbhGOnzBMGAmuFAbd1lYWYLf6UV0cYLQOfWCopFkp0qnzwhZ8oaxFViXpxstg1XZDr4ShGVnvqQNBPhItgjINMSSLzWKFRb2b7Nhxvf2EgOj8gFHDrRTNqHL+wYsrLjviC4wXYzkHLuekuddRsQFRNWCfsF+13FyYWeW6xPkaQNcGuz8LlE57vKgq0pL9G9RIN/lH3I5u1UsKLWydYbLJnWKcUeiDik5/h2dMTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10070799003)(22082099003)(18002099003)(921020)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aExoU2pnWGIwd1BPdW82LzNIZnRCZU4ybnBjTFpyaWZ0QlVacWdNYVZ6TFBH?=
 =?utf-8?B?cDFNTjF3c3N0WnZueGttOGUwT215M3VNOVNjZXorOU1Wc2FpanhDRU9rUHZP?=
 =?utf-8?B?M0EzL0ZBWU9BZ2lEeXRYQUR5YXdXOXlRdW04QzJHS0hwcnlQT2NrWWZ5S29v?=
 =?utf-8?B?bk9IazhDOS9hdXArZ3Blci9KT0x0Znk3TU5KdTc0Tit3ZW1yTS8vOVJEWVpD?=
 =?utf-8?B?aDdiM2tnbXBJY29KS0VFNk5OSTIvRWRyYVdDVWE3UGlmOFhVT3k1d3dPQWJI?=
 =?utf-8?B?RzgzYnRrSmlQRTdXU3QrYWFmQnQ4NnBsVFE1ajJuS1A1WTBZdTBsZzlicTZO?=
 =?utf-8?B?L0FuWStXSStjdXExYWJVVkhUYlhZa2xIZ09oRFFOcjhMZG5RUzV1TmtWekVS?=
 =?utf-8?B?WjNCcjVlaUNJWnRwU0hFci9WbUpRNDQ5enN5Y2NvaWlHUFlPYXRxNXdCN2lo?=
 =?utf-8?B?ajVpNU1pSFphOG1WQk0xM291TlJvZVE1b3RhNFZ1R3BFNlpTaHQxcXpya3pO?=
 =?utf-8?B?SEI5T2xoaGUrWWxEUXNSdW1heXVGejZPUGxVa1g1ZXNQM2l2bXZnUDZ1L3dY?=
 =?utf-8?B?ODk5cVRzZXlaVGR1amlOT1dHdE8vUW9HdnkvcTJqWGFuQk54TWZXRGRZRGhY?=
 =?utf-8?B?Skp5RVpwd1IxejZ4MEFhd1hiTGkyRTR0TkUxOVpiNjNUNGJWMVoydy91bHFI?=
 =?utf-8?B?QTZ6eHgvczdVb1BDYU0yQTArMFhnTTd4aFlGbW1kYnFnNDZuWGt4MkYwSmVQ?=
 =?utf-8?B?SWR4UXRHNGYrRkVmQkdpbVp1SUdtL2R1aTBKZCtxaTNTeXNSWkEwUnYxZkYz?=
 =?utf-8?B?Rk1RV3puZWJ6NC9qS256TnYzYkhlTDdnUWorZmRYSWYvSjJ3VEtiV01VcVhp?=
 =?utf-8?B?a1d6NmR0eDhPN1FuNUEwN2xpVzJoY3BmakJMVjdwUDBtVzdLaGp5S2Z4VWR6?=
 =?utf-8?B?dmh0Vkk1L24wVUh0SkJnTDh4a1FIYjFaSmhzVmtwanlPek5wY0NaWWNhTUh3?=
 =?utf-8?B?OTdwQWZESklYMGVyZnVjNWpudVpJM0huTWJaTVluZkpOb2Y0b1dTVFhPeFE0?=
 =?utf-8?B?L2ZrYVJBN21NdHQrd3pvWW1MR0dxaHgxOGNEVzhWZDZIQ3Z1SDU0eC9KWnA5?=
 =?utf-8?B?Q3A2dFVBdi9UNWlQTmpyaEgyUUhGdmVtMGtMNjJkNzZBWlRmR1pWcTlZcmdp?=
 =?utf-8?B?TUFhRzNRQXhBaTY1WXFsNXl3RVI3Y3VpSlRIZjFOWlVXL244ZTNwMm9DMkFs?=
 =?utf-8?B?VWpvc2RySi9EWnErTzJEdkp2aUZnNFdML0ZXRTN0d044c0U5WHNGd2FlOHh1?=
 =?utf-8?B?bWxoZXp6VHlmdTNlZjByMWlLOEliNzk3VmxBbkpPZlVEWHNaSGF2SndNWlQv?=
 =?utf-8?B?RkIyNE9GczBuUEV6UzZFSWRXeS9MNnNkb2Z2cjFuMjdSWE0rYTdaVGlvbGJK?=
 =?utf-8?B?RFYxazhPR3FjS1JRNEtIelRyVXRMZFF4NjFBQ1cwcDNpNFlzbHhYUEw1azhV?=
 =?utf-8?B?dDVQRjAzTXpuOFRnNGh4aWdZMEVCdEcrSzBHUmFqSVZuaGRzM1FUcHErMmNv?=
 =?utf-8?B?blExTmh3QWhpTC95ekhoVjlxS0tZSGNSeTUzL1o3RkN5ZnVvendrNTFKMUp0?=
 =?utf-8?B?dGdhc1lHTkpFRzhMQ1VOUjN1VDhkbzVuUGVUWWVtTkxHcFRWMDZTcjk0SEIz?=
 =?utf-8?B?L2NvVlZGSnZyZ25hRWF1dkFSdE1VdTcrVzBpNW8vcUdNSW52UHhUM2NaU0Y0?=
 =?utf-8?B?YmVUM3dJUGtuY0RPbllhNExrckpYUnFJanl1MG1hQmVBZHdZTk9KSDQzRmQz?=
 =?utf-8?B?RG5mUUNLSWQ3VjAvd2JVSGNqeEpEekNYcTVpTTdQd2l4UE94MWFWL3J4LzVZ?=
 =?utf-8?B?RTkyTVdLRndUMXF1NURXeXBrYWV2UXJtUWFRMnNXVGJvbXpsZnEwUU1yVWwv?=
 =?utf-8?B?a01BU1ZnVjhwNlg3bjNNSnl0aEFSckNDYXJtRTFFRGcwMjN5MkFZY2tPTXZz?=
 =?utf-8?B?Qi9NdmlsUlZvZkhpTGRaZXJhTldWd0pUeE5YejJnKzlkcEt6TmJ3YjdvM3Fm?=
 =?utf-8?B?YUJETVR1MDlVaWdwcW0xd0c5SC9LWkVZQWZRSkwxTzFaMUU5TER3SWphdlpD?=
 =?utf-8?B?Z21WckF1ZEJGQU1BTzV0SS9hR2EvM3ljeE9nckNwcXYyOWs5dXQvTmUyR3ZR?=
 =?utf-8?B?dndHa00xT0RJZHpjVjdlVkhLNVRIcHZmeGI0di9odlFna3lDS2xoMGsyNit5?=
 =?utf-8?B?MHlvWmpKMkhQK0xCR095Y1FyVzVod1pQVGFlK044d0Qzb1hTUjZ3anVOVFlY?=
 =?utf-8?B?R1Fwa0hqd0REaDdoa0RqSnFYWGtCdnVaNmY2TytPYjZld2pWYUNWQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f4a81d-6fa8-4592-fcb4-08def6ce68c5
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:59:11.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zv2II/Shg3JMgAjLDyVMVx3T2tMQYEAAYXtQxSZySKRh3JKVHJiXFeWuSi7IBEN4u4YD6nsd6Vwi/PLYSSFTXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2272

On Mon Aug 10, 2026 at 7:35 AM BST, Ke Sun wrote:
> Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
> so that `{:p}` formatting uses the kernel's `%p` hashed format instead
> of printing raw pointer values, preventing kernel address space leaks.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 182 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 180 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index cd7d9664ff5b9..6f7cb657bef7c 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -4,6 +4,8 @@
>  //!
>  //! This module is intended to be used in place of `core::fmt` in kernel=
 code.
> =20
> +use kernel::prelude::*;
> +
>  pub use core::fmt::{
>      Arguments,
>      Debug,
> @@ -39,13 +41,110 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
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
> +        // Use `%#0*p` for the `0x` prefix and zero-padding; `+2` compen=
sates for
> +        // the prefix counting toward the field width.
> +        let default_width =3D (2 * size_of::<usize>() + 2) as c_int;
> +        let width =3D match (f.sign_aware_zero_pad(), f.width()) {
> +            (true, Some(w)) if w > 0 =3D> w.min(buf.len() - 1) as c_int,
> +            _ =3D> default_width,
> +        };
> +
> +        // SAFETY: `buf` is a valid, writable 32-byte buffer, sufficient=
 for
> +        // all architectures (max 19 bytes for 64-bit under the default =
width).
> +        // The format string is null-terminated; `width` (c_int) and poi=
nter
> +        // match the `%*` and `%p` specifiers.
> +        let len =3D unsafe {
> +            crate::bindings::scnprintf(
> +                buf.as_mut_ptr().cast(),
> +                buf.len(),
> +                c"%#0*p".as_char_ptr(),
> +                width,
> +                self.0.cast::<c_void>(),
> +            )
> +        };
> +
> +        // SAFETY: `%#0*p` produces only ASCII, which is valid UTF-8.
> +        let s =3D unsafe { core::str::from_utf8_unchecked(&buf[..len as =
usize]) };
> +
> +        if f.sign_aware_zero_pad() {
> +            // The kernel handled the width and zero-padding already.

nit: this is kernel code too, so the comment here is off. should say someth=
ing
like "snprintf handled the width and zero-padding".

with that,

Reviewed-by: Gary Guo <gary@garyguo.net>

for the functional part of the code, some additional nits for tests below.

> +            f.write_str(s)
> +        } else {
> +            f.pad(s)
> +        }
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
> +        Pointer::fmt(&HashedPtr(*self), f)
> +    }
> +}
> +
> +impl<T: ?Sized> Pointer for &T {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(&HashedPtr(*self), f)
> +    }
> +}
> +
> +impl<T: ?Sized> Pointer for &mut T {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(&HashedPtr(core::ptr::from_ref(*self)), f)
> +    }
> +}
> +
> +impl<T: ?Sized> Pointer for NonNull<T> {
> +    #[inline]
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(&HashedPtr(self.as_ptr()), f)
> +    }
> +}
> +
> +// `Adapter<&T>` bridges our `Pointer` trait to `core::fmt::Pointer`
> +impl<T: Pointer> core::fmt::Pointer for Adapter<&T> {
>      #[inline]
>      fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>          Pointer::fmt(self.0, f)
> @@ -112,3 +211,82 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},
>  );
> +
> +#[macros::kunit_tests(rust_kernel_fmt)]
> +mod tests {
> +    use crate::{
> +        bindings,
> +        prelude::fmt,
> +        str::CString, //
> +    };
> +
> +    #[cfg(CONFIG_64BIT)]
> +    mod expected {
> +        pub(super) const PTR_VALUE: usize =3D 0xffffffffdeadbeef;
> +        pub(super) const HASHED_PREFIX: &str =3D "0x00000000";
> +        pub(super) const RAW_POINTER: &str =3D "0xffffffffdeadbeef";
> +        pub(super) const PADDED_RIGHT: &str =3D "      0xffffffffdeadbee=
f";
> +        pub(super) const ZERO_PADDED: &str =3D "0x000000ffffffffdeadbeef=
";
> +        pub(super) const HASHED_PADDED_RIGHT_PREFIX: &str =3D "      ";
> +        pub(super) const HASHED_ZERO_PADDED_PREFIX: &str =3D "0x00000000=
000000";
> +        pub(super) const CLAMPED: &str =3D "0x0000000000000ffffffffdeadb=
eef";
> +    }
> +
> +    #[cfg(not(CONFIG_64BIT))]
> +    mod expected {
> +        pub(super) const PTR_VALUE: usize =3D 0xdeadbeef;
> +        pub(super) const HASHED_PREFIX: &str =3D "0x";
> +        pub(super) const RAW_POINTER: &str =3D "0xdeadbeef";
> +        pub(super) const PADDED_RIGHT: &str =3D "              0xdeadbee=
f";
> +        pub(super) const ZERO_PADDED: &str =3D "0x00000000000000deadbeef=
";
> +        pub(super) const HASHED_PADDED_RIGHT_PREFIX: &str =3D "         =
     ";
> +        pub(super) const HASHED_ZERO_PADDED_PREFIX: &str =3D "0x00000000=
000000";
> +        pub(super) const CLAMPED: &str =3D "0x0000000000000000000000dead=
beef";
> +    }
> +
> +    #[test]
> +    fn test_ptr_formatting() -> core::result::Result<(), crate::error::E=
rror> {
> +        let ptr =3D expected::PTR_VALUE as *const u8;

`core::ptr::without_provenance(..)`.

> +
> +        // SAFETY: `no_hash_pointers` is a global variable that is never=
 concurrently modified =E2=80=94
> +        // KUnit tests may run at boot (before `mark_readonly()`) or man=
ually afterwards (when the
> +        // variable is read-only). Reading is always safe.
> +        let no_hash =3D unsafe { bindings::no_hash_pointers };
> +
> +        if no_hash {

nit: not sure how much value does this test arm provides (turning hashing o=
ff
needs a kernel command line and print very loud warnings if actually being
used).

The hash arm should work for no_hash cases too, so this could probably just=
 be removed.

> +            let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +            assert_eq!(cstr.to_str()?, expected::RAW_POINTER);
> +
> +            let cstr =3D CString::try_from_fmt(fmt!("{:>24p}", ptr))?;
> +            assert_eq!(cstr.to_str()?, expected::PADDED_RIGHT);
> +
> +            let cstr =3D CString::try_from_fmt(fmt!("{:024p}", ptr))?;
> +            assert_eq!(cstr.to_str()?, expected::ZERO_PADDED);
> +
> +            let cstr =3D CString::try_from_fmt(fmt!("{:01000p}", ptr))?;
> +            assert_eq!(cstr.to_str()?, expected::CLAMPED);
> +        } else {
> +            let cstr =3D CString::try_from_fmt(fmt!("{:p}", ptr))?;
> +            let formatted =3D cstr.to_str()?;
> +            assert!(formatted.starts_with(expected::HASHED_PREFIX));
> +            assert_ne!(formatted, expected::RAW_POINTER);
> +
> +            let cstr =3D CString::try_from_fmt(fmt!("{:>24p}", ptr))?;
> +            assert!(cstr
> +                .to_str()?
> +                .starts_with(expected::HASHED_PADDED_RIGHT_PREFIX));

In addition to checking the prefix only, you can also check if the output i=
s
consistent with the first formatting.

> +
> +            let cstr =3D CString::try_from_fmt(fmt!("{:024p}", ptr))?;
> +            assert!(cstr
> +                .to_str()?
> +                .starts_with(expected::HASHED_ZERO_PADDED_PREFIX));
> +
> +            let cstr =3D CString::try_from_fmt(fmt!("{:01000p}", ptr))?;

Maybe pick a smaller number like 100? It's test code so perf don't matter, =
but
we don't gain anything by testing 1000?

Best,
Gary

> +            let output =3D cstr.to_str()?;
> +            assert!(output.starts_with("0x"));
> +            assert!(!output[2..].chars().all(|c| c =3D=3D '0'));
> +        }
> +
> +        Ok(())
> +    }
> +}


