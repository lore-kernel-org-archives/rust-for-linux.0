Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745749CF5A;
	Thu,  8 Oct 2026 12:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462317; cv=fail; b=LWOHSRxFR4ztr5MLbWKpgOWFcByb5rYuV5P1rZum/92r2k0q+9Im5XbuPV1iqSoJY7TZpPsvUIk1YB9JoB7HvI4sT/0m2SttrM5uFn7nZYhaQELIeMtDRDfkduoEx0XI+AbjOaDbsmv1lYGOg3nQo3DHDnar8YT9Nji/a3znvMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462317; c=relaxed/simple;
	bh=o/JjsP1VHJgMbZTbt7SEwVtjyYGnzgLsmMxlEE8AFiQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aLzfGtZZbMKYE+2Kj8fRFgIQFZ3wtVWtXN5Ec6RIdtajoC+q0Kj+hrJrcpKKo2gLaJA+m9nQfafSBOrjdxikQ3uFFXi912+4CyV8N3mFqzIk50SPONmlOyAqolfdjEzCUoDzHlM32htcomNzO5E1AiLq2deANc8IPZPF9kBhTDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kVEJzUny; arc=fail smtp.client-ip=52.101.100.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kVEJzUny"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQbYrPfEh4xoTTJXYt0/bqcGDewPwgiC1WlOvgvR8vmzkKJ9PDyDet0aOcCvnPokB6FEzwrSMl0ARpyrHj5gjszzUB+/tLQPk25cI/3NcfgVkspQYIwE3/O1iDRqJ+fLAFEaL2mjAC1I8NMpNFRMuigjFCF3Q1E34cXpscPjZghnrbW3WrG2BYUpcLRNn63I/XBjrwGs9nhGUpfIxuhs/3/KHtOUA50cFasVpC2NEib4w4jJYcHX+0ZzJVRhtNY097aZfyjKapbeOCpNLY/k300aSq2MsoB+kEu1Jwg0XchREdbusmBVmuzUssVM/JzDxJ1+dZvLutfxI93ZtYNw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9fJ+WpdA/6kmZBWiKcA07l5UZ+hnPnME0m7rSjhYsE=;
 b=V96EFccLy1Q+MFXftXHJ5OOE/D1ThOAYb9Y+M47wlqsywvAHch6jhhZc9LTXoF48x8OPwkF/uFfawNImLefPcFMFZSmHbe509Yj0tc1oJxYSWgfknQTJke00I0X1TPGYWPuyOFJJqEI03MNGsRZey8Dmt64KaKIJ0haW0BviXKvVHDbhOm6hkHvLEuFde5ahbt1iNKqhxkzHQgLwhRrCAcsvb+IkbMe1stKlSnDIhoj4WWukVYACD8t8kr3aMkMjGbXlBTsNsrTwYmjT4MIBHrJzhdynsF2VIot4qpMV7CFsHzzimsyTlC/Jbi/rz25NCQjEW/rW8MvdrCV2up6H7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9fJ+WpdA/6kmZBWiKcA07l5UZ+hnPnME0m7rSjhYsE=;
 b=kVEJzUnyoLmSkosR9jLyuFPPtgQ7VS7xaswKXt6NzFESr44EwkJOXc2A75Bxi8QUuTvHRsa+CqzTIxChtnMBqS0UgkKA8Mez4OCwUT+NCuXyqKBIVtmQR5y+AKlRd5lMfv4dBNvsytzn0kt67qQaubne2GbY+r2Wg3MvF+o+wmI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:25:07 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:25:07 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:06 +0200
Subject: [PATCH 19/20] rust: pin-init: internal: pin_data: support shared
 projection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-19-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6626; i=gary@garyguo.net;
 h=from:subject:message-id; bh=o/JjsP1VHJgMbZTbt7SEwVtjyYGnzgLsmMxlEE8AFiQ=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7M3pWzPw96f+N1pmLu3rfS6fcVfT8+ffBlf1Gu
 nv2HPLv2J3fUcrCIMbFICumyOLRzZi2iXG27GWt8pcwc1iZQIYwcHEKwEQUyhgZfk2+VJye/XhJ
 knuo38yMT2b8idfz+Tc+WelU6OyW0HZsEyPDwY8X/l0LtLh9++Iyv9giv/aEh24WXMGyDn3mmp6
 /fxSwAgBXF0t6
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bc1c13-df59-475b-cedb-08df25373040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|10067099003|921020|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	FA1lESENFMt536Bs642WU8/KMj668MyFOE+K2E6QEDNNMJlSh4swcRYBruO1t3jjAEv4LqboQqhL7OiwS/4M/Sba1E7i11jr5ZIlahmdImzW0CHpjBxCeVrJu859NSG8lXCfWl/C8EKtajQQjeRASH5+sc4YsNLoZbkXsyav29/cMjhD5wvZNsiDFcAdBItocIbejX1bWSds2/Dp/YT3a2TFUpaQurSU1Pb7464C5AmKAmR55vmBLgXQqvOIsEKwEwLmgnSAbHdgdqYnEao9Zb76RJLCt/pyyVIpKa/WNOoLtBw1KKMRDbJGz55v+Me0FMIqAkvU8AaQ70gNtg7CdK8SqNjh9UJfrOSwniGp7YUVMwqaaHDxfO1bltRxq8LK8MjoguFTBbIxCh/3fqudQo+IBW4VCtrhSYgoAVZZXrI89iS4l6meOMuMCCAi9E+ck6GMfvpvzPO0GGmjZROF2bC4PakjAgtQrAg0C1QJizXuDqyKFa89YIqVwhIGEz0bKHGUyID98RoUuUKIMfEKBZ8T4vYSGTwMzihHc56RO4m2nRYlCwW3EOTdFitmJWnUHhLYvWX5CZSqNdW34Ht3vvBrqifVh1LpfUvUilZMic0e+1JmItvKvkcm3/yyBhtwEl5bOaIYIXV3qob5dtIqwOYO9teOwyCGn84IO+S9dCUtCmQgM+7nHxR8phuDS6lUS2ETH/+xruLl4fup8JLZyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(921020)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1IrRXI3ME80VEwxeXFKMi9EUWZXSGF3NWxRV2xvQUg2dldleU1BMW5ZbEpu?=
 =?utf-8?B?Q2srL1JLUVBkS1c5NFJOU1hBUGRaKzY2aXY4anFiQVRrYmVjelFhaWxmN3E4?=
 =?utf-8?B?WkJmK1huK3YwazRDNUxhV2JlckpvMElTeTBrSW1mMmNWMW1QdHZQZUlGaFAx?=
 =?utf-8?B?OEc2cldIM204NENqaWZwb1NWY2htNWtCZnBQaHdDYmhNOExMZWNDb0ViRUZa?=
 =?utf-8?B?UTlXaFdrY1pPb202R25TWVdvUHZ1ZHFobEp3MUtLTUZoVGtVM0t1N1drS2Fu?=
 =?utf-8?B?NGc0QTZsZlJiL1JvYmh1My9sN2ZycGtHZEJrcXdUOVlkWmxlaXNLUmxWelV0?=
 =?utf-8?B?QjM4QUQ4bk1Cd1IyK0RiK0Z5Rng5d3BGSkRTYlIwakM0dEJWUUd1OHJqbEJv?=
 =?utf-8?B?TUNpUDdwTTJMMkJnejlzMTZDYTZUSjRPUGtHOU9CK3BGU0h3UGFwUEhTTm9K?=
 =?utf-8?B?YklzUExDeHJnMHJLRXZ6L2lJcFNWUlNLZXJHRVhYRjVEVlZUY3NQUWZxeUtm?=
 =?utf-8?B?U0VPQnJIQ0dDajdMYWc2N0tTRFo3UXRoVlp1MHNpUU1TaTd3Ry9vcEJCdG5L?=
 =?utf-8?B?UEIrVFdlUlIvdGtpNk1HSithK0lNSVZYWjV5RWNxZDFhY1JkMXNnVUpvUm5Q?=
 =?utf-8?B?UFE0TWJvdFNTWFNGMGpIRzlNRWx4TGJ4WEdtRGlSM2ZOWkFvU0hiS1hnQmNt?=
 =?utf-8?B?OFB3Uzh5RmhFbTd0eEdvc3JPTDJhT0VKTzQ2WTRmdHJ5VkFNR3lHZElUbGRV?=
 =?utf-8?B?WG5UN2ZFbUlBUmcyT1FJWStpSDEwb3cvdUs0WGZNRlF3SS9zQ0tPcnp2dCtp?=
 =?utf-8?B?aHA5TXNPMEU4RVhvVEFsbDZUM1BrVlZnaGVoUWg2SGtMMElJWGw2a2dka0px?=
 =?utf-8?B?YTUyY3lEQVR5U1ZHY2E3cWEwTjBFR3lUV0RVckJFUWJCV3pDK1hnKzRmeEVo?=
 =?utf-8?B?RXJiRUxNVzdVRGVUMUlXZ0dQNXY5NDh3UVJ5NCttZVA3V2pKTnhNK2xLUy8x?=
 =?utf-8?B?UnB5UFZNbExpT3pJd0xId0NxY3VscGlCVnkvV2Q4S2FqVllNY2hDK2NsVWJC?=
 =?utf-8?B?cE5XR0t5dWkxdStnbENia0NHdGk5cVBSUDh5b1ZMNWNSdzhuUGh6ZzVVVHRM?=
 =?utf-8?B?ektMRlV3TENkdm5ML3hFRWw0S0RvTkdNM2RSb1N1VFBzcXQzWUtScGdtcmZI?=
 =?utf-8?B?VGh3R3cwQmdyODJHWVJBNm1rZW1MOU0zQjlYcEVkODI3d1A5TmVEZ0duZ2RK?=
 =?utf-8?B?bVJIQTNYTE5vSDg0MHQweWVYaGZVODZ6N3publJlemlsU0VVNitBZzlObVdT?=
 =?utf-8?B?WkY3SEYzYjlIUUl4aldzYnJ1MWFOc3A2UDFzZ0VLb2VobmlsY2ZBUU1CcUFx?=
 =?utf-8?B?aHExSEtacFhndmxxckhBb3V0b20zWnZhVU9LekRoNjE4L0hublR2T05QSEZa?=
 =?utf-8?B?ZFpGbDlBMVFCc0hCWkNtZms2WG9kdEQxcks0ZitKVm5kbEZWRXJZWDJSL25z?=
 =?utf-8?B?STVWQWNBTnJLRVRMU2NXblJ5RHBqM1ZsUTEzN2R4RmZBYnltZE9GZjZxRkpt?=
 =?utf-8?B?LytsTXBIQ3VUU1dZNHFsczZDQW80Mlc2VWlxTDlTRzhrVHZjUE9PclhVNlZr?=
 =?utf-8?B?YXFuQ0xWamR1amcrc2I4VnN3RnM0alNKbzE0Uk9mSjVxQWhoSkw4YkFCN2tU?=
 =?utf-8?B?N3JFOW1tMFQ0V2g2Slo4OGFHUi94SXBWSytLQUxiSGpJQWx0clk2QXRvZk5h?=
 =?utf-8?B?NHdwdXFTcFdOL1hMc0VEVlE0dnhpQmFiOEVTY2xqaGpEOS9hdmllQk9nYjl5?=
 =?utf-8?B?dkVMRWV1Y1E0T2l0Vk9wcHBQNUIwcC8yeDk4YUFISXlpOG9ZSC83Y2hBMWdK?=
 =?utf-8?B?UGFxOTJ5OFIwVzdQc3hTcE16V0I3WGZvd20xUk5zVzh1SlVlQzdVUjk4bEpY?=
 =?utf-8?B?dDEyazF3TFhaK0RVK2xyVnZKSk9uWmlhNmIzYWVldlA4VUpmMk5uOEZDT3k5?=
 =?utf-8?B?WTBON25CTGx5K2NLN1Z4YXl6bDdNU2dPSWVuREZoV2FMVWs1RGZlaUNOTzJM?=
 =?utf-8?B?R0lCaEV4SGxkcVFTWGN5UUozUVBhSC9CMXFrd1J6NDEzNzBYejVIUmRNN09Z?=
 =?utf-8?B?UmZGdUFUbE5IMWFHVkRndkJGS3pobWdIM1pZeXUvSy9NZHYwNktySzdGTE1J?=
 =?utf-8?B?UElGZm5YTXFBTVNFTFpQbW5ES0xXUVBhNFlXSnZaaVMvaCtiTWlGNXQrYUVo?=
 =?utf-8?B?Q0VRY3RRZ1ZHeHhlakduWGd2eTZpbjVUUVduVGUyb1B5NlVlTU85NHVGSHhh?=
 =?utf-8?B?VWIwaDk0eFN6QllHR0hFM2dFczkzRHNYc2lwdUJmRTFxVE5QaDZtUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bc1c13-df59-475b-cedb-08df25373040
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:25:07.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8WfepAmV7I+puq5B61wuP2OX4QuSfLPTDAliSezQ8ckMzBU/nLg/R4bhqHAFV7Gp0oURCEUoBMtgvnyzNYu5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8795

For fields that self-references, it is desirable that projection can
happen on shared references too, so lifetime between different fields can
be correlated. Add support for that with `with_project_ref`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 128 +++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index b79710ba7059..f7dc76849ce3 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1149,10 +1149,17 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         &info.field_lts_outlive_chain,
         generics,
     ]);
+    let generics_with_this_field_ref_lt = CombinedGenerics(vec![
+        &this_lt_generics,
+        &info.field_lts_split_variance_outlive_chain,
+        generics,
+    ]);
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
     let (_, ty_generics_with_this_lt, _) = generics_with_this_lt.split_for_impl();
     let (_, ty_generics_with_this_field_lt, _) = generics_with_this_field_lt.split_for_impl();
+    let (_, ty_generics_with_this_field_ref_lt, _) =
+        generics_with_this_field_ref_lt.split_for_impl();
 
     let this = format_ident!("this");
 
@@ -1466,6 +1473,103 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         }
     }
 
+    let (fields_ref_decl_lt, fields_ref_proj_lt): (Vec<_>, Vec<_>) = info
+        .fields
+        .iter()
+        .filter(|f| {
+            // Mutably referenced fields cannot be accessed by user at all for aliasing reasons.
+            !matches!(
+                f.borrowed,
+                Some(BorrowedInfo {
+                    kind: BorrowedKind::Mutable,
+                    ..
+                })
+            )
+        })
+        .map(|f| {
+            let vis = &f.field.vis;
+            let ident = f.member.as_ident();
+            let member = &f.member;
+            let name = (!info.is_tuple_struct).then(|| quote!(#ident:));
+
+            let ty = &f.field.ty;
+
+            let mut accessor = quote!(&#this.#member);
+            if !f.captures.is_empty() || f.borrowed.is_some() {
+                accessor = quote!(
+                    // SAFETY: we have `Erase<..>` which we know is layout compatible with `f.ty`.
+                    // We cannot include explicit type name here as the field lifetimes are nameable
+                    // in this context.
+                    unsafe { ::core::mem::transmute(#accessor) }
+                )
+            }
+
+            // In `with_project`, borrowed fields have their field lifetime available, so use it
+            // instead of `'__this`.
+            let lt = if f.borrowed.is_some() {
+                Lifetime::from_ident(&ident)
+            } else {
+                this_lt.clone()
+            };
+
+            if f.pinned {
+                (
+                    quote!(
+                        #vis #name ::core::pin::Pin<&#lt #ty>,
+                    ),
+                    quote!(
+                        // SAFETY: this field is structurally pinned.
+                        #name unsafe { ::core::pin::Pin::new_unchecked(#accessor) },
+                    ),
+                )
+            } else {
+                (
+                    quote!(
+                        #vis #name &#lt #ty,
+                    ),
+                    quote!(
+                        #name #accessor,
+                    ),
+                )
+            }
+        })
+        .collect();
+
+    let projection_ref_lt = format_ident!("__ProjectionRef");
+    let (projection_ref_lt_def, projection_ref_lt_init) = if info.is_tuple_struct {
+        (
+            quote!(
+                #vis struct #projection_ref_lt #generics_with_this_field_ref_lt(
+                    #(#fields_ref_decl_lt)*
+                    ::core::marker::PhantomData<&'__this #ident #ty_generics>,
+                ) #whr;
+            ),
+            quote!(
+                #projection_ref_lt(
+                    #(#fields_ref_proj_lt)*
+                    ::core::marker::PhantomData,
+                )
+            ),
+        )
+    } else {
+        (
+            quote! {
+                #vis struct #projection_ref_lt #generics_with_this_field_ref_lt
+                    #whr
+                {
+                    #(#fields_ref_decl_lt)*
+                    ___pin_phantom_data: ::core::marker::PhantomData<&'__this #ident #ty_generics>,
+                }
+            },
+            quote! {
+                #projection_ref_lt {
+                    #(#fields_ref_proj_lt)*
+                    ___pin_phantom_data: ::core::marker::PhantomData,
+                }
+            },
+        )
+    };
+
     quote! {
         #[doc = #docs]
         // Allow `non_snake_case` since the same warning will be emitted on
@@ -1481,6 +1585,12 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         #[doc(hidden)]
         #projection_lt_def
 
+        // Allow `non_snake_case` since the same warning will be emitted on
+        // the struct definition.
+        #[allow(dead_code, non_snake_case)]
+        #[doc(hidden)]
+        #projection_ref_lt_def
+
         impl #impl_generics #ident #ty_generics
             #whr
         {
@@ -1519,6 +1629,24 @@ impl #impl_generics #ident #ty_generics
                 f(#projection_lt_init)
             }
 
+            /// Pin-projects all fields of `Self` from a shared reference with proper lifetime.
+            ///
+            /// These fields are structurally pinned:
+            #(#[doc = #structurally_pinned_fields_docs])*
+            ///
+            /// These fields are **not** structurally pinned:
+            #(#[doc = #not_structurally_pinned_fields_docs])*
+            #[inline]
+            #vis fn with_project_ref<'__this, R>(
+                self: ::core::pin::Pin<&'__this Self>,
+                f: impl for #field_lt_ty_generics ::core::ops::FnOnce(
+                    #projection_ref_lt #ty_generics_with_this_field_ref_lt
+                ) -> R,
+            ) -> R {
+                let #this = ::core::pin::Pin::get_ref(self);
+                f(#projection_ref_lt_init)
+            }
+
             #(#accessors)*
         }
     }

-- 
2.54.0

