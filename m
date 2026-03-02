Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020091.outbound.protection.outlook.com [52.101.196.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF6C430B96;
	Mon,  2 Mar 2026 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772458758; cv=fail; b=SQ2UAMOt97gUpB3YTTdypp0LEJPxfQVkii6ZgpC+52wLxLGK2Oy/o3qoFnHQCUCYs+MAUnY3XT6kgxQZOKwJw+/2G1Rp0PATetmlRF8mKSQFHL2xeNpuKALK5YireSHoHNSWjab/G5XCDDORywS1BCuXsuGBU6CHbGW6vEdvbBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772458758; c=relaxed/simple;
	bh=yLpCM2GnTrQ41gZJt5EJYpgw1fsOc52zJIsujPu3MkU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=fggFpY7A+TBdeeTHXOmaC/t/LWU3ir+Y1YnjEFBPgNd3gpYov9BpvQjP3SI4SfNJ5Jwh3I6FGNSMKnEloSCC6aY/jt4XGRc6vToX4r9NmS6jQJcExy6BovBWENaQtONaG63k2g5TQQo+qa75ArFpEibkysK9Lzla1ZdfLwoeQXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Kc2HYk4W; arc=fail smtp.client-ip=52.101.196.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Kc2HYk4W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8v7Yu1+sTPNhFZtyhX1D0R60un77Gf8f/nJPO2QDsQlfz2KeqDW4oU1ECsWxuNUtO2kTJ9s24kUdWOVUSq8G1Nq+32ao27AIcVfZa6FHTBqGBKHrDIpnkVb92YZDk7VVvtgEjBUnTWOhUjvfbt33dQUtl5aV9y9IUegzrkuK3njtpsJHdFiX98AkkqI2vQAz2p7KcrQBXIxDBjuZl7xfudLY7eXoRnOs3jvcoSGPPtH5UJQXXlBXyUNPZbLVWaCCn1M67JsAHeK51ORvOYjRm+neH428AdYUdSRLaMbDw7yYs2n5T3cyV5eWIiH5LPcCBWZT6Yy+0KjbBC/7e4pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INL86wCfloTBh0ZRtNDuyk31mKMfW+LmC8u3fjGeYSQ=;
 b=XWohBunIIK/jPIsN4+JhxuHmBC1F7HAMMsV6RRZhMTOsamsBkatLdWS0hY/nINkQSzNm3tTA+cUadP9DppzJgGM8OnpI8wpRUnC4IXeki33aWgCwG2whSNaOhESAzyqK37pIbVM1HqKKGQ7lvq8d2PtV04gXLZ8L9cN4R2tp5Y/tVBWp2Yx/76KpNp48Erf60k4fTqGS/3d+kWlGxe9YqPF83/KFQE8+N7ursxmo5lhXLP4WvbWEv/FfVt/2xfN1UAfBwbeVfS8nTTSmIMeQMTFMYJM9W2mQf+DLuFQQVQRwPR9pOFwmFD9epMu61ZsScwhEhdy9NCCOauxTz0vgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INL86wCfloTBh0ZRtNDuyk31mKMfW+LmC8u3fjGeYSQ=;
 b=Kc2HYk4W/AMrTnUMmTwZWrkHAlJxp567zYcyp1gRWDun1PPOQHMzP5ssaL7yfqy3FSPfKFYjDFYo1Zb7keuk7RSLSnx0w7odeSaXUB70Atq3K/9rI71O0hdSvE73dsdnnmnI+B9QjAbu0SXq6o8CP9mByecuazmvJes/S8lcafA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2743.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:89::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 13:39:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:39:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:39:12 +0000
Message-Id: <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
In-Reply-To: <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
X-ClientProxiedBy: LO4P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2743:EE_
X-MS-Office365-Filtering-Correlation-Id: c0701616-e111-4623-84af-08de786117b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	gtWAXB1Ga0BN4CL6I4wS0wvRujwn9YyZdfdDi1gO3V22FJkiUC2yYvjfkfY7YLxxOPS+YpDPweXenn4w9RqQYnalaBcPeL5wZJCyWtZf5FIcH4FnK+Ucdn6s9genhOP2leyjsJhVjrknJmwsQLIxcA8mGc3XrYajKyNCsCfFeRl3ntYbPtHqr6gD/E11rqtcQj6ShGQlfY42q8dYyU7VNrUSWs0xusFzVswt6kMSxkaUObErHMJE4GXGShVpW+lu7iFhgGT4RQSGmQ5Sz0AFKMRue/jepa0GweKgRuVbmgBDcrDCvSpbonV3fkixwBWThHZn6OoHYmzTjJCYYSSHVYPtHEIw9fSaspCKoA8vmB6UTLq1Ei4XwkmCY7K9QZ7VFK/LjMW85MykHMuqXPVKBI26XvGxkFxvbylhQln1VTcFPbZrQNEaaE4rT9IqvjHFAFkuY/o8XSVl4Ix5I12SeLFS1Vv9qBVgwZPjKlf6HY6GMfPgO7P2EKTGCkCSMq3xHzKV2kOOQEcWSQ79niAGw6sqod59d4tr2UmvCn5ENwOqrPrUaEdxHlwdAEtUeo1wc9ItgL8u3JH3BymE7ALA4uxUonbevyUwiF6bh7dkhOYO2TWS7BN/4J+oSLYCHSzjK7/poMLpOyeoxDupTRAboXzSdjhztA9rvVndEO4aVJUB6ncv5gh6hidcFNOvyL1imXaIeWpnS6FWhuhfpFFswJCF09GRe27aHmwgLA28GYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTZEaFh5eDh4WWswU2Ruclh6elFOUjJhSkEwUnoyQWMxRTUvN204RHBjK0Y0?=
 =?utf-8?B?T2pXVk5JRFQyWDd0YzRlRmdXUklENWs5cHdZNXc5WmpoVmN4aVhadEdjNjhN?=
 =?utf-8?B?M0JjeHQzQXpoN0JPd0pwRVhJd25FenNMZGFORzBlSlVKTXVTallXc25wRnkr?=
 =?utf-8?B?c3hBeTdDR2M5cEFsaStYeHFaaDk4ZmpMYlljcXFSOFQzbWF1TUQ3ekJFWHl4?=
 =?utf-8?B?d3lFZTB2aWV3T3dRL3o0WjErVFBXZ3BrOVVlY3ZneWJ0a3pDeEd0MkFFdUJ4?=
 =?utf-8?B?ay9IM2EwTzFzVklHTVdhcWlRMWRGeE1yWkllWGVLWVUvQWhkb0NyMHpHWFh3?=
 =?utf-8?B?MTlGcFhDaG44SmUvTFF0Mms1WkJGTG4ycnJHclBmZnFZTkNncFE0eXczSFNa?=
 =?utf-8?B?VnJOQmFGUENkVm5SNEJQamZZY3VLL3BweThGcGsxRWxobHpxOXEzRGpQdXJH?=
 =?utf-8?B?UFBMR0VGTlhONEx0UGhUeDVraVJSUjBKQ2xQc3BFUTFtOUFDV1lhQkpMVUIz?=
 =?utf-8?B?cWF4S2VNOWV1a1k1cDIyakhLUytoQ3I0VEJxejhaekx3SjFGYmNtUmVzUm5H?=
 =?utf-8?B?QUswRzVLZ1BqUGtXZTJoR2s4MTFQSkZvWkFLdWtoUWMrcUhTcDhoTlRjbWll?=
 =?utf-8?B?bStseC9uYVBhNzN3ekVvWWZlckVOY05heXRRb1cwb1E5VHFhSCtBWHBJMnpy?=
 =?utf-8?B?Qy9QWFhxQURwN1RoMU1yTjg4YTEwMWJqb0QrV2tKNnIxakh5YnM3bGJuVWZu?=
 =?utf-8?B?dE9kUkh2TEl5T2FvK1Q4N1Q0ZzRna1VLUGNUUTlXODZCdVMwaFo5U2d2QUxq?=
 =?utf-8?B?MGIwOEg1WjRCMWFVMzByRUxqS1dUd0VQNlU3NFRpOW1rbDMvdlJsZ3FMZHpG?=
 =?utf-8?B?TU1DWDJkUWRyZnRxaVZ3RGF4VHE0dDlLa2VnQUFTRmlwZ2xESTYvdlBncUVQ?=
 =?utf-8?B?RFNLM05aODJRT1FhcEZvbHIxRHZDQU9WcThIL3pOMmJvMmRrSDdPUXo0UTRP?=
 =?utf-8?B?VTAvL1JKblNkY3pyTFZsZG0xZ09GNVlhVHF6ZzN0WVRSRWE0TmVYQ2ptWnVU?=
 =?utf-8?B?a1poTnF1Q3UrQy9TMDlOTXFZQkJFM29PT2VtZGtleXNSd3dmQXFDMER2dWor?=
 =?utf-8?B?YVUyL0NUSEx6RXdmSGJCdTBIdURvS2JPd3ZDY0hQUVJlUVBPbENjeXFsRU43?=
 =?utf-8?B?SHZTWFY0M0wrRW9OOFhGNW5DNjVOMUMzRWhhZW5Gb0FKRHFFZFIyeHhTdFpl?=
 =?utf-8?B?ZW5SK044S3FJUjQ4Zml4MTRFbDFVeVVLOWQzYWF0Rk9USHNiSk5lZEJNMVpt?=
 =?utf-8?B?OGk5eXRzaEUvNDN3eHh2VnNzeEZIbXUrVzBQUXpqWVk4bnN4NFBiVjhvcDZ3?=
 =?utf-8?B?bmIxRUNNMXlZaWhGczRESTdidWlmcTlGMTFDMVFWUkszaGFpdEhkalNXV2VC?=
 =?utf-8?B?bzBteVZJSUdGSWRqcXAzbEppaGZMbE8zeWZqN2VWTlk3eXgxdjJSaThWeWw5?=
 =?utf-8?B?NHdIRmF4ZFFOYW9vRGl4LzhwdDZSQjZyUVp4NGhiZzQ3SmJZOVMrSVcrNlp2?=
 =?utf-8?B?QlZVaUs5ZGVndkYxR1gzVi9ZKzRwa3c1OXhtemJPMnBteGN5MWljNEFiMUox?=
 =?utf-8?B?b0RVWXRIS0srVzJOUXRMWEk3ZWZoY2RqSkE2aHNPRU5YdFFSUytKcDN3TDAz?=
 =?utf-8?B?bjhxTSsweHNscTNJRkYxcFZ2NC9JU2hFc09jK0VndXVFcDZRNjhBMmUyaGxq?=
 =?utf-8?B?K0xuN2hkMFA1KzZxU1N2eW9ta2QvVDllRTR4YktzbEVGcjNCNkROWHRjaXpl?=
 =?utf-8?B?d2MvQWIzM3ZTVDJ3RUVUWDdRV09SMWdpNGRzQnBCQk4vcVowUlVsS1lnQVFL?=
 =?utf-8?B?dHFibm9xaVI5cm5SUWhYZkEzdjNXaU1DL2EyVDhNY2JHekxxa2pNUlBaNGdh?=
 =?utf-8?B?N2dxZ1pvV1h2ZEdDSFp5OGwxdVhacWtTWS9HOXBTL3E5bW9tR21kazZyVlhS?=
 =?utf-8?B?aHRrWmRZaFZXeGV4TmNYMzJrd1lSdUZkRTZRNFR1cGJ0WjQ2UDhibUc1Ti9B?=
 =?utf-8?B?S0JBYWIzYit2d3k1VDBjaGhkdVJZWW9rdWoyOUtvZ3VPRWNmTXB5N1duWFdK?=
 =?utf-8?B?ektmVFdBSUl2eExFWUhvV2F3eTVGTGVxcXV5NmhSMHk2WktUdTFsQjM0R1B1?=
 =?utf-8?B?RGhJNUhqQWVhc1hDVGpDSDVxdXM1OTR6cExCVEdIdzVzWWJMZzExVFZ5eWV3?=
 =?utf-8?B?TC9ZMk0rRDdXbExxS2FHT1B6SDIvZmM1bFcwam45YjBMYk5GeWZmc0J3Q0Z5?=
 =?utf-8?B?bm5VRllTc3JFNkRnaEtOSjhaeFo1eXJYYngwZ3M0RjJpVU13R0c0QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c0701616-e111-4623-84af-08de786117b2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:39:13.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhb3PDvlHmRcbVTGI5Q03GB5v+NakmqlJr0T5TUIZwl+MfCStIjqDmeSc/Qh0Lln30nGCJk6j2sByQOS1PkPVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2743

On Mon Mar 2, 2026 at 1:12 PM GMT, Danilo Krummrich wrote:
> On Mon Mar 2, 2026 at 1:53 PM CET, Gary Guo wrote:
>> On Mon Mar 2, 2026 at 1:44 AM GMT, Alexandre Courbot wrote:
>>> That should be doable. Note that we currently support `zeroed` and
>>> `default` as initializers, so having the same level of coverage would
>>> require two `write` variants. I'd like to hear what Danilo thinks.
>>
>> I wonder if just providing a single version that starts with
>> `Default::default()` should be sufficient? For most users, zeroed versio=
n is the
>> default version anyway. For those where default is not zero, it perhaps =
makes
>> more sense to start with default anyway; if explicitly zeroing is needed=
 they
>> can always do an explicit `::zeroed()`.
>
> I was thinking about this for a while and also thought that we probably o=
nly
> ever need a version that starts with Default::default().
>
> What I still dislike is that the common case becomes write_with() instead=
 of
> just write(). (Just to clarify, the name write_with() is perfectly fine f=
or what
> the function does, it's more that we need it in the first place.)
>
> Also, IIUC, if the value is not created within the closure, we'd still ha=
ve the
> following redundancy, right?
>
> 	let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
> 		.try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?;
>
> 	bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>
> It's just that this case nicely converts to write_with().

You would have

    let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
        .try_with_offs(load_offsets.dst_start + pos))?;

    bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);

Note that the `default()` invocation doesn't mention relative base, as it's=
 just
plain bitfields without offset at that point. [ I like the fact that this
doesn't need to use closure, as I generally prefer code without them, perha=
ps I
am not "rusty" enough :) ]

In my view, if the code is complex enough that you have

    let reg =3D ...;
    <some code>
    bar.write(reg)

then it probably makes sense to have register name mentioned again (this is
typed checked anyway so you don't need to worry about misnaming it). Otherw=
ise,
one might read the code and be confused about what register is being writte=
n to
at all.

I think for explicit location parameter makes much more sense for relative
addressed registers and register arrays.

Best,
Gary
