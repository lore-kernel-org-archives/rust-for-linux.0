Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022132.outbound.protection.outlook.com [52.101.96.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275533C9EE4
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717463; cv=fail; b=tYdA+qmZyVY9cumprFCwgKfBEoa8jnWD2rWonuu+aI8jyUiitaRqOlSFeWp3GaDw9O5tpn9dl1qJMAhvQuX2w7km+ajj78IlJQ6tLAMsZnf5i+p3Xjq8YovEErL0iHnJz9INgFvfjRLBSG5FQP+4AYAWsMGjqW5CEWOk2OVUdCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717463; c=relaxed/simple;
	bh=TaFUGt/TcyAgGFbBnB2DDOEXMg5tdiUX33Z2IY53+IE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=c/x0/uqLumK5vzzkA+NuHiQE8isfp0KJdCN+ru+bv4wn5qDnbX6cGifaCYhXQIqWZ4HzMh7vYoKgDXKB+zIsjS49npmhTkMKe0m13uPBhxHMLCsZv2xNOF32HK5AMho7maapSabIB+arx6UyiSifBEAYZcepgOCLMopWJd4yJrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HSGF4Ip7; arc=fail smtp.client-ip=52.101.96.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HSGF4Ip7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+imyj1+IP5C4UeXPVzokG+l2b8CvXm3kymesBMTjo5rVtNW86vIVtXtQmK46sV3h3bl2tyfbO0fbfWGfwc28aRpUGrvDU1sDecinsCmGk24FZpwXCcQvPNhAfCLjN4oGebrARS+4YNoNDwgIdASV+pzjMHWeme42z98fBcrkz+6riSfUHCGfCCrYNnOUPLOeU+nk6ww+/GGJnqnqGBr5T+wLk99rEZon1sdlfhdy/PvV2zhN4kGDnCujKwkY9sTNTjthIZr6h40B+sMOxdb8O821YmN+v9vfKgTJzCG6qhcveOJLh92MqEu27Qk0RJGviBHRc210octPGOn5SV31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxCNdM4jMqtOyXKNHkAUrF5IsjGiAdWr8ZKgVLsl0Fs=;
 b=ROr+JLgK1+1X/t/eNU2nvtLOGlExippKoLW9KwSuos1NVLiXmx2ic0j5UOgE5Bfj/rXyqLQYx8xgrTTUhetGTIjO6KpeDNUPCThL3MzeP4KkMDPWiU2TX+1en6ESUwSu07qaOTTfSUDA0+0TdEYdJbN5p3wDmi0Q1PAmxXZX/xRDQkGC2icXdOfLQl/hQiGMrzNPfQHQ+JWT3kEx59mSvGSB6Z/vicOGsW1p5OfL7y+rIovsrJfpbzSwxrUW66ULpWhzsaSDh7Fi4f2/ZkyF2EvxE7m2vRN5rkijuw42FIuLRxrz3siTH7MCtvAJNA//vD7pQFus/0SBpP1rsEVNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxCNdM4jMqtOyXKNHkAUrF5IsjGiAdWr8ZKgVLsl0Fs=;
 b=HSGF4Ip7XdBGNnv6L0UIwZjZ4fIOd/gc/u7TEf2UupOeIsJo5rwQuMEW4HODR3nWmAl/Zl+iRl+F7Nepdw8ct3mVX/y0Bfd2DvpnuCJ2KZVc6wgbNqMLBhgZ5Vogw84+L1l8GOvD16UnWNrVyLx0DARXTEncCFF4km5IdxBwoN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB7894.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 14:24:11 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 14:24:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 15:24:10 +0100
Message-Id: <DKOQH5AD00IZ.2UHAO78NDFZZ6@garyguo.net>
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <gary@garyguo.net>
Cc: <anna-maria@linutronix.de>, <frederic@kernel.org>, <tglx@kernel.org>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.21.0
References: <DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
 <20260814.084700.1697518597717457311.tomo@flapping.org>
 <DKO995UPAESG.UQNZ5G92HCPQ@garyguo.net>
 <20260814.224838.67768463960169120.tomo@flapping.org>
In-Reply-To: <20260814.224838.67768463960169120.tomo@flapping.org>
X-ClientProxiedBy: LO6P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: bc702e11-90e8-4cd8-6dca-08defa0fb560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|10067099003|56012099006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kAXrvpYzKcFzyUSpkhz4tUGXJ7h0+n9b0/ymVfz9sSlxt8oSlHeJ4Kswc6y7rSO2H6bAX+EgsLpABJPsi7nlnBfjbb/zsMUYkyUgohAmPp1Wxl0rhfA9y59jLjzjMXrLc3xhELmdWV9eiF0wkAnac6OmZoQHFXt+qK+10/77d8wXeQWN8OjV55crnPF7GJJvT2n6UzdrJO9eqsb6cIWKAFUpYoqUBz+1CHhx/Y6JyybP9yU87eMUgzsfp3jj5SZaB17sslddRkf3cbl7zJDf1+8sbU2vqep1p+6mKgzWh9aLFtRXNuRm3X7pPRkQ0lfotESCXvMEcK37UKLz1NUteaxxXslrR4qS8D2SWglirxF/DwKV3WmxQmo20KJGk/fFIweTUD35rJIjzXxnyf976kbug+I/y0SJ67khFEjSvTKVKWoTVD7hI3IQ3hz8LUViItXognSv29cyumf4dXzsKxMidzPZW8rWS4LHaEtSz8GTvO2IAcwjAGnnFSjQpkLObHqd1SvrAXc+DxC2luorfZIxlIOSjXPqRsjHB35A/LEVAGGx9bRcmP9BBSQzMyOOibwG/pVWuJhNWHzHTPNq/gYUE15U7PbNjdCltA+BeowoYA82Qmlv3VRg6E9zTWpFkc7R3af2sS6WUhH6HXl1gruF8PLbDjYxlZJchs2/SVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWNVNU5DaWN5a0dvbGZZQ0pETUF1YkhramNCd3Rwa0pteWt3dWVYRDZTaDAw?=
 =?utf-8?B?c1phc2Z4ZGFxR1dlOTVQWE9zbHpnVnVuamhCdklVb050alVpYXcxM1JXejd6?=
 =?utf-8?B?RllDeGtJUTN6RFlSeTNxa0FXUWVvRGpCSlNoZTlIK1YvaE9FNEU4MnV4elJa?=
 =?utf-8?B?b05Wc0RzNncxdmFKU2Jaem1vamd2WWkxRnNjWTV4b1JmYWJIdWsyS2FkbEY0?=
 =?utf-8?B?ay9vSGZPODJQSVVDQmo1UStGdE5SNG5XVGQ1dFJNL2hwaXVSM3lpTFBGRkIw?=
 =?utf-8?B?VXBQcm5SVlhVcDI0K1ZkT0pYcm4zSU1PdlRXeVh4UWZzVXJ3VkZXeUZxdzIr?=
 =?utf-8?B?bDBxTFFzaXRSS2VPdnMvbmY3YWxyZmprOXh6WjVwRER2ak1uSGFDdCs1NmlR?=
 =?utf-8?B?QkpYcDJWbEZMVFRCZzBCRUIxeFVYdG00NmpMajFPaW55dzd6Vlk1eGo4dlNh?=
 =?utf-8?B?MldoTFVhb21CazZSK3dmTmpOeFdkY1dPRDNxb0NqTU9ibFFIVXpkbDhZTi90?=
 =?utf-8?B?WUNwUUVQbzFBMEFPRWU3c0QxMUtaMGUyc3Vndmo4dkZ4d2hFaUd4VlovYXdm?=
 =?utf-8?B?bmVaY3ViWUUwcVRKYUExbDhVclk4Q1NpQVR4OWIyZFVOd0xoSVFQNnRjNkNZ?=
 =?utf-8?B?a3hDcmtQTTloVTNzdWlpMTNIR2dLZThnRTR1cWFnUkJiOUVhSFNZeTlpRHVU?=
 =?utf-8?B?Q3kwZXhLNmdoai95dmV3bXg2U1l3RjlrVm9WZ1ZqbmwxKzVma0ZzRnBtZVZP?=
 =?utf-8?B?QWNleUd1eGN6UENvSDdyc3Y3MkxzWGFCazZ3c3VvYXpRWmhDV2tXM1h0c0N3?=
 =?utf-8?B?V0IzLzY4ZnEwdHdEZTVnWXdpczZUa21wTVZnQS9tUmtxeVZnV2NxWWdMV0hk?=
 =?utf-8?B?cWpuRHpGT3MrSFJEL2Y3RXBxWm43YzlUVVRRMmVXekI5MnhJUGtrUWFhc1V1?=
 =?utf-8?B?TEVmTEhNS0lyN3ovZ0JseHJOdmNuWWIza2hOMU13cW1HSFBlT0dGd0Rvb0oy?=
 =?utf-8?B?cTRDRlNXb0tyOUhqVW1VNXhPam81alFOT2ZZOWxnODF2YnVxTVd3dW4rZGhv?=
 =?utf-8?B?SFh0T2FzQm1COFVFYktCV01scWE1ZWRlT2xmNmdGbmo0a1RvVzNVNXpjTWp1?=
 =?utf-8?B?STFxTVBCd0NQdWh5UUtEd2d1UzhrU0FwcEt3RmJiOWRVQjhRK1hSN2NZOWtB?=
 =?utf-8?B?UFZ6YnRZYkQ4NUZPQ3hWQXhTNUNXdXE4YjZWOHN5U1Rmd1hZTTN2TlJMeWVi?=
 =?utf-8?B?ZE82MVptQU5JUUVWZndBUXJPYmx3SWhRTk5qOENYZExuanVjOGVGa2lDc1Y3?=
 =?utf-8?B?WDAwY1RPRmNJV0VGYXI5d3JiMUY5NTQ0OVBZV1BZWjlOYmtsVW1zQkNUUUFZ?=
 =?utf-8?B?NGpubklQMjR3OXo2MGZxaVZFY05ZQW5sUnNKRmExUmlCWFRlYnRYYUQxVlkw?=
 =?utf-8?B?d2pFbEtNMFBPTkYxOWNuU1Z5akRtOUprVWRRbWVhOGcxWlpwL3FGczEwc2o2?=
 =?utf-8?B?ZkxXWVZVbkFuSFVBMW44NVFwcmhkVU0zaGtYUTJFa2dPNld4bjFsVXczR3g4?=
 =?utf-8?B?TzJ5ZVNNcXhpZEhSWlh5T3kvTHFBQ3dENHArWW1kbXlCdVZLY05hQWExNjBl?=
 =?utf-8?B?aXVEMng4akE2VStZR2FhUGtwbEZlanpDazFBZnVWZ3Z1MWcvUW1pWkZEcERt?=
 =?utf-8?B?V0w0bUpoMzVWUUdCQThIbW5PbDhYVnBXSWtFcWs2czNFbTZRZWsyRXJMVGk2?=
 =?utf-8?B?d0F4ZEJIUUpycVVzdkxYbGZTTEltN3lJRHlNLzE4NWhYMVAzc0tLQUVRcnhO?=
 =?utf-8?B?cmdrYzl5eFYyaDZtcVdCTTdMT3ZqRHYwakdzaFlaQ2ttK0V0NGtTdTBBU1BI?=
 =?utf-8?B?aVdqcmI4OHhJZEdoTGZRVzRycTJMQk1ndU1MMVhXV1BlWENEbUg1SFVKbTdJ?=
 =?utf-8?B?QUNKd1NaOEdrZlozdXluK3VpcVk2bW04WCtoR2gzOWgvV05od3R5UGJiSDBG?=
 =?utf-8?B?cG1pS092ZDhoYmo0WEN0SGM0RWhTYWw2a0dYRzhlMkl4RUFJWUhYMVhVOTUr?=
 =?utf-8?B?dW96ZFBkM3FHQldzQlU5Z0RnUkhvOEZ2OGpTUzhTTUtOdjBLUEZyL2JBRXQ5?=
 =?utf-8?B?eW9ucmNWdVdyVkU5YU9OekVHMVhKcENzL0p4TEJlUGx1cHppRnZqNTVBZ1Bk?=
 =?utf-8?B?YWkrNnRzcXhKR0Y3UW1kZTNybno4cFZOTjI1QXQ0bGJtQU1UWHNFa3pEUVZi?=
 =?utf-8?B?aThnMTZnUkJvN3FITjhWMnE0LzRtbVVUNUR5bEEwb2tNK3JGQzRBNkhpUmJK?=
 =?utf-8?B?a0R2Nm1JWE11RDRsYXhzZzM5VUhLZnFmWnVnc0pTcitTU0VaMGpEdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bc702e11-90e8-4cd8-6dca-08defa0fb560
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:24:10.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBuJM7sczrrSLa7ToEhFHpVU07m48J9UitnBSQtwGzu2Ka/OGpRP2HzLeqEBN/ip8En6CkWU3CJDelfpU/TI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7894

On Fri Aug 14, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
> On Fri, 14 Aug 2026 01:54:25 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>> Let's ignore the implementation detail of all various Rust pointers. It =
is
>> something that I plan to overhaul and doesn't matter to the core issue h=
ere.
>>=20
>> The change you're making is to remove the ability to concurrently start =
a timer
>> in Rust. So if you have a timer might be running, you'd need to first ca=
ncel it
>> before you can arm it again.
>>=20
>> I do think it is conceptually cleaner -- however given this is explicitl=
y added
>> in
>> https://lore.kernel.org/all/tip-5de2755c8c8b3a6b8414870e2c284914a2b42e4d=
@git.kernel.org/
>> and the pattern is what perf core uses; so I wouldn't just dismiss the e=
xistence
>> of this pattern. Perhaps cancelling before restarting is considered too
>> expensive and has to be avoided?
>
> The pattern perf core uses is "no arming while armed".
>
> While perf_mux_hrtimer_handler() returns HRTIMER_RESTART -- while the
> timer is active -- perf_mux_hrtimer_restart() does nothing. Only once
> the handler has cleared cpc->hrtimer_active and returned
> HRTIMER_NORESTART does perf_mux_hrtimer_restart() arm it again.
>
> That flag was added precisely to implement "no arming while armed", in
> 4cfafd3082af ("sched,perf: Fix periodic timers"):
>
>     We do not want to race such that the handler has already decided
>     to stop, but the (external) restart sees the timer still active and w=
e
>     end up with a 'lost' timer.
>
>     The problem with the current code is that the re-start can come befor=
e
>     the callback does the forward, at which point the forward from the
>     callback will WARN about forwarding an enqueued timer.
>
>
> With cpc->hrtimer_active in place, neither of the two conditions that
> 5de2755c8c8b touches is reachable in perf's usage.

So are we okay saying that concurrent restart is problematic because appare=
ntly
it cannot be used correctly (because you don't have a way to synchronize it=
)?
Perhaps we should just revert 5de2755c8c8b or at least do

    if (restart !=3D HRTIMER_NORESTART) {
        WARN_ON(timer->state !=3D HRTIMER_STATE_CALLBACK);
        if (!(timer->state & HRTIMER_STATE_ENQUEUED))
            enqueue_hrtimer(timer, base);
    }

?

That said, the perf core's pattern is still different from the API that you=
're
designing. When perf_mux_hrtimer_handler unlocks cpc->hrtimer_lock at that =
point
perf_mux_hrtimer_restart can already kick in and restart the timer. From hr=
timer
core's perspective, it is starting a timer that is still have running callb=
ack
-- but that callback shall only return NORESTART.

Best,
Gary

>
> v1 is missing the ability to restart a stopped timer: once the
> callback has returned NoRestart, the handle owns the right to arm and
> never gives it back. I'll add it in v2, including a non-blocking
> variant built on hrtimer_try_to_cancel(), so that a caller which
> cannot sleep can re-arm the way perf does. That makes perf's model
> expressible in the Rust abstraction.


