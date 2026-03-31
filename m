Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022100.outbound.protection.outlook.com [52.101.96.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624533A382E
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991423; cv=fail; b=nRZb0E5VH7o2yv7zLRAdbmGXb4Qsldz0PW81WWsX4Uuzm5/SHQWLAsz6e04wCTzRDAcJHJTy86Ltjf0ZB/a9Nue0PQnVxSJNab2rjQtRVr9lJ7X300YUldGKJTwejx5a9H64U7Qmtj5tkW+yZ10dpatmtM+XAVMcdYD+LCUmcjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991423; c=relaxed/simple;
	bh=FqpCLuhIXNtxtHqOP2tnhDUpEdfZZCBPdL9MOcSK9/Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=U4JEreuyHKuHiyb4BD9gev/DxdYNlclnVygnkZaF+a661hpSSoWbfShodO6o55zkRFJCtFgcjLCgS4wI6J/LFCRHCuIyEZgakgBY1qcqhJfMZZLAIwXoO8YgPUANSbmcl4w6HMHtti6CLAI/n2oX1soT/SbPkkG0ar1aRr7MElc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=x6+NuJy4; arc=fail smtp.client-ip=52.101.96.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="x6+NuJy4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvpGqQjR1fcLgZ5IEw/pA7TSiGgnw6D3zdPHndl54Jgv04tF5/q00syR+S8hNC1sMIVGb+1ghFU8gQW+xYHPig9GKbiLzwzwGYsn+wfp10gLY6pmlabNsGw7BoR+OROQnq9+gfL+0WH1SQ9AxHYbtV4huVtLtzkV3pFgJLkLnLyJ9Cr/BPJ9hImNJXeAC5RRGiOFqRprHeoiXOM1SIBu7t9xXmTxawB7lNcivfItL1i+Lc3JqP4xX9CB3KZxjJ5SnxerRKxpAekNaRnlN3iuKKrw+3v/4HK4uh9OSsW49OMs21UVcklMChZiAKBUvgY1hjB0xEKETfh3SZjsUAeCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3jAqfK0xfTePwI5oQYjMmFDbLkDdA8Qv4UJj0G8hrY=;
 b=nuGPH5xHQWNjCN47eAAmThy1QK/eWlOfkqXyvze/dOgPlvubrst5b96AEUATQyk2W0b3Z3TivDC64NGq18cP7xpS//Eksg54vR63FffnUgqfZsbDDuNLF5gYeodo3VPVa/z0U1O2FCzINht4ahCcwYPkvoZRtnvxqTTj4yLghwZMVNblI5x6ybRRZBIqGVj99JMYQR/nHCZMGHqG9MdUlDh2v1Y/I5Q02TnQmNFLU/5WsRJl3ToJHq1xgT+/MN5WTk0xNmY20vqbgS0V4gD8Y3a6meAXJ8dylhIC3rRSG9p3SeGJwzumVP4/epcXVDKRNT0xtga45nHiQ4q+Tt+lNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3jAqfK0xfTePwI5oQYjMmFDbLkDdA8Qv4UJj0G8hrY=;
 b=x6+NuJy4HpIVqau3W/wd9H5qhq93efF2BIkNqytM7MNV94x4kjfy+atErhno6fIihJxW2LSWWw+BkqDMoiZ6IlfsFmzwwhRdX2iXUopOWtae3kI/P3rtr0qfRCMJWA1F3PHsU4ZFOkvEr6Muz+FIAh9imChtChQqK/heQR1mMyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6523.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 31 Mar
 2026 21:10:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 21:10:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 22:10:19 +0100
Message-Id: <DHH9Y16MRVIU.13R4ZDQ4MTQZI@garyguo.net>
Cc: <teg@jklm.no>, "Miguel Ojeda" <ojeda@kernel.org>
Subject: Re: [RFC 03/16] rust/alloc: add Vec::into_boxed_slice()
From: "Gary Guo" <gary@garyguo.net>
To: "David Rheinsberg" <david@readahead.eu>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-4-david@readahead.eu>
In-Reply-To: <20260331190308.141622-4-david@readahead.eu>
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed6c317-fc97-4c10-31b4-08de8f69ea62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8ciBZPEe0UrFtZabKzdd3sS/uPnN+sqncdDH+tYyGiOtv2xDo7FVIJH21Z3sd3XIvz+2eHOSbY0205vJIRVGF9yH9phTXuJJEKDFix+gHcZx3Ar9Y8medj2+9Vq64bDB1Qav7h/+HcIxDGHlNvXTES8w0dghFGGSwnLiJ31KrFcwJWlxYgnbyGF9RBxN6mXEyhiCTiW2QCNgsAunblsgAqd7ZYI0gfgW4Dwg3fPojAeiSTkaPb9rkneuy2mp7O8Klics9xqI8LEvNmOhRSpLGOfjI8QCFmAPILdQ0JjkJzRnL3hMQLvxQqNdYRPXE7nt+D0Ywq6Tmr31/hDm/M8v7dvtkM8qOiSvhlZv2IawlrRlGhU1q9IXrg4PNjWT8AyWAVir52lsgQA0k4eArw/K/6X9Dt/7tmo97MNQUhHZm3YchEWTLllP626RslzqSD9wuOQt8soNSDF9WZzg2cLHYOko4CNQANZBNRULhIrWc9Ms1vG0wrPGbPPalJkIXJpGn6Lnxmwgsq5iNPoDyXhReuBL8a7IYgVapbwMIBUaDDAx+HRdIC5IUV4b/k1gJ7qqeXDHVSHr10u1GrhEiP4IsCTZ7Iu+EmcJDjtJ2qZ966bKQ5+DpIWFeNW9G5ZYQMXWdXCtFxze+3VYmNGHP6TnNkljtRhKr/54UaH6pQZ+XTJfRCOd3ciBBCFGmGf9SdDh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk1mT0ZkelNhckkxaHRMUm5FTlk0YWRIWnNRMFhDMHFqNjR1ajJPNEQ1N0U5?=
 =?utf-8?B?TzRWVzZyUFo1VkJwSDFYeURtMTg0cWZpOFprUUZkZjlzcXc3Tit5TFZFRXRJ?=
 =?utf-8?B?Qms5Uk84dU44dmsxbEtzTjRLb0hDd2s1cENYNEhMb1gzMFlrS01ZMXU5L3Fs?=
 =?utf-8?B?ZnhkbldVTmw5emVsNmxJSlRjMUJYb2JEdWpCWW8yY0tNTFNOMzQvM3pDMXVh?=
 =?utf-8?B?UEJDWjdCYmM0ZkYyTHFMVFMzWGNpaGFPU0F0V2ZkazE2eUxWZWVKMFczcUE5?=
 =?utf-8?B?emN5ek5OTTVkVStCYm14R1NnaVNNSEJQNkRtMCtRRXFFM3BKSkM3RVg1REFE?=
 =?utf-8?B?aVVXb2wxREw0Y1J0M2JtMFFjTHlybzYyMTZNcG9welg0UXhMQU5NRHVXM1d6?=
 =?utf-8?B?SnlWODA2ME40b2NaaTFxSzNEbStZTEx3bDRNTnNRRXNoNkdFMy9KMEZGcm1M?=
 =?utf-8?B?NFk5RUZBRnp4SnFMVUkrb3Y2ZHV4RWY4SDhGay9lNUsyRmhLRElNblNhamk4?=
 =?utf-8?B?RWxVK2dobDc2SVNaS1JTYy9lbGxISjB5VklMOFRRemFUeEw4NXo2U2p3V1Vx?=
 =?utf-8?B?Vzh2S3lmbjk5dWNpSUhSVnA0bnJRY3M2blZnRm5lVk51RTZNNGw2VzRhSHRN?=
 =?utf-8?B?TTNzdjhTQWJUZDNmOE95K3VXeFBPWGZRQjR4ajlFb0d5YlBjVnNiS3kydGFB?=
 =?utf-8?B?MVZRb3Zsamx0a1J1MUJTcXRXTTgzVWg1YlAyTGpPQktWejZ0dzA1M0V0OWlr?=
 =?utf-8?B?dVB6RWxsN3lWbU13SGJzLytIakNCUUNZRTM0ZWVJdDVPenNjeWdLWGh2YW1C?=
 =?utf-8?B?NXB0cjVMREdwdGR1ZjNmY1dubk1qZ3FMbGZSNWVVUGtSOTd6ZDcvTjhwWHpp?=
 =?utf-8?B?RU41TGM2d2pWV2pzZ2xHRllXMy9JRmtvS1E0ekhFcmk3aktWQzIzYkVnaitw?=
 =?utf-8?B?UUlmZU1jYldCcHFJTTFSSVhDSnVsRGIvbHFjMDFKNk40eUdtaDNqcXVSNGZ3?=
 =?utf-8?B?NitMRWFhWm9hM0JjUXpPajVsbUZSb1lib3pXMUdISEZKbHBEMUt4MjNWTEZs?=
 =?utf-8?B?TEd5eDU2ZDJTaVZOK1BROEtFVkpkYjJvRkhQVURMRko5ckVBZUtLR0poNFdB?=
 =?utf-8?B?Mm9JWWpERllpSjFoM0pXWkNMaWdSblVKbmYvbFJqVTM3U2xETjVybzZlTWFW?=
 =?utf-8?B?bFZqVGFGcDhadlR1U0dwL2t3WFhrTnRVWTFHc0hKcWxVVGU5cVRyUEpkN28r?=
 =?utf-8?B?MVF5a0svRzRydlVRVGgwZTFGMmlyelo1bXY0K3U0QVlTeXBwdWErWitzbGpl?=
 =?utf-8?B?eFRFVmZtTE5FUWI4eFZvektqOUErR0RhYWVuV2t4clBYWm5GeWxSVEZVRTBo?=
 =?utf-8?B?aGRUNHdYeEt4MzkzSFg4ZGZqcVUxd0J1c2UyVXZ6UnFIajdDNmhtemxRQUNG?=
 =?utf-8?B?QWVTcTVKWS9HajV0elJ6RVRKQXRzWFZHMVh1alJTekU0UzI0aTVmdmcvTEE1?=
 =?utf-8?B?REgxVFNnSzU1ekhHQTBFM3Y1RTlxUGp5VUpkRndiU1hmQTB3VThoV1MrenVW?=
 =?utf-8?B?SmxzbFVGbURWQ0NpRzBFZFl1SHhzdzNEeERLVXB3QzRWbG1WNWFrVS8vbG8x?=
 =?utf-8?B?em1OZjVFVmIxTWxodHBzWnhHVjErNjJsaXFHWmRWSDdqY0pkTUFGaVg4dzN5?=
 =?utf-8?B?YjNXZkJJTVQrR2dTeTNxVDZRdVhqR21FRWQ5WjhVcmVIblFvZHViRy95VTBD?=
 =?utf-8?B?aGlRZVAvQnBpcWxlV09EcEliSWJUZG14Yk5aZXNWam0wcmM1cndDK3d0UGdt?=
 =?utf-8?B?NjhabG1LN2U2dVMxQTVYMHVkL2NlTTFTN0l4Z1NYd0lqWFIxcTM4Umdvc2t3?=
 =?utf-8?B?dkVWZ283ekR3QWpuL3RoTVlCYllkVFU2eFBOeFllL0dVaFdxaTVOeUZ2cjJL?=
 =?utf-8?B?NTNOTzNoWUUxRjJtaWxmQTV1U1RMS0w5QXFyVDh3cnhGQXpPVzlkdEwxQlcr?=
 =?utf-8?B?TFdLbEZEMnU4dnVEU2V6ZkdzRjZsMmQ0Tks5NEFUeGVBNHR4b1NOcVMwS2Fz?=
 =?utf-8?B?NUVFYkpadC9KUlJEVmptNUlvZENKZjN2U0lLWVl2d0cxUzFrTGRVTUNrSEkw?=
 =?utf-8?B?d25LenRzRTdEaTVuY0xWejVmKzcwNkFIc21VV3BxRi9jTTZkNFAzQndpQXAr?=
 =?utf-8?B?QnR3Rmt5aVRuOVRjblhzZWhhUnh0ZVVZOW5OUXVIZnhYbUxGZmgwck9pUFVk?=
 =?utf-8?B?M2psdG9Vcnh0NlJvbC9SQlVSWUY4ait0YWN0MTVQczdsZ0psMXl3SzR4dUlp?=
 =?utf-8?B?c2NtSlZzUjVaQXNBN0xLLzZuRVhKSHpuaWlFcklNSzREcWp5QktBZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed6c317-fc97-4c10-31b4-08de8f69ea62
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:10:20.0484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7kOUBwgx+wzWyJSCf5jnc46l0I8x7rlp0dYv68mocF33KNcBIs+5isbYoqy+qSO+mUTi5OnvELsDQKeuWO9fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6523

On Tue Mar 31, 2026 at 8:02 PM BST, David Rheinsberg wrote:
> Add `Vec::into_boxed_slice()` similar to
> `std::vec::Vec::into_boxed_slice()` [1].
>
> There is currently no way to easily consume the allocation of a vector.
> However, it is very convenient to use `Vec` to initialize a dynamically
> sized array and then "seal" it, so it can be passed along as a Box:
>
>     fn create_from(src: &[T]) -> Result<KBox<[U]>, AllocError> {
>         let v =3D Vec::with_capacity(n, GFP_KERNEL)?;
>
>         for i in src {
>             v.push(foo(i)?, GFP_KERNEL)?;
>         }
>
>         Ok(v.into_boxed_slice())
>     }
>
> A valid alternative is to use `Box::new_uninit()` rather than
> `Vec::with_capacity()`, and eventually convert the box via
> `Box::assume_init()`. This works but needlessly requires unsafe code,
> awkward drop handling, etc. Using `Vec` is the much simpler solution.
>
> [1] https://doc.rust-lang.org/std/vec/struct.Vec.html#method.into_boxed_s=
lice
>
> Signed-off-by: David Rheinsberg <david@readahead.eu>
> ---
>  rust/kernel/alloc/kvec.rs | 67 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ac8d6f763ae8..b8b0fa1a7505 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -733,6 +733,73 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -=
> bool) {
>          }
>          self.truncate(num_kept);
>      }
> +
> +    fn shrink_to_fit(&mut self) -> Result<(), AllocError>  {
> +        if Self::is_zst() {
> +            // ZSTs always use maximum capacity.
> +            return Ok(());
> +        }
> +
> +        let layout =3D ArrayLayout::new(self.len()).map_err(|_| AllocErr=
or)?;
> +
> +        // SAFETY:
> +        // - `ptr` is valid because it's either `None` or comes from a p=
revious
> +        //   call to `A::realloc`.
> +        // - `self.layout` matches the `ArrayLayout` of the preceding
> +        //   allocation.
> +        let ptr =3D unsafe {
> +            A::realloc(
> +                Some(self.ptr.cast()),
> +                layout.into(),
> +                self.layout.into(),
> +                crate::alloc::flags::GFP_NOWAIT,

The flag should be specified by the user.

Best,
Gary

> +                NumaNode::NO_NODE,
> +            )?
> +        };
> +
> +        // INVARIANT:
> +        // - `layout` is some `ArrayLayout::<T>`,
> +        // - `ptr` has been created by `A::realloc` from `layout`.
> +        self.ptr =3D ptr.cast();
> +        self.layout =3D layout;
> +        Ok(())
> +    }
> +
> +    /// Converts the vector into [`Box<[T], A>`].
> +    ///
> +    /// Excess capacity is retained in the allocation, but lost until th=
e box
> +    /// is dropped.
> +    ///
> +    /// This function is fallible, because kernel allocators do not guar=
antee
> +    /// that shrinking reallocations are infallible, yet the Rust abstra=
ctions
> +    /// strictly require that layouts are correct. Hence, the caller mus=
t be
> +    /// ready to deal with reallocation failures.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v =3D KVec::<u16>::with_capacity(4, GFP_KERNEL)?;
> +    /// for i in 0..4 {
> +    ///     v.push(i, GFP_KERNEL);
> +    /// }
> +    /// let s: KBox<[u16]> =3D v.into_boxed_slice()?;
> +    /// assert_eq!(s.len(), 4);
> +    /// # Ok::<(), kernel::alloc::AllocError>(())
> +    /// ```
> +    pub fn into_boxed_slice(mut self) -> Result<Box<[T], A>, AllocError>=
 {
> +        self.shrink_to_fit()?;
> +        let (buf, len, _cap) =3D self.into_raw_parts();
> +        let slice =3D ptr::slice_from_raw_parts_mut(buf, len);
> +
> +        // SAFETY:
> +        // - `slice` has been allocated with `A`
> +        // - `slice` is suitably aligned
> +        // - `slice` has an exact length of `len`
> +        // - all elements within `slice` are initialized values of `T`
> +        // - `len` does not exceed `isize::MAX`
> +        // - `slice` was allocated for `Layout::for_value::<[T]>()`
> +        Ok(unsafe { Box::from_raw(slice) })
> +    }
>  }
> =20
>  impl<T: Clone, A: Allocator> Vec<T, A> {

