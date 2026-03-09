Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022117.outbound.protection.outlook.com [52.101.96.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF955C2EA;
	Mon,  9 Mar 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070161; cv=fail; b=h9AZ4DOB2XPCPhCBHZcjEhJJWcAuIIQ40Yn2tJIJ9bOuEG7RsIkUud6nqWoezwoZV3DRPRX9kty0INvPq4AkxlnLBVGhEAGCdK3J1VxWKfFvpvSIbe1JoFES5jL8fJngC/A6JjvUxWmky/oHMWgpctcBk+4qn8I4Pk0oC+Py8ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070161; c=relaxed/simple;
	bh=qTA/31H0esD2pcUxA6rQF838Ckyqy3UtWpS9HF32hj0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=moyBrc48UpSZdCgBUj5BvclYeb/BJYEp6dBfdWFkAjllPxII9grJNkwjlYkWtAxYqCDQ4xhPAWwK2rPZs+/KB5bdK5HPR+J4B4ZTyciTCOjn++HDgMIexPSDk7JrrquSzJfeRcsI/6340AOqfd3ntR96A8KDFUD42/FFKB8FICo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kjkCEg6y; arc=fail smtp.client-ip=52.101.96.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kjkCEg6y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVRLj/U2UoG/hvpty/L5HC2J7bwxm1tTh3PYBNsHtHE5uQ/b2d9oKsv2xRN6xVxyUMML3cnBDjZcwmH+cRVl+NeHZrNLT0kqYAUzUV8sXS1tdYWv2kZ7poRSXlN2XMN1rfhmSweNreRt3EcVES5Q8N3RsQ0/E4M6ibVbF1peK4kaKkWYUXN0366LYLyP2OMzQdfl7Il7ekNH5rkKjJ7ViVSZR6veGv8bZVCxmfl4cDM0pcdrFIGhi435/7vmVP8IPFzHnUCY+0s/FxabDLLg33rsHSa0VcIyWmN+l8CwvPjM8jjVZjfZD7Tgo7Y7H3NwG2oYWOzqBOQcX9kGdp5GuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FSjyKRh549bmYoU7wM822FJYBgpYwv0WKQxOJ2g8kw=;
 b=GhilFwdYY0uJqfaTbs3I92TvSkrjYLhyw850VnBwNcvN2d6rAmWcj8XwH2Ny5cqkD/hJl//2INV/NENZRD7wAP5O1yHNhdLK/AbCOIkyH13Wi0Nt/xJW2JXeEYktI87L+YbU5aH5Pbv94d5BRdzHI1buP7uANrKPMHy9D5U2gL99t0R9YyNsby9GF3bs0VPNW6yfHMYfprmrI1Lu9d/h9imq4S1hsR92IQ0MhOQHIkKa9iCcRlLyRuOEJp6Eq3jNpKqzTcAHQ+j2RaWmxmC6qYhLjlB7gMDjMBanu5qAQnh7WgfRmis6hmcmSx1jsOamKO0BrfLjC39Uu1BAUpkqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FSjyKRh549bmYoU7wM822FJYBgpYwv0WKQxOJ2g8kw=;
 b=kjkCEg6y9hMMtBHXAl/EYnfZ026pxNA2ZMWB1l5ZaN3/QtbM10fN3ItUC77wxp97UxywoZtOLL5jsFx0brzi3L+OzqLWCRMqmWe35B3aV1/gHarrk+2PqkislCNRti+k+Wi5xDX/Ah+Ry1t+vyJY3lP8HrG/RVR+QWZIauwr1ZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6766.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:300::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 15:29:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 15:29:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 15:29:14 +0000
Message-Id: <DGYCWW4AUI1Y.29UXVO4XOFCOA@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 06/10] rust: io: use generic read/write accessors for
 primitive accesses
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-6-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-6-424f80dd43bc@nvidia.com>
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 849dc4f7-f94b-4240-1c57-08de7df09f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	Gw4FoQ57+G9gZDCQzYu1eUHvykuUx4hgOeqNjpnuGnkWm7CqEuY/9GTH5Umkc+fQuGQlwg8NTQGuMG6BEOGw7btjqwllG20Y1ydImXY+vF7+NlqLRuI4v4lv4cxGfkbLNTPOUMD4HW7/9yBkQfzxLq1GAxc3DSGw3Z5jleIklHCfCPr3ySOBTe2a20RpVMSagsP7jd7xk3+vErsE9IfY128lGkG9xGNxZ+6InFLDd8wfaaBvF1aA3g/eW4pP1/4GtBMHNQGPYknFbrPQsQDZ5qMM3AEVUMdL1H11ox2AyTmqN8NJeu7YYhxc0N+q6jRj8aADks39S65Dugp6una+2EiQeov5dv8RxolTc3u7Hx4neUTkcUb8WJkLSU0wI/AQjBjXKU0XjnBm4pKKSRHzWMUM5jiGOJJAZYVxlgCzXVebjhEan02k1u4oEaEXSRETQl1W/wbnpOMrOsk7yTGfwzavJ/wBnYm8TO8yLDtWscHc03Lziuecq3jCFng+Jg47FFetF9kKjt5OuE4/SmG1k5Mbs1AwxPq8fvaSuinx51rqIdHGKvlsQF0TyiqN1TitlLlbG9+zmrbOo0HgCcBJ0Q7MD8Hhm1WGU78JKzAph/Gs+BX/D8/di8/SAIxUVN0BW5nVJtRv6cknFJiGGuKixzNrGY5sCQmftgWJZ7NoJo2giCaI6ZYTFpwz/KKsepY31pvx4+aFC6DhOiPU3cNSjnGMGMTiFUcIm02jthV+rcpwuZ6fQ/e7oO37gAN9ptEutoVC0kexSChjtD6lr4eXMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2FWZ2pUWjNIMVhhblNVNWtjWThzNVFhTWkyRXU4YkNnSjFOTU10YUpveHMv?=
 =?utf-8?B?bGlKb0NmYUh6SllwZXlYN0t5bUsvNGdWYVFsdk1sTEFwckdNaE1VVElncU53?=
 =?utf-8?B?dnFTVkwxKzYxeHVybzdpTkNibzZTNCsvVzdVbDNRNm4yWmo0a0hDM0c3dDBO?=
 =?utf-8?B?cHJzdTJRY3llc1d6b2RLUjRJZHd2eFFBMjJFTnVsSnpxSU9hNE9LckRNRGtx?=
 =?utf-8?B?L0x2djBiM1VOcms5bkhRbExQZHNtOUlIV3Y5VzZGYWMvYWpRK3pHb3pIMWJu?=
 =?utf-8?B?Q3Qvd0p1a3NGWktDWFErUTFDRXdTTk9NR3FCM2QvV0xGSDB4L0E2eSszWTR3?=
 =?utf-8?B?ZEc5QktzNTNSaUUwN0tzWUNUR2oxWENKcnZoRjVVWkZJRU1oUGt4bmxSQnZ1?=
 =?utf-8?B?SkxjRDE2NE93d3Q5QytHU0taVGRBOXB6Z2xOaWlJTVhHbzRWMEVVK2JOcXp2?=
 =?utf-8?B?QjhXeEp2akNRQ3V0bnR3UGw4RGh0TkdBTWtFRE1rdXF5aWdwK1RpazBLSkFL?=
 =?utf-8?B?NnV1WnJwb3N1Q2tHTCthenFDSVB4QTBsQ3I5a3JxUlFRZVpNSjUvbkZ5Q09C?=
 =?utf-8?B?ZjhhU2R1MTVBbHBxZUlyYlh3WVczdElFUlByQzFzNENrU09pSGdpa0Nma1Nv?=
 =?utf-8?B?bHdFZjducjFWeDF3NU13c0NDWE9TQUNoeGtKS0NrL3VrS01selI1WUFKcGgy?=
 =?utf-8?B?YkpZNnlIRWVXT3p4T2tPK2xYRmloV3NMUkxJeXJ5S29BWkduMTl4Y2JyanY3?=
 =?utf-8?B?UDExc3BPYzZFaGpOZk9RMTRLWjR1dzcwNktLbFRpL0p2Z0hrNG9mRTJibGJM?=
 =?utf-8?B?cHMyMzI1cUhaZGN4blVVS3p6MS80NkJ5VVBNYUd3Y2JJd3I2bkJ4NXl0d0JD?=
 =?utf-8?B?UjloZ2h0RDFDM0Z0M29tLzJEbHRQNEtzZTVJbEp2TFFqT2ZZWm5kM1hnUkNv?=
 =?utf-8?B?M3VQMG1ONTZWNlJkSVBCWWJEQzVNYUVNVU1MdVBVUDIramw2NG9tQUU3bHY5?=
 =?utf-8?B?VHNvOStwaEZTSTluUUZWWlgwbE56dzBSc2JBZmVVa2ZDcHUyL3lxMDdaZlNw?=
 =?utf-8?B?SmswS1JVcndLTzByMWdCR21yRkQxWjRieTFzZEY1WTl6QVN1WlFPNTNjeEhS?=
 =?utf-8?B?RXhwa3R2dUNCRFBxdzd4Ry9ROGVjZXBZM2x5c1RKRytEREhyTnhSbVhEOHRE?=
 =?utf-8?B?cTEvTGhsU2JHZlB2V2tjMUNFelduQ1pPN0NzdlRBa0hjUnhGZ3lnbWF5RlVz?=
 =?utf-8?B?K2hZaHl0VkFxUjBEOU5kNitEYllZaE8xRk1LM1o2STNJVi9KN2hvUTRRR1hy?=
 =?utf-8?B?amVIRWJOdGkxK2ZoMkI5MVNJMU82QXdKcE9BMFNneU5McEVzY0FOUjAwaUM3?=
 =?utf-8?B?SkNJQUZmTjlZdERDdTJOK2k4aG9UVi9JUGhYV0xSdThiZU5aNzJOak8xZUFR?=
 =?utf-8?B?SFFPYjNqc0VNK3lZaWFzYi90SUFDL21Ta1lYVlBDYkNUSWpaenNlVFZlNzN3?=
 =?utf-8?B?ckhrdTZpbytxdG0zMDBJdWpHWDh4ZXhjT1ltL1NxaWpWdUNiQW5lTlBGWkNS?=
 =?utf-8?B?MkV0SU5MdE1aa1Jnd1hETjdtT2xzRi9xa3ZKSnNkcGorNi9QRTF6SWZ2dmxL?=
 =?utf-8?B?K2dzNjRpa0tuczk4ck5McmticUxKU3JUdWtRRW5jMHdqNm1TVlhXWVVvaVA3?=
 =?utf-8?B?RUk3UEZPS1NUM1FkRnpqbVdBNS9DTWxobHVxSU9rcXQwNWlIVFN2d1ZnSTNC?=
 =?utf-8?B?YUk5aG1pcnhpbUcwTHVhRWxUTTRZSE1TdDBuYjRFcDlGS0hkc2doNWE1WDlv?=
 =?utf-8?B?dDVXdWt0bmg5MTdJR2RYTEpvbU9ZWEJ0TUFLU1creFp5TVBYUnVHd0FsV29u?=
 =?utf-8?B?c0I3TEpZazNZZXlkWmdRWFdkQ2hKcGg5a3FVVlZJSlJiTUphYzJyOFlIKy82?=
 =?utf-8?B?Z1lIbkE5Z2dOeUlJVWczMDQ3VmNZeXlVamV3dTBxZjZrRWYyTG9qNFkrUmRE?=
 =?utf-8?B?TUdrRXFNcUQvQXdhU3c1dTUra0ZRWmc3OGg1VU8zL201N2xhalcwdCttdlpY?=
 =?utf-8?B?TWhUMWxicy81MHY2MUZNaFZBbEd2ZkFBSXNhV01aTGM1Mm1yYm1lcDFiYTBI?=
 =?utf-8?B?Q2tXektma1RLL1VGaDdUQTUxSmk1Sk92WFJUN0ovK1E4eUNqdkV5RXRUc2R6?=
 =?utf-8?B?cTNwRlVDY01CSlR5SDhha0Z4emVpY1p2SFUzODdoaFdES2N6S1IxbFlCQm9n?=
 =?utf-8?B?V1RaQlJGSStDSkEwTUdoOWdMUnlFbW9ycmR4WWk0VjZ4S1RXd2hyME5WRVlE?=
 =?utf-8?B?YUVDSlB4ZHB5Wmt6bW5MZjNkOStrR1NBZldSV0hXNzg0ZHIxZ29OQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 849dc4f7-f94b-4240-1c57-08de7df09f38
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:29:15.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sENAcC7/JhK89URhZlT4uItMtY7dbwicCvyMZoKWNJOYrbzinP5ktIWOTt7M5p++SyRx9thxTNCF9Wd1k3dgOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6766

On Mon Mar 9, 2026 at 3:14 PM GMT, Alexandre Courbot wrote:
> By providing the required `IoLoc` implementations on `usize`, we can
> leverage the generic accessors and reduce the number of unsafe blocks in
> the module.
>
> This also allows us to directly call the generic `read/write/update`
> methods with primitive types, so add examples illustrating this.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs | 199 +++++++++++++++++++++++++++++++++++-------------=
------
>  1 file changed, 131 insertions(+), 68 deletions(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 1db6572f4a42..ed6fab001a39 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -197,6 +197,25 @@ pub trait IoLoc<T> {
>      fn offset(&self) -> usize;
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

#[inline(always)]

the fact that this is a pointer is somewhat uneasy to me. I wonder if Clipp=
y
with its inlining tweak would cause optimisation failure here.

Could this be just `fn offset(self)`?

The rest LGTM.

Best,
Gary

> +                fn offset(&self) -> usize {
> +                    *self
> +                }
> +            }
> +        )*
> +    }
> +}
> +
> +// Provide the ability to read any primitive type from a [`usize`].
> +impl_usize_ioloc!(u8, u16, u32, u64);
> +
>  /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
>  /// can perform I/O operations on regions of memory.
>  ///
> @@ -241,10 +260,7 @@ fn try_read8(&self, offset: usize) -> Result<u8>
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
> @@ -253,10 +269,7 @@ fn try_read16(&self, offset: usize) -> Result<u16>
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
> @@ -265,10 +278,7 @@ fn try_read32(&self, offset: usize) -> Result<u32>
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
> @@ -277,10 +287,7 @@ fn try_read64(&self, offset: usize) -> Result<u64>
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
> @@ -289,11 +296,7 @@ fn try_write8(&self, value: u8, offset: usize) -> Re=
sult
>      where
>          Self: IoCapable<u8>,
>      {
> -        let address =3D self.io_addr::<u8>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset, value)
>      }
> =20
>      /// Fallible 16-bit write with runtime bounds check.
> @@ -302,11 +305,7 @@ fn try_write16(&self, value: u16, offset: usize) -> =
Result
>      where
>          Self: IoCapable<u16>,
>      {
> -        let address =3D self.io_addr::<u16>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset, value)
>      }
> =20
>      /// Fallible 32-bit write with runtime bounds check.
> @@ -315,11 +314,7 @@ fn try_write32(&self, value: u32, offset: usize) -> =
Result
>      where
>          Self: IoCapable<u32>,
>      {
> -        let address =3D self.io_addr::<u32>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset, value)
>      }
> =20
>      /// Fallible 64-bit write with runtime bounds check.
> @@ -328,11 +323,7 @@ fn try_write64(&self, value: u64, offset: usize) -> =
Result
>      where
>          Self: IoCapable<u64>,
>      {
> -        let address =3D self.io_addr::<u64>(offset)?;
> -
> -        // SAFETY: `address` has been validated by `io_addr`.
> -        unsafe { self.io_write(value, address) };
> -        Ok(())
> +        self.try_write(offset, value)
>      }
> =20
>      /// Infallible 8-bit read with compile-time bounds check.
> @@ -341,10 +332,7 @@ fn read8(&self, offset: usize) -> u8
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
> @@ -353,10 +341,7 @@ fn read16(&self, offset: usize) -> u16
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
> @@ -365,10 +350,7 @@ fn read32(&self, offset: usize) -> u32
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
> @@ -377,10 +359,7 @@ fn read64(&self, offset: usize) -> u64
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
> @@ -389,10 +368,7 @@ fn write8(&self, value: u8, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u8>,
>      {
> -        let address =3D self.io_addr_assert::<u8>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset, value)
>      }
> =20
>      /// Infallible 16-bit write with compile-time bounds check.
> @@ -401,10 +377,7 @@ fn write16(&self, value: u16, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u16>,
>      {
> -        let address =3D self.io_addr_assert::<u16>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset, value)
>      }
> =20
>      /// Infallible 32-bit write with compile-time bounds check.
> @@ -413,10 +386,7 @@ fn write32(&self, value: u32, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u32>,
>      {
> -        let address =3D self.io_addr_assert::<u32>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset, value)
>      }
> =20
>      /// Infallible 64-bit write with compile-time bounds check.
> @@ -425,13 +395,28 @@ fn write64(&self, value: u64, offset: usize)
>      where
>          Self: IoKnownSize + IoCapable<u64>,
>      {
> -        let address =3D self.io_addr_assert::<u64>(offset);
> -
> -        // SAFETY: `address` has been validated by `io_addr_assert`.
> -        unsafe { self.io_write(value, address) }
> +        self.write(offset, value)
>      }
> =20
>      /// Generic fallible read with runtime bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read a primitive type from an I/O address:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_reads(io: &Mmio) -> Result {
> +    ///     // 32-bit read from address `0x10`.
> +    ///     let v: u32 =3D io.try_read(0x10)?;
> +    ///
> +    ///     // 8-bit read from address `0xfff`.
> +    ///     let v: u8 =3D io.try_read(0xfff)?;
> +    ///
> +    ///     Ok(())
> +    /// }
> +    /// ```
>      #[inline(always)]
>      fn try_read<T, L>(&self, location: L) -> Result<T>
>      where
> @@ -445,6 +430,24 @@ fn try_read<T, L>(&self, location: L) -> Result<T>
>      }
> =20
>      /// Generic fallible write with runtime bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Write a primitive type to an I/O address:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_writes(io: &Mmio) -> Result {
> +    ///     // 32-bit write of value `1` at address `0x10`.
> +    ///     io.try_write(0x10, 1u32)?;
> +    ///
> +    ///     // 8-bit write of value `0xff` at address `0xfff`.
> +    ///     io.try_write(0xfff, 0xffu8)?;
> +    ///
> +    ///     Ok(())
> +    /// }
> +    /// ```
>      #[inline(always)]
>      fn try_write<T, L>(&self, location: L, value: T) -> Result
>      where
> @@ -464,6 +467,20 @@ fn try_write<T, L>(&self, location: L, value: T) -> =
Result
>      ///
>      /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of
>      /// concurrent access.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read the u32 value at address `0x10`, increment it, and store th=
e updated value back:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_update(io: &Mmio<0x1000>) -> Result {
> +    ///     io.try_update(0x10, |v: u32| {
> +    ///         v + 1
> +    ///     })
> +    /// }
> +    /// ```
>      #[inline(always)]
>      fn try_update<T, L, F>(&self, location: L, f: F) -> Result
>      where
> @@ -484,6 +501,22 @@ fn try_update<T, L, F>(&self, location: L, f: F) -> =
Result
>      }
> =20
>      /// Generic infallible read with compile-time bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read a primitive type from an I/O address:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_reads(io: &Mmio<0x1000>) {
> +    ///     // 32-bit read from address `0x10`.
> +    ///     let v: u32 =3D io.read(0x10);
> +    ///
> +    ///     // 8-bit read from the top of the I/O space.
> +    ///     let v: u8 =3D io.read(0xfff);
> +    /// }
> +    /// ```
>      #[inline(always)]
>      fn read<T, L>(&self, location: L) -> T
>      where
> @@ -497,6 +530,22 @@ fn read<T, L>(&self, location: L) -> T
>      }
> =20
>      /// Generic infallible write with compile-time bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Write a primitive type to an I/O address:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_writes(io: &Mmio<0x1000>) {
> +    ///     // 32-bit write of value `1` at address `0x10`.
> +    ///     io.write(0x10, 1u32);
> +    ///
> +    ///     // 8-bit write of value `0xff` at the top of the I/O space.
> +    ///     io.write(0xfff, 0xffu8);
> +    /// }
> +    /// ```
>      #[inline(always)]
>      fn write<T, L>(&self, location: L, value: T)
>      where
> @@ -514,6 +563,20 @@ fn write<T, L>(&self, location: L, value: T)
>      ///
>      /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of
>      /// concurrent access.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read the u32 value at address `0x10`, increment it, and store th=
e updated value back:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};
> +    ///
> +    /// fn do_update(io: &Mmio<0x1000>) {
> +    ///     io.update(0x10, |v: u32| {
> +    ///         v + 1
> +    ///     })
> +    /// }
> +    /// ```
>      #[inline(always)]
>      fn update<T, L, F>(&self, location: L, f: F)
>      where

