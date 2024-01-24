Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01on2094.outbound.protection.outlook.com [40.107.121.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA95132C17
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.121.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706127525; cv=fail; b=iXSm9sUBAg4opO+kO5mqpTBzjNOVb7EdCC/l5AAg4MUmCUlYG0IPHt63c7jPYxDeZlKYCvTuKpFyv5Fwy8GL1R5phnRq6uhVmpratFPpXR6FGHiMrxn9lvb97hXRRt7TlWcSKvtkoMoawc+rz9FMefVi1+GpvsaRMKHmBh7f4Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706127525; c=relaxed/simple;
	bh=X3Gv6IzGNoMYNSZK9zQYkbfnAEhwzULEcykH/TtzwNI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LxNWo9Sw0zxHHQlxxxQPUV4/CxXUheOFfSPX6TbkVXrzIvKCjQISLpWwwn4h3ZhT8aMV+320RnxBQOiZLVSxjPTBUcDgU3Vc3wmjXB3KPXJ6zzMdzeGAkitRXbwXdhRWD6sSBcTr6QOoFZGMpqhJN2XOuDu1js8C3bXSCUbrVpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZgnYf+zh; arc=fail smtp.client-ip=40.107.121.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZgnYf+zh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br8Pi+xvonil0PQRW2/znOC2rdm7qN7fy0aisjyKIN7x70LLz4iGL6AmUqOYFX1N0QYvkG+UnBU5y4TNhM0moBuIFe5nxD1010v2hG8pmRr5mMCCJV8md2YffjxyBGmcC99XCgEUzl2y4MARngFMNZHB3a5EhfB43kEWmch/geWRtf3c9DgwjzoL3c4+KE/G8m5s9ZBvjLUEEBlo1kp0S+PxM3NXzmP4hWyjnmxh7NAa4CsSrzWsUubn0dDDJCG/WngBb+AsC71nQXyZCIq0tqAZosHbDcsFNFJTJb/m/RqEfWKje0FYzwhdY30lpERqnj5HkyKI/z1seIE3xkEgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fo74IcktEtqdUi/gR8+SUOmzNrpZcWq/dCB8BrK4Teg=;
 b=nypo4WtuR7HT/LbjKT8UxTFLoW2f1PLuOmRx4tB33pkvoEK859BWvSHoaZinpIHUHECd0MW+tRiSZbBKNbL+jhPqxhReYP62zivsgatYm6BhWe69flade5HrYajJefs8RnlTUv0XJdBd9YgDh4ioN6x1GmryJzaMUDqLMQXDwMB0Cu6GHqq5QLZJjZDFnYS8emB8QRuOM9pQE0zndzuynybAX0jOjiIafkzuj3upRSaAjhT2Q6t8QU9SFRiKunP5RTJ1Cnkmddjmj0eRjUrMX/CXqAlTLBPRPi+vRPtVgU8koemBu82bygijQQ2Sr0ShwUPzQ8QH7bCDiNpWCLt2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fo74IcktEtqdUi/gR8+SUOmzNrpZcWq/dCB8BrK4Teg=;
 b=ZgnYf+zhSj05pdh2wLeSi6OCgpz1gwHYAQgKPPzefa9wARR5MnSIXuZ0g4Y3CHz3ScqpqiTMbDq6LEoS6JIgIGXeKhe6dYi8vB8bgyQ6HhwfSqr4hM8JqB3eKjpH5Vd+g4dY2j9hDtfucUK7kY+tKZctyhKoRBDCLS9t6qV/KXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB5109.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:250::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.25; Wed, 24 Jan
 2024 20:18:39 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ec07:aa7e:ffbc:ba47]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ec07:aa7e:ffbc:ba47%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 20:18:39 +0000
Date: Wed, 24 Jan 2024 20:18:32 +0000
From: Gary Guo <gary@garyguo.net>
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, Virgile Andreani <armavica@ulminfo.fr>
Subject: Re: [PATCH] rust: str: implement `Display` and `Debug` for `BStr`
Message-ID: <20240124201832.30a76eb8.gary@garyguo.net>
In-Reply-To: <ZbFBnXy7YWV0MFC0@ohnotp>
References: <ZbFBnXy7YWV0MFC0@ohnotp>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO2P265MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f07f6d3-2a47-42aa-a250-08dc1d19a71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FD8IXdLpb29jpuTyA5nsqUh2DFwR9En3+V18Dlrwsvc0n/wRaG3fX4s7wKnfEUbwJqL7zyLE9Lrwczs6tGh8GMkwG9KQ6u08CpC9Ngi+uyfMzo1eWEhTWLWnYhslJCfbqyWGWVnOVn1h8FkT1+wLoWccs8pdKkdYVb6h7ntceqBArRiAdrYUwl/A0hUsY7FpvtKPA7eSQ2bHXTdQ0bz6fQvep5nwXPCunP6WCNOPGL4iwCDN+zf3Iqgq+3GngAxf9ZCxMZCttzzAKdFibZPR4HV47lPlsrY9IwcQGPzJb7w+ZUYbqny80kfy1Vx+iPwhbR9AhQf+3lw6cWLXjo3k/Boi5dj3tkuQUjZshK1LKcdDHnZ43EVGBqUxuAGm1uWMDVkucsuDXa77Lo+OVZKduX5cCYKKZ0xqyL43CNVb/FNQ0YjvmlCxhayBFV+UQRQ2LnXdkRXa8rCeXlfGYNzuIIdmWnxBjDrjMdlkRU6yadmhoclEfR2kIPImdSodvzVj4QngSUViswn3/DSoSqyyvOSBBU5i4+WCF2hqu8bvuCNtWvOg9EQxbRkka0WSQomaCzUTrozb7wxgI36V8nDxy3Ha5sh5CWdpRhG8xaxxReU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39830400003)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66899024)(38100700002)(36756003)(2906002)(41300700001)(86362001)(54906003)(6916009)(316002)(66476007)(66556008)(66946007)(6512007)(478600001)(6486002)(6666004)(7416002)(83380400001)(5660300002)(8676002)(4326008)(2616005)(8936002)(6506007)(1076003)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YklXRmRxVU1KMUtpZXFFb3BiT1p2NEswWThpQnJuZFJnZExMdVZ3YnYveEpp?=
 =?utf-8?B?VU9xYmN4bDFxbythTW9hc3JLZHJuYzF6T3pyM09VeGhiQVMzZHJRM3pMUjNm?=
 =?utf-8?B?TWhCcDU1UzBGYmVoMkJsSFRSMEZmbzhldVVlUldueVI0ZUt1QmFWTXhiZDZQ?=
 =?utf-8?B?eUhiTjJQMTkra0Q3SzVNQjUwcjJHend6WnFNenlIQm9abXZrSjVJZ3UySE1n?=
 =?utf-8?B?WVhvTUNOakkwRVRXdDBLU0tlaUVUNStNSWx1cXhJRGFIcU5IVjNFUkRsMnhW?=
 =?utf-8?B?eGIvOFc5RGZkSTNSY3lyZWRFTUp6dyt3a0hBSGY1MGNZVHdhNW5LVnVrVGFT?=
 =?utf-8?B?aTF4N0dtL3hIZGFxbGYzQ3liMCtXN28yYzdDdllON1YxYjJoLzV0amZOUG5J?=
 =?utf-8?B?aUpwZGNuOGpKRFM1blcvZmpaYmlNV3o5YndoZGdCVjAvSUZ1TXNsQWVSZ3Zt?=
 =?utf-8?B?TlpmSzJlbEVTbC9lTllybjM5aWZiZko2akNRL1BQY1RWWG1XdDV3ejI3bVNa?=
 =?utf-8?B?QnhVOTlXQW10bS9nc215NGdBdVQzOERHUVVwSTlPWUp3a24xajlVcCtQVmxy?=
 =?utf-8?B?alR0RHZvazJlZ0JFRlNWSzBzYkE4L2JtckYwc00zK0EvWmJ0dUpQQ1RLdEVp?=
 =?utf-8?B?bzk1bE9Zb082WmVIZHpSNXdWZzQ2S0JLN093NHRGVGJmZThZeStXZzBnekdw?=
 =?utf-8?B?Z1Bla2p2RG1JbXNSWkcxOWlkWkhTT094RS9EYjVLazh4dndHSTM0MDB5Q0h6?=
 =?utf-8?B?b1NCRmlINjZNVWlTaVZUZTcwcno2WUQ5cVUwdks0ejdEb1p1azk5YTEzdzJ6?=
 =?utf-8?B?M1hYOTVWdHhkM09PS0VFSEJueHViYXl5N25VQ2huYUovRnZnSTJVODRoaW1I?=
 =?utf-8?B?ZW1Ha0toSkJlZ09DMVhIR3JuRGNXd2NGQUswTnM3TklXUzVqNEpUaVFaS25F?=
 =?utf-8?B?Qkw1K0xtbmU1NWJtTEk2SGFEbUIycEluaGlBL3FvUGRsTXplaUJ0TDF2MVdQ?=
 =?utf-8?B?L1E4cW5pWkg0MENDVTRQYkFkYktWWnp0Nk1sZVJxS3lIQU9vMFhhWTFiYXZB?=
 =?utf-8?B?VUgyME5USFBoNVZlRGVHVVBFSGdjemxpbHpvdVVxaTBKckROYnZsSnFkN2xL?=
 =?utf-8?B?UkxWaHNqNGpqZ0dQZmNaWHAzTHdYM0o5YnFzOUtKL2IxS3RCUnJRNWM1b0Na?=
 =?utf-8?B?bVE5UUtJUjRGbWNhc2dPRVVmV2hpNTFNalRWamxQMVZKVUU5NXFaRFhLY1Bq?=
 =?utf-8?B?Ky9YQjBUSjV0UFRsWGdXZVhHU1ByeVljQTl6anpabXplTVFtU1c5bER1RStv?=
 =?utf-8?B?UDUvblgzZFdTWlNPRkdwN2t5T09mVmhxd1ByUmxvS1ZNeUFaNjNQTFM1VEtX?=
 =?utf-8?B?eXc0bHMxR1B6elQ4WFhaK1Q5UFl3MVVqa1QwUFo4YnVmb2ROSE9WNm1wYnNJ?=
 =?utf-8?B?cHhROGYwSmpNRER6bDU5YzZYQVhZRVl5YXFmR2pDQm1WSHBLelZJeU02eWd5?=
 =?utf-8?B?M1VGNm5udmJyWVl3NkZXZWZxbUJHSi9idGRkVTF6Y3V0QXJxc0xadTBFZ1JD?=
 =?utf-8?B?aVc3RUV0VmJUaGwxQkZHNHBGd043RURMS2dsSjVid1l1RmRJY004cWE2aXJ3?=
 =?utf-8?B?aG9ySllKaDkySmFGWXBFVDR2OGVZaFdwSjQ4b2xFQm5ITDFlVXNLbmh3STRT?=
 =?utf-8?B?c2xjREprb3ZNTTZOWWF5VktLMHliclMzNmVNTWMwUWhkZVZNK25lYjdJWlpu?=
 =?utf-8?B?Q0hPbWpML3NhRER4ZU8xdTJMSG54aEVaR3IwaUpSeFdncG9SRUoySVcxLy93?=
 =?utf-8?B?NGJkOHg0cWorUzVCbzVNaytzeURmYjlSZmUxOXhVeEFpV0JPcm5SVDk0YWtJ?=
 =?utf-8?B?MThSemQrcDVtOUt1Qlg1MHk5b1lXQVFJQWlFamR0b2NhNnFnZGJOaThiOUNU?=
 =?utf-8?B?bFE4K0FzZlp3VFZNWTAyQmJoaWtRbHY4aXZCUm42Yk0wNDFmQ3hueEkram9q?=
 =?utf-8?B?R0QwZ1hZcitRY3VmcHd2Y1pwL1ZHMFl2RTc5akpwVk1rcWJGK1N0WTMvRXdQ?=
 =?utf-8?B?aGxsdlFTSUlnWTBPdUNzY2pjWVZyc1lrZGRqR3hub0UrSTd5alVnaXFmVkZp?=
 =?utf-8?B?UWdJZzQyZ054MTFmbXladTVVV0RERmdEWG8wQnFRNVlLTFo2VlJ5SFlycm9C?=
 =?utf-8?Q?IckSJgyTjEQojtfeIZ5aEP8WRIuWypyOMaE0So2AMosO?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f07f6d3-2a47-42aa-a250-08dc1d19a71d
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 20:18:39.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxs+/Yc77Ilw0qGPeedotngsLacDcs2IpE4h42uc4d9kAoSjn1XVGlNXtzZrh2nVm5Jz/54cNrt+M41gD8FAJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5109

On Thu, 25 Jan 2024 01:58:05 +0900
Yutaro Ohno <yutaro.ono.418@gmail.com> wrote:

> Currently, `BStr` is just a type alias of `[u8]`, limiting its
> representation to a byte list rather than a character list, which is not
> ideal for printing and debugging.
>=20
> Implement `Display` and `Debug` traits for `BStr` to facilitate easier
> printing and debugging.
>=20
> Also, for this purpose, change `BStr` from a type alias of `[u8]` to a
> struct wrapper of `[u8]`.
>=20
> Co-developed-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
> ---
>  rust/kernel/str.rs | 211 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 186 insertions(+), 25 deletions(-)
>=20
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 7d848b83add4..0f0261e063d2 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -14,8 +14,104 @@
> =20
>  /// Byte string without UTF-8 validity guarantee.
>  ///
> -/// `BStr` is simply an alias to `[u8]`, but has a more evident semantic=
al meaning.
> -pub type BStr =3D [u8];
> +/// `BStr` is simply a wrapper over `[u8]`, but has a more evident seman=
tical
> +/// meaning.

I think this line can go?

> +#[repr(transparent)]
> +pub struct BStr([u8]);
> +
> +impl BStr {
> +    /// Returns the length of this string.
> +    #[inline]
> +    pub const fn len(&self) -> usize {
> +        self.0.len()
> +    }
> +
> +    /// Returns `true` if the string is empty.
> +    #[inline]
> +    pub const fn is_empty(&self) -> bool {
> +        self.len() =3D=3D 0
> +    }
> +
> +    /// Creates a [`BStr`] from a `[u8]`.
> +    #[inline]
> +    pub const fn from_bytes(bytes: &[u8]) -> &Self {
> +        // SAFETY: BStr is transparent to [u8].
> +        unsafe { &*(bytes as *const [u8] as *const BStr) }
> +    }
> +}
> +
> +impl fmt::Display for BStr {
> +    /// Formats printable ASCII characters, escaping the rest.
> +    ///
> +    /// ```
> +    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
> +    /// let ascii =3D b_str!("Hello, BStr!");
> +    /// let s =3D CString::try_from_fmt(fmt!("{}", ascii)).unwrap();
> +    /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
> +    ///
> +    /// let non_ascii =3D b_str!("=F0=9F=A6=80");
> +    /// let s =3D CString::try_from_fmt(fmt!("{}", non_ascii)).unwrap();
> +    /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
> +    /// ```
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        for &b in &self.0 {
> +            match b {
> +                // Common escape codes.
> +                b'\t' =3D> f.write_str("\\t")?,
> +                b'\n' =3D> f.write_str("\\n")?,
> +                b'\r' =3D> f.write_str("\\r")?,

The current CStr code will print these as is. Why escaping these for
Display? Also, if you want to change the behaviour, please put it in a
separate patch.

> +                // Printable characters.
> +                0x20..=3D0x7e =3D> f.write_char(b as char)?,
> +                _ =3D> write!(f, "\\x{:02x}", b)?,
> +            }
> +        }
> +        Ok(())
> +    }
> +}
> +
> +impl fmt::Debug for BStr {
> +    /// Formats printable ASCII characters with a double quote on either=
 end,
> +    /// escaping the rest.
> +    ///
> +    /// ```
> +    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
> +    /// // Embedded double quotes are escaped.
> +    /// let ascii =3D b_str!("Hello, \"BStr\"!");
> +    /// let s =3D CString::try_from_fmt(fmt!("{:?}", ascii)).unwrap();
> +    /// assert_eq!(s.as_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
> +    ///
> +    /// let non_ascii =3D b_str!("=F0=9F=98=BA");
> +    /// let s =3D CString::try_from_fmt(fmt!("{:?}", non_ascii)).unwrap(=
);
> +    /// assert_eq!(s.as_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
> +    /// ```
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        f.write_str("\"")?;
> +        for &b in &self.0 {
> +            match b {
> +                // Common escape codes.
> +                b'\t' =3D> f.write_str("\\t")?,
> +                b'\n' =3D> f.write_str("\\n")?,
> +                b'\r' =3D> f.write_str("\\r")?,
> +                // String escape characters.
> +                b'\\' =3D> f.write_str("\\\\")?,
> +                b'\"' =3D> f.write_str("\\\"")?,
> +                // Printable characters.
> +                0x20..=3D0x7e =3D> f.write_char(b as char)?,
> +                _ =3D> write!(f, "\\x{:02x}", b)?,
> +            }
> +        }
> +        f.write_str("\"")
> +    }
> +}
> +
> +impl Deref for BStr {
> +    type Target =3D [u8];
> +
> +    #[inline]
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> =20
>  /// Creates a new [`BStr`] from a string literal.
>  ///
> @@ -33,7 +129,7 @@
>  macro_rules! b_str {
>      ($str:literal) =3D> {{
>          const S: &'static str =3D $str;
> -        const C: &'static $crate::str::BStr =3D S.as_bytes();
> +        const C: &'static $crate::str::BStr =3D BStr::from_bytes(S.as_by=
tes());
>          C
>      }};
>  }
> @@ -225,15 +321,7 @@ impl fmt::Display for CStr {
>      /// assert_eq!(s.as_bytes_with_nul(), "so \"cool\"\0".as_bytes());
>      /// ```
>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        for &c in self.as_bytes() {
> -            if (0x20..0x7f).contains(&c) {
> -                // Printable character.
> -                f.write_char(c as char)?;
> -            } else {
> -                write!(f, "\\x{:02x}", c)?;
> -            }
> -        }
> -        Ok(())
> +        fmt::Display::fmt(self.as_ref(), f)
>      }
>  }
> =20
> @@ -255,23 +343,14 @@ impl fmt::Debug for CStr {
>      /// assert_eq!(s.as_bytes_with_nul(), "\"so \\\"cool\\\"\"\0".as_byt=
es());
>      /// ```
>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        f.write_str("\"")?;
> -        for &c in self.as_bytes() {
> -            match c {
> -                // Printable characters.
> -                b'\"' =3D> f.write_str("\\\"")?,
> -                0x20..=3D0x7e =3D> f.write_char(c as char)?,
> -                _ =3D> write!(f, "\\x{:02x}", c)?,
> -            }
> -        }
> -        f.write_str("\"")
> +        fmt::Debug::fmt(self.as_ref(), f)
>      }
>  }
> =20
>  impl AsRef<BStr> for CStr {
>      #[inline]
>      fn as_ref(&self) -> &BStr {
> -        self.as_bytes()
> +        BStr::from_bytes(self.as_bytes())
>      }
>  }
> =20
> @@ -280,7 +359,7 @@ impl Deref for CStr {
> =20
>      #[inline]
>      fn deref(&self) -> &Self::Target {
> -        self.as_bytes()
> +        BStr::from_bytes(self.as_bytes())

Either use `as_ref` here or use `deref()` in the `as_ref`.

>      }
>  }
> =20
> @@ -327,7 +406,7 @@ impl<Idx> Index<Idx> for CStr
> =20
>      #[inline]
>      fn index(&self, index: Idx) -> &Self::Output {
> -        &self.as_bytes()[index]
> +        &self.as_ref()[index]
>      }
>  }

