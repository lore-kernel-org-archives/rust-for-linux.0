Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC249B45F;
	Thu,  8 Oct 2026 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462308; cv=fail; b=cPDC1+mFZ0Acn8y8KuDsAeEKHzUGIra+bKS2Ao9dHDgsJnMlMFS4hM1LDqOIJGPJySye9e63n6zq7kc1MJ3SSy+71LlFjaQCd8Yu7X5PD/+Hi2GA+ectSdbgUPaN5xynBQTQipl02YW324GfsyxAcCxt8TjtVLnwrF651ZVpaJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462308; c=relaxed/simple;
	bh=ahbqmNDAsEhenCopuE4KhWrxOmwHZeceMqgWKtmZuHI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mdFr9GsyVETKeddeqvAyhdxOV8Xn9ecwxIOqd+pf6xTFazAQV42xXxxavimazNAEWaRj3cQoUtY7YeO362lFSEq8Th9aY0PoN6CwTSlwRZc9gS3OpoLQ/om4rtyoZIfE+f7AgiiWZxZznY6/+aqiKZymT84eK0/q110x9aFV8xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HApeCP9U; arc=fail smtp.client-ip=52.101.195.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HApeCP9U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4Cuc4+cd/iS6Q3wCSdE/t95HvXhSs7Bzs+TOKVceyTNmoEl77FGuK2UqibyMDdBrqr6vsno/Jre79bUC22IxwYbftQ93G45ORbcBxuxGPgMg04m7TCwqUEoEK4NWGCWHZUZDTDoJmFVV4HvXD/5LoEwr6ZM7BuQJuLce/RdKB2TY29CpfzLWCLNOAJ8E/ZIDQYUd5XZzy3AH/D1pI7hj/fzFjYEn1oINgybDpMHzyJDZVLf+ilB/of5QeBR/g4x2Y1CduAU9/2OqntqmZNA/oMx7/IWweWovFy87bxiLcVpd8Elfg75kwWkNP5SPLF3Ce18MfzmaBQSt6NnNTyziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCNDSOFTigOayc+11QvTEDOItGIB2ui2Ax0qQP9W0lo=;
 b=cofQ6aU3lQ024Obs+vezowCqxTDlMFBuNB5NWLIXMzp4MT0r/5eTKIO0LERiMSPyrBZB7v6oAIqmFqyKBNfirD6Z6fWiOYxG0hTCT1oMt9/6b4gMajGVTfGVMfRCU5Ys21W0oVgzL4UbxWCQpt0/fb2PQXAtMRxC4GN5D2a/ILEwj/wCngbDNw60Ov6t23suk//9+DwMkx30gEkKJ9l5rG/ejoP9X4om8lm8SVYpxAwkeBxFK7V7EiOcVxnaRHKx256aPEP3nMZ1/7PV4YHlFUB1yb0s0azsfNdEbYl0qw/gQH83YW/o00gpHK3dE1bPSrFUi4/X3l2QpMhiGjrNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCNDSOFTigOayc+11QvTEDOItGIB2ui2Ax0qQP9W0lo=;
 b=HApeCP9UKXG8uGAmIzWYzO3er2qqbru4nQnOaqO/cPzD/C1xwUrj3bMQWc47nE8ThbOZCG6KPt+knUREg2PhHUMXnPJ/5vPvSHqyYN/GNskg76jcXak6s5kGzAhfKBTCMiDnf9a3EDSaEogtVIGlCOKF8lXcixSY1SCsj3jbWAE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB7245.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:343::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:59 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:59 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:03 +0200
Subject: [PATCH 16/20] rust: pin-init: internal: pin_data: make field
 lifetime invariance imply type invariance
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-16-6c1eb269fe57@garyguo.net>
References: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15276; i=gary@garyguo.net;
 h=from:subject:message-id; bh=ahbqmNDAsEhenCopuE4KhWrxOmwHZeceMqgWKtmZuHI=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7M7q/VPocM+NjmGViZrd8pgCLtbzObf2ZFx+b7
 6o6V/qyyqSjlIVBjItBVkyRxaObMW0T42zZy1rlL2HmsDKBDGHg4hSAiaw8wPC/Ymv+601qkfqi
 E0U8P3nlnq9/XvB8fkz/0ZCG75aLTu4oZfgrduMsx9xT7l/erP76d/Nf5aigNXc8+aPvTD7w8WP
 svZWXeADtWUy+
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0578.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: feb6b85b-f99c-4a5b-9b00-08df25372b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|56012099006|5023799004|18002099003|10067099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	O+wNqgbAN2XeUzZzG0CUdpxXw9Rj1tSRWgJIG5i2u6AS5483etH9K/i2288Rh2nL1dGGIK6zKRHitjlabheUqYFWwHrKH3uEsSefYvettJ0PXsnDk0Y6dJSDsvy1yah8Gukf/kDnTMAM4sRVF1Oopm85aTmeoNsKkNKz+bG6CGo39P6FGVgoAkMjRMP/VV+Tg8tO3SOrx/CXFDS046H4OOvEfkdltatmxmVwOPaQCGACqDC8X0fSO2oxsu8OWIlMd6DCoMyGWGiCFWbFPfzYjxKxZzdnrnjyZzeM7S3gZLdCt8Bsr9nYOtqoPQypMuPYV/3urR57JKek6+WkGOXK7aVr2ULTGcpB5L/OInTjRmCY41Y/CN7idnPek3oN7OXA9wWYJPFWFU92WyNrV7ID1zS+oj4egBCAjCLh6GE1ZbW9RWyQZNhfOcn5dSr0MPXh11HXwmnR5xMnPfi2Dc8pqrBRZFFkv+aGuqFJzCo0Ccx5BEfdF/i+P+AVOSmTRtSPKd9vvc1TjJeDXQHeVT5ymQxk+ixobFMTtMbdUILE16hfxTExpI0+EG6h1F42KmEPIzSltKoJMI82RQMS45ONOPKQzA+QWBOE2cV7vKhyP1onzOQY7Rp2iQcdztWAuy6cOglFBJ1Ms2CkU/TctGyZfQ0qCJuZUJBX9nUPDrzKpzc1Vaifeo0YMJrluJEhPrgLN66DU8jTlH1Lw5Ib0u0h7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(56012099006)(5023799004)(18002099003)(10067099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEUrT2FBcFd2MlJ3cFpFSkVVQVA2bytjay85bVBRYjYzOUhQcUZDeVdSTFhx?=
 =?utf-8?B?WEpIeFRJZHgzNlZaQWwyU3VFYWFmWlkrRDZoL2pRU1NZWlJOc1hVdWdzS2RE?=
 =?utf-8?B?WVJRTENUZ0UrMHhjTCt0ZFlrWGVmUDgrWXZMVmxSMlUvK0R5Rkl3NmQ1MnRM?=
 =?utf-8?B?ZlFnMUo4Yi9pV2VzMWM3cWxEVmlNRXM5TFFBVmJlVVB6NE1Ib1JJTnBFU2Jy?=
 =?utf-8?B?RWpZcUF4QW0zc0w5ZndDUGsyVFE2cnpUblhzYUQ4ZFlYUzJsanFsNUxUR1RJ?=
 =?utf-8?B?WDBkTmdtVFg3SEl5RnFxOVNTWmNRcSs5MG1nKzFZK014UDY2d0t3bXgwbUw3?=
 =?utf-8?B?Slkyb2txSlc5RHZEWjZZb0VvTDBpdmlPbkdYdmhoa3Ftb09xdEU3MEVpeGlP?=
 =?utf-8?B?SldDa3hLd0c4Smcvamtub3hMZHBLcVcxcG8xNWFTWEdJK290cGlwVTlhSzM2?=
 =?utf-8?B?ci94OXJZZGh3YWw2U2RSV3RxaG9tYXVvM1c5N3JWT1VyUE1MZGFGVm5NTkJD?=
 =?utf-8?B?REVqb2VNZmc3NGVwdDBBYjdUNjZoQWgwd3dwTzdzSlV5enpJQytub3VYNDM2?=
 =?utf-8?B?ZGtDUTN2NENheElSYlRXS1ZNZm02MlkyVmNoUXI2Qi9vdCt0TnZSM2JxcHJX?=
 =?utf-8?B?YitmQVR0OVRneGdnNkRidlVBYS8ybHZEcGsvS3VMd1VWa2lreFc3bjV4L0RP?=
 =?utf-8?B?VDY5dzVsamJuN0lVUGdQM2cvYkl2QTVNdXR4djNVRFhEb09RS1R6MFBJQmFw?=
 =?utf-8?B?TlpMNWNkU0JHTCtabDJiMlJCYnVGcVVKM2pvdmRkWng3cnVIU0s4RUxEQStK?=
 =?utf-8?B?RmVhMHEwRE0wM0NsdnZaU3NyM2NlVE53MllHbXNjRzB3TXJ0UmZ3bW5iMXJB?=
 =?utf-8?B?V0JqcDZvZ2s1cmQ5V242cFpVdFNYN0VNK1U1ZXZqSVJBWE9tdlhaRUhlbFNK?=
 =?utf-8?B?Z0tJNWk2SGIxbzN3ZEhFK3ZoTjROS1FnTW9Ld3ZHKzIwdmQ1dmtOTU1aNC8y?=
 =?utf-8?B?UDVjNGROMHhPSDVEVlZOQm4vdnI4NXpKVnEyL0w0MThsTkYvcXZSd0JGRklI?=
 =?utf-8?B?QUtRVCtxZTA2Tzk4TWo3THdMWFpQZ0JXUXJzV0MwbjUxWWl6aHh5dDJ3YTUy?=
 =?utf-8?B?NGgwb0NsZzY3b2owV2pZOENTNm42YkxNaWRuOVJHZ0FJNXJwT3lXYlRnU1FE?=
 =?utf-8?B?MmV0THpNVE9pL1FZbTVlNTdmNDJXZGJ3WXpLdE1uVTRoTU1PbHg5TkJJOUJh?=
 =?utf-8?B?R0JvWlVWS3EwQjRqOVhXK3hpejVVUmZlVi9sWlpDT1kwdWFweU9rWDZGVWwv?=
 =?utf-8?B?L2YwZ0hBcmNkMktZT0wvT28yWC9hekZQWXB5dEIyT2l1V0Nqa1dwdENjSE5s?=
 =?utf-8?B?aFVtU283T2QvYzk0Z0lBZ0xqVnBidXlaMTFNK0pZNUtFMzJSUzNwTFFJN3dX?=
 =?utf-8?B?OERsVll2UFNuRVlKaUdFR1hmelQ4SGVCZ3Z0d0VtOTdVVm15cjN0bStXYloy?=
 =?utf-8?B?cW93bG0zSW5Od0RsQXlIOVBJajlEV2JhV3ZRRVdLeTY0dWg1eXNwaVBUazNn?=
 =?utf-8?B?c1N0eTB5UFhGTGY3QURtSmlOb2RidDc1K1pUblFoL0hyM0tNMUpGRW51Zmxj?=
 =?utf-8?B?WFMvWlNoekt4MzVHL1VmVUxVYmFPQTVuYnpmSXNkbnl1dWUyelBqRTJTdnMw?=
 =?utf-8?B?TWtEOUlSM2xoMjlJMHN2b2N2cGZ4ZURzeGZIRmY1T1lqTis2ci9CV1RvQ1Vp?=
 =?utf-8?B?bXdYWW1HK0VzL013T2wxbkhSekxidWhBRmRIWTRqUld6aGx3UGRZUlduZ3lz?=
 =?utf-8?B?Q0lvUGVnYUQ2a1lxR3JlRnlPeXdlY1BWZ0I5aXE1RTV5WDkxRWRUYVVBR3VZ?=
 =?utf-8?B?ckhEZktDOUx0VFJLYnJPQ2syZlNMSGhYUTRkZkZvR2MvQmFSNWxjbHhEZWVh?=
 =?utf-8?B?TEMvU3l2TFlLRFFpejBIdzJsZ1ZpNW1MbjBKaDZXeURqK2lWb1ZEZFdRb2dB?=
 =?utf-8?B?RDJkcUJPaWJCQmU1MDFJaXBaRmNkTTdLK3hGL29wS2dvaWY2MVlZVEtvN09J?=
 =?utf-8?B?ZDlSWk9yd2YzeHhDUXp3OVJ2U3RQaVVWWDMybGt1UXRMcVlMb1BETkFBR3Fa?=
 =?utf-8?B?V0c5NEhjL3k3QklidVZRa1dVSy91L0o1MzVFNUZaNnJ5K0RMb0VsNVdmYVo0?=
 =?utf-8?B?aDVIZDlzckxTcmFJSVhaK040L1AzUW5PSmI1NmZvck5PWDVzckVaY2xzSWRn?=
 =?utf-8?B?UjMwL3N0S1BtRFh4Tmlqc1VoSU9VN2VBays1a2xaclZGb0h1T0diT2o0eHNj?=
 =?utf-8?B?ckVJRnc5QWJ6Z2tBUFlxeUtYdG50YXVpMUNleEpsWVFDNXl2QXp2UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: feb6b85b-f99c-4a5b-9b00-08df25372b5b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:59.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzCwEeytX+xD5yc9YKzqtQPNp2d+xiUxbISoru0L9pCkmb/9/mXPOOwnttHnVXftud3sw1sqhFOx90qr6njFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7245

If invariant field captures a field lifetime, then we also need to make
sure that field is also invariant. Imagine this struct:

    #[pin_data]
    struct SelfRef<'a> {
        #[uses('outer: invariant)]
        part: Mutex<&'outer str>,
        outer: &'a String,
    }

    fn new<'a>(str: &'a String) -> impl PinInit<SelfRef<'a>, Infallible> {
        pin_init!(SelfRef {
            outer: str,
            part: Mutex::new(*outer),
        })
    }

If we make this struct covariant over `'a`, then we can have the following
case:

    let mut long = "hello world".to_owned();
    let s = Box::pin_init(new(&long)).unwrap();
    {
        let mut short = "hello world".to_owned();
        // If `s` is covariant, this would be okay, because we shorten from
        // `SelfRef<'long>` to `SelfRef<'short>`.
        s.with_project_ref(|p| {
            *p.part.lock().unwrap() = &short;
        });
    }

Conceptually, a field's type must outlive the field's lifetime, so if we
have a covariant `'a`, we can have a shortened `SelfRef<'short_a>` where
`'outer` outlives `'short_a`. But the wellformedness requirement of the
field will imply `'short_a: 'outer`, which enables the `&'short_a` to
`'outer` coercion, effectively making the field lifetime `'f` behave
covariantly, too, breaking the requirement that it is invariant.

Therefore, compute an invariant closure and use an additional generics on
`Borrowed` to allow capturing things invariantly. Note that we do capture
all parameters explicitly rather than capture the field type invariantly,
because if type aliases are involved, we might be syntactically determining
that the field uses a type parameter but actually not, causing the
invariance enforcement to be missed.

Outlive bounds between field lifetimes can also cause the same issue (an
invariant field lifetime cannot be a lower bound of a covariant field
lifetime). Since we cannot deduce whether any implied bounds from type
wellformness would create such outlive relationships, prevent such bounds
from happening by using a split outlive chain.

Note that this is not a soundness hole in itself in absence of
`with_project_ref`, because with single field accessors only, the field
lifetimes of the fields are not connected; in methods like `with_project`
lifetimes are invariant so shortening cannot happen. However, such method
is likely desirable, so include the variance rule before it has been
heavily relied upon.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 175 ++++++++++++++++++++++++++++++++-
 rust/pin-init/src/__internal.rs        |   8 +-
 2 files changed, 174 insertions(+), 9 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index d42d86ffd853..b35d32ff2bb2 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -92,6 +92,8 @@ struct BorrowedInfo {
     kind: BorrowedKind,
     /// Field lifetime for this field.
     lifetime: Lifetime,
+    // Variance of the field lifetime, as captured by other fields.
+    lt_variance: Variance,
 }
 
 #[derive(Clone, Copy, Default, PartialEq, Eq)]
@@ -238,8 +240,11 @@ struct StructInfo {
     field_idx_map: BTreeMap<Ident, usize>,
     is_tuple_struct: bool,
     self_referential: bool,
-    /// Field lifetime generics with outlive chain.
+    /// Field lifetime genercis with outlive chain.
     field_lts_outlive_chain: Generics,
+    /// Field lifetime genercis with outlive chain, with one chain for covariant fields and one
+    /// chain for invariant fields.
+    field_lts_split_variance_outlive_chain: Generics,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -431,7 +436,7 @@ fn expand(
                     return None;
                 }
 
-                Some(BorrowedInfo { kind, lifetime })
+                Some(BorrowedInfo { kind, lifetime, lt_variance: Variance::default() })
             });
 
             FieldInfo {
@@ -455,6 +460,7 @@ fn expand(
                 kind: BorrowedKind::Shared,
                 // Obtaining from `field` instead of `field_name` for the correct span.
                 lifetime: Lifetime::from_ident(&field.member.as_ident()),
+                lt_variance: Variance::Covariant,
             });
         }
     }
@@ -474,8 +480,63 @@ fn expand(
     })
     .visit_generics(&struct_.generics);
 
+    // Obtain an closure of invariant fields.
+    //
+    // If a field lifetime is used invariantly, we also need to make sure that
+    // for each generic parameter `T: 'field` bound, `T` is also captured
+    // invariantly (same is true for lifetime parameters). For example, say we
+    // have a struct `SelfRef<'a>` and a field `f: &'a ()`. For wellformedness,
+    // we would have `'a: 'f`. If we have a covariant `'a`, we can observe a
+    // shortened `SelfRef<'short_a>` where `'f` outlives `'short_a`, conflicting
+    // with the wellformedness bound `'short_a: 'f`. This will enable the
+    // `&'short_a ()` to `&'f ()` coercion, which effectively shortens `'f` too,
+    // so we shortened the field lifetime despite it being invariant.
+    let mut invariant_field_idx = BTreeSet::new();
+    let mut worklist = Vec::new();
+    for field in fields.iter() {
+        for borrow in field.captures.iter() {
+            if let Variance::Invariant = borrow.variance {
+                let Some(borrow_idx) = fields
+                    .iter()
+                    .position(|f| f.member.as_ident() == borrow.lifetime.ident)
+                else {
+                    continue;
+                };
+                if invariant_field_idx.insert(borrow_idx) {
+                    worklist.push(&fields[borrow_idx]);
+                }
+            }
+        }
+    }
+    while let Some(field) = worklist.pop() {
+        for borrow in field.captures.iter() {
+            let Some(borrow_idx) = fields
+                .iter()
+                .position(|f| f.member.as_ident() == borrow.lifetime.ident)
+            else {
+                continue;
+            };
+            let borrow = &fields[borrow_idx];
+            if invariant_field_idx.insert(borrow_idx) {
+                worklist.push(borrow);
+            }
+        }
+    }
+    for idx in invariant_field_idx {
+        fields[idx].borrowed.as_mut().unwrap().lt_variance = Variance::Invariant;
+    }
+
     // Create a lifetime parameter for each field.
     let borrowed_fields: Vec<_> = fields.iter().filter_map(|f| f.borrowed.as_ref()).collect();
+    let borrowed_covariant_fields: Vec<_> = borrowed_fields
+        .iter()
+        .filter(|f| f.lt_variance == Variance::Covariant)
+        .collect();
+    let borrowed_invariant_fields: Vec<_> = borrowed_fields
+        .iter()
+        .filter(|f| f.lt_variance == Variance::Invariant)
+        .collect();
+
     let mut field_lts_outlive_chain = Generics {
         lt_token: None,
         params: borrowed_fields
@@ -520,6 +581,96 @@ fn expand(
         }
     }
 
+    let mut field_lts_split_variance_outlive_chain = Generics {
+        lt_token: Some(Default::default()),
+        params: borrowed_covariant_fields
+            .iter()
+            .zip(std::iter::once(None).chain(borrowed_covariant_fields.iter().map(Some)))
+            .map(|(borrowed, prev)| {
+                GenericParam::Lifetime(LifetimeParam {
+                    attrs: Vec::new(),
+                    lifetime: borrowed.lifetime.clone(),
+                    colon_token: None,
+                    bounds: prev
+                        .iter()
+                        .map(|borrowed| borrowed.lifetime.clone())
+                        .collect(),
+                })
+            })
+            .chain(
+                borrowed_invariant_fields
+                    .iter()
+                    .zip(std::iter::once(None).chain(borrowed_invariant_fields.iter().map(Some)))
+                    .map(|(borrowed, prev)| {
+                        GenericParam::Lifetime(LifetimeParam {
+                            attrs: Vec::new(),
+                            lifetime: borrowed.lifetime.clone(),
+                            colon_token: None,
+                            bounds: prev
+                                .iter()
+                                .map(|borrowed| borrowed.lifetime.clone())
+                                .collect(),
+                        })
+                    }),
+            )
+            .collect(),
+        gt_token: Some(Default::default()),
+        where_clause: None,
+    };
+
+    // For `field_lts_split_variance_outlive_chain`, we may need to insert some additional bounds
+    // for types to be WF.
+    for field in fields.iter() {
+        let Some(borrowed) = &field.borrowed else {
+            continue;
+        };
+        let field_lt = &borrowed.lifetime;
+
+        // For each borrowed field that references a generic, we also need to insert their outlive
+        // bounds so they can refer to generics.
+        for lt in field.generic_lt_captures.iter() {
+            field_lts_split_variance_outlive_chain
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#lt: #field_lt));
+        }
+
+        for ty in field.generic_ty_captures.iter() {
+            field_lts_split_variance_outlive_chain
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#ty: #field_lt));
+        }
+
+        // If a field is invariant, then the invariance closure rule will make all borrowed fields
+        // to be invariant, so they're already captured in `field_lts_split_variance_outlive_chain`.
+        if borrowed.lt_variance != Variance::Covariant {
+            continue;
+        }
+
+        for capture in field.captures.iter() {
+            let Some(&idx) = field_idx_map.get(&capture.lifetime.ident) else {
+                continue;
+            };
+
+            let prev_borrowed = fields[idx].borrowed.as_ref().unwrap();
+
+            // If borrowed field is covariant, it's already captured in
+            // `field_lts_split_variance_outlive_chain`.
+            if prev_borrowed.lt_variance == Variance::Invariant {
+                // Covariant field borrowing an invariant field. This is not captured in the chain
+                // so we need to add additional bound. This bound is okay, as the invariant lifetime
+                // is the longer living one, so arbitrary shortening of the covariant one does not
+                // violate their relation.
+                let param = field_lts_split_variance_outlive_chain
+                    .lifetimes_mut()
+                    .find(|l| l.lifetime == prev_borrowed.lifetime)
+                    .unwrap();
+                param.bounds.push(borrowed.lifetime.clone());
+            }
+        }
+    }
+
     struct_.fields = Fields::Unit;
     let info = StructInfo {
         self_referential: fields
@@ -531,6 +682,7 @@ fn expand(
         field_idx_map,
         is_tuple_struct,
         field_lts_outlive_chain,
+        field_lts_split_variance_outlive_chain,
     };
 
     for field in &info.fields {
@@ -639,8 +791,18 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
             ty = quote!(::pin_init::__internal::Erase<#ty>);
         };
 
-        if field.borrowed.is_some() {
-            ty = quote!(::pin_init::__internal::Borrowed<#ty>);
+        if let Some(borrowed) = &field.borrowed {
+            let mut invariance_capture = Vec::new();
+            if borrowed.lt_variance == Variance::Invariant {
+                for lt in &field.generic_lt_captures {
+                    invariance_capture.push(quote!(&#lt ()));
+                }
+
+                for ty in &field.generic_ty_captures {
+                    invariance_capture.push(quote!(::core::marker::PhantomData<#ty>));
+                }
+            }
+            ty = quote!(::pin_init::__internal::Borrowed<#ty, (#(#invariance_capture,)*)>);
         }
 
         quote! {
@@ -836,7 +998,8 @@ fn generate_drop_order_check(dcx: &mut DiagCtxt, info: &StructInfo) -> TokenStre
     // with known lifetime bounds as bounds on the function, and asks Rust to *prove* that the types
     // are wellformed, given the bounds that we understand.
 
-    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts_outlive_chain, generics]);
+    let generics_with_field_lt =
+        CombinedGenerics(vec![&info.field_lts_split_variance_outlive_chain, generics]);
 
     let (_, ty_generics, _) = generics.split_for_impl();
     let (impl_generics_with_field_lt, _, whr_with_field_lt) =
@@ -1399,6 +1562,7 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
                 Some(BorrowedInfo {
                     kind: BorrowedKind::Shared,
                     lifetime,
+                    ..
                 }) => (
                     // For borrowed fields, create a `SelfRefSlot`, which after initialization
                     // turns into a `SelfRefDropGuard` instead of `DropGuard`.
@@ -1418,6 +1582,7 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
                 Some(BorrowedInfo {
                     kind: BorrowedKind::Mutable,
                     lifetime,
+                    ..
                 }) => (
                     // For borrowed fields, create a `SelfRefSlot`, which after initialization
                     // turns into a `SelfRefDropGuard` instead of `DropGuard`.
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index ada07197acd9..f548f59b9b74 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -676,7 +676,7 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
 /// This should be switched to `UnsafePinned` when it is stable.
 /// NOTE: This type needs to be covariant; Rust's 1.89+'s `UnsafePinned` is invariant.
 #[repr(transparent)]
-pub struct Borrowed<T: ?Sized>(PhantomPinned, T);
+pub struct Borrowed<T: ?Sized, P>(PhantomInvariant<P>, PhantomPinned, T);
 
 // Lifetimes not needed by drop glue are considered by Rust's drop check to be considered
 // `#[may_dangle]`. In case for a self-referential struct, we may have fields which need lifetime of
@@ -702,17 +702,17 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
 // outlive the struct. And this can be done by a simple `Drop` impl that does nothing. Without a
 // dropck eye patch, presence of `Drop` impl, albeit empty, tells the drop check that the strict
 // outlive relation is needed.
-impl<T: ?Sized> Drop for Borrowed<T> {
+impl<T: ?Sized, P> Drop for Borrowed<T, P> {
     #[inline(always)]
     fn drop(&mut self) {}
 }
 
-impl<T: ?Sized> Deref for Borrowed<T> {
+impl<T: ?Sized, P> Deref for Borrowed<T, P> {
     type Target = T;
 
     #[inline(always)]
     fn deref(&self) -> &T {
-        &self.1
+        &self.2
     }
 }
 

-- 
2.54.0

