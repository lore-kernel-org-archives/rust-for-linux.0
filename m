Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020136.outbound.protection.outlook.com [52.101.195.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C37365A03;
	Fri, 27 Feb 2026 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215478; cv=fail; b=nQXDbUt1jXtQ9/9n/9wSDAPgERTVAk1xhAqpZq7r8Mo+xhsCo7YnU1lUnSKqIQImfCzET0taTyePHdhF2piY8y9L9gTB2d/HWyPHv78JiLsKlvxIb7Nok2T2KH748nL+HnI4k5MIFpt6J8vGOFpTwYj7zZ2B/nZRYgIVRNjugAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215478; c=relaxed/simple;
	bh=2l6n3gkdszQItWBilGcnz96++L5jUNpNjp7k3NeP2WM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=qbPuUEthVVxHeUnVu7ADkWrTtHjwls9QKbyd0ZEzb/3eW/Iv492kf+iMthFvt/pzLpywlHRdyAzfnSTGkIQmiP6S10kj9gzeqZ3Ddasi2Al21wCZtEiYQBYtlxg+ja8yfxiLMxNDNuZCGNf5olhZd264/2cAQYQU6hlxeEZQ4C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qn3OzuKJ; arc=fail smtp.client-ip=52.101.195.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qn3OzuKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGEhxkz3mb4REnx2HGIU168GT1zZ3+H8L1LfTh5i9u+u3uxdnmFIwSzlLqrwKfkVp7TSwm6nQ9pVNkZrXRZzlNErLNIlU7tbIdZncu1HjsiR9P3XjkKOtAV3Wh+2ik/mZK57phxlse0EDbqq+7aIULc/mSTikZ4EmKq62US10Xsf115ZbJNThipb28sc0klSz2NbEN5UjVSSg67JgYAbkBhJXrc7n4lBH6Jzq+ToxjlqFZVa8p94z6qPymiJyupBMTzmzOYNM3K/ZcvGiAeKRIAf7TtYIEhAFFK1EWl67lVDCkWFWfZVtSMcdBa/omw7LTflX86PYxfklpYqpPZwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSmMsmDYV/nKeVDA3yGg0IgjrmJp7ka+E5NeO7ERyCI=;
 b=E7FaWdBX6g0cY72O0llmL80TQDQesYIcJMmmt/Mmqn5PNfVM+mIN0n/n7giPzovQrw3SRiOS47FshNTkSAGcFgdNIHbYwQXH1qgMLZ95PergIycivMzUEkDoaEyHTfTBiZENFs84CYUgMd23aFNf+GeCLTHkIpUbu2omG7Q5vXp2FB0Pfh+L6YdwgOhyFJDWnJwYZjLc9ugSBRlAh76hKQ8Inx1gF45eBni0sJoR0lOrsWur6LIa0pSCLsWHMfzd/MWmNJPrm981zp8LFbmgMFX4uNYk8f1K3q1RWmWMO4VYKKsZECc/H32EqugW9Ej6BffRNLgqLHeYmtoLOGtx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSmMsmDYV/nKeVDA3yGg0IgjrmJp7ka+E5NeO7ERyCI=;
 b=qn3OzuKJktS9zCmEUP5sZg4PLpxba6UtzbGHCEYDp6v911aHCD4sX9XjNBc1BB/n3nc+Bwxo9MR3RQW/WcC440HOyoM9slXNA5+g+H+L1S+JFXW4xL0EAk1uBRW/qf6RC6nxbZ7nw3Zk9NjJzgmFs8YOWm2kg4NK2DWwmrZX6nE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5682.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 18:04:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 18:04:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 18:04:32 +0000
Message-Id: <DGPXYCH36Q2F.W08WT11UFKMM@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 06/10] rust: io: use generic read/write accessors for
 primitive accesses
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-6-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-6-aad44f760f33@nvidia.com>
X-ClientProxiedBy: LO4P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6596b0-36a5-4d08-1f0d-08de762aa8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	DOOxZAWAF96gWG8aS+U/cfi3T1hnEtaQZu6FosmNHyi1A/MZ0APKV178XKKWZmIFtwa9a9EG1Cs11A68F1cv2o9HAUW6Ws27CHd9kF4MQX3Za/m0hzhM5uocEOm3bzWl27La3RDUM5VzYpvH+Dy3IM/+z1gAp2yUBkSy43MlN14mD2lCe8aNf8gx1uPF9ezI28iU8JFUMeI75PBtkq9Cs+WEczUzsU3TqPCEG4ka7kcaNx8mMvZ4J5BZIm8LCvRvnPihTifLebJeEKJaz2irePd+evJZeCoNg1VveiHOBmL+rPBH8i06pKcu8+PcFJWMHvRp/dxxM1RCxTKi0Q0UwkXOZQywzsszKxktL2Ya04UDb2BwaU1fwjQEzPe8s4qLJi8a7M6AAXNLRbiG6LB70I/Pz9tdtxlw8OzlgKs//NJS62IFjBq8YXiwzEcFbUXDS6W1MgJHgw3QIt18d9nRLUcaIQMYi52rRyfNgYs6SdHHba8MFPgLh7EVRH0V2F5C956bxAaTmqC5O/LHAH4HABOcBnrQG0lS0cS83mheZtCyu6VCsXTb6gtde82cMqnNKlHGjmjPlISc8yhYSiv3hQUt6A6ofAtPRIBJLQSeIkH0VBhl9PbiNOrv1B4Qy7iVdFKANK1O+DEnEXnj39ktP96x08b7bOQfZq3ka/09/frm/3A666yXcZvyMuQ4NDOTswlJ6j1H2WJ8i5/RQq98jCbvAngaJ4pWsBVEhX5Xe0lvAs23XWMO0iV9QsCf9G9qGstPhSYOY77G9drqyt2OCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG8zcFlPall5VVo1Y2VmbGx3eVExR0J6VWpVL2FwQ3Rqb2FKV2RxQVdtNTh1?=
 =?utf-8?B?Vk1JRGE2bmloMytsM2psRDh6WmZBNTN0K1J0bUJ6M1NGSElBdzZ3dWppT2FD?=
 =?utf-8?B?MlJYS2k2c1RHdnNGZEQzcGpmS1B6b0d0YTRuZWhkL0NnMW1vVStoY0l2SGIy?=
 =?utf-8?B?V0twbUZxc0h0ZlgxRWo5SGJpd2NQdUVrcWJWWDUrT0wzQWRFZ2kwWXFydldZ?=
 =?utf-8?B?YWJTaW9VRkxJOVhsaTY2QU10OFZwSngyZ29oNlRGb2Vqc2E2djJpZ2FGc2p0?=
 =?utf-8?B?WTcxNEpFM0hZNXJISkxCTW9IQVBnbjhoMDI3TEFQUXJ1MitTb1diM0xqcFdE?=
 =?utf-8?B?Y2xGMGtnQXZFekppcU1wc3FvbTc1dVVVYmlGcHZWSmgwdTEzSzlKTDkxTUZ1?=
 =?utf-8?B?bEIxWTVTNUxzS3dhWGNLNnNVZWxhVFEyVzEzb0NZdkpMMHBkTjdudkdEd0VO?=
 =?utf-8?B?WCt4cVVLWnhwalhIejY5WklFRGlmNm0wSjloSlAramg2YUs1R1BQUk53K0ts?=
 =?utf-8?B?aW0wSU1VczFYT3lwTk9tWmhTVEpvNTRnQlFHNWxrSHdvNDFXMHFkdlNiVzEr?=
 =?utf-8?B?RlVwTldlQ3pIeWpXQUhaRU5ESVBDbEY5TlNtb3ZSekdQbm4vUXQ0SVN3bnNa?=
 =?utf-8?B?bWpSejYydmNHNW1NNVJtUzBNaHR2V29hMEdtM0xWREg4ckJaT2Y3aFNJd0VN?=
 =?utf-8?B?dFp6RnY0REJwYTdIUTIyREtBRS82SXcwS1RIaElEM1I1OWRKRWJ3aklPR09W?=
 =?utf-8?B?Vmw0alcvdUVDcW94VlZwVEdSQ2NQMUJNU3FzbE9sSnJQMlI5NUljNG5BcG9O?=
 =?utf-8?B?bWd2N0hUTTBlRmFtZVVMZ2hRZHE3R2xOOEVzNjduN0NDTTdZVnlFaktFcXox?=
 =?utf-8?B?RmFYcytqeCtzNnBBVjF4TGJVSldySzl2RHB2SUcxNXovcFd3T3Zjb1ZTS3NX?=
 =?utf-8?B?UGdJQTQvNzZHd3gzMGJKSFVTb3BBTVZ5U0EyQ1JBWTdGZmszaTN2ZitMeVUx?=
 =?utf-8?B?TU52NW5vdC8wY3dxVGxydmUzcEg1U1c0NG8vcUZ4OE5CQ3NnMWt4M3RtMWFG?=
 =?utf-8?B?ZTBQL0JlV2tVMit6ZG0zazVnZGRsUEwwUU9YVnphVGZ4UmFlUFE4aDRnUzBv?=
 =?utf-8?B?QitQZUdHSDhqdGlqMFJHQWkyMmtROE9xMUtWNHhtQUE4ZkdJNXRqakU4bnBx?=
 =?utf-8?B?enJubXFQdTF1MUpYSFpPSHFxV0hVOGxpZ1FaVUZocnNwWjlWVUNZMjZiV211?=
 =?utf-8?B?RU1PL0t6NVJpV1dMdjlzK1hVb3ZZRmMwcm5VZWZoYnVHSVNWc3JIbHB6ZFpu?=
 =?utf-8?B?L1VwZko2TFlQcTlqdWx5SWMwZ3ZzRzlwR01WMk5QRDRRTGlxekVFdG9Ea1hR?=
 =?utf-8?B?NEpIUkoxUy9HVk90aVF2Q3FxSkhRREQ4c3UvWTVtMUZXSS94UmJGUkdvOHRZ?=
 =?utf-8?B?ajBUQTRYUGlFNi9TZFlwWldFRXJWMGlPcGYyS2V4cGx5OVc1bWlSRThBUnM4?=
 =?utf-8?B?dDVENVhpVGRyUUhMc21WbFNSdFg0V1hVQ2l2S2hwWkhyVTU1M0JpYkFhQWVH?=
 =?utf-8?B?b2hkVmkrTlZudGsxYm9HaTJFWXdzUXVTWjdxeWE3VllqVzE0QWJkRzh6c1lU?=
 =?utf-8?B?emE5ZmxNeCsrQW1VYXRuZzNmVEpjWmlJTFhuNmpsU1VlQURWZ3ZRWXpUb3pI?=
 =?utf-8?B?TTd4cDh1YVdkSzB4QXZJYUwyK3RWRENqQjBiY3ROTW52SjBYdldqSUZaTHY2?=
 =?utf-8?B?VjR4Ni9FK2w4bkNHWkRkV2g4NlVqellsWDdkZ0Z5ZEpQQ2kzRlJSQllBRVNB?=
 =?utf-8?B?eGNhN1pxQVU0TnVDOTEzSTZaUEsyR2M3QkFSWWNPRXdOTEUxczNSKzZpSUpY?=
 =?utf-8?B?THVHaWY2N25VWDFJWVpiSTUwOVMxZERKUkpjRTlRR2RsWTZ6S3orYkVaYk5P?=
 =?utf-8?B?ZVdRVzd1SUg1Mmw3OWVtbTZsR2paY044aFhNdTBrTUZjZ25ibFN6dkNqVGRx?=
 =?utf-8?B?eGtLUkdmOS9NR29UOVJaK2ZkMTdPLzJObVF0VkVqK1JOWFhKSGxsbUV4b1JO?=
 =?utf-8?B?cmZHTjl2V2h0R3ZteldtUEhpL2dTSDFheFhGU3N5K1J6OXY5ZE9zV0trRmFl?=
 =?utf-8?B?WTZMbWZSMFVpbEpDWkpWVy96MURpWDVIeUxvUjQrTUZPSEhhcmlLWFNMSTFl?=
 =?utf-8?B?Uk1xZXdabGs5ZmpGOHlPT3pjTWpsc1VWakJkZEg0S1Bmb0YyeDZPRU5mU3BX?=
 =?utf-8?B?QW5FeUcrcG5RUTIwMG9HVmhYclhOSXRLajlQU1NncVNhZEtUZ2FZdjlaL2Zt?=
 =?utf-8?B?bkVCcm55cnJ6V2s4b2Jxek5ZZjUwYVllTW10ZEdXT1Q1OWlUODJqdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6596b0-36a5-4d08-1f0d-08de762aa8d1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:04:32.7419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef8Ca9MkkyzNAQXCba3uAdUEMmXn2nvONicyAK75BUgCIFtWO0MD62nQM0LEHoSYios5ECfEl1xyiskOP0e3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5682

On Tue Feb 24, 2026 at 2:21 PM GMT, Alexandre Courbot wrote:
> By providing the required `IoLoc` implementations on `usize`, we can
> leverage the generic accessors and reduce the number of unsafe blocks in
> the module.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

To expand my comment on patch 5, if we have

    io.write(loc, value)

and
   =20
    io.try_write(loc, value)

then we would naturally have

    io.write::<u32>(loc, value)

becoming the generic equivalent of

    io.write32(loc, value)

for free.

Best,
Gary


> ---
>  rust/kernel/io.rs | 103 +++++++++++++++++++-----------------------------=
------
>  1 file changed, 35 insertions(+), 68 deletions(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index fdd2549d8e13..256eba16ccc8 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -275,6 +275,25 @@ fn try_init_default<F, E>(self, f: F) -> Result<IoWr=
ite<T, Self>, E>
>      }
>  }
> =20
> +/// Implements [`IoLoc<$ty>`] for [`usize`], allowing to use `usize` as =
a parameter of
> +/// [`Io::read`] and [`Io::write`].
> +macro_rules! impl_usize_ioloc {
> +    ($($ty:ty),*) =3D> {
> +        $(
> +            impl IoLoc<$ty> for usize {
> +                type IoType =3D $ty;
> +
> +                fn offset(self) -> usize {
> +                    self
> +                }
> +            }
> +        )*
> +    }
> +}
> +
> +// Provide the ability to read any primitive type from a [`usize`].
> +impl_usize_ioloc!(u8, u16, u32, u64);
> +
>  /// A pending I/O write operation, bundling a value with the [`IoLoc`] i=
t should be written to.
>  ///
>  /// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`], [`=
IoLoc::init`], or
> @@ -369,10 +388,7 @@ fn try_read8(&self, offset: usize) -> Result<u8>
>      where
>          Self: IoCapable<u8>,
>      {
> -        let address =3D self.io_addr::<u8>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        Ok(unsafe { self.io_read(address) })
> +        self.try_read(offset)
>      }
> =20
>      /// Fallible 16-bit read with runtime bounds check.
> @@ -381,10 +397,7 @@ fn try_read16(&self, offset: usize) -> Result<u16>
>      where
>          Self: IoCapable<u16>,
>      {
> -        let address =3D self.io_addr::<u16>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        Ok(unsafe { self.io_read(address) })
> +        self.try_read(offset)
>      }
> =20
>      /// Fallible 32-bit read with runtime bounds check.
> @@ -393,10 +406,7 @@ fn try_read32(&self, offset: usize) -> Result<u32>
>      where
>          Self: IoCapable<u32>,
>      {
> -        let address =3D self.io_addr::<u32>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        Ok(unsafe { self.io_read(address) })
> +        self.try_read(offset)
>      }
> =20
>      /// Fallible 64-bit read with runtime bounds check.
> @@ -405,10 +415,7 @@ fn try_read64(&self, offset: usize) -> Result<u64>
>      where
>          Self: IoCapable<u64>,
>      {
> -        let address =3D self.io_addr::<u64>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        Ok(unsafe { self.io_read(address) })
> +        self.try_read(offset)
>      }
> =20
>      /// Fallible 8-bit write with runtime bounds check.
> @@ -417,11 +424,7 @@ fn try_write8(&self, value: u8, offset: usize) -> Re=
sult
>      where
>          Self: IoCapable<u8>,
>      {
> -        let address =3D self.io_addr::<u8>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset.set(value))
>      }
> =20
>      /// Fallible 16-bit write with runtime bounds check.
> @@ -430,11 +433,7 @@ fn try_write16(&self, value: u16, offset: usize) -> =
Result
>      where
>          Self: IoCapable<u16>,
>      {
> -        let address =3D self.io_addr::<u16>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset.set(value))
>      }
> =20
>      /// Fallible 32-bit write with runtime bounds check.
> @@ -443,11 +442,7 @@ fn try_write32(&self, value: u32, offset: usize) -> =
Result
>      where
>          Self: IoCapable<u32>,
>      {
> -        let address =3D self.io_addr::<u32>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset.set(value))
>      }
> =20
>      /// Fallible 64-bit write with runtime bounds check.
> @@ -456,11 +451,7 @@ fn try_write64(&self, value: u64, offset: usize) -> =
Result
>      where
>          Self: IoCapable<u64>,
>      {
> -        let address =3D self.io_addr::<u64>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset.set(value))
>      }
> =20
>      /// Infallible 8-bit read with compile-time bounds check.
> @@ -469,10 +460,7 @@ fn read8(&self, offset: usize) -> u8
>      where
>          Self: IoKnownSize + IoCapable<u8>,
>      {
> -        let address =3D self.io_addr_assert::<u8>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_read(address) }
> +        self.read(offset)
>      }
> =20
>      /// Infallible 16-bit read with compile-time bounds check.
> @@ -481,10 +469,7 @@ fn read16(&self, offset: usize) -> u16
>      where
>          Self: IoKnownSize + IoCapable<u16>,
>      {
> -        let address =3D self.io_addr_assert::<u16>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_read(address) }
> +        self.read(offset)
>      }
> =20
>      /// Infallible 32-bit read with compile-time bounds check.
> @@ -493,10 +478,7 @@ fn read32(&self, offset: usize) -> u32
>      where
>          Self: IoKnownSize + IoCapable<u32>,
>      {
> -        let address =3D self.io_addr_assert::<u32>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_read(address) }
> +        self.read(offset)
>      }
> =20
>      /// Infallible 64-bit read with compile-time bounds check.
> @@ -505,10 +487,7 @@ fn read64(&self, offset: usize) -> u64
>      where
>          Self: IoKnownSize + IoCapable<u64>,
>      {
> -        let address =3D self.io_addr_assert::<u64>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_read(address) }
> +        self.read(offset)
>      }
> =20
>      /// Infallible 8-bit write with compile-time bounds check.
> @@ -517,10 +496,7 @@ fn write8(&self, value: u8, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u8>,
>      {
> -        let address =3D self.io_addr_assert::<u8>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset.set(value))
>      }
> =20
>      /// Infallible 16-bit write with compile-time bounds check.
> @@ -529,10 +505,7 @@ fn write16(&self, value: u16, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u16>,
>      {
> -        let address =3D self.io_addr_assert::<u16>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset.set(value))
>      }
> =20
>      /// Infallible 32-bit write with compile-time bounds check.
> @@ -541,10 +514,7 @@ fn write32(&self, value: u32, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u32>,
>      {
> -        let address =3D self.io_addr_assert::<u32>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset.set(value))
>      }
> =20
>      /// Infallible 64-bit write with compile-time bounds check.
> @@ -553,10 +523,7 @@ fn write64(&self, value: u64, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u64>,
>      {
> -        let address =3D self.io_addr_assert::<u64>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset.set(value))
>      }
> =20
>      /// Generic fallible read with runtime bounds check.

