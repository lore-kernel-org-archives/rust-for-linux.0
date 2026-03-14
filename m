Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020121.outbound.protection.outlook.com [52.101.195.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A5A55;
	Sat, 14 Mar 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773496615; cv=fail; b=SXikFCLROCyjuS+ndaAvioc8shF0kSkY4nQlwI0gDg55htKrkSF8RqrP2+c+jcNt6Gw4voLc5EF+LxiFK4w+zLM9okFivnc9IJ/N3fFFg385jti3MZNLchjK1kQaKaiyhX5vU264y+LDIxhp6P7jW4MTDwz119BorjJ4kUcd/LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773496615; c=relaxed/simple;
	bh=BwDJdgtQ75zBDs6uHTRKWyGgdFnwkej9gQDVJnZSBfc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DyMm/TpJrznLHF32B8GmUpC30qS6GRrnfTOrF0I+0p6fv2XqWsH91EHRo/l5pddloWsa1SLDYgLChWnKrVhmy16JhaNxsANrqEI9K5vuwXlbbuwWBteDBMGXN3sBUo2Px/YDv9Re32xVFMS7fqEtXsNV0zObRKlMpzv4DSxN32s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BT20lFvC; arc=fail smtp.client-ip=52.101.195.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BT20lFvC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jd7p0rbX7VSKy31vxp9mPJImBCXPEjzPW6Q8FSBMQPDDv3Z2FEdhC23ph2BDVQyCldoI1ZTT2GLu4CoTAdiH0jfRjq3sQ+CMxMKPmpdkeLaVKBklsc4rDYBj1JCWnTfIT3/OBGQ367sh3n6EvcDt1VAGM23zBoXbyWjqVEUlpwjAMjIIrCAsea0TrYfdi1Q7H0KRZNOLnhH0OPkp7u1y6AngvH0oGgK+Q99/2mUK0tZqOUi7trv5zDaYxn5lzeSPSt26JnjNl31KuqMHFAU4lo9PE1QtUInL+UIZw8MM4j66zOglM+dBccgDfr/L7TD+ZJgoyXWz5WwtKVGWri6rSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6wBKEWe2UfKxjsW086jK/qQhmoajIToVVuhYqCsscI=;
 b=LROgWxruiLwDRMRxD7RAYVKpAa9WAp+k21uyTEOrTmig69fYDVPe7Z96uHRclKCrfee8M2eP2+20NzghveFaFO81g1ihvEpb3IAWato/sOCqK8ndEEdA3b/z5gJinA3EQF3rqNEjSM9lmm7MqWo2Vc0IhM2dHnriCrxoDxNZPGaFYKS+Wz5lKz5gGoPp+zSlzYOOGfmbNno8NTaiA6epExE0fZ22KWygjyxPiKdqCRfAraXMW15Ub66XoZ1kDNlypc3T6ogJBy0fFjttoKTREcMhuIDi3CRaE42MLDC9WnbPl9vaxFzSXVNR+vkE1Afg+iUFroTmjSXTCynzM+DpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6wBKEWe2UfKxjsW086jK/qQhmoajIToVVuhYqCsscI=;
 b=BT20lFvCcTbgqGTqqB3LpBFwAgmZc0WeEwiRMrpw+jU4T74RUbx0HSFxNq3sEbz9Vge/J5KC2kmP/iOP5AC/cBszfA6gJ+dh14BApAwa4qPhOKyecQRBX0/j4I/Pm9/gqN8FW2yiTcrPW98WquLYUpliu9XCJBwuK7Wx1Cj2x4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1801.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:fc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 13:56:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 13:56:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 13:56:50 +0000
Message-Id: <DH2K2VEN94JH.3K1WTNSTYEUSU@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 08/10] rust: io: introduce `write_reg` and
 `LocatedRegister`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
 <20260314-register-v9-8-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-8-86805b2f7e9d@nvidia.com>
X-ClientProxiedBy: LNXP123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::31) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1801:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb96e80-546b-489f-0a97-08de81d18af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|18002099003|56012099003|22082099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	x0XCBWPJTojNHdILCpfsYfUHbU7+Q0QGy+LYEPCZXIu8maAz6+wtNJuDmd5ePxx+zwqHIZY1WkK0447azftb4ngWGaWABC3l3Hu9SSrpiRsck25coEqaj2EFso7AyCOEGX54Y9bUEXAUQCDKmYf8kjx80I1YyHdwx4iL1z3RQwSqiBbUMVXoa4k/J9IPF/+DHHjWM4Mn7M3Hwjr5vH5xsNSCsJy20Cl23X/ZujqpSb1H2mfPjl/x8yz+k8VYX03GrICW15Hpwa0C9jqnVUdEyDDjj0QlKVDd2Wr9GtbPHpcgbqaqzQ6Ahr5AiaVP2mtuHPOHXMYvWFpiLptTLJmGBNMvONT+Sox++MBBuAHrFPRaJejbn91yB/DBTkjjvx2hQdZuZRSc4JG4g6Txh6l2qxd5HNgfVRy+4bE8P71m3dayY6NEdsorxdyKwB40nZxEyzWyk4F2FgORcbGtehrLVWk0ezl/8fjx9qe7NDkU4erD0Js2Lgxw6TiJ7U51Uw3k9RHSFmdC43T8LICkHw5569s56R2rooeOXE0WGiXhvZces7y7hh9d8ls/3fj1vSS7bCSK+KxUtf7R+0khlqgBltSlhMGSnu6t3GdWUfvnbcBOYS7/tVmI+zVNKVrAXFGpI9L16ib5HXBKukjtyTi7e479lNQ/7u6T9yG/+pUSSdxAfZ15pVpNjjVlFBrd/DLoRYrRW+YSR8Ugf3XKXLqVOW3rndY9xii42rHzYb1pM0oktuSxmHVMDVUL/KIehnXS1aDaQBDvfP8wTCSZS5vBDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW1CN3lVYTljWWdUa25WemxOWk1LZ2QzeXdhcjY2M1lBZXRUR0xyM2pZZHJU?=
 =?utf-8?B?TXErTzh4YWlMWHgweXA5Y0dqZnJJUGlXR2tmZ1V2dlkyL0ZDMGZoTW1LYnFX?=
 =?utf-8?B?WG94aVhYcUlDdjM4SjNEcThJanprcDViT2JPTVpFWnF0Vldxc3ZIYmtzNC9T?=
 =?utf-8?B?ZDg5dXlheHRydVdreWxnOW9UcDNJZTc3SnZ2Rktrd3RRU1JaYWN5L3IzMFJR?=
 =?utf-8?B?bzZDcnFUdHpOVWwxREc3bHYvTEp0VDdPaTVvemZPc0RkV05aYlpHMnNuSjVL?=
 =?utf-8?B?VVFycEx0M01TVWpLYnJQNFBJcENBUkxOVXkvRVd0WGpMS2ZsOGVVYklTcGxX?=
 =?utf-8?B?QTJ6RG9qcmVXNnJLb0x0OEc1YURVSUpGNlRMVnFCOS9iZEYxQStrTjFSU2pB?=
 =?utf-8?B?UjNQRDlXZmU4V0RVMEYySHVhSTVEQ21PdzRhdU5hOXRkcHJQZS9aS296Z3Bm?=
 =?utf-8?B?TEQxR1VDZ2gxZlF3UVlpM3JHNG80T1Q3WElnbWpFMytna2QvYTE2UEZvYXgv?=
 =?utf-8?B?b1ZoNGFjMCtqY2lWdzc3ZWhybm1BN1lMREx4ejdHUVNXT3o4NmJXcmJaNFk3?=
 =?utf-8?B?RGRiT1ZDWUxKbmozTzU3c29KTm5RZUtWS2p0OW96L0cyK2RZNGhaUGNta1M2?=
 =?utf-8?B?QjRTNk5zWEhlRTZLby9oS0RUWVJ0THZGUXQwcytMbEFkdldtc0pZTVpobnhi?=
 =?utf-8?B?eTFkWXJMc2ZmQ0kxUzJ3MW9PdzJhYWxRRURGQytDZkx5WW1reEtOM2diTXpH?=
 =?utf-8?B?aHJMeW92RG9JRHc4Y3E3QnB5T2pSd0JpLzdHK0ZxaWdXclFXUGhQaUN5Um1O?=
 =?utf-8?B?Y1RLWGRDRXBrVWE4VE5RSUVYaGZuQUp6MElUZTlaMWw3TGt5ZUxieHRwYytC?=
 =?utf-8?B?cGpZd3c3eDlrZC9JTzRRQWZWeVhXNmdoNWg5Vy9PYnlOYld1Um8zUjNrYlBy?=
 =?utf-8?B?d0d3a3ZrUUxDcTlNNW1YT3h2cDlkUmdHbHBnNHdCdUNISkJVZlppOG51RVhO?=
 =?utf-8?B?eDNOMkxXanNVcGpUTmNIL1RHOUlEN2lJVWo1QmpQazBYSmNnK3pWOXlWcmNu?=
 =?utf-8?B?R0V2RVZyL2pHcFRpeHc3MVdjQzkvUTlGeDZDWmhDTkkzaHVwdWpTNXVzTjl1?=
 =?utf-8?B?Z3Zlc3BQMzJ3RXFma3hqZVlwQjJ2Nmx4ZmxyOURwK1p2aFZRN1lzLytGWjRN?=
 =?utf-8?B?enY2bTBFZ2JGZXo4ZktZR1YzbEZuSE1abDBQakU5a2lCb3pScUVLTHFLNnhV?=
 =?utf-8?B?L2xHY3BwNkpDQ09tTlZvbTZUUDQzUk9UMndlMVhkR0svWUVkN1dxcUY3T0ZO?=
 =?utf-8?B?bCtBZmdzR2I3RnpOeUlSbFFwM0JZN2lCMXlmdFJsczMzNVgxQlIrRmxaWkJq?=
 =?utf-8?B?TVM0RFM5bmZwNWNqU3Blczl0SVFmS3FDc0RibVkrcnNleENHR3RpaWkycWJX?=
 =?utf-8?B?eU5vTWs4Y0xmRGwycmhjNnhUSjZ2S2ZFaFNvTjJzbkU3OTcraXBabTMwQitW?=
 =?utf-8?B?ekV6M0d3UEJ4OG9RTGFPRldZR2w4bER5R0hVYU01WlVNV3lkby9sUGlJQWZj?=
 =?utf-8?B?MHJEQmQvenFmNldTMDJVVk1CS1hXT2VKZm1FZ2ppNlpFQXRRRzcveHEyMWRj?=
 =?utf-8?B?WU1oRldXc2lRaWJ4YTVRUzdqT0VkLy9IUW5qUlJySExqNGpNMndHMzJsRUlE?=
 =?utf-8?B?MlVHS2RROW5QeFlGWHFYc2NmOWpGOEUwL1lKSjRYOWtNTS8wS0NwdjRpRERs?=
 =?utf-8?B?R0RoUGlKS2NOZFJrR2xTc1I0K3dzUjNsOWVNUkVjYmFQYTR6c2RzWm11WWZr?=
 =?utf-8?B?VUxFbDNadzd0V0tBeE41SnFuaHRtbjVmVkhhUHlwZk1jTFc5NXhKeGNUUm1j?=
 =?utf-8?B?ZEMyNC9iTEVEK3BZL3JCaTBaZHpFSGxqSkhvZm9nWlUyWjZlY2FHaGwzLzB6?=
 =?utf-8?B?L21wWXFjK1VBTlVQMVFkelNEaDJjclQvRUxXVmRwdjhwaFhGa3FSN0ZmN3lZ?=
 =?utf-8?B?NUx4eEF3cVhsRE9zN0F4QWZSbHFqb0FOME5pTVNXZFVvNXlTcmlaa2JCSWNh?=
 =?utf-8?B?ZUJITjhoSHhwa3drdWVjVUxic2tzbTdJb3k1VE1zbFh0RXlLZ1dvd0hqWmxW?=
 =?utf-8?B?RXkxQzE1Q25nZ0lJMXVLekhIajY1YjF2eVJoS3BCRXJKdDBaazJBVlRlRmhE?=
 =?utf-8?B?cG5tL1BTeHEreS9pbDUyYXF5ZWNyVU4zWmdPcXhMalBwSG01SCs4UDJZTUxJ?=
 =?utf-8?B?SGNnSUN4eGUrZVI1OXNjQkhVSVM1TGdOVnAyZVhnM1BlWVY5ck1sdzZISEhr?=
 =?utf-8?B?ZjZtZEExL01MRkdqZzFBWnAxTWVzWGh1anpOOGJINjJ3ZllqeDBWZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb96e80-546b-489f-0a97-08de81d18af7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 13:56:51.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qhat1helkORLAZz5CDi77GF+OmjdYOqa5nwLJzwhYguISU4ig0t+XNxCvjSU7eKSBSyaiEluA93jKiI8PVb8tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1801

On Sat Mar 14, 2026 at 1:06 AM GMT, Alexandre Courbot wrote:
> Some I/O types, like fixed address registers, carry their location
> alongside their values. For these types, the regular `Io::write` method
> can lead into repeating the location information twice: once to provide
> the location itself, another time to build the value.
>
> We are also considering supporting making all register values carry
> their full location information for convenience and safety.
>
> Add a new `Io::write_reg` method that takes a single argument
> implementing `LocatedRegister`, a trait that decomposes implementors
> into a `(location, value)` tuple. This allows write operations on fixed
> offset registers to be done while specifying their name only once.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs          | 70 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/io/register.rs | 35 +++++++++++++++++++++--
>  2 files changed, 103 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index bfea30a9acdf..24e6b48b6582 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -17,6 +17,8 @@
>  pub use crate::register;
>  pub use resource::Resource;
> =20
> +use register::LocatedRegister;
> +
>  /// Physical address type.
>  ///
>  /// This is a type alias to either `u32` or `u64` depending on the confi=
g option
> @@ -473,6 +475,40 @@ fn try_write<T, L>(&self, location: L, value: T) -> =
Result
>          Ok(())
>      }
> =20
> +    /// Generic fallible write of a fully-located register value.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Tuples carrying a location and a value can be used with this met=
hod:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{
> +    ///     register,
> +    ///     Io,
> +    ///     Mmio,
> +    /// };
> +    ///
> +    /// register! {
> +    ///     FIFO_OUT(u32) @ 0x100 {}
> +    /// }
> +    ///
> +    /// fn do_write_reg(io: &Mmio) -> Result {
> +    ///     // `FIFO_OUT` provides us the location of the write operatio=
n.
> +    ///     io.try_write_reg(FIFO_OUT::from(10))

This is not a good example, as I want to make FIFO not generate bitfields i=
n the
future and so people write

    io.write(FIFO_OUT, 10)

Perhaps replace with any other register example that has bitfields..

The version register in the updated doc comment below is a very good exampl=
e...

Best,
Gary

> +    /// }
> +    /// ```
> +    #[inline(always)]
> +    fn try_write_reg<T, L, V>(&self, value: V) -> Result
> +    where
> +        L: IoLoc<T>,
> +        V: LocatedRegister<Location =3D L, Value =3D T>,
> +        Self: IoCapable<L::IoType>,
> +    {
> +        let (location, value) =3D value.into_io_op();
> +
> +        self.try_write(location, value)
> +    }
> +
>      /// Generic fallible update with runtime bounds check.
>      ///
>      /// Note: this does not perform any synchronization. The caller is r=
esponsible for ensuring
> @@ -578,6 +614,40 @@ fn write<T, L>(&self, location: L, value: T)
>          unsafe { self.io_write(io_value, address) }
>      }
> =20
> +    /// Generic infallible write of a fully-located register value.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Tuples carrying a location and a value can be used with this met=
hod:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{
> +    ///     register,
> +    ///     Io,
> +    ///     Mmio,
> +    /// };
> +    ///
> +    /// register! {
> +    ///     FIFO_OUT(u32) @ 0x100 {}
> +    /// }
> +    ///
> +    /// fn do_write_reg(io: &Mmio<0x1000>) {
> +    ///     // `FIFO_OUT` provides us the location of the write operatio=
n.
> +    ///     io.write_reg(FIFO_OUT::from(10));
> +    /// }
> +    /// ```
> +    #[inline(always)]
> +    fn write_reg<T, L, V>(&self, value: V)
> +    where
> +        L: IoLoc<T>,
> +        V: LocatedRegister<Location =3D L, Value =3D T>,
> +        Self: IoKnownSize + IoCapable<L::IoType>,
> +    {
> +        let (location, value) =3D value.into_io_op();
> +
> +        self.write(location, value)
> +    }
> +
>      /// Generic infallible update with compile-time bounds check.
>      ///
>      /// Note: this does not perform any synchronization. The caller is r=
esponsible for ensuring
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> index 40085953c831..b26dc2400009 100644
> --- a/rust/kernel/io/register.rs
> +++ b/rust/kernel/io/register.rs
> @@ -80,10 +80,10 @@
>  //!     .with_const_minor_revision::<10>()
>  //!     // Run-time value.
>  //!     .with_vendor_id(obtain_vendor_id());
> -//! io.write((), new_boot0);
> +//! io.write_reg(new_boot0);
>  //!
>  //! // Or, build a new value from zero and write it:
> -//! io.write((), BOOT_0::zeroed()
> +//! io.write_reg(BOOT_0::zeroed()
>  //!     .with_const_major_revision::<3>()
>  //!     .with_const_minor_revision::<10>()
>  //!     .with_vendor_id(obtain_vendor_id())
> @@ -379,6 +379,34 @@ fn offset(self) -> usize {
>      }
>  }
> =20
> +/// Trait implemented by items that contain both a register value and th=
e absolute I/O location at
> +/// which to write it.
> +///
> +/// Implementors can be used with [`Io::write_reg`](super::Io::write_reg=
).
> +pub trait LocatedRegister {
> +    /// Register value to write.
> +    type Value: Register;
> +    /// Full location information at which to write the value.
> +    type Location: IoLoc<Self::Value>;
> +
> +    /// Consumes `self` and returns a `(location, value)` tuple describi=
ng a valid I/O write
> +    /// operation.
> +    fn into_io_op(self) -> (Self::Location, Self::Value);
> +}
> +
> +impl<T> LocatedRegister for T
> +where
> +    T: FixedRegister,
> +{
> +    type Location =3D FixedRegisterLoc<Self::Value>;
> +    type Value =3D T;
> +
> +    #[inline(always)]
> +    fn into_io_op(self) -> (FixedRegisterLoc<T>, T) {
> +        (FixedRegisterLoc::new(), self)
> +    }
> +}
> +
>  /// Defines a dedicated type for a register, including getter and setter=
 methods for its fields and
>  /// methods to read and write it from an [`Io`](kernel::io::Io) region.
>  ///
> @@ -433,6 +461,9 @@ fn offset(self) -> usize {
>  /// // The location of fixed offset registers is already contained in th=
eir type. Thus, the
>  /// // `location` argument of `Io::write` is technically redundant and c=
an be replaced by `()`.
>  /// io.write((), val2);
> +///
> +/// // Or, the single-argument `Io::write_reg` can be used.
> +/// io.write_reg(val2);
>  /// # }
>  ///
>  /// ```

