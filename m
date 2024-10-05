Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010014.outbound.protection.outlook.com [52.103.7.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C761B960
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 17:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728148477; cv=fail; b=Vfl1fPFoRASvO89st/mAR772WgpOcrQ41o+P90+bkT5QqOQopb5Xy5XOyxLQFaMEPkctZg/O6+6DmjnXkh3147PUI/PVaTgLyNJbPyRqErIUMy8Buuktv2oBkshIFoZjsLDt8oPpNpxl0DTx3mq+xNtNvlQF172R7B6D9jrgmFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728148477; c=relaxed/simple;
	bh=WJD8CAlEHh4bKaOs3sVzcVyU0dOs41b7op/I/as7BTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DPgBYUk76hemEM+moNieq0tu6MzUShJxKchVSyGfqIvCAnILNXV7mo/01/SHeKbafHa2ixVLCsLMCZ48CnGDOwFf2RxDulB3A1E4Dq9bvwkLWTv4fAo616nAHiCso1SvRFZSJw0EbZUEZGjY7T59al+EUN6q/QuNcYKjhCe1uak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=gShitqFB; arc=fail smtp.client-ip=52.103.7.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="gShitqFB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdpwxg9H63h1rVreQ+ZB6Dxav/LpfCKrJdS+0DY/MUt5Krj8buPef2nah9KZjtkn9sgdflqoPNgLyB53XT6y4Tr+BZEvOfP8O9Zvsacb/p0drMgi9/SNw5H6QO7hTCV6CDhBuvVcdP5sBZOTwKLc+XhVw8gcgnK4m35rsKi4xWve7738NFnIy5sxQVQ1ud/h5ZekbsBwHjt8U1EIVq4UWawvWPbqaXmORp114/V5gJxMsikX2zAXMzDohjGHh6Mge5mfXgq5n1wCXbY8lztrZDF/9s79+G1iIIWUcLnxI/n7BtLe40IR+Qrn3p56qw8n10M0asOrpIwG3ZP03WH8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH7QzlPNDSpDCSrxj7/a2aA2ud0m2+lEiNjc/86bxQ0=;
 b=NyMc+Zsn8WrKLTuXA1GFBfSM+qVTVFF5h5WcHS0Yfw8Vbm3EOAvheUsCPN5alXCorSP3WVqeMDMriXBonjZzS0JdN5DDrplqPw+sGE2KEmTatAFAPI9ECbj6AbIVP8u9Lt5n3d/7CvrrkwwbtSPddupXZMpu+jIcMZBXBl5FL/S573g3G7LT0aEgR8BRm8JvahpQ05tfITKwf5S2eeXJLS/COB7lBUaSdaHbno1pgXhQ93HwDAXUp16Y2uKUwCK9igLl2TCx98/t4i+V6XUaoYjCe2ziE8MchpcyLZQcIuzbbLYniCrn5EUzDeoviTQ7NbcIHQYQlfMuG4XBxwv/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH7QzlPNDSpDCSrxj7/a2aA2ud0m2+lEiNjc/86bxQ0=;
 b=gShitqFBQC67u9w9CtXho8lcVCrMtA/dtjGsjfUg+BF+HgW4l/mzkiydz73lWZes2HFwFQWVPBKBScy9QFS73HhsXAdbGYvWvDKX1qjFq6gEGrh/62s0ze9Hd3DyU9GD6w+5H3KnCqHczYSyr8tTV8sAgsZNWTGB2CwwcHOSLEyjWThnCFdrZ7+R7TIE6nRJ+2w76AtfWyTnXdR70l3qOlV+3N1JOWCEtMnhAlHW5GqGKDUxVU0aAVFWfeE/6h3aelr0yXAX9UUALuU7OYQqMWVuEiOeQYuOkAKk+IfKdlPDhHHhNN1Cu0rmnRsHptqw3u4izTP7j6Et8/TVIYqC3Q==
Received: from SN6PR02MB4925.namprd02.prod.outlook.com (2603:10b6:805:8f::17)
 by CH3PR02MB10488.namprd02.prod.outlook.com (2603:10b6:610:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Sat, 5 Oct
 2024 17:14:34 +0000
Received: from SN6PR02MB4925.namprd02.prod.outlook.com
 ([fe80::bd8b:8c3a:886:61f6]) by SN6PR02MB4925.namprd02.prod.outlook.com
 ([fe80::bd8b:8c3a:886:61f6%5]) with mapi id 15.20.8026.019; Sat, 5 Oct 2024
 17:14:34 +0000
From: Filipe Xavier <felipe_life@live.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, "ojeda@kernel.org"
	<ojeda@kernel.org>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: optimize error type to use nonzero
Thread-Topic: [PATCH v3] rust: optimize error type to use nonzero
Thread-Index: AQHbFahP9OWFfUsSZUuXZh7D51fhPbJ1q0AAgADImGCAABrlAIAB0s7s
Date: Sat, 5 Oct 2024 17:14:33 +0000
Message-ID:
 <BL0PR02MB4914E5DB9A7D8AAB13120D3DE9732@BL0PR02MB4914.namprd02.prod.outlook.com>
References:
 <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com>
 <BL0PR02MB491430823078BAD42FD56D13E9722@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72=fsQ+dXEGDvxtKO7jk1dEXD_Rv98du97GNDChYPTZ8yg@mail.gmail.com>
In-Reply-To:
 <CANiq72=fsQ+dXEGDvxtKO7jk1dEXD_Rv98du97GNDChYPTZ8yg@mail.gmail.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4925:EE_|CH3PR02MB10488:EE_
x-ms-office365-filtering-correlation-id: d42fbdec-2921-46a5-9b03-08dce5612ed6
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|15030799003|461199028|8060799006|8062599003|15080799006|7092599003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 uv+bLpDaYaXlxxNBCUGKhggo02lZKCSBI28bwe3E4L88QKEezklU5HzQSWM4dLUAjXnTPECPXMgermMip13X/kmvizIcoQXiifjF9l4M4Gm4G8/a8uwoImKJmWFDRhZGGt1Nfg7kWvzkWBtyNclHWebbuPx2ZYZ4DgNkP+vissYZK6ApqDTGXy0u2nTrphe39WD4d6iwR6NK/Lp7p4t+c9K4Xf34zd8vjl+2MfLfrNemixod7GyxyjYrlC8RVGjGAXofS5zZF02PGi3KJbFht2dhMDPeho6DiWBcmC29nxjamFQ4GJ6YLSzXNV1apIcW7snV6UdJei/GWICNQVyP7Vqet0oCfIOpSnCplHG2MyHx9gXOFZvuQi83Kj+7bqVouFRivCBFUqpReTqEYsEHdjlkopc2uW4OAh+NGUMBWqQ0V1mskEkpYlTsX1vhdu6/8cxsue4mKCND3ki+3oVkYVrH6cOaHeEHpSVdoDq2qFURxVNx+wVIXdWoTFSgApaMaZ6DF3maxE1zxCxVvWtWxJolSYNFdwj0bmC5fSTCH+d7DRUbPSpV3N/QAaGoa+Gji5rpuEzIq6oXc2h3ZFRL2/l9OTYsuKMbYwwc3rELsg1S3Q/KCOYcumxEBHZ76vf6Y+pKs8LenI0MUTEMy9kvCxbMNT2BTBz1vpWm+o5CGRR99qnySZ9vXjEaauGZ858jImwS4i5ZKjC8qsBWx/6TEHRXXT7WqeXmFUYB3GGIQmDLlcfKREOyYJBfUymAlhlU
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KX9ZjMgIH4MgWLl7Up+AbheigTVIX5oLkiQdcoV/xXpUcpYBVFoUuO0di1?=
 =?iso-8859-1?Q?EY8MRULgPI6nAZikakMf85KjplzPwCVwiPvdwqIoKhALaFymaIGpR4yE8j?=
 =?iso-8859-1?Q?BO1HttxHN8bB+w8Uv0sDGONQ5cdfK5qFLlnooNmFkc6dfTx9PbDfn02hYS?=
 =?iso-8859-1?Q?hHKEqfxmsHm283nQ92letzEnB7jNQT8gCe+yzq+zA8QYJbn2uOxvX+SyPc?=
 =?iso-8859-1?Q?Cm/lwPCdy/PnJc7bOrBwOmiwR1/gNRazNXw5kbl1d3Hs3zGkfEPCeo8oKK?=
 =?iso-8859-1?Q?iJPLws7Xyqw1MO9KfvA+xHm7ZG43vcxntGvzJM1AdXEvqpvZ9QvxF5BJyU?=
 =?iso-8859-1?Q?/hxD96qIoD+PVDdtMb+Z4VSaKavu+C3PvQ/PI29qAV2JmpKpwV0svByK+4?=
 =?iso-8859-1?Q?86N23OjgOsfjp+Fwhj5pt8pBc+VDPZHY7Sr+JKcpAG+Ss+MjTf1+2ZRoCl?=
 =?iso-8859-1?Q?NYxP0w9E7AD1oDQ/CcbH6qVbwvT7v/ZiVuXQC5fYjG3N87nXrOersfE7ET?=
 =?iso-8859-1?Q?PqxZg+CrzqhgqfF+f6E1ITUSgIAgHrUXxa1EtiMdGX1z2opJwTx78IVnDY?=
 =?iso-8859-1?Q?T728m0MBMhdzy3x7X9MAhwZfFVyyWSGpMw5araIUI+l7Vvtqj9emPyjqax?=
 =?iso-8859-1?Q?sZEDUAi0zVIoz7R31P0mrB0XOvrSp00XoRZ0Fib9iVCEe3pzIV8YPEbY84?=
 =?iso-8859-1?Q?3IwgW1cs93e9wVcJWUtlFhBmzlU2rSgGASODSlnvoL6V9+cttMGK1ijHm4?=
 =?iso-8859-1?Q?RBFyBQlKBXlpHMfUlt/v04pdwszsk4WnwayQ5aeWuYRH+p3OZ6FDo8HLac?=
 =?iso-8859-1?Q?PYBkBIifEHC1TXcXLo9Sng2Y91sDep+1wo6BSoxmWg6XSuQ3zr2qh6SmP4?=
 =?iso-8859-1?Q?OSu5DLT2AU/GtOdz9ueFL02y3jNrq5d3DHDLaWVFNYfxkd7oBhh5Vg8LRE?=
 =?iso-8859-1?Q?98k+bf+sbMo/BDzghJX8MsEFrnWflVtJbXpmy9ytrQVfgmz3n3p3Zr9YSz?=
 =?iso-8859-1?Q?C5l6KjGAeuF2mPXv5F3mZg8iCEtWT8gjcDm6QjWtH5M4kdQx35m+h2y7cn?=
 =?iso-8859-1?Q?G8T81siMySYCaWwc9ufM1ZEhZYSBv8R8KgahUUIuvGQpOQmy32tGWXUhMa?=
 =?iso-8859-1?Q?qT4IKBXe1FTAq8fKE2Ty+wUPNYqpzZcxNG00xZpHTBnvUI09TAIHC7Hfx+?=
 =?iso-8859-1?Q?KNco38XU4SJnWnPvWLYCaWI5VlqLDHiiOpfpj4ozK/Ae5taI0fPT1mfek9?=
 =?iso-8859-1?Q?NXDJrSCrxRSjXfHCwiD8/gfoj1W/orJXQqfKZahYFr2Yk2rvcroqw+YRwH?=
 =?iso-8859-1?Q?4hjIDBo62I6QhuqoCHTZfabDCHZOS+3wGh4F4rLW6Cr4Ilo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-0f88b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4925.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d42fbdec-2921-46a5-9b03-08dce5612ed6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2024 17:14:33.9811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB10488

> For instance, you are using here a `build_assert!`, and that may be a=0A=
> good idea, but I mentioned in v2 whether perhaps this is guaranteed=0A=
> by const evaluation (or not). So given the `build_assert!`, I assume you=
=0A=
> found a case where it is required, so it would be nice to mention=0A=
> which one, for instance.=0A=
=0A=
Before the macro doesn't use unsafe anywhere, but now i need call a =0A=
`NonZeroI32::new_unchecked`, i added the `build_assert!` to ensure=0A=
that the macro is safe, and improve the safety comment.=0A=
=0A=
> Instead, if it is possible to have a safe `const` constructor, then we=0A=
> should just do that. Now, can `from_errno` be `const` to do so? If=0A=
> not, can we refactor things to make it so somehow (perhaps a new=0A=
> `const` private fallible constructor)?=0A=
=0A=
It's possible, but i don't like how it ends up with EINVAL instead of a=0A=
compilation failure when passed an incorrect value.=0A=
=0A=
`=0A=
macro_rules! declare_err {=0A=
        ($err:tt $(,)? $($doc:expr),+) =3D> {=0A=
            $(=0A=
            #[doc =3D $doc]=0A=
            )*=0A=
            pub const $err: super::Error =3D {=0A=
                super::Error::from_errno_const(-(crate::bindings::$err as i=
32))=0A=
            };=0A=
        };=0A=
    }=0A=
=0A=
impl Error {=0A=
    /// Creates an [`Error`] from a kernel error code.=0A=
    ///=0A=
    /// It is a bug to pass an out-of-range `errno`. `EINVAL` would=0A=
    /// be returned in such a case.=0A=
    pub fn from_errno(errno: core::ffi::c_int) -> Error {=0A=
        let result: Error =3D Error::from_errno_const(errno);=0A=
=0A=
        if result =3D=3D code::EINVAL {=0A=
            // TODO: Make it a `WARN_ONCE` once available.=0A=
            crate::pr_warn!(=0A=
                "attempted to create `Error` with out of range `errno`: {}"=
,=0A=
                errno=0A=
            );=0A=
        }=0A=
=0A=
        result=0A=
    }=0A=
=0A=
    /// Creates an [`Error`] from a kernel error code.=0A=
    ///=0A=
    /// It is a bug to pass an out-of-range `errno`. `EINVAL` would=0A=
    /// be returned in such a case.=0A=
    const fn from_errno_const(errno: core::ffi::c_int) -> Error {=0A=
        if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {=0A=
            return unsafe { Error::from_errno_unchecked(bindings::EINVAL as=
 i32) };=0A=
        }=0A=
        =0A=
        // INVARIANT: The check above ensures the type invariant=0A=
        // will hold.=0A=
        // SAFETY: `errno` must be within error code range (i.e. `>=3D -MAX=
_ERRNO && < 0`).=0A=
        unsafe { Error::from_errno_unchecked(errno) }=0A=
    }=0A=
}`=0A=
=0A=
Thanks!=0A=
=0A=
Filipe=
