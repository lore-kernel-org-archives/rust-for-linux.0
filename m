Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022117.outbound.protection.outlook.com [52.101.96.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA3031A7F1;
	Wed, 21 Jan 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012311; cv=fail; b=F7k5qlfNUc8x9U45RMi1WacFoSvyQGM4VssZ0HBRpXTPP8+/JVPSqnsPHRFPdVAl5ooJdxwM+yjJvw/oNtFC0Qy95D2OaHMn5ho/AcCKfINPNSSJabzVdUArKcXcvl2s+lVO5ogzsQAqacHrGJ/rlvEQIFY6Ql+l29JObNI2/Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012311; c=relaxed/simple;
	bh=2fxPJAQDR5MlWmDs0L+BsK0NWf8kFJlUmkFxYkl8tJg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WiElM4FfCNHeJXMbzOsd2ch9capH2jre0QUd0+pW3Y6qR8BDtO1oJAa60DbSD88UL6Y/vEVLgpTqUAlHGgfq+QSPvN0p05L3iUjk86BDPcGmgkpRMQ9DsEZaecuK6bTeCjwRnqkK0T361YmULEdaoAMdK97EWK9KOCS63kFcPVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EUzz6k4Q; arc=fail smtp.client-ip=52.101.96.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EUzz6k4Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGqeFy2IKMk3oRADh3YwlqKk8sCEdrpKbXIj5ybAQpax2UqtK8RwMZk3hgZRQOaBYhBeIL7A/+C7Q7/odv9s76bXw8FyOXLnlsEYRAuNq3rnGInbvgj6ONUWPu6RCnJNEc8Cfp5h0eui5X6h9UnnjGwdL7yp89Zadkp6bHhm82x7/W/2azDk7aCTpfiGov3CYVS+8YGlF2no46pBia3OpNqeaK/U/dbItSH3/1akuDrdPh4310gziKVHs2o/I8uWK0P10ZdoOz8NxSjqSL/LqgIQWEJaolGAL/Tl+Ct+E3WXkUHiqqx/P/nD9MUza3ldli9KPT5qTj2Q8MD8hmQ+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Iek6Fz+PpeAmGauwXZFS5Wv+XXwlbpqTPjeP+wy9e4=;
 b=w4gzS7Y1WlhPrkAn0dJCGYyV4vZCe6jTvfAuesbwCaLXMRz5sTYZAY0VRJY6m8Z3ZiKFCCkAtQMdYlKgS4GIYwrZ/IrfNCGfC2n0h3zcMC/9WbjuMPUlXRmp3eqFJjTUyuQzZdz0HNVTgc7aJHRPh1HJMpNfnq8eBItvhkWyfSWoYzH/1DNGjHaU0TS9UR66adW2qif6mEUidV2xbA8Tpsm4hNeacbIPUbyVb4rLY9STe4ve3Ib/px+r6obi1jD7+eLBLG5Fp0D6o8KeMGJ+sqhjdvqxSGYITQ8nCehPZCYcV8vHiA9kOHGc5BH7M5C0I3GAS6skIR0g4d5HEvjg+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Iek6Fz+PpeAmGauwXZFS5Wv+XXwlbpqTPjeP+wy9e4=;
 b=EUzz6k4QCbimNmHb0d3b/8vHzpioyCQa5WFbZBP+ihVJELDhUzSq6mnztWArYvmJ9HTiBmlNGOEPblmLWzV/ZQ2cEQTYySWIt+h60dtYx0Hax0kXmxN1vqFZC2ouHkiKfNa888KcgNOEx/eiL0B4MsnStB0lUIeF4yWBPFERFsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6520.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:18:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:18:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:18:25 +0000
Message-Id: <DFUEIY2MXKH9.1UAD8LZV7FQCX@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 24/31] gpu: nova-core: Hopper/Blackwell: larger non-WPR
 heap
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-25-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-25-jhubbard@nvidia.com>
X-ClientProxiedBy: LO6P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b2cda7-5a70-4e8e-b850-08de5908b4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC9pdHR5ODlDWHpld2w4RjdnMFA2MXlidzh6cnNKMmVJNG9Ec0JpSUZVNGQx?=
 =?utf-8?B?NmtNaXNVQUFabUtoY0ViQjVPeXcrT3JQL0NvQ2lKOWk5ak5YK2J3VGJmQW0w?=
 =?utf-8?B?aHZyazBaYmhSUFZ4Q1F0Q29kRHM0OEhEZ3lTZ2Z0d0d6TnFkcERaUUwxY2RL?=
 =?utf-8?B?SG9ySG4xR0hib2tUR2hFSXlHeXFLSkI2NjRQT0tzVDZVNXE4ZS9Vejl0UkJB?=
 =?utf-8?B?M0xXamk5WEJISHBFdmV6MGUrTG9zSDlOTXdjRG9qTFhmVzE2N0pSckJVSzdn?=
 =?utf-8?B?Z1EzYkdtcitZdWRFcjBwblZLTUo1bitpMHpRMXJYRTVFQkcySlIyNW0xenNv?=
 =?utf-8?B?dXkwU1ZJajVDQkxrczNBRUpXUjR4SFZzMTN1UTFvdlZOcDJZZit1NkRjNXY1?=
 =?utf-8?B?YW5BMXl5czAzWlJzTkNaTllJb01VQ1lhd0RKLzhTK3FJMERxeVlPZk5nNGtS?=
 =?utf-8?B?SzZWU2FvbVZGd2JtdmtvZG1Xa1h3cll0bnRBZDJ6MW1SWWNrQmU3dC9CZDBG?=
 =?utf-8?B?QmRKeFFwY01Kc3lDcXBvZzRqQ0ZTcjlzODFYSnBBamZlRmpxUUwxRVozWWdm?=
 =?utf-8?B?Y3M0K0lnWnBxQTI0VTUwR2N3NWwvSXdHMm9sYk5qOTJ4UVRnN1FPTDk0Y21w?=
 =?utf-8?B?Y0RDWlFGMTdlQ3gwTzg3bU5EajBmcThIcTJVQWIvaVU1UCs4ZWN2STVRYVhu?=
 =?utf-8?B?Qzk1U0NiWWdiUGJ2Nnl4RmJDVVZSUSt6ZzlZYjNydXllNmtYK1NBT2VBV0tl?=
 =?utf-8?B?YWlob1o5ay9VRTFVbFFmS1RZK3J4QmluMGRZWHhiN3l3NnhiUUJIM0ppeFdz?=
 =?utf-8?B?K21UeHlsS0owRld1TkdaOUNHWlAxcHBBRHdoVktpSU9GcUZCd0hUblo3YzRT?=
 =?utf-8?B?ZldXWlc4VlV4WkVLQ2VNYXgvclB2WXlOM2YrK3lNK2JrVVI4bEt4QUhSY3B4?=
 =?utf-8?B?OGNBNlFqcktJYzNKOGZrbjYzNzN3eDk3WnRteS8ya0JCYXFldldqRFl0amZa?=
 =?utf-8?B?QklEalJTWnpNcitqdmRtenlDY0Zpbk1TNWNiZUZFSkE0SEIvYnptNk1weVh0?=
 =?utf-8?B?T0VmTFV6M0NHdFdUS3dUaXNIeDJsekNFd3REQnU2RktVR1dKU0p1NDRLOHdS?=
 =?utf-8?B?aXR0VExyK01NN0xMdm5HUC9zdVE1MGJ6N1lhR0k0OTRpTVE5VGRCZ3BKMERQ?=
 =?utf-8?B?cVU3d2JrZXdoK2VnVWw2TGwyMGFINU9mRDJheFdLaHJFcEJVekd3VTVZajRP?=
 =?utf-8?B?ZHpMWElVbGMxTTFwbTBjRVhjY0ZBdXh1VTRIMXhjMTZkaXRBNlByckc5emlQ?=
 =?utf-8?B?L1ArcFViOEdCV1pKS1NyTzNWaVdZWjNTbzhNZVkwUDdqNStXNVcvankyRVpB?=
 =?utf-8?B?d0ZvZTVkNHZzMXdIUG93TDVjNmhnSlA3aU1GczhnQW95WTlVcDduTkIxazJS?=
 =?utf-8?B?Nm1HWTJscHNnRHg3QVVzTmUwRE1HVGdNcFJ3YWliM3Q4QlRwZVdCVm5UcHgy?=
 =?utf-8?B?M2U5THM2MERjM2s1ZnBJckpFWUZXNDErejFGWHRnQ0QyTmUwMXovL2N1aG9V?=
 =?utf-8?B?RklPNDlXcWU0WFRKT0xPemZGdUlGZlFibDEyWjQ1R25uZCt1L2VGRzlXT0dz?=
 =?utf-8?B?YmJLK1RxTU1SOXd1a3FEditPczNBMnJpNTVXR3pHUnJ2TEJhaXdlRnduSHhP?=
 =?utf-8?B?RXBLVVZmYnVkczJVbTROcFRBMmoxc0xJcmxHT0J4WEZ6YjFhTjd3bXJ6ZmJ0?=
 =?utf-8?B?MW4wU3JlODJzaERkRWJVV1dBVGxoNEhveC9KWG02b1JEQko4ZjlYQmlpaFBn?=
 =?utf-8?B?a3QvZ0lwR3VzYVZuNUkxaFpXeTdRUFFySTZrYUErWHFvdERSYW9xaHFpV0Z3?=
 =?utf-8?B?bUxOVUl6QVhsMkFxRkFZVTB2RjhUa1UvTm9jdW9sckNLeFhCb2xRU1BiS0RJ?=
 =?utf-8?B?RG1YNmt6TFpRN2R1SWlKc0Rsdk4rREJWMGxrYnRMQVk2emExeG53b2p2cUU4?=
 =?utf-8?B?dmNsTllBeTBMVTBjNFBoN0xFUzQ5ZFlCV252Y2JHL05DVk05SjVHVWZVQzNi?=
 =?utf-8?B?dHVjd01lQkp0WHpzUC92eFlkL21WOW9OblBCcElMYk1NdFBKTEczTmR1T2d3?=
 =?utf-8?Q?e1qE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytySWo4WmtPVTA2cXRpeE1yeXN5cEliUFQxQ2J3Vi9MZ1ViaVU0MXVQWlpM?=
 =?utf-8?B?YnNPcytkY1lYSFFPdk51aXBTelBMdXJaQ2pTSGplVUhQQ0lTRmkrRWYwMVJM?=
 =?utf-8?B?SGNXM043MWZNc1V2VXY1cEk2OFFCcitnS0w5YnRid2NMa0h4ZVE0dm5HYUx3?=
 =?utf-8?B?dUVqUjNzY1NnemFOdzFDbzg3UTdQcDhZMG8rYVh6Nzl1WHRFN3FTN0l3ZUFn?=
 =?utf-8?B?S0Q2N3RuN2NRcFA2Vk5VY3NhOEpmOStYRmo4RWZpam8yVkNpN0dvNDBVQTlH?=
 =?utf-8?B?b1dNbXprU2lMUGdScXNKZjl2b2FiRS9QbzJTcHpYdC9SWjVoMWFMQm1wMVdm?=
 =?utf-8?B?c1pERE01cDdlaW5NaXVoQW8zN2p1NURSSjl1V1NJQ0FUVlpKeHNEUS9Zb3Ay?=
 =?utf-8?B?ekoxREZYTDdOYlRVeWs1UDFMWmllR2hUTkN3NlV1Qi9iUzQ1U0JNVVRmdFkx?=
 =?utf-8?B?L2hKc1ZVZ1ljZ3F3LzhPcTZGSmtlY1pUSXJCUmFGbzlnVmg0Sk9UTVNQR3FQ?=
 =?utf-8?B?WENwNDQ3NWpZc0VPRHNlRGF0T3Q4KzRreVhLajNFS0kzM1RJNGQ1ZkdPRUdV?=
 =?utf-8?B?enNwUW04aGtrdkJlYVI0WGNpRHBMbXg3eFBhem5wOTdHTFl1Wm5EWUErRFZk?=
 =?utf-8?B?RCttVkMyOVVkSUJVcHRmbUxYdEdCRG9xbHI5RXBJMjYyZGJrYVBTNW54ZjVF?=
 =?utf-8?B?ODd2a2hnVFBzNzZyUktuYk9Ma3hFejVjNnkwZ3gyeEFDNnNpSCs5Uk1iSk1V?=
 =?utf-8?B?ZFFKbVA3QUJhN2prN2FyZG1jeTJMV1RjeG1ieThHRXMyLzYzZGpjOElqckdq?=
 =?utf-8?B?MUY1aGNhRE56MWtncnI3eEE3OGIzOWJKN01MR0JtajVmb1F4QXM1Z1dTYUJu?=
 =?utf-8?B?MjFDZjF5UVVacklMNVVPd1gxUGdyamtWU2dDMEdGTDhqYzNjMWRmMGJHOCtB?=
 =?utf-8?B?RFJ0TmtVcVpuSTliTnFXeVRLNWxpS0UycjVPWTZiMmp6QUFhdHZIZjlMQVdE?=
 =?utf-8?B?dDU4QmhreUNNbGlwOU10VmJtRzdXNWQzL2ZaY2tXaTgra2Y0SzBQZU84cGdi?=
 =?utf-8?B?aC9JaklCU0Y0NjdFMndST0lRM0VCSWl0NlU0eUVNMndRTEZHdTFaUXRPTkZK?=
 =?utf-8?B?azh5MjkwRlo4ZHJqWEdxNDhIanlYellDV3VNV1YrUlNLcjNJYVRTa3E0dTAv?=
 =?utf-8?B?SW1VZXFpZGF4d1h3TmVKSEk4b216STljUllGdmFubWxvYmhWK3FubVYycmg2?=
 =?utf-8?B?WGplbzRnS3dEVXJnMW9Sb1gxZlkxNDBxZzhLa0IxNXNvOG8zU1RhcDV6anpV?=
 =?utf-8?B?U3lVaGlkSTkvV2V5Q2VVYjd2Njhwc05rQ2dVdHE1aUZ1bWpFWjFnemhrcXZu?=
 =?utf-8?B?MGlWTm0wK1F3VkEzRHlKYURzVjhkQllKV3IzdjN5a1Fuc2tULytFbTlRUkd6?=
 =?utf-8?B?KzZxQU1FWE5iL0h2VnlLK3BtN0p6OUcrWDQvaDNZcndSVHFQYUJTQWRNOE9O?=
 =?utf-8?B?ZzFyQmkvY2V6MzVsanJEa2NvVklyMjFReklxakZ3ZU82bE1hTDZKcktFV09w?=
 =?utf-8?B?anVqdW9JVUdINGVyZU1lMHNYc2JFMVZBdFRvYnE3WHEyUmR3YkFDeVJuOGVG?=
 =?utf-8?B?WW0zcUhnYmFWdkl4N0lQcjJLZDRQK2JscUFKYnZmWWVzVjBHQUIrcU15YXY2?=
 =?utf-8?B?N2tVcmRORmNKSEorNllvSDZXdU9GMHRwajY2T1FTa3RwZnp3dWhCblRlOVJ1?=
 =?utf-8?B?TnVHb2tBSFp1dXJ1bHFDUHZaNUkvQlZLNkJmTzlPYVFKL21DY3RkeVVvY1VT?=
 =?utf-8?B?bXQzRDA1b29iTk1pQ3dqTnYxZTljNDBnejJEeTlUTmY4Qi9SUStnRkJDanBU?=
 =?utf-8?B?RURNd3ZVQnpDdldRN01jNHlWVTAwOGNLNWhRL3p6NFI2WEJGQ3AxbVFzUDZx?=
 =?utf-8?B?dXpMbFljaXM5cnB0RitmME9mREJYYTF5TDl3TTVqM1k3MlgyMEg4TG00YXR6?=
 =?utf-8?B?NGI2ZzVIMjVBZnppN3BqZm4xOTBQd3ppZUVmbzE1cW9STDAwK3hNZTdUYmh0?=
 =?utf-8?B?RmZkbXZkaDBZVXNURE5NVHg4OE81UlQ1cGlKVjE1YUgyVGhnQ08xTXYxK1Fw?=
 =?utf-8?B?RFlFMmsycXhDZEg4R0R6ZkJ3VlFEeGNYN3R4Q1N5dnBXbm5MdDk2RzR6VWh3?=
 =?utf-8?B?VyszTzBnNFdMYWh4czRZNStiRmVxRTFWOWRKK0xGNkFXVFF2ZXNSdllxLy9v?=
 =?utf-8?B?UmFMRVduejRtaG53TDFNT1hJdEQ1azBWUkkwemF1MlJUVFdUblZONkhpeDRs?=
 =?utf-8?B?dDJzc1RNOEF2di80bDVGV3lnaU4vT01yNDRJNGY2SEl1c1JkMitXUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b2cda7-5a70-4e8e-b850-08de5908b4cf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:18:26.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+vCbmjVHcr+2JJeCFo4/uw4N6gz5zeK1iJX21xFqlIf3AB8shbfE9l+IC7XjgRhdBBpkrxAbLBh2wuRj1VmtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6520

On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> Hopper, Blackwell and later require more space for the non-WPR heap.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs  | 15 ++++++++++++---
>  drivers/gpu/nova-core/fsp.rs |  2 +-
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index e697436de29a..a402a9fe86f8 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -98,6 +98,16 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>      }
>  }
> =20
> +/// Calculate non-WPR heap size based on chipset architecture.
> +/// This matches the logic used in FSP for consistency.
> +pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
> +    if chipset.needs_large_reserved_mem() {
> +        0x220000 // ~2.1MB for Hopper/Blackwell+
> +    } else {
> +        SZ_1M as u64 // 1MB for older architectures
> +    }
> +}

I think the patch that introduces the function should be merged with this o=
ne.

Best,
Gary

> +
>  pub(crate) struct FbRange(Range<u64>);
> =20
>  impl FbRange {
> @@ -238,9 +248,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>          };
> =20
>          let heap =3D {
> -            const HEAP_SIZE: u64 =3D usize_as_u64(SZ_1M);
> -
> -            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
> +            let heap_size =3D calc_non_wpr_heap_size(chipset);
> +            FbRange(wpr2.start - heap_size..wpr2.start)
>          };
> =20
>          // Calculate reserved sizes. PMU reservation is a subset of the =
total reserved size.
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 5840ab78e79f..7d46fbcc7abd 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -454,7 +454,7 @@ pub(crate) fn boot_gsp_fmc_with_signatures(
>          // frts_offset is relative to FB end: FRTS_location =3D FB_END -=
 frts_offset
>          let frts_offset =3D if !resume {
>              let mut frts_reserved_size =3D if chipset.needs_large_reserv=
ed_mem() {
> -                0x220000 // heap_size_non_wpr for Hopper/Blackwell+
> +                crate::fb::calc_non_wpr_heap_size(chipset)
>              } else {
>                  total_reserved_size
>              };

