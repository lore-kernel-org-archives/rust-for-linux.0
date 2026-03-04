Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020089.outbound.protection.outlook.com [52.101.196.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B623D6CB1;
	Wed,  4 Mar 2026 18:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650412; cv=fail; b=h8eH5X8BmWiODiCDwvrquobB0q8zRGEZHbsdG7Qw5m9B1fFupWDPfbR+FXsvtNJV+xbHaFhfp3oWKHp9IpPSAZa4W2Sl03kDPyarlmciPRjxXW/d1QQDM6StfYrQRcnIcrRn8eRpKUFG1kmqoLZPVfk2wnWJFJPb3jAvHSRvkXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650412; c=relaxed/simple;
	bh=AWxIe/zvTzCBPp1XGyMkw+r/wRUydoIxL5Iz0S3WJao=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DZJPO9E6Vc3JmqRZp0WSMzlEbnNlyAHGAiULzG0y3fllOLpLNgPvvsFN5N4NYMp+lPo1IE2ag7SYYDTq+fjQz/E3d7w1COskpGdcM0CYZMY1K+KOMUcoyjbHaE6FMcZ42IlKNqL9PbU07TiA0Kqavsp91N+nQBLa82dUGje6K+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nc6JJ4tV; arc=fail smtp.client-ip=52.101.196.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nc6JJ4tV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8h6xvHaaG/vPs5AQsf6bolPm+Zm0QwbHsX0yIIZO/H4ypm256k2IooYll1zoAdxuLp53xDQZz1/aJBI+sm9rNJCanNl1ztpUYQ0EpQrQeg6D69FDXVf7rzpKX3oFwZm8UafsSPgzwhb5w/sEHzePrNQwBkE6+kwWFEnOdjTHl3ncVEYcDFTPJa2NKkoXoQN/bopRZ/aJzIoFuMj5Wwmvmaa4TtnPR3OiAaycvnMqju2CA/Mx3vBuD85W5mnDIawacdBdUTxt/oKQJa4BTk+eKsdHtLeZSUgsO5xrG8uQlhDZax4mFDye4nnAfdiR3oAQBXNWyCZb9BF+i5GZm85ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bem057/QFwRwO2HO83CAqJP2JqkWtgILVdsQYnoFmzs=;
 b=L5uWglcdFfonavNUjGIBxlWNQhFxsGJtvUllMMugndDQmPUKQH6hAKcRgeXPorqxBH+yEAP32n8xsbuwiWwMn2dHawl+UpS7wSpfH7y5IJEclvCKoZsXc/z4A8TiTrX3w8KNAU/3UcqoEGZMrfARkhtZQnQsWgirOGTNHxFMGvKskkFvS9fDK+0StT68DVjZ/MmjIYj9ALox5Vgkas/uEz5TyQhUrTkQX/t7b1euqM5VdnJQb3dU23GMHpegJTBtPmhxQvpzoeyemvnuo0jjGbKje56UrWDO9DnGHAOt5ooV3KcYgQoKvkSej0GMgONfcX83kf79XddUtdpTv4BoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bem057/QFwRwO2HO83CAqJP2JqkWtgILVdsQYnoFmzs=;
 b=nc6JJ4tVz7jFwNtaB1hG9ewYuD+KiWyE4mJ91jDtwa87FnZW5CYIfOcrJo+5VNGYIR016d+r4i9Q7F8jcx+8Y1wq94KE5Rhx5XY3lI3czdI/2MEm6Dv0NLdKOF+efm/HYzvokguS0BY4uA6cvywdUQBVBgv9ar/wppsVHj6p0wg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3289.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:187::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 18:53:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:53:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:53:25 +0000
Message-Id: <DGU84I3ADER9.QGYTL1LSQP87@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
In-Reply-To: <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
X-ClientProxiedBy: LO2P265CA0385.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3289:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e11b60-8806-4082-607c-08de7a1f5160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	9B+knDv5qB9PocRKyFPjn5jwg/yu3tZXvoN7gB1iN9zFeh5n0YLv6T6fGw5EjrgYxnku4vi44X7/TpcSmyRkzmMfwNDJ89mEVsz9Ie2VREoDKYYz2gYg5p49VaOCprfAJPLKSyBdfLcq5MpuXQWdL/52tmSV4/e8S1azBcP9ObrHvq/2orTvzfANwCLvHXlXvhqz+JzNi4shKw8Q8osbrp4uMRmliXsU/S22OBthdAhidvS/n0U3mHNnAWPskYMsNhnFxd6Z+GUaw+DzZnE7kf0dtDRdFuzv4UP4a+zFBfv6WhCtSyuZVl2YxRaAkIN+/OgaixA+mUuNvt7DeRY/OhIly+v1fK/yh4s+BLpvB7FdC0ycvjMbla/YjUDksZOI1f0+xDKEZVwYqvc9tfjCmEKuT1bpTa0GnHHaBYLkkwXS0dqPNWmoBx805mhkEgztzPwuUNW/Ez/wk5zf4ErO9NgDTspcNv4HiOPq2QhajBVHFJrp43h5Ejh3ZV6Z2GIsAgcHIuX4EIot1iZGZ0W1NAz2urttFaaWHD956juoPokCqjqmfSROdhooGsOEtEfrFKOXeftBL9TBSAtaNtWrzzThgHbe+nbswWqtX93PpFYGddmwANCOJH4IoEKh9KK2KZeG2Lk+xDLtfF4xDTnLbamjf9UCbLC9HLsrBUi8cp1iI0rJVp0/9eaL5QkNRMVtMJfGlLviw+medFB6x/L/adicN+aCBEXjRE6kvSYXIrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW9BM0F0b2IrYnZLR3N6Sy9wVXFVR0kzd0JjRVJULzk3VVlIUTFJeFM3d0p2?=
 =?utf-8?B?UDAxTU1tazcxQnFhNlJTdHdhZFZKQ3FvY3FzcUEvNjFrNUxtbzdmZlE0dGNz?=
 =?utf-8?B?UnZSYm9QblhGNTZuMElDUXBaZFpvQVlGNGsyMkYrSTR2N0F4dGpZVENRbmRh?=
 =?utf-8?B?TCt6WVNRUWo0WjRlbjRVQ1RETjAyY1JzMWF0Zjkybm9RM3RVa05oYkQ5SnV4?=
 =?utf-8?B?OEZlWWZrRVVxc0Q2L1ZLKzE4Z2x6VVY5dWVkQjZLbU5STDRFdHdoQ0RtU1Aw?=
 =?utf-8?B?aXQvWTQ0TWY4R1M0ZkdVZWtxam9tb3kyNDRsZE9TV2JPNUNtWjF2WGVubS94?=
 =?utf-8?B?NWVFVktvY3FHOXNXenlmNjNzTExXVXFKM1FjbHFGL3JRWjNlODNuWFZhZWJu?=
 =?utf-8?B?djdSanNQZnpzaFNBSUtwTnY0a2Y4TUNuSmxubG9xS21xeTQrUittbFhFRENE?=
 =?utf-8?B?b1RlMnY4VEI1eGVoblNTRXdvUm80VTJZR2t5aU1WU2ZKOGJaL2swQnJ0eVBH?=
 =?utf-8?B?OURwekdvcjI0Y0diMDBMeis4NVV0RXFWK3YxSkNuazZ5R1ZJV0x2cG1KZGU5?=
 =?utf-8?B?T29PNUt6RjNMRDMzdEV5MFkvaFNTMUxBRWZTSXc5SjJ3ak9pcTkyT0E4UzVv?=
 =?utf-8?B?Ykp3N2RHQWY3cW9hN3NhQ3ZCVkszMmhDS3Z1MzhMZGVsWmFIRVZqUzhSUUNV?=
 =?utf-8?B?YjlrNk1XWXlBK3c2UkV6TnlROXUzcHBxVEg2SkpjazFKTUFudUNPTDRBY2ZO?=
 =?utf-8?B?UzB2NHJuQUFaZFM2Q3M3ZllDZm00eExzTnBrS1lwbTZ4czRvT0hqbmJzenJC?=
 =?utf-8?B?T29zT0NVVTdJUlRlRFJMQzVNdlA2MFlyYklacjFsaXhRK1dzM203RTBCbElQ?=
 =?utf-8?B?Y2tCNDJBM29oMzVUbm9uRGxNNEM3N21vZHFmd2FOSFNFSmZJUkUzOVk3NEFo?=
 =?utf-8?B?d3haclhLMmJFVVVNQm5HNXNSMXR2QUY3aTM1OVEvb2p0U21YQS9rbGJJcjRW?=
 =?utf-8?B?bjgwaklKRU5sL2hDbm9mWktYMmd4clBMSjlsSGRpTTUxNWJuVnhaTFIvSkRv?=
 =?utf-8?B?WW5Ca3hsbGRQa1lJZkFVM3Fscmh2bHpSakkrWll3aFBlMVd2ZVRoak1qWVNZ?=
 =?utf-8?B?NzNSTEVCWklzZ2xydU1idDViU042Y1IxVTBXdEQ4QzFZdlVVbFBLUXNpdVlM?=
 =?utf-8?B?WnRSdDA3OU1MWHVVQm94Z2FmazdLZWNtWU1iMS85OCtMaXY1eWdJaEdKak9R?=
 =?utf-8?B?T2tLUkpObk1KK0s0bUUvWVFva0dnWHJWQys4VWhqMFNkSGdTUXBGdmc3cXh3?=
 =?utf-8?B?Q1U3dEczdklXM0hjTG50Q08vNmplZ0laS2xxZWVHNWtzU0lIRUdPK2JtaWlG?=
 =?utf-8?B?QVBNcTJLaEtRWE1BMEdrZHY5YmJ4SDliYzBVVGdUNVFrbUozcVYwK080aVFx?=
 =?utf-8?B?WHgwUkR0OEFxSWJZOVByVU9aWlVieC9aSEZGbHRUeTNOUlMxV0x4SW1pQXZq?=
 =?utf-8?B?RFNNVHJMc0t0V0VFL2x5M1htVW91dUVzUXR6TjBBMVJiUWFuanoxL0QxQkNK?=
 =?utf-8?B?cXpCVmZacTl6VStqZ1VlY2s2VTJVRmhRUHhpQmFEYTZBYk9hN1ZXaHozd3hq?=
 =?utf-8?B?U0FJS3p3NzJoazYwWFpVa2VTZno3V1JjQm5KeVpBTXBxZjBSTWZMaDRBV0E5?=
 =?utf-8?B?b09WaitjQlBwdTd0b0paenF1UDRXUzczRGI3TlNUQzE1L0psUVF4ejNCVjBq?=
 =?utf-8?B?c05sdmlnQk1oYlpnM3psMVB2d3BDc3pHWDl3UTZSeUFtSlg5QTRXWjRvR1cz?=
 =?utf-8?B?V0Jqa0lMSXlFT1dmY1ZLUStFN2l5d0lvaGJMQnpRNUlDOGs3VzN1eDlFaFp0?=
 =?utf-8?B?Sm85ZmVFU1dpdWVsK0RqVG9qcUhWVTMzTE1ucG8wN2lud3NDRkR3VWxlRDNm?=
 =?utf-8?B?T1R3a2RvRkl1L2QvWXAyVSsybjEwbElPbFFUMGhQZ3lBVDgzUnd5eWpiVlZF?=
 =?utf-8?B?VmExZDBvSURoTlcrMmJYQTM1UmFKN1VmRjN5QnNIRVRFSlc5TElXbnFEQitU?=
 =?utf-8?B?SzVlcU14dk9wRmJGSktKUDJ1VHp0TUt5TEVEM0VBYi8ycG5BNHAwYUZSMzlN?=
 =?utf-8?B?ZzZ3WUx5WTBYQzFEWmI0ODlUYmptQi9aT0cvMWQxOElnVnFmK1QvRGljM25W?=
 =?utf-8?B?bE9pcklhMEFjTCs2bzltMGpWaXprT1EvMlhTWDVITFBkK3U3dG55dGhOejF1?=
 =?utf-8?B?SnY4R3VVQk1IYkRLUGkwY20xdzBTTitsZWMxbVhVNlNUMXFqS3U2VC80WUZx?=
 =?utf-8?B?TzJldS82YXJHeUc0YkliM1RIb3JkWElNcDE4dExhb0F5aEpsMUJ5UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e11b60-8806-4082-607c-08de7a1f5160
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:53:26.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWo591+q4KsR0cqUr9olxjJVMWfmNQBNzLn45X2ecb+JA9zMHYHk/BDkCg6hbQZzOlxXPe4rLk/raLLOY26FOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3289

On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>> So, to get a better idea of these two options I have converted this
>> patchset to use the 2-arguments `write_with` method. Here is the
>> difference between the two - it is particularly interesting to see how
>> nova-core changes:
>>
>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:regi=
ster_2args
>
> This looks good to me, but the fact that this turns out nicely has nothin=
g to do
> with write() now taking two arguments. I.e. there is no reason why we cou=
ldn't
> have the exact same write_with() method together with the single argument
> write() method.
>
> The contention point for me with a two arguments write() method still rem=
ains
> that the arguments are redundant.
>
> I.e. you first have the location in form of an object instance of a ZST (=
which
> in the end is just a "trick" to pass in the type itself) and then we have=
 the
> object that actually represents the entire register, describing both the
> location *and* the value.
>
> So, let's say a driver creates a register object with a custom constructo=
r
>
> 	let reset =3D regs::MyReg::reset();
>
> then the two argument approach would be
>
> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>
> whereas the single argument approach would just be
>
> 	(2) bar.write(regs::MyReg::reset());
>
> So, if I would have to write (1), I'd probably be tempted to implement a =
reset()
> function that takes the bar as argument to hide this, i.e.
>
> 	regs::MyReg::reset(bar);
>
> I also can't agree with the argument that the notation of write(loc, val)=
 - or
> write(val, loc) as the C side does it - is common and we should stick to =
it.
>
> This notation is only common because it is necessary when operating on
> primitives or when the two representing types are discrete.
>
> But this isn't the case here, a register object is already distinct in te=
rms of
> its location and value.
>
> So, unless there is a strong argument why this improves anything on the u=
ser
> side of the API, I still feel like we should keep write() as is with a si=
ngle
> argument; having an additional write_with() method seems fine though.

Another thing is that `.write(loc, value)` can also replace the all
non-`register!` APIs.

With

    impl IoLoc<u32> for usize {
        type IoType =3D u32;

        fn offset(self) -> usize { self }
    }

then you can just use `.write(offset, primitive)`. Meaning this is a more
universal API design.

Best,
Gary
