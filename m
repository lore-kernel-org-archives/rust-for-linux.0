Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022143.outbound.protection.outlook.com [52.101.101.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB0246788;
	Wed, 25 Mar 2026 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452988; cv=fail; b=QKYq5ZvOXOrwnNX726XUUbTrkmfmRvCOM0Ip961Cn30ceAmIlv+Ef9VJ/gLuTGc9YIc8UKYSMv+J76riWpeYY6E97TDMfAj9EIbTOlLeVrIndpNJhr6q+n1eywn6TQe+wk/f9BKEWNqn26iSUw40he3vrrcOIt/CWFg0SiVPnts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452988; c=relaxed/simple;
	bh=1B0yAcGTRJP1Z26PKjFzAcwD5EqmGRRjSJpvBwtu6qs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=B0uMBB1gt2qONg1b1XU967ASoU0k7w4ZriJfTgsHDIVvxOCcn6wscef9daIhsc5eZH7T6f7n3p7M4b9E2QUs61jil3Pu1HQsuP4gNPb09yn3ifC2lCOpHUAdKQzmom65/33C12jW84d/A8MszuFLDklUYEBX1NUPY6P1YDwRMTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=K5JfroPi; arc=fail smtp.client-ip=52.101.101.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="K5JfroPi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT7wvqtYuXWCpnt9eY8mt/MHi9GG1yoNYyw0DmXtxjjHzE382NedJtAlye4ZbQx2Ta4nqLb61FjGtGmACE9QL49hqIoHMY2wIgA8H3odBVtyY59YzD+yym7keiNsudwZmxIij8p11Fmmu6Rhu85RG8G9FJutqNkCdgnK5yB+6k2By0YNX1HDNgpMhgV9XtTufJBbQrW7TyfqPpgGPZYbWxL3kqO6/je3+RzEEsTTWW/C+lLDTJrDS/9uZuxK+A5eFh6oY9JoCPTQdsSoBfLvwAMSDKRJixAJ6UmNw4wxqv5HiVFuhb2iFMM9jcvvLbhBO3HtU4G3xkpIkRHmliuXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9vzN+Qn50yfT/T7bpTGzh3Z0kY7XZxGq5WZKirsayI=;
 b=yzOvDyWEqpReHZzJL7WWltThgT5Dq2vNDJ1rQOU6ESXxB8jBwWT1yLqHS/6/KwYnA/KoNnBbeL+8ZWzSpQPDj/XdEcn0ItbNeuml+mIb4Hr7Rqu5xSSgMXUoVuygy78oS4QPxB1yzhLOe7aSXflc9Vjwtuji8BDUjJC6LHp93hSbv49AjROnpEiWR0sGsudw48GS9AU+oAaUUPthTEvFueC8S+xXPj45hWybyy6n/ZmKFvD+eoWVFktfWscFlbU0HDIWdWULdRtzdaJJDEj9sPe+8rI+GdnT7Q/eW0i/4ks9lCwBs1GUnKzU9dFKO59JUKxp8ltTT5LuTFgQJ1/N1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9vzN+Qn50yfT/T7bpTGzh3Z0kY7XZxGq5WZKirsayI=;
 b=K5JfroPiesv0dChhpEZQLCP5yQemKlEQJdkGXQ72JJKOqUOZrCK1BNuXXMnHJfKyzTzv7EgW+mQs+HXfL3FMHyq4symvpA6xvjwwnczIbILyBh4tnZdEx8LbepJ4kJEL6/yvb/R+M4NxM3Vs0+bDogFMlaWwz/g875A/3rnVJGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB8328.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:465::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:36:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:36:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:36:17 +0000
Message-Id: <DHBZ30B3HVTR.1VYA64MM8C4JO@garyguo.net>
Subject: Re: [PATCH v8 01/31] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
From: "Gary Guo" <gary@garyguo.net>
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
X-Mailer: aerc 0.21.0
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-2-jhubbard@nvidia.com>
In-Reply-To: <20260325035242.368661-2-jhubbard@nvidia.com>
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6ae6e6-8142-40c0-527d-08de8a84421f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wqVw15RPHStFmXiryJrrLawsGMp6KN4uuc1+AUemvb5rEpF29zUeTJPoj4+AOehT7lS+MILcQaw+a2im2iKqsVeSe5MN8XpWsIT5FfhtXd0KchWV1QPRinquGFJyXUFGscM0EuqsPdDUj5tF6cGR6uDhWV9Bmg2+TLJsAPk18O06YugGKkB8djJUmcjF8yTaTcL5nAOc5Vrpnd1GP9czrBGeITt+2GTAcJbezJI+tM1AXQAeAnGXWeKNojooqATnyga9y/m/gLW3ckP0JeGR9uRLJvYWFTbICxUEllh81IYcodv5zG6thVpgceAf1SqcBTsd2FtpN1EZ6QgWHJYqmjEHJKhiXJMEaW7akqN8zIgZBOSpvx1QlM962hZyFBoGsQ2s8TB4EaAXyP60isaKtoFfrZPKgG8CiRpwkj2YZ81UGFuDlOXzgl7ecVZKuMzqQHFVH7EbaaJYPilIUGAODfwbcaHxY2orwyjWQrnVQUmNZo6KQAayAyXbSUh7DzrRX05xuGw+JAaj7sEpasDjyvs5VT+VxXObY/grdQWinIWapN+6FbZSKSJr+ki4Df4TgbbAJnO/rpUy0yNiplOp6SvKzOs7SRqsYovko3s9Am6m0LhHRnWFbhQvu+v3Z2MCsiD9wbv1SskWikhVnXUJyKGg6/BbNWmkS0wMiegIbPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejkzSi9oTzlnTExDdmRyZHlwT1FvQnR6MGNuMWJCN1NydHlubHdKdzFEeHFR?=
 =?utf-8?B?S2x2NWRRYlNueFhlS1puYiszZkcxVDNaWWVJRHFxMVdHeGU5amE4aUY3TUdl?=
 =?utf-8?B?NlRFZy9wODRNcVUrWE84UUhRRm9vbTdjUjkzRGpkYkprSW10Z2owZXZkeStH?=
 =?utf-8?B?QnN5Q3RLeFpIU2U5cElZUTdwVUVTUzJZcy9wNFlNbWk4MHptSE82WDFGclFF?=
 =?utf-8?B?MkVuOFZuVFdtdytUTmR6SG44c2h2VEd4TXlNNFg2SUdIb3ViRHhkUEZDZ0pr?=
 =?utf-8?B?MFFLUjFYek1rSGNBNlJMVlFTY05rbG9QajFkZ3lUTDRGZk10d0U0RG1pTGRC?=
 =?utf-8?B?RnV6dklYQWN4VDlIK2EwL3hkQlc4WC9NYXBjbFpMVWcxbFFzK3d0Wmo2ZEUv?=
 =?utf-8?B?eHJaWk9pUDRzaFlTVEhGZ3JHOFFmOXFHcTliOFR2OU9UZFB5eHN1aURucS9D?=
 =?utf-8?B?QWxiUHlYMGdrNnhreC94ell6SVNWVFpGS1d1MlhqNThITzJqMklDNFFGQmU2?=
 =?utf-8?B?NHQrMXA1RE53Ny9KOFI4ajBaZDZVN3lzV0V0NHhpczhxa0pKKzB1L1Q0cGZu?=
 =?utf-8?B?MFJibU95Z0hTMVQzOG5pdDVCR2lWSXFWdXhOVHc2cHc5OEk1VWk1MGx5cXdB?=
 =?utf-8?B?eHczNC8ycVZpRHlraGQ4L2ZxK3UwYStjRWNSSFowRkRwUjloZzlhcDdQSkQ2?=
 =?utf-8?B?bmQ4a3JoRlRreUVQK0dzb204eSsydmsxSnR6SzFFS1ZRVndWL0JqYVQ2dUx0?=
 =?utf-8?B?Sm5UTVRUNjY5cEhMakwxNFJremtyWWNiQjBkOUJpTnVpUG5GWlFTcjNIK2tS?=
 =?utf-8?B?Z3hGNkoxVE9BTWZINmVVd0JTdmxleGJicXcycDVXc3REZ2UrNkRjM2JZUVF4?=
 =?utf-8?B?cHpPTXZ2QUlKZkVqTWtLWkE2ZzVwalVhUm01cCtMU0hFWTExTzVCdWlHeC91?=
 =?utf-8?B?bFVZcUJ1eFEvQTFNeE9zR3RNak9USUo0NjllT2F3T0Z6Ky9GWWxtWUxraVJy?=
 =?utf-8?B?TUJNTFJCeHNQbUVXblZ0Z0Yxai96NTZhQ3Q4NDByOGRJMk82V0w5elZjNTVq?=
 =?utf-8?B?a1U2eDREdVVFT01ScVNJUzZ4WCtMSGtzQWtJZGtobE53aGlvZXFsaUIrWkU1?=
 =?utf-8?B?aG43U0FUK3NkNUhKWENvQ1dKaXVCRFBzQnp5T2Q3NWVwN3ZkcEpwNTljRzIz?=
 =?utf-8?B?SVVWdzA3dUhPbnMwT3VjT0lBZlB6bGZ3L2I1QW9IMURKZkxiQnArRmdYNzZH?=
 =?utf-8?B?bExSVnBzS3BzSmdNbCs5QjVKRGZYcUFGd3ZhMzdBOTQ4QVJFMmhTL211b1h2?=
 =?utf-8?B?OVdqWFNzaDNaZURxUzN4NCtMRVZUTU5Td3NCZXJLd2pWRzJTaHpXNDA0N0R0?=
 =?utf-8?B?YzJORXpHeEhueUJDQ0pqYWlJb1VHK0lPOVVZNXZvaEUwMFhRUGtod251NW1R?=
 =?utf-8?B?QnpmaG1yam1FNnROQ1pic0lLdTk3cTlaM0tUOGVOVXp6VmtlS05PSFF2Rlpv?=
 =?utf-8?B?YWxNaWJEVWRZSmJ2dFNlVzdlTXZGU1h6RklXdkx3Y1EzeWZxeFh2NGQ5MzhI?=
 =?utf-8?B?ZmRSWGZEMGdzY1hJMmNnVEIxT1pOSTRJeUdZeEYrT09rVkozRFlkNU5wVE9N?=
 =?utf-8?B?aUZWcGxFMkJDcHBBbCt6cmQxL0hUT2JYN2c1S3NidTBUTVpWV0I2bC9hTGor?=
 =?utf-8?B?c2tTUmI0bHlZSVJ3YStUbnVWdldsWU00L3dpSVN0VlhEeFlXTDNjOGFEa2Fr?=
 =?utf-8?B?d0J0MUVpYW5ETGhjVEtGQ1VFRjJXcFI1K2VneFNUaW5ibkRWakFkdk84Nzhn?=
 =?utf-8?B?MGt1NzBQTkxMNHo2NFc2N0d2eGxoOW5VYWgrVHdCSzlhN0l2Z2dkVk9jcU5G?=
 =?utf-8?B?bURNVldaaTFaUXJDTC9WT3pmaHZ0dDNXL0NNN1l0QjBqVmk0azJBbWhmUjhm?=
 =?utf-8?B?Y2t6WUxSamp2cHhmZzQrMEVqSzB4SFMyTkdIVGFKeVBFM0hzMDlUMmUwR1Nl?=
 =?utf-8?B?NDlNMkpnY2xablBNbEdOOCtDMUdIWi8reDFKUTFFWm5WR2xpQmt4OTAwT2hs?=
 =?utf-8?B?WVUvTmpoRXgwbHVLUDN1Y2s3R0NpbGNoc2JBeVVHSnpOQWxQRTlHZFhVT1Nu?=
 =?utf-8?B?WXlyam1VMDkyaGdjTElNRVhFdjg3Mk0wcnppQWRUOVh5bm5wQXN5cTAwYlUz?=
 =?utf-8?B?Tmx3c0c4bFI0STdtS1poSU9peHd2NFYwWVcyTmEvRzliZGpzdllkcXpLRCtL?=
 =?utf-8?B?YzQrOUpVWlMraGliOUkwYlJDZXN5L3RiVi9wekU3REsvYWR1UFMwZGdQTm1a?=
 =?utf-8?B?S1F4L0NjRm5sTTdqTjlSMG5vOW0vMTJ4YkU5QVRyTWFLR1NlL2ZCUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6ae6e6-8142-40c0-527d-08de8a84421f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:36:18.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3ZHn5FzY6P4b79AmWNfyrcnHENWmxkQbjW8CvCHD/diOKllIFvWhmO0bQbCJalalgziGShMRwDJ/rck24Vjqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8328

On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
> Hopper (GH100) and Blackwell identification, including ELF
> .fwsignature_* items.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
>  drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
>  drivers/gpu/nova-core/firmware/gsp.rs |  9 +++++++--
>  drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
>  4 files changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 8579d632e717..3b4ccc3d18b9 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> =
{
>      GA104 =3D 0x174,
>      GA106 =3D 0x176,
>      GA107 =3D 0x177,
> +    // Hopper
> +    GH100 =3D 0x180,
>      // Ada
>      AD102 =3D 0x192,
>      AD103 =3D 0x193,
>      AD104 =3D 0x194,
>      AD106 =3D 0x196,
>      AD107 =3D 0x197,
> +    // Blackwell
> +    GB100 =3D 0x1a0,
> +    GB102 =3D 0x1a2,
> +    GB202 =3D 0x1b2,
> +    GB203 =3D 0x1b3,
> +    GB205 =3D 0x1b5,
> +    GB206 =3D 0x1b6,
> +    GB207 =3D 0x1b7,

Sashiko asks if it'll be problematic that 0x1a and 0x1b are both Blackwell.
https://sashiko.dev/#/patchset/20260325035242.368661-1-jhubbard%40nvidia.co=
m

Can you confirm that it is indeed actually okay and is a false positive?

Best,
Gary

> [snip]
>
> @@ -139,7 +157,9 @@ pub(crate) enum Architecture {
>      #[default]
>      Turing =3D 0x16,
>      Ampere =3D 0x17,
> +    Hopper =3D 0x18,
>      Ada =3D 0x19,
> +    Blackwell =3D 0x1b,
>  }
> =20
>  impl TryFrom<u8> for Architecture {
> @@ -149,7 +169,9 @@ fn try_from(value: u8) -> Result<Self> {
>          match value {
>              0x16 =3D> Ok(Self::Turing),
>              0x17 =3D> Ok(Self::Ampere),
> +            0x18 =3D> Ok(Self::Hopper),
>              0x19 =3D> Ok(Self::Ada),
> +            0x1b =3D> Ok(Self::Blackwell),
>              _ =3D> Err(ENODEV),
>          }
>      }

