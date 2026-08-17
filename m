Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020130.outbound.protection.outlook.com [52.101.196.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26719279903
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981263; cv=fail; b=b0Bg2CC3dw/iVt7G9qBicLNAmAl8WZNa6/PRyUlznlBa1YBirTHrEL9bByNwfmSElHxxtXDKCFmUK6zm9XdVHCgnDQXZOBSgI2zICNzoa39xdKZhLNDcXNdVKq1rIUCq2AN+nXtimTpWq+SBF/FSUSnnMnRSHLpZ/glVJgdLZKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981263; c=relaxed/simple;
	bh=538i/YMB1V69zafb0qz6ZqejeMAQc3svoWP8lkkCQgk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Wm+nmu2qfl44STG6Ax2r4cwTDGd6hyIpGU5ENyoV7ZQACJ001fj4YmDEpmzbzGKrvG+YX/sFAeZY1/IKMAgt6NDwT0n4OkccmpKBsJimpno2+Exa6PYS1cDCX6D+vilfndi+G7mQANjQuZzhh0kiF57uO+w5ef0Ecd1DlUf8Qao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VaDNzP7B; arc=fail smtp.client-ip=52.101.196.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VaDNzP7B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqyfNQKiYufgr8NjMfWUSyE81TIOdnUyimalmod5/u9hBi2U1HWVaqubDj2WVEY8RfiSo4vnKZpeTQvRWUPyKq3tJMMVXVE0ioO6QH9x9D70Js8EIBIQoiR5KkSLTouXdMP0ZpKf4KwA2fJ33r+JPT47k4Hkw8BcC7/mRmiblhWQJLMYdlMgldVaLjfNbPgKaz81APxwBDkjx7wg0+xWh8YbvpQJU7M9uzEnF+Yg1YIeVNwB3QwgJrMi3qK+b2W4kG5JW8eqB191nnnAj8RItl9I3jL0p5ErYmpFrFAtgVM5F6Aj7BmEKp+N6AGp+sDItPt6O1gX+w8NSpJ8vhgnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jbcNjxq6+D4JFhgcSqEJDYmFu/9daW/HT+MxU4kW54=;
 b=qZmoguQn5A7zfSNCjEGbRPHPk9/YBEgLditB21gh/2QPsJORgNTm8Gb2l+SSVoke1wng3A73QPxWhY0aEPhg3cxaHpQ/JFRdOh7EyEgSIIZeQ+erTItXnjVSpvI9/2LWSnQW9qrCea3ShVVnKd4T2LEgDCfc6UENttJfOfy5iSBiEJFqGrO5QdxDIwE8qD6eApOtE3gUYlYAOmMpQDShXxEeFs1J8YVGiDKBIP9DEAY8rcZFMHAUTIkWL2eWiaUApHWHTZRDTU4FwrHPCgy/jWR/8/Xr78FLevlPU4UBjbR6g6gW7ntv/D+CVizNHGc/ng7KBqXc1zRmUgVZcYIFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jbcNjxq6+D4JFhgcSqEJDYmFu/9daW/HT+MxU4kW54=;
 b=VaDNzP7BN9Pjzs1tQx/PaiuS3M98U0EpsuknGKqmajxztENPLM2mxoXCDik0UmRTDqMxBuXu/cMd9zLzh4FUGdi3i/qio1/K9DfJbJTKXwMADbmw/W8TDliW0G2NpXNTlo5k4b3EhC7X2KP6COO27ySJWFbi77or8oiVI7bpmb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8572.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 15:40:57 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 15:40:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 16:40:56 +0100
Message-Id: <DKRBZK4LSHUB.1DWO0TH9QXO4R@garyguo.net>
Cc: <anna-maria@linutronix.de>, <frederic@kernel.org>, <tglx@kernel.org>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
 <20260814.084700.1697518597717457311.tomo@flapping.org>
 <DKO995UPAESG.UQNZ5G92HCPQ@garyguo.net>
 <20260814.224838.67768463960169120.tomo@flapping.org>
In-Reply-To: <20260814.224838.67768463960169120.tomo@flapping.org>
X-ClientProxiedBy: LO6P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbb665d-3236-4ba6-0f8d-08defc75ee25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|7416014|376014|4143699003|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AzNLfXZaNB0ivxRiSmFqNbvye32kCQXPciY/nVpZYVHXfotsJO6DqLhYwdRpKfXOOo/EKDAHMU3cF8oklAHL9YAjEFyDUU390yYi8kkyGH33DCiyHRO0YHqv4QECIZmDWuzeRph93nyQqzgYVomHnYwvmkix33VqhXtXBMPzKt4RrnwKV/1j/HYBBLQwBgNR67MeAgBq9neKg7JWbyOyE2f6cL1yRVkRqv7tZwJcmeA4iGF7kM3qiDZIEsewFDlfRWLABo7YYlnus/rjoiRY73ZhPX+2BFR+Q+Eezn3W7as3lJsCEFjXJtbSvhaNGRfLg+Q/zZbryOtGwukVPnh6+i5o5gb6EkhWv+/8T62Fc/yAouWfvU3iIgTLKeMrF++OCycNHwsNTz5d5Qp2tn5MYTi/P0JfoQw8QMELrSyiEzt/NDqJD0pkCZ/zWOmm+sjYnwoGmCGlD7+EWtYCuirvWuMuLFhlWWNg5U27L+PtzCHPOFLzkLlup+tEAab9qY2cFRIGX3zYR8kHP+5BRdyvmZmbCc3YB0wnLK5UOG9Z2b/hs5qS6Pb1sTND1Aagvq0wSEVAVuK+LyALn5FNET7hPq/IElnaMCPOzrlrRE/zvtNCPDfWDi8GgXGf8cJhptM/vTHG0JGDK9ndrgDtg9OobH4EJXFPJOZFHRcESyXVdoQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(7416014)(376014)(4143699003)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1hhNC9HSnloTDh4aFBtak9hZXpQTG90VWVwZ0NWdm1nRld4QmRhZHIvT0dn?=
 =?utf-8?B?QmMzOW43R0RQU1daZmFVc1NvNm5TQ2pQZnBLZ1NKSklwZm80OTZqTjRNRW5F?=
 =?utf-8?B?ai92enRyT3RGbFFXOGNuZlk4YTVGUEZlSkJuSndyaUU1WjlEV3JzSnNaMHNU?=
 =?utf-8?B?NCsyUUZiVGl6dHE5N3IvOFc1d1FzWC9mSDU5K2FtRzRoclplazJOQWJaSWhP?=
 =?utf-8?B?ZU9kaVRJVVlyb3ZsQ1hVSlV0L3lURVFLUjNOTUR5eDQ2SXlzV3BUcmYwd0dx?=
 =?utf-8?B?c1MyaVVLV1I3eFNOZElRdDFmeHgzRHRtMWdMYTk3LzBmSndmeGRGaEJWbmRD?=
 =?utf-8?B?VG1WcHFPVnRIZUljMFlZampUeXE0NGQ5TzBDcUNzd0MzdDNmeTF5eGZuQnJ0?=
 =?utf-8?B?aFVMVnFqOUE5SFk1TURucVYvVjZROEk2eDlpNnBIbFlVSUFEYW9LWU82cGdn?=
 =?utf-8?B?VTdHM0dmUGQrYWxwc3BmU2RxTDNIdy8zdjVYNzNjRm1LTGRSbmRydVZOazBG?=
 =?utf-8?B?d2k5dWdCSEFOOEVMcy9UZjJmbVhMZVhhVC9Oc1J5ZmJ5M2xURmNqd3pEUElx?=
 =?utf-8?B?T1U5YjZQNGpRZGZKblZUNmFwSkVTeUY0VzFaUmI5NWsxcG5MYXJXc1BWcjNN?=
 =?utf-8?B?UGU1bjRaVitIMXU5TVBjU1ZQbnhFakxlSkFtdHBPZC9zNTFEQWc4Uks1aS9E?=
 =?utf-8?B?c1Y3a0RxMXc5UUR5NHhmQlV1Q3JoTlpQdnJpSXRpeUI4SDdCOC90VTFOaUtm?=
 =?utf-8?B?ZzdyT3RMRmlnTkJoWEs4NzJsd0ZxdDVEQzZPTWZvYTRyQ3NzMjQrNEI2TXBo?=
 =?utf-8?B?TzBPeEc1bmVIY0t4cGNKdElReHpJMXhka2NLTUJ2VTRadE0xb2VkN3ZXUnoy?=
 =?utf-8?B?M0s3bDgzTW1SbUMrSVduc2ZHTFNvT0dQNnh3QnVuWE9MbUhDN0lCcUljT09B?=
 =?utf-8?B?RitVNFIwc09yaVY0Yzc0WHVnbDdHVGJncHJzZ01sc2phOEJtVGxCL0tLeXBo?=
 =?utf-8?B?RlgwMytzY2pldCtXV1oxREdWUGIxbCtvWjRqbDRiZG10Smd2azVOeVl4UW14?=
 =?utf-8?B?LzlrdFJqTE5YVGp3dDk5N0grMHlEb0E5cVJobjVvUlZlTVYvQ1ROeWVRSXA0?=
 =?utf-8?B?Nm9MS2JER1NSVDZzaHd5aEQ2ZFg0Q3Z0VFhZRXd4TWNUOFpuTVJEZ0kwdEoz?=
 =?utf-8?B?NU9aYmIvSE1Ld2l1Z090ak11QSs5WEthWDBEd0VjeDQ1M3BNdnIyWXhJODBG?=
 =?utf-8?B?MldZMHFvOFdiRjFmaHR1bW8zVjJaVXFQTGhENkFjM1J5SEN3Y3N0a3M0djFP?=
 =?utf-8?B?T2Rud2piVi9uYjdON0FxMWwxaXdNSVdyaDBVajBSYnlwZUU2MTcvcVp4MElw?=
 =?utf-8?B?MDRhdk1xQjRwL1k3aUc1NjErZk0yTUVlUDA1b0g0L1ZtcHJNZnFTejRxa1dR?=
 =?utf-8?B?QVBnRmlVSnFHMTVUdTlCZ1F0aFArWWVyL2JNMFV5ekNKdHlGSUlFZ0hReFpq?=
 =?utf-8?B?bHQrYkZWNVhGczNHdkowaU5EcEo0SUFIQ0ovMXVGOUlYQUlZd3FsYVhxZ3dm?=
 =?utf-8?B?Uyt5SWVUMjFLVGpWR1hXWUZCS1hHN3kzTjdtSlU2bENLWitXUjFueVBKZm01?=
 =?utf-8?B?Z2JDMUNmNElxVnZnS0E5b0t1MUl4M1lBekZwYXh6RjJEYVpJa29ERXV5ODVi?=
 =?utf-8?B?WXRCeko2Yk0vTUloZ2ZBbXVwdjBhMDRWeThUM3hWU0tjNVg4VXRGcHhFTldK?=
 =?utf-8?B?azZGRzV3bVExcDVYU1ZONitGNDM2VHp5cWJxL1dYQ1dXYW8yV2dSSGJJY3V6?=
 =?utf-8?B?S1pJamU0UUFiMDEwL3VJUnBxZ2YrNGdBdHRkTnA2TG5VKzA2cm9FVk9XZ2lG?=
 =?utf-8?B?K1FaWmE1d3YzZ1h0WnVpU3o4YkNTcjdLd1hWZDNZQWZzMjYyY0ppNGZyRWJC?=
 =?utf-8?B?VDVCQWhWRzFiMEt5Vy9IWkxYaDlaYVNTTzBzcUQ3WXc0Z0RNRjNacVVjL0sv?=
 =?utf-8?B?MkJlbjlsbmZMQ00zR3BGWTI3WVdUd01yVHJYQVV4RDQvdHcvL0VuZUFqd3ZP?=
 =?utf-8?B?YXV0QmlTQzNBSDA5TWYzKzN1eWx3N1pKMjAyeS9rUHZzemlGdlZEcjA4K25k?=
 =?utf-8?B?ejVpWHFzZ0VpclJVTnlPQUdUSnJZRi9wdkE2Tm5SWS9MWTE3NlJRZFdMSVVj?=
 =?utf-8?B?cDd3bWdqRSs2VEZ3dFhVWENTQU45UEMxSm5Wa21BVXlMQmlMT0x5YjgyVEpa?=
 =?utf-8?B?ckVLQzhoYm84Tnc3NGk1cU5WbS95dzBJQ3p3dHBuWmQybVVtRzNCVmRYeUNs?=
 =?utf-8?B?Zk9vc09LdjNVQVViSG5ZcHRDQ3VMNllxeHBTS3ZySUtZcXRybmJUUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbb665d-3236-4ba6-0f8d-08defc75ee25
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 15:40:57.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unl42O+oLdFZJqLTqRT3AHUzw5XzZuwFxPAQWhT6THsNSTe1q5MjOj1K03bOK1NhiJHjaRvaEEQ/Yi9Ff4S11Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8572

On Fri Aug 14, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
> On Fri, 14 Aug 2026 01:54:25 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>
>>>> But further complicating the type system to prevent concurrent restart=
 sounds
>>>> like a bad approach to me.
>>>
>>> My intent is the opposite: I think this makes the design simpler.
>>>
>>> All four implementations of start() already take self by value. For
>>> Pin<Box<T, A>> and Pin<&mut T> that means what it says -- the box is mo=
ved
>>> into the handle, the exclusive borrow is consumed -- so "no arming whil=
e
>>> armed" is already the design there. For Arc<T> and Pin<&T> the same
>>> signature meant nothing, because Clone and Copy let you build another
>>> pointer and call start() again.
>>>
>>> So the contract depended on which pointer type you picked, and the modu=
le
>>> documentation had to spell that out: "When a type implements both
>>> HrTimerPointer and Clone, it is possible to issue the start operation
>>> while the timer is in the started state." After the series there is one
>>> rule for all four types, and that paragraph is gone together with the
>>> restart operation it described.
>>=20
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
>
> v1 is missing the ability to restart a stopped timer: once the
> callback has returned NoRestart, the handle owns the right to arm and
> never gives it back. I'll add it in v2, including a non-blocking
> variant built on hrtimer_try_to_cancel(), so that a caller which
> cannot sleep can re-arm the way perf does. That makes perf's model
> expressible in the Rust abstraction.

I should also add that cancel and then restart can be problematic from a lo=
ck
order POV.

If there is a shared lock between the handler and the restart like the perf
core's case, this lock cannot be held when cancelling the hrtimer. Otherwis=
e you
can have a deadlock by having

    restart (with lock held) --wait--> handler --wait--> lock

which can be quite subtle.

Of course, there is an argument that by cancelling and restart, locks as se=
en in
perf core's use case wouldn't be necessary as the cancellation becomes the
synnchronization mechanism.

Best,
Gary
