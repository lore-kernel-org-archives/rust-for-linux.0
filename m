Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021090.outbound.protection.outlook.com [52.101.100.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4B4FD78B;
	Thu,  8 Oct 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487623; cv=fail; b=rSL4Dz82peznRP3158t29kq0N9zef9Nu25k+AheNJzwzCgK68Db+uGed5NuwhnU5BvQnKBpOSuz6BzQv0rIyzXyej6nTujdUtwCyvckl+D3vKzgqCBJFHYwETqFk6RsZGX/Fw3geNdHvsgFYgJbGDDdoh3ofUFOjjbsybRVYI48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487623; c=relaxed/simple;
	bh=uULGdK+hKuOgV2YvappSbZ1ZSUv/jNEVp2uGr8E5vYI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IUWp6OwKRgwT5V+fyH6pWTxGmjc0niH+CZn67XiE+TKpVTXZ9mRRayoyiJPlVSUOfI0f6rhtXQiVsE4j+gRwMmiWCnhZnJoo4TdIvS5ykvuv14c96WpP/ohO1G6ieLKi9wmKRu/BIswvkwEly4xVk3QnLO37CzOsSchhChWoYm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ultQo1Ii; arc=fail smtp.client-ip=52.101.100.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ultQo1Ii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRhLW/S0q3GLqzsZUhV6U4zfyWrR/FEe0vhCQt9tXjh2S0TqCw7SCZzDFglp8rhklpZhYfBrz3rIS62YOGClOiZ+m4j+w/YlGxK/b/UHEWWiss5dNn33HCUubpmOwXsmIk4SBwmweHOFnJorZJMDuMzsXByX7LlrGalxVRPTnsXPkBu4lIRY4Inu0DdkwKWXRwpyi3e/KNN0K6JviZfhj/FD3c2ZIeQqfhQkkbYMhaPCWOb1rtv1IcVUZzm6fXe+N+Ig4gjf3RU0J3A+7l1Mw8I6lksN2AfNytKa0marom/NF3fxhq6deW4WpyIoRGow++V89+74I6VJ8t+Auu2HzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilKQhzP8XumEK8eoJslGFNAASYJoJZq7dfpyVYfYkjo=;
 b=pC/9tK/bIx+28tLwfve+NkJmQS0g7/MZmL+I720NTvYGHZ+tm5/o9U3KFsEx8m/n5hprJbPKMx1sZNAKUsBBCy2LKNTX2gxbhph2me1JcOALeF2fw/9qofrE1gS1HYrlqmRnLkiOLTF9gYYHDsq9RImUSernHXoRqoIbAItOkO713uoUESObM7/Fguydxx2IV197Gn/OyrbyA7hU+52TNth0WoDTw/RYo5tSkainrxfiyxL1fftfm97Y8jxisKvausYwRsoAAQ2QtrFmGnbf55RgVvNRbb3WACglGDZ7M5bghYrGYP/vNQRQtPqEM+3uhFZujNlKDjneKUljVqIZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilKQhzP8XumEK8eoJslGFNAASYJoJZq7dfpyVYfYkjo=;
 b=ultQo1Ii+ScAlcBW5y+XUC53jCu3rXw5kQqJJjWog1lbPDBfvRh7ylChB+sDzKTdRpAfqkWl+zx5ugayNhw85RB/zDXFo8I7U2bMC/5ZywwgGGXNlcETBhFIuPPcs6didQdKVvUY8GouUitYj561IrlITYk96VcHpMTZMpRRLWQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:44 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:44 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:29 +0100
Subject: [PATCH v2 05/20] rust: pin-init: internal: pin_data: teach drop
 check about generics that cannot dangle
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-5-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285; i=gary@garyguo.net;
 h=from:subject:message-id; bh=uULGdK+hKuOgV2YvappSbZ1ZSUv/jNEVp2uGr8E5vYI=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcff5XM23JT+2aF473eK5CexzvMNPsqXD7Q6zbZjt
 U7Iql+zILOjlIVBjItBVkyRxaObMW0T42zZy1rlL2HmsDKBDGHg4hSAiZxTYWS4MzPMeRdr1nbZ
 5EU99WrTbZx3VL3jC9b2yTXSTTmz4Vc2w/9So888i3fK/612PRAbaDWtbL1p7r9Ps9YmTOHz3b/
 b8AU3APKURzA=
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
X-MS-Office365-Filtering-Correlation-Id: 61cb46e3-73b7-41b0-376c-08df25721660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	UYNXZZ4PHKKo1pWgwdc6lbNSx52DKvIiN9lG21X3Ra2DNvKD7LrQRr5yBLXHBBXUEmllpQVE1JUQvmjIffzcP6hUbvZDyb0JbmYaXedZmihhPKSNgsjtaXsYcAaXa+T2NUMNDWfm84kDI35ZAd21kW8cCPFpQt40bUQrDEg+t6QgxDKxx84kuHhOtbwL6OGvNZ++FrUI/IQWg67SfKtmsBJ/O4KI9BHEz6WJfLyI9ttxxagYFygu9S81H+wKUhoF+AoVaOED4+NOxfR7w+RfQCtg9/urnTELQuhh+0SYmU2E1qeE+CZ38ofaTPLjVqYd1n4yM7OS9liKW8ldU81fh7hIQPc75GHSKQQ8080AHf3WK9fZDUWtJb2eysZL2VQA/Q9AW2hLFU0iPOETf0HtLtm18jErpIsF2EXhAP4N6qJ0YUCq/ZaSeLMemGg0bEBHWlDkaZlUfIZIwYnXtnOCfpHwKWWk47oP7xhFgtlGNFHjsn3F01OF3HWSzro8/2Kw1vgdzB4+Vj+fUX1NARZHSjT4UkMOUA59vSin1dyETgFvpn/mOnXmwYswHA0wA+v1tEC4D8qtLxxvwCHbDpuC3UuEEvXRntxAY9NgQxYpKQPJyoOgGNhg20mfZ8t6+twIVk8C41GYqGoAb8wXXpDATnfm8+suaSrlOtu3+0nOO7NCQthT9JSxOOCFXG03rjy/FRFPv0XJRSFS8YFxJQV7zA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2ZvZ2dFWXZkRE0yaGRjUlJoRmw4TERjUVZEc2pSMmxxcUZ3Q1dlSFZGZWJr?=
 =?utf-8?B?WTJ3VVRKRkJNNnlzb05Mc2orSnFvanNvMUZMNE9WRFpsZ0pRS2gvcW5pUW9B?=
 =?utf-8?B?czBxNnc2Wlh3MzRiZnB1OW5NU3h1KzUvaEFhYXMwQXJuUldBWnRSYldYenFs?=
 =?utf-8?B?WUZORjNsZUZyNERyQVFVZjliRDlNSTRmT0k0VVRDSzNYSERLb2NteFVjUFht?=
 =?utf-8?B?ZThucnZ5S1pXd3ExRERBTTlpcmljTHJ0aktpNFphVC9HMXlWbzFxMXEwL2Ri?=
 =?utf-8?B?S0d4SFJBcFgyTzk5ZGhnSWl3QTZTcU1rY0d1OFE5WFlBaUw1QXVmWk5uV2ht?=
 =?utf-8?B?NTZQZGtzUlRJZTJuR0w2V1lZcHVaZitqQ2gxQjkwMTVsMmtnNmIzYjBiMHRr?=
 =?utf-8?B?TWFtaitIOTZXYnpOSUw5UDcyTVl1VjZWaWROWHJ0QVZoQm5Fd2dKaHc1eGVu?=
 =?utf-8?B?a3gwNncwSGhDQ3RabjVuNnRuSWdwb0U1WVJZTmdETVl5OU1wSEUrQXFsQmMv?=
 =?utf-8?B?WnRkNzNzS0ludkprcmp4eDlYb3oxMlYzby80YzBzREk2WHpBQklWTHpJUVFr?=
 =?utf-8?B?VGhCd2NNbi85bHFreGdqRko4eEF0bjUvQTNtd0FwVnRqUVBPWWUvMGhBeXpX?=
 =?utf-8?B?MTBjcERCcWlXNXlXQndDL0hWdUFaclJNSVRISnBBQVU0djBHdkxJWkp5Qmk4?=
 =?utf-8?B?amtqYXhhRWpPaVE0YU1JSlRUbm9BWVR2dlBtUGNrbm5BRjJ2dHFZVGJNS0NG?=
 =?utf-8?B?VGtLcEFhNnZ5S3ZSN0ZTelNjeTFVbTZ1ZHVqK2hKVEtGMkpOTVpXcDZZOXB1?=
 =?utf-8?B?MTlWQ0V5eGNSOHMvNE02ZzhyVWNrVW1RaDJhcVVoa1plQ1o5enFJQU05WG1S?=
 =?utf-8?B?YVdPREhWWDVPUE92S1VFWWdPTUZ2RUt2TzVZSkdCdUJ1RWxZZW5BWGlNMnVF?=
 =?utf-8?B?eVFzY0NFeGxOQjMxWlRCcUthdm5MK05jR2trK3k1WmhvcTQ2ZkZOMytqTlNZ?=
 =?utf-8?B?VHg5djB0ekFuV2ZncVIvYXhRMEZkZ0RSdm5NZ2tXRzUrRENvK0plczB0M2hl?=
 =?utf-8?B?UkhBTnRCTUxzUDBjRmdsam9ZQ3g3MHAwTzd6ZVdwSldxVGJleFlxcktZYmdJ?=
 =?utf-8?B?K2QvUUNVMklxa3o4Q3paRjczM1pqWi9DejB1aGhDVEJFNFJnTytkeXR2bS9t?=
 =?utf-8?B?eTdiMVdBZktNKzlMallhWVdpY1BCSWpqUWZ5dTBqcUpkVFNkRGVpTWM3OExM?=
 =?utf-8?B?dDNsK2tsNHZrK0d2NHlmYVFvTmFnbjB0RXMzNnA0a0s3WkVXUVBQSXQxMzJT?=
 =?utf-8?B?bW8xRms5eFpPTndSQ21TQUJsZ1pqeXVzS0FuaEN3MFhLeDgrN1g3NDk5R1k5?=
 =?utf-8?B?bG1kTXZSZFFjRjExZjJoMkxLOHl6M0VpUVVjZFU5WVZpV0NqS1ZCNGFhRWVB?=
 =?utf-8?B?VitnVkErWlBKVFZ0VHc3d05GN0pGL3JGOUNBWXkxMU1QSytHOWQzazBOaHJ0?=
 =?utf-8?B?NDlmWEtXQXQ1RjRhU3RxUC9ZRU9tdE1sMlArajUvV0ZyL053Y3F1Yk13SVdh?=
 =?utf-8?B?cUFnMW5EZ05SaTlUUVlhek9MMHdnWXA2L0lUSlo0TE1UUEc2Zm1iU0ptdlpV?=
 =?utf-8?B?Q0ptdjZaOFJybXlhczRYVnVQN3ZLUGJiN0RHdmdsSm1Vd1hCVkQxTGg3ZzUy?=
 =?utf-8?B?ZFZXYk03ZDd4QkMrdXNmL05oMElZZ3Z3WmxCNzFwY202QTk2R2tlM0VaTCtL?=
 =?utf-8?B?RzRhY2RVVjFwN3N0c0lNYTFUbTJtb2RobXNMK2Q3T1ZYMDRGU2szV25RL3Nr?=
 =?utf-8?B?bTB5WVExVFRIaW1NSHhqN0o1d2h3VHEvRU9FcXVLSjRhWTZWZnNnVWJHenVB?=
 =?utf-8?B?MHRlQkV4WXh4TC9oSFE5S3JIU2kzQ0JBSW1xS3Fod1ViRFRGYi9SSld2NjhE?=
 =?utf-8?B?eDMrM2ZnMkdwQ29xZDRiZ3U4RUd0UG5Wc0d0c2JZR2RrcmVZYlpySlMxeVVD?=
 =?utf-8?B?UFdvdjI1ZWcra0g0SE11SlpqS0xQVmpGc25GYVdIYjREVnRNUWdPTFF5aXF6?=
 =?utf-8?B?ZDFPMytNQ2djalJjbWtKTEcxNDU3RVcrVkl1M2U0UVhJWlR1MkY3Vk5kdzEx?=
 =?utf-8?B?WmdxaTRQVDNQNjFmS2YrVy9INjRxenovUjl2WmVUaTF6c3U2ZjRLQUVhdWhL?=
 =?utf-8?B?dTRTNDJoYkllUzFzZzJoK1BBK0xsMUFyN2ZIUHBZd1dHRWdKck5QbXNMTm9a?=
 =?utf-8?B?cWYvL3hEWldINTZZdjNJTVRlOUNNQzdrNFEvWWlPMkluUlAxNi9BeWs1THBu?=
 =?utf-8?B?SzZYbGhpaFlYWXZ5Z2VLckZaTHUrZEdBQzY0Q083V0d5cjVaamcvVXFoK2M4?=
 =?utf-8?Q?QWuDwvmB1XOXvzuizFl+HUPgnjaV0qMOr6NYaseyAjKi3?=
X-MS-Exchange-AntiSpam-MessageData-1: 3X8VrmA1SEixqg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cb46e3-73b7-41b0-376c-08df25721660
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:44.2328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nbg68sexvAJD03gma0eh6LVPkMlUKxG2YvgwMBKHCPYLLLAum8cV4QRYJf6+K0oS8qw9wWZltRxlwOXs6D42mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Lifetimes not needed by drop glue are considered by Rust's drop check to be
considered `#[may_dangle]`. In case for a self-referential struct, we may
have fields which need lifetime of borrowed fields in their drop glue, so
compiler's automatic check is insufficient.

Code like this:

    #[pin_data]
    struct SelfRef<'a> {
        borrow: PrintOnDrop<&'owner str>,
        owner: &'a str,
    }

may access `owner` during the drop, however Rust will determine that since
`'a` only is used in `owner`, the `'a` lifetime may dangle during drop.

This is undesirable for pin-init self references, because `&'a str` could
be coerced to `&'owner str` and this could further coerce if there're
implied outlives, e.g. `&'earlier_field &'owner ()` would allow `&'owner
str` to further coerce to `&'earlier_field`.

Thus, if any self-referential field require field lifetime access in `Drop`
impl, we would need to ensure that the all generic parameters visible by
self-referential fields would strictly outlive the struct. And this can be
done by a simple `Drop` impl that does nothing. Without a dropck eye patch,
presence of `Drop` impl, albeit empty, tells the drop check that the strict
outlive relation is needed.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/__internal.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 74dc23506d97..32bd6d8c39a1 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -473,6 +473,35 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
 #[repr(transparent)]
 pub struct Borrowed<T: ?Sized>(PhantomPinned, T);
 
+// Lifetimes not needed by drop glue are considered by Rust's drop check to be considered
+// `#[may_dangle]`. In case for a self-referential struct, we may have fields which need lifetime of
+// borrowed fields in their drop glue, so compiler's automatic check is insufficient.
+//
+// Code like this:
+// ```
+// #[pin_data]
+// struct SelfRef<'a> {
+//     borrow: PrintOnDrop<&'owner str>,
+//     owner: &'a str,
+// }
+// ```
+// may access `owner` during the drop, however Rust will determine that since `'a` only is used in
+// `owner`, the `'a` lifetime may dangle during drop.
+//
+// This is undesirable for pin-init self references, because `&'a str` could be coerecd to
+// `&'owner str` and this could further coerce if there're implied outlives, e.g.
+// `&'earlier_field &'owner ()` would allow `&'owner str` to further coerce to `&'earlier_field`.
+//
+// Thus, if any self-referential field require field lifetime access in `Drop` impl, we would need
+// to ensure that the all generic parameters visible by self-referential fields would strictly
+// outlive the struct. And this can be done by a simple `Drop` impl that does nothing. Without a
+// dropck eye patch, presence of `Drop` impl, albeit empty, tells the drop check that the strict
+// outlive relation is needed.
+impl<T: ?Sized> Drop for Borrowed<T> {
+    #[inline(always)]
+    fn drop(&mut self) {}
+}
+
 impl<T: ?Sized> Deref for Borrowed<T> {
     type Target = T;
 

-- 
2.54.0

