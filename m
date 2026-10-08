Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D244B4EC679;
	Thu,  8 Oct 2026 19:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487634; cv=fail; b=goRfDEK7LfhY9bx5CMRSurArL9OFjM3YjFHqA8eNhj8BnzLFrhR77WDjoHSWXpimNmnDqtT14CcG2f9jTjyyxO1tlZbvl3IvnZdYPkG4Wbh+eAvjK59AvIDnH53vfZNCpR0Md34uMNbGFURiNb9V6qeCRtU6tKaRgVWT9g3ZfYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487634; c=relaxed/simple;
	bh=vQkASJFn1sGTA9V7V12Cnxn5nEOpuhBEr0/kcNx1XMU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eUEi/WUbCdzm3KKFP5Qky08Z/uQZHSQ6MB5L3DPlHLcSXDcBZLIMHyGtH7Tbuy1cjvkwtdtOmqoqo5eqpiMNUULx1s7YCLGm1eAoiZ4SucKU3LdOoW5AibYX4gYMD+hUzeAlRBXPaaSkAMkshWz2XSJQ+3LDy1avzS/3fsbhFqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oB6Lf/XF; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oB6Lf/XF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEpampY4UflTCdPpuuuWbCcAberfTHNgPjTssThUWTjpYEUr9IniDaUuhCGLwv+UhgE/Zg5wGWfhNOouUqeZGQhl9daBJuZlP0kCnZIC8f/BAwg6DXuW/3xTLGpsnGOhEBbWNLuCk/Q2KsoHBnCNSVQU2tSq6qo0Xe1G1q1ZLESECQvgb8hLaljawFSiQPVSsJzO8NuRNmF+znEr04g9UVG977muBDqC/6wbMqmdGd6peY5Evsdt/Y+RvHsjF3Y7n6vCOnW/rMfjRDpnP9DWOZw30jAX66FSCnAQF9WLGCao/A60ORNVPaZ4Dk90S/nB3T3UQ0GMSQdb18LlBwmSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xucAfeEMVzSuqyceSYVdvGw93bFGq4XCP1NbC6N4ySM=;
 b=PhjdOJ0EgJlaJdkRYCcY0SpTvlO/S26PyUpvHz+TnTs/YEHvlOvhfZsBF9GjsL3u4NyuKg1I1AF65BfwrbbvtmZ2gZCpnytA5//HrvKUppddvEeflVeQYIJNcNLJkWBW//aXeJXuDxVnrBhkQAuucsK+c4BwKCZAJh8lR9h3mKx2NSLinWRr1LMq8s6Lej2s/HdP/vkCf9TqU6MuizzIjhPNSJU7W+FcZYrMARau5KaLe74+09K1Gkyk291W+rLgcbsRXqLW2Oe9I6bLM8XmPGdu0eFUAjtPkF1O98yMoUj9pSzcfnD0UNgUiZmFTGi2L8ilM5K78dPHNCvpUk8mfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xucAfeEMVzSuqyceSYVdvGw93bFGq4XCP1NbC6N4ySM=;
 b=oB6Lf/XFiD08EUVvgzHibr5s+OflmU3l+InwY6RIv4wWH3ecy+8M1S+MUSL6HHkaVIrql89WWFfzn3xCgq0bB9x+iC86ouE1I/kGd35E7PG0M5znJIPG75bKq5NHFjnOr0MBzG5lX7LSnTIx6o3Ih/jzWzFsb9mlwmOra2qfQac=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:46 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:46 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:34 +0100
Subject: [PATCH v2 10/20] rust: pin-init: internal: pin_data: add
 `with_project` method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-10-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8132; i=gary@garyguo.net;
 h=from:subject:message-id; bh=vQkASJFn1sGTA9V7V12Cnxn5nEOpuhBEr0/kcNx1XMU=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFUxPLa90Fa5KFvU/2n6X+dRSrVBVBsGHTDP+X
 qiqWdjZyN1RysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARBSuMDLcP5mycX/Si81P
 eePr3da+tXZkztxUk+epqSWWtD9CX/gJI8O3KNm/k6P2PPTQMJnievxibUT1wpzDXRvnWQi/uNh
 65i0TAFk0Rqc=
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
X-MS-Office365-Filtering-Correlation-Id: 78d79644-bcdc-439a-3721-08df25721770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	7ata6MdXoGqFYOCYH8b/NBvDaq8iKH/eNrxFbEWKOot0eCTsJGYroFgyMB5zZw12XClVR2Ifkmoyh7XWxne2X5vk/QqMY6+aeQQ2ykROFTqnHAN80SXF3jdyH3HZXO6IpZ6zCeFEn7MUoVO0Drz4H75l0M9PQr/8r9tiy1W10iArK5pQMC+lxdHUtfC08LBcRzdHhicLY9mb9sk+w8VMkW3Wy+FUKbaNQ4HhAcmyJsdn/YadxjfZuXA5D/AFD0Lw6vtFPXkZbf54dlTP9kxm2IUHkEFQU3q32+4pevqENS+YWGM7SiAfcF8tSk7SjeiwRwWVsC/86DZSs17n0ec9WUO4u40x6ltoM4iKqUg5bA5qoqdwVDLeI9EygLJ9CbjyalvP6bKS9BaFSCMW2+y6LIVdUjfU1Awt4TtK2EKWODsvaF9/WdVl6cnt/aZ99JuF1tsLVG6wY1CNFSAdDhHkKywKppPql/YUSLyGErGwGLXdJJaD3Tsf883x8Y/+eLKbWZzoat6MUCHCtpGQtyEpfSrCT6sqA+tqNrgKFbM7O701TeR+UoWD3qQ2lQXVopO20IX4ZUFa5IxYQf2j+aTlny4qr6BNmiN/heZx3rD0vYaPTYzsXA31oPscrrvXHRqYV/oJY75Bz3lqNdjlfUM+BkqEEIlDbST/cVzrzeavl87MxqGLY8xVLQjgB03BrdfcnWw2rYIox7/iW3q7fhrtZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFIaktTSHhZbTJGQ25QUWJjY3ZsVHBlSjZDZ2pzYndVQ2ZiV0oxWVpiUXV0?=
 =?utf-8?B?U3d6ejhiV1gzYTFaVVRQSHFFWk9LUGNzRUlEaWlpS2piYWx1V2VHek0wMWFW?=
 =?utf-8?B?TWlyMlVIcFUwbElMZTBsZzNOL25CVlAvRUhJUEtFTEw0N245OE5rK2x5dC81?=
 =?utf-8?B?TWZoaG91cERhOG9pbkhPanJPclhyQ2VUbUxReC83QzA0V0EyR3hQYWNxTGxU?=
 =?utf-8?B?Tjd2TWRzallqalF3Z1orUDdyekRaeWZubU1XM1dpNGcyUisrTVFUaW1YS0Ir?=
 =?utf-8?B?R0JUOEFBTndtUVU0S1BzdkQvSlI0cjMzUFBPR3NGREJ4Rkk2NmxuSUp3bUxR?=
 =?utf-8?B?QW81VGVDVWFlekxCVC90RElkMGtMa1hQNjZ3WXAzYjVSbG96Ynlra2kvalVC?=
 =?utf-8?B?Q1hLVzR6VkRqeWFPQk93TEtaMXFocVl0UUhOWEhvdW1udlpXRTgrOGwyN1do?=
 =?utf-8?B?THd1TVV2SnQyZHNUWE9RaWJmVjBIcXhtRFA0QjFnWXFFVG00b0E1SVN1SVNW?=
 =?utf-8?B?ajAwek1YTDkrQjRJMEtRcldvdnFCTytKcUkzZG91QkQyVm9nbkczM0JQbjdU?=
 =?utf-8?B?RnFTbGdFaVMzNUFYQy90STFhYnlTTHdHVmdBNWd4M2VFUGtPQ1Vqck5nZTBu?=
 =?utf-8?B?Q0NoTE01N0tMVmN0OVRmMm9QSXh3eFpRVmtoUUh0aUZ6MGwvYzlHUy9TTEJD?=
 =?utf-8?B?SmNzaDM2WGtWWG9mNFFKOW9qYmdkRklOaGxXK0E1bEwyamJ0NTZvYTRYZW9w?=
 =?utf-8?B?UlJlazBFVDlCdDBUNzFGZUhOWjBtNEVQa1dHalBrK0R3bWpnWVlXOWo5cDA4?=
 =?utf-8?B?Z2JmRS9HczJ4c3ZLUUpYMUdYcjh0R2RMa0t3aVR3d3hMRGM1N2ZqMEpucWM2?=
 =?utf-8?B?WXd5Z3ZKU01Vek5jNlRORGVSOFk2dzIwTnIvcENDZnhDeTNMU3QydC9XTm9y?=
 =?utf-8?B?Z05MbE5TM0VBNDhnUzdmUXNOSzVqL2FHeDRnRzFFTTdsMnhONDFWTXNBRmVn?=
 =?utf-8?B?cEN6cHBjQ2Z5bU9hcVZ6TWJSN0JQU1NtbjZ6QUNMNjBPV253OU1VMzZVdUFi?=
 =?utf-8?B?VURRUzFLUCthY3Fzd0pDM0pWaUJpZDYzd2FOTm8zcXlzV0tIeXA2K3hEaWtS?=
 =?utf-8?B?a1FmZUV4aXVRNGNEMXJoZ0RtajBtZDRCY1lMSTRUS3RnUzY2L2F5dWZSVENu?=
 =?utf-8?B?YzdIRXI1dU16WEFPSXJ5eHBVaTJVZ0hLQ0F3T0pvRXdzaVRnTUlSNDJZbHVj?=
 =?utf-8?B?eUc5VGk3T1NkRE5CZ3dIb1FoSE9LUFhuVmlyYXg4QXF2bytncXNCQXhjMVQ3?=
 =?utf-8?B?c0FsVjBjellLMk8vRHBvZi9ock1pVWorVHZMaDdIVVczM2tBRC9uQjlsZGsy?=
 =?utf-8?B?cWZDOTVXeDJ5QVBSVW02cDI3ZlVreGlrS0ZiNm9kQ2ZTdGtsMGYyTjRuS2Y3?=
 =?utf-8?B?bWJRa3l5NndLbVJmenRYbGdiMG1LN0pPM0h1OVlPdE41NjRZSE02TzIzYWkv?=
 =?utf-8?B?U3FRREp6aUM5V3lub2h5T3RFY0d3MFQ1UEV6YUZmcDZlbkU2eVA0T0tJcVNq?=
 =?utf-8?B?OGpMd2dWTkZBeXRMR2RiTGptM1RJWHVxKzMzTGNWWHhBaVhSYlRoMTlvbCtR?=
 =?utf-8?B?QTJ3OXFRL2dzM1F5amRlTmRpTWhrYUc3bUVhMlpSMnJmRkFlbGVIRkphSTZK?=
 =?utf-8?B?T3g1ZmFYcE9CV3VrRkY4dDdFczlQVU9JZlZ3NUZzU2dveU1RRS9GeTFtSlRW?=
 =?utf-8?B?b0JKSVJtNGlLWHI3Tjc5dUozZWxRRG1aQ0pENlEyTGo3VWRkdlV4OHBpVDlv?=
 =?utf-8?B?elNqNFJ1ZXRXYmZGQzlhQmZkSjVYTGVqSzdhOTlpa0ZWTHpkR2NJejJmUzlY?=
 =?utf-8?B?ZmFyK21vL1ZVR09ETzdOVGZtQkl6cm1VazVCQjJwaGwxYlQ0aTZNYTNMQWU4?=
 =?utf-8?B?VkF2dlZQNFRpQS9oN3luRkMvQnAycS9DT25XaHpyTm9NYUI2a1JFTW5vNTQw?=
 =?utf-8?B?QW1sLzlndzBNczBCb0V1bHZyYit4Z0dqMEhTdGxpL01mcmpKMG1GZ2MwalZ6?=
 =?utf-8?B?TXh2Y2JoODlZMndtQTVYeUVWN2ZEcFNqSExxaTcybFVkd2FKV2FHOVV6K3Jq?=
 =?utf-8?B?dGt4RTgwb1lIdDRVMjF6T3lDTTBJY1Q4VXVJK2pYTi9yT3RwV1lONVZTMTJz?=
 =?utf-8?B?Sy9ZblM2ekF6a0Exem5MNWFxcmZZOW9xSCtOZDhFZHRXTnZMWUVFcDFBeXNL?=
 =?utf-8?B?d1BVV3JNMUhQcHRhYzVrSE84cDNyVW9pWlBIMjFvV1N5K0lEUEZZbVVkMTZi?=
 =?utf-8?B?ODE1amQ3VklxWTloN013ZFlwZVV1bUtPanRaZXI1VU43djBKeVVoR3hmbjZF?=
 =?utf-8?Q?IwNzny1I3h/fs+DRo3nDkkcqC5LU8X/2urQWDUGqe7aag?=
X-MS-Exchange-AntiSpam-MessageData-1: irr21MJWTfI0Fg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d79644-bcdc-439a-3721-08df25721770
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:46.0245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTVg40ZrhP7heKqymXfaP7kZancPDwaLkzeq4DJzVfbyXaA4osA/xBwTp7zw8xgY3OsCwratNqtu54J/lKkUjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

The `project` method needs to perform covariant coercion on covariant
fields, causing them to no longer being mutable. Implement a `with_project`
that does not require covariant coercion by using higher-ranked trait
bounds, thus allow the fields to be assignable inside the callback.

This mechanism can also be used to access non-covariant fields.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 141 +++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index aa9a848c6670..d851f13a1099 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -851,10 +851,17 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     } = &info.struct_;
     let this_lt = Lifetime::new("'__this", Span::mixed_site());
     let this_lt_generics: Generics = parse_quote!(<#this_lt>);
-    let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
 
+    // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
+    // used with `for`.
+    let field_lts = CombinedGenerics(vec![&info.field_lts]);
+    let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
+    let generics_with_this_field_lt =
+        CombinedGenerics(vec![&this_lt_generics, &info.field_lts, generics]);
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+    let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
     let (_, ty_generics_with_this_lt, _) = generics_with_this_lt.split_for_impl();
+    let (_, ty_generics_with_this_field_lt, _) = generics_with_this_field_lt.split_for_impl();
 
     let this = format_ident!("this");
 
@@ -928,16 +935,78 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
             }
         })
         .collect();
-    let structurally_pinned_fields_docs = info
+
+    let (fields_decl_lt, fields_proj_lt): (Vec<_>, Vec<_>) = info
+        .fields
+        .iter()
+        .map(|f| {
+            let vis = &f.field.vis;
+            let ident = f.member.as_ident();
+            let member = &f.member;
+            let name = (!info.is_tuple_struct).then(|| quote!(#ident:));
+
+            let ty = &f.field.ty;
+
+            // Fields shared-referenced by other fields can only be shared accessed.
+            let mut_token: Option<Token![mut]> = if f.borrowed.is_none() {
+                Some(Default::default())
+            } else {
+                None
+            };
+
+            let mut accessor = quote!(&#mut_token #this.#member);
+            if !f.captures.is_empty() || f.borrowed.is_some() {
+                accessor = quote!(
+                    // SAFETY: we have `Erase<..>` which we know is layout compatible with `f.ty`.
+                    // We cannot include explicit type name here as the field lifetimes are nameable
+                    // in this context, so `for<'field_name> ..` would fail.
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
+                        #vis #name ::core::pin::Pin<&#lt #mut_token #ty>,
+                    ),
+                    quote!(
+                        // SAFETY: this field is structurally pinned.
+                        #name unsafe { ::core::pin::Pin::new_unchecked(#accessor) },
+                    ),
+                )
+            } else {
+                (
+                    quote!(
+                        #vis #name &#lt #mut_token #ty,
+                    ),
+                    quote!(
+                        #name #accessor,
+                    ),
+                )
+            }
+        })
+        .collect();
+
+    let structurally_pinned_fields_docs: Vec<_> = info
         .fields
         .iter()
         .filter(|f| f.pinned)
-        .map(|f| format!(" - {}", f.member.display_name()));
-    let not_structurally_pinned_fields_docs = info
+        .map(|f| format!(" - {}", f.member.display_name()))
+        .collect();
+    let not_structurally_pinned_fields_docs: Vec<_> = info
         .fields
         .iter()
         .filter(|f| !f.pinned)
-        .map(|f| format!(" - {}", f.member.display_name()));
+        .map(|f| format!(" - {}", f.member.display_name()))
+        .collect();
     let docs = format!(" Pin-projections of [`{ident}`]");
     let (projection_def, projection_init) = if info.is_tuple_struct {
         (
@@ -973,6 +1042,42 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         )
     };
 
+    let projection_lt = format_ident!("__ProjectionLt");
+    let (projection_lt_def, projection_lt_init) = if info.is_tuple_struct {
+        (
+            quote! {
+                #vis struct #projection_lt #generics_with_this_field_lt (
+                    #(#fields_decl_lt)*
+                    ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
+                ) #whr;
+            },
+            quote! {
+                #projection_lt(
+                    #(#fields_proj_lt)*
+                    ::core::marker::PhantomData,
+                )
+            },
+        )
+    } else {
+        (
+            quote! {
+                #vis struct #projection_lt #generics_with_this_field_lt
+                    #whr
+                {
+                    #(#fields_decl_lt)*
+                    ___pin_phantom_data:
+                        ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
+                }
+            },
+            quote! {
+                #projection_lt {
+                    #(#fields_proj_lt)*
+                    ___pin_phantom_data: ::core::marker::PhantomData,
+                }
+            },
+        )
+    };
+
     // For fields that references other fields, field access syntax stops working as they're wrapped
     // behind `Erase` because their actual lifetime is not on the struct.
     //
@@ -1023,6 +1128,13 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         #[doc(hidden)]
         #projection_def
 
+        #[doc = #docs]
+        // Allow `non_snake_case` since the same warning will be emitted on
+        // the struct definition.
+        #[allow(dead_code, non_snake_case)]
+        #[doc(hidden)]
+        #projection_lt_def
+
         impl #impl_generics #ident #ty_generics
             #whr
         {
@@ -1042,6 +1154,25 @@ impl #impl_generics #ident #ty_generics
                 #projection_init
             }
 
+            /// Pin-projects all fields of `Self` with proper lifetime.
+            ///
+            /// These fields are structurally pinned:
+            #(#[doc = #structurally_pinned_fields_docs])*
+            ///
+            /// These fields are **not** structurally pinned:
+            #(#[doc = #not_structurally_pinned_fields_docs])*
+            #[inline]
+            #vis fn with_project<'__this, R>(
+                self: ::core::pin::Pin<&'__this mut Self>,
+                f: impl for #field_lt_ty_generics ::core::ops::FnOnce(
+                    #projection_lt #ty_generics_with_this_field_lt
+                ) -> R,
+            ) -> R {
+                // SAFETY: we only give access to `&mut` for fields not structurally pinned.
+                let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
+                f(#projection_lt_init)
+            }
+
             #(#accessors)*
         }
     }

-- 
2.54.0

