Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022102.outbound.protection.outlook.com [52.101.96.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7B23542F2;
	Wed, 28 Jan 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607068; cv=fail; b=FZgfOr/rWbuSnRjqegNvw78p2hVOPOWJPnVBo8YczeJvW3ACiTyG/06wvyYhrKg2AD4On7nfIOcB3HIGM5+YTrLLMTo2mD+7vjNhHPWvNVFbAFoV3JKj3qs5tZicbW+jWQizbqz2E58WGX0PU1uRjJ9uE1Tsq4ZDU3Pwb28/djg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607068; c=relaxed/simple;
	bh=hqmSaeuZTMrhbSxrYFhiM8P3mv2ZHL5VoHxcmHEy2Lk=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=DM61QgHwxgdrORiIVADin6vbmC4GJUW22Sy21Ow4sFdfg+8Ky0UA8jkDD2uF26XvRBe+sroZBYGLr62XSROG69x9mLA16JZbX5TWzbjYZ05w1hiv30mHxXIA/ZlxIRvuTnHyWacDwzvdZ/b1IaBfTr0JVKBKFOLSyPtRfYaT9zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n4t1bTA2; arc=fail smtp.client-ip=52.101.96.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n4t1bTA2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYKqIxXBhkjkvHhkeYNqURPUFrtcQIKijhDhQ+/2VsN8jy8ec5c1n6q/B/5Qp3hCDcubyWsv7qaNOsq5/lEYZ+T5PhM4mZfmBVM3m+OzB0a2E4+B9aKcC6d+T2kOsv3EWuirbfe1bzr1ClZdvNbqQE7sHbstQ4p3gG5ONSFwuF+ersHQzG7w0/xl7+6iWgDOZh6p0fQDDmobTp2UI8M8DIORkJ4FQS8ZRMR7Lh5VAfYucW2WZ3PyDTG16OwHFZ7/fNCqRItNPIXdz+cdV7apJpO6M0eQVUxhgji0d0iBmc0RmmmQLwv/wLywud8UoKIToHDVs/V6ENirqOZd9nakrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCKLJ6uinYhk/7da3OMfNhK+0YreNEOH1b/QHp9nX4w=;
 b=px1skiiTCgA6ZgT7zN/fh+SvT+aGicsdP3BmMSbLivUMlfaiDNh706eiFcoKmqShf9VOXyhKFYQJkkOdGZdgd0SnIU2gaOwjmVxujFKwZe3MaRa/tPVlzwr5PV/6DvPLGiedI4hKesXWpzDDUF6LGa8SQ6ocH5caDjGeepOmNaTn3E8c+EvHbjNa4vCGPFXS2Ic75gAcVDC0mlDh/7GEaTW7AbRXZ53xIJh+80Fh4uznva3ndl9aA0JQl+1h1LvkEqvK3ZlqhKp5KIC7EB03GRpY8Qt+viENQap9ij8tL2ADnAcRFlwCgXPRBnsj503vcJ3gfV0bt6cxpYn4/znzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCKLJ6uinYhk/7da3OMfNhK+0YreNEOH1b/QHp9nX4w=;
 b=n4t1bTA2TwYH+6oaA6rGMAbactqzexfUP4nOFuuJCiVoX/jlZlj1C4o5TnPipqVDwhECOe0NsNYvdCbg7cVt9+/qfIWrhREx8pxdGSnvXQcuGiAwWibAU1WP9X+UeEd529B8BzUz4JuZHaRBGoBsi08jmlyfovtYPo2iqliu/Kc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2146.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:65::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 13:30:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 13:30:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 13:30:48 +0000
Message-Id: <DG09CF1T9SQA.2LKBUV75ZPS1P@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: page: add `from_raw()`
X-Mailer: aerc 0.21.0
References: <20260128-page-from-raw-v1-1-b837bd3e0545@kernel.org>
In-Reply-To: <20260128-page-from-raw-v1-1-b837bd3e0545@kernel.org>
X-ClientProxiedBy: LO4P123CA0359.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2146:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bee4e6-49c4-43b1-0b4b-08de5e7172e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHBnRnZ6UFZVM3ZHNjlVUWRCNlBGWThMRGtSK1FRcHY5bXUwZHJLSVJmY2dI?=
 =?utf-8?B?VEU4MUJsV2pvSW5GVTdUQi9BdG9DaU5ZUHBEa2s4cVFNaWRISDdUWHgrckNH?=
 =?utf-8?B?S2I1SHdDb0xDamJYWXlpZ1BDcGhjMittSWRkZDJ0bE1qVWxhbDh3MDBoQkp4?=
 =?utf-8?B?Y0lxSVhxSS90SURZNlBPcjhxQjR6TU9UcVpqak43YVpZN2RVZWJzaUkzOHVX?=
 =?utf-8?B?b05YeEg3SFN1enMzbWdqMUtkK0FLZ0NhSmlNdHh0T3c2RjBLNFZsdnZ1SWR6?=
 =?utf-8?B?MmNzY2RUMHluemhpM3dlNmdGRFZvNGtjU0xOZUY2Q3hPMDJPZzZZcUpxTzNP?=
 =?utf-8?B?QzRVQ3dqSXJ1YjUxZFFXaVU1L25jQkxYcnlyZkZHS0xqYm9xeFRYM3laVkR5?=
 =?utf-8?B?dFlUdlBUUncyVGJFQk1QRFQ1M1cwcXVQbzQvZW1iZSsyZFZqZW9CS2NBZTdi?=
 =?utf-8?B?Q0hkMDhKWjRhcWVVSWVTdU5MOUFLRjVWMW1kckN4a2tvRXF3VnppbWhHT2xk?=
 =?utf-8?B?NzhhZ2tWWG5pSWJMa3lCR201Y295akNMSFQ3bFdKbkMxZlducHBGQ3pjVEpa?=
 =?utf-8?B?VGxTL1FZNTVHZ3hkNjVHVEIxdlFtZ0FqZ1ZhSFMvVU5CM0R5Q1g3NExWVmcw?=
 =?utf-8?B?eU1SOUdHSGUweTY0c2lTV20zbDNsWG1SaFgxWkF1MHdUUm15bXVYaWhlUjha?=
 =?utf-8?B?TU5vS3JEbnFNc1pad1dKZUthWnd3RnVWanJWTVZUMy9mQlNhTzVacXhvRmlm?=
 =?utf-8?B?Qjh0aUtCVTlzdkE2MEYvZjAyS3JNRmNsbHJZYVF2SVdaMzg5U0o4QlZadWNX?=
 =?utf-8?B?MXZQL09vbVl0Z0o1ZW5hS3lsWWRxR2dhZVJFVHdOc0NTZFcweXIyQmNBKzZL?=
 =?utf-8?B?KzdXYm1NQ0FjR2ovZ21hampDMXlFZWFxTXV2U2VUUTE3UlBiK01VRnU0TWxr?=
 =?utf-8?B?MTFtWGNSMlN1a2JISzVoRFI5OGZtOU5NU1F4dVZFa1p4VUhKQVA1WW1VOVVa?=
 =?utf-8?B?dkdKYmN5SEdRMTNRWDkxYzNFeTc3dGh1dktRbzEvTER6VU1hbGVNU0ttSVBr?=
 =?utf-8?B?QjhESUVxczJLaWZEbFdjK1p6M0xXeGIwZzZ5dzl1NC85WVZ3aGVhUlRHMTJF?=
 =?utf-8?B?bXltRWZ5c0xlZGl4b1kyejZ3N1RIdzVLQ1lkcUtVSThqWU4vWHNEQW5tNXgx?=
 =?utf-8?B?UEl0RnhKMjBuRkYxcVQvRFRScVYwb3pLQkJEOHhXUnZkcmJzemdhR2x5VjFK?=
 =?utf-8?B?SkYxaC85UFRtUXp0WWs1cUZCaHdVdEdmQ0RiNFhGTG1ZYXphbFdxbDk0QVd1?=
 =?utf-8?B?YlpaTDZCclRiY1dLbHduMVVCN0RWMzBGTEZVei9yclZmZEEzQ09CVVpILzVN?=
 =?utf-8?B?N05kM05uZDcyZzV5cUVtZTF2YnpkdWt4WWJvdUxwNjRScHZQamxZQ091bmNZ?=
 =?utf-8?B?ODVyZTVJaVRxK0UvTlVmUHVaS3EyN2Q0TDlWUW9pYWxvdkNzUlBWbFJPNkhI?=
 =?utf-8?B?d3hhSmlvanpkdjA1RzRvUURxQ3BtbzNlZ2ljeHVPSmtOOWsxaEdnMVNLcWRx?=
 =?utf-8?B?K01zYjk5cXVncHE5ZkY2Z1dhbkRiQXZYS3hNV3dud24rTXJOVThUb1BudGpq?=
 =?utf-8?B?OGYrUEluWjdaaWxNRGZwbTV0Vk5qczdJUGp5WDk0K0hPS3hrK211MnZHQnhw?=
 =?utf-8?B?MG5tOGlWZXFSM25uVWVTWHNtVy83OHAvczljUmkvdElUU0E0M0QrU2NRMlZa?=
 =?utf-8?B?ZlhMTHRFaHhCR1BrYmV3S1VBYStrQmNqQ2ZSdldCVWR4V1dqQktLdTd1Vm1y?=
 =?utf-8?B?SkdqVUEvNGJqa3lHVFVQeVZXM2ZZZXFKeER0YU1oTXlleWhzcU1vanp2TFNS?=
 =?utf-8?B?Q1Vvb3B6UVdvK2N5NlA4clZuUXd3WHNYNE5SZVJkN1FTcEh3SWo5TTdCTVNU?=
 =?utf-8?B?OEtCamxCSFVXWFEvZFlhZXdWY2lkVTVteStyUDAyd0NDT0dPRWMxZjdZUTZ2?=
 =?utf-8?B?Z1NNMC81cnltM212ZE9WWkRUL0huMUROSjFoRkFEay9Gc080MGprL1V5QXhF?=
 =?utf-8?B?VHI1bHkzZUZGM1ZxYThFV3kwVGZKTlAwenB0dEdUbkVOUjRlN1k4SVJRQTZw?=
 =?utf-8?B?OVBoNTRFUXJqdHUyaW5EbThIU1M4VFJzMkE3R2NuSUcxL0VRQlNHeHAyZHV4?=
 =?utf-8?B?WGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVRWdUlPNHM1UkZWOUkyUjMvL0lSWHRuU01qWC9EMnE2RVBwcUJPOVlVMG14?=
 =?utf-8?B?UFpnYzdIeGJKYjNZaHdxWWYxdHlSVG84R1RHVTk5SUNvemVpOXUvSi8zVnk5?=
 =?utf-8?B?MGUrR0tlVmdJc3BpakZoUXczVjZwck1XcmhpUFgzQ2FHWDE3VGx6Vlo2dVJK?=
 =?utf-8?B?L1ltZGY5bzk2S2xhdnhvdGFORU9tb1JQY1A3bGRhSE0zWHNKV1p3bFVFUTVl?=
 =?utf-8?B?UXRZd2xlZjZZZjdJeEZZSWpCV3hIQkxqamJ2b1A1YWI4WWFBTEJXeERkNWdV?=
 =?utf-8?B?cFdYS2N3YUVLb0pCSzVjODlvNDF5ZzRjS3FocEE0MlIxdUNLaExHSTMzSTFN?=
 =?utf-8?B?enNicThzaXMxTm9UQ0h4R0Z2OXlOUVdLYXpNZURtZHJTUS8zSy82ZXZidXJG?=
 =?utf-8?B?cUNWVHE2QXRPdHNiYjNqRGk2VjZBU080dXVXTVoxSHErU1JwWi9qdHN1aDU0?=
 =?utf-8?B?QzZFZG5hQWJUdWhoT2xSRmdFRkxvM21PNVU2ZndUWXJyZmJvRUxYUWg2SFE5?=
 =?utf-8?B?ZmtCaDhFakVjZnJvZFJ2NHBCL2x5TGxKRlNyNUdsa1pZOCtFVU9pRGl0UW1P?=
 =?utf-8?B?STEydHdYYzlVbURyQk5Zb0dCSmdwSUpSV0U5M29VR0JkcnVHUmJzcHM5a2JY?=
 =?utf-8?B?M21nbXhtOEROTFJWSjMyT1FaUzFPcDdpdUdGckd5aEQweDcxSWlmazFHTEdr?=
 =?utf-8?B?OXdncFVzSEdLNGFGNHRNeHJGdGIwQzFudGNBYUtseWhKdFhzT0NaQUl5V2Fo?=
 =?utf-8?B?ZUI0ck5TZEdPd1p5YlE0N25mL1BoTVg2bDBQWTZ3eWQrMXlIejYxOFdJUmt6?=
 =?utf-8?B?bFptN1ZHUC9aanRqZlAyQkJFakFiY21qek12YWJDTnhVRW5qUTRFWVhISkNS?=
 =?utf-8?B?OXBnWHFzZXJLelBuS1gya3Fhb1kxZzlXTk1ZVmxiRHo0aXNQSmsraW9OR1ZG?=
 =?utf-8?B?K0wwMEx5QllYeGF5SnlRSG9rblZCdkNHOUducnFlcFlNZ09BYzBVZ0RVZFVU?=
 =?utf-8?B?YUlaM0dJdURrV3E5bGtWMXJjU1JKeksvRzdKSEhaOEpMOHRTRFpLWW5NbXRG?=
 =?utf-8?B?a2FQbnlwTnVuRUdUVU9RbG5RbGt0bHBDMk5iWHFVYjhtT2VuL0ZPckpmVDBm?=
 =?utf-8?B?OGR2clllQVNOMnk3WndqMmtYZHFZZDE2QXhMci9pM2wwaStBNmwyN09WcG1q?=
 =?utf-8?B?eFUyYjhXVmtteGIyamduaUZxQldVUnJSZmZDaE81OHR6b0VHV0FWNHdXYkdz?=
 =?utf-8?B?QzBFeEtNNzRVYmFJUDhzSjA4Zmx6S1NjQmJlemhCdHFLT29meHd2Smo5SHVx?=
 =?utf-8?B?Y2lrbjNPMGt4QmI3NmordndjZm16M0NiOSszTTNoYkRYZVJQNG9OTkZNZW5N?=
 =?utf-8?B?dTcxRFFGKys2ZkJxcXlJai91UVB5d0p1dVVGcGJzcU5CcWw5Z3R2U2Zzc1U2?=
 =?utf-8?B?U3VHNlorMHIwN2FMUTBSLzZaeGNOaFIxNUh5RkxtdmEyck5mYzR1RHdzVzR6?=
 =?utf-8?B?bEh6MCs4Mlc1bHBocWxIVFFuc2FXRXlvRlBaS2tGSHQycGt5RHRGUkJSQk9B?=
 =?utf-8?B?R0FQajBEZXFaWkpBM1F1RExYc0hYVnJEVGhwRjdWTkI1aXFZQnVsZGxpK0Yz?=
 =?utf-8?B?UTVoWDl1czZjWHYxOGxQUTZydUdyOWJHRGEvWFcxZHhHTFp1eWdnZUkwOGFr?=
 =?utf-8?B?NHZ0REsxVjBLQ3A3VGpZUUVCVG41aGpERkV0REJQbTJGdnExYTlXcWNkN2hT?=
 =?utf-8?B?eTR1Z0J3cGZRSk9mbUNYRTd0L1hQU083NGZHSXlMTGNONkNoUHZUYU1OQU42?=
 =?utf-8?B?YlJQUWJDVUZieC9kTmYvZXJDTkcrcmRWbzAvejlFSlJZbGN0YWdDOFkxaXJ5?=
 =?utf-8?B?UWVyWU4xS2F4Q0FHU3FFK3F3dXZmQ0NLQ29halRDMlRidXU1eUs0dzNzQm9k?=
 =?utf-8?B?SGwvWVpRSTRzVi96QTNtV2p0ZjVyUDRNczRlTVNkZkxzNWsyejk3NW9QV2po?=
 =?utf-8?B?cDJKTWlObThoY28rUlIwV25KcW1DcjFtYWp6UlkzZ2VkQ0t5czgzS0YrK1lU?=
 =?utf-8?B?TFNiSkpQZ0ZCZHZ3QnkyKzlRYXpoQ3ZLb2JGa0R3cmFWRzBlVnRhSnlzWGpt?=
 =?utf-8?B?aXRWNHc4Z0Z6aGtjNXI2R3NQQ21UZklvTkovN1N4bDg3RHNOOHdJUVd5NC9P?=
 =?utf-8?B?Y3kvK3o4dXMwNHgvZWhScDFaczFDcUxFRWk4ektCMCtTYVRHRitVN0hxNFN1?=
 =?utf-8?B?VUFETXNmSDdZbVZQWnFqU1JKcE54dE9xZWZpbkVTWVZqRFNZSnJaaEZkZm8r?=
 =?utf-8?B?VVFZd3QzcjhaSXN4MnJmKzYxV3ZWUFZKSVFEeW51QVRNa2JMNDR6Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bee4e6-49c4-43b1-0b4b-08de5e7172e0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:30:48.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2ZAmKu7CTvp6nLpkqq4npiDQzN94ym9y5Ax89l2WKEZ/Z3zCG5TT3FGsPDgSP+V5+i45gbQdUVHGy2Qe1lMHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2146

On Wed Jan 28, 2026 at 1:22 PM GMT, Andreas Hindborg wrote:
> Add a method to `Page` that allows construction of a reference instance
> from `struct page` pointer.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> ---
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/page.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a8..f666c92fcf451 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -176,6 +176,17 @@ pub fn nid(&self) -> i32 {
>          unsafe { bindings::page_to_nid(self.as_ptr()) }
>      }
> =20
> +    /// Create a `&Page` from a raw `struct page` pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be valid for use as a reference for the duration of `=
'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::page) -> &'a Self {
> +        // SAFETY: By function safety requirements, ptr is not null and =
is
> +        // valid for use as a reference.
> +        unsafe { NonNull::new_unchecked(ptr).cast().as_ref() }
> +    }

This is wrong. `Page` is a wrapper of `struct page*`, not `struct page`.

Best,
Gary

> +
>      /// Runs a piece of code with this page mapped to an address.
>      ///
>      /// The page is unmapped when this call returns.
>
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260128-page-from-raw-e8e1f14e3f6d
>
> Best regards,

