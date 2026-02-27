Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022105.outbound.protection.outlook.com [52.101.101.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E77143C060;
	Fri, 27 Feb 2026 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206887; cv=fail; b=lZUYTRYkj0HNOsr9Ysw3PBYW7WaR1JHnzFD+SZkT0I8L0BpWzUaEcvklPmoNtm2K+zWTG+a8YcVsrNB5PLZ9gCpJ0adS343BKO9+m2+O5Fm55grrWPdimlF1LdjlLgLXZXZtVbKzHr5JFFT0ap+upYJCsbwHCiafSf6CsKnQpJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206887; c=relaxed/simple;
	bh=oKbECTrTVmpB8UyWPlRuG7dz7I5DQC+xB/a4GtS9x4E=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=LkiXy3vM6kn90uCzL1dYVIVQamsaP5zqjRG8KMTOOU0/pEZ8sLbCCs4YXOxWyeCS/85w0Py2rgMq2nssGHERnqcGkJZieKqjX1ZFnYNLz0NrliR4cZ+5JCgePUhRTQvLep3NzUX8/COFD7OYO26lc+4liFBDbCCr4GdltK0saio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SUc51rsl; arc=fail smtp.client-ip=52.101.101.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SUc51rsl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4pzwzhYMTv3BEdZbr/AE03xTAXNg6SDhzzcHHqIkgVC8PsumTav3KA/uqUfB4sumgWAW022A93f3Q42SilxjTUGU+q73YZDzsckqhyeTqDCJTF7Z7SfVH8TxD21Ng4k+c0qDOOLR1kmzzk5y4UpkvDerNQVTGSqxwyKIgeto61pXjHwO3/1vJCURC5u1vyvu5zO2vsmk5hlMLOLPSKfGvvmkLiLctu2DZNCqyYpm2mJqyOM6eojWwz/Gy0/shZdHLodVz8nudG0Z16oXhIHeIzHwQEZYWF9JlQmx4pyTPwF/0RWpNZQ+eT5sx9aEdWjR35a3g4mWYrSIMXjZ2TWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzlrz7ZB9PEh/i9YFaHhK/lhN8+GGTK8X4CWBOFspXc=;
 b=ccLFNEvbcEWOs55L0hGp11YbL+iuyBUVrtAAmmMt9LFnTeAkvNAg2WUf01lhESSjUPDfNjk2tnIkRN88YKtcuf45JbwOkYdwZGn/77At3QHORvLckKE/odk/8sgOY3MAPZh+RNNoATI3yV+d2veRgHg2qEc3ruCzF1LLIgUVibII5lLeUBx39iK6REnC0kZji1SXRC1o6cwkeIJclGVTHwCUrFoEE87tDWjwpMDZzCONPPk4t56+xbgsdmTfvVxcbiW4K0yWaBfM3dcHbY5UqKwuAY6sIADIyXN2enBjp8oM7uVUYAWfic/dpSc/uz6CCLCtxLxcyC4Q+LjJFZHc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pzlrz7ZB9PEh/i9YFaHhK/lhN8+GGTK8X4CWBOFspXc=;
 b=SUc51rsloK/vqGWdAP/jz+sEbNFpTPjvQo+8+4M5J392lFp7iOA1V/YwUqQGVGxjZtzSN1NzGqPE5BVrJ6bHYJqSK6ju+01pw95erQF3jjcq5MiTB168YwM1P3Rgd6WNjzpGrC0ihANplu+PhSyWXNbaMN05YTprQC/LNqyS5fg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5955.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 15:41:21 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:41:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 15:41:20 +0000
Message-Id: <DGPUWPJCFPZH.4NVAAQS1I6HR@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 01/38] gpu: nova-core: fix aux device registration
 for multi-GPU systems
X-Mailer: aerc 0.21.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-2-jhubbard@nvidia.com>
 <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
 <DGPUTSI5OJ0C.2TCRCF3ERRIOE@garyguo.net>
In-Reply-To: <DGPUTSI5OJ0C.2TCRCF3ERRIOE@garyguo.net>
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: edc83cc2-ec5d-4843-e725-08de7616a7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	GA8owzC5dRde6NpaMDNoD44rDWRtbzhpY4cs4hedRJhBSg6azeFmzBg91ks5s5LNWj5YSTEKG9ijpFTWzU6kgK210OFMNY+0iUj75vFWKdLIIt43sLnDRS9UORGuDyOsWbn67Dd2ia+ulTa4Vytor/8YaNXELjj1ErmMYaCJpe/yG9C6+4QHXHVJIiaxNMy22TgT3FQrGGFiFFsqjqDPgfuaIDcaVrwgtPABFiJutmh0QD+BRaEysZQQnJW7AkMFS2/DGFMDW23KnqdEC7i+Ap2lMvvAafpC4qPOO4DDfHSlQYyF38qA8NC6xT17B77zFG18yNoxZ4VMcClmQjC8MxnFNmF9xexuk5TKwJHYk/dnf69/+BNC52OEIhT58z3WBtcfgvehAhX4WFKG/3EKksKFkidQUyPHzmx0R6eCXIsshgNz7UfAZ+W8UYp5GUoPI857hEJAv3qKJWqWpJUmLqSud0jGnCcBe/PPCu40Ndu7EL4679XsbLt+O3lAPTfAfzoUojY5vgXdasCZ3yDKlYSOZ2bdPbzNjQgMBWpNyXDth9uD/PslcaSCNvNp14aNB2as+7RHSNR2RgTQGIIsLV1BOsed3SXdQQZ63OGR48DxIgiFVu+hxRIGFf2W8FlAGxUzn4fiJKiPXixjU/NK8GwXhkAN+HDYMbldIZ0hZ2IL8DgXF1Zgv+5+bwOvNUok
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEhoVm40b0FuTjJuYzNuSjBZVnBmd3oxOUY0VlJqWFB4VkdxcVltYldWMUpT?=
 =?utf-8?B?eUVPWGV1NmgvUk9CNHZHRDFBYmd1dzVYcEhoLzcyd0pOdVRQNndUOEg2RWVD?=
 =?utf-8?B?RldSVnN6UWUzRkg4bXI4QXJhUWltSTZ6S0RabGs3dkhCc2dJdk80bkJQQ0FG?=
 =?utf-8?B?K0N4L0ZyMFFUMkt5bjh1bGp5K1JsZEJDQVlkU2lueXJxelc0UDVtZURJUTNk?=
 =?utf-8?B?VFk2L3RBMGdEQndabHQwNi85d3Z3MGNqWTJ6bVVoRm40U1NvVVd2SkQ1U3hM?=
 =?utf-8?B?Ty85OHNZbTdzU05haHJTWjFhTHIzWTFuSTc0SzFMODR0WTdCeG16YTBZUnhp?=
 =?utf-8?B?MVgxLzBDZWdZOFNXYTZPMUFDc2lkaVVjdFY3ZlpzcHlZUEpVRzBKeUJnUmdw?=
 =?utf-8?B?UjBqSE1EbkUxZHc4Yis5Zkk0WFliTm1xSExTRm9lNWRhVWczTkFZY2dzU09H?=
 =?utf-8?B?REMvOEl2R3lyUEREeEVWVWJGb2F0d25EVkdTNGJHK3plc2E2dllYWlp6SHV5?=
 =?utf-8?B?ZEVqbFpFNGY1YjRBNGM4Q2JUZXZGTC9YYU1aQmxYZDJGYVJ2c2tNNHlaamsz?=
 =?utf-8?B?MVQvYlB0RnZtVHhuYlZpdktxVVJyVll2T0JjOHdKSkIvTGpBSE1aWWN5bnpW?=
 =?utf-8?B?WE1mZ3ZLMmdaOUs0WTlWMU9jQ2VrY3RGNkQxQjdzMk5qekV0bjQzUXBrSU4x?=
 =?utf-8?B?cHA3UTVEVlVyMG5Tc2FtTDUzeFp1U3BwUTVtNUpTVnVPYWZMT2ZCL1BwNmFI?=
 =?utf-8?B?dDRRZlVJTmxFRko3cWs4R00wVWFYQi9oamQwSkRzY0hQWkt3UnR5ZTFLUFJo?=
 =?utf-8?B?SWxhLzNRZ082VHN5b3hMWWRKMklzb3lZam5HVTJVOEJENUVVMFcyWEZwenFH?=
 =?utf-8?B?Q2pQWUFOTmtsK1o4RnZxbS9zcGlLTERUbGxadS94ZlNhSlBOY0NUYWhqSHpi?=
 =?utf-8?B?b0lUSmZ6NUdYS3ZoMWQxU2dUa0lSOU03bzJKMndyQlpMQWtERzUrVVFsWnJp?=
 =?utf-8?B?dXV4blM3djdlcDRuLzl3T1llK2orRUs1bWl4WWhyd3EwVlpYSDQwT2JUdkJ1?=
 =?utf-8?B?VlNwRkYzY3dmMnlOVGc0bGVCVklITFoyRm50VjJBci9KV3hCdDg1QlZiZjhq?=
 =?utf-8?B?eXdzb09qSE9aWFpPcE01bW5VUU5ia2s2MlBHTE5EQk5CS0VnYW0yR2w0dlds?=
 =?utf-8?B?SE4xS0xKbFpNWHdqODZwQ3hhck1CcEVNSGVPVkNWS1dOM0RyZ3ltdXlPZ1dU?=
 =?utf-8?B?QnJ4MGJxUkpWV1c5eTRiRGRSK2F2VkRRQTdUTnNNR0RocWQ4VWZIeno3RXJK?=
 =?utf-8?B?WmRVQmNPaHorM3JOOCtESUw2Tk9VWXZGNENvK1FuaFoyMmM0V3E4RGE4UXFQ?=
 =?utf-8?B?d05QYmlERktNR3hUM0ptcEwwZS9JUFV5ckE3VmpLUzhMWHZYbTB5YjJaQjVn?=
 =?utf-8?B?OGhoNWc0Q24xRjVJUmgzOU9SVnIwTkxGNnFpSkJyVjZkTk5CVmFZWmdRSGx2?=
 =?utf-8?B?SUw4Y0dqMzF6SUtuNjdWMHcxb2tvZjFQcG96VXYyYStuYSt6cjBZb2I2enU0?=
 =?utf-8?B?QjFKcHhNUHFhajBML015a2V2Sk93WlBkb0tjWW1PVDhEYjM0K1VZMGIyYzNF?=
 =?utf-8?B?NTA4dGhtd1MrcituVGtwQ0pYaW1pc1JMT0tWVXNYNmxEVkQwMGZZQVZlcEZs?=
 =?utf-8?B?YkR0cnR0RGFTbWw4MUs5NlVpQjRhOHM3SHJsaXRnTklmZStHVDJQMmoyVzFw?=
 =?utf-8?B?dmdEMitjalRZalRsQVZYT3JnNzQvNTFoOVV3UUV4R2Nza2swQWZlL1NSRFJ6?=
 =?utf-8?B?SCtYZlA3Q1FNUEhRL1FzSXd6MVlpbmZRb1ZmUXhBeXRBTWJZNklOQm51Um9h?=
 =?utf-8?B?VlhTNVV0THRPZmYwOUhQN2hsMHIyTkFmS0tyZVhTYlpRckNzRjVhM0w1eEE4?=
 =?utf-8?B?RGFnT1BGa0x6cW5HWE1VSVlGL3ZBcnVxT2x4c2ZsTmNGRngwWllTdlVnS2Iw?=
 =?utf-8?B?eUZ2VkdkL29VSW10MUx3T2llOW1JSDVpekpJUktFbTI3TEMxZDgrMjlhdzhs?=
 =?utf-8?B?bUNZU1doMlA0d3RoS2Jlb2ZjeWpnQTIrdXljVlBsdGVUUDNtUnp3T1ZtRThV?=
 =?utf-8?B?OEx4RFg2clJSQ3VZNG9OVEl3eWtxTzA1N3d4eU9mY2lYbXJ1V2duQitzSEFS?=
 =?utf-8?B?Mmw4bTliK0wxUm1LeWR5cy9FZWIvSXpzam43bSsraW9tcFJHMkFWenZaSjdm?=
 =?utf-8?B?NmpBc0hvY0M0Uy9iQjBoWUpwYlRuTnFwbS9BdmRvZVozMjY1a2JWV1BHTHow?=
 =?utf-8?B?WGNsdEljeGJmVW9seFRMa0RhdUhldkZ3a0pXK2VISjAyMXVYNlYrZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: edc83cc2-ec5d-4843-e725-08de7616a7cd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:41:21.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGvkPi/jg0Bjt2g0sjGEC+99x3Pbrx+SZELJ5s4ngVHgDqzX4rZHyfY90jCikQoO5KYorrrCLtr0xTTsf2HWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5955

On Fri Feb 27, 2026 at 3:37 PM GMT, Gary Guo wrote:
> On Tue Feb 24, 2026 at 2:47 PM GMT, Danilo Krummrich wrote:
>> On 2/21/26 3:09 AM, John Hubbard wrote:
>>> The auxiliary device registration was using a hardcoded ID of 0, which
>>> caused probe() to fail on multi-GPU systems with:
>>>=20
>>>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/Nova=
Core.nova-drm.0'
>>>=20
>>> Fix this by using an atomic counter to generate unique IDs for each
>>> GPU's aux device registration. The TODO item to eventually use XArray
>>> for recycling aux device IDs is retained, but for now, this works very
>>> nicely.
>>>=20
>>> This has the side effect of making debugfs[1] work on multi-GPU systems=
.
>>>=20
>>> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
>>>=20
>>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>
>> Applied to drm-rust-next, thanks!
>>
>>     [ Use LKMM atomics; inline and slightly reword TODO comment. - Danil=
o ]
>
> Danilo, can you drop this patch from drm-rust-next?
>
> The patch that is supposed to be queued is
> https://lore.kernel.org/rust-for-linux/20260205221758.219192-1-jhubbard@n=
vidia.com/#t,
> which does correctly use LKMM atomics and add comments about possible use=
 of
> XArray.
>
> In fact, I am not sure why this patch carries my R-b.

Hmm, actually this patch contains updated comment but somehow have LKMM ato=
mics
changed back to Rust atomics. Not sure what happens. Anyhow that patch shou=
ld be
picked instead.

Best,
Gary

>
> Best,
> Gary

