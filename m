Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020108.outbound.protection.outlook.com [52.101.196.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B44382379;
	Tue, 24 Mar 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361971; cv=fail; b=rvwMWj1OWU7HF9X35H5EZQhHTNEdhB1pH9BoKCevmchWIU2Di8vKMAzpGcKEDwjTQitbo1BabrulS1deJ0o7k9yXGIP1IDUUkKRypUh/jYsFL1gkOyQHTGEQzK8ADMmtWaZ7w3ziQo58C8G2qryG195OMPrm9YvRptgjbVfeQos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361971; c=relaxed/simple;
	bh=qUa8AzBlx6xp0cMYGvumHnbYOSXLoiMT4uqXnN6Wm2s=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=KU8aqTtL96NLFBg/GE2/NxydB9CzyLZG4aCCP86FX1H0UIIOU25aa/XizCm5xe2GWA/BfN037HoM1Kscd9AnCrjd0W29dDMR3pKiN/O1/tGnA/Qdyfu53NqX6R9Qc8WZIHhmgYMnw+MkqmPPoQqwqJI//ix+3BY/g084Ckwh1GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Id6Fvh9l; arc=fail smtp.client-ip=52.101.196.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Id6Fvh9l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrGTdpfC43wU/ychqFkxRuqN4OX755z6XDC2uBaIcVewIQxdSMGv9CNMiPTMhC3+fv9+rNfQezrvC/ZHLiIGK8dm2izS1iw8HQRH3quy3GDtkqYbrDwFOThxPx34htg2h3z278g0npQMP88pWCU71c1WYrShp9bHnas9dzyRDlsV9NtWlxUXa0m6ZKwep+u1gZX3u2v5v1e16kwfx45oOtJbYfcFnME0676vbS0IDBBzWqcNKSmQA6wSUuI7e73m6mkzG+FkZapBDanwnReWBmQFYAt5aLS0RLx+5o6UfFHOpcswqjM5+JsFg2Iuz0S48LIGJA7XdKP2gKn6KVMD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY+k9tYvnOgj98kdhmmOPws07ifKCWgOX47AOzkSM4k=;
 b=PHDjXUxk0kTMHZ8SNHOvLO2E248zRuO3GuOAy2D+KqKmsHlT1yyRyHhdp5VQP9Vi1lCxB9wyR7U/X+X8+4tnCt72vYq4CyaFPqkS7BxlizCnMgu1GHeikiLmnL2oYzDEpz87xmwjc4WAlTpONv1DcgBnX3sKmt+W2Phltmsa4kykzx+rxHpv6QWI22UkNybfeQ53QgkrgF2TKchaHZZlegokivQJf3AkVQjLgJOB15vr1Z3Taqlrbg68KUJ9zVqkR1jZ23/VRtgALcAaNxCSOb4qjg9nUA4jQqL170qXKJjaJ8yoQQsjoYaRiNOAVLYgmKFDvwu9QzGOiiLePRFDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vY+k9tYvnOgj98kdhmmOPws07ifKCWgOX47AOzkSM4k=;
 b=Id6Fvh9lFiLDZgWaXr9zhow2VlJneFc17TMjW4PTsiRzKDKoE74SzdXY5vtaq2wzq4uxKxc2h8UCUitvjt1/bopS4PpE3k4/1eaH8OatHZ+7bzREpdSYb2EgH2p/JE5GajBRsjopip0pDdUKqFcRZuNJstjRiYNwMOCBYzIJqCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2801.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:19:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:19:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 14:19:26 +0000
Message-Id: <DHB2TMCY99BO.1PTMCOYPCY634@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] rust: ptr: add Alignment::from_u64() for
 DeviceSize constants
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260312031507.216709-1-jhubbard@nvidia.com>
 <20260312031507.216709-3-jhubbard@nvidia.com>
In-Reply-To: <20260312031507.216709-3-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2801:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e311238-463b-484f-332c-08de89b05b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DZXq7TNwEw6U3QLZwvPzKx0vB4X+I6cUr3l/ieB9ox6gOWkeQKVGpnBECpGJkHVyuiXOpG2DA7H7rRwUMir7jj844uUkgSeN+itug/UConIrJquEFf9hd1Z2Xma1zgLRaWYCTGQQgi9TtMQyvSTGMo69OnySYLJqPq6vgoOyhziTNzbzh826Mtcbm1nIHX1hlRGEnr1OWtXArxZmD6+GT5NswprXzUHY1NEiKhHztllDzpy/UF8CinuAfpL2aZ1SZoa5jlJw/X24q4zq/f0TVJANh2G9S8MnPJx5QgX+HOk+cm7XdXBw9Lg66SLO49X9jnB5FnIFyGQ8Y7ispNJqVeiEaROddP/u/Yuvx33PuOnqKtmR+UY0t3rN/Yy5ibBhe1Eh8wV87SpU9eBVOWA2u9ZJSxoZyFxcdvL9UWKEqvWb87NObSFQdjYx3kyVeUCEzuWI3dEgCKkWPWK9OJFh+mjbb5FrCqQp7qLLAdFPBSZdqPSkNuGCb/4+6yy2gRZVbg4IYuXGphA2qpsWHZ8JRlw93w1mKILMrgrQU8nSjxPg0+339zlU4ERPygqyAkmHox539aU4UwJC8y08K2p3ugj2+jOYaGlKkcn2IdVQlyckXHHoKMBlw3bUtpH9hmmQ/TLFxl/FmmhcYAZODWZ+DHkygt1L5Yw1LVdUlxrm0cyoUkacehVOdYX6qin6MPXUTae1d1rREgoUd0plWyRWzZs1Cm8DMZqMVtfxMvpCER4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGNtQXovSlB0U2p5Q05QT2dTQmF4QzM5WGxZeUlxR2E3Z1dHbk5GODdSRDNO?=
 =?utf-8?B?ZG9mMHd4cTRVaDAzbVNtaWFzVnJXRVd1MTVrd2NuTkN4RjdZLzREYnpkTWVJ?=
 =?utf-8?B?SkF1Nmlja0dDVTcyWXo1Q0hUTGhYUnhBWC9WUXZuY0l0NTl4M2R3d0NmNENN?=
 =?utf-8?B?TW8rQSt0UVJyL1JIanU5ZURnL3V3TUN4eDUzSXFKZHdTUklBRVVHSysvQTdn?=
 =?utf-8?B?ZE5mV3lxMjhqTUJrKzh0ejljS2xGaE5ob3I5S1F3YWNBYzgyL1JXQVpCR3Vj?=
 =?utf-8?B?MnVXYWxOSDFYN2trTzZIUnhkK1M4RmxjRjdZVVE1dHNsWHAxNEpka1JFNlNJ?=
 =?utf-8?B?TGUzY1ZYTXJSV2lONlhLWU9CRTV5eHdRcWhsbkJIZy9QN1dsd090bFpyWTdE?=
 =?utf-8?B?VC9xeVZqMmRma2ZnV053QStaSmNnbXk4RlNQK2xaZVprWHlyTGFBZkFWd0dt?=
 =?utf-8?B?RWhhekZGZW1aZW5qbm0vTm9XUkt3TUFKUi9EckplSXhpN1VLYXk4cUxoNUZl?=
 =?utf-8?B?ZDhlS2pNMUpqd2E2VlFmdHFJNW8wNVpUUFdoMStEdDAyOTBYcmR3WnVlS01I?=
 =?utf-8?B?K0V3T2NRaEl4ZTVrT1EwK2ZxZWUzbVpRSDNmSzhwY0VPblRtU3o3bEhuMG9y?=
 =?utf-8?B?dDFZM1FnNkw5Yk8yOUF4NHhiUDV6ZmNvUFZ0NFEvNHF4N2NmT0tFSHFXYUor?=
 =?utf-8?B?NjZjdGRPY3NNM29zdzhLazBpdHNUSUZKK3RrTjJoTFk2WWhtT3VZb2xCcjVy?=
 =?utf-8?B?R2dQb0FPM0lMcFZDUmd5eit2cXd4RDNzcENJNStaUDVKZVQ2SzYzUjh4a2lX?=
 =?utf-8?B?bWJnbVBOR1IwQW4xZE5vYUxidXh3RHNPYVhCWVBFVTlyNWU0VE5uclBPR0hy?=
 =?utf-8?B?b1ZqQVU2OGptbVhMOUNRRVFqTkN2U2xKWDFsRjZHcVg1NVBIRnQyMWRlMmQz?=
 =?utf-8?B?VzdjVG1vVEZtT056NlpXU1o1NE13cDFuSURRaDhkYnhZVmo4Ymhsai94SGE3?=
 =?utf-8?B?TFZZcnBHTkVZbkZ6VkVSM0Q2QmpOckptNHlIWDlaMGFYTzdnQVE1ZlQ3dWVm?=
 =?utf-8?B?aG1lTGdDTnAra2dPekNrYTVwNFdHeUVlRm84L05JNUNxRFdVYzZPdVNJQUJa?=
 =?utf-8?B?MGtYVmNiMjBZUTVZQUxWVGN2NGV3UlFpSWIxeXpQVHk4cTh4bHpUWHE3dzNy?=
 =?utf-8?B?dFJhSitTR25zZ1BaeTlEdTN6aDlqWUJYYkM5UVBRMHNOVzhYTGhKbVExL0FY?=
 =?utf-8?B?QzBXSmVvYmUyc0RkVldlMFI1cDlUWklwYTA1OURENkRhbUJjMzYySjB5VzUr?=
 =?utf-8?B?WHBsNEFSTEY0YjFLdG9JZGkzVjNKa3hkUjBFQTZ0NVE2by9UN3ZuTTZhbHJy?=
 =?utf-8?B?UnpwNG80TFdibjM4VmJNNlp2MW5UczdlQ3pxQzZVNEhIMENvbDltbXlHcjdU?=
 =?utf-8?B?VnROZGszY0tzR2NFa0Y4Ykg5ZUh5UXZZQVFvVExpVlNUOVIvY2liWDlnUEQr?=
 =?utf-8?B?ZEJJZExqbENtMHl2MzRPM3lmUEJpTnA1WVBUUmFqZVpMbmNHTllUZE9Bb24v?=
 =?utf-8?B?ektHSmV6am1lc0NoVTg4dGZyTTEreXU5QnRacWJwY2s4Z1dnUmNRV0pFNUsy?=
 =?utf-8?B?L0FOY0VqSzFNY1orTVdwMUhuUzU5UThOd1BLUUdtV0NNeFB0MERoamRhVER5?=
 =?utf-8?B?L2dwdDErLzZxN1NlT1ZpSWpibUpMZk1pcDN5aTllcjVVSjRMRXp1bjJJRzJK?=
 =?utf-8?B?VmJKdFdSYmpCWUJzdnY5ZmQxT1pQQW1ZQitrVTlsWTRmU1RKdEFaSjNYeStt?=
 =?utf-8?B?dkFMb3Q2SmFrc2M5amRSUlBIcEJjd2NvOTVSU3hHazl6RjhTaXRTT0xzQWVu?=
 =?utf-8?B?eDVCbjRVNXBtc3JZSlI4LzBTUlJIcWtNZ2lRUU9veTc5UHc3ZS9UVHlDaGc1?=
 =?utf-8?B?azNOZXhXWmtYTDlQaGluNndSdi9YK05GM2xQWFlhSGtKNTMrd29aTVIva1ky?=
 =?utf-8?B?Y00zckg5dGR3aVdZMWNPTkpKczdsNVJJUWF4MDVWRk13OFZyQkdHb2hVcEl5?=
 =?utf-8?B?SlpHNHRIVEVLY3VGY28rQVRyWTdFbGZnVVN3WGRMd0x2QzBGNHFvWkNUVjB1?=
 =?utf-8?B?a3JqQzEySXYzSEgvcnBVMW00eENXQWtJTW5saVRHRUdtL0syVVg2NUhVZnJs?=
 =?utf-8?B?WjFCMUVMVkpoTCtGTEkvMUxaUllXUGdJSm8vb2FDakhpcm9QcDNwMGsrWTZQ?=
 =?utf-8?B?RzZHK2YvL2lJVzl4UTkyTlFiKzNHc3k1aW41OTlOZngycHhyNTh0Wkl2WjIw?=
 =?utf-8?B?azBsMGdWai9vYjh2MjJWZXVNaDNTT2RZSmVZekxMVmsydjhGVmU5QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e311238-463b-484f-332c-08de89b05b1e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:19:26.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azeQgH+enl6T+o1lHljOf1OkR2NT6OdFcjYOVj6mDSZvU2gh5Atw25d/Jt7BCSBFC5bZefOlE+2xIALqJZOyNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2801

On Thu Mar 12, 2026 at 3:15 AM GMT, John Hubbard wrote:
> Alignment::new() takes a const usize, which means callers that work
> with DeviceSize constants still need to import the usize SZ_*
> variants. Add from_u64() so callers can write
> Alignment::from_u64(u64::SZ_128K) and stay entirely in the
> DeviceSize world.
>
> Both asserts evaluate at compile time in const context, so there is
> no runtime cost.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  rust/kernel/ptr.rs | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index 5b6a382637fe..b06f6b404a46 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -76,6 +76,41 @@ pub const fn new_checked(align: usize) -> Option<Self>=
 {
>          }
>      }
> =20
> +    /// Creates an [`Alignment`] from a [`u64`] value.
> +    ///
> +    /// This is useful when the alignment comes from a [`DeviceSize`] co=
nstant
> +    /// rather than a [`usize`] literal.
> +    ///
> +    /// A build error is triggered if `align` is not a power of two, or =
if it
> +    /// exceeds [`usize::MAX`].
> +    ///
> +    /// [`DeviceSize`]: crate::sizes::DeviceSize
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    /// use kernel::sizes::DeviceSize;
> +    ///
> +    /// let v =3D Alignment::from_u64(u64::SZ_128K);
> +    /// assert_eq!(v.as_usize(), 0x0002_0000);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn from_u64(align: u64) -> Self {
> +        assert!(
> +            align.is_power_of_two(),
> +            "Provided alignment is not a power of two."
> +        );

This should be build_assert! to match the doc.

Best,
Gary

> +        assert!(
> +            align <=3D usize::MAX as u64,
> +            "Provided alignment exceeds usize::MAX."
> +        );
> +
> +        // INVARIANT: `align` is a power of two.
> +        // SAFETY: `align` is a power of two, fits in usize, and thus no=
n-zero.
> +        Self(unsafe { NonZero::new_unchecked(align as usize) })
> +    }
> +
>      /// Returns the alignment of `T`.
>      ///
>      /// This is equivalent to [`align_of`], but with the return value pr=
ovided as an [`Alignment`].

