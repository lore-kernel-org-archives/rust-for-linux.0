Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020092.outbound.protection.outlook.com [52.101.195.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BA936E46F;
	Mon,  4 May 2026 22:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934264; cv=fail; b=ZyjWOMzYE/VIH4+uwkvHd9CE33Kz9af8qzTZO4QZgO3E3WduXGtozkASTWuklSaAupYD3xfil+iGCDJ/yZsSEmMMWmSUso2aiHCMDwqWPoP0sC6u13Yke7km1YHdwVY1gtevc7bVUts8b/vck1xzrwaOM68f3p5iUNrW7fk3zrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934264; c=relaxed/simple;
	bh=XAfIJ0Pg/CnJa1x1UIRmVQF5iy/1dPUcc+Pm7VRrswg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qcorRnqHcaHrnv6eh+xS/7KRd4o/bYxwqEi0NWxQbNY3XxNPU/6Rl7MNi6Hh8XW6eJeUbUmSE15Jlm6ByyIrWFlJ87u8HydsIq5eZWPCjFlErjtX5aqHbB+x8tpmByRH0yOrXGpvvmb07hIff/5EDSK069mcydJ2+RNuPRknCog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=picZ6dtG; arc=fail smtp.client-ip=52.101.195.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="picZ6dtG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TI7XsXAEju/9aXdmAJkGeaWKcqzKNu85n9A92yyDoAT/gaq3rnjWMQVIZwkVmeB7VeCWutXAjucM/UQ8RvAQm1rwsbF0b7tOeQXnlNLFFmN40Jx8Uedi1gpz/noOIarZ20qpLsItRzB0n+3/yfjWzUhRUd6pMxz5KRNb4us1StnW3VmZuPeRVhr/lr5s1eELmyBb2rdLTMD4Nmof89wTYf8ep7eNNVGqjFpKEyEXeoY5no29NTp/ictZ+lt4ot/+AevzCDZji5iGyS29Sm+eeREZAlq3k4HcpUbVm4Lt+BOowXSOJool7N4QnSUMo74acaUhKnfm+WjzHDsIqn2Gkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV6c8yFlbEBN5s/ca0vFhqzoYOGRg1Fk8FMtu5bxumo=;
 b=ANMDDSrTjjUc1sVM5Ft5dN+Myvvkh72FzpMwLgQd6AG/Du5LMlq/fjuwjNUcdYAqI3lXuzVCXBUmDwAsn61QLgb9XctJt9Ko+ItY7PFp5ZXeIqvF82gN1y1rNIiD06YOJ+L2nd9s0eE8rM6x70OGZedDXsnm5cmxq/LwQcC1PcfFu9xtYHh5ybu1fVVubIDPzMjmSqtD3NRN1FNtS3tt+vlprlUHeJsa1fPck7j7Acq6xmwTA9sGRzJj2YD02YwW6FMS9Ls4ZAojyF6wnGeOldon69enmf65axrKD0B6a9eBgZxw8htAEHSgjk9JNyQa/XUR2XvWYw7Srs7k3QLFRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV6c8yFlbEBN5s/ca0vFhqzoYOGRg1Fk8FMtu5bxumo=;
 b=picZ6dtGnnVl+hqZrPOT2n0SHxZOWEaCJYvxrMfNOo+lLrinEHo68TpEuYxxz0hSU53xAl4SW9+SfrH3Tn4yIRXDj2wpvEUnNGFFnkGsyVZfpTHrAcBDygaLQh5312IhDadw/rwfdYXxXe8zNjebEWoMHV/0p+V4TJ5udRvlAKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB5966.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 22:37:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 22:37:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 23:37:38 +0100
Message-Id: <DIA93EI029QR.A0R5KOVDZQGC@garyguo.net>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Linux Doc Mailing List"
 <linux-doc@vger.kernel.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>, "Trevor
 Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
From: "Gary Guo" <gary@garyguo.net>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org> <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com> <20260504222637.176edc7c@foz.lan>
In-Reply-To: <20260504222637.176edc7c@foz.lan>
X-ClientProxiedBy: LO4P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: b523804e-95f2-4783-c1e3-08deaa2dbeed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	73obkXrzX/KtEahIgiJwAvzKshLJs/qfLtke2JmfUoKLJSMHSjHBkFlSulT9xmGo6PAtbKqSpU3/b/YwGevHxV6h06Ypk2OQf2NIlt3jLnhkikIYT8VnxwTxKYkVgqJyxwrbH5UXRyUmbLt9tWZhFlmyuog2MdJtl5XLMiLwABgR+w5ii54frsVEQOwePon17Xrv/j+pVG03O7ChNrEl4NyAaTKzz4s2IUq0cDX7B/mLO7/Ix0Q2DaYnkDIg43i2nsSGwZvAPjFFVepfxRORGP+/UIIW7eVllHWU5FwcjBrnMnx4BlLa/VczMq0vfqDNOHAh6kljMe3htdihsDW3EmttfSe6VZpb32R0JuZ0OP6rweiw4yh/4BzPKt8LYwNFUW9NBJPSpf01pwl3HbxRHppNdgVYMZlZM1nZtJSFiaevQJMbI2KcZ6oOZxg+05Wxn/Lf/Bi3mKKA00JXLwWY4G8L4r8bWk0b5wgt27XuLqQzy9qAjt2hSR7Z1RFBaChr47juKKqaN17/jeW56WpaNQHNg81ZTPnj0x+Yg4pVPOh7NkGISluLNWAlWSIw7FvVAnR0+3JDZpT9jzCC6+ak8d+tEDfX1UpyatVpCMs/RDmrcwpfLM4eox24qsQF28XFzDKv8FIt6S9AB5e0GdFNhCkxVFjz432pL+mfSI0UihrFPwSlJuMuI8bTG/aoKlbE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDhNSk01NkY5V3NEZmdlUTAvOE5DQVV2Qk1STmZ0UzQ0b0pEV1ZsbHcwSEFq?=
 =?utf-8?B?MlZ2NXhQeWZKVTV1Mmc3L2toanRaN0JDRURjM2Mzd2dBVlVnR2kvVmRENTlw?=
 =?utf-8?B?R2dwUXN2YmVRNURrNEJHWkt6TXhXZGRIQVhxSGpRbEhvbldHT1BHYkZDNEk1?=
 =?utf-8?B?OVJOV0xOanNnK3g1cXNLcWhJWVdzNFN6UHNyWFNqNW1zWXZmaTd0QTBaZ1Qx?=
 =?utf-8?B?c09pN0kxSW13UUVMUjFCb0ZnV1BqSDVaZkpRVVR5RDdGU0pKellwQm1DWWtK?=
 =?utf-8?B?TVZDNkFmeWo1a0V4VVRZRGM0MUFLTjU3UXF4YlpVRmRwZ2xBSEdOV3UvcWh4?=
 =?utf-8?B?NkhmaXBFVSsvVExCSjAvSEVoOHA2RGRXQ28wanpJZEVGa010V3VKeDA3alhO?=
 =?utf-8?B?ZGhZMGEySDE1dTN5YWlzY0QvS09LSlA4R2J1c1FUR1FQbFlsSlozaERZa0lz?=
 =?utf-8?B?YUt4L0dXSEQzWEQ3cy9ORW00SXBTMWpTbnJSV05ybkZaUkhPUjY1TU9IZnoz?=
 =?utf-8?B?aXZnNXZEN1hiclp3UWJvbE4xdmhzK0ZWVytNQ2JralJHa3Ywa2dIRlJ0ak8w?=
 =?utf-8?B?Z0RZeG96eG92eFRmeGZBVThBc2dFeEl3S2k2bGRtNzZtbzNRR2picGpJdWR4?=
 =?utf-8?B?SU5EUXdiNTVpWXlrVmJVR0JJMVg1UEZoRnJocWVyZms5QzRnNnpXQTZYcTlx?=
 =?utf-8?B?MU9XaW1ZT0U5cGFNSkZMY1EzMzF6VkhrcTFlVGlpek1mZlpFYWVHQUcxdFFi?=
 =?utf-8?B?Z2NXYjRyNXBheUg2WnhJNFVtZ3ZyRVBHQUJjeHJ2VFpDcktnV1RxaTVHb3V2?=
 =?utf-8?B?V0E3M3dDWW9YQ1huTkIxYy9UcFB4bFNLRlllSzNxK0pXb3JsVndDVkk3MnVV?=
 =?utf-8?B?S01BVzY2NjNkc2NjdzBSc2x1SERYRVlTRmxSTTZSaFUrOFNpOGI3aG5nbFZN?=
 =?utf-8?B?R3ZyZytVZkhESS9iZjlCcHRiNkwzRWdSTlBUZjZpNVg4WVBiblV3OEhoSmhy?=
 =?utf-8?B?ZlZWWis1ZmFiUDhEYThpNFVEMWpkZFBTQXcrZnlobDFxQ3VCV2N0ODNiMmtZ?=
 =?utf-8?B?TzdLcnFrcWF4SHVNaHR2WEdWZEJLSkZEQ0phNGoreGNqMEJDeGRUV09JWjd1?=
 =?utf-8?B?eFhpTFd3UmJuL0NONENJRHFybnNPMENBRWZINHQ3MjJqS1cvdVR6cXQyaGhj?=
 =?utf-8?B?b2JhZGJGOTBvS3pFcGkzMTl3VEw0RnBEa2dJeGRNYk9BUzBHS0NqVWtKU202?=
 =?utf-8?B?YVRETHV5STQ0aXNwQnVqTWkvcURaWmUvYmRWR1g1R0FhK0lTSnpuTDRFMGpX?=
 =?utf-8?B?ZEkreWtQSERFL1pTWEtYYzNtcThnbGVubzNIQXNPcStqdXc4bEx0aXJBdVFm?=
 =?utf-8?B?YUptNlBqNC96KzdsVFl6TmpNK1N4NGlXU3BTTjhqbDBFc29PZy9PRkJsSVly?=
 =?utf-8?B?OE0rU3VIQ3ZZcUtYM0o2aDNPTDhNVUtCeVRHV0xUY2hnZ3pQNng4bzd2bGZU?=
 =?utf-8?B?akVtUDhKbjU4Ui91dDB0MXJzSHNXemxzUFFBSHFSSTNlUDdaQ0J6akpsTFE0?=
 =?utf-8?B?RXZXUFFsV0ptbjM1eWgyOHVxenZaRGFnK3N4YzVrNm9GQjAyYUhyU1NDV3hr?=
 =?utf-8?B?V2tjcVpFdnJhZUcwZWdZYXB0Mlc3L1NPRllnK3g3bWZMczBqSXd6OFQwbDJD?=
 =?utf-8?B?R3Z3NDhxOXgvOWlEcHRyMm5UejJlbUh6b0E3NFdCQ0ZaM0R5Yit5amVEUVZs?=
 =?utf-8?B?NzZrNnNRbC9JVS90aEtWajFieDd0b29CeHNvS1RmcTFjcUkyZGZxNUdmN3Jo?=
 =?utf-8?B?eGlIU2hqd1dqSjdJMm1XSHEyMkxOWEpxOFFBVEcrRm1QM3Q1eXVUNE5RZDU2?=
 =?utf-8?B?RHJPcWsyTDZURWZCcmVqWHhNaWNqWVdCWGUrMEV6ZC83Z3pGQjJPR25iUy9N?=
 =?utf-8?B?Ym52MEtCV0lBVklPQ2Rqbk9mRWkrbjFvUSszUllodjlkS0lra2ZGZlJUcVpq?=
 =?utf-8?B?LzhsVDdoYVlrRG9ZSFNwemlFOVk3UWZOMUVuY0Nmemh2bndGOFNRS2ZpTENQ?=
 =?utf-8?B?UnF3L3FLcmxZWWp6ZjE2MWFPelh4Nk9SYXd5YXkrNXNkNldLeHhhTDRaUXpW?=
 =?utf-8?B?N0N3OVhxZEVMVzVXMjFvakZ0Unp2dlpXblN3dlBXcnpyRndiQVVWQXRQUDFy?=
 =?utf-8?B?R1pSMUxHM3ZkK2MyMlAvdXRFMklpNy9XazU1L242ZE1TOG1HOHlBSlNZSnAr?=
 =?utf-8?B?MUFJR01Bdll3eHJrRFZrTTJ2WVNOT09sV3kzQ1VMYUw0eEdSTkZFUUJYMEJN?=
 =?utf-8?B?Wkw4ZGZYbjJnU01DYkZxSGVDR1BVQzF1M0VXSlJxUk12WUZnM3JJdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b523804e-95f2-4783-c1e3-08deaa2dbeed
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 22:37:38.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8PLqfkBcLcWyDkuS9n7uinBJ6xqdKoyqEENsCQnR5av1szNTpUAC9suLbIHDDDOZCuMZWHSD5Y7LQT7VbttNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5966

On Mon May 4, 2026 at 9:26 PM BST, Mauro Carvalho Chehab wrote:
> On Mon, 4 May 2026 18:08:06 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Mon, May 4, 2026 at 5:51=E2=80=AFPM Mauro Carvalho Chehab
>> <mchehab+huawei@kernel.org> wrote:
>> >
>> > Currently, there is a "P" entry for Rust pin-point that is

I suppose the commit message is supposed to refer to pin-init instead of
pin-point?

>> > neither a valid ReST file nor an hyperlink. While the real =20
>>=20
>> I guess you mean pin-init above, i.e. this entry:
>>=20
>>     P: rust/pin-init/CONTRIBUTING.md
>>=20
>> It would be nice to clarify it in the commit message that it refers to
>> a file (which is allowed for `P:` entries according to the docs).
>
> It is not written there, but by file, it would actually be expected
> a file within Documentation in ReST format ;-)
>
>> And, yeah, ideally we could make it a hyperlink to the raw file.
>
> I'm afraid that this is not possible. Sphinx doesn't allow
> hyperlinks to point to files outside the documentation root
> (which is Documentation/ when SPHINXDIRS is not used).

I suppose we can just change it to a link to the render doc on GitHub.

We already mentioned in that contributing file that pin-init changes ideall=
y go
via GitHub (and then patches are synced to kernel) as this is a library and=
 we
have extensive test suite on compiler error message / test on macro expansi=
on which
cannot be integrated with kernel tooling. So changing the P entry from a in=
-tree
file to URL shouldn't really be an issue.

Best,
Gary

>
> IMO the best would be to run:
>
> 	pandoc -i rust/pin-init/CONTRIBUTING.md -t rst -o Documentation/rust/pin=
-init-profile.rst
> 	sed s,rust/pin-init/CONTRIBUTING.md,Documentation/rust/pin-init-profile.=
rst, -i MAINTAINERS
>
> This way, it will generate a proper hyperlink.
>
> Thanks,
> Mauro

