Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021132.outbound.protection.outlook.com [52.101.100.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C02D23D2A1;
	Sat, 12 Sep 2026 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234792; cv=fail; b=FFIa1JPNENZp9HJVx0wxv1dvgHEePaRnNRxCuJswxRMvHXyeJ+43yu0cvXp8PL1Q1QeO8Ky7GSP8oyVv5vraiE7SrHk0qdepN/qAHQRzHZ1eruYaPDbZ6bY782M2hBiZSBh4JvYmxu3SSk5CoQHUuas1SsCBB3dYtnPY5GSrQqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234792; c=relaxed/simple;
	bh=H+XG90/7YoRW0b2JK6QrKYfY4geWdHn3+qiWJulnOuc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ioEi0jt4pL/2nAPAF2+uToWYjDiQDmF8xnM485rhgnmYeMzNwPT98xyBIIDy4MfrzBmfRY4dZLGGzHQJg1C6x7HhxVLhKWQ9SxEoMYJgH1XaZdYcmpuZcP7iU3JXpPPuqDXxhWMTSxGWZ9YYzIS5oaYxY8EXQwH2s2Ra+5mjb8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=atChAgJQ; arc=fail smtp.client-ip=52.101.100.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="atChAgJQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+0azxdl/rJVDe+7uf7nCReaAMPKLtEcgSzJi0NAxhDPbWZqJhNtcfrCdCuCGzL8raDOTse1ynk3SMuxrBKf3c5/dfYUeN/Pw76ROya+W/yM6DYWSR5trWmXPNdy5y5R7QjMvEFtcMlwMT1wY+kNynhJa9POadqgm9iTa7nQ5d2t4qfcInS+YM/eKbcTeBYWmVbJnx6hjQzwwjk6fOKt7unPCHdYIEAfnLkOhhACAmyDJE2qlEutfg3Rup5ITQUdWtXJXFj3ZBF8Py+YKB0AHMebXxk1KAkZGtQSdNRhcokRI8yPd+7zTK2STnUGFYYeRuHducaQ9BniAOsUg6gaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z05uSBo08IR08FjLYJ4u9HVrYPk2Idgk6e5MH/4Bce4=;
 b=TtC6aN394HXTuHoyfh3vLJYzdjg8ZalS0uXj1+z7Cr1gvrmQfCG6WetX/1Uvgcfp1gQZHqq+SVeoa3GyyIPzWSSM1OgwvgdMPnVpom+z4cbDsNziQfnRoDwd0JNH3+k3tSdNA9Q6FgxT/quCT41S82rs0yuUfQhVBHwinhUVFFZdA8fJ4zCuAauYY/qxeyBvbjp6ENepPVG/aTd2lTwav5NYpx2lzBHYL2SLLbIaE7X4cm9qK7UfDVmS4OYE4SNQ58mGhjK+4CHEhhed1RedXfEa6q/d+hSQqHCspeOZ8XchT6CYdEjO9QZGFHOomshhGTlKuv+ROgUaZD+slQ6iyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z05uSBo08IR08FjLYJ4u9HVrYPk2Idgk6e5MH/4Bce4=;
 b=atChAgJQz1CGV4UcDZRtYq7dLBqjiXCkHP9jhis10KL4HnqEbpmUl3pafS0N3DQwOTP3+xjED5i5T87TPewRtZagUXOcRqPfPFdFn5iSAUg3/SB7KRA6m7FuVKpIlgRMcuL+khI8ijiykarKV+DFDRzi67NiCtALif724z3NGuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB2196.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 17:39:46 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 17:39:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 18:39:45 +0100
Message-Id: <DLDISP0KIJKW.1VD0GUGOT9XL9@garyguo.net>
Cc: "Filipe Xavier" <felipe_life@live.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: impl_flags: add conversions for raw flag
 representations
From: "Gary Guo" <gary@garyguo.net>
To: "Filipe Xavier" <felipeaggger@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260912-add-from-raw-conversions-v1-1-0cee34684d24@gmail.com>
In-Reply-To: <20260912-add-from-raw-conversions-v1-1-0cee34684d24@gmail.com>
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB2196:EE_
X-MS-Office365-Filtering-Correlation-Id: 1555fa2b-086b-4c02-03af-08df10f4d600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10070799003|6133799003|22082099003|18002099003|3023799007|921020|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	58ggwmFYtQOb4IzaTeqp8xn8Bj/dtSFg5JzTdAqQF7yBAssXDtedKOTEuh4lLru2O3WEp87tbeVGGUh5WlhKCe/qZ2Yzqp2EFUK65Zx+WUTEgaWSyoDwSn0nwgIPy27wzHYBm3QGQxJ8p3TLM9HD3RE2sUdpqOBLLRepvV8CPhne+ckPQd4i5uZz3VJUXPm+BGntWqwD25WbWdjyW/YU8NpgQHv2Fdk/WlUsjq6PXT0dLYdj4AZQmQLJeyj1f/g4wE1XanejRVfLfjEca9Cf05Uiygf6fAn2kBwwsdpqJZVexMjh6LjpG33HT2IXVWvpI+1McwMo1vqotW44X4w4es8cp5HYtE98T0HtddorTYEzi9uRwPIOmEs2CnR/tuFy6jAHM2X+QqHEvcrFAM72eUbbbpTNxK+72OX7KFTaA4vNA8FjlHnSxpT7fxJdi3FWm5LC2Pt++5TNAB6h/cUdnB0UK+CqmxKBZvWPVBi7PGRJy9LDPolY6uvu/i86ATUOqER1E+9PRn29tZb/UiTpW9pKtdrPZeqa7h4CEAcJlhF96H54MFayiIGAx8df+/srObHhQSYvCJ+FyIbXDqdmdn/b/6DN3pREquiYW9xnC+yD2uyMK9BkyddnW2/hpxhfLLB2SuLN7jmRZ1f/3SzE37bvCcUNDPqz7rhTLAFAl3KpILk0YmrYYAUn/Df1R4vQUgXd7elu53fg1p2Q9tJXCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10070799003)(6133799003)(22082099003)(18002099003)(3023799007)(921020)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkttYlc1YTRpQXYrKzZaT0tEc1F0bmJDdzJJSUFGVUdRZXd0VU9ob0JGdWwz?=
 =?utf-8?B?dkRRNWFLay9nK0VqbGk5ZTB0UExmeTBEU2VicFEvMmlsU1d1NWNncWQxaWQ4?=
 =?utf-8?B?alJ5VEFtWlBTMXdVdHlveUNEbmdWL0FOWFFMY2ZGaVdZb3pSaEFWc09DRGtn?=
 =?utf-8?B?dWh5UXNmbzNGN0kwUzM5eGY0bzJhQ3FpMndoL0NsSnpoZHNDUmRmVXFoUGEr?=
 =?utf-8?B?bUVRQzFLeThUMHRRNjBPOGh2M3N6YjVhRFM2alNTcEJmK3haODVJSjFRVFMz?=
 =?utf-8?B?VytnNDR2bzJPZjYyT3lNcjNxUG9WYXZhdVcwaGc4SVdhTnl3QitrYVBHbjgr?=
 =?utf-8?B?YVIybDNUYUl2Y3JFRDFjNllJanRZRHFZTjB6a0NFTFJFc3ZxMjlBQ0lJaU9m?=
 =?utf-8?B?UUxVakV6NVlnbnV2QUlTb1U0ZWNudVpHYkxyaCtkVld2TnE3dkVRQkpoZmNX?=
 =?utf-8?B?Vzd2Y1BqN0liamk3MmR6alZFOThKN3ZDQm9URW51WVNYcGh1MWlPR0xXUkJS?=
 =?utf-8?B?TEFrOVpSSmR2RUM4aUJETE1jWFM2c2Y1QzFWWlJOMklvTHhpWkRzaHNpbWNV?=
 =?utf-8?B?QjdIQXNYVWwrVldMQ1B1dlUrQml2dEtMR2RBT2xIL1d3blJaOGcyZUd1ajQ5?=
 =?utf-8?B?Q3VpSFhyMXR6YUhoZGdyQk1Ea1d4a1dHSU1QbmdtcWpLT1NxNDBHa25RcFJH?=
 =?utf-8?B?QW1rUFJDbnh1QnJYZzZJWUhWRHdOa2taR3huRzQyVmIxbnVyclgrUHBRRExL?=
 =?utf-8?B?WGx4Rlp5N2h1dTZiMFV2Zkx3QVJWUVRqMHJ2TGpjVS9RUGFUM3B4cmFITk9G?=
 =?utf-8?B?MFB5VW1xZVpqcGlTWkRvVWEwRDlldm1xeUdpOGdkV1hqS1JYRXo2bkkzSXA3?=
 =?utf-8?B?Yk1LWTg2TXVYSlJWc0VIak9ndlhPb3hHWnpDMEdNT091a0Y4aDlSa05oZlY3?=
 =?utf-8?B?S1IzRmxmOHpsY2ZSNzJpbkpSbG1KWXAwVmNlOUNnTC90eWZvYnJCVXd1S3Zw?=
 =?utf-8?B?Um5PRnQ0REhrcHY2WVlGMml3T1YzcVRwWk5HT05WeVoyT08yWnZPMUp5MFpv?=
 =?utf-8?B?NzJ5SUZtVUE1UFc4Y0w1RHplNWNDcklLWUM0NWVtc2JyK3NJczBHZTY5d1lM?=
 =?utf-8?B?d0wvUmJMQzBxREVaZEdsb2hBNyswOW9lbzFoeEhWQjVQL3NWYk53bE5YNjlO?=
 =?utf-8?B?UCtzVXZyTzIxWkxtZXBoWi9VM1NiM0dDZStzTFovZzF0aFViNkF3UGJzbW5Q?=
 =?utf-8?B?MGR1U055MFdROFVqQUloOHh6bVNTTWJTUEd6NW1CZjR4YjRxbHVYYmpLME54?=
 =?utf-8?B?ZG1HR3I5UHVwdWNqNEptalNnNFhSUnA1dk5EUThBSy9ybzBXelhYZVZGSzQ1?=
 =?utf-8?B?UHZqbjg4OHlLaXM4NWMyN29YQXIxMHB6akJ3UDdWenBCZUgyRlY0Y1I4dFdT?=
 =?utf-8?B?T3JFUUcyUUMvcTJLYzlYQVg5R1hMNlU1VXAxRGZIaXJiLzJSbE9iYnhUekNU?=
 =?utf-8?B?TmtCOHEvekY4R01KaFpZTDBCNGVBNW9PY0FQTThpek8rWUxZbVR1S1dHMDBi?=
 =?utf-8?B?WGNBUXllajA3TFdLeFBpSXB3ZmdNM3ZFUW9KNjQ5Z0NieWhEdUxwUWVBMUdz?=
 =?utf-8?B?eEdIN05IZjNQZ3FKbjllM1RXeEJ6cGZIR1dYM3RYcXdPYjZlZHZhZldodE54?=
 =?utf-8?B?K1VhaDA0dEtmd1FpMXNEUUFvaTlRdVYzSmpUNnZxbnRHMVh1NWNTUDZ6TDJv?=
 =?utf-8?B?TXlRNWpCOStzeEFGN3ZlUEJUaWF3U0lWOElicDFCb3hDSVBFcGdxUUt3VHky?=
 =?utf-8?B?VHVQS3JYM0hxK1JHRHNZdVhML3A1eWpya2Q0YkczVE54aW1TMXdxYjhuOGNz?=
 =?utf-8?B?RWFNWGtwdXByWlZnbHZxMndJTkZwY0pORHdHclBkNndMbG1VQUhGSG1NNXl5?=
 =?utf-8?B?ODBUN1N3TFJjM2ZNbzdzWjdyTEpjQTRQb2djNUZYbVpZM1hCd2lJK2Z6SURG?=
 =?utf-8?B?NlE0MS9ZNWVrVnB6VnZKdmNlVk5yZ2pxRXphaUt6bnNLYm1GMFpvYTA5dHR6?=
 =?utf-8?B?T0tSNmp1cVVXOVFXTWg5Vm1pSTdpTllKdEo4SWlqTmtLTDdzTlZaK1V5UVFQ?=
 =?utf-8?B?SURUTGxPdTJkbjdDU21HZ0hUU1RqT0FtK1NNR3NkdkNaa2grY041T3dab3Jp?=
 =?utf-8?B?bVJtTHNjTWRnajIwbzRIb1hzaTlOR3FKSmlSYlM0VTZkU2UzclZnUE5TajN1?=
 =?utf-8?B?TTd2VzdsK2NOM2lKME1wcHhkUGNpODI1NDVtb25XM05jTnFuOHRSaDluWkc0?=
 =?utf-8?B?L1lzVHpEQ1lGa25nK1l0M0dmT0N1eFZzSTA5UEdZNnNSeEo4VjJCZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1555fa2b-086b-4c02-03af-08df10f4d600
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 17:39:45.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoulEk1bQlMtXGJFeNNfijfX583EriB2dTVZwyX/vGw8cWFH1x3zD6A2x+FbDgLPUYyZkARJCt92rgAjyHWZ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2196

On Sat Sep 12, 2026 at 5:54 PM BST, Filipe Xavier wrote:
> Extend the impl_flags! macro to support conversions between generated fla=
g
> types and raw C/UAPI integers. Implement TryFrom<Repr> for individual fla=
gs
> (exact variant match) and flag sets (rejecting unknown bits), along with =
an
> unsafe from_raw() constructor for flag sets. Additionally, add BitOr and
> BitOrAssign implementations between the raw representation and flag types=
.
>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> ---
>  rust/kernel/impl_flags.rs | 103 ++++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 91 insertions(+), 12 deletions(-)
>
> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
> index fdf44d5eea9cb907f6d8d209792a1d9b74b55be6..b6cce7318766419efbe18d291=
5bd8f949c1c7c19 100644
> --- a/rust/kernel/impl_flags.rs
> +++ b/rust/kernel/impl_flags.rs
> @@ -14,6 +14,8 @@
>  /// - The struct and enum types with appropriate `#[repr]` attributes.
>  /// - Implementations of common bitflag operators
>  ///   ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
> +/// - Conversions between the Rust-native types and their raw representa=
tion.
> +/// - Validation when converting raw values back into Rust-native types.
>  /// - Utility methods such as `.contains()` to check flags.
>  ///
>  /// # Examples
> @@ -68,6 +70,22 @@
>  /// let negated =3D !read_only;
>  /// assert!(negated.contains(Permission::Write));
>  /// assert!(!negated.contains(Permission::Read));
> +///
> +/// // Convert individual flags and flag sets to their raw representatio=
n.
> +/// let raw: u32 =3D Permission::Read.into();
> +/// assert_eq!(raw, 1);
> +/// let raw: u32 =3D read_write.into();
> +///
> +/// // Raw values can be validated before entering the Rust-native API.
> +/// assert_eq!(Permission::try_from(1), Ok(Permission::Read));
> +/// assert!(Permission::try_from(3).is_err());
> +/// assert!(Permissions::try_from(3).is_ok());
> +///
> +/// // Raw C/UAPI fields can be updated without an intermediate conversi=
on.
> +/// let mut raw =3D 0u32;
> +/// raw |=3D Permission::Read;
> +/// raw |=3D Permission::Write;
> +/// assert_eq!(raw, 3);
>  /// ```
>  #[macro_export]
>  macro_rules! impl_flags {
> @@ -103,6 +121,13 @@ fn from(value: $flag) -> Self {
>              }
>          }
> =20
> +        impl ::core::convert::From<$flag> for $ty {
> +            #[inline]
> +            fn from(value: $flag) -> Self {
> +                value as $ty
> +            }
> +        }
> +
>          impl ::core::convert::From<$flags> for $ty {
>              #[inline]
>              fn from(value: $flags) -> Self {
> @@ -110,32 +135,45 @@ fn from(value: $flags) -> Self {
>              }
>          }
> =20
> -        impl ::core::ops::BitOr for $flags {
> -            type Output =3D Self;
> +        impl ::core::convert::TryFrom<$ty> for $flag {
> +            type Error =3D ::kernel::error::Error;
> +
>              #[inline]
> -            fn bitor(self, rhs: Self) -> Self::Output {
> -                Self(self.0 | rhs.0)
> +            fn try_from(value: $ty) -> Result<Self, Self::Error> {
> +                match value {
> +                    $(
> +                        v if v =3D=3D ($value as $ty) =3D> Ok($flag::$na=
me),
> +                    )+
> +                    _ =3D> Err(::kernel::error::code::EINVAL),

This shouldn't be just EINVAL, but rather a new error type that is converti=
ble
to it.

Best,
Gary

> +                }
>              }
>          }
> =20
> -        impl ::core::ops::BitOrAssign for $flags {
> +        impl ::core::convert::TryFrom<$ty> for $flags {
> +            type Error =3D ::kernel::error::Error;
> +
>              #[inline]
> -            fn bitor_assign(&mut self, rhs: Self) {
> -                *self =3D *self | rhs;
> +            fn try_from(value: $ty) -> Result<Self, Self::Error> {
> +                if value & !Self::all_bits() !=3D 0 {
> +                    return Err(::kernel::error::code::EINVAL);
> +                }
> +
> +                // SAFETY: All bits set in `value` are valid flag bits.
> +                Ok(unsafe { Self::from_raw(value) })
>              }
>          }
> =20
> -        impl ::core::ops::BitOr<$flag> for $flags {
> +        impl ::core::ops::BitOr for $flags {
>              type Output =3D Self;
>              #[inline]
> -            fn bitor(self, rhs: $flag) -> Self::Output {
> -                self | Self::from(rhs)
> +            fn bitor(self, rhs: Self) -> Self::Output {
> +                Self(self.0 | rhs.0)
>              }
>          }
> =20
> -        impl ::core::ops::BitOrAssign<$flag> for $flags {
> +        impl ::core::ops::BitOrAssign for $flags {
>              #[inline]
> -            fn bitor_assign(&mut self, rhs: $flag) {
> +            fn bitor_assign(&mut self, rhs: Self) {
>                  *self =3D *self | rhs;
>              }
>          }
> @@ -155,6 +193,21 @@ fn bitand_assign(&mut self, rhs: Self) {
>              }
>          }
> =20
> +        impl ::core::ops::BitOr<$flag> for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn bitor(self, rhs: $flag) -> Self::Output {
> +                self | Self::from(rhs)
> +            }
> +        }
> +
> +        impl ::core::ops::BitOrAssign<$flag> for $flags {
> +            #[inline]
> +            fn bitor_assign(&mut self, rhs: $flag) {
> +                *self =3D *self | rhs;
> +            }
> +        }
> +
>          impl ::core::ops::BitAnd<$flag> for $flags {
>              type Output =3D Self;
>              #[inline]
> @@ -240,6 +293,22 @@ fn not(self) -> Self::Output {
>              }
>          }
> =20
> +        impl ::core::ops::BitOr<$flag> for $ty {
> +            type Output =3D Self;
> +
> +            #[inline]
> +            fn bitor(self, rhs: $flag) -> Self::Output {
> +                self | (rhs as $ty)
> +            }
> +        }
> +
> +        impl ::core::ops::BitOrAssign<$flag> for $ty {
> +            #[inline]
> +            fn bitor_assign(&mut self, rhs: $flag) {
> +                *self |=3D rhs as $ty;
> +            }
> +        }
> +
>          impl $flags {
>              /// Returns an empty instance where no flags are set.
>              #[inline]
> @@ -253,6 +322,16 @@ pub const fn all_bits() -> $ty {
>                  0 $( | $value )+
>              }
> =20
> +            /// Creates a flag set from its raw representation without v=
alidation.
> +            ///
> +            /// # Safety
> +            ///
> +            /// All bits set in `value` must correspond to valid flags.
> +            #[inline]
> +            pub const unsafe fn from_raw(value: $ty) -> Self {
> +                Self(value)
> +            }
> +
>              /// Checks if a specific flag is set.
>              #[inline]
>              pub fn contains(self, flag: $flag) -> bool {
>
> ---
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
> change-id: 20260912-add-from-raw-conversions-4647d890bb77
>
> Best regards,


