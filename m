Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021079.outbound.protection.outlook.com [52.101.100.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359941F239B;
	Mon,  5 Jan 2026 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623266; cv=fail; b=t7l6NlHm86k3CzIa3LHj6026y6l1xr3yjbW9c3prbEJKEGZp8Aad5gIWHKT3TgeQvbWUDy1E8FXci683i+jNONuHxqO7tqBP6D+IcuxJcreQeKofHhmCnKZjtnMBcyYJh8DfKfAzircbxYKYA4nRuxdIKRpryzJ+Vn47AeCjPpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623266; c=relaxed/simple;
	bh=gbylBCDmiopXnx4RIT32hNHSOnvZP3VeD8t0AsnNm2w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ixEzrknpye0AipEbsxIaAxcMDnI+Tt1/9hk03p/g11TonxgJ09ZsACietSfUO05GIPzHDBqM9kLwMj+98cgP4xVWFfCXyeX6nIr08OrM9lNFp/XZJSQRBlmEQWwa4oZGuxHQ17GmLylBt/I73rKzmW+H6GXMb8HfnpbGRSTli7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SkTXH5qs; arc=fail smtp.client-ip=52.101.100.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SkTXH5qs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yz6nnqts2V7B8T18xcF0LXOZYe2HMkEwExZYiGas4EluA+jyIsmifB6VrkaDSvShRPgfDXxvD1WsDBdlpASX4X3mL1XOhh5NZtW0HXHreMaVyFMQj1FFOTvWxxJPxfsYHBGxu+d9aDxZJAYzYseafZZh7uNcuLm5XksECVlVK2i+HEE+vvfLoS5QcHllsfGJMhmNN3bFljlSx6mwNjLgkIjIHDcO336ehUbbqUwEpI/cUad1yU9AdSQ5h9VepPY+wYPL8+Ui95j/F3JHWcHBtfyCH0lP8bLDpbdXuFi/yQbWgpuZXqXQWsu/fL5w5U6onyyT/0gq911AvOfQ/MOWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlz9u49ml907cQaLD0deouQIQqiORf9WgSTHB921coc=;
 b=b94am77p+rGh/b6Cg245SFgZsbhjOBiYN8gVyYvuv8HwsnflKD78nTRXiUF5V4Y+pS2/h384jvVL0wWp90/h7K6nL+LoE9rnozWDZ9EPPpPFmi1eQ9kowmUL/hI+k/ymFbdKdjmelzJFrLVSkL2Fdb2Cs/GKAqcyYougrHq1hDAmmdWW7qNw52jzkSDTVKQWx8dpqmn/Op+vuRrKEzEDI+zzolq5iM2lhXu8qmTqqNDxzQuh5v7cBf4BB3ufqMLpBqL6EvNzSqkWSb/zt8++K+nbnX57beKYIJWIA9Q5uJy0LSv8QLpSBHNJir7Ed/caeAbyrsx8C9IKub7GC0c8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlz9u49ml907cQaLD0deouQIQqiORf9WgSTHB921coc=;
 b=SkTXH5qseIwbJfho+X4kieSfUVi8mMkK8LSla9mbute2WEB7Str3VhPty+IryFhicMQXoxA02WE7xLG29dMs39IV0jGWdH+q61mdEHHWy7yFmzKCvnXEsCG3l/DuwOX05uDps+g9ClG4UgXJdhzKTfT8bkeoqUO2vstSitZfUTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 14:27:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 14:27:39 +0000
Date: Mon, 5 Jan 2026 14:27:33 +0000
From: Gary Guo <gary@garyguo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] rust: macros: convert `#[vtable]` macro to use
 `syn`
Message-ID: <20260105142733.3d4ecfde.gary@garyguo.net>
In-Reply-To: <CAJ-ks9nTwOvJi=5b7SLZn6ZEd9pPRPQJosnAOScEw6LJ__Un6g@mail.gmail.com>
References: <20251211185805.2835633-1-gary@kernel.org>
	<20251211185805.2835633-4-gary@kernel.org>
	<CAJ-ks9mQXP1mAYOseoUo0jbKD0FrhKOSW7ifgOUKzfrTM4WYeA@mail.gmail.com>
	<20260105021756.5df32974.gary@garyguo.net>
	<CAJ-ks9nTwOvJi=5b7SLZn6ZEd9pPRPQJosnAOScEw6LJ__Un6g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2294:EE_
X-MS-Office365-Filtering-Correlation-Id: d3209c75-acf0-45fc-4803-08de4c66944d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFZDMWpGZXZCWlpHU2xjL1I4d2FOT3YzbWZ0amV6QWdPUXN5WG9hU1A4RENY?=
 =?utf-8?B?aHYwTUxNdS8zMUtsY2pRL0JnUjJDUGZ3TXBMamhwaU9HajNDRzJiK1NqU0tT?=
 =?utf-8?B?MDdvVE1mUTNBTFdxM3o3Y29NOTBlZTRiT3VkYmwrT0hFRjRUY2ZVbjRiSWN2?=
 =?utf-8?B?SmY0Q1lhVmU3UW5QMCtKSmNGaEtNY3NLcE9mMzh1clJNNGJ3RjF4cHdzSWt6?=
 =?utf-8?B?TVJPakZoM0R0ZmRvaDdsTDllRWhWRkhmdHRKT2NzcldSK3U2NVhJd0JNa253?=
 =?utf-8?B?QXpyNmRrWmVtaG0zeFlqRXgzU1E0SXNVQ1FJNkhoSE9TR2lBQk5PU0czL24r?=
 =?utf-8?B?RGJETGtac05TYmo0TWp6ek81M09WRFB4L3dyUXZBUi85MUs3Qk9xUUZnVVRn?=
 =?utf-8?B?eFhvV0EzVzNPc1JXcEowWHpLSkJLWFBRRkhIZEQrbVQvMSt2eThWdGt6Nk02?=
 =?utf-8?B?UXpsek4xN1ZONlFMVXJHRTVFZndqalBVRjhxVWZrR2xWWlJhUERQc0pGbExv?=
 =?utf-8?B?WUdlNVd4QUtDZDZkaDE0cytSRlZrbG05YUIvbTdYaS9CRkd0VWF0d1lPd2FR?=
 =?utf-8?B?R2grMTRzYVk0RFFuRW9yNDQ0bUg1S2wzMDV2eFJqcDUxbTRBWDJ3cW5KV3lz?=
 =?utf-8?B?WGxHS291ekR2R1drWVRCWU9RWTNWQ1Q1OWhXc1BlNDVmZkZBL3JENGpnVGww?=
 =?utf-8?B?SVRCMXNDdjlDMzUyUkNGb2VlQmtDYjRnZFZHWVNjYjBZbUVEeDFuYTZMZjh2?=
 =?utf-8?B?VFZxQ00yK1l6bmdVckwvbE0ybnA3Mm8zeG83RG1qZE1yRFJ0TDRBRkZhMVU5?=
 =?utf-8?B?a1JEcTZlSHZmWi9EMHNFYzZpRVVxd29pUHd4ekFDNUJZeFF2ZHhrUGp0TzZh?=
 =?utf-8?B?eWdqWEVsWklyeFFpSW1iMnhRSGdpTzdGMjdadjBaVEM4cDRJMVNwcDdSdkV2?=
 =?utf-8?B?WEdnRDVKelpSTW9kUmY4azRxRTkzYmEvcmxBRGNxRFJIaVdjWG5wZ0RMb0Qw?=
 =?utf-8?B?c0VOdzE4azNhSTVQM0E1a3VBQU8xU0V2K3JXOE4vSk1ES1hhRHdHU2xJNXND?=
 =?utf-8?B?Vzc4VjN1RUtkRFRXOG1JQmpFaW5zenBmSks3MFhNZUM2MjNabm5UbDR3dE9a?=
 =?utf-8?B?aU9xQmx6aVNGc2NTbzRXNDJxejZqVHlDckFja09hOS84V01BN0F5cjFjOWtn?=
 =?utf-8?B?dWl2MGQ3Y3kwOHR6SHc5bWF6ZStOL3RRQzdLMUNTUndTY2JNZyt5TEtxQW1x?=
 =?utf-8?B?UGlnQWkzclAram9ndGtOaXpYbTJqQUkyUzBqM0xPeEc4eHE5WTI4ejAwNTBP?=
 =?utf-8?B?Nzg0U3ZWQThmc2g0QUVYSzFyamNsdFp0UmpsVlJnZktxVm5SRFFESXVoNUgx?=
 =?utf-8?B?ajk0K051dVlMaEFLZkZvQk1VY1Qxb21qVlVlamxsWVN5VEpkclhRWEd6aGxU?=
 =?utf-8?B?OXFrbW1ibU5sRVR3UHliNFQrTTEvZk5JSDlvUWxIcXNDUVBab0xrbUhRbFJp?=
 =?utf-8?B?KytaSlRGZjBjV2VrNE5sb3FxSklKdGE3Si9OeE1EK2xjWW9meUNta3BoN0pL?=
 =?utf-8?B?RE9zN09MUnVrNm92Z0dFbGxzVkVBWUZiaVRsMUhwRDIvdkZVejhISkpWM09H?=
 =?utf-8?B?dnorcjEza21NU3pZRzNGcGNXaGpwRGdLdWJuK0w5Qy9ERTVsdkJhU3NRQTNU?=
 =?utf-8?B?YnBYZitDejltNzZFZ1dQditNdW1HekJ4WTBxZzJTQUhhTHJLYVNMMzFob1F1?=
 =?utf-8?B?Sm52NXpIK1pMNXNBNkRIUUJLNytIQzZsRHc3Z3VCN0w1NFV3ODFuNTh4RmRM?=
 =?utf-8?B?bXh2NDBrZmxZQ0QrU1NJTElEWURFRGltZVdoTmhwMmZ4TUt2MnphSjdXK2NZ?=
 =?utf-8?B?UDZUMzN1QmRiaUsyalAyNjNnY1h1N2pyMzlYZWF2dVcvb2ZVQXpGMzg3OHpq?=
 =?utf-8?Q?q/zIy6Mqq8b5WkMVoz3sBvoBJIrB3qRE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjJlaGVxMFJZeW53T3FiUUt1d3VMeFo0REtocjdpclQvT0J1ZDhvN1FBa201?=
 =?utf-8?B?dW4xdlMxczY3bEhXR2F5ZDRjdk1mbVBpS2ROYisreXlTWGp6ZkdEQXBtelJP?=
 =?utf-8?B?NHRBZkhFU1hKNGlQTTkwZVprV2UrR0U2ZWJCLzFnam9kVXZiTlliU09vZXpl?=
 =?utf-8?B?bC9CWEgyYVNCSkRWclhhWlFpSEdtN2lKaDBpdFRRaDNhNVNyTVpGRDg2S0pj?=
 =?utf-8?B?L2R0TW13LzV0b3JpZ3VRbVIweE50YWZ2YS9hbE9iaGR4RloydHJ6cHFxRUl2?=
 =?utf-8?B?VEI0UTFqY1NVYzV3L1c0T1hZQWZRbnBBMGt4cFNVcjJIWC9VT01DOVVaWDg5?=
 =?utf-8?B?VktYN3VOZWFTYjQvUlBqL1pSVTJ6bUIrMnpZUlVuT01MM2JYMFNiemFYZUJo?=
 =?utf-8?B?OXloZUVkcHVGMEVLeDMyUWo3cjVMYzFJSWJMaEtxNngxVHhidnNSOUZrUVBD?=
 =?utf-8?B?dTc3c3Z0RU5aU2ZNSVhlM3o2TERZUE5xa3h5THZ4S2tGeGtvSE5KU2wzWFVC?=
 =?utf-8?B?UE42QllRVzBJTXNseVNVZmlNN2FLVEE5SWFlOG5VazFOc2JPdXlJSU1rd1Rh?=
 =?utf-8?B?YTk4RU02SGZCeUsxTHo5Y0xJSGxSTnZWak52ZHl3bjBMZ1RpbkE4Z2FVcjIx?=
 =?utf-8?B?SlEvaTlBL1I2ZW8wSDVpOThoWDlDWlRISXBuWG1IbnR3cHF2MjVJaWJsdHVq?=
 =?utf-8?B?TUpSaG40dExvSDNsdFcwYkZWZmZoZEZHSHNXZWN2VHFXYUh6Lzg4eEFUWEtu?=
 =?utf-8?B?K21JVUJjVWtOZHVuNlhJMURSNXc4SzdvTXplWVRjMmdjU0hiaktxUVJvdGpQ?=
 =?utf-8?B?SVE5US9kQmFPeWlUR0V1bU1wbURyUkhta3pqM0pLVVJoMDgySk4vdC9QV1pZ?=
 =?utf-8?B?WUJKSFJCRWNUM0JrTmtVS01nSmV2Zk5XWUJSdGRjbWlKaXoxR1ZLVnNlb205?=
 =?utf-8?B?MENyQ1hzaWwrT1JqbW9rNG1iV2pibmVaZ3JvQXpmTTg2WmpJU1NQckpuakF5?=
 =?utf-8?B?WGRZTEQyMDFQZVNWUGJ0bkhMSDFjVjRyWDY0VitOWTFFU0FsNHlxVFBqNWhp?=
 =?utf-8?B?MjIzTkpVY2RPUzkwRE5xK0l3ZG5ldmpUZjZsMEFqbUVoYThxS1R3Q2ZJcVpo?=
 =?utf-8?B?QlRGMkZFY3YrS0xFaityejJzeklIbzRlRm5aS0lQbFE4dGxPMmY1dkRJcThE?=
 =?utf-8?B?Y2dBeURTUVd6NWRKbEsrS1piZjExY05haDl1SXhpRy91UEdBemJSbzh0NUtU?=
 =?utf-8?B?UXdLeXhrQkp4bzRyRDRDTW1WSjkxVGJ6MTdLWHNxTXVMYXhNVVAvVGZqdTEv?=
 =?utf-8?B?bEtqdG5xd0NBMVgzSmFmSjJQN0hQanNkTHlOQ3JOc2NzM2dtdW42Uk1HNkJE?=
 =?utf-8?B?VHZoQW5YdHNjQTcvZzMzOUxrTnVsakJ2RlB6Q2VjQ0ZVaVRtTFhFajJ5TGZN?=
 =?utf-8?B?UmgxbE5nc1Z6bDJRdFM4emsvYU9BU2hnUjE1UXFBazAzc3UvT1NaT1IwNDJh?=
 =?utf-8?B?bmpEMzNXcTh4TjVEdnJ6QWNJK0hLcGFkRm1LMkxHMmJOaVBtYmVhRTNIUmdy?=
 =?utf-8?B?Z1MwWi9XYVk0SHVjQUs2SVFLNWpGSWhVVnhjTWtMakJNRks0RmFLU1lPSWN5?=
 =?utf-8?B?V2w2Mk01NGhBMWtyNVNmUVJHcERBTXRPQVF0Z3FFVEVQOE5qdmpYd2ZxZWNy?=
 =?utf-8?B?elR2YUxaVzJDbUNJQlFVS0VKVk11U3ExYmVkL2g0VzNvcDhzRDRxaGFIc2hJ?=
 =?utf-8?B?a3VWZ1JWMGF5YVRSSFUxK1F5UThjVGoyUENSRlA1VDYzd3FTdkVQS0hQVXF2?=
 =?utf-8?B?bnBJQlM2eUxpaVZub3dwS2Yra2w4UEQwNW5Ed1ltTEluTkU1ZER3OUYrMUlx?=
 =?utf-8?B?MGxNK1NJUDVtV09FY1NGR200RTJHREZodEppNkhHV0Q5QlBZeGNZNlgrZlZW?=
 =?utf-8?B?MFFqSHVjdk40aFY1SEE0SUw4NVRXMXdSckd5T3Jjdk9TMS82SElsdmRoMDdY?=
 =?utf-8?B?N0tWVHJzdjVlTXRMMjJOUGFnVi9uU3JzSERGejRiVWdJUGlDYkpNbDYxZ1Fr?=
 =?utf-8?B?aG5kUUhhUGRGQm9DaGN3YlRoR0JpRGtveUhtQUk5VXVBRmpNVTRtdEd2bkk2?=
 =?utf-8?B?K2VYRmpxYlhCenNkbkNyU1o2WEVYMlNsN1JWTWdzVlZrVHNOa0hUcUdzSU4r?=
 =?utf-8?B?NS9aOXgyQ1IybWxkdWd2TmJJaStPdXRtOWErTkVKVE1ld09FQzNtV3c5aXRH?=
 =?utf-8?B?V3psaG9ETEtQMDYxY1lBQ2FyUVFmTitvQkRSOElIZThjUUdQZnBXa0ZxS2ZI?=
 =?utf-8?B?T0ZmYk9Za2pJaTZiQlZ4czBEeVVsRVlOS2lSdHM3R1cwTEVzUEF0dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d3209c75-acf0-45fc-4803-08de4c66944d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 14:27:39.2666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdjQX5RcfNslgCtDO+QimjC4vCcvDNzNk1fClWuTOA/9NAk/ERon4MS43f38HMy9lbEODXDXIydoOTxqArTfOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2294

On Mon, 5 Jan 2026 06:02:35 -0500
Tamir Duberstein <tamird@gmail.com> wrote:

> On Sun, Jan 4, 2026 at 9:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
> >
> > On Sun, 4 Jan 2026 18:44:43 -0500
> > Tamir Duberstein <tamird@gmail.com> wrote:
> > =20
> > > On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wr=
ote: =20
> > > >
> > > > From: Gary Guo <gary@garyguo.net>
> > > >
> > > > `#[vtable]` is converted to use syn. This is more robust than the
> > > > previous heuristic-based searching of defined methods and functions=
.
> > > >
> > > > When doing so, the trait and impl are split into two code paths as =
the
> > > > types are distinct when parsed by `syn`.
> > > >
> > > > Signed-off-by: Gary Guo <gary@garyguo.net> =20
> > >
> > > Logic looks correct, but the duplication between handle_trait and
> > > handle_impl is unfortunate. I golfed on this a bit, see if you like
> > > it: https://github.com/tamird/linux/commit/8354c5a48769f5e1e52963d19c=
a57c31e5926b08. =20
> >
> > I very much prefer the code to be separate. The trait and impl *should*
> > be different. It's just that they *look* similar.
> >
> > Defining
> >
> >         const HAS_FOO: bool =3D false;
> >
> > in trait is defining a new contract while providing *default* value,
> > while
> >
> >         const HAS_FOO: bool =3D true;
> >
> > is implementing such contract with a specific value. They look the
> > same but I think the way `syn` treats them differently is justified. =20
>=20
> Yes, the similarity is perhaps superficial, but the duplication in the
> current patch goes a good bit further because all the surrounding
> ceremony is also duplicated.

What do you mean? The only code that is really duplicated is the gathering
of names from items (which have to be duplicate due to type difference
anyway, and they're still duplicate in your linked commit above.

>=20
> >
> > I think the fact that existing code has a boolean and do different
> > things based on it is a good enough supporting reason to handle
> > different code path.
> >
> > For some new `vtable` features that I am working on would require quite
> > different impl between the two. =20
>=20
> It seems unusual to justify current changes with future changes.

I gave both reasons that why I think it should be distinct code path today
and also why I prefer it to be it for the future. I did not justify the
current change with future changes.

