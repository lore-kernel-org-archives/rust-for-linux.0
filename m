Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020139.outbound.protection.outlook.com [52.101.196.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51D20DD51
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204884; cv=fail; b=YPMCFDvyTIGJvKYkJI8aXqZrBUK3K88n6PE/vbYITUZ6KPkSN0RJBc5YqntzvU3r9kQLq1EYXCZn+4gsMmIpIUD6vmnutE01BYfArLKmFCZ6G0RMqQwVC4b64YqE2O6TbZkmomNLUpmiBZ4bvvXAx0op8vcA6DGlqRaxTr9xo4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204884; c=relaxed/simple;
	bh=hFgmwsqcbnEX5NEiVQAYaAMf1MvQd91J+I2OjhUknDg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=hij3LWE6bM1kfbEQ7Shu1MVjmdUf59h043wvgDdF7RTTD9MLHgIAPXEYLbVPzVVuMClmwKIFpzDKETPmtMN3xeOM+J2d/LYl3zEQIjRDFPYV74Os9u7Ygex0vXc9I88MGrGAXl7nE1f6hm6vHcZQpLwimboJ+blfpUuT6WkerdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vjdB+Kp2; arc=fail smtp.client-ip=52.101.196.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vjdB+Kp2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk2iyE7UqZp4UvZNEtocBXaiRBR1CxpP70YBRfDHppCOcrYgL+A4KpJyPwhlkONKC1fHdw1W3uSM3bgjbXMEqziHyL6YE+4C5c/glMnDcJy+Y/mllwOQ510P9t5iyTMgnU4r7aop4DJyQzz2lBoT2WUhQxbjYXzE18VbvrAc2P0YdewGuIDG1QN3D0KCJQ3jsTNjZfd9OKrNm+eI3cIJLwOeRcgMrRoRPH4OxEU2xUY+vkJPIl4/2delD/GwU53xtC7TkiALBvY1wRw0HXQ8BnGeN/eDiR237D5V7aWs8p/x1Py7ZimDkZRxgxYGbMou9A5Q/3dsvS4CX3Q8LPe2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgWPXw5FIihapX0hvdKZUB8q0l420yL7iO64T64uxG4=;
 b=hBxauTa8tA353LV/GrEV0QjzUeC658mMUgFSVTAlOKoYTyvE2MmWg/RxbytxcMcc8ShhVn7Z1YmZflOXWlKEbX1tFYROI77AQHG7n5hPUUuB5UDwhz8sBSJnLpSdMWH7KndLe9ShIpWWmjUEisJgFeBYlhE6KV+v/y5rsu14/4kzQJc8VdDzj/pfDoXWsdX0ixj9p696Y37W6yyVLPUk0F9ilcZZUIGYErsrtVqwQADQHzy+pzULUqrdEHiompEyYKrkVZ6RcmAUSG4QBHeCky2SYTbkZ9Mo7nG7n61HLQetKSlIyQO6AiwPTYpM1MC2yUDNta22qmGBZLBDiQS2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgWPXw5FIihapX0hvdKZUB8q0l420yL7iO64T64uxG4=;
 b=vjdB+Kp273jxmfAfQTa43NZWF3C/ofd4eiYZlDnBBuqm6V6KuaECbE4uQONlLllTUZZmglcMQ8h8EIxqxClYO25kbvRC13s3AwAsBM9LJw1LU1uvB3KV84xq5dQHHGhaA4iFmjJGES0syBIY/NQXay0tZQ8ThGX6dmH1dtIj1BI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB5699.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 19:07:59 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 19:07:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 20:07:59 +0100
Message-Id: <DJ6GFL1AJG31.N96OM05WHDBS@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/4] MAINTAINERS: add Daniel Almeida as Rust reviewer
X-Mailer: aerc 0.21.0
References: <20260611055538.61425-1-ojeda@kernel.org>
In-Reply-To: <20260611055538.61425-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::15) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB5699:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ea0cfe-68eb-4ea4-35d4-08dec7ecc0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7416014|23010399003|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GaXn98/0hLUZaB44pzVY1pdTYa1jXlO5fohekf+Gdbk8VOYk6qdO51+HSXNP1TJxyC5Fe2pAFGnFk8cLM9/yLMIO/0YP5U0jwTkLwShvqclAXiDM15y3/Sh5+1zDlt3ScNtVoek2+tvLRcwxtc29tuK7a3VCoLweDRC72qklxrCHeXjlGWT5Rb2bIAW30N/GHSaydrrrGWhdwZO2clstU3PgVYXds0UG84cP3oRz4HyfsxYDvknAxaSjhyrEREZpgODtBBANtxt5tF2oEf6q2fW6rTTAM1HhOzupwoRldfGOeui7M/BUWPuvICjXS7aZ48krnsmKoranvvGRtw6cm4omrie/xaj1pZmvD8Bu2eaO/UKCm7LmvSy7GQ7pRWQt0jA0bxCrTvHO+EWNiB0v5OFX6fqvwvfCrI03XW2K8pax6Ey7mpOqP7VQZT/3FjuBRKaQAI2+z1DqFabo8y+GPq7XFEgUQKL6A7jhSd61ICMjAJHrJiNqkCBNV8ezueZ5xVsveYSTLTEHIi3dKxjmWAJTyYE24WoNzBj17oO07aLDnvvDuMqazdjaNi0Iven8W5Kd+HPx99/LGMK6ujxXIVi9YL90PeVYcKnDl2+XI2BUpmjV32gATZYWzB0iAIFNc0jBXCh9RdNvqklfQLvf1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHVaRWhqWS90NU9Oa0tyZlV2THFFUm5mUWJSa3BTQlFLbkNYM3RZTXkvZFh1?=
 =?utf-8?B?T1BkQ3J0Y1hwZ3JMVmpPR0ZldFh2MVlUcjV1U016VW1UY0FpMmpaZVE4MXgx?=
 =?utf-8?B?dGY3VzNHdEdDVXIyMGIyU01GZWs3MDIzY2RqTEtaWFBZenFKYlVDcnlWOWUv?=
 =?utf-8?B?ZENWc3pDOEk0NWxlaGhOT3R1RDYvaURIZC9VQkppMmJIR01lcUFQTHN4d05G?=
 =?utf-8?B?Q1FDc0ZkR2JqNXRzdzF4cklST3JzT29HZmdTZHliNUJ1ZDhrOGIwN1RrKzRM?=
 =?utf-8?B?N1R6a2hmdVhyWDlRTkh5dmFpaVFjSmowY25mRzlQdyszNFVvRkd4cVFpSFI2?=
 =?utf-8?B?RFBuOEc3OGhGL2lkTDRVWmpFY3U2SFJQNU1uN1RINDV6WFkyZUlHaVNFYWE3?=
 =?utf-8?B?djduL1g2dmoyMUNqVlZtcXVvNEFsZTB2Z0dtdlBMYjZaRksvTHhoTWd4SGha?=
 =?utf-8?B?a3NTZWZzSkRIMUp0UDNoS01GcHVFMnE3TVVnanZ6ZzhDYzUzcWpYV24zSktr?=
 =?utf-8?B?VkhUVzNndWdORXNLWndzU3BzcE8yT29DQTk0a2pEa2dCWEhzTmJSamVZV1VG?=
 =?utf-8?B?WFNFamJTWndpN3l3UVhNcXFhd2R3Sy85MTRlSUxOb1ZlT2h1YUhlWUNkeGwy?=
 =?utf-8?B?eGN6RDJTMWF1NUdFdFdXdUoxVlZYVnI1WjdCbGN2REJ4ZHNJYWNuV095U2hu?=
 =?utf-8?B?cmZYODNHenRYMDNNZ3FtQUQyME9MRk4ySzU2VXFOUFdjL2N5VkhlTlk4MXJD?=
 =?utf-8?B?QTFoODkxbGZuQnBXREhnNXBVeGpRanZLQU8wQ3pEeXU3Tno0a2RtREdOWllk?=
 =?utf-8?B?ZG43aWZuSGlMNjBwQWRzdlU4dUZXVGpaYXBvaFVpVnRnL1pVNk1PNXMwZk9T?=
 =?utf-8?B?a2dmV0JzZHJMRlcrNGpMdkFra2dBd0I1UHFnUHVPOUpQa1NvNTlBMUp4c3ZF?=
 =?utf-8?B?SG5mdGVNTWlEN25seFozNU9CbFcvaklVQW9XTDV3QmRtV1BiRW12ZFZhWjVn?=
 =?utf-8?B?d3N1akVUNWtudmxmWHVodGVYRzBPd3JzbzBvRUMwVmNqc0RWZkt2ODEyQmhL?=
 =?utf-8?B?ODExMW1hWHpPazVrYU14bklEN0VJWmd6aDFJVUxLckI0QUR2WlUzRmdYRmVB?=
 =?utf-8?B?RzZ6a2I0ZTBpQ256N2txeHVJbTJlWGlML29oOS9iVWkrTHcxbUpoRGU2Z2tN?=
 =?utf-8?B?SXgydGVXVUNaOC8zRnd0c29yaUNIaC9CWEg1ZVNjRmxNRkZKbGtFSHNtUWNi?=
 =?utf-8?B?ZHkyeUZTeHh5dlBoVEJNV2hxMFNxNEtwcHNPbTdsbW9LZEplTUN2RkM0UE9m?=
 =?utf-8?B?VkxIaGpIblNJaVNVU0lPaHZ4TXNkSTZZQmgyS2lSVnZPYk1Xb1FxeGFNeHhq?=
 =?utf-8?B?VTg5RFp3b25uNlR4RmtuNWJaU0JuOWRVaWlOcG1ITmNBRlByNEs5RjU4RmE1?=
 =?utf-8?B?a0NPRDNnOWxGelhEY3l5UzhKRG5wRlZ1TFp6SzhVZXFWZUliNEp3MXdXbUdx?=
 =?utf-8?B?WTErUDlKWFFwMjFjY0lDUHRzWWRpaTcyQ0pGTFllTkRZVTlEMDRPbHFtdTVM?=
 =?utf-8?B?UTZrRzhYWW94VmI4NXRrY01ybk5rc3pSTytwYjZvY2hva2F1dFZSQSs3Z2Zx?=
 =?utf-8?B?RVNDZkt4bEVudEhTMmxqdUI2Nkg5NTZyd3dUM3NVZFYwVEQvU3ZvMEFCRkMw?=
 =?utf-8?B?OE9ERDJlbTJBbld2NndWekc3TFdvQThzb2JwNHFMWXp3eTBOeXQwSm81SlBr?=
 =?utf-8?B?Vzl1RDNBdFZuSjZ1YW92d0pDaTRyOHgvZlFDbk96TzI1TUJicnR1LysySE9r?=
 =?utf-8?B?Y25NVFVDYm5GSTJwN1F5djlHY2NvOWxtdHZId282QS8xdTBKT1BtaVFYalkw?=
 =?utf-8?B?V2VibmlGL0J4QmMwV1FTN2FFc1UvN0FTTUdSSkhjUFJNb0dGU21pNHh3ZDN4?=
 =?utf-8?B?dHlaVmIwSzFRVDUzeG9iRDllaEhSQmN5WXB1LzdldGM1U1U2NWlqTFRNVlZD?=
 =?utf-8?B?VjQ3cFNnbmFsakxXWTNiTGMzc2RZblVGVGx6VzczbXllY05TSzJaenp2WFBI?=
 =?utf-8?B?Y1ZWYlFJT2xGbXZGRW1PU0E5My9EdDZJR2VDcWdrekwxWnluN05QQXdNWVVD?=
 =?utf-8?B?ZGFiWjFqZWl2bnQ3YTNDMzM5WHZ6OENzR0pMWGZRb0NYaGVhZ003eDhmY0hJ?=
 =?utf-8?B?ODhueUpheFBwY2t0ZG02VHlEdVd6UENCRDQ0bGw2K0xJUDZyU3Voc2o1YkJk?=
 =?utf-8?B?K3ZmRW8zbTh3bm9sV3BYMUF3OUxDM0w1TGRySDBhWUtrdzRzRjFCcVZDRTVy?=
 =?utf-8?B?a3YwbTRaNTFLRytKREdVeS9EWUF0OG1YSW1ZMmI0T2xsTHpkTU5tQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ea0cfe-68eb-4ea4-35d4-08dec7ecc0ea
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:07:59.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbzxaLGPd9lOhMv0lh+KOSxRrY2Dfpqf6EjI5Go6EhitPld4PWAqi8N0yeCV65Nbtb7vB8ZaugBJ2hru7wiw5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5699

On Thu Jun 11, 2026 at 6:55 AM BST, Miguel Ojeda wrote:
> Daniel has been involved with the Rust for Linux project for more than
> three years now. He is the lead of the Tyr driver for Arm Mali GPUs
> [1] and submitted many of the core abstractions that drivers need: the
> `irq` module, system resources, `IoMem`, the regulator API, the `bits`
> module, the basic USB abstractions... He is also working on the initial
> Rust V4L2 support [2].
>=20
> He is already a maintainer and reviewer of several Rust-related entries,
> and he has been very active reviewing Rust code in the mailing list.
>=20
> His experience building Rust drivers and the APIs they require will be
> very useful to have around in the future. Thus add him to the `RUST`
> entry as reviewer.
>=20
> Link: https://rust-for-linux.com/tyr-gpu-driver [1]
> Link: https://lore.kernel.org/rust-for-linux/20250818-v4l2-v1-0-6887e772a=
ac2@collabora.com/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

For the series:

Acked-by: Gary Guo <gary@garyguo.net>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

