Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C24FDA51;
	Thu,  8 Oct 2026 19:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487624; cv=fail; b=KLpiX/uGDaTzaa0cHyRZxMaFHw6AYPfBiBGjjuPr+id0+Fc/9jWpMA/FuSpNgH+hj7H+3EG4+EMIxW/bgvu0fJXZMh+Z2qNJnV0X491ZCBBZ2xWBwXgBxs8+9B/bLyzagd2MLQMag8/URDDtyEsP7RaK0UR8I4IBIA3Eq+ygPRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487624; c=relaxed/simple;
	bh=/ti7dbuhqTT7id742FU+JSzSRMfx5eKjnvJrlX3KIDE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rqAULbgnJNlD7XjCDvt4LKsBcpW3AVsiTBusqDtBMvJrdmIWWhSdJGrAwhU5FrK6yf+Tzj4/42e+Ik2Bu+UC6rUO7nMTuPdsRo2h54myDCyLiNIWJ+nmj0LAwCb3yzFqtjKnC5fMsDYc3FbfuLfU0b7/eWFHeIIoS4inbfl5LxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AbX409rP; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AbX409rP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxoU2i86/XdNGZ89QjCFpwd4KSlF5DpZTJWjYmEyBmh1xkegTnf2hYyYvNo/psvNtj617ZHamhCWTxdtHoqSIOGCemn4PmEzwVQThIGrW647H8LmT+3fknnCruPhDoeRWKFdNtormGjZxaBGUaUCRUBETOiSD0qroAu7QFjDhg5Nf5FPGWVj1pro23gfcKpC9fjLuxGEDekPPl+hQ4MfIi9BMdXw72+pbo+CTcAXQRXlf/QLDUzLn5TJNOjshf9J6i+/ryLmdkPU8lP50DnJuh34Da+iT9m9DDZmCdnWegh1LxRK1Uu3qkRokM/HArndLtBQjHisDgDXFqcxlGk6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwNPpQgcamD5j8GD+zA5ZH8/Jdpcq6lHG4I9IDyxPIU=;
 b=C+74UXv0qJXjDbZUSYdEF204XoIL3nNmmZ37hKIyeCdGzhW+rxS/+q0l+fTxxMj1kSIdQpf7GPmjQeFnEGvpQUBsGyxmorv6xXQWzCTs+TrvnjmgsWOmnBMSflVy0bgYjmcG3VPwGT+FMRj/gnCvQVzfbNUQGt9S7kMewR+0MctvMoflGEnj5QOPC5MXjErkmH9ebjPulQSLN8oKUunjm1QrMTfw2vwuw2HjvaGTXc0vBgr+MFyi19k1H4bd+BKYmYChx1zZTKGck7Sz3lRhDmtWDGXN4K2jZVfdXSqqalskmnmkvG26sMmrlhDmhjQe9envATBxEPjQFZvqY6YoyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwNPpQgcamD5j8GD+zA5ZH8/Jdpcq6lHG4I9IDyxPIU=;
 b=AbX409rPxmW8QT9AB590JTevj1PMgUubHFGtMdu0mm3V8Cq8neuvlkrKwHhd5IDWszF39bjIQgD/PTKScU8yKash14pqdmsxv5DP1k2oE2rUga0/463OhqOjRy80e8lMARHandZIqnUOlE1q3w+AIhHbj6BbX4WXjZPHynJrB/4=
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
Date: Thu, 08 Oct 2026 20:24:31 +0100
Subject: [PATCH v2 07/20] rust: pin-init: internal: pin_data: check
 covariance of self-referential fields
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-7-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5509; i=gary@garyguo.net;
 h=from:subject:message-id; bh=/ti7dbuhqTT7id742FU+JSzSRMfx5eKjnvJrlX3KIDE=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcff5RfInbv8/PV8OVdpCaGaRQ/mPZNYO+3lIteaR
 Y/PCss5/NboKGVhEONikBVTZPHoZkzbxDhb9rJW+UuYOaxMIEMYuDgFYCK/jjP8rzv6zFjtg8qh
 /WIV/59vW5IvH7o3O6klPvxg3P6JHnuM2xgZ3uyX/XP67QL9F4Vcp1uizCN47zwtt/9TnHzib8/
 5ipOPOQGRu037
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
X-MS-Office365-Filtering-Correlation-Id: e8c8590f-fce8-4986-b311-08df257216cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	Pz6g5unjxzncdzd4pjHX5gsIg3u0cPrVIU/O8h7NV2liA9jD8YeHrN++L/OFp62M0avFdeDhahE9lg9d5zbytw9u/8SckUUqYTHy6vEOsy0aWoFe0CHchFTBna8qOGUry25hIPXzQXlyrmlwQKh5uBOVby7VsOwypEwCW6dxA0AEzlV3izncY5txl5CWOT4D2QAMAndjQGjLCy4cXkcvMZ3+ovcyGlDi8Vikx5ZJsc0Esk8LhUcxWWVIDCGJasp3IzVcFTZi6/fRQkYjicS9T2vQccPOO6OwmypVj2NHa4yKjxi1niM6q+gzuAD1SY8HDeHhFbx7RBbn+2YLZUgCQQb0w/UhC5iIfCU1X1v3ieXpZhAq8eoPKQWGF3Abnsr7mQW9HxieZGq+8tuu9i/1bBHN5xa1dMqgde0dIlgQp6vvSjFpZdPB+HzxR0f0SrKg26dYE1BwIMpsRPFJPIWbog4VEnlgtlBtntPNSF5VAGEga8k6yLlRkrJte/uyWumeM1NJ9w6sIsHWMRByyNJHoc+hD5RttR1qAhmd9DQf7/83wyv+/5e/gUhj+ggLXUX++gYqAhte1etLbxGx0Cfj0HuQigg3a65uSs/RzR1NDrA1yhlA7AwGEUSFMtBI2bhfp9ErREilVTRGgzQSj2YniQidqNAbwT2ZNtWbrraiC6uInrQRRMCHX5pMk+pRnyquRmxfpalA8wqD6PtQ8pWkPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3N2R05yL0d5SW8yeXhCMEw1T2xlbXV6MzR0NjYxVlhzc2hzTC9uZnV6OGo5?=
 =?utf-8?B?ejFpczZKVHoxSVErdHZZSmVvaHUzRkF2d3FOZjZjRXhpcHpuWmpSWTJKaEZt?=
 =?utf-8?B?Vk9hUlV2UzFVd1ZTdnVxRFBNaVBvN05zVWV0UXBjaEViS0p5S0RCZVpTeTI1?=
 =?utf-8?B?bUU4SjN0SDhXdERjcXRaQWt1OTlqcnpUVThxRFlIbXNsL3BIYmlhQndueXRK?=
 =?utf-8?B?Q2M0YTcrbXpDeXcrWWtDSi9ISU5tT1hEUHFNSmZURC9LRWdiazR2OVM1UWRi?=
 =?utf-8?B?cG56RFpQTnFXamZBc2dQWXlSSmZMdERVcW5vdTVuVlhqSng4TXdGM1ltWjBO?=
 =?utf-8?B?LzFyQnYzNjRaenJVbk9laFdEOGVoZkRlTUczVmgyakhHWlNFbSs1cXlrQ3VI?=
 =?utf-8?B?Q3ZDZnN5dTdveVpIbTlUajhLK1g2MkZQTmdORHNsUzk4VHFET3lab2EraW5I?=
 =?utf-8?B?SDk1cUM2M2ROTnJSckYyODByMS9EWXlKN29SbW11Y2hhbmFleXBNV2VJOW9H?=
 =?utf-8?B?ZmRXSFZRQWNMd0JFK1RHeXNFbWFNLzlWOFZHWDhlUDFKZExRdVp0Nk13R3c0?=
 =?utf-8?B?U0szRlQyOGNjRFZvb1hCL1lqUjUvN0x1OUo5WkVkZzdlWE5EQ1QrbVZyTi9M?=
 =?utf-8?B?T1lncFpUR3FjSnkwemdRbytQV2dWMjhPb0Nvb1hsRUtndG9GbU5tQTMrdHlq?=
 =?utf-8?B?WEVrbk9oRm5KNm9HbGdPeHBLS2FwSUsyNFpucG9oNjU5WEJ4MUJ5VDMyYlli?=
 =?utf-8?B?SWMvV3Vpb3pWM3NJalR2SEVFRktvNG9yYVJrZnlQbjFOSXVRMDROazRYTjZz?=
 =?utf-8?B?bWh4d3l0UndsejJ2VlBRU0pJcVcza0RiRURZdURvM3hqYlBSUk5uZkNIbHpI?=
 =?utf-8?B?ZytBODFOaHc3THFDWXJVUC95a2pTdVJ0K1NQeTNZb3RRK08zV28zQml5MkQx?=
 =?utf-8?B?NktIZzEySjM3OFlUVHE0bTVuSTZ5UCttUnVIM0hFQ2VubzcrSWNUalVsMkN3?=
 =?utf-8?B?S2hjYkxXV004TWhCc3pwSjAxVy9yd1ozbEVLMkhGVzI3dWVBTkdKczdrQmlE?=
 =?utf-8?B?ZjhkdXQ3NXY0N1VsanRoT0plSkFYNmR2ZmczajRmdVJWTDBlOFdZb05QYWFy?=
 =?utf-8?B?VEhwaFlhS1NwdG9UbVBvMU4zNWVCSjhZZnBFNThyckNuQVRRRk5xT1gwamcz?=
 =?utf-8?B?Q3ZHUi9TYytZY0JrM2FaYUJ6TlZmM1l3WFBTMjJxbDJNNVZ0NjlCUFdmSC81?=
 =?utf-8?B?WEhUZEl5ejRZTGlBcVRZZTMrN05FYU9ZaWdMMExveGFoTnJLZGl2d3VLWU5J?=
 =?utf-8?B?c0J4SnV5cHpoMWt5OEcxRXVERjJqWFVZMkdzSWVtSlBkaEt1VGFhQ0hQNUpM?=
 =?utf-8?B?eC9QNHhmNWRNeWl2eW9wR1NRMVdNRXdUdGVFVlFqa3IwSFFhU3BnaGVrQVdP?=
 =?utf-8?B?MWoxV1FDWnRpWENEbWpKTGFQL3VLWEJJdzZKNzI3K21RTFNiTzYyUVJSVGdW?=
 =?utf-8?B?czhtYWpaQkthWUE1dlNqZ0I0eGtuc3FCK0FYcnpjUU1UUWxTRUwyRE9TWVJr?=
 =?utf-8?B?aHd3cVgvUHE0RHF6c1VzN2I1c29pUnpuTnZkQytFb0NwSWh3VHJpSjRwQXdx?=
 =?utf-8?B?UGxkRFFrQUZkeEFBVnhBR1pXanp1NlZmNnBtMk1XbHVSNHNjNkFjZ1F0ZjFy?=
 =?utf-8?B?bDdPVGM3cnlDdjY2RlJFczQ5UmNHVVduWTlEeklKcW5uaTF5S2dWYjlLcldG?=
 =?utf-8?B?OFRLL3lHMEJTc3E2ZDFlbHV3NUl2MVhVSGEyNGhXY24xa08vK3VNUVJxQU5J?=
 =?utf-8?B?aEVhUUZCQ2crTGdIRXFHWGFUaW1Uc3oxanhRU0tBVzJhU08yakhsdGNTRldk?=
 =?utf-8?B?MjFpS2xzRjZieXhaT2FLS3ZZUktRVjNZQzNOOFEzcXRydCtKNkhYYno0akZ4?=
 =?utf-8?B?YW1CdDVscVpQbjRSL3JGaitEcm9KaWlvR0QyRkJ4S3dURmx6L1UwSDNMbkhx?=
 =?utf-8?B?VHZ1OTkxVkppZVRzVXltNUVwdmtTRGtNNWdERzAyQlQyM2JST213cnM3K1Nv?=
 =?utf-8?B?K3JqaEFISVpRdXJVcThmSG82Q2I0TER6djRIUmE0YXkwY2QrYVZrZ3B6QWFR?=
 =?utf-8?B?SmNQT1NFaFRKUTNIRjU5SmhLTzVqOXZZcmR1RU5QeHZaTVhUQWkxUUZSeE9U?=
 =?utf-8?B?OGNrRTlLeVo2VHFXZnJCN2dEYmg4bTB4Uy9HajVGZ2VNS3dXSWMya0xmdGJa?=
 =?utf-8?B?UWJNTS8xWkNJQ3NWeW1pT09lN3Y4OUZZenFsYnNvU2pUUGh0WkFuc2ZkUi9j?=
 =?utf-8?B?K2FJWHVTTzR3OTlDcWo2M2tsUnJZc3ArbVFaR2prRDBUdDVheFVGN1hiYkhi?=
 =?utf-8?Q?jlM9cCSEiF/JSFA2p5/eaVki/pVogJ8A7HvmfR7Y09Ps0?=
X-MS-Exchange-AntiSpam-MessageData-1: XfjuwMdYuU5yDg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c8590f-fce8-4986-b311-08df257216cd
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:44.9476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1avyJNFOV/qODwXzBjJVfRLV4sD3H4TF391L/Zzk1vQctVHOlbD/KygJ/X8zXJFu94qC+k2j87pT5GUzqkdiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

We implicitly infer covariance for fields that self-references. This needs
to be checked to ensure that the fields are really covariant, so the rest
of expansion code can rely on this fact.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 75 +++++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     | 24 ++++++++++-
 2 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index ec0b1aeefe7f..6a29ec358c30 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -76,7 +76,6 @@ enum Variance {
 }
 
 /// Information about field lifetimes captured in a type.
-#[expect(unused)]
 struct Capture {
     variance: Variance,
     /// Lifetime to be captured.
@@ -435,6 +434,7 @@ fn expand(
     let unpin_impl = generate_unpin_impl(&info);
     let drop_impl = generate_drop_impl(&info);
     let drop_order_check = generate_drop_order_check(dcx, &info);
+    let variance_check = generate_variance_check(&info);
     let projections = generate_projections(&info);
     let the_pin_data = generate_the_pin_data(&info);
 
@@ -444,6 +444,7 @@ fn expand(
         // outside.
         const _: () = {
             #drop_order_check
+            #variance_check
             #projections
             #the_pin_data
             #unpin_impl
@@ -770,6 +771,78 @@ fn __drop_order_check #impl_generics_with_field_lt (
     }
 }
 
+/// Produce variance checks, so we can ensure that the variance of lifetimes captured by field types
+/// actually match our expectation.
+fn generate_variance_check(info: &StructInfo) -> TokenStream {
+    if !info.self_referential {
+        return quote!();
+    }
+
+    let mut checks = Vec::new();
+
+    for f in info.fields.iter() {
+        let covariant_captures: Vec<_> = f
+            .captures
+            .iter()
+            .filter(|b| b.variance == Variance::Covariant)
+            .map(|b| &b.lifetime)
+            .collect();
+        if covariant_captures.is_empty() {
+            continue;
+        }
+
+        let ident = f.member.as_ident();
+        // Use the span of type for better error message.
+        let span = f.field.ty.span().resolved_at(Span::mixed_site());
+
+        let other_field_lifetimes = Generics {
+            lt_token: None,
+            params: f
+                .captures
+                .iter()
+                .filter(|b| b.variance != Variance::Covariant)
+                .map(|b| GenericParam::Lifetime(LifetimeParam::new(b.lifetime.clone())))
+                .collect(),
+            gt_token: None,
+            where_clause: None,
+        };
+
+        let long = Lifetime::new("'__long", span);
+        let long_ty = f
+            .field
+            .ty
+            .replace_lifetimes(&covariant_captures, &vec![&long; covariant_captures.len()]);
+
+        let short = Lifetime::new("'__short", span);
+        let short_ty = f
+            .field
+            .ty
+            .replace_lifetimes(&covariant_captures, &vec![&short; covariant_captures.len()]);
+
+        let check_name = format_ident!("__{ident}_covariance", span = span);
+
+        // Add `<'__long: '__short, 'short>` as additional generics.
+        let covariance_check_generics = parse_quote!(<#long: #short, #short>);
+        let combined_generics = CombinedGenerics(vec![
+            &covariance_check_generics,
+            &other_field_lifetimes,
+            &info.struct_.generics,
+        ]);
+        let (combined_impl_generics, _, whr) = combined_generics.split_for_impl();
+
+        checks.push(quote_spanned!(span =>
+            // Emit a check to ensure the type is *really* covariant for soundness.
+            fn #check_name #combined_impl_generics (long: #long_ty) -> #short_ty #whr {
+                long
+            }
+        ));
+    }
+
+    quote!(
+        #(#checks)*
+    )
+}
+
 fn generate_projections(info: &StructInfo) -> TokenStream {
     let ItemStruct {
         vis,
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index f19712a46a30..59054f5934fb 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -5,8 +5,8 @@
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
 use syn::{
-    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member,
-    Token, TypePath,
+    parse_quote, visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime,
+    Member, Token, Type, TypePath,
 };
 
 use crate::DiagCtxt;
@@ -386,3 +386,23 @@ fn visit_type_path(&mut self, ty: &'a TypePath) {
         TypeParamVisitor(f)
     }
 }
+
+pub(crate) trait TypeExt {
+    fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type;
+}
+
+impl TypeExt for Type {
+    fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type {
+        if needle.is_empty() {
+            return self.clone();
+        }
+
+        parse_quote!(
+            <
+                for<#(#needle,)*> fn(#(&#needle (),)*) -> #self
+                    as
+                ::pin_init::__internal::FnOutput<(#(&#replacement (),)*)>
+            >::Output
+        )
+    }
+}

-- 
2.54.0

