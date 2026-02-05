Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022106.outbound.protection.outlook.com [52.101.96.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFA283FFB;
	Thu,  5 Feb 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299072; cv=fail; b=Ks5uS0ZXvDJxiinRiyccgugG1LIjDJ5bvbso2aDv8a1ySr4xgMiyQuJWb3tt2EhaTN45CHNwAE66B7+j+QyB+9vEbBjcZDbiuOpf0rpUVQVf8m8eVG53SKC7TSXCvuTG0mhB0hskPE/inUACSjDT4g9zlBEkIe82DTWabivyBok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299072; c=relaxed/simple;
	bh=sOwdvB3Epncvh/oDyYXRf+PA/7TucYc9gCZhra02FxI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XhRuHfelElq+2VM4vOlgh6ZOL+2joQtxKheWTIxFQauNwU/SkICbu6QRCtLl87Ng196QxFidXwmRVKl76Q/+b9Ygno8JqJXQ2ii0zP6r3hw8qU2glJ1rgEtWDgXsAXurKMPMUzrw8AvCgDs8ao+1CHeXVRdqSMHRy0KSZ7K8xV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uVvqzrU9; arc=fail smtp.client-ip=52.101.96.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uVvqzrU9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA4oc78VaDJMl9MzTkPLH1vP94g59gVNTH0kJikyjfV43m1A1PHqE+5q+1Ywj2C8XAAHucZP03Fs7owVFl3BCw11bNA5Y1yt9gjjyG8b+TG6u8wV0ApA9lbDM30DwExsLQT/dK9VFv4lNwzajnp4s8Fd/sT7LaNHh55fHcz2aCupW9bH9dnpF7kDH3a+6qVZecA/82sUbastTMK8HKB1IsEDEcx1jCF9KuQ/ufw1IaBpgCm9ipXA2AOCiSIiLLRycByQI/aktE+IIhhdtLrpMicWGNaMojuytDQXR0IvhSKnlqhwjL3lmuXoZBvaNGMKggxp47/0Hb8NKzO+gkgu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvqSTqOtwmZHhQr+EO/y7pZcOX2HwfOf+Xp0/0sXi7k=;
 b=OjlTUmJuaHflHjWdAoK9L1tEL4ipsV2ZDZ/fsE35XvXEADiNI9aAdezQRG+g0NURR9Z93WRip/p2ir3o1R6+vwmH9xastA4/EU1PnLzKgPbGbTIvKqCGYJELZd1eP1xa3oiKMFWb/3IVXkfykMPVhMHIGHPj4QW0CBo0oiAVdHrOF/BpLnAsOKcBtaojXn41oCTFpYsuu6znk5lvpB6t0vg6KiPc2SejlaScQh6hgEWkVKBAfCY60ChM0tv8MruZvHzyQQ61tx6FvMB51ql1qQ6zdveu1cbfChFLpwd6IN1Di7Yq4QG9pkH1+Qa2vzwL5teVKfMzDNYE+wpEMxyOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvqSTqOtwmZHhQr+EO/y7pZcOX2HwfOf+Xp0/0sXi7k=;
 b=uVvqzrU9booGAtxoUrz1imTbNI64BA4QNEHC4kx1wHVP1r2q0mSrM0JRQIaWnbHpqpqW9Wq1SEl3CIcCvPIvr8cWoxcI5LDkay0yl69usWeMucTxdH4xSIFR+hIzNPdJxb1Qlmz6FMj5o9nDXwdcxKRB6bUsV0SW/PXpkrU99M8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6517.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 13:44:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 13:44:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 13:44:27 +0000
Message-Id: <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>
Cc: "Matthew Wilcox" <willy@infradead.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix aux device registration for
 multi-GPU systems
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260205041120.127106-1-jhubbard@nvidia.com>
In-Reply-To: <20260205041120.127106-1-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cb40c0-6eec-4ad2-6c66-08de64bcaeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cyt3Y3lPYkJnWGQ2SHJlbVVZSk9PbXBsY1cxWjlobTFqbERQOXZYRVZmTGFz?=
 =?utf-8?B?S2p5VDg4Rlo3OXpZNlNCV1pHTkZYZUpjRGZ0Smk3enVuME53a256SjV5OThr?=
 =?utf-8?B?dTdBWGcreHhKeGlzZm9WN1N5TDJVbDhpVnhCQjA0OUNEOGM1QzVFYXd1VHJV?=
 =?utf-8?B?RXpGL2UxWDhMVUkrYktuMmxKd2RzemRXZjlyMEFPQWJvNnFTOEk3RXRob1Na?=
 =?utf-8?B?VU43c0tCa1FUVWtIc0lwUktLZFFCbHpxWTBwTDZTWWJFaDF5VjlYZnRoZ09q?=
 =?utf-8?B?N1Y2azhnaERTaEVkWEhvR0J1VFh3Ly90eWQyMWJTUjZJWmhaTmJ1b3dnUCtI?=
 =?utf-8?B?bjN5VG4xYUNIeDF6UXpZZHcyaEpJVytha0ZIdzRvZUwrQytDc20wZDdFTkRx?=
 =?utf-8?B?V2ZIY0s5T0FyTG9QT3NmcUJvT2JSZG1pdEtCZVQydkZlR2ozblBmaVIreEVE?=
 =?utf-8?B?cjZGems1Q2l1bTdZWXdqMDNyaXdkbzdHaWcrSE5FeWIrdkVCbWVoSkV2cTFn?=
 =?utf-8?B?dWgydVlnRTRHamJ2TDltc29jUEpOSjU0NURqSGZObEZNVkdHSjRDbzBIT09t?=
 =?utf-8?B?SjFWZE9DNkg2bVpPY0ExejIrb1hOUFFMdUd2ZmZKUUovTGp4R2JKQXRJejVW?=
 =?utf-8?B?MjBmdFZTMzVYSDRwQU40bDJGeGF5UXlnSEF6QVJpbU5MdmtrVXV1SUFCWTV3?=
 =?utf-8?B?RlBjcm8xUjJaeEhsNWY0TzBCZWhYMllhT0NZZWdBL0I1Uys3Rk9iNlJIUEov?=
 =?utf-8?B?VGxFYXkwek03Z1IxVVZtOEZmT05TUExhcHhnY0lDdG9kckljcGZDR283dGdW?=
 =?utf-8?B?T1BlYnlhUmcvc1NQeWk1c2N3V3lOYTZZLzYxN2lOdE5UN3dMTmErZkxWZE1C?=
 =?utf-8?B?dTZWZDhZTEZPSTJTUG82QXhNK3djNFdyei9XbjJRZkVWTTdTd25MbVBzZFRh?=
 =?utf-8?B?UzZEbVlra3Izc2tPdEV3bkVST3lld1liYzB6QWpDTll5NXh2YkpSMmZSY3NK?=
 =?utf-8?B?OGM3WUI4ZWpENndPQ3FRTnd0NElXWGtEbXpsZ2FqTUhiNlpPY3JyS3pBVE0y?=
 =?utf-8?B?Mk91ZW8yalpHYjRoOCtVTVJIL1U1KzE0WDVqT3I2dDJmeFZ3UE00RTUwSXFu?=
 =?utf-8?B?cmdKbmZORUp4Rm9uVnpaaGtib2xSbHowZi80ZmI4eHhOV1JzZ2FKcjkyY2pN?=
 =?utf-8?B?MGdFL2Z3aWswL3l1MldPVzFDL0l0czRMaUUycmloOU5CSkF2RWtLemZNSFpF?=
 =?utf-8?B?WmNKeE1nWkJ1K3NFQkYxZG41aWhxcTlUQUtYVW9YNzltU3c3OVRjS1lxVEsx?=
 =?utf-8?B?Z1hXUjl0RkMzdFVsMVBHeXA0c0wwSE5Delp6bFZpZ0ovUGxlR1gyNFBYVko2?=
 =?utf-8?B?Q1RsM2JESkhJQk5JQ1dPY1h1am13VUh4RW1NQ0NuN09FM2xGR1A2Z0tBTk5X?=
 =?utf-8?B?MkVTd25Bb3JROGtZNjBTSUE1TUZ0ZFhtamNqMlo2T1V0ZCt6Tkx6MHJpNnpZ?=
 =?utf-8?B?NjNzN3FtaHBtMGZVRTQ4eGNqVHhQdjNTN3NqajdoNDI5SjQyOTRYWG1kS1lV?=
 =?utf-8?B?VUVnam5ybURBd3VZTExqUHNsOTBtWjdBdlZDc0N4eStJNXVicy9RdFpwNW4z?=
 =?utf-8?B?Qjh0UitCeUZrdjJZMGpqbkxROG1ESzJrNU8ra01lcSs1NFg4czRyUWJZdkJw?=
 =?utf-8?B?aGlHbGlYRkxHZllTT1hDYlVxZ29ualA5Mi9FV1RxaGtaQjJKTXVyTW9sQ2p1?=
 =?utf-8?B?WTcyQk9icHhzczR4dXhSNlNBU2plbU1qYmRiVDBLYTJSTVRHRitWVmdEZjg5?=
 =?utf-8?B?VXdVczk4L2w2aGxKdmdTNHhYciswZlBTRUlBZjlCMFVsNEtDa0N6VUg1WGox?=
 =?utf-8?B?dkcreCtIY1duNVI4WmJDODBOM3Q2MmtFMml6M1pBVFFoNmZLTko4TzhweDVQ?=
 =?utf-8?B?d1hMSGVseDZla2pkQ3k3OGVuTXcwTlBlWXNheXRybC9ydlM2Rng2L3htRHhl?=
 =?utf-8?B?L3BHbTBpZlpUQUVmMmFoRW5xRmZ2cjJCbTlKRm1sZ2ZXbjNBYitna1o1S1FT?=
 =?utf-8?B?bW8rWWx3eW9DWUJYTklDMG9aY2dBUmhLSklpeHIrcE5wRTdtb0djVEc2K1N1?=
 =?utf-8?Q?agHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHNRYmlkUWp6Q28zM1hkNURqRk9qWmVpWFVhWHVvYWFCbE45cFVNN0hBWlR5?=
 =?utf-8?B?dERKWDhUaHNQRE4yS3VvcS9hZGNrUjR2TDJxWmZsUDB4b3VSSEdMZ1ZkZytG?=
 =?utf-8?B?cG9nTURNOGZlTkV2ZzhzSGZwQUM2ZG1JWW1YYjZlc1dzTHF5ZUdXMEhlQkxr?=
 =?utf-8?B?MnVycjBLK0ZXWnlvQWF3K2k0TU44RG5CTU5VVTF2czlRN1ZJVHhuNEk5cVVY?=
 =?utf-8?B?M1hXaXR2SjRLemxzd3Y2NGVaYnNvdzZaTDduQUwvMjJKL3FqMlhFc0hZTDlI?=
 =?utf-8?B?Ym9ndUhVcWVlMU4yZ2ZUV0IyNGtjZWFmbUY4cEF4TysrcUpGUkhJOTZZc0g2?=
 =?utf-8?B?NU1LcU45YUMwOENCckVzRUx4RnNKL2c2UThlZkp2b0RzT1FWc0RWd3R4aHRB?=
 =?utf-8?B?d2lYOVhrRWNBQ3BlUUhQZWY2KzJUaDI4YzdwN2xZNXhpRE5mNXhzRFc4S05E?=
 =?utf-8?B?N2ZaRkJETHBzY3dWTldZNkx1R28rc0tEYUNFNWxZTjJFaVIwWDBZZy9ERWRP?=
 =?utf-8?B?Wi9wTjUrcHBha2IySGtvOGd4OHZqczFQak9ZQWlvWDl5L1pwODhVMXR1UFpY?=
 =?utf-8?B?cXphY2JBb1crUElKU2FQODU3THl2bDJlZS9FYklqZVdSVHljM1puMTZrNUh0?=
 =?utf-8?B?YWV6SnhBNVNBdU1ZL1A1RmVCUDNHdWhQWDFBa2dQU2ZlNGtxVGZzWS9sMGxU?=
 =?utf-8?B?amZpQVhFN1gwN2dFTkpoOHQvaVFXL1Q4WFFhczY0emtEb3VjTDIwTUVRZjNu?=
 =?utf-8?B?cjF5dVhDZnhiWGhCWkZ4VVEwaEU5UkhuVmlCeHc1eTI3aHpBQlBLNGwrS0xR?=
 =?utf-8?B?TUIxRWtvR1hpZXZLQmNacEdXSC9VWG42SXZzK2JpQTNQdHQwRnpQaDR6YXNU?=
 =?utf-8?B?bndEYVE5MmJScVZPTEt4T2dOVVpFZEd1RlpxRjdBVmorSVR4aFY2NjdQQ21I?=
 =?utf-8?B?OW9hUG1ZWEtCbFFOVS9lTVUzQ21aVXF5b29zbHlqWlhBdFFETDI1VzFqNjdl?=
 =?utf-8?B?VE9UN3pmVGZ6MDlmeVphbVl5ZU9ORk9sMDZVV2RtdXZabWJ3TUtTRFdvaDI1?=
 =?utf-8?B?RUhYRTQ4ZnlqY1JFdjZycnlORHJLTjhoRzNkREFlZUwxcVNLSlVGOHB0Nnl5?=
 =?utf-8?B?YldOK2dKTEdlTlFBS1RaVkpvdE51T2xtblYyYVlzSUJKd1FtNXBsZUl1cWYr?=
 =?utf-8?B?RDNnbHVKeTN2ZkVhVUhKNnI4NUtFSFdXZUx5LzEzcDdiRDBaREpMVGJQbXR1?=
 =?utf-8?B?cUx1UFcwSmt5Y0pmWG5vNFFoTnEwZ3FZNlA0TWhxS0VqWUdpb21qNFA2eWZU?=
 =?utf-8?B?OVArQnVxTmExM2IyZVBjd1Y1SnBIeEFxb3dVR0NkSmp0N2MzYTJhbHcrYjhs?=
 =?utf-8?B?L2ZWWHNMWnN5R0toMFJ2YVZVRXpoMmhwZFFYeXZEWGpHQWNyRFZlYzcycUEw?=
 =?utf-8?B?ZXZRNjk0UjRzb21oZy9tV0RxZ1dHVGZhR01GRW1hdS9TY0w5dDk5aHplYVha?=
 =?utf-8?B?aFlSLy93ZnM1M1UreWErOEtCWDMzUVhJZFdxbDNxbnNHSVZTQkVXSlpPWXdu?=
 =?utf-8?B?TlNxNEtTYnpFTlJnU0JVd254R2Q4QzVuSm80em9ybWgxUi9IR2d4N0k4blM1?=
 =?utf-8?B?Wnd4UC9QL2pRYUxsam5WVHhyeno3UW5NU3lLTlkwQkNyVitHbndiTHpXNEc3?=
 =?utf-8?B?a0Q2S00rT0E5UkM5cnFmTUliU1BpK1hOZTdTWjZEVWNvMS9ZSWFkcURYNzQ1?=
 =?utf-8?B?RUxGTlJOcUVLcW9mb2k2SnhKY3UwL1ZuM1krZm1CUkloMG9YaHRFa21iNm01?=
 =?utf-8?B?cWpqQ3dkaHJNZ0xHbjlHWUMyQXlNbWxSellUQThtNWxEQmc2NlNiOVNmeHIw?=
 =?utf-8?B?QytNNXI5amJ2R2ZxSjU0RC9LTGo4TmR0QjVIUGgrYjNFdXFSSDQ3TjdZYTJp?=
 =?utf-8?B?bkU1aWRCRkZVU2tTMUlCOVByZUJ3M0lraWo4REJwZ0dLWHJMdy9BNzZ5Uzky?=
 =?utf-8?B?a3lXS21GSk5TSndqUFpaZVRXUThKbUtQYzRrVkxCcFVGeFQ4elo3WHpUNy9T?=
 =?utf-8?B?Q2hQWGpPOXJFNjJWVjlWbjRWblZMRlNSRVJGUWliQTJ1RldBTkJiZkgwak1H?=
 =?utf-8?B?dE9EcXBvSFprdzB6MzdkaTVjYUR2RjltMmVZQTI5YXpsSyt1bUxkVENTZFhC?=
 =?utf-8?B?Tk9zMlNmYm5BMWVYTjZUcDRVNHF5c0pUdTR6c3I5Rys5MW5zNUl2RlF3WTl2?=
 =?utf-8?B?MGdyTTVoUW5PMEVWS2FrdnZNSkcrTUhocWRlc2FUWGFTdUZRTUUyb1hZTENq?=
 =?utf-8?Q?0HY3PsZ0OiYpga5la0?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cb40c0-6eec-4ad2-6c66-08de64bcaeb9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:44:28.2448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0NO8dZpBhJOCkK1If4EKz8v8CAuK76kuGM6sOFI1k6fOSnmomFMIplwu6L38gpYDURGoV+xAGDQ9iwxCrXIEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6517

On Thu Feb 5, 2026 at 4:11 AM GMT, John Hubbard wrote:
> The auxiliary device registration was using a hardcoded ID of 0, which
> caused probe() to fail on multi-GPU systems with:
>
>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCo=
re.nova-drm.0'
>
> Fix this by using an atomic counter to generate unique IDs for each
> GPU's aux device registration. The TODO item to eventually use XArray
> for recycling aux device IDs is retained, but for now, this works very
> nicely.
>
> This has the side effect of making debugfs[1] work on multi-GPU systems.

Hi John,

Looks like this is something that should be achieved via IDA?

Cc: Matthew Wilcox <willy@infradead.org>

>
> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> Hi,
>
> This is based on today's (Feb 4, 2026) linux-next/master branch.
>
> thanks,
> John Hubbard
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 5a4cc047bcfc..a542ec0b40fa 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +use core::sync::atomic::{AtomicU32, Ordering};

We're stopping the use of Rust atomics. Please use LKMM atomics available f=
rom
`kernel::sync::atomic`.

Best,
Gary

> +
>  use kernel::{
>      auxiliary,
>      device::Core,
> @@ -19,6 +21,9 @@
> =20
>  use crate::gpu::Gpu;
> =20
> +/// Counter for generating unique auxiliary device IDs.
> +static AUXILIARY_ID_COUNTER: AtomicU32 =3D AtomicU32::new(0);
> +
>  #[pin_data]
>  pub(crate) struct NovaCore {
>      #[pin]
> @@ -85,12 +90,17 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdIn=
fo) -> impl PinInit<Self, E
>                  GFP_KERNEL,
>              )?;
> =20
> +            // TODO[XARR]: Use XArray for proper ID allocation/recycling=
; for now we use a simple
> +            // atomic counter which never recycles IDs. A unique ID is r=
equired for multi-GPU
> +            // systems; without it, probe() fails for all but the first =
GPU.
> +            let aux_id =3D AUXILIARY_ID_COUNTER.fetch_add(1, Ordering::R=
elaxed);
> +
>              Ok(try_pin_init!(Self {
>                  gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_re=
f())?),
>                  _reg <- auxiliary::Registration::new(
>                      pdev.as_ref(),
>                      c"nova-drm",
> -                    0, // TODO[XARR]: Once it lands, use XArray; for now=
 we don't use the ID.
> +                    aux_id,
>                      crate::MODULE_NAME
>                  ),
>              }))
>
> base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726

