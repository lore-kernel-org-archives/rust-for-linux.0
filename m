Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19010008.outbound.protection.outlook.com [52.103.11.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFBE15AAD7
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728154331; cv=fail; b=NH+B7yVgwuY4ZoXwaofPhX6pwjOfcTsfMfQ756NasevVhqsoIc8fAj5q+wZEtIu+ytRs2xeJdAA54BhiLUm+uWqDIaeBJLVfI2zTcvpXWI8nOsQ4ioSo6lgyic9vx5MTokJLFz8ISQnuAGnPLiQifAK0ULf7iKsyhbkWLUUDbVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728154331; c=relaxed/simple;
	bh=1S+1BrAtekyOj3/0HS/p+/y8HZDrPaHQUjxL4l6X6aY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cpSzY3AOGt9Y2vzN+qtZD/wC0XIw4OVk0sEDMZG9IuXkfGoDPa44JCma6J0ONIAs1fWUXkJteiYJZ2NKGgR/Yw5UlTTQ19OTNYYmQ10F5fSoMmEKo2Lf0e9Nkm+X65WAbAbrcXo7uJyo/ArYWHdpDtRer75HNljKZpu0GYJA/vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=m1J0GJL5; arc=fail smtp.client-ip=52.103.11.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="m1J0GJL5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJq9IxDnFsxjtygIb8kVNrUNpMKo5+f8+rb/Olkh3AhBFop4SN5A8SGn1GFq/sTAR2+OXJBaytJb6Q4IhBghTcebLT0nubrt6RfrsV5ws03DA2maNBWyFqPgU+7zAfifQcjolVfecQcDgEVNsnlZdCtN/91QjTEzUQeZtOEtTE/6sVJHbDn1gRJNh+XIPf13XDsUjP+gScgF5hV72wUKwAhrRmS40eqEoGmn+m/plwtE85lJu/GuPbirW8CKtigBHcVgiiM5kcWvmrFxVzf4exFCphqdI1u+ET/F2RYwOvo8tWCSrbryy0mrJV/kIp3rIBEyUUpVgzJjdacHt2tV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljhwQPzmXW4PkLduoMlLpTBn01ovNHZq2lvw+TOEJ0Y=;
 b=ji5ERngrR240++kKPL70SzsdkPk+B7g044n3jxoX2s20TXQDcxOoInCbnTBJ9wGoVFj3492vr79RiczppkmcwxKtfRPwdHx+TuOYD1RDZ+wFU/i/Jn+ZTpcmQbtjAZAVddYiXLje8o/5IO29yz9geZ7flEqjDuVEtZpTcVPtzRnF5tQzjz6PPHyTwCzKO+4DKScj43qD0kvK5HI4Z6CTrop3sXzLRJiCbirv2Ev4RiMxGh0RbVh+qkhq9sErOrPOnUhF9GsekCG4DOHNesM3Z5QkHHxSNwP019Axxj1e5IBaK2O6dEvnGM3x/0+e9WvSn+Q3Pu6aMArzzIHypmjzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljhwQPzmXW4PkLduoMlLpTBn01ovNHZq2lvw+TOEJ0Y=;
 b=m1J0GJL5n5g9jteSIY19ctYQIhqzKAD8N6MEYEafxeZqFVoPHA4H5p78o63YCGd5cZ90/+vDk7lIbckitbCU7eQ24qBDEgINzGLX9EcyKDN9qfuBz5GnpA4RVnM1jsZnyG+PtIEFnNppjXxp9DpDsXEwMGlH09M4f+WAhaFnsV3XffdAkc1UekpdSUSz+FYJohsJAOega/HjPi1NyyHF0HgG6UjT+vGzN0c9wkEzZlI6cTRA0vXJL3GzkRyKvLVExDEhMTyfg9bdZJ0eMReFoG9hpEjC56IEEP9dvpSeAzrNWSaLpMB0fIZrOqS3sETe0/KHD+1APBGt4zwevktHMw==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by PH0PR02MB8373.namprd02.prod.outlook.com (2603:10b6:510:100::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sat, 5 Oct
 2024 18:52:07 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%6]) with mapi id 15.20.8026.019; Sat, 5 Oct 2024
 18:52:07 +0000
From: Filipe Xavier <felipe_life@live.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: optimize error type to use nonzero
Thread-Topic: [PATCH v3] rust: optimize error type to use nonzero
Thread-Index:
 AQHbFahP9OWFfUsSZUuXZh7D51fhPbJ1q0AAgADImGCAABrlAIAB0s7sgAARJ4CAAA/cxA==
Date: Sat, 5 Oct 2024 18:52:05 +0000
Message-ID:
 <BL0PR02MB4914709509DC2D92D65F5BE1E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
References:
 <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com>
 <BL0PR02MB491430823078BAD42FD56D13E9722@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72=fsQ+dXEGDvxtKO7jk1dEXD_Rv98du97GNDChYPTZ8yg@mail.gmail.com>
 <BL0PR02MB4914E5DB9A7D8AAB13120D3DE9732@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72kbSsRr3bb5C5ZfgM=-+4mbOG9S-+cu2f0F7vpa95cuzg@mail.gmail.com>
In-Reply-To:
 <CANiq72kbSsRr3bb5C5ZfgM=-+4mbOG9S-+cu2f0F7vpa95cuzg@mail.gmail.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4914:EE_|PH0PR02MB8373:EE_
x-ms-office365-filtering-correlation-id: daddaf64-40aa-4b17-275b-08dce56eced8
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|7092599003|15080799006|461199028|8062599003|15030799003|19110799003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 tcXHweEUtqKvDym8XjoIKwwxj4FMXrfROohKY6+HM+EaLqM2NHZrd/sycwySprvm1dCAqmXB0eoVkqJRruZggB6AnmvqXyLp8g35ldtAJlhKlnbpI3bgkYDiuUalSrYvkdqaNTeqg8fX9UNAWZH51FO5uPGKbPG2/p404N0/eOHCxeJ03T+46ccfoLE1D1pl+rVS2OQc51abmAPCOgNp4n+us5i1QQ9zZ6r9BuPQqV1jtpzUBx94Dhl30jDMUEcpCw7Uve3K5eYon1zr+J66PNxlpD0pKfK2Fg0PHJuBIORDQII+Q4L+M7FAfyfnQ07e8hY5pwsiFjbwaOyLCyE+F9l8rq0ZLtJGoNlI9FJwBgt3PYn1zrv0qjqKhDAzJi0oWCVBeSnhLX2lVxILxRES4NF/r3oJRIC79XfcjOHRiAkK0IctAVUozeb5lORnCcgI5CdtflyDS6RUe7xqbOQmG605gs6sMfJDz9eyzlc6JknzzQPX2uj/3JWl1hgggIUIVNISJCsCC4cWGh/qmkkwa+0dBLDFk81ZExw0nP+xMdAOxFM3s3t+CA6LtQqwpv3bySRKdu16Ee3ig6Oj+k8Cx692JmkGumnwlbTJNug4Mcd8Gj1WOb11A1TyY6qO6s/UpYskd5iIco61Pmaj+LMJ44zEWinpW7x9/rPusROlqTcRaaO8Jkd0T1lryeNU/lWv218P6madTv5AQ57RinxcSA5EyIjXks5ErqozAVaguR84VbTnBFT1sqxETlYS0f8A6CQyf99zQVjxz9sQgpjXIA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3GAr5XbNS3oNoavEySWd9dDaNOxoxeb1hz0lVl05+7fPkOpL5p7PIESHwT?=
 =?iso-8859-1?Q?zDQwOqIw1MUMEK+mVAQy/KYj8uLuhNIRjhewjl4fdgJeWT+tQnctrvCHEn?=
 =?iso-8859-1?Q?34MpLYiB4wxsj8Bim8Z6rJZ7tRhObLe4eJmrHLxoiJbfIo1dclZbVq1cnj?=
 =?iso-8859-1?Q?q7wRu9NgpMH4Mk8QZ6aDwJbXyj2bG5SxA2sPiVlLe9we9MoT3/Vryjit2j?=
 =?iso-8859-1?Q?FUq/lyszhyy/a4ZrlVUlHnfTlHH9O9bhvSiCN9KJblqoj0qGZeH4LBf0Z+?=
 =?iso-8859-1?Q?KDjleOEE2d/cv5HQbzGTLJL4mBGzIsL3BvONKwz/278/a7Mjp2S92VN7hj?=
 =?iso-8859-1?Q?biPWHAlPG10Qj54uvlq0QPGv7tsCrvi3To3zCCBzy9bwq5dLkXgYpW3o0S?=
 =?iso-8859-1?Q?+hhrpGcUPRBiz0Wd3fLqsf2sqYjktUkmXgbv1j+0zVhI/ix3QjBVMWPMJ0?=
 =?iso-8859-1?Q?Rnx0dct6CMVNMjCOSUDwkR2W/ruAQKqyAAbI5NREygiikx/dKGBJXT6i++?=
 =?iso-8859-1?Q?f3RdXZkG6eZMyAxoELx1j9vYMDuhY3qp/nQxuZ8isxMcdoVp5CEin4TGDg?=
 =?iso-8859-1?Q?oY7R8A2wQLoWD2UbpJ7qWb8rmQpB6lclNjleUurCEC8yJlRfkHDDiH4i3G?=
 =?iso-8859-1?Q?b2UzctNemopDCHIOaRkDQqEVoBDlz5dV/qagkIFqo4lDAUu65EnpQcJX/I?=
 =?iso-8859-1?Q?5ko7UTiv9JRvWxfvxSXKKiQAZudDdXGRJCy39ov9bHNUjkwIPVk3rYXoFg?=
 =?iso-8859-1?Q?SmNsjxC6VLF8qRQPil82OemNIloHNM1ztQp89Qj4LztJsOsTPAPS2ZWrRd?=
 =?iso-8859-1?Q?P/yX2TwYMLvSQf6P2dtbRZL29Z+xoCvJREoah6Np2vjkwbvX/2FUR09sik?=
 =?iso-8859-1?Q?nr1mMJLPEeZn5jfhOVZONdNzEyZ2j9tNAXVf2mkDF9ilKY6176oudSQmAT?=
 =?iso-8859-1?Q?HctVhMTvGcGkCUDbu9IUDjXdAUdYF0wBV4pBplZSV9Bj6Q10ESDB7VPWUA?=
 =?iso-8859-1?Q?9NcG6yHnm4Bw6x5/D4psYDcsvZvGGXX9VXQpHJEMC0MkKtGZHqgac5U+J6?=
 =?iso-8859-1?Q?b1fmSCaAwXQZu1StQF+SXzs7M04txwWvjBFbBD+Xt9sAtXVG4ubhrNNB3u?=
 =?iso-8859-1?Q?taUVz+TJsoIGJ+C9nlnauWbHvv2+tcQJyyG62CI062RFlLH+DlppJC62WD?=
 =?iso-8859-1?Q?o3bTnakrgK9hC+oqwvxqvw0Ld8Bm0C2Yu9TFF53/fRBfrbICyCX2dpVkG6?=
 =?iso-8859-1?Q?wlx4QWmFhFrGOXZHGjRxBM7TUw4ijQ/dS/556S8K7wcbs4nBk42iJNV/Df?=
 =?iso-8859-1?Q?R6TOBrBqQMa6tEqwrkzVs+RbxU2cfBu6wrvQiVhDisEkh3s=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4914.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: daddaf64-40aa-4b17-275b-08dce56eced8
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2024 18:52:05.9060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8373

> Not necessarily -- you can return an `Option<Error>`, for instance,=0A=
> from that new constructor.=0A=
=0A=
Nice, it worked here, what do you think about it?=0A=
=0A=
---=0A=
`macro_rules! declare_err {=0A=
        ($err:tt $(,)? $($doc:expr),+) =3D> {=0A=
            $(=0A=
            #[doc =3D $doc]=0A=
            )*=0A=
            pub const $err: super::Error =3D {=0A=
                match super::Error::from_errno_const(-(crate::bindings::$er=
r as i32)) {=0A=
                    Some(err) =3D> err,=0A=
                    None =3D> panic!("Invalid errno in declare_err!"),=0A=
                }=0A=
            };=0A=
        };=0A=
    }=0A=
=0A=
impl Error { ...=0A=
=0A=
/// Creates an [`Error`] from a kernel error code.=0A=
    ///=0A=
    /// It is a bug to pass an out-of-range `errno`. `None` would=0A=
    /// be returned in such a case.=0A=
    const fn from_errno_const(errno: core::ffi::c_int) -> Option<Error> {=
=0A=
        if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {=0A=
            return None;=0A=
        }=0A=
=0A=
        // SAFETY: `errno` must be within error code range (i.e. `>=3D -MAX=
_ERRNO && < 0`).=0A=
        Some(unsafe { Error::from_errno_unchecked(errno) })=0A=
    }=0A=
`=0A=
---=0A=
=0A=
Thanks!=0A=
Filipe=
