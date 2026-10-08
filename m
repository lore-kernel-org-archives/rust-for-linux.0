Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021090.outbound.protection.outlook.com [52.101.100.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27045013D4;
	Thu,  8 Oct 2026 19:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487634; cv=fail; b=SUxlGWQ9xWpJBazTuVl9bM6x+RKYErMo9ZX7Dey3IdcWNELAKOQyzKskyyMVDvtwMxTe1eVAIhlvTRZ9R02H/hYkRvTw/sdRUynMBk/5+kdwTt546r6cbtJhn3mm3TQH65n8QbXxTgHj+jbPMtI9hrDsqO6a366Hja8/vTXqlfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487634; c=relaxed/simple;
	bh=O42m/rkCrGbY6FLU8sVJWVeoX4Fw3YHod1JEfQoFa/I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KCrl8BQcoMTFkGv/G6HCYjnAywx6q0FUiTUVfqjbK7QMSTqDA2AOwBBekZ+1RhLMNQ2H/5k/gDakk/148fQVf49UrVRoxVK2CjM/gYQNMhV1SFeFF/YNKY6DLXZ0+h7k+GADQ9Sn9BKDd1bdp3LBhXRH06X3Z0eh6YDvxwzlIok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sWLSkY2f; arc=fail smtp.client-ip=52.101.100.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sWLSkY2f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTLblRtz0Ym7MMsUG+Bl1UP6sT4TsUhFro+KtXeAMfA34jc2Y8Mp7YRI/QOoTdTIl1AtkIs6KkEg/QTZFzVfG68zFRkI742xYWFLqG5yx+rDmJGNsBEEV19ZsTeyb6gssSvB2j0cX13DFt7K1LWMCR+U4u7qsK5LGQz9hxd37sRjKtOMdS9siwR3uN6zD2sdgS/yauJjAnNLXYGxlTwkRUOkVEde/PzLhYiZTMNapAGC5epyacFd1cFwFAbZqxnReqZgDsq3vlVASS88OCAoDng9vKBrh8vwfE1fKxs+leDFti5e8P2BGA3/X5+nyXnrSXHx+qagUt2m1BAgKT6RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk3TWj5w4JEy38t5b0KueJlFZgmbJpv9Knn+PYQafxE=;
 b=pzt9ml195q9Sngv01e4qJH9qQJ8eU5AMrI5J8vFF33BpzYEfKQlh6eJJiiVLKRVtPAecimdhpYloA9nBrZj1vUF/hR9/g7+Cyf4Jg4FUOMSFj4YGqZgWUgPGHZN4UfXoNCdY3aPrEdqo+yyeQYt+vdPphJTrhMd7OQmfk3ro7Rfauwl9g/uPYDyE0E99c4yquChhGZGAq7QlNIF4soR7jax/DuOlIi40eFC4w5DywcuvqR9pgWMLxPobcwZ8AXHCAkszy2Z/2SuqD4gQaapTM3jSbPG0PNLpBJflT7l6qF0FXUFflAkx9+8+weYaPlbG91uASBmjDrv3HDWbryYTwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk3TWj5w4JEy38t5b0KueJlFZgmbJpv9Knn+PYQafxE=;
 b=sWLSkY2f0Oo0UJrxwwqg81N8tRQdK4hljp5eZ3+surbnPkQreaN/ZaxrxbDQ+w7TfkYET7OS/ERyGtafdFAOupos/Q62y6FXtACb9TOQx43DlIFPPl3gKESqu/9lEw+merp/sw45SlJl2BY7e2YmRPa8CiarZRZhznwobV8ATBY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:45 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:45 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:32 +0100
Subject: [PATCH v2 08/20] rust: pin-init: internal: pin_data: implement
 initialization of borrowed structs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-8-e280b3c8fba5@garyguo.net>
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22177; i=gary@garyguo.net;
 h=from:subject:message-id; bh=O42m/rkCrGbY6FLU8sVJWVeoX4Fw3YHod1JEfQoFa/I=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcff5Qcbql7y495+XKRKtGNp0utP7Xvafu958bFZ2
 nRC2rdHNq0dpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATGRWLyPDhZdBVScLn6Zd
 39jeduKnrpBS2hr/B8cj7jkxbNtdEB3+muGv2NSDEsdTC28cmcAQ9pHN9YZg15uq1k+Kt2de554
 U7SvMCgCYykua
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 660137ee-082c-481f-5791-08df25721701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	zbp6LygeF7H4LhJ5EwBBD4ZJSRxkoRoBHh7HHmK3zvb4AGFoe9z9H2M1SJbznKyK+Hi/d1KGZov5vzYxJ75JOQbKLTpx/p4H7bnopyezIZfw+aZBBSYBaxlOwvhWHndIQBzpv+OLJKnx5l2LeLzXfuUIWBO10QiefiQEuYUUyyG8q+96Qfl1azrHjrkiBtnipqG6w/HQRW4cqt2rhtbzIDZV1ySjYhfht/fRtkIfcadmH06PjUSXY056KCNssNv6GmJQP2f4SjNkBFjvVCixmCMVgiwU1xfk21ktsA0I2pmA4DugD4OKuTIn2SVejff74SW6KdnLg3nkN33o8SZNHXztGy9w1TTmakrJY71ydQZrSWe214txqZt8CrKN3Yeztf7UJW1/PzUeLmEzIBNZcPOkNCrHnIIhx1sbKzOr6EqdHMCo2r8nwmYi8E5ggeopI0wwT2BKlyMV1nNDTQ7O6GtKbk96r4gTG8p/WAZPkO7Zu97a0jbCBhTX9BoM7tUemmYSQh1fX4gOf5JalEyMfE4l8JR8BI1sN74FPLDIDczUwaRAXUxBzE53ZJt04xv5MWWfpi9pOZzJF0P49yQCaDkBGc2WcHm60Y5XaB7j23sTpeGZVnmtkAWOEp9WGLFORZkBipNOPxIhtp41V/tnaF1A2PRj+B+xjrOhNN6Gdf376B9EI8DAoq4oNF6SHuGvtW/EpEM5H/5KCFjylRtRUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3IyalR2NzhSd095QVJNYlRQeUFsSjhkbXhXamJERm5Pc1hNakhuY25sU2Zw?=
 =?utf-8?B?cVFFMDVXRk82enVXL004K3NQdzZZN2FvaEgycU9yNGI2MHBMaFAzR2NTWkhT?=
 =?utf-8?B?WVVzUmI2NDVTUHpDdkxaQ3psSkJkVWorb29sVEdHTjNORUdJdGE2ZXQ2YlQv?=
 =?utf-8?B?YXYzUTE0c01hTFprSm9KZEt4cGFmUzduSU81cS9BcjdVNkpiWnZLakU3c0R1?=
 =?utf-8?B?bFA2WFAycHp2OTFlZUk5RUZQek5FODVCUWtDOWprb3B3TEtmMnh5SENUeUZk?=
 =?utf-8?B?RjFyM1F3aDFNaisxZDdzUEF6QXhhbmgra2U0cWFBbHp3M3dGOEZVWFZldGgz?=
 =?utf-8?B?THRyejhiSThReGtQY21wNjZmRFNWODg4L1JtMmZkZVpvWTJsaW5veDIxQVo3?=
 =?utf-8?B?U3dGL3VRSjJVWHI5SVlDMStYVjFaZFdIU212OW9WaDF2SVhQOUk4WkJnSU9a?=
 =?utf-8?B?VXhYYmNCSUlXWndVa0NUK0lMa1FCMzM2SDF6cDRlQnN2bDhGVlpRZEs1Wm44?=
 =?utf-8?B?dnFVeWxxdDR5bWx1WGo2SG9VbXFMMkdyeGQ0L2t1NHBVbmdRYjJwa0NYdzVL?=
 =?utf-8?B?d0hRUWM0S3Z5c1VydlFHU3RBTmxTMHBjcmZySStzb1hEaUdaQk1pK3UyZVN5?=
 =?utf-8?B?dzM2ZmpNVzl5Y3FpZ1RzUjh3ZkJVK0gvcVROZjdHcDhxNTlBUUVhRWZWKzlW?=
 =?utf-8?B?SXBtVVhDUFZGQnBXSnRYVStRQ1NzbVpGYUZNVE9WQ3NlZURtdjZmaWRwQzA1?=
 =?utf-8?B?azVoQnBOY1N0eklpWCtDNzdjWUlzay85VThwV3hDS2xLN2V3V3BZYVVnMDQ3?=
 =?utf-8?B?b2huaGw5c1dudWtaUWJyNVREQWw0dTcwcVdVRzBiSXBPL3IyMlNCMS9MQ3BL?=
 =?utf-8?B?eHBwVXExYVlMUlJORnpXS2N4NHJQaHZBYm9OQTJ2bC9QcnFKUDBpQVJIQlpM?=
 =?utf-8?B?ZVVoQ3puVVM1S3dxWUprdnlldFhEM09PN1RFZnVxRjNEOVdwOWtyOXdwcW1G?=
 =?utf-8?B?YmdDOFBRL0duOHFEemdOQW11STNmUERxeCs2dlo2Y2daZjhneUVoZHZ5dkxO?=
 =?utf-8?B?OURBbTVyQ092UXdwbEtTRVVvUmNvd3lYai9EWXl4L1BXYjAzNGsxaElXcGxJ?=
 =?utf-8?B?S1o4dzhxSVNLOUJzYVFyRWNrcjczUnIwekwwRUJjZ0xDQjU2eW5UeWdGdFZZ?=
 =?utf-8?B?VENkUWZ6OWRwYklIalAwWGpFNnJac3VIVmZBVHo0cmNvL2RwQkcvZzBFbjVT?=
 =?utf-8?B?bGxFOFpNR05OTGIxRTRoMGRlLzIrVkxmSFlTZWhRTUpHWUVvbFgzZUFqZTNT?=
 =?utf-8?B?b21EOWc3R21oZWExRFA1YnZGN1Zwcyt5R1UzV0xZLzhMT2ZVWVFEUHdZcmhy?=
 =?utf-8?B?TEdRN1BJMkRLQ0kvZjlRM3E3U3dPVm5XdnpZdnF1SDNpZ0pYb09ibXZrb002?=
 =?utf-8?B?SW5JSDVtdnhhb1FQQmxQZ09oTnBYRGtMUnMzaEw2b3JhUlZESG1LZmFwTE95?=
 =?utf-8?B?VW5BMEprM2FPeldNa1o4SWlXUHRsL1BiMzVNYlZuZVVXelU2TlEydExlNnd1?=
 =?utf-8?B?dGxhYm1hR0RCTnlsZDNJSi90VlNDZTl4YXpKbkhib1BBcWQ3N0FJVU9uK3la?=
 =?utf-8?B?dVp0ZXZNeU51emZnNFJuWnhSKzArVUloemw0bFRreVJEVklIaC9TUmY1QzR6?=
 =?utf-8?B?a1A0SlJILy9OcWQ0amZyR2lzTjRhamtRbTdQcmJkbU1nT3ltMlVlTk9WR29E?=
 =?utf-8?B?N3RCQjhPUk1Yak5hTHphS3JsaEVNRzFUZEVSMnB3VUtNeFpodEtlZU1RWklD?=
 =?utf-8?B?T2JVcG1YWTM4UHBmRitCd09wVG0reXFROTVmajhDSDNmRDVzK0tSbTh3V21U?=
 =?utf-8?B?b2tqaDZwZEIvR0dMN3VwazdKUmJPWjFjMVBxdWVzMUdUcURXbUtKVDM3NzVz?=
 =?utf-8?B?Ujc4bENYbXRLSDFVQm16ZGRPWnVjVHRpSVd3dzcxa3ZlWjcrMW05NVFhWlFV?=
 =?utf-8?B?Q2RRU3dzMnZjcGVTQVVqUUdWT1FPZlBiTURTMFd3OERWUWVDTDhuQnFsM0da?=
 =?utf-8?B?SGdxbUdIMWoyZWIwTTYrd2ZYeVZqZkVLMlN1MEVaNzA5M3k5NlFZSVExd3Z2?=
 =?utf-8?B?MU9PYVVHcU5QV3kwSTh2bFl2aTlUbjZLYVNCaXJ0S1pWNitOWnZiWWtKK3hm?=
 =?utf-8?B?WjEwakpYQVRZV0Y1cW1WRmlLdFBoTWZtVmJ2REhNVFdGQWNzVVJOZ0dLU1Jy?=
 =?utf-8?B?dzhRR0FLQ0YzdHRwbTR0dXJIL0VJb3c0UFQzb1lqelhYVGI0MERvZm1CQ2tD?=
 =?utf-8?B?bXdocm1TV1hBSmR1SUFMQ1RLTlo2N3ZmWVEwVnRWc0libzlYTTdCOGgvbGMw?=
 =?utf-8?Q?50XkzT/0ChiDqxvu0CSENTUqRYntAWghJ5G7v3YxZTVno?=
X-MS-Exchange-AntiSpam-MessageData-1: rl1hOw76/wmTBw==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 660137ee-082c-481f-5791-08df25721701
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:45.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozD3uKguXK8Ld/bh69FchPgWwXteA67yG0ETtwL0f0wsLckdjjlMWpJn7E714yxIku8t+xEPhtBpRO1xO4eQXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

We now have the checks to ensure that lifetime relations are what is
expected, we can generate the slot projections in `generate_pin_data` so
self-referential struct can be implemented.

New slot and guard types are defined (`SelfRefSlot` and `SelfRefDropGuard`)
which gives the generated let bindings longer lifetime than the guard
themselves.

Have `__make_closure` take `data` back as an argument. This gives
`#[pin_data]` an opportunity to change the type to add lifetimes.
Higher-ranked trait bound on `__make_closure` is used to ensure that the
initialization closure cannot make arbitrary assumptions of those
lifetimes.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     |  42 ++++++--
 rust/pin-init/internal/src/pin_data.rs | 114 +++++++++++++++++++---
 rust/pin-init/src/__internal.rs        | 169 ++++++++++++++++++++++++++++++++-
 rust/pin-init/src/lib.rs               |   1 +
 4 files changed, 305 insertions(+), 21 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 80e4dc068d2e..ded2b5283376 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -288,8 +288,10 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
         },
     };
     // `mixed_site` ensures that the data is not accessible to the user-controlled code.
-    let init_fields = init_fields(&fields, pinned);
+    let init_fields = make_field_init(&fields, pinned, false);
+    let drop_check = make_field_init(&fields, pinned, true);
     let field_check = make_field_check(&fields, init_kind, &path);
+
     Ok(quote_spanned! { Span::mixed_site() => {
         // Get the data about fields from the supplied type.
         let data = {
@@ -303,17 +305,29 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
 
         // Ensure that `data` really is of type `data` and help with type inference:
         let init = data.__make_closure::<_, #error>(
-            move |slot| {
+            move |slot, data_lt| {
                 #zeroable_check
                 #this
-                #init_fields
+                // Generate init twice, which is mostly identical except for lifetimes.
+                if true {
+                    // In this path, we use the field lifetime from HRTB to prevent environment
+                    // lifetime from entering the fields, and to ensure that the dependency of
+                    // fields is consistent with the field drop of the struct.
+                    #init_fields
+                } else {
+                    // In this path, we use local lifetime, to make sure that if initialization
+                    // fails, the destructor execution will not cause lifetime issues. This is
+                    // separate as implied bounds between field lifetimes can be inconsistent with
+                    // that of the drop.
+                    #drop_check
+                }
                 #field_check
                 // SAFETY: we are the `init!` macro that is allowed to call this.
                 Ok(unsafe { ::pin_init::__internal::InitOk::new() })
             }
         );
         let init = move |slot| -> ::core::result::Result<(), #error> {
-            init(slot).map(|__InitOk| ())
+            init(slot, data.__with_lt()).map(|__InitOk| ())
         };
         // SAFETY: TODO
         unsafe { ::pin_init::#init_from_closure::<_, #error>(init) }
@@ -360,7 +374,11 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 }
 
 /// Generate the code that initializes the fields of the struct using the initializers in `field`.
-fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -> TokenStream {
+fn make_field_init(
+    fields: &Punctuated<InitializerField, Token![,]>,
+    pinned: bool,
+    dropck: bool,
+) -> TokenStream {
     let mut forget_guards = vec![];
     let mut res = TokenStream::new();
     for InitializerField { attrs, kind } in fields {
@@ -388,13 +406,18 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
         let span = Span::mixed_site().located_at(ident.span());
 
         let slot = if pinned {
+            let data = if !dropck {
+                quote_spanned!(span => data_lt)
+            } else {
+                quote_spanned!(span => data.__with_lt())
+            };
             quote_spanned! { span =>
                 // SAFETY:
                 // - `slot` is valid and properly aligned.
                 // - `make_field_check` checks that `&raw mut (*slot).#member` is properly aligned.
                 // - `make_field_check` prevents `#member` from being used twice, therefore
                 //   `(*slot).#member` is exclusively accessed and has not been initialized.
-                (unsafe { data.#ident(slot) })
+                (unsafe { #data.#ident(slot) })
             }
         } else {
             quote_spanned! { span =>
@@ -455,6 +478,11 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
 
         // A tuple field has no name that could be bound here (the `_0` identifiers are considered
         // implementation detail and not user-facing).
+        let let_binding_method = if !dropck {
+            format_ident!("let_binding", span = span)
+        } else {
+            format_ident!("let_binding_in_dropck", span = span)
+        };
         let binding = match member {
             Member::Named(ident) => quote_spanned! { span =>
                 #(#cfgs)*
@@ -462,7 +490,7 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
                 // struct field.
                 #[allow(unused_variables, non_snake_case)]
                 // Include `mut` so that `Pin<&mut T>` bindings can be reborrowed via `.as_mut()`.
-                let mut #ident = #guard.let_binding();
+                let mut #ident = #guard.#let_binding_method();
             },
             Member::Unnamed(_) => quote!(),
         };
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 6a29ec358c30..307d9b36078c 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -61,7 +61,6 @@ enum BorrowedKind {
 }
 
 /// Information about a borrowed field.
-#[expect(unused)]
 struct BorrowedInfo {
     kind: BorrowedKind,
     /// Field lifetime for this field.
@@ -974,12 +973,36 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
         generics,
         ..
     } = &info.struct_;
+
+    // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
+    // used with `for`.
+    let field_lts = CombinedGenerics(vec![&info.field_lts]);
+    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts, generics]);
+
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+    let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
+    let (impl_generics_with_lt, ty_generics_with_field_lt, whr_with_field_lt) =
+        generics_with_field_lt.split_for_impl();
+
+    // Wrap each field in a `PhantomInvariant`. For borrowed fields, additionally
+    // use `&#lt mut #ty` so the `lt` becomes associated with `#ty` which deduces
+    // implied bounds.
+    let phantom_fields = info.fields.iter().map(|f| {
+        let ty = &f.field.ty;
+        let ident = f.member.as_ident();
+
+        if let Some(borrowed) = &f.borrowed {
+            let lt = &borrowed.lifetime;
+            quote!(
+                #ident: ::pin_init::__internal::PhantomInvariant<&#lt mut #ty>,
+            )
+        } else {
+            quote!(
+                #ident: ::pin_init::__internal::PhantomInvariant<#ty>,
+            )
+        }
+    });
 
-    // For every field, we create an initializing projection function according to its projection
-    // type. If a field is structurally pinned, we create a `Slot` with `Pinned` which must be
-    // initialized via `PinInit`; if it is not structurally pinned, then we create a `Slot` with
-    // `Unpinned` which allows initialization via `Init`.
     let field_accessors = info
         .fields
         .iter()
@@ -992,6 +1015,30 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
             } else {
                 quote!(Unpinned)
             };
+
+            let (slot_ty, slot_arg) = match &f.borrowed {
+                None => (quote!(Slot), quote!()),
+                Some(BorrowedInfo {
+                    kind: BorrowedKind::Shared,
+                    lifetime,
+                }) => (
+                    // For borrowed fields, create a `SelfRefSlot`, which after initialization
+                    // turns into a `SelfRefDropGuard` instead of `DropGuard`.
+                    //
+                    // They're mostly the same, except that `SelfRefDropGuard` returns `&'field T`
+                    // instead of `&'guard T` for let bindings; this allows it to be used to be
+                    // used to initialize other fields.
+                    //
+                    // The soundness of doing so relies on fact that `__make_init` requires a
+                    // higher-ranked trait bound on the closure. Within the closure (which is the
+                    // caller of the generated slot projection functions here), it can make no
+                    // assumptions on the lifetime except for those implied by the struct's bounds,
+                    // and we have validated them in `generate_drop_check`.
+                    quote!(SelfRefSlot),
+                    quote!(#lifetime,),
+                ),
+            };
+
             quote! {
                 /// # Safety
                 ///
@@ -1006,19 +1053,54 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
                 #vis unsafe fn #field_name(
                     self,
                     slot: *mut #struct_name #ty_generics,
-                ) -> ::pin_init::__internal::Slot<::pin_init::__internal::#pin_marker, #ty> {
+                ) -> ::pin_init::__internal::#slot_ty<
+                    #slot_arg ::pin_init::__internal::#pin_marker, #ty
+                > {
+                    // CAST: `as _` is needed to convert types wrapped inside `SelfRef`.
                     // SAFETY:
                     // - If `#pin_marker` is `Pinned`, the corresponding field is structurally
                     //   pinned.
                     // - Other safety requirements follows the safety requirement.
-                    unsafe { ::pin_init::__internal::Slot::new(&raw mut (*slot).#member) }
+                    // - If `#slot_ty` is `SelfRefSlot`, the lifetime `#lt` represents that of the
+                    //   field.
+                    unsafe { ::pin_init::__internal::#slot_ty::new(&raw mut (*slot).#member as _) }
                 }
             }
         })
         .collect::<TokenStream>();
+
     quote! {
-        // We declare this struct which will host all of the projection function for our type. It
-        // will be invariant over all generic parameters which are inherited from the struct.
+        // We declare this struct which will host all of the projection function for our type.
+        #[doc(hidden)]
+        #[allow(non_snake_case)]
+        #vis struct __PinDataLt #generics_with_field_lt
+            #whr_with_field_lt
+        {
+            #(#phantom_fields)*
+            __pin_phantom: ::core::marker::PhantomData<#struct_name #ty_generics>,
+        }
+
+        impl #impl_generics_with_lt ::core::clone::Clone for __PinDataLt #ty_generics_with_field_lt
+            #whr_with_field_lt
+        {
+            fn clone(&self) -> Self { *self }
+        }
+
+        impl #impl_generics_with_lt ::core::marker::Copy for __PinDataLt #ty_generics_with_field_lt
+            #whr_with_field_lt
+        {}
+
+        #[allow(dead_code)] // Some functions might never be used and private.
+        #[expect(clippy::missing_safety_doc)]
+        impl #impl_generics_with_lt __PinDataLt #ty_generics_with_field_lt
+            #whr_with_field_lt
+        {
+            #field_accessors
+        }
+
+        // Declare a type that serves as the entry point of interaction with the `pin_init!` macro.
+        // We use this type instead of defining methods directly on user's type to avoid possibility
+        // of name conflicts.
         #[doc(hidden)]
         #vis struct __ThePinData #generics
             #whr
@@ -1037,7 +1119,6 @@ impl #impl_generics ::core::marker::Copy for __ThePinData #ty_generics
             #whr
         {}
 
-        #[allow(dead_code)] // Some functions might never be used and private.
         impl #impl_generics __ThePinData #ty_generics
             #whr
         {
@@ -1045,13 +1126,20 @@ impl #impl_generics __ThePinData #ty_generics
             #[inline(always)]
             #vis fn __make_closure<__F, __E>(self, f: __F) -> __F
             where
-                __F: FnOnce(*mut #struct_name #ty_generics) ->
-                    ::core::result::Result<::pin_init::__internal::InitOk, __E>,
+                __F: for #field_lt_ty_generics ::core::ops::FnOnce(
+                    *mut #struct_name #ty_generics,
+                    __PinDataLt #ty_generics_with_field_lt
+                ) -> ::core::result::Result<::pin_init::__internal::InitOk, __E>,
             {
                 f
             }
 
-            #field_accessors
+            #[inline(always)]
+            #vis fn __with_lt #field_lts(self) -> __PinDataLt #ty_generics_with_field_lt {
+                // Generate a zeroed to avoid naming all fields.
+                // SAFETY: `__PinDataLt` only contains phantom fields.
+                unsafe { ::core::mem::zeroed() }
+            }
         }
 
         // SAFETY: We have added the correct projection functions above to `__ThePinData` and
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 32bd6d8c39a1..df079e68ec1e 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -109,10 +109,15 @@ impl<T: ?Sized> InitData<T> {
     #[inline(always)]
     pub fn __make_closure<F, E>(self, f: F) -> F
     where
-        F: FnOnce(*mut T) -> Result<InitOk, E>,
+        F: FnOnce(*mut T, Self) -> Result<InitOk, E>,
     {
         f
     }
+
+    #[inline(always)]
+    pub fn __with_lt(self) -> Self {
+        self
+    }
 }
 
 /// Stack initializer helper type. Use [`stack_pin_init`] instead of this primitive.
@@ -322,6 +327,12 @@ pub fn let_binding(&mut self) -> &mut T {
         // SAFETY: Per type invariant.
         unsafe { &mut *self.ptr }
     }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> &mut T {
+        self.let_binding()
+    }
 }
 
 impl<T: ?Sized> DropGuard<Pinned, T> {
@@ -332,6 +343,12 @@ pub fn let_binding(&mut self) -> Pin<&mut T> {
         // pinned per type invariant.
         unsafe { Pin::new_unchecked(&mut *self.ptr) }
     }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> Pin<&mut T> {
+        self.let_binding()
+    }
 }
 
 impl<P, T: ?Sized> Drop for DropGuard<P, T> {
@@ -342,6 +359,156 @@ fn drop(&mut self) {
     }
 }
 
+/// Represent an uninitialized field in a pinned struct that will be referenced by other fields.
+///
+/// # Invariants
+///
+/// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed memory
+///   and will live longer than `'a`.
+/// - If `P` is `Pinned`, then `ptr` is structurally pinned.
+pub struct SelfRefSlot<'a, P, T: ?Sized> {
+    pub ptr: *mut T,
+    pub _phantom: PhantomData<(P, &'a mut T)>,
+}
+
+impl<'a, P, T: ?Sized> SelfRefSlot<'a, P, T> {
+    /// # Safety
+    ///
+    /// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed
+    ///   memory and will live longer than `'a`.
+    /// - If `P` is `Pinned`, then `ptr` is structurally pinned.
+    #[inline]
+    pub unsafe fn new(ptr: *mut T) -> Self {
+        // INVARIANT: Per safety requirement.
+        Self {
+            ptr,
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Initialize the field by value.
+    #[inline]
+    pub fn write(self, value: T) -> SelfRefDropGuard<'a, P, T>
+    where
+        T: Sized,
+    {
+        // SAFETY: `self.ptr` is a valid and aligned pointer for write.
+        unsafe { self.ptr.write(value) }
+        // SAFETY:
+        // - `self.ptr` is valid, properly aligned and live longer than `'a` per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        // - If `P` is `Pinned`, `self.ptr` is pinned.
+        unsafe { SelfRefDropGuard::new(self.ptr) }
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefSlot<'a, Unpinned, T> {
+    /// Initialize the field.
+    #[inline]
+    pub fn init<E>(self, init: impl Init<T, E>) -> Result<SelfRefDropGuard<'a, Unpinned, T>, E> {
+        // SAFETY:
+        // - `self.ptr` is valid and properly aligned.
+        // - when `Err` is returned, we also propagate the error without touching `slot`;
+        //   also `self` is consumed so it cannot be touched further.
+        unsafe { init.__init(self.ptr)? };
+
+        // SAFETY:
+        // - `self.ptr` is valid, properly aligned and live longer than `'a` per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        Ok(unsafe { SelfRefDropGuard::new(self.ptr) })
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefSlot<'a, Pinned, T> {
+    /// Initialize the field.
+    #[inline]
+    pub fn init<E>(self, init: impl PinInit<T, E>) -> Result<SelfRefDropGuard<'a, Pinned, T>, E> {
+        // SAFETY:
+        // - `ptr` is valid
+        // - when `Err` is returned, we also propagate the error without touching `ptr`;
+        //   also `self` is consumed so it cannot be touched further.
+        // - the drop guard will not hand out `&mut` (but only `Pin<&mut T>`) it has been dropped.
+        unsafe { init.__init(self.ptr)? };
+
+        // SAFETY:
+        // - `self.ptr` is valid, properly aligned and live longer than `'a` per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        Ok(unsafe { SelfRefDropGuard::new(self.ptr) })
+    }
+}
+/// When a value of this type is dropped, it drops a `T`.
+///
+/// Can be forgotten to prevent the drop.
+///
+/// # Invariants
+///
+/// - `ptr` is valid, properly aligned and live longer than `'a`.
+/// - `*ptr` is initialized and owned by this guard.
+/// - if `P` is `Pinned`, `ptr` is pinned.
+pub struct SelfRefDropGuard<'a, P, T: ?Sized> {
+    ptr: *mut T,
+    phantom: PhantomData<(P, &'a mut T)>,
+}
+
+impl<'a, P, T: ?Sized> SelfRefDropGuard<'a, P, T> {
+    /// Creates a drop guard and transfer the ownership of the pointer content.
+    ///
+    /// The ownership is only relinquished if the guard is forgotten via [`core::mem::forget`].
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` is valid, properly aligned and live longer than `'a`.
+    /// - `*ptr` is initialized, and the ownership is transferred to this guard.
+    /// - if `P` is `Pinned`, `ptr` is pinned.
+    #[inline]
+    pub unsafe fn new(ptr: *mut T) -> Self {
+        // INVARIANT: By safety requirement.
+        Self {
+            ptr,
+            phantom: PhantomData,
+        }
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Unpinned, T> {
+    /// Create a let binding for accessor use.
+    #[inline]
+    pub fn let_binding(&mut self) -> &'a T {
+        // SAFETY: Per type invariant.
+        unsafe { &*self.ptr }
+    }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> &T {
+        self.let_binding()
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Pinned, T> {
+    /// Create a let binding for accessor use.
+    #[inline]
+    pub fn let_binding(&mut self) -> Pin<&'a T> {
+        // SAFETY: `self.ptr` is valid, properly aligned, live longer than `'a`, initialized,
+        // exclusively accessible and pinned per type invariant.
+        unsafe { Pin::new_unchecked(&*self.ptr) }
+    }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> Pin<&T> {
+        self.let_binding()
+    }
+}
+
+impl<P, T: ?Sized> Drop for SelfRefDropGuard<'_, P, T> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: `self.ptr` is valid, properly aligned and `*self.ptr` is owned by this guard.
+        unsafe { ptr::drop_in_place(self.ptr) }
+    }
+}
+
 /// Token used by `PinnedDrop` to prevent calling the function without creating this unsafely
 /// created struct. This is needed, because the `drop` function is safe, but should not be called
 /// manually.
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index d1ed0561bb27..9ffa76434310 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -923,6 +923,7 @@ macro_rules! assert_pinned {
             let data = <$ty as $crate::__internal::HasInitData>::__init_data();
             let data = $crate::__internal::HasPinData::__pin_data(data);
             _ = data
+                .__with_lt()
                 .$field(ptr)
                 .init($crate::__internal::AlwaysFail::<$field_ty>::new());
         };

-- 
2.54.0

