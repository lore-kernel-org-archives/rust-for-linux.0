Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021092.outbound.protection.outlook.com [52.101.100.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFFE30CDA2;
	Sat,  6 Jun 2026 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748867; cv=fail; b=eBJJZ8k9IGEY9+VVQ2CmMvt+dgsNQW6oZ0/CNeE6S7a/XEKiNW5p+IAzr9j6FarloAyty7sfTc8Yes8gGjEFl75dcZF3bpGWJkqJwMIClxjumMrF7/WTIHh9NnQmy7CyV/o5Hsnbrk30MGaUfUldWEdh+Iu+E9uE6t5gz7Uw3N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748867; c=relaxed/simple;
	bh=IhmyugpztdNMqjgVxwEy8Kt3c4kfZPuqsiRRk0QbC5E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=elpSS/F8wQLzTQIXs0iF2wG8inXQ4hKlWyiogoxwbd+4Wl6Wvk59rm0eMMneVYKBTQJSSZ8XxG2jRqwkvPbnsZdVsTG68jCDimS4wlsWVSuBC83ZZZgkQZaQ9bXiCoRukPtGOPBb2wZ4yZjFx4DKGulle1he9VJsEcObjMmSjfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=I+g07KNN; arc=fail smtp.client-ip=52.101.100.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="I+g07KNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWsAvRlkvHqO+G7xmUGwKlfuWp6fR781LZDVbJJxWwRAznZcccdbien4vI0EMJCMOclrt9MLMDkVYhe5WhvOjnFcLYs8GCAnh1tz0uiNXFSAWG8M1KXN1kgVyWp6ETgaEG4+zN8wSgh4Hr+8QEAxJRi+riChgZ0zzK8kudP+snFoAtOBFqjmrsyh9tmbx+QEoldeGLMCDD10yRNVz8MRxoA47Xh82LrSruyYyYhMLwmEbfhHIMfwim2jjtUljP+eeREbgu1va/VLgqe7mjEnZ+A0E9kXUnLmkhWxVB00EKTOSWNJfJs/FcVgjWOwVpRnOvzYHrTSNOSMDNwtwZFNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTmB3iowFSGbou3l1+NLt/ChMQlTo4QbxaSgwNRvv6Q=;
 b=K9ZwCi3snMH18QI/n/W1Ivow+5qhrMT8SislGtxyzP5lOi5LABh2ZhJfDw6o8yIiH8jrUIs2CnQV0BYj6PcnIQYEO/hKwxAgzXmAqmkBCGRpoYMNPc4Am9qNWbRYe5yb//MMzoWGyo6TPEcKycvdtzA+chY8qR9WExvssFQGA8C/meuoUjzH+hduKhIcq+TnT5eurt34478U8rX+Um7P+j0tIC+h4qfosXcR9y47J5yhqZWu+2fkK04H8xMJDaqIRiC3EQlXmeg6V6PgLlfin6DWFyHIHl/goRq0tRiYjp7Uspt5UDZ/VZEt4Kmn3aFgLWj90Pt26ZjwfIq7AE+ERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTmB3iowFSGbou3l1+NLt/ChMQlTo4QbxaSgwNRvv6Q=;
 b=I+g07KNNLzWL/RWtN5mlJ6oCT5XKypaB92e3kJfvpbPg8/L7sZPd0C2M3gxNqLXZCicSvBSrDP3cvBvHdWdyLLNr88v+DmRDDXc6l0aJXXV0lbKJEGrBXIxoShmztIiRj92mUDTSk9zksHEUt8fpAz4pk1EG7Z6A/5VotJ5oSR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6506.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sat, 6 Jun 2026
 12:27:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.010; Sat, 6 Jun 2026
 12:27:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 13:27:42 +0100
Message-Id: <DJ1YSDVN7UJJ.XNH9EN0UQCIK@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich"
 <dakr@kernel.org>, "Uladzislau Rezki" <urezki@gmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH v2] rust: alloc: add per-task memalloc scope
 abstractions
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260605-gfp-noio-v2-1-cfa2e236c2a3@kernel.org>
 <aiK3R1yRHj8zcGuh@google.com> <87ecikhyq9.fsf@kernel.org>
In-Reply-To: <87ecikhyq9.fsf@kernel.org>
X-ClientProxiedBy: LO4P265CA0117.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4b40dd-ad0d-4760-a78d-08dec3c701ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|7136999003|22082099003|18002099003|11062099010|4143699003|5023799004|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lqHhcdociHpCf5qG2EjW+DysXgwP0c55BKQOnY59jzkHTkztQAU2LBjgM9jWrCEpRvG14NIk6bptg/U7Y2C3A+fq/kaHNV+CX6kqTl4ahAiXmmeih4MvX7Hx4otXaux1ccM7rN0vGcpJCuUsINhHxKZnW3g28hOxSLtKregZo9cMqXV1lj9ZYx6Wwp3rRGJzqpdoIIoBitizg680vFjfn+idbYd4v3nOLj/wGwtiHhqvFdWeXtBW7ecffRadF31oljhhuGVnanEpJE5YlSRWfcQyu5psNyApa5jjhrNI0RlG3BHspRDxsNk6Onx9/zeHihpb6uZAyAsNrNKNOHzzyF7j9vAvVEkH1USv9E+P2lXLD3Yd2bryj5a8xiPQRDa/Y4iTetru1WLbzwpNxyAeYLKrJgJpvUpUGakTsfiC19QhnFdLopQwE7EWQqaYCIm9JY8in28+wLp09Mw7dvD/eHAFyEmbxRrfCqsUMS63n6KbIWcCqeMmP5oFu3jYZq1Qwz3WeN9di453QRCOkq7BCDLMSfu6FLlfUgDeeqRLGTFLurhOliKa6mnTXuj7QrKNqChKeiBxy0EQwZT7WeJAlbPyCAV8cAYrwSdxFXKWRGDDLSHUi+eLxtidxmrgAvI8C42ujDQA1oyfYFUHhX2u3i67YYvud9NQL1iGmvmJ9KA1Y8Dx+76OXE1m7EqXkPRB7az+YnhCXkbD7+9tWOAZCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(7136999003)(22082099003)(18002099003)(11062099010)(4143699003)(5023799004)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ByUDRVRmpDMXQ4RFFLdFFCWnNpOEhEWWxQS0YxREpvTlNuSnVJRVRqVHRq?=
 =?utf-8?B?OUtlQ08yRDFzOUR5b2NhSEtlaUxLZGZwWXJWTDJ1eHlESVZCQXMzNWthRSt4?=
 =?utf-8?B?bUpIQ3ZxR0hQWUpiaDcxNjF5MVRHUXJEbU95eVd2eHorRFI3emRVdXNrK2xt?=
 =?utf-8?B?N3c2VUJnWUdzTXNDekVqY0dmTU1LUjFJM2xuak96VXg2UnArcGNqa0ZWK1FJ?=
 =?utf-8?B?bm45aGt6MHpSUGdReHprek5IQm1iYzIreHltbittc3Vrc1NMVUsvL3lYRGRB?=
 =?utf-8?B?UThsTUZpb1VFLzRremxzQTNsRFFiNEZTaVNxckFFd0drczRVd0N4T1o3aTd0?=
 =?utf-8?B?NTc5VEdVZHdrc1lXY3BMU2Y0VnpqcTBsQStZSnZrUndSSG9lSjN2RkV3UXJh?=
 =?utf-8?B?dnN0elVZSmx2eVRVRFU1cFM3T0p5NitlUHcvK0RZb0VTS21aZUNMS1RUZmJn?=
 =?utf-8?B?OHo0aGpQZkw1QWpDYVhHbjZTRDRYVC8yZjM1L0VCbXd1c3FJYkJiUDNvQXll?=
 =?utf-8?B?NENpYlRqYUZ5YkU0ZTc1d2hqOXdGN2NzR1dIY2FFbTBwM3d6Q0dNWCs4NEJa?=
 =?utf-8?B?NkVwRytuSjhGdnBNWjBkcjJOS1FMQ2Z4cDk5SU5LbFJRdVIvZDRZT1dpNE15?=
 =?utf-8?B?WlRPNGZQeUFhN0xqTW5nMnVrVGxMR2Z1Y1NTcy9XRHBmSk85K1JMNFNVcy9B?=
 =?utf-8?B?cjFvRVlOOEIyVSswSFhmWFhpQmxEeXhTd0YwK080S3kxVEp1THZvbVhnUjNm?=
 =?utf-8?B?SDZHUVdNWmhKT3o3SnJPV0xveXkrUGtMZjdhVTQvRHczeDBhRmIzMkc1ZVZa?=
 =?utf-8?B?aUJpalJVNTFCZlc1aGdtN0pVR21HY0phN1JLYjRHYkJsZGVtM0w2VUJiWHBZ?=
 =?utf-8?B?TFJpaStmQzhhMDFSNUwwSVhqS290SlJsQTltcEdESzRuYkRMTnFLL3hCemtC?=
 =?utf-8?B?eXNjSGhTcXYyemtRaUFiQmt4c1NTQnRIaTA5UjBtV2tzR2F5TkpCMEt5TTV6?=
 =?utf-8?B?NzE1YWd1YjZjOXgwMVg4UlRMdjRVY2w3dUtheEFjWDZvR28vTVJaUDJEM0RI?=
 =?utf-8?B?UnFUVzBOQnkrY1IwQnFidGp0ZTE2NmZtdzRMWUdmMENValY1a2VLZFZkTlB1?=
 =?utf-8?B?Ry96Ynk4OVlyY1VPc2Y0MGNSaFlDeG93WXlqMWNuVWtIMnNDWWlNVTVRSjk4?=
 =?utf-8?B?dU91ZndXVllLaTBHYWhMNThwdFB2UmdVN09rQlhkdHBQMHNoT3JvV2lxR2R4?=
 =?utf-8?B?UFFaWjYvV3UvNjhuS3pIK1pZZ2lSeVIrSllSSXg2M3NSTWo2VUlHcGdrUS9K?=
 =?utf-8?B?S3VuRmtEYWpjc2hEWlV6eTNYTWZ1VEk3aTJoemxYRWNlbXdlQitmMDVGVlFw?=
 =?utf-8?B?dFVhcmI3ZmRKTVdBZ29XYTBkK09vdjZpcFYrd0ZOT1lXR2VNcFE2c2E2QTdF?=
 =?utf-8?B?bm8rMWZrdVdnNytuUlVsOUg1VkZDSWNhdHFlRHo1SktObXM5NjVaMmR5SjBO?=
 =?utf-8?B?Z1h2VDZSQVZWYWtjRmRGd0pjRGRSYVVMZG9UdGJ4TGlXYzNPNnhOSDBwZnFv?=
 =?utf-8?B?NS83TzVlR3RqYXIyb1V5d1laMTJ6bEhKQ0w0MkgwTHFKMVljWE9ZV256dEU4?=
 =?utf-8?B?WCtxR1ZRWWxvZ1NlczBGQmV2aDA0bUxRUmRLSy9KSHpWZWdZTkIvbzVReDF5?=
 =?utf-8?B?L0kvMm5XOS9RRldNT01RNFNhYW5xT3lyQm1IUlF4elM0VkVUWFpjTW1CTDk2?=
 =?utf-8?B?RTZvS1k0SVJleTlxRjBZYnplNzVMQ2MzdzBod2NWVlJJdlR5ZUFDU1BPeTFv?=
 =?utf-8?B?RktuOW5WSGhJK2kwRzlHQ055OGJja0FoZzgwU0E2eDNEK2JpNjJPYk9SbW9y?=
 =?utf-8?B?ekhGR1hyN3JXVWhoWlA1bndreWtxMlNqMDFPUWpVY09IQmZCeDZsbSt4U1ZK?=
 =?utf-8?B?Z05FQVk3OVJacHVka25QaWhLRjQ0Kys5d3NjU2d4R1hXbnBKUkRRMndLNWE2?=
 =?utf-8?B?MElPVmptenZCUXQ2bkJXQ3J1ZEh6NHZWa2hrWWJrVVlidC9Ic1VSOGNPNzBz?=
 =?utf-8?B?S3Jwdjg4eXBJcGRZb1RQV0pUdGdxMk0weVBCQ2xiSHNzenowMXZTMkdWNHBu?=
 =?utf-8?B?S3UvNWd2Zk1jLzM3VUJ5RVI5UHZEd2ZBMG84Y0FzV2lKTS85MEtpS05zT1M4?=
 =?utf-8?B?bXI4NXRPcWphanZ4b2VqZ3B1MzhWckZGR1IwbGlYTDd5WDk0UXg4NXdsVk8z?=
 =?utf-8?B?WU1lSHYvaEJOcCtUSGFXZzM5OUdMVlBCaXR1QUJUczJRM0JFcGx0U0pmWXFN?=
 =?utf-8?B?aUNlUFprS3FMSEd1Mlg4NzV1M0lySm1mbEgxd3ZKdGJlVk5nQzRJUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4b40dd-ad0d-4760-a78d-08dec3c701ba
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:27:42.8660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heQNrsMRHB1l5Zoh8wQMyS+MgoJNndIxnRkTafen3o8Snq7cmyixPSy2lOUHRW/a0TowZfiKbxxjs6r9ukHC0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6506

On Sat Jun 6, 2026 at 9:14 AM BST, Andreas Hindborg wrote:
> Alice Ryhl <aliceryhl@google.com> writes:
>
>> On Fri, Jun 05, 2026 at 12:54:41PM +0200, Andreas Hindborg wrote:
>>> Add an abstraction for the per-task allocation policies exposed by
>>> the kernel through paired save/restore helpers in `linux/sched/mm.h`:
>>> `memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
>>> `memalloc_pin`. Each pair toggles a bit in `current->flags` and
>>> returns the prior state for a later restore. The pairing assumes
>>> strict LIFO nesting; restoring out of order corrupts the per-task
>>> state.
>>>=20
>>> Wrap the four pairs as a generic `Scope<K>` guard with a sealed
>>> `ScopeKind` trait. Tag types `NoIo`, `NoFs`, `NoReclaim` and
>>> `MemallocPin` select the underlying save/restore pair. `Scope` is
>>> `!Unpin`, `!Send` and `!Sync`, and is only constructed through the
>>> `memalloc_scope!` macro, which binds it via `core::pin::pin!` to a
>>> hidden stack slot and hands out a `Pin<&Scope<K>>`. Safe code
>>> therefore cannot move the guard across tasks, drop it ahead of its
>>> lexical scope or otherwise violate the LIFO save/restore discipline.
>>>=20
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>> Changes in v2:
>>> - Rewrite the patch to use scoped allocation flags instead of exposing
>>>   a `GFP_NOIO` flag constant.
>>> - Link to v1: https://lore.kernel.org/r/20260128-gfp-noio-v1-1-9a808fc4=
9b44@kernel.org
>>>=20
>>> To: Miguel Ojeda <ojeda@kernel.org>
>>> To: Boqun Feng <boqun@kernel.org>
>>> To: Gary Guo <gary@garyguo.net>
>>> To: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
>>> To: Benno Lossin <lossin@kernel.org>
>>> To: Andreas Hindborg <a.hindborg@kernel.org>
>>> To: Alice Ryhl <aliceryhl@google.com>
>>> To: Trevor Gross <tmgross@umich.edu>
>>> To: Danilo Krummrich <dakr@kernel.org>
>>> To: Lorenzo Stoakes <ljs@kernel.org>
>>> To: "Liam R. Howlett" <liam@infradead.org>
>>> To: Vlastimil Babka <vbabka@kernel.org>
>>> To: Uladzislau Rezki <urezki@gmail.com>
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: rust-for-linux@vger.kernel.org
>>> Cc: linux-mm@kvack.org
>>> ---
>>>  rust/bindings/bindings_helper.h |   1 +
>>>  rust/helpers/mm.c               |  40 +++++++
>>>  rust/kernel/alloc.rs            |   1 +
>>>  rust/kernel/alloc/scoped.rs     | 231 ++++++++++++++++++++++++++++++++=
++++++++
>>>  4 files changed, 273 insertions(+)
>>>=20
>>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
>>> index 446dbeaf0866..1931b131345f 100644
>>> --- a/rust/bindings/bindings_helper.h
>>> +++ b/rust/bindings/bindings_helper.h
>>> @@ -83,6 +83,7 @@
>>>  #include <linux/refcount.h>
>>>  #include <linux/regulator/consumer.h>
>>>  #include <linux/sched.h>
>>> +#include <linux/sched/mm.h>
>>>  #include <linux/security.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/sys_soc.h>
>>> diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
>>> index b5540997bd20..b8e7492512e8 100644
>>> --- a/rust/helpers/mm.c
>>> +++ b/rust/helpers/mm.c
>>> @@ -48,3 +48,43 @@ __rust_helper void rust_helper_vma_end_read(struct v=
m_area_struct *vma)
>>>  {
>>>  	vma_end_read(vma);
>>>  }
>>> +
>>> +unsigned int rust_helper_memalloc_noio_save(void)
>>> +{
>>> +	return memalloc_noio_save();
>>> +}
>>> +
>>> +void rust_helper_memalloc_noio_restore(unsigned int flags)
>>> +{
>>> +	memalloc_noio_restore(flags);
>>> +}
>>> +
>>> +unsigned int rust_helper_memalloc_nofs_save(void)
>>> +{
>>> +	return memalloc_nofs_save();
>>> +}
>>> +
>>> +void rust_helper_memalloc_nofs_restore(unsigned int flags)
>>> +{
>>> +	memalloc_nofs_restore(flags);
>>> +}
>>> +
>>> +unsigned int rust_helper_memalloc_noreclaim_save(void)
>>> +{
>>> +	return memalloc_noreclaim_save();
>>> +}
>>> +
>>> +void rust_helper_memalloc_noreclaim_restore(unsigned int flags)
>>> +{
>>> +	memalloc_noreclaim_restore(flags);
>>> +}
>>> +
>>> +unsigned int rust_helper_memalloc_pin_save(void)
>>> +{
>>> +	return memalloc_pin_save();
>>> +}
>>> +
>>> +void rust_helper_memalloc_pin_restore(unsigned int flags)
>>> +{
>>> +	memalloc_pin_restore(flags);
>>> +}
>>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>>> index e38720349dcf..8ebb8c9f3e67 100644
>>> --- a/rust/kernel/alloc.rs
>>> +++ b/rust/kernel/alloc.rs
>>> @@ -6,6 +6,7 @@
>>>  pub mod kbox;
>>>  pub mod kvec;
>>>  pub mod layout;
>>> +pub mod scoped;
>>> =20
>>>  pub use self::kbox::Box;
>>>  pub use self::kbox::KBox;
>>> diff --git a/rust/kernel/alloc/scoped.rs b/rust/kernel/alloc/scoped.rs
>>> new file mode 100644
>>> index 000000000000..0251792c9f3c
>>> --- /dev/null
>>> +++ b/rust/kernel/alloc/scoped.rs
>>> @@ -0,0 +1,231 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Scoped allocation policies for the current task.
>>> +//!
>>> +//! The kernel exposes several per-task allocation policies through
>>> +//! save/restore pairs in [`include/linux/sched/mm.h`]: `memalloc_noio=
`,
>>> +//! `memalloc_nofs`, `memalloc_noreclaim` and `memalloc_pin`. Each pai=
r
>>> +//! sets a bit in `current->flags` and returns the prior state, which =
a
>>> +//! later call restores. The save/restore APIs assume strict LIFO
>>> +//! nesting; restoring out of order corrupts the per-task state.
>>> +//!
>>> +//! This module exposes the policies as a generic [`Scope<K>`] guard,
>>> +//! parameterized over a [`ScopeKind`] tag. The type is `!Unpin` and
>>> +//! constructed only through the [`memalloc_scope!`] macro, which bind=
s
>>> +//! it to a hidden stack slot via [`core::pin::pin!`] and rebinds the
>>> +//! handle as a shared pinned reference. Safe code therefore has no pa=
th
>>> +//! to either move the guard or drop it ahead of its lexical scope, so
>>> +//! nested scopes always restore in LIFO order.
>>
>> Your scope trick only works in normal fns, not in generators such as
>> async fn.
>
> Could you elaborate what would happen when this pattern is applied in a
> generator? I don't immediately see how the LIFO drop order can be broken
> when this is combined with a generator.
>
> Would a closure based approach have the same problem?

Generator/async allows you to do this:

fn bad_fn() {
    let mut p1 =3D Box::pin(async {
        memalloc_scope!(let _noio: NoIo);
        pending().await;
    });
    let mut p2 =3D Box::pin(async {
        memalloc_scope!(let _nofs: NoFs);
        pending().await;
    });

    let mut ctx =3D Context::from_waker(Waker::noop());
    p1.as_mut().poll(&mut ctx); // Save mask and set no IO
    p2.as_mut().poll(&mut ctx); // Save mask again and set no FS
    drop(p1); // Restore the original mask
    drop(p2); // Restore to the mask after no IO save, which is wrong
}

Best,
Gary

>
> Best regards,
> Andreas Hindborg


