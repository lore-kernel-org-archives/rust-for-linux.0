Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022141.outbound.protection.outlook.com [52.101.96.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9FB4028F7
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466675; cv=fail; b=BHsewd18CS4YMyyRdRd9vmXlm9dz+/kJuylQGMdWEe/E8dXMKj2RBI6rUyB/T1yohYgvasqR8Vu8AsEJFVMqrr86urrAJlNsPSV4RhnR66txaqjnDo95SQI/77ZzCRuzCAgI2JKaEkdiFHPYT7fZHJFTIlcVtFHPowKmc8qbjbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466675; c=relaxed/simple;
	bh=t+UB6YZFz77mzrR5bqAUetCCfSmQpUhEds1LMGwaCfU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=jv2QpX0kaaho+hgg8bwJ6QM0ErCpz54q7DdnOMqIVZ2r8ER11w82Ii8dZFJ0O36vbid9Fp1ID7yd5MvgE2RrGjjQhAb62644LxMZfj/zvV9wygOI0d2lLjPUpfpdHu16LqzVE22atQLF+lTvp6SMJimEf5uWEosDFMlby+PamUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lvxNSuZ1; arc=fail smtp.client-ip=52.101.96.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lvxNSuZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEHmwwAxAJAAJ3rTq6dPsoNFC5bjfWmQFd8n2Yem/g9tVU8dplXxchCt9Wj+12KBzfo6xkNnmmeoV8svvTsDwo6CHhJq5xB2uCIEU6lCRKruVGQ43IPoH7gQVEzNPDE7nK/smyx5ygIfHbn+C0cV3t+yy3fO8nHvCK/WrxTiEQcHAN+MiVVQ7cFa9oyxO7Vbayfl2HHcnRB7wRUA3s2L3Ya7dkJqIL+n0oZZVD9whLtb4xatgN+SXgKuStoKrAn8laAGAbbeC7bafv2HThmP2AyaiwS2dcA5R7XeujW98V464hDqEwg22xJbha1nAgnyA35qWHE8uD38fl429NH4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89bokK7Lr3Txmn/y0tJ0qigPfbn3sJA2gVW8pUu414M=;
 b=SoOU+w0/EhgBxhDaK7V2T+83yJIGZatOw3Uo4u/J+v/y2D6NVGuDcxFsceZ5fTbEGGlsRS2t9e37e01ql6hJusW8ykRNdYfXXd2bHlF9ltggRpFXiwO2ANHmXtx64W/sKQZ6EVP6JrKkvTX8Ejw2PyHOMul4JrMHA5cpJkGea1R5foF8ciZ+X2I/RpfqcTOaJZ0XXYJDk+Sea7Xcv8SuV8lhsCw2Aju6wl7ONHcrebEABQxlJN6tFMYRxEfYvPOjGJKx2/mc+PNTlIhFe8NqBvPv7awPO9kYAWAu7m8dg6V/auSX9lOifqjtA2KuGdLM31putBYExAFlM6EyYgYYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89bokK7Lr3Txmn/y0tJ0qigPfbn3sJA2gVW8pUu414M=;
 b=lvxNSuZ1xuGd4RijlqLR5szHSdlOGjYrhrKy5Rqk/076tBjVLIt41uZCcKtzeO8VQH4tyiOQeyU+8z+nib3hhP0YMhcvwJ3mQIGpfmQvLFasxyxaiZsnvd2RpjldUV/oUtQd4+KrYpQp+JDxYrg74eneIO+ln1bLADxFr6Nz7TY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3167.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:163::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 16:44:25 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 16:44:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 17:44:24 +0100
Message-Id: <DKM9KW3ARL1K.1JFJOBOB5EDKF@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <ojeda@kernel.org>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <gary@garyguo.net>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tamird@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260811150147.1360102-1-tomo@flapping.org>
 <20260811150147.1360102-3-tomo@flapping.org>
In-Reply-To: <20260811150147.1360102-3-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0625.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::23) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3167:EE_
X-MS-Office365-Filtering-Correlation-Id: 324808f3-1f9d-4ed1-9519-08def7c7cdba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10070799003|18002099003|22082099003|56012099006|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	su7WSJHS7a4BZ/iYGMfyN171Fu/2AVAi0GHih3s8AWtjMsm+JC2vJ28RBQpasLhJfGfOaMqYTH2kWTzsjxuYK4aFSDwmHM95mQBHaIVweKDXe3s667UbuAaweyPAT5qzW9ZSCemBcbwqUSzXWYpHZNTUBp8fW6n1690lqSYEIQbW5mexTn1QdaLT31UT2sEyQrDiwGKobDCK6VpZlQ22k46FRb5RRsF9Z/WiiyzTykWX7ksMtXQTD05DUUfEy6yjYOPSBE8Ex3Ua7QjyIGkXn0eK6Su8V2Tq2C61wnVBmGRh15YXX+HjI+B0/EGnoSBqw69eixs7+/FRmypZrHhoXrev0esPUbxOUhHR5MHzBtrK/tGpXg7WVcXejLtnMHbRgWwpK/c97uv2JmPrVnhctVPaQI7pjRpi8lAJ91nzN71tmhZRhT+fAT3hpBHXjEZiXStA8jbREm2yN0QjZH1TLaIecjoYUzZ6Bf8FpJh/7IxDp4B2TIoSYKUz1C0NfoC4ddCBLDg8IShygPR9IB7GJaoXnsX1j5l7m7gSJ/HsBF9iiGOMRiry7RTSJbfk5U6Gp6n0r3pGOxHIVAnsZ9BBMa3A3EoUETJXM8ucQF+zuWafAu5aFrnJFQM9Sw1AvRdpK0V6ipM91fzw4elau4Ln56SjrI7hBOYScfP7dHJc91Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmtyT2FrVS8xZEZaQXRuTGZYY0o0NVA0eS8vaWFOOGE2VnFYdHdrMWgvY3Fo?=
 =?utf-8?B?STlZVmFwc2pPOU5sTStqajY0SXVPekxZc09IdkxCQkZkOEMrTVpuTTJwZTRQ?=
 =?utf-8?B?R21HNCt2ZS81MnNkRk9zRnNTd0s5eGI5WlJ3VTBJaGdFdDAvbmhaQ1N5b3cr?=
 =?utf-8?B?V2hJdlphOFk3S0wrU2l1dnBFY0t6VjZmSXJ3ai9sa2pkOTM0cllDajYrQlZP?=
 =?utf-8?B?eW1FeWNlQjJsY3UwNnU1YkJ3YktyVDVycWJHUXdRb0tqeTdLUEt4QXpQWldH?=
 =?utf-8?B?aXZkRG1jVHhpcVplcGtDWEV4T2thS2c1SkNxOVE5OEhtYkhLT2RCRWlIZHVl?=
 =?utf-8?B?YWticll2YkpGNys0MHZtamFJNEIwY2QxL2toazZlT09NYWwySDRMK1Z0UEFY?=
 =?utf-8?B?QjRyRHE5NkNjZys2UDh1R1U0VGJBYWZDaXpMQUM0MzgrN3lpWHFYa2NBMm9M?=
 =?utf-8?B?emNzcldHV0gzeGVIQ1dBK29HaFI0NjBmK2dZZGlnUmRXWFMrSXhBNVVkUUVF?=
 =?utf-8?B?N01QQkYzM2p3V2k0QjR0dmZPaDg3b1U2WERMT3RLaUtOZ3JOS2FGelpQNGpH?=
 =?utf-8?B?RE1KUU94U2hCN1FheEZZVURpMDNpOEZhdlNrWU1WMm9BOUdiejlrRkE5emJO?=
 =?utf-8?B?cW96bjlXcERDUllrQlRvaG1ScTFyYWxodTdMZzhCTDNWUnZ6TE1wLzExWHpt?=
 =?utf-8?B?VzdqYlJENGc1cDYrbDNDdWNwMjl6aFFxZm5ZRnI3QzNUcWRnMXBUbXoxSVhm?=
 =?utf-8?B?K1d6VDUwaVlNRUNid01LSkpNMTlKUzBRQWlkemdodlZIQVVUeDVlVVhhekM1?=
 =?utf-8?B?akRHSWR4dUphTk1oZGcrVFMwYWc1anZjMTk3eFNlMDFkeUtjNzhqWXo1TE1O?=
 =?utf-8?B?VVFpNC9yZEtlaWxlbndiWFJRUkRyekJESlowZlMxWGtOWTNJM3JTV3E0czRo?=
 =?utf-8?B?MHlhMncvT3FoUU9oTmFNNjhVbnU2UVU0WTNrTkJNK2ZLajFoNndqZ3R0NkYy?=
 =?utf-8?B?NXBOR0YzYlIzRm45ZjcrcnZ0aHZlY2pmbTE1eDZ1b2ltWmZsYzJtc05OOHc4?=
 =?utf-8?B?WnIwTlJOckVsVjF5UFVkZnZwSldZb2luRmdpT1RTOXJwcGl6Q1N4SXU5aTBn?=
 =?utf-8?B?WWtoUTM3NXNjNEt0aHBtcXRYajcxaGNiWC9lU3MrWXM0bjEyaHN4R1NqMUFY?=
 =?utf-8?B?YytRMTVQelN6RVk3a09YdjFzNERzcEdlZVQ1Y2JzVkFKVVlic0t4STlnY3JR?=
 =?utf-8?B?cFVTdmZlelVrL2djTTVTSGp6eUZmN0pZdzl0NkNjQTRxQWpvdDVlN3ordjY1?=
 =?utf-8?B?ZTlRRlRJTVU0OGJ6Z2N0MllCWkFzZTgyOWN1NUpvWi85WDFsSGZ2aHVDMjl3?=
 =?utf-8?B?ZktUaTJOMklEUzhOZTN3WnlGQzFjSUxVMFRITXY5cVA5V1RXeTlQSDAzNG9E?=
 =?utf-8?B?YWJ4dDVzeHgyT2Q2a0NiN0YwWEl0OGZ0Q0ZaTEZMWnZtM2liSHRuSnRtUFpN?=
 =?utf-8?B?RFUya2hEUnM0T0VjVklaaGNhY0t4L3pvS2Y0cGRydlN1aHJOeXNZbHM1K0c0?=
 =?utf-8?B?MHRNN2J6VW51UkU3Szk3RG1iZk9BMkMzbVc5UUVYR0lUSjlXV29JRXRsU2oy?=
 =?utf-8?B?bWpzcU1lNnRwckFSbURHMVVXQ1ZhVFJhanVVK2p5Ujd0NUx2VnNQck1kSm5l?=
 =?utf-8?B?YlVIaGhnb1hXZDg1TGVvT01FeGs4YkhUd3VySkY4Y2VBOWpSNU5xczFySGUr?=
 =?utf-8?B?OUd1YjdkdTJHOUdGb1hLekVUMHFEbUtKWjIwRTRwV1M5enZhT3h1T05UcWlz?=
 =?utf-8?B?SUErYjY4N0Ftc2VjUHBEaU0yZ2l1UC8rWGhvc0ljQ1Q2dnV0cjRaVGhkMEZU?=
 =?utf-8?B?eTlnM28rcUlwV3BaaVJXTlhaaWJ5MXFEV3U0dTI0cS83d2ZTb0tiL0UxdHN3?=
 =?utf-8?B?eWNqZUVtcjBjRlhjV3lrdTlZU0F6OSs0eSswYzNtQXc5ditrT0o3aDhDT25R?=
 =?utf-8?B?Q0ZYSlV3Zk80MjdlSkNJcDFiSFpMWlk2MWNITGF6NFBHZEN0Zkcyc1BGU1V6?=
 =?utf-8?B?MUFWYWtPbDl1eWpuSVNUUVJxckEvbkR3QkIvdGZUMTFaRFQ5c0d4NFdmVk1v?=
 =?utf-8?B?WkN3RHkwNjNQLzZ0UURSMUVpUi9ITzVVMW1USW5lbzBBMXREb0VaS0ZiL2d4?=
 =?utf-8?B?ZDJtalBHOVc4WHVwOGNLNlZwUTJiTVBOWGtyWkhUNzdLZzBqWGxuUm55c0sy?=
 =?utf-8?B?c2p0aHYwV2JSNTJLL1BRREpHaXpvNTBPT2F0Q1g2T0JiOWFjMjhmbm5IM2tI?=
 =?utf-8?B?c0k1U2w1RHZoQzJob1Y1ZlViQjNpck1kamhWMzVEbjFpWm5ya3FLZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 324808f3-1f9d-4ed1-9519-08def7c7cdba
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 16:44:25.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0vuhcRGqOjwTNIjHHLQOjaXiAA8Hq2jgrW1lPeUq8JR4VUm7Fn1euJOOAklu+ietsqLs0vXzlQx7A1Ceoz0gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3167

On Tue Aug 11, 2026 at 4:01 PM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add Delta<Nsec>::to_jiffies_timeout() conversion. Unless the result
> saturates, the value is rounded up, so the resulting timeout is never
> shorter than the requested span.
>
> The result saturates at zero jiffies for a negative span, i.e. an
> immediate timeout, and at the kernel's MAX_JIFFY_OFFSET "wait forever"
> value for a span that is too large.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>

You should drop old review tags given this has been changed non trivially.

> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 66 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index b0b43ad3aa47..4ec1748c2602 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -39,6 +39,10 @@
>  /// The number of nanoseconds per second.
>  pub const NSEC_PER_SEC: i64 =3D bindings::NSEC_PER_SEC as i64;
> =20
> +/// The C side `MAX_JIFFY_OFFSET`, i.e. `((LONG_MAX >> 1) - 1)`, which t=
he kernel
> +/// treats as an infinite timeout.
> +const MAX_JIFFY_OFFSET: isize =3D (isize::MAX >> 1) - 1;
> +
>  /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
>  pub type Jiffies =3D crate::ffi::c_ulong;
> =20
> @@ -569,6 +573,51 @@ pub fn as_millis_ceil(self) -> i64 {
>          }
>      }
> =20
> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a ti=
meout.
> +    ///
> +    /// Unless the result saturates, the value is rounded up to the next=
 whole
> +    /// jiffy, so the resulting timeout is never shorter than `self` (as
> +    /// [`msecs_to_jiffies()`] does).
> +    ///
> +    /// The result saturates at zero jiffies for a negative span, i.e. a=
n
> +    /// immediate timeout, and at the kernel's [`MAX_JIFFY_OFFSET`] for =
a span
> +    /// that is too large, which the C side treats as an infinite timeou=
t.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::time::Delta;
> +    ///
> +    /// // A negative span is an immediate timeout.
> +    /// assert_eq!(Delta::from_millis(-1).to_jiffies_timeout().as_jiffie=
s(), 0);
> +    ///
> +    /// // A span shorter than a jiffy still waits, i.e. the timeout is =
never
> +    /// // shorter than the span.
> +    /// assert!(Delta::from_nanos(1).to_jiffies_timeout().as_jiffies() >=
=3D 1);
> +    /// ```
> +    ///
> +    /// [`msecs_to_jiffies()`]: srctree/include/linux/jiffies.h
> +    /// [`MAX_JIFFY_OFFSET`]: srctree/include/linux/jiffies.h
> +    #[inline]
> +    pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
> +        let msecs =3D self.as_millis_ceil();
> +
> +        // CAST: `msecs` is clamped to `0..=3Dc_uint::MAX`, so it is non=
-negative and
> +        // fits in `c_uint`.
> +        let msecs =3D msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX))=
 as crate::ffi::c_uint;
> +
> +        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
> +        let jiffies =3D unsafe { bindings::__msecs_to_jiffies(msecs) };

As I mentioned in previous 2 versions, I don't think __msecs_to_jiffies sho=
uld
be used for this. You're doing two rounding and saturation operations here.

If you do nsecs_to_jiffies64 and then clamp, you wouldn't run into any of t=
hese
boundary conditions.

Best,
Gary

> +
> +        // `__msecs_to_jiffies()` only saturates when its argument is ne=
gative as an
> +        // `int`: with `HZ=3D1000` it returns `msecs` as-is, which excee=
ds
> +        // `MAX_JIFFY_OFFSET` on 32 bit.
> +        let jiffies =3D jiffies.min(MAX_JIFFY_OFFSET as crate::ffi::c_ul=
ong);
> +
> +        // CAST: `jiffies` is clamped to `MAX_JIFFY_OFFSET`, which is `<=
=3D isize::MAX`.
> +        Delta::<Jiffy>::from_jiffies(jiffies as isize)
> +    }
> +
>      /// Return `self % dividend` where `dividend` is in nanoseconds.
>      ///
>      /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit =
platforms, so this is
> @@ -621,4 +670,21 @@ fn as_millis_ceil_extremes() {
>              MIN_MILLIS_CEIL
>          );
>      }
> +
> +    #[test]
> +    fn to_jiffies_timeout_saturates() {
> +        // `__msecs_to_jiffies()` does not clamp its result for every `H=
Z` configuration,
> +        // e.g. with `HZ=3D1000` it returns the millisecond value as-is,=
 which exceeds
> +        // `MAX_JIFFY_OFFSET` on 32 bit.
> +        let max =3D Delta::from_millis(i64::from(i32::MAX)).to_jiffies_t=
imeout();
> +        assert!(max.as_jiffies() <=3D MAX_JIFFY_OFFSET);
> +
> +        // An overlong span is an infinite timeout.
> +        let overlong =3D Delta::from_nanos(i64::MAX).to_jiffies_timeout(=
);
> +        assert_eq!(overlong.as_jiffies(), MAX_JIFFY_OFFSET);
> +
> +        // A negative span is an immediate timeout, however long it is.
> +        let negative =3D Delta::from_nanos(i64::MIN).to_jiffies_timeout(=
);
> +        assert_eq!(negative.as_jiffies(), 0);
> +    }
>  }


