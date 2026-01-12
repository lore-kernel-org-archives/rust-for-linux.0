Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022097.outbound.protection.outlook.com [52.101.101.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE541946C
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222320; cv=fail; b=Il5DWEiejdaLZTDLEi+Cza2SZlf1e5x3yU520FJ9VPQvl+d4EH+S5rPwnU0CU1+9bmzZr2sBW8hx21DfJSfJgghEAsXhS970e9mOq0UjVDef9ft2ztgFdpSSG4e+Jpy8Jd0dlAb2mMQ6hu3cpksYABcZGQ9Z5fDzNEvpi2hsYoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222320; c=relaxed/simple;
	bh=Xq7Jv0D/OhMGWhIxcFPGgq8Gr9ZVHDwWubyEwc5lXes=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=jYn9vLG+dLMOYxC58d88WKgjjiJ6Rf4QRPTO/42CmTX+vKeR/Ja8NqWrt2CtzknVCOtcE7NIzw+SykaxdSBGKeJhohkDujED8JrLvdARYxz0P5hbcgwjhj6kqv1tI05YcLj57jP+bbuc9ycGEPXociFTYTZbCeX7RHyXtCpO80k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VaRnw+M3; arc=fail smtp.client-ip=52.101.101.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VaRnw+M3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0TE5gSZj+Zk0SN5p2ScpHY+aUXrRoo4ydmzZdczZcBXC7Ei5YANj3hRVbm5CNr5ImcDfhQXCrjTrucjrYGStLDjhGsvUzH/oEniScoNMWgshOgYJ81PIM5Oq4I6xskO8AjTddEl84CSmeaaWmRn9bA9jR4WwNQtYtah4npBjABMeI/m/mUjBUr6AiBirjDVZ8dkEHQoCLqpW8Nv9H5hi+BHtPYnoeZ+UuCGnqEst2XITTHAo4c2+uIOlBUJxYRHxeyqBwm/CuUCww84Rr4M+8LO/Ru3SmB+ySOGgrK/41b+4xjPS4A/j61AEep2UiwJbH9DhXdneKARvtxZaA7sUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwflflCO0cOMisJDw2zoCVg5sb1n/LUMC2Qs4T7vstc=;
 b=f5ndpQEn0o21o9/Vk96T5DT2pd/PSUzHa2LL+B2i1EV4Fi5o/IbIBEDTVBBVdfsrzDvE/1+wiC6XdRGOJoGZQKvO4PRmko8uy9yxat6yNBh4tkbIB30FlBrDGcfZZo3IpPmXsmiySiFdXzSVRfCPT4JplzXUZ04RElbuigSky+t6pfo0gDLX7/anldJqfJs5a5wJNgIVi16NqytoLgzZyq4KFtonAxyuKFO3Xpyha0DLQHaC5Df7yTo3jJJ2If5ZkUnUokDIlH8CtRAX5rsZBmcryFelD0u0Up8SceU6vPU6IhLF50PZ3IT0gKTN3BjXdv4OA0uw+j+bz9UPzVXs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwflflCO0cOMisJDw2zoCVg5sb1n/LUMC2Qs4T7vstc=;
 b=VaRnw+M34BKj48sFzUTLKb978zK9sNu2aDPdEnC3ZO6tddv5L2cds1+r+9A2cecy4JZyjlcRiIqf1FZ4SsJRNEJW3RyDpBLldlHsNkO7LYQpOjtGNdGLl/HNhRH9rwnP9OtYk5AThl1nFaulxgqSEXRAMIyD8YkaH1FGp9zstKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3336.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:51:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:51:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 12:51:53 +0000
Message-Id: <DFMMHWYPIFWB.1DLKD9OLUNGNU@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] rust: sync: atomic: Add AtomicFlag bool wrapper
 for easier use
X-Mailer: aerc 0.21.0
References: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
 <20260111050558.3147975-3-fujita.tomonori@gmail.com>
In-Reply-To: <20260111050558.3147975-3-fujita.tomonori@gmail.com>
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3336:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5a61d1-4659-44d0-d657-08de51d95d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk9xMUNqUkVkbnNZR2RJSE5pcE15NUo2QlY3WU5rZHViYTIxOG1JOCtNNXV6?=
 =?utf-8?B?RnNVK3NzTHpKWldCOEU3U3VWanY1b05laG05MUlBaURrcWtBUTJWR3ZwU1VO?=
 =?utf-8?B?UGNJbkhWSEppc0FnMExJZ2UrNzZsSzQrQkdFSi9TVS9NeVdWOVlNa011OHR4?=
 =?utf-8?B?MmJYbnhTdkgyc29haEFJQkNXQ1hLUjJEZTQ0cWsvSFJtZnV6YjlEaTBQWmRK?=
 =?utf-8?B?UHpSSmFPb3dJWmVpQVZJUHQ1bUtMNzA2Ukw0ci9pOVJ0Q2dienpsT3NJYjZX?=
 =?utf-8?B?Tm04QVBZWEZBdkFReGZJV1hnRzVMNnM3cTVRUVZWN2J2Ky8vTS9iTXZ0bFdS?=
 =?utf-8?B?amYvZ2FMNWtUS1JzN2lZUGJDWkRORnBwMzhLVHQ4QWI5dnRuVzZVMk1QaERh?=
 =?utf-8?B?MUFhQ0duVUgrWm82TTFRVzN6Rld4L1pPNDBiMXJsbFBlVmhQK2lnM0c3NjVK?=
 =?utf-8?B?bkp1bEE5bFdLc3JYeWZCNzdmVzlXRkowdmN1MTdGWlg4dm01SVk1UllqNmpS?=
 =?utf-8?B?TE5GdTI1RmRCNVEwVms4bmpETDEyTUUrbkNZR1FqRDdDRW5mZ2dxRWo5b3lX?=
 =?utf-8?B?eUxpd0xmTzlwNDVHZFlYTlRobUNhQXhwWjBqQkRKZUZyTEcrYk5Bck0vMHlz?=
 =?utf-8?B?MTNIcGorU204K01UemVNWXBzRWFnNmFxWm9ZY0ZWNXBsY3NibjVHeFZYMzEv?=
 =?utf-8?B?Vy93cjI1eW5BdnVqeE5qMkpsTW5WL09IU1p6TzZPV1hLRGJ5SU5tS25ybWxD?=
 =?utf-8?B?VEZpOE9CYzUyTmNwc2FydWI3cms5MkxONXNwSjl0MmJsZU10MlMxUDRPc25Q?=
 =?utf-8?B?VWQ3V2V4VHhNdkVuMFlLUng2ZEhpbVEyOWZuL0k0YXFrVnVjdGZCQ2M3Zm9S?=
 =?utf-8?B?R3NDdHBhZ05taVd3Q0NPaDAvT2xtWkVKSnV3RFhsQVJVTzlIKzh6a2wvdC9u?=
 =?utf-8?B?VmwzTG9WbkRRQUVmMFZVRElxdUlUMFRuTE1aZmk1M0x1NFhDcE5MT1o4MjhE?=
 =?utf-8?B?K3ZFZFJGK241K0RwTFhKT2ZGdEc5RnZac09IT1B4MnM5cDNOdWxYSDRwOXBx?=
 =?utf-8?B?OXFDT096a3BybnRhYlduZ2VRUG9vUFp0bWxRZzVnRHpkRThmZmdPRnJKNkFq?=
 =?utf-8?B?cHVyUU8rV2dIK1NkN0VNRWc3Wk9LSG9BVEVvTlBKT0hhRzU4K3dNcTU5bzJ5?=
 =?utf-8?B?dHdoTm5PK1RyV0ZlUmJucWljVHZlVHlNOUdzK1UyM29GamNWZDI3QW5MdGxB?=
 =?utf-8?B?SWZ6SitNS1htWGdWTHFwYkc4YzZXaTZGdXNseGxKTDBNMnZVUElmOWp2Vjk1?=
 =?utf-8?B?blA5Zk9IVk53QVlmSm5oeWE4emlubHBENzVsd3h1cVNjajBwNFpLTFRLaW01?=
 =?utf-8?B?dWtGZG1vNkpPNCtNNEJESGZCakhHOHRGcm5yenNyYmM5RTN4RUY5dWR3c0Jr?=
 =?utf-8?B?V05WOTVXN2M1T1I1RXNxYmtyVjVCOVlpd3hwS0tURnJKSXBab1hUNjlhV2d6?=
 =?utf-8?B?VzcxaHYrcnRXem9PeG9TcjA3ZnZGMC9WQk56U1BUWUNaWXgrVnJuRFNha3NM?=
 =?utf-8?B?OVQzZlgrZFBZS0NBeVNGZFVlVytPRllXTEJBU3doVlJCaThIR0xCeWt2eGJH?=
 =?utf-8?B?RndSNE12YmphaGhxWGJqbHQzUDhUclhMdXJ2ZUJBYnlyTG8vb2xvM2ZFdDVs?=
 =?utf-8?B?U3dRVEQ0RnhuRnJYYzJyaytJdXZKandFZE02TlFQL2UvcUo4LzA4REUxMDcr?=
 =?utf-8?B?MUJRbGYwbzNia0VWdWRiWGI3RUpqK0tFYm94c3puNEF1dk9nWWZzRGx4Y1dj?=
 =?utf-8?B?dXE4UjBna3ZqeVpoNTVrbi8zRlFLRStiaVgwWGtQMS81SVF6Ukpqc0wxSXpI?=
 =?utf-8?B?NG9iYm9zU01EbDNKRHpMNDNDWngwdkFReFJMSWlsYWVrVnl3VWwzT1Q5dHNh?=
 =?utf-8?Q?ikryWJ3gLEIxSgfSRfvNi1TZHuXDBtir?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWVYY1BrL3FNc2JVMU1uZmp2SG4rNHgzcC93NVFzTDlKYlhvWkpJSHIrakgr?=
 =?utf-8?B?WlFaVzdGcnR1eS93UkFiTTI5c000UjdQZmIwRDhLYUFpNk50Q2RoL3kyMVZi?=
 =?utf-8?B?K1YwL2xDbEM0TVpuQmZFa3VLekg0a0IrSnA5Ymp3L0FkKzlHeGV2VWhyTG9Q?=
 =?utf-8?B?Y1d2bDV0WXNVK3I5TktLOFA2d0xKN3N4VVhMbEk0bWhLVFVDVjJXRHE3ZytH?=
 =?utf-8?B?bXM4bGpuWHJBY3hnQVpLdzNYaWhSa1ZwYUQ5ZXlhekJ3Ti9QcDF2WVorcWor?=
 =?utf-8?B?Z2RMeUFjK3pHdmdSbUpFalJUR2JBbVBiSHU0UFJMdHJxMllDVFNwV01uZmYy?=
 =?utf-8?B?dzh1cVJTMzY5SmQ5QkZsUEFPdndyR0x0YWtYWlI2UWhwU28yK1V3QzZRNkYv?=
 =?utf-8?B?Z0JnT3Z4eGFyM2w4OGhBcHZQTFVNM1FabEQ1L3FtMW55bkpVMFpVRFRmaUNu?=
 =?utf-8?B?SzM3YkpKTmhRcTVlWW0yTzU5QnIveC8ycm4xaEQ5UmtjN3BDRUUxRmZBRElH?=
 =?utf-8?B?UndUOW9rUGoyeFpudHFta041ZFJXS1dWMUNoOHR2cDRja0NBQjBRdmsyUWNS?=
 =?utf-8?B?MW91MmVlbEwzY1ZRZGUvWE5nMW1kZHFMbkgrQnpWQnJndUtZUENheFFVNXAy?=
 =?utf-8?B?dXhuSDNZWHkyRjJPR2w0VjZkWWo5bE1jZk1Yc0htdWh2QXplS2xvU1MwTFQy?=
 =?utf-8?B?d1oyNVpmS3Q3ZUVhcDh5TEpkbEZjTUNqZDVWOGJwWGpCYWNkUTNtdDZldmJZ?=
 =?utf-8?B?OFl1NXZxYU1JWXl4Y2Y1T1dxeTZ0Yyt5dlViSU5KTzRGZURPU0dMMTJmc2FR?=
 =?utf-8?B?MkovdlpQOURsMTFwbE5idGhUZnM2MGtqdTY4eEdOc0xmQ0lGbEMvYjl2QzJW?=
 =?utf-8?B?TDh3Mmc3UkNLaEFRWGdjNGhWZzlnQUlDL21nWTExRWRqY0NRNHdlazJZZk1X?=
 =?utf-8?B?WTRibm1kbkd6eWRkaEdMOFQ3bVltTXBSa2g0amIvbjVYbVcyTStTSTJBblky?=
 =?utf-8?B?V2ZQczFNZzArT3IyNllpclNvcms0ZFBBTjBMc0p6cTlKcEhVcHZJcEMyZkZj?=
 =?utf-8?B?WFU2anJFWUZucnI4RVNFemppY1VoNVY4NWN1UjVwVThabG5CMFd3aXROZnNG?=
 =?utf-8?B?U0w4T2NyTDh2L3pFN2hoc0Y3MmU1TnNuNDVqbmZPQmdleUVMYWNmVlVNRFRP?=
 =?utf-8?B?S2JiNkRORHBLd3NEeEJpQkFGZWliMlZwZ3FRVW8wZGxRbmRGVmlkc3V1UmRy?=
 =?utf-8?B?UGpteXNvK2htbmdJbEpiY2RqOTBIUzVodEIzVXMyZVVPQXh2SGYxRkZ1NlRx?=
 =?utf-8?B?aUZpOEVzUjZ4bDd2RGNsTEpjbXI1SGRIYXU4ODc3T3FzSkJ2MXV6L29WNzJy?=
 =?utf-8?B?M0NVRFhXckFxQ0MvUlREcGlKR2lqQWdyL3NEZ1RYanRMQzFmZUhieE5aVkxk?=
 =?utf-8?B?MnV0RjdRQVZwMGZITEtLL2VlZHQ2T3pTZ0NwYnU5VFNRWW9UQjF0SzNsVWwy?=
 =?utf-8?B?NjlRUld3VE5ENjRWMVFUUnN2cVI1Q0hRTG1GMURtQVpnckZYV3VEeThYQ3dn?=
 =?utf-8?B?U2dqcWlGZ1M0TCtIZFFUSjZ5aUxkZDEva3V5V244ODRjeEhjSmFrYXpjVlp4?=
 =?utf-8?B?NUtKL21wRXQrRXN6ME1Fckc3MHZSLzV4VkhmTVo4RnVxdkQ2WS85WVlqSW5O?=
 =?utf-8?B?aWR6ejBVT2xpUFAwMFhsTmxRek9XT2o3bUdJMU9mUGE2ZHhHSEU1UzBYVGpx?=
 =?utf-8?B?a25GMU5QZVpyaGpWdmwvYlo1L0dJMUxoc0M2UzNtVFlrYU9VdlVLWEl0c21C?=
 =?utf-8?B?NzE1N2Z0bE5Sd1ltSldORVRyQ1poLzI5MVlUaDR0dC9vbDN3b1ZRQkhRK0FY?=
 =?utf-8?B?VTVVMTVvZlBvVGh2TzREK1FXeDZRTndjcDZsRGgrVmNJNURRRE9oK3g1bzMv?=
 =?utf-8?B?K3RsdFlPY1F1K0JDN3dqckRDK0NFcVZmam1yU1U4U1lXQkIwemljMGJKY3dV?=
 =?utf-8?B?cmtYSkV4d3M0VUdNL0hPK1A1bjVRYUMxVXNqNWk2VnNPNkpyb05zUlZiVHBU?=
 =?utf-8?B?a09qVTBBbHM4L29rQ0NCSFJmRG5PcndBYXVLanZ1STdZMjdrRTVyNXhES3R5?=
 =?utf-8?B?MG5DTXVSWGUvSHJOM2duNW9JZWpmbUtqSnk5eFl1aktNL2Z0aU91aVVCOEcr?=
 =?utf-8?B?YnFXZy9PUzhKVFBDOFRaSWF2ZzZ3eklGN2lrbnhYSkZ6Q0RZcW0zVUFwaDAx?=
 =?utf-8?B?bnlCbHFqeWdyU3kzdmMrS2lidmMyVFBhbW04TDFGc1BzRGplU2dwaEpMKzQz?=
 =?utf-8?B?Mk5MNVJmV05aWHUyWTBOS0lscXR3a1o4OU54ZEhiR0dzWVlicWVKZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5a61d1-4659-44d0-d657-08de51d95d2e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:51:54.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTazTT56sCgHfMbtDnzxUeX5N7oMEzijViLf2yj16SeYat8FL2m2CkOvtBU1SAtKGt13Wj43DCkWxPv55REFAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3336

On Sun Jan 11, 2026 at 5:05 AM GMT, FUJITA Tomonori wrote:
> Provide AtomicFlag as a thin wrapper around Atomic<Flag> so users can
> work with a simple bool API for load/store/xchg while keeping ordering
> controls.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs | 46 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 473d3c07e234..c3039289b989 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -622,3 +622,49 @@ fn from(b: bool) -> Self {
>          }
>      }
>  }
> +
> +/// A convenience wrapper around [`Atomic<Flag>`] that exposes a [`bool`=
] API.
> +pub struct AtomicFlag(Atomic<Flag>);
> +
> +impl AtomicFlag {
> +    /// Creates a new atomic flag.

Need an `#[inline]` here.

> +    pub const fn new(b: bool) -> Self {
> +        if b {
> +            AtomicFlag(Atomic::new(Flag::Set))
> +        } else {
> +            AtomicFlag(Atomic::new(Flag::Clear))
> +        }
> +    }

Would it make sense to have an inherent method on `Flag`?

    impl Flag {
        #[inline]
        pub const fn new(b: bool) -> Self { .. }
    }

Best,
Gary

> +
> +    /// Loads the value from the atomic flag.
> +    #[inline(always)]
> +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering=
) -> bool {
> +        self.0.load(o).into()
> +    }
> +
> +    /// Stores a value to the atomic flag.
> +    #[inline(always)]
> +    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o=
: Ordering) {
> +        self.0.store(b.into(), o)
> +    }
> +
> +    /// Stores a value to the atomic flag and returns the previous value=
.
> +    #[inline(always)]
> +    pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Orderin=
g) -> bool {
> +        self.0.xchg(b.into(), o).into()
> +    }
> +
> +    /// Store a value to the atomic flag if the current value is equal t=
o `old`.
> +    #[inline(always)]
> +    pub fn cmpxchg<Ordering: ordering::Ordering>(
> +        &self,
> +        old: bool,
> +        new: bool,
> +        o: Ordering,
> +    ) -> Result<bool, bool> {
> +        match self.0.cmpxchg(old.into(), new.into(), o) {
> +            Ok(v) =3D> Ok(v.into()),
> +            Err(v) =3D> Err(v.into()),
> +        }
> +    }
> +}

