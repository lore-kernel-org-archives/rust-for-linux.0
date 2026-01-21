Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021115.outbound.protection.outlook.com [52.101.95.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64092346FB6;
	Wed, 21 Jan 2026 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016794; cv=fail; b=J635Us9QuC4f3ZI0OKgSOYgcLvegCW28aVkp1LJABoPRZNlp20iUIM7nxbwAnilaV7ec8wMYpxpYL/mbCSnNVDy9z/15nnCaQ5QUdIBN6hEbxjsCTUXtsXMbMtTEcSklhIbdN8sgPYRyUC+ORpQG9jMuUM1HpN11Dpc8p6G32EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016794; c=relaxed/simple;
	bh=R1zbCOwvP7UfjbYWSHieSeYRqhsEFgWPU5FwyGqq020=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=A6lLYIpq65dx8FJTPfUJXUq++yUdR4Mmx9D+wmSDuplI+gFl1ITp42qPgJ5RlGgG8LO/myFcI64NjpGaaP6OTQ2P8phuHiAgwtlqaw/XDqBdtQ1BCMGF1T4rSv2leMZ6hzdyjYn0VpQGGyZj5OQIREqw8vmYD+8zCB+elHRyBZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qzfj6F67; arc=fail smtp.client-ip=52.101.95.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qzfj6F67"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWSoMiW1RDpEHsK2emKA0cHwEqBddSUyIqomScXaMuHNpLC4XygSnX35f4Ta8v0FsGNmLP45zStq5VJdLLTqXfzjX8NC3N91fikxSTPwdS2nV4lp1Asfgv5x4l34X2b9jGRdH1GPRA46cPlVcDJh4uXxO93tzu5gI36fdixdXdgtYjq69bmay/mwOc9SAXXYoQW/XxIAyLO6fyvdmsSgJyUnX31Fuimsjpjtrp9ybCJ02PqckO8aEVvaD8ce4CG+5YvDykNvbyZccabjMHFcvbYP9QWhgn3SS+e6FQt+3jIyJbTk9XMcMH6d2BkSwebPgNr5RX86lzFU5fwwgNxRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1zbCOwvP7UfjbYWSHieSeYRqhsEFgWPU5FwyGqq020=;
 b=stInxGSNTW7z17YaUm3wNqJ1BvZ+Q2kGBig+3WuxJ9rHdkYBa7b96gPX73jlNCS1PgJE8FSYsGMbINUk+0YGILLapTkGLewjdbnw4RAnAe9fVzHpvoXgX5HYK/hvt+4DFyyJucEdek+d8N85B4Lj9ni0DXRuVdxeU29v1Ul+WdQzmLaia/ZlGeqpp4uLRo+716BaEERSd+aL6VA9UxLNhQsyH+S9auctbSF5dzHUvJjMinumQUQO8z7Klfi+TsVFarMllZkiq9ZO5ZExnuKBMFDa0XmK+BM3XbOD7p+vfBBYsRuZQJip89KQ7/4lAdDCWO/HYJM/CxHmQQirRjsA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1zbCOwvP7UfjbYWSHieSeYRqhsEFgWPU5FwyGqq020=;
 b=qzfj6F67LsxcTDAEU7XHpcpBjko6tef4payXaP0JhsOrtIFe11cRxVl3eENsdvGdOCqT1Wa1IxfrVFtloRb8iB+DLZfdsi3L0NwxxiorTM4EuYs0Ib30t4EmYsD+JuQbZA1pzCvkE/RrA9fFJ/OMmu5kskBnQHJmByp9Ngpq5uI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2206.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 17:33:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 17:33:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 17:33:09 +0000
Message-Id: <DFUG45Y0U7IS.32I4NMAV9NHT6@garyguo.net>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Tamir Duberstein" <tamird@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260121165835.4097975-1-gary@kernel.org>
 <CANiq72n7PTiAMHy5cM0H3GGNdn8BZic9MAyJCD2KRnPa2MM6Hg@mail.gmail.com>
In-Reply-To: <CANiq72n7PTiAMHy5cM0H3GGNdn8BZic9MAyJCD2KRnPa2MM6Hg@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2206:EE_
X-MS-Office365-Filtering-Correlation-Id: 1655b768-6909-4c4b-6da1-08de5913254c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTFNMmZBUTBYS2w4ZU5zdS9LeDRyWkpJay9Wb0V5dkpTaElaSXEyN1ZMVjBH?=
 =?utf-8?B?S0tJeFllRXFDbWZ3Nm5NMTBwZWRxQ1VONVhERFVoYkJuTkNhelRLSm5ydFox?=
 =?utf-8?B?TTlSaE5qUDY1ak5GOWNpMWxhUStjNVVnRjBhdVM4Z3MrVEVLRTd0OGZrK1ox?=
 =?utf-8?B?ZkpUaGhJUEF1ZEg1N3lSdUtnY3hqZTlXS05wR0xvNHFYODNIdHZBK2R5RWhu?=
 =?utf-8?B?ZkZ1QXNZZ2orU1Zwa0pRajhUTmUwOGJqYTFNOC9WcjNyMmV2QXVYNHFTaC93?=
 =?utf-8?B?cU9WazNpaTRBYTlaWUluSWtaQlhMOXFXYmxrNmwrY1VSbmJQcy8yTjZqc3M5?=
 =?utf-8?B?S3Z6VEUxYWg3SlcyU2VIR0F4YWpyV3kySStUL2JJeEZjT1JBSWJUVldPUHBo?=
 =?utf-8?B?UitoaVQ1RlBOTU1YcHVHWTQ5RSt0VytvL2lMeGZDL1VmUC9HUjBZNzZ2aDEx?=
 =?utf-8?B?QndCU1J1V2JTaDZNaGZ3MHA2VVNRaGlnWUp2OEp0TEw0aTFYcHlyS2V2TGpU?=
 =?utf-8?B?RGJqUEpVV0NOZlVSQTdyRTl2UzdqUnRFT0gzUEwrRnNLV2h1SGxnOUFQMEsw?=
 =?utf-8?B?OTNoYitTY2Iyc3RMOWJuTUM1MGQzbTY0REFqc0x3US9acWVSOW5Yc01HSU5z?=
 =?utf-8?B?M1JiUk1TZFJ5L25KaFo2QmsvcW5LbGFVbWlHV0djR3VnSi9Lb21ZbTlFbWdT?=
 =?utf-8?B?QWMrZnpsSFY5bnd2UndDTEczRDZyNGhuM0Mva3V1WFVVYzlDZ29ZYXVROUJW?=
 =?utf-8?B?bXRXTTcvY2JlS0dka3cwTnVFcWJ3SkZiRE5HZDhma0x3YWJCMGtET3VhL3Zm?=
 =?utf-8?B?WEtmZUV1T3VmTFZxZzFwaTNPMXpvaWtNbnBSNElTczNOUThXbzBFQS84cEVQ?=
 =?utf-8?B?dm1PZ0syRnFleFovQ2ZBVEV0Nk5GT0lxeEhiUkUyWTNhU29URk1zVWVHc015?=
 =?utf-8?B?VDQySk9Vb0Y0RVN5eDZiU1c0SWFTZnhQZ3h2Y1Jzc0FHenpQaW1ETVFFV2kz?=
 =?utf-8?B?R1JUZytlaUNTajdQa1lCcXA1SzBWbTJpNFhUTEhlSFZSNjNYMktCanpJNnd1?=
 =?utf-8?B?NXhxUll0NHIxN25JWTd1dHYyQU1lQlh2VUNwd00vOUI1am9NVzVScFVsc0Uy?=
 =?utf-8?B?MFRyb0VueklxeUJPU2txVG9RZ1VPQ2R0a053UEMrZFJBdmZ6WmRHZmhjNXh1?=
 =?utf-8?B?bnNNdlRhVTBseHNwK1Y1eE1zSExQK1JBVkdGbVJrYVR4d29CWjlvUVBnaU1o?=
 =?utf-8?B?MnVmTUROVUJCTm1zU1Noc21MMlE4QkpobUd3dDBVaWVkbmx4eGNJK1JkZklS?=
 =?utf-8?B?MWdUOXhrU3lPMVhYSnROK1B0dk9rMldCQ0c4ejVYdlgvTklvclU1dWozbE5G?=
 =?utf-8?B?SkJMc3IzWVNzL1lkTE9uRDA1aWovb0NnNHdMZjZmSGtUVUdxYjFpZ3hIM29W?=
 =?utf-8?B?VVgrMjFkbUFrd2ZnWnBMS2ZCVHJNSG40aXpwR1NZSjBvNVJZTnJQRUVYVWN0?=
 =?utf-8?B?UXlkUjFXc2tWcXovZzZadlk1bHJYbTN1cHhFU3ZzWHlON1A5bEw3cDFyWVQ3?=
 =?utf-8?B?MlhSQlo4clRhU3V6dC85VTlkZ2dnaWMvam5MazJIVUk1NzE5djF6dGVwazhS?=
 =?utf-8?B?SEtxeVZscWllOWh5M09ZckpDT2x4NGVFK3RaY2FkelFWVGZPT1A3NmFmeGNq?=
 =?utf-8?B?WVlqYmZNTFozTkFVbHZ0a0ZVVEo4SVhqbGxUWC9RbTNNRDdzbnJHWnpJMG5B?=
 =?utf-8?B?TDU5dFI4OFlGN2J5enJRL3czUXRwVmI2Y3B4ZmYxOG51WU1UejRBYkdFS1Rx?=
 =?utf-8?B?RFJ2NTJUSXIvWmowbDRFdWlGSVZ6K0V1ZGIrQmU5OTdIVGVGVVN1bXlralEw?=
 =?utf-8?B?a1YwTnVOaGJ6MEhtMFhna1ZwNmw5L3kzQ0VwcFV0RTV4cnFUbFlMVmFaUUdV?=
 =?utf-8?B?djk5RENSOTJpQlIwWDhjdEpDQ3RTS2EwVlJLaVAyQmNCMU5mTmxZMUVOQnh1?=
 =?utf-8?B?eFpQTmRwaENuK3YvTGZaU0V6NG42VjNOQklwNjl6QThpemZlZndURjVIZFIr?=
 =?utf-8?B?N0llcldZQlJTSzFKamVydWlXM0RLV2hGeTN0T1FHTnZTeWd5eFJnMm5rb1R5?=
 =?utf-8?Q?n9tQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2JOOU1YeURvcm94cEJkK1hHaE5nV1BTaWxZTmg3VnBSdHpmelAvVFNOdG0x?=
 =?utf-8?B?b3EvQlVYZ0U1TmdkSjBmeC9HNUFhTXB0VEpVRnhpRGQxT3lBMG5DZVhnL0N0?=
 =?utf-8?B?RVo4T0xKRnlUVUVzM2VWSTFsRnpUMEx4NGkrdlhtWmI2eU9XNnZ3bDhDRzJD?=
 =?utf-8?B?ZUdxcVlJcmNGYW9sRytiMUV3emRMbjkxZWJ1SzFraFZBNngycHNlNWhDMzFh?=
 =?utf-8?B?TmVDRnUyQ1F1SGlFb1NtanA2dVdrNVErVGZ5VXlINUxNUC9wL0FOdm1KNS9z?=
 =?utf-8?B?VkM2ZHZkSkEwTlQxb08xODN2YW1SQlY4YkljdC9oN1BkeXMvd2djVG1rTjhk?=
 =?utf-8?B?eFZFYlA3aHlST1U5SHV2cWh3bWR5V1ZXdXNPS2hLTXJUaExqcXlRSE9uUHF2?=
 =?utf-8?B?Q1FTNFlQQ3hpSXhaZnB6OXVrcFc3SlN2V1o0ZmxQYjhaeWhyQ2tqdFMxVUFL?=
 =?utf-8?B?cjhlb3Jlanh1S0xJMXdXM045bUl1cmpXTGpxQW1qSEtvSnhiRGdydzVjNEZy?=
 =?utf-8?B?UTlXTk1NekFqZnB0c3BWQmo0bmJKc01FdzRHakIreTF6YnlZdEZSeCt2cnk5?=
 =?utf-8?B?cWpMMzI4NEEvcXQybGQ0VlphZEJ5T1JPZ3VPNlNleHR1VHZyRitDZ1cxNzRJ?=
 =?utf-8?B?WHhVa0NvbURlSDhiK2NlVERDRkRuWWxEWGYybFVoZzFnY0YrTGRmbzI4OWU4?=
 =?utf-8?B?d1FDeE45bUNrL3dMR2FwQUJ5c0hRTVh6VGt1WkJKQXd4L1dWR2R4K2wvZDMv?=
 =?utf-8?B?MVRUTksrS1dDaXRwVFhjbEpOcDRpOW1Ld28xOFZ1dkVKeEpDT1pkZXlUdGJp?=
 =?utf-8?B?eTJlNitjSmtZeXdoMCtDRmJwUjVFK0ZtWHVWSlc2alA2OGE0MmxEN3p1WmRs?=
 =?utf-8?B?S1BXUVdrazBhbEtYS1k3VGxiZUVWdUlXTkF3RXU4VkpUWDNCYU9tamp1ek1H?=
 =?utf-8?B?cm5KVkgwSExXdk1HQk53dkFwODNiMVZ2dDh4QUxmVUt3ekNXNk9tTm1hOGxX?=
 =?utf-8?B?Q0dUMW4xYzVTZHB2cUpESHBFQ3NNL0RsSW1lZzNwcTJST3hrbEtzQ0U5N2tZ?=
 =?utf-8?B?N2kvNmdNN1FrSVV6cUpoSnM3WUpnaTA0cDg5R1E3aVVCRkhpSDVCQVZqUDFE?=
 =?utf-8?B?dmVhK1lod2NhZGhkKzc0RFVuTHVPWERNTWpwNlFwUFQvVUJPT01LWVJ0d0ZR?=
 =?utf-8?B?Q2xsZG01UTJqYTk3OVlteVFyenlyUlZMbnJnK1NxWTllL1MwMjcwak9KNCtt?=
 =?utf-8?B?MDFyUGQyb0p3d09LNWxkQkFWV3UzbGRCemdDTm84WE1MY2hORHc5OG93aHMw?=
 =?utf-8?B?d0NOWFJaSFpuVlhQbGVLcWRYWWkvZVYvU0xWdlpPdHdDVDliRUFXMGVtblI1?=
 =?utf-8?B?OWNqNUJEUnVCa2hjVEJHMC9ha2JjMjJpMFVHQjByRlQxTVUvMlhSNDNVVG1D?=
 =?utf-8?B?TGdkcGEydDlCNSt5ckVMVnJUYjh6aktjcmExQUtoVEpPNUJDWm56aituK2Jr?=
 =?utf-8?B?dnI0SGU0cEhJVnFNN0tHOFJ5ODlkRm1tUnVPeU00TS9ycVlBb0ppSVNCYkZi?=
 =?utf-8?B?ZmNrRE1uVVJsTHpvenI1YXQwek04eDd2Z3VZWGplV2huMjFBQndnNTB5clA1?=
 =?utf-8?B?Mk1hMG10VktndEd0R0RMVlBYMXBmb2ZRb243Umkrb1Z3Q1haZXdQQlFiRWZl?=
 =?utf-8?B?dWNVRU15QWQ2ODVaWnM3cmJoUkN4Nk1sNUlOOEtGcjVzWGpMWUNkYzZaL0M3?=
 =?utf-8?B?Z1l6bm9pZXgwc1crczJsUjVENHRhRmNQdHFJTDE1Q3VZTUNQaUdFUTdPdzJl?=
 =?utf-8?B?Um9iZ01EODRtMlExR09lczArcHg1YUhQQXdUdVFBdjQwV3RHallNZlB2K3h3?=
 =?utf-8?B?S0RxR2I5cFljSHNZR2MvVXcxVVlYLzg1ZldPWktNZm02K2lHVWlvdFBlOU82?=
 =?utf-8?B?NmJGQUN0SmptNVVQVFRFZE85WkhCMm5lZi8yTkRYelRGLzBWR3IrNmJwZ2dW?=
 =?utf-8?B?L3lHWGwxUmtpazVnRU81VDdSZ2RIUExJQkdqYVhVd3NuVEhJUkpNNjRuK1kv?=
 =?utf-8?B?S2ZYQ1lDM1QyczB0cENLcFkwV0xzblRDZW9nd1RwTVFXUmJDSnNnWUY5VmtQ?=
 =?utf-8?B?RTRQMFBacVdMdnRQSjZxZzZvUmMwVnh5ZG5OSDFiUEZCMzVQQzB5SU9TZGwv?=
 =?utf-8?B?aHFTczRja0tiMHMrdExMM0x3dUpPZzRjVm1mandNL0RLWU5Qa3ZTaUZtbVVE?=
 =?utf-8?B?bHRSQ3JkMDFCV3BESTJkbEIvam1BRXpNLy9oYjRScWxyek5oM1A1c1hTS05q?=
 =?utf-8?B?ZUlndHcyVTVLY2ttRDd3clBleU9xelZFemx0eGZrT1VhY1cySUlvUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1655b768-6909-4c4b-6da1-08de5913254c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:33:09.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: va/RN12cCzqVsDXAYRlx/gwuH43opVhk+kHX35ncrsojN4vfBwxYNrnmYjBYGAIVY8M9UTekdvnQxumdsNcPXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2206

On Wed Jan 21, 2026 at 5:04 PM GMT, Miguel Ojeda wrote:
> On Wed, Jan 21, 2026 at 5:58=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>>
>> +#[expect(clippy::disallowed_methods, reason =3D "internal implementatio=
n")]
>
> Should we hide them too?

These are the methods that we want people to use? The "internal implementat=
ion"
means that the use of `CStr::as_char()` is the internal implementation deta=
il of
`as_char_ptr` so it's okay. But nobody else should use it.

Best,
Gary

>
> Cheers,
> Miguel

