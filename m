Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D898065192;
	Wed, 30 Sep 2026 00:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790728424; cv=fail; b=dmZe0X+Q79fJzFHxd3VtKJ5YvbuJQw1WgBSRvSc8ztCKSmZYUL2Mx2DvafRozQJcYK+huOcZB9t497BrOihOv9OIGr1Tk0kb/lnKTDQRrCWiM0DuMxqqXgAFTX7vaHm3SC3cjPCb/Be/nUa/W48Tblo7nKt7ghXSXLDTJs7hfbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790728424; c=relaxed/simple;
	bh=vGVVXBaaOBOASmOVmfwpVMvuw62L6c9EYBqtMSUyHRw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=lC4ko9ca2xsrMMRjRjz0UOXHpsoywXPU47voFuHwRY66FEx12tAdjdxGXkhgSx6IgmQd5fPFOxq1uNMwNj9RWCKAUXAX/4cICbY3roOFA7MB+rzEVkl/Bv4WaQmEKxHBDGRdCDyw3vZTR6mcrrM+w7y9pQfhD3HST9AAKIUDZNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CPd7PrAi; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CPd7PrAi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnhCivoGej396mNxsTl1uesb1x38uTKGG9cTBbuR5+Nu1w77Bs7OkYDy8hJBqNuVfTLpuKPoNTVRfRt/pBYJJT2/XJSgatdwJdzDbxxxqUKO8ELT9TrPGVl9vLs/wFagqRmyjNaCNwDSllxKh1SvWkZtKCgEaBly40WgUgMsAsYClMnVP7xNM0gImBH7p7ZBQPcw3uFiJNyOfHVmkANxLtSLbYbugMCvf97MaqKvS8pItMwxhYEyi7KtrQrgvECRno8QJQjcS5xwAkbJZGP6GXgQ7fPXe5zu157Wn+dLz4BRBBRH07l7KBM9AqoPumfwMCvpT9ijqg/1WgkIMwbnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGiXDqvOZytgHG7Fb2ItSSM4SrBNJmIHpIINbmuApHE=;
 b=zINL/MCPkLK8t1RXeKGnGL4yJoir4bCLf3nRUCsQWY67Txr1PawEt9LZxXsqRqycAXCR2t2M/EHEmATBMEhgnM4wcaQFFTqlqgO6An7y+X11zni0J01HIq/5x+t55utlC8rAgKVNOSASmwAXjf8BYVo8OAloD3DEs0/1J2hzdOzXejlHTQfNSJ5HMtJDmqY9ik9D3sN9wBcTAbuzpwc3105NoWQ3fW0MJO/Z7lhO/wJUtiZd4jZV1hKxKTeJU7Vy0c6Ic8bf5dncURVHNkDWiCOZWHIDN0GNDG92hvW/KLNAusZDtAbbg8+Ja3bbjqe9pi6mXrgnlYW9BybdqtsCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGiXDqvOZytgHG7Fb2ItSSM4SrBNJmIHpIINbmuApHE=;
 b=CPd7PrAi97PWZH111kvpjGxj2Fd6X/j6Wbp3TYUTQey7X4zLP2fiwi8LjxkC6YdTKPrz+gyUJgayfIrrJb2ym9WXbPfHAQnLnIlu4jr4EXEOku3ln/lWzDVxVudBJK0DR6BilVOoaYFz2TKqoQgYsrFwFbuiYrlSFKhC8ptEohjEtj5WXLoZsavxwB4PwmfxZUgAnsPyvB+KhAYS95MsaU2zi++O43EUd9Ix9yzKSTC7v1vSd7DjoUe2uPWWW1zDB8f2B/QwKTMFieajJLLkBahiZ67003M+tsL1RouSgspklBlND/eTegxEEFAdtGzjRhZ3JA8I92yJaa7dSYHe1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 00:33:38 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 00:33:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 09:33:35 +0900
Message-Id: <DLS88T4UM8Z6.C388FEY1VTRW@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] rust: pin-init: internal: init: allow reborrow of
 `Pin<&mut T>` bindings
References: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
 <20260928-dev-pin-init-sync-v1-1-e591c8e9cf0e@garyguo.net>
In-Reply-To: <20260928-dev-pin-init-sync-v1-1-e591c8e9cf0e@garyguo.net>
X-ClientProxiedBy: TY4P286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9f32d4-84cb-4bd9-f8cf-08df1e8a7817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|22082099003|18002099003|4143699003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SUGeVpfReDeOkdypzK4YHxjqy7RYQhbPqv6RiioS6BpSDDV/XtBEMSfSS1yR+1w5w1EnocDvcyWrbcnS21KrQsx9saKTTFnG87r9JrZCJ+IwhbgOrE1i82JwIiVO0ZdVNjEPj4lWwo4hB3UeL585AKZCh6RxTbygxGJEdNukUcR+S2x5jYl79m5wXEVYPyMqgZ/Tf23lrDT705DPmTrnjQoCXS9EFc9XNIc3J8ofOi/2yvD75ZLox8ViTblJR8qQdfNNpu5+m47ISBinMZpp6h4hNOwOJcg6THYGaXuXkZT3yXKDV8Bilk4h/mGxqa6brkbf0rBzdwz+PepTCsVglFKSWK+/7NPiCLuelFx6fOtpRt5JEem9nKNfJHG08EBEJFHODKa9S3szlCBO9Dj4nNTQt/j2ap1EQu2mEv85bofERe69ze3nFL6oHtqNi1nACDM2CYlozI6Q3oJQq+WmW0Gln1MdTHrL0qX/B+SipwzzWYnyolowJQJ3OBswnYqTj64OuIOCdz8wI28/B0xoRpkLNAiRKjiiy4zJ05NjAIHGHd5nB6mq8O1CnGOI465FjElqKlbKGAqAqbKO4Ed9rw5XksQQELOdWAB8IvTdupM1QYoP0fH2j35a62B/HFD3xZRSBYi8us19hImNO2JVoAlTwxbqmpgBPZfWyDk/Doo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFdUcUl3eSt1UFk3L3A3NmRkVEhySEVSQWc3Q0wxcmc5ektWOFl6ZktZR2ll?=
 =?utf-8?B?bHJmK1ExVkY2cmh5ZWZnQ0lSQ2Uwa2xXZVl2RERmSmVYSEVaNDJHRERicTJS?=
 =?utf-8?B?TUo0ZTRvRFVCdW93M3c4VjIwdjk5dmFyVnFHZnN3blE5eGQ3WGVtYWd6NFF4?=
 =?utf-8?B?VFkvMmswR2J5aWRHZ2FXRloyOURHdzRmTUJPOVg3UDI5TmVlSEFYSGpHdWxp?=
 =?utf-8?B?TWdPVXdSWEZWM09pV0VwSnU1MURmZVdOSDhTOHd0eDc0eHJZMnVTaElubjZj?=
 =?utf-8?B?MjJJWUZKRlh6Qlhrb0hjVnJTdHkzb3cwNEdYU2RkZkRNRGF5RUpObCtWdDlx?=
 =?utf-8?B?U0t4WTRHMGo3RHg4MU9yU1BSOCtoMjM1OXcrNS9WdExyZytURkVEMldhUUN3?=
 =?utf-8?B?T3lGRU16ZzlyTjBxN2NqaHl2ZkVia0laT2V0cFpnZERjeU9QQ0ZxZVhwdVhL?=
 =?utf-8?B?eUxUaEZ6OVJPbTJxS1hTVU9Tc3MzTjFvMnhFK1VaYXJwSEc2by9aUCs3ajBt?=
 =?utf-8?B?aXc0WlFjc3M5K1VGNVNyMWJ3WDJnM1o4bzlMRCs3RTZhM1FLa3N4VzJuOE4v?=
 =?utf-8?B?bjRyN2lPNUpRNm5VTmtaU1lZSmlTNkk5dTNUSjAzbXVXT1hZejJRZ1NxamhG?=
 =?utf-8?B?ejIwcjl5VEpjQzhTQTlZR0lGdmRibVgycG9qZlpKcjQxa1MrNDh5ZThjWk1F?=
 =?utf-8?B?dXhSelNkaFFKc3ZwZDJkNzQ4LzM5SEU1aDJ6ejMyU05LVDAvOXl1Wmd3U29m?=
 =?utf-8?B?V3o5OStUMTFiWGhaUVMvM1ptWWJOeTV5T2kwTEZMY1UwTXRReVpvOGNrbFRs?=
 =?utf-8?B?NDNBZ0xmU1lpY29UQlplRWZiSUtrVWNaN1o5RFdBMXZrQ3RwQVpzSHVoYm8z?=
 =?utf-8?B?VENENU8xa24zZno1ZUNNNk91L2J2amloZDlxOUNxVDl0dENGdFdCdS8zNFVY?=
 =?utf-8?B?OUpCU1Q1YW91VTBOcW9MR0lrd3RRazdSMWxxVllRa1BlbGh2OGl0RXlyMzRy?=
 =?utf-8?B?amZrM0RjL3JzTXpPNDVPbzdnVk9xSmg5d3BZNzBuSW04QjZSdTdPSkNZWmFV?=
 =?utf-8?B?ejFsL3d6QktkNTNmZnRtSll5aEFpRjZvWHBxMWowa0JQMjBwOTdMMkFGRlU5?=
 =?utf-8?B?aStpUHBXUFBibm1jQmFnWXEzdlVic042WkMzbVRqak9OSEpZZE8zQWRtMmxn?=
 =?utf-8?B?UjVma3VRRDk2WmpOcW9rYXV6S1lFcThHYmh0ajFvR2xOdWNhdzAycFpuZDN5?=
 =?utf-8?B?TVcxN2Y4cDFmbDkydytJMjFYT2xaVGYvZHNyMlRtc0pLNFZveG56cng2cUhW?=
 =?utf-8?B?NURtTEY0cFJMOUtVaDlXaTEweVRWQWFXeGN4eEpMQmZvRmRvUFArZ1k4MC9S?=
 =?utf-8?B?UHFqSWd0RUFZZjBsL1dncklzVldrUUZKRitsK0JySnRReUtvVEx0Nm9aNEM2?=
 =?utf-8?B?cHZLUFN1alNQMGsvcmRacUZsVVE4c1JKcXlTTllKRlBKcHlpSksxTXFsdlIw?=
 =?utf-8?B?dVdHb1hML1hLTEE5TEFZSzVGL2poNWM0N0xtRHBKZ2hpSVNJaVd4OU9WTDlZ?=
 =?utf-8?B?NGcvNG9heWgwcVB0T0NaWFVORkNLVnFmdm9QY2E4UDVBdzJpajZyY1pKUVhs?=
 =?utf-8?B?SVFSWkpNenFUOE43aXZGKy9wTW1hdTNVRTY4K0dZaGVaSnhDalBudTVSUHhm?=
 =?utf-8?B?MXVOeDdIUTFHdEdOcHhhMjlVVHBCZXpkYTAvWnRGMC91WU9ROEx3MGY5OU5U?=
 =?utf-8?B?T01rUUlnYUphWjJ6b3UzWDV5NmVWSEFOMEhHQTFURkc5Tzk4eUxPRmdOYWZX?=
 =?utf-8?B?dGpFUjZ1L0RtRjY2ZXBRbVcybW5hejQyRjlDa1lzVlZpZWxTUVZ3MzZkMmVB?=
 =?utf-8?B?dU9HNGtpSjBuTUhhWGpycUk5VFo0R01iK2h0RU9XREorN1BhY3EyckxJVFVt?=
 =?utf-8?B?a2NZNkpteE12dm1FSnRPUm1iL1JmbnphS3MvK0I2aVRML0lZcHRWRGZPdWg5?=
 =?utf-8?B?MTJ5MXZkbFNXOHllOW1QL1VOcXpFbkd6aXlZNGxGNlM4VTBackNtdXJIK00v?=
 =?utf-8?B?a05qQmIzVExVL05lTExrNVF0V3lUWEp3Uy9KVTFHMFRSdnBKNnBYRnd2TE9V?=
 =?utf-8?B?eFlmNDdIa1U2c0RWUDRiS1lLam0zQXZCaytLVVk3NmkyNExGZ2dkRzNVa1dU?=
 =?utf-8?B?S1gxQjhjNjU2UWNiRGkyWmI5K3EyQmNwcVNwNGNJQWZCTnNRZEtPZm4yVExG?=
 =?utf-8?B?OExLTjIyTnBTaUZDVFJ0Zk5aYndGMkcvMVNIWmVCY3FCMmkrK3NsMXdmazFv?=
 =?utf-8?B?SU8yYzh0Tjg3ejFCQjBYMkJCZnB6TlRZMFVRKzh5UzFPUEVaUFkvSHVhanJi?=
 =?utf-8?Q?JZCgAs/UBCGxh70O9qEqj7gj7j4xvCInwHD4W/beYCzq/?=
X-MS-Exchange-AntiSpam-MessageData-1: V0gyW3Y/Pjr7eQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9f32d4-84cb-4bd9-f8cf-08df1e8a7817
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 00:33:38.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LNFM3ZWKikm0dG/t4gQzUTcbQ3DCjiNQ4o2wVH+RhLMR+o6q+YxLMu7r5gQt14vsij4gF37wKxBm1e9lzIU4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA

On Tue Sep 29, 2026 at 2:32 AM JST, Gary Guo wrote:
> Use `let mut` for created bindings of initialized field, so `Pin<&mut T>`
> bindings may be reborrowed in subsequent initializers or code blocks.
>
> Without `let mut`, attempt to reborrow can produce error (and also a
> confusing fix):
>
>     error[E0596]: cannot borrow `gpu` as mutable, as it is not declared a=
s mutable
>        --> drivers/gpu/nova-core/driver.rs:129:17
>         |
>     129 |                 gpu.as_mut().run_selftests(pdev);
>         |                 ^^^ cannot borrow as mutable
>         |
>     help: consider changing this to be mutable                           =
                                                                           =
                                                                           =
 |
>     119 |             mut gpu <- Gpu::new(
>         |             +++
>
>     error: aborting due to 1 previous error
>
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Closes: https://lore.kernel.org/nova-gpu/DLQXWXRP3P1J.28SLFOJJQ2EDK@kerne=
l.org/
> Signed-off-by: Gary Guo <gary@garyguo.net>

I've hit this issue a couple of times already, so it's a very welcome
change!

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
