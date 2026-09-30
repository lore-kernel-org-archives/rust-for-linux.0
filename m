Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021084.outbound.protection.outlook.com [52.101.100.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405B4E1C74;
	Wed, 30 Sep 2026 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774109; cv=fail; b=WRXM2POvvm6nF0v8TZs7xUJ4fg7GCtHyGKoKM91D7G3XRmLFnC1JIc9QpdoXwT9DPGyX5g58Z5nj5guNu0KNdnEkKPvS4zzANQGsIINAZXkuB3TVE1YieHTNmDmmqteu95tGGkA5IK+tCAI4IemAv6ampf9RjS2Rw+SZL4yrDtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774109; c=relaxed/simple;
	bh=AyxxUppYNFoQGG5De9RAynwjhbX/j4Lmgml7l42P2GI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=lYUW0rNl5M36Xk0wFUZMmYU2Nwdg/eBeRgQ68UbyX9YajQzEAddbwWW1yQeuLo201tIyWV21yg8Sq4Ii8JjPB3EgjPO1MHhKogjJlrzGzebwjpeeZQ5vObPabvg59qNfLt/74RivLTvShK4PoJxf3B2td5kCIskK0n3s7Nkz27c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pBbMUj3v; arc=fail smtp.client-ip=52.101.100.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pBbMUj3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCy/a88kmvfMxuWktVGvyGs+YpCNrpTBW3hEaDn9Pfgprvl/d9jI0Ah9OzNX65tobwPHtN1XET909pCijWgU9xcnHNru8HsvokPMapsUZT6+/T4QHcx+dJxL0WU5cP11ID3UMAn6kut+eDBLuVbMkNEdC/S85Ht28+jc94YQ3i3iH7d4LlyoNwncw1FvN+CfwfJ6dLgqH0plqlNtRer3ZdeDWK7rZBSXNErw/gQ4Zyn9gNG0ljYtYHkj+X4LYAv9yoXGRgR8yHeXsOs1BdAjuoUm/I2jqqwJTF5GMJcqWo17m1KT8TDEogx2ba7II7N+zF6hiyK7OuA/q9Q6KXrclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P57qKO+ONDByvbvtw2XJP7WzSaFZ40EsSFMOXW/7KA=;
 b=biIpEobsqrbh2Y7faMxCdEERtHwZHGKYTdhtpyqziKCRys6OUdDfqZRpvR3lLCKgmD3D5+xiMo8zoaF5Tl0NBVkqbtzvcWNBNja6ASq+7w4b0nHQAe8RjrJoZlsXm5FbQ1WALjdnknFUJrGcW0sFwifEFO0nVbtAFEb/vQLbNDeHe/KUivbZg2E12sr0kZd1WHUasmPE9ErmI0Y82rkphSGZ5L9CbBEb4fvM68bS1hj52dESxV7LglTyy5rTelhEGjCdP9HNiLUKFeuBF0Kl9U3VDwJ+TyIrtqIldcgtA3Jb1YQcJ50WYvdrZafGKq0pyUE80+zJPnu09wq9HduFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P57qKO+ONDByvbvtw2XJP7WzSaFZ40EsSFMOXW/7KA=;
 b=pBbMUj3vtIOPDN3LhpYiv/zHbgVmMfn3Q2IPQjMWs+VUpoiqvAqg7+7pHZKyJkr9I7BVmhj01GDRU7iTnMrLFF/IzE4FMwPQb6qDmaYRLneTt/O0H16P3EuenweHyZYaRVAZOH/GR+Ok16Pqsh27j/n7+EWdLsAJ86T8ocZ5oVE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LNXP265MB2428.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:137::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 13:14:53 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 13:14:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 14:14:51 +0100
Message-Id: <DLSOFOGGZC92.12KYHEALX1271@garyguo.net>
Subject: Re: [PATCH 1/6] hrtimer: add expiry injecting callback variant
From: "Gary Guo" <gary@garyguo.net>
To: "Thomas Gleixner" <tglx@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Anna-Maria Behnsen" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Jani Nikula" <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Lyude
 Paul" <lyude@redhat.com>, "John Stultz" <jstultz@google.com>, "Stephen
 Boyd" <sboyd@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
 <20260825-expires-v2-v1-1-90411c6217c7@kernel.org> <877bk3ixp5.ffs@fw13>
In-Reply-To: <877bk3ixp5.ffs@fw13>
X-ClientProxiedBy: LO4P123CA0586.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LNXP265MB2428:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ae3cf5-658f-471d-2777-08df1ef4cff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|7416014|376014|366016|921020|4143699003|6133799003|10067099003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4IA6P2PL9dIT7BW5HpSmi/WRBspZWkXl+FzEaoKXf4EtyN5hz1RfhxSKpjmPtSFCkqe0eWaPZMJqrNfJt2PACgW4jw7MnsiTyYJqjM9z/s9TsifQufB8UWeToUuBbwiT8jzxZeSKEtMJuOsF5+15lejadvexCxx2nhQZHn1AlmTIzOel9bYM0Lk26TELwbNFLYPU887Ms3hXOm0X9A136mC1jCrJyRJc7sfmolHbVtBwyKGQ8cPr0ji62hn3X2NJaOzBY3FQca+D+nRof7YWw7wrj3w4zPFpUCcGipiUL3ZyAnyeByW4pI6ETpVzLWNts0fgIO9MoLjWKRvbM4avq2g7tpcz96V4VuT3ZscxJEuQv/LKaJyd1kVZCvg9PEzqIkh6A3L5EdZORHbRaFrA1v/oU2Z5iuslRwMKlA+JgEk/286eGJToelS2ZLLHnyqRERHtWKHGnCxb7N+vDFNliR/2Gi0+FCPT+ejthdujYYZlTwohI+dnKuRGEMWtGnjkXe42bJt1jW19wPq3Sx4JD7lzDWwYoKf9Tobeg6L44EgwNTsu7EOzf0sdcNK/NLQHwAeWbx2PE0uZnL3bruCvoOdOsR9v4AEGc/rPc8kndW4Oi+idFnjChrqVW8BP89gEo/SjH/ACvvqItIHZas1qO1g6DIhkc0sCHUqFpRK8gkKREkkANIyads8iUbHT8v8/HllZvnRRcLesLL6kI7MyRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(7416014)(376014)(366016)(921020)(4143699003)(6133799003)(10067099003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXUxWHdjNytlbVA1UEdPbzhZMS9FZkpaYmZPYTd6dmFBOTVhYVFSam1xVFp4?=
 =?utf-8?B?WFo5YmVGc01KQ0J1Rm5QcENvalp3RHZkajh2bmVGTXAzYnBRbHV1SjNleU02?=
 =?utf-8?B?K3BDVitaWjN2ZUxUQnFVS05LVkhFbnFiSzRRNFplSExacmRrRHRiVUVmN0U1?=
 =?utf-8?B?RGx2NjM2alJ3L3kxOFFHL0RxSzRUTllyV3NPTjhNeTFEa2hTT2QwY0xrUnZ6?=
 =?utf-8?B?dzJBZVViNGd6UkhQdXJHUWJ5djBKVkJ3VHlDeHhyMk9FNHpWY3o3dS9tQkpT?=
 =?utf-8?B?c04wSk92OFdCVG4rTVRjaGd6SVJhSHAweU9BZEhZR0hkTFZCMG8yNk1HRTBC?=
 =?utf-8?B?R1ExMkpVOXFSbkZOOHZDS2FNN3Vtc2NMUk96Z2hDWTRYVkJ5UTQyaXh6SzIy?=
 =?utf-8?B?MUNMRFBQVmhTQkVIcDIzSjdtVWJVU05sMTRCWFZ6OEpRVCs3Qys1bk9tK2Vy?=
 =?utf-8?B?RDl4TnFSNHlDVEd0MEJ4T3BoSmZmekpXeG5VR1pCRlRkSGxuVCsxV0RvdWhM?=
 =?utf-8?B?anU1V1c3TUlVNVVMR0J6S2htSUtaRDM0WlhBTmNURjJ3Q1RLMjZTMXpnQmhK?=
 =?utf-8?B?UGVJN1BLaEtxOUNNTzhQRzBLbXBaYUVtaGhaWFVHUHFGZG5sQ1NtVjhJMTRI?=
 =?utf-8?B?K3NxeFBRd1RnQ0ovZzdOekFRZGJaaG1GVk1HMXYxRFZWUEwvTVpnWVBJZWFy?=
 =?utf-8?B?MW0xeDdpWlNrUlNkeXVnTDI4MGxZSXcvOTMzRWN5Mkl6OWZtcVF1aTl2VlBE?=
 =?utf-8?B?dEVrMUhCcXdFYXlIbUN3VG4rWk9oR3l4MWdhVEM3ZTByQTFINzJ5Y3V4bGpo?=
 =?utf-8?B?V0wwdGFSMXd1NVVjdWdlYUhHTXdqUTc0Z1dtY2hvMEpVb21ZYThXSDM4NVFh?=
 =?utf-8?B?R29QVlFCTEc1L2xSdjRxMWo3b0UyVkdNOHNrT083ZStkY1hxb3o5YjQ0UjlW?=
 =?utf-8?B?TExrWUk0aHhBYm83U3NBQURSSFpmcHFrVGthYVREdWpWcFNLay9FK0dvNlhw?=
 =?utf-8?B?NlJ1U1RoOFErcDhXR1pWSEhIWTNuME1xRUt5QWMzTnFKREkxQXBIRVNYN0dK?=
 =?utf-8?B?b2VCQnBDWUlJVXJjOUdScUpOUTZWaXBUWWt3S1Y1QW1yUzh3OWc1ck9nV2h3?=
 =?utf-8?B?NHI5WTIvempPYUdzckRQeW1mN1RkV1dJUUFnQWZod0xBNlJzQkgyVVF1RW8w?=
 =?utf-8?B?REd3dzJMMkZ1cFBmMWFCSmhhbDcwS1FBNm1HUjFkdFJMVWRYU2JJVStXY1My?=
 =?utf-8?B?UjMzMzNSMlBtSmx5aFAya2R2NVpXSWZtUndQUVgyazRxU1BvM2UycHBPbkxV?=
 =?utf-8?B?dnNzbFFRQ0p3MzA4UC9YK1dJOVU5ZTY3elhZVlJVMDZqNWxtaVhsVkxkRTZZ?=
 =?utf-8?B?RmVHK1BZODJKNXFHQ1FWZ1RheUVMeG1Fcmt4a2ZMU01Xa29lVVNUTHliQ0M3?=
 =?utf-8?B?WEJoWVlTMTduZVBkckU5V3FwVGxCZFVUd0JMOVA1azMwVU1EY3dSa3Z3T2pT?=
 =?utf-8?B?Sk8ydVM4NG5Nb2JvQVpCb0h4MStQZkl6VjBnMk5zMVpJb0RkZ2c1cm1tUDR6?=
 =?utf-8?B?bTVOMHdTbjV3QktWY0l2dmdLMzFiSDNOZ05wZmN6YWxXeHVZNGhyNERtcGk4?=
 =?utf-8?B?VVRqZ1RkaEdabzBFMWlaWGdGY3VoVzNKdllCSVc5ME5JbXMyaE96UHN4OEF6?=
 =?utf-8?B?R3FIaTA4N3UwbzhmY2tpV1VwM0k2OUdnU1Q1NTAybzZHZ09vdGdSOXZoQnd4?=
 =?utf-8?B?VlRQTjFqNWplQVovQXNvdlNQcHVZbzZTZk1xa2pCbjQ1Yi96QXVmQmZTZVdK?=
 =?utf-8?B?M3dZKzlyNzdDSThnZ2VlSkorbXF6R0xDd1VQRGtOaHByNFF5VnA1V2NFWmFO?=
 =?utf-8?B?WG5RV1VOdnZFYy9NTzFTeHo4Yzc1UUl1bmVBLysyYzNtWTRkSlBZektpSWE4?=
 =?utf-8?B?Mm93NlJpc3BPWDg2eGgyTnF3TVhnU0JHV1QrOGJRSXNDbEQvREhoSi9XR0tW?=
 =?utf-8?B?TFN1VnhVS3lnbmIzaFNjZnRKU2xQbVlvV0x5dUc1bFUrT21iY1o3K0t0VUp1?=
 =?utf-8?B?RDR4K1RycFNIbi9YU1NLdkhQbXQ4b3NnQzBDVEhOZFN2ZDUrZ0d4OTMwbmt6?=
 =?utf-8?B?R2JRUk9LN2ZwYURhbEFLbGNPUjFTM2lrcitTcWE3NmprL1AvTFNwSUJZOThQ?=
 =?utf-8?B?TWtXV1BmSUpxK28rZHlTWkIxUXVQbUxsSFdFQ0k3ckVQQmozOGl5R0NLaEk1?=
 =?utf-8?B?a3FLdmlMWkNvTnJGenVsQzhaWWpYQ1ZhUU1qUCtqUW9CbytzYU9YV2NvSytU?=
 =?utf-8?B?aThLY2FDZWJaVGhWNzJ3SHp4R01sdmVvQlEzMTRBWjM3STd0bFJydz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ae3cf5-658f-471d-2777-08df1ef4cff1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:14:52.2272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otVeYN220bDL/hP5/o+VgKf9/6uXasftlZarh75lZsyBHi5nrm6QSP7bAtNrqBu2lUHcdqGGEz5fXzEIyJ7dZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2428

On Tue Sep 29, 2026 at 9:56 PM BST, Thomas Gleixner wrote:
> On Tue, Aug 25 2026 at 14:16, Andreas Hindborg wrote:
>> A hrtimer callback may modify its own expiry with hrtimer_forward()
>> and read it with hrtimer_get_expires(). Both run after
>> __run_hrtimer() has dropped the cpu_base->lock, so they race with a
>> concurrent hrtimer_start_range_ns() on another CPU, which rewrites
>> node.expires under the base lock and requeues the timer:
>>
>> - The unlocked read-modify-write of node.expires in
>>   hrtimer_forward() is a data race against the locked write in the
>>   start path.
>>
>> - The is_queued check in hrtimer_forward() is racy with
>>   a time-of-check-time-of-use bug as well: a concurrent
>>   start can enqueue the timer between the check and the expiry
>>   update, and forwarding an already queued timer changes the expiry
>>   of a node inside the timerqueue without re-sorting, leaving the
>>   tree unordered.
>>
>> Timer users which both forward in the callback and arm from other contex=
ts
>> must provide their own serialization, e.g. perf's cpc->hrtimer_lock plus
>> hrtimer_active flag, see commit 4cfafd3082af ("sched,perf: Fix periodic
>> timers"). The requirement is subtle and not enforced; i915_pmu and tapri=
o
>> currently get it wrong. For the Rust hrtimer abstraction it is a soundne=
ss
>> problem: safe code can arm a timer whose callback is running, so callbac=
k
>> context forward and expiry reads cannot be offered as safe API.
>>
>> Add an alternative callback variant that removes the race
>> structurally instead of requiring serialization. An expiry injecting
>> callback receives the expiry snapshotted under the base lock by
>> value and, to restart the timer, fills a struct hrtimer_forward_args
>> and returns HRTIMER_RESTART. __run_hrtimer() then applies the
>> forward and the enqueue with the base lock held. The callback never
>> accesses live timer state.
>>
>> If a concurrent start enqueued the timer while the callback ran, the
>> restart request is discarded and the start wins, matching the
>> existing "restart =3D=3D HRTIMER_RESTART && !timer->is_queued" handling
>> for classic callbacks. The is_queued check is reliable here: while
>> base->running =3D=3D timer, hrtimer_try_to_cancel() bails out before
>> remove_hrtimer() and the timer cannot switch bases, so only a
>> concurrent start can enqueue it, and the start path writes the
>> expiry and is_queued in the same critical section. Thus !is_queued
>> at requeue time guarantees the expiry still equals the snapshot
>> handed to the callback: the deferred hrtimer_forward() cannot hit
>> its concurrent start check, and an overrun count the callback
>> derived from the snapshot is consistent with the forward that is
>> applied.
>>
>> The new callback pointer shares storage with the classic one in an
>> anonymous union, discriminated by a new is_ext flag placed in
>> existing padding; sizeof(struct hrtimer) is unchanged and the
>> classic callback path is unaffected. hrtimer_update_function()
>> rejects timers with an expiry injecting callback.
>
> Aside of the horrible name (what is "ext"?) the whole mechanism is
> creating a false sense of "safety" as the same problem exists when the
> timer callback simply sets the new expiry time without invoking
> hrtimer_forward().
>
> Also why is Rust special and wants to delegate the external
> serialization requirement to the hrtimer core code and thereby adding a
> boatload of extra conditionals into the hotpath to distinguish between
> the two callback variants?
>
> Yes, you found an example for the downside of this design in the i915
> code. That's not surprising because i915 is generally known for ignoring
> documentation and making up their own rules just because they can. So
> I'm not accepting this as an argument at all.
>
> I agree with you that the lack of enforcement of that external
> serialization rule is suboptimal. External serialization is hard to
> validate/enforce in general though it's not impossible.
>
> But let's first take a step back and look at the larger picture.
>
> The obvious question is:
>
>    Why is the base lock dropped when invoking the callback?
>
> The answer is simply that the callback might and in many cases will
> acquire a lock which is used in the reverse lock order for the purpose
> of external serialization.
>
> If you think about that then it's pretty obvious that you can introduce
> a safe variant of hrtimer_forward() which can be invoked from the
> callback:
>
> hrtimer_forward_safe_from_callback(timer)
> {
>         base =3D lock_running_timer_base(timer);
>         if (!hrtimer_is_queued(timer))
>         	hrtimer_forward(timer);
>         unlock_timer_base(base);
> }

FWIW we did discuss about this option. Here's the list of all options that =
we
come up with:

1. Take base lock before calling forward and release it afterward (the one =
you
   mentioned above). This one requires exposing the base lock (at least to =
Rust
   abstraction).

2. Prevent timer operation from within the callback and have hrtimer core d=
oing
   it (Andreas's patch).

3. Force users to stop the timer before re-arming. This was dismissed becau=
se
   stopping the timer will require waiting for the callback, and this is pr=
one to
   deadlock condition.

4. Add a lock to Rust side that all users must take to forward / start. We =
don't
   want to add a new lock just for this, and taking base lock would be more
   favourable.

We consider (2) the best option because it avoids several pitfalls with (1)=
:

- It is impossible to forget to forward and return restart, or forward but
  return norestart.

- The base lock is not unlocked before relocked, so the forward and restart=
ing
  is atomic. So it's impossible to have the condition where the forward occ=
urs,
  but before returning RESTART, the hrtimer is concurrently queued.

- Unlock/relock have an overhead (we didn't quantify how much impact this w=
ill
  be, though).

I supposed another alternative is to add a mode in hrtimer core where the b=
ase
lock is not unlocked before calling the callback, and expose base lock APIs
(like option 1) so that the Rust hrtimer abstraction can unlock it before
calling the callbacks.

Best,
Gary

>
> That prevents the scenario you described in a completely safe way, no?
>
> Coming back to validation/enforcement of external serialization. That's
> a problem which has been solved in other places already. Look at the
> seqlock code for inspiration.

