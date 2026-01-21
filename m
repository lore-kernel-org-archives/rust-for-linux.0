Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020096.outbound.protection.outlook.com [52.101.195.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB83A1E6A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014736; cv=fail; b=UWaH22o78IpsFtloC6kIH5U8HvHdAXcYjoDBpaOVZJsXkhQEzFO4pa8DSkCzwp2rnerwveiGFopoyg8lFURyZCO2DVVcqSvYuGIvTdJQ35brmOx9YHO9FZUrghr63fuMSZtn9oaiyDP5fAQKTTr1ZYvN2i+o6YlcTazyebOP9dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014736; c=relaxed/simple;
	bh=0jbPVxckgRCmXRst20x3w8GvKvUcFGWORSEo+CCfb+U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pKl5kjfr0C9zurUi7sL3n0+pOo53Zz1C7yq0/odoYUt4URErRtTuW8XFYky49FULeD5UlBYJiJkIDLoC2ZpUylPucSIowwg623Zsokhb6aNmUVn/CKT96BOWUorXCoIG1rOjoRLT1A7NeRbJX1Ehn1U5LA3LCC2HvbQGL/WUD44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gywCtrNz; arc=fail smtp.client-ip=52.101.195.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gywCtrNz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTtYElNysEqhEC/uXXlkgK2dFP7Y70esA5GxE+G7LBo4VDXMm6Gdc1M4xy/kL74dfNhRQ05njpw08x+lKIK7F9QauEajYRUabZNoNZE1D+zakGtyQFvOwSn3jl3FR0zdU8K3cKKj0yquRPyt56vrrqP0aTn4zrkOV0Lq2pdHFZFS4K6bvWkMQs4zgFa7Djk4f/Ql1vWccKYkuNUK/nGhHCUlECtTMhKZygYp/i8VS1y1tiW4sDIuutRHbOti6VZ3eC19Y8OT4+PbBh0sEyaIHmhPqmFhaDTrmBkBGhkIkd/DXqH6t5UkXoK4xduzs3qYciroD0A6u9L/lFjnD4vIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eu8zH7tyQoBOHXxgveK6/mLYXiiaWox0utuFCRFzdxE=;
 b=uHZO4eOsJrE3eYtR9OMblxBftKapArNY5PHx5OOrbXyh5pyMfPSagGS4BpgbIIepHin7z1S8y9eRbArQ5sYUpSEyb69hldwtyzSlHmU6P2KQgVv6peoik9awUq5MHsX5blUQAWO1UlBP/AH1GXvJRZbqWrxcYhYbxsNA2uFOkqhwhQOZ9tozOf4q4H1UClnyXFZaTKUV6U4gwtMfoUxBhB1OcGnLS8LPpYXBYdGIc5O+5oEU+ZqCrDS6ib3B7M+485RiPB8thl3w5P55Nx3vsn7Vz6K/NbzKlVmK9CfimCwbHstXSp06CqGJDMeUshUbn6tcOaqYikKF6uLR7C6IJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eu8zH7tyQoBOHXxgveK6/mLYXiiaWox0utuFCRFzdxE=;
 b=gywCtrNzNArUgpOh+rF50ZAvd+5LmtY2WZ+lvDi1bjGthyFcsUhgL4JOaRabpWqMb9weVDMIxa6vyYVov6I43pocMUTmaqGXV7J/8AgEnMMfushXhO5BtGABwldPl2K+19JXbohAtrSKw4aBKqS43whLqxvj1XiQ05AxtWtidNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5500.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:58:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:58:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:58:49 +0000
Message-Id: <DFUFDVJ29NCS.2AVXR0ZJMM5QA@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Tamir Duberstein" <tamird@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260121050059.2315091-1-sunke@kylinos.cn>
 <20260121050059.2315091-2-sunke@kylinos.cn>
In-Reply-To: <20260121050059.2315091-2-sunke@kylinos.cn>
X-ClientProxiedBy: LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::31) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5500:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e8e247-d5c5-48bd-91c7-08de590e599d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDhIaVVwRldLZ1dWQWNoR3FRS1l6cTN5LzE1WHFoODBHWWJSbWpDMndFMllv?=
 =?utf-8?B?ZXlBd2VPYmc3QlhHOWRGaG5HSm1LM3JxODFuVHR1bVJiK1dhNU5zK0VUbjk3?=
 =?utf-8?B?SFI2SWlXMFVSYWNLOTZTZEdnemhxek5mQy84UkhoNW1nVFhLd3VsK1p3cU8z?=
 =?utf-8?B?UU56am1KT00yVWlPczAwcXdHU2Rsa25QSDdUYktTSlN0eEkvTjNEeEJDekRr?=
 =?utf-8?B?c3ZPVnNtcUV5QVJ6eG5rbTdXcEpKMDFWRkgxTW9BdDQxSTlzbWhSc2xLRkpM?=
 =?utf-8?B?OHdwNmJIQ1VqU1BsNlBqbFBTWmh6cHN0OENMdkZBcTVLV2hidUJ4L3lkZFky?=
 =?utf-8?B?QVJPNkR0eVNMbkhlbmFQa1kxTkx3b2owRVFWVkhKR3JxeHBBUmFMUU1pdDVJ?=
 =?utf-8?B?QXJBdWhxRXVFaHpRaWU0clFha3V6eEJ3K3lZZGplbTRWMkU0TUxNMHRFQlY5?=
 =?utf-8?B?SlFFZ1RQVkd2UkhZbWs3dVp5Vm5GWmN0VVkvVHhpMjRXNmE4bWxlcWJwR0Zt?=
 =?utf-8?B?WkVUY1QrUENpRkp4aW5vZVE1Y3JwZFdYRnNvWWlEbU9nYkY1MU1BcGhTVzRU?=
 =?utf-8?B?Tmh4bFZGZDA4dDA2ci9iOUpiZHRjam9ha1Y1bXJLcHN6ZUlYQnBLNFF3YnhS?=
 =?utf-8?B?dnhZS24zeGRrQURTcHBXVElRQ2htNVVEM0ZSVnh0b1J4V3dmL2cyNDJJcnB4?=
 =?utf-8?B?L09MdHBYclVTWi9UQS9BOFJWSjNvbHZHdXZIM3BSZDBuYWZiTWwzNitiRkxt?=
 =?utf-8?B?R1JzeWpEeDRiRjhWMlJ4bTJGaFFWbVZad2R1YVQ0Qzg0Rk1oUWpjdnlhR3Av?=
 =?utf-8?B?eUFSaGxCNmcvNFFRbDdRSlJMaHZDdEtHeVdtUEJmeGNqcmhGR2NwRFNWeDBl?=
 =?utf-8?B?cFZYNTZpM1NnUXJwRWhxRDJabmRpOXp6MFhiaTlKdXhmSC94em5uaDlYcWQy?=
 =?utf-8?B?bWdQdjVvNDJTYTdmNjFMZjd3U0doMEpVUmtNd085dTUwZHBGczIrRVV3Tm03?=
 =?utf-8?B?R3JQVi9VTzVZc3ByU1hXVVJhb0xoVDhxeXlKM1hZQXZiSjRvN1FyM0RzL2M1?=
 =?utf-8?B?U0FhQW0wN0x6cElrUkdOc3RyWDI4dDZreW1BMEZTUnZaUUpTZmZGd0RQL0l6?=
 =?utf-8?B?TnhFQXhEL1ZIMFNsb1JraHArMFVrUFk1RHloQXZycXZ1Zm40V2hiejc5cGFx?=
 =?utf-8?B?UnhHeUs2N1NwSDhIZzkxbTRReENzRnh0VXlCaGhQWW54ZERpSUYxUExzdERT?=
 =?utf-8?B?S0lUMks4aDJEbGJRbGFRLzFNNHhyZ3U4T2JhMVo2cWx6ZGpleCtrTzdCOERp?=
 =?utf-8?B?a0tFRmFDSThiV3N4bzMrMFdBS0xRVWRFM1ZBNVl0NXFXNkdDNGorMnFFSHl0?=
 =?utf-8?B?VkJVZW83Rmt4OW5mWndaK2FSUWU2TGVYQnN4Vm1RbGpzWXhtTG9vY2dCUjF1?=
 =?utf-8?B?NUszaVpjc2dTOGF6YU5FcHdnbjZ0b216L3NWNTNOeGtueUkyK2RaeUgyS3Ex?=
 =?utf-8?B?Vk8yQWloMjg0NmpjS0p6RCswcDBXN1dIR2liS2VsakdMN08xU2EzOFlHNkxX?=
 =?utf-8?B?N1ZVSDE0dUUwejNJSkxiM2ZodWlOaWRMSmg3ZzdYNkVlb0tQNG1YQ0g3R2lW?=
 =?utf-8?B?VHpJWGFYT1g5R1RpL3ZDMGsvR0t0OVoxOFp2NFI5QXVLODNPdW0yMFM0MnpT?=
 =?utf-8?B?R2FEcVFLT2g5Tm1VRnBWTytpbWNya1FTeGwxT1haTW1meHdyc3ZSMTFwMmVX?=
 =?utf-8?B?ODhVdXJYV3ZWRytFY0IrWDM3Q0FDS0pRWUJZazZicEhQOG0xa2JpMWVZa1E3?=
 =?utf-8?B?dW55RmRsOGZvRDAxUFFBaktkd1RYSVM3L0xnL04rWWlNRzl6cWp0eExsakEx?=
 =?utf-8?B?T0h5amtINkxMcERrc1MzTk1rNERuU2V0Qk1WUnNaZW1jTDNKU3p2a01MNCtt?=
 =?utf-8?B?Vlk2WW8wMzVtWjY0czF1eThjRFFRdDBqNXNxZUxyeWM1OVdBdTkyNzZOQzZw?=
 =?utf-8?B?MTlLRm9BdWVYYy80dEt2RGNlZnY3SzNlc1NwYktNNURwQVpsSTJlYXI5NTRR?=
 =?utf-8?B?MjJwWW5RM083Nkw3QW9za1E2TTNQSDR2UVlMMmJ6bVkxV2ZJdmNxa2tIN21I?=
 =?utf-8?Q?eiDY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTVzNm5aeFNyUVgwVHk5VytGR255V3BVaWFCMEdYVnM5S2t4YjRWdlNjUjdt?=
 =?utf-8?B?VVQxdFBCbWlGMXVIRldpS0h6Uy9tejU2K1BGQnpreFplb0VPUTlTbURERW4y?=
 =?utf-8?B?eG5KR3k4amtxWGlyQzZ6ckdFaCs3M2VVM2tXSzNSVWZjdkpuaGpHS0thLzR3?=
 =?utf-8?B?WWs3OTVYL2hiMHhORzFrVWlLUTBPWjVtYnE4NEpHeDc0V0pxTGZMWjlFQW0x?=
 =?utf-8?B?UE4zeDRDZEdudFNRV3pQbjBDN1RzcldjVWlzZWx3b3gvVU1kd1JNNHVSR1FK?=
 =?utf-8?B?N1NDeEc4SVZoVUErQkJtNThRdUtGb051d1RlMFNDMTlDSzRBNUdyeEVLVlNp?=
 =?utf-8?B?eU9QbGRWVUNmM3RuN2JLK1o4QWVLMHVoVStTRy9vMitRV1N0NzE0SkZ1QlNJ?=
 =?utf-8?B?TkVnZTdJc3J3eFdkcFJGZ1c2cXNhZHFxY0VId1BxaHJHcm1NRVd6WlFKMDMr?=
 =?utf-8?B?S01UYUtobDluNmlPWU5CVnlQaFhjbTBtVUdGTU9tY0o2MUJJTlB6d0kxVkR6?=
 =?utf-8?B?bFFvbUw0SFlwcHVmZnhyTGpiRk9Pa2FRR1NXWkM1RUkyd3JkbWFHdXl3Z2tQ?=
 =?utf-8?B?RDlrc1NlYlVxWFI0bXVtQ0NEWUtJdWszVG51aVJkY1poNjQwcW1FNVY0TUxo?=
 =?utf-8?B?cEY2a2dIR25jOStvTyt5dzduQ0dvTUZhZHRIaW9IOXZBYkZwQ0Eya3NWN1JQ?=
 =?utf-8?B?Qjg4NGJzZDg4N2R4emxNUnZSWmVvc21UaXpINlJVU2dxcVJEY1RSTnNEZWVz?=
 =?utf-8?B?UERtdXFGVDhaWU1JSm8wMG1qRW4xSHl0OXprRGdNZGdmc0VGUkdzblU0elZt?=
 =?utf-8?B?Q2czSFA0NFlQQ25mN3VYVHlZMk12bnNrc25vamNUbk1Bb2kzNmdNc2dmaW4z?=
 =?utf-8?B?QmtUWEtYNVJmZE5ub1ozOGNXYkU4bkR4UmtiOVdyN0tiYU8yL2s0eGNVTlJy?=
 =?utf-8?B?b285WERNZGIwT2dXUHdjSDJNekt5ZzNISEptM1NtalZ2TjMrOVFDTU93bW9C?=
 =?utf-8?B?YmZWQmd4TlpNUGV3RUQ0YldHOHFhTDZjalNIb05tL2JCVlczVzI4ajlMRUtO?=
 =?utf-8?B?Z0xLY1FkbFd4czBmRG1NK3dxZGNlRmRnY2pVNS9ZQ3lFRlhqbE9pWXJmaUcw?=
 =?utf-8?B?NUJxTElLTjBSMFo2MTJEc3h1T2hDV0YzTi9vbHlMZWp2Q1J6NFB2eTlEOUp3?=
 =?utf-8?B?L3NITDYyNDNYNzFlQjdyYy9kSDBnVjZnVStLM0l3UGs1d2pXd3hrUE9lWitI?=
 =?utf-8?B?OEM3YkZsZmliSUNPaXJoblVkb2VzVUFxcWhwOVBBSy8xZWQyamppYk1DWmty?=
 =?utf-8?B?VDFlRk5yZjVsUVc0SjYzMHNGSjI5WkNGTC8vc05ic2NKNVl4L0hhN0ZOWXlx?=
 =?utf-8?B?cnM0SnlyV1NCWHVnR3drcjg3aHJtSnJWSHB0R2hINGpmdVp5WUZDY2Z6TS9V?=
 =?utf-8?B?WW1BUk9wSUR6QkxpQ1NqQVJWSXFCb0g0Tmg4NXN3OVNsdUxRRis2U0hEQmE5?=
 =?utf-8?B?YmhuMmdjQjBGRTQybWdzYW92amNjNmg5RkwrRUVKeStXRnpEZGdzREFsOWpD?=
 =?utf-8?B?RTBlN3BvSlNNYS9oZ2dpRzFvYlFmTzlIN2dOVFlCWG9tdEtHWXJ6WVpnblA3?=
 =?utf-8?B?OENKZEsxcmRHY2wvc2d6TWRMRUtwdjdBcTEzdm9NWlMwb0RzbnY0OEp5WmJE?=
 =?utf-8?B?d1JKQ3d2bGo5UjEzdjQ5aXJPVlNLZ0J6b04rZUIyK3MvK2RBK0hkZFY4RVJU?=
 =?utf-8?B?eXNnL052b2wzRWpWdStxQUlZa3BMbDdYZTQrYXRWeThMbWtKZ2g0WjVId2g3?=
 =?utf-8?B?Y2ludEdQam81YWJ2azFQVStxeVZjUDZld3FIZStFY1ZBNTB2WGVYSk9aMWVG?=
 =?utf-8?B?UWoyU2FOejQzenE5bjE4dFZqYndkemhTeVNtY3krOGJKTVlJc0w0OExQWkJJ?=
 =?utf-8?B?OUpmLzl3TFhGaHF5NzRDc0pCVnhCclZrdW53S3FQNjcxeDVLQ0cyejFWcDVU?=
 =?utf-8?B?Yi9QSUwyck1VUVl0eGp1MkJ1V0w1OERoVWRLRWM1WWJsTno4eElERDFkWS9z?=
 =?utf-8?B?Q2RDNUM2OUlJVkhUWkNGZWl3bUdTUGxKQ3dKZ3FZOXN4R0hiWHhvQ0VGRzNB?=
 =?utf-8?B?S2NwZjQvaWIvZzBKdzFiSng1VnRCeDhWOUVsWTV5UnVEVlNlUnpRY3pXanZ3?=
 =?utf-8?B?MHhXQkl0Q2pCUVVvT1pYM1FUOWJPN1ZjL041T20xb1U3Vk55VEdCSkQ5SUg3?=
 =?utf-8?B?NGNqdmcyYmFNbDVIMktqbm1XNUpQRk0rUWlCZFZ0Z2RZVjI4dTZBRzVDcXNP?=
 =?utf-8?B?TDdhaW1wUkN3Zmp2dVBhM2xoR211dEppTTI5bVdqckNzKzExVFFkUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e8e247-d5c5-48bd-91c7-08de590e599d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:58:50.1738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnY/fLj7Vv9OaMd0JyfxrXB1/yO26HgwV5U+F1GO4A0bGHeR9DuAg2DFgQRCMQjTaCmABs+NambQI8RaDWn93g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5500

On Wed Jan 21, 2026 at 5:00 AM GMT, Ke Sun wrote:
> Add Pointer trait and two pointer wrapper types for safe pointer
> formatting:
>
> - Pointer trait: A copy of core::fmt::Pointer for foreign types.
>
> - HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
>   This is now the default behavior when formatting raw pointers with
>   "{:p}", preventing kernel memory layout information leakage.
>
> - RawPtr: Formats raw address without hashing (corresponds to %px).
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 168 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 166 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..d53184d0a12bc 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -27,8 +27,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      };
>  }
> =20
> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, Up=
perHex};
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Poin=
ter, LowerExp, UpperExp);
> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Lowe=
rExp, UpperExp);
> =20
>  /// A copy of [`core::fmt::Display`] that allows us to implement it for =
foreign types.
>  ///
> @@ -90,3 +90,167 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>      {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::=
fmt::Display},
>      {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueAr=
c<T>: core::fmt::Display},
>  );
> +
> +/// A copy of [`core::fmt::Pointer`] that allows us to implement it for
> +/// foreign types.
> +///
> +/// Types should implement this trait rather than [`core::fmt::Pointer`]=
.
> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it allows for
> +/// formatting foreign types (e.g. types from core) which do not impleme=
nt
> +/// [`core::fmt::Pointer`] directly.
> +///
> +/// By default, raw pointers (`*const T` and `*mut T`) are formatted usi=
ng
> +/// [`HashedPtr`], which hashes the pointer value to prevent leaking ker=
nel
> +/// memory layout information.
> +///
> +/// [`fmt!`]: crate::prelude::fmt!
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// // Works with const pointers
> +/// let ptr_const =3D 0x12345678 as *const u8;
> +/// pr_info!("Default pointer: {:p}\n", ptr_const);
> +///
> +/// // Works with mut pointers
> +/// let ptr_mut =3D 0x12345678 as *mut u8;
> +/// pr_info!("Default pointer: {:p}\n", ptr_mut);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
> +/// assert_eq!(cstr.to_str()?.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +pub trait Pointer {
> +    /// Same as [`core::fmt::Pointer::fmt`].
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
> +}
> +
> +impl<T: ?Sized + Pointer> Pointer for &T {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        Pointer::fmt(*self, f)
> +    }
> +}
> +
> +impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(t) =3D self;
> +        Pointer::fmt(t, f)
> +    }
> +}
> +
> +macro_rules! impl_hashed_pointer {
> +    ($($ptr_ty:ty),* $(,)?) =3D> {
> +        $(
> +            impl<T> Pointer for $ptr_ty {
> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +                    Pointer::fmt(&HashedPtr(*self), f)
> +                }
> +            }
> +        )*
> +    };
> +}
> +
> +impl_hashed_pointer!(*const T, *mut T);
> +
> +/// A pointer that will be hashed when printed (corresponds to `%p`).
> +///
> +/// This is the default behavior for kernel pointers - they are hashed t=
o
> +/// prevent leaking information about the kernel memory layout.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     fmt::HashedPtr,
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr =3D HashedPtr(0x12345678 as *const u8);
> +/// pr_info!("Hashed pointer: {:p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 =3D cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct HashedPtr<T>(pub *const T);
> +
> +impl<T> Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let ptr =3D self.0;
> +        // The default width for %p is 2 * sizeof(ptr) (see lib/vsprintf=
.c:
> +        // pointer_string() and ptr_to_id()), which is 16 characters on
> +        // 64-bit systems. With the "0x" prefix and null terminator, thi=
s
> +        // is at most 19 characters. 32 bytes is sufficient for all poin=
ter
> +        // formats including hash values.
> +        let mut buf =3D [0u8; 32];
> +
> +        // SAFETY: scnprintf never writes more than size-1 characters, s=
o
> +        // len is at most buf.len() - 1.
> +        // The "%p" format produces a fixed pointer format: "0x..." (e.g=
.,
> +        // "0x00000000b231c2e6").
> +        let len =3D
> +            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"=
0x%p".as_ptr(), ptr) };

You need to use `as_char_ptr`.

error[E0308]: mismatched types
     --> rust/kernel/fmt.rs:202:71
      |
202   |             unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(=
), c"0x%p".as_ptr(), ptr) };
      |                      -------------------                           =
   ^^^^^^^^^^^^^^^^ expected `*const u8`, found `*const i8`
      |                      |
      |                      arguments to this function are incorrect
      |
      =3D note: expected raw pointer `*const u8`
                 found raw pointer `*const i8`

> +        let formatted =3D core::str::from_utf8(&buf[..len as usize]).map=
_err(|_| Error)?;
> +
> +        // Use pad() to respect width and alignment. Padding with explic=
it
> +        // characters (e.g., {:0>16p}) is supported, but zero-padding
> +        // shorthand (e.g., {:016p}) is not.
> +        f.pad(formatted)
> +    }
> +}
> +
> +/// A wrapper that formats any type implementing [`core::fmt::Pointer`] =
as its
> +/// raw address without hashing (corresponds to `%px`).
> +///
> +/// **Warning**: This exposes the real kernel address and should only be
> +/// used for debugging purposes.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     fmt::RawPtr,
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// // Works with const pointers
> +/// let ptr_const =3D RawPtr(0x12345678 as *const u8);
> +/// pr_info!("Raw pointer: {:018p}\n", ptr_const);
> +///
> +/// // Works with mut pointers
> +/// let ptr_mut =3D RawPtr(0x12345678 as *mut u8);
> +/// pr_info!("Raw pointer: {:018p}\n", ptr_mut);
> +///
> +/// // Works with references
> +/// let value =3D 42u8;
> +/// let ptr_ref =3D RawPtr(&value);
> +/// pr_info!("Raw pointer: {:018p}\n", ptr_ref);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
> +/// let width_30 =3D cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct RawPtr<T>(pub T);
> +
> +impl<T: core::fmt::Pointer> Pointer for RawPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        // Directly format the raw address - no hashing or restriction.
> +        // This corresponds to %px behavior.
> +        core::fmt::Pointer::fmt(&self.0, f)
> +    }
> +}

