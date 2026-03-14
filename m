Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020102.outbound.protection.outlook.com [52.101.195.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A9378D83;
	Sat, 14 Mar 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495750; cv=fail; b=mUnc/oQ6H9n0Ja0Zr/O/eMx+K0kJUKvasziXfAdFeXqi7Zkakv7B0f0PzNVraCYIX85Rvgz901WfOusRatJKjrZ710yGcwc+z0MwISVST5U33GzX8qS1F8JS72poo9qNvUSLXMMt7yviIZkkKAXj08CDNiZHWPb6dvOb86rdwc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495750; c=relaxed/simple;
	bh=bMvFLo4lXEFXOFkYNRPtukt9SQuVZY+o2FHq3ZAd3yc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MJkStqgeUNSAZ524jPZcxtTuLPAHis/dJFoVUvbWhqSSKO2IymYDReLphipl6qk5B2nJDUD5Vr0PewqpPzL1oqG5pKgLqWtoqtFuKtsXFRzJgxG+zYXuAUnlY3Ld+TBnyAEBUiY3N979PbhD6VKfDxEjgwU7eofwa4i+qaaN2y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lI8IaOTW; arc=fail smtp.client-ip=52.101.195.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lI8IaOTW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytpK8UEWin0/LLwsqY3+9GbifjKnjcQ6XawOGVXZ2aEDzD9nDZGA37G+5iosNf0jypvKMB38bkWe7+w6mEAK2Cc1m5L5J0wXOFSkSPyrm9Ph9cdi9VQIJ1rMzEjQH52dVInYZItrjby996xpniuiU1o/HHy8z4NCZOW8Aba7YoaLGWof2Aj+oSRPPc0LC3npw5fMxFcbUBtRCiBWDaI2mrhJ1FSlyEiTPOsdWW5eAMujytnVnp9MP8vB3dKoeq3mjn48vczIFTpVxlFRyvF/b/h1dhYHTbg3huE5iL+tk1N6TkvkJMgZlyPsDFknHKXpuRBSSWRD1SDllGhlaN35Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO1T1+332rFodqEYnzBA9UFKLKVNyj6Cut+0iLLAyR4=;
 b=QuDewkT/CdDrmlqrnspXw11pkm2hxATXt1lV+oYep07mzPzTTEi+HwgmMmZhsx7nwjjf8DSHmuM6XbyN8HJzgQMzJbPl8hgZdFsd8F/iiuMBrbx7i8OcfHJBnr2+b5zIn5lmrZkm0Fec5QUWVXC+hdtgkGpyAg+QJaANlUf5UrYTNQYhn/do1h2zqFXA4pL85My2Umwrx6b1AGEQYDZvXc6fB9Z0+kt12PVnT81Fu248tn+EpnYv0sucXNDICodKvkU/6RMiDmb07OsvBeMP/vp6r5ZDZDrh2D7HcaIfcC1FQ/IZQIM2qllr80ugfpexz4JWb3oHl5V5ZksLJl5WRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO1T1+332rFodqEYnzBA9UFKLKVNyj6Cut+0iLLAyR4=;
 b=lI8IaOTWh2hiFUxQ149JnsOPY6gF2FNniud52XvjzDmhkU6pHIOiLjiUiiCbM014sn4oymNWoP8sgb8KCMGPQI/bQrfC9OTvn0bbxKEHdcFD2yieVRfhkWslvJllIo76U+YlH9mPtoQ8zDJJSnIjhdwBIXyxUGAWj1kKtQmB22I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1994.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 13:42:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 13:42:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 13:42:25 +0000
Message-Id: <DH2JRTZD1LFI.2L1WZDY8HJME4@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 06/10] rust: io: use generic read/write accessors for
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
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
 <20260314-register-v9-6-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-6-86805b2f7e9d@nvidia.com>
X-ClientProxiedBy: LO6P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1994:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a93d970-b76b-42a7-783f-08de81cf873e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	hMmPTgj0cxWYmaFbqzXUGdxuSpPmcQqN/vnq2div5fuhGBSuTgt9A3asaK5g+PSk5XZSevoxBLJDsiNCP3YjSSRa1AOwkkslNdXGrUKQ98mLADi8GZSR3ndfDo1tUwS/XNaEPgPFco7f1dSDva0X2emqGo6cDwTY0OB9wGA90nWNP7L9pVbJtademZyp17p04SLfUXuX6Si/ph8pd3UUXTKYXeRaeuXEvLz8bPfQ3yl1fJ8nd4HzoXH1APmJ5AhRfErJLwdxNFtZTW6rMSV/9FT0iKOZH/3MyHxH0SGzuKd/+7U1zrY3/JogkVE7QmeZwSk0eNLR28lUv9K7xhVJ9xxqNVYeCnTYOOKHxn0l+G1PEf8jqzywPtfuUWCgNm1+zjZGTV2R1Ygm0HXmOmXZgcadCfNb2T+pohbVWDFk7Y01pyl4fRtS4A/XEDffaaXIH5hKjzJrCJl5jElETsSTqWohY+6YToKT421pHYeVQv4IPtcClzkH9LAkFgV7HAYvl9e8EB0lpeluVVsBPfUgwv0bXCZYybDpaekmzc2gGxWPR2MeEhTf/+t5xAdx6xZrvxMuunk2kMOOa7CwiU0Ehai1xb8c70rA81Zk5PYaQEx3chLXi4kDcouQx2eFmLtAG2qF8IPpdyW7QRz1TJr/VB1KvZEJ2D3DGjqxninmb0AOB3DRIMSLvaxQWU68scX18SRItWmItlpJWwAWdRIDmlc+SalMTdsnJCUhdtra95SFxe4uN8BAJd4zIhaVWFC9Ht8UG2JVKoEl13dxWaM1zA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE1ubWorbnFqMVhyaTZidnQxdkpLWktTWXFpaHdBSHJVbzFFTVE0Y2RCb2hB?=
 =?utf-8?B?bUNRN3o1bHpzZ042aUZXRjQ1a2FNVmVSdmlINUI2T1JmTzA2Mk1lV2VBYmJN?=
 =?utf-8?B?RVpKVUR0Y0J0UXZhSXdER1lPMjBWeDMzdU1EdjdzcmdlM2lQRlY0VmZnUzBr?=
 =?utf-8?B?djl2SGhsY25TRHdRc2c3RE8vek5FZGxlU054R2xyQldoa3pacVA3U1VUcGZ5?=
 =?utf-8?B?Wk9IODUwWkRTZnR5SnEvMUJHL2pmN0FCdzJTU04yNnptcStEUkd2Y0hqcE9r?=
 =?utf-8?B?S2lKVzNEVlhxRlNGMHRIdUs0SzU3Vlp4V1l3ZklPb1BYN283QVlWTjdIeEdV?=
 =?utf-8?B?QjA4SGd5aGhsSjN2L3M1K2ZvbHVabWxuQ0JGSFV0WWp3Nm1Scm9velJFU3ZN?=
 =?utf-8?B?RVhySFdOcnYzdlA4M3hhbkFwS0dnZGV0OTA3aVFteEVBZEtoazNIcWZIc2tE?=
 =?utf-8?B?bzkrQUtkUHRveTlWN0MzRmlnVGxmZm9KYUFEQnYrblpndm5vaE9QcERHTm8x?=
 =?utf-8?B?NDVuRU80NTNIOGs4NXBydmt6azEzS1NORXpYeXBnbHU4enZCSDZiTWprbG5F?=
 =?utf-8?B?aGsvTHBMU2hVdHplVzA4T1BXK29ramRiU1J2UEFDaUV2ZTFxNVRzbVNNQXBl?=
 =?utf-8?B?cGQ1OUU4NlBTdUs1ZzJWUjdSWHlyWG9qZ3UvbzJCY1I4YlVjdGF5Q21XRzFX?=
 =?utf-8?B?c280aldrcG9LMGZBWUx5WW8wanBEcUhmL29lN1htbHBITlJDL3Btc3pMVmpH?=
 =?utf-8?B?ZTB4SG4yaEF6bzc2c2Y3MmFlYjd3cHFCUHBzeGQwakFxbDRiUnB0aXQ5Mmt3?=
 =?utf-8?B?M05YZVVzcmgzclpScHdMY1BWeWMwQ1NLeExGa3RtUW1wZEh6dkx2d0xhNnQy?=
 =?utf-8?B?clE4RUYrVlMxdW9BTC9tamlnWE5ZTDl0a2lPbjB4cHZSdUFYcDRzSEcvcnNV?=
 =?utf-8?B?SGkyYWVaSGQ1WEVoVGppWk5JK3BKZ3hkWWZhaDVFdnV2SUs2a2ZyaTdaMHl2?=
 =?utf-8?B?Y21Eczh3M3pLNkRrWFQ1WFJ4T3RrMGxSS2tjUzE3SXRUMjQzNDA0L3hLSzN1?=
 =?utf-8?B?SkJnOWFVU3lQR0FjRy84Y3VZTzZZVUhEeUl4RmFOblZOWHhxeno2QmVtL2o5?=
 =?utf-8?B?cUx6V2w4bnE5aDJka3FvM3dya3JxRkIvUm95MWpzWEorRXFNa0xEWEkrVkZS?=
 =?utf-8?B?cTFYT0N1RHRPaktKd1lHWjFXWEt5c0ZqS0xKNHVRR28xZWdESmZCNXlRa0ls?=
 =?utf-8?B?aDNhNFhDaElLWHFRQ28vYXp0UlV3bG1pRDBsWCszSUV2Q09NVEJvQlJNNFJF?=
 =?utf-8?B?WTJsZEtISTBTTzFveTNPNFhJaWZtdVBmcURjM2s3Ri9MZUIvQVMxdVkzanhE?=
 =?utf-8?B?RmJWMEEvSVBoUTZYY0l4TmdzSXJMaGFvcnFDVWdQWjJ4VUZONXgyTWF3YTJK?=
 =?utf-8?B?b3VHZEZzYU5EMlc0aExaQS8xaTFqaHIxOVc3emo2bUR1WStvcmc1NUVwT0Rq?=
 =?utf-8?B?QUQ3WnN0WkF2WXkvaDJ2MmxJeGtDZWc3anFKMTBZYWp2YjNkeWtyZXBWSEFT?=
 =?utf-8?B?RFBRWnBaZ2w2TTF3eXVDeUxRb0wzQjM5MlVuNFZnVGNaQjQ2dlZjVTZtOFZt?=
 =?utf-8?B?UHUzb1pUa3VwTFJWT3oxaWxWYkJsM3p5eWROQ2paR3ZqUkE0SUNmTUFYYTVr?=
 =?utf-8?B?S3dsUG9qNEFJTm5IN2tCVzdhUXMwekdScFFhS2gwTlpFZmdBbXNVWkF2SzV4?=
 =?utf-8?B?cysvSFNwSGlieURyYjR4U0hUWlZLcmlualRmNnh5cmJHMG1ncGJ6TE1CUlht?=
 =?utf-8?B?V09XWmpUUXF3anp1TzFDRmp5V3ViQ1J4UDRRWnVlSXVVcThEL1RLUFViclgx?=
 =?utf-8?B?SUVzWG05MmE4eGtVQW9mVnlMQ0ppdnBJNkM1ZmpteVE5WXBXUExGWEM4bHZR?=
 =?utf-8?B?eTl3bEU1bHFNclRqZEdIS3EwMWZSNHA2eFVwdkhFa2lQbFFtTHBJc3NBVzIz?=
 =?utf-8?B?Y1BTeXJhcmtUcEc2NE9lZ1htejlpTVI5TmkvQ2dpejNjK3RpSU04cC9iRUF5?=
 =?utf-8?B?Sjd1WWQ2a1p3bWZpNEQreGU0L2c5V3R3SVp2VGpwY3RwVkFOa3QrT256WGNv?=
 =?utf-8?B?VUt4VHc1ZFRQUmEvVDJsRGZ1T1JPaS96aWh5YWFrblZwQm1BeWFsWkVmN2Vw?=
 =?utf-8?B?TllNbDJqckRuMnh3VE9hc0R3L3JJUEU5SG1MTlB4aGtWTmdVcjd6andKd1ll?=
 =?utf-8?B?Y0s2L0xyVHlXUktJYUV6UE1LMEJWeEU2TWY3c1RScGRVV3lPSmlXdzNqN2VB?=
 =?utf-8?B?OGVBcVp1Rm9aY2NnUHd4d0hkNU5pNWNIbzFGU1NvZlU3aHRLNmw3UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a93d970-b76b-42a7-783f-08de81cf873e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 13:42:26.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGXmOdrYbZsjtbRBC+K72wKHLok7ZRuEB66aJ2wMEz4GnJyZmkLI3BUZZe83MZ/JjHycsPvYKOBia4uOVwCz9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1994

On Sat Mar 14, 2026 at 1:06 AM GMT, Alexandre Courbot wrote:
> By providing the required `IoLoc` implementations on `usize`, we can
> leverage the generic accessors and reduce the number of unsafe blocks in
> the module.
>=20
> This also allows us to directly call the generic `read/write/update`
> methods with primitive types, so add examples illustrating this.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/io.rs | 218 +++++++++++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 150 insertions(+), 68 deletions(-)

