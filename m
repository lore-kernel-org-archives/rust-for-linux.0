Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022088.outbound.protection.outlook.com [52.101.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A844B692;
	Wed, 27 May 2026 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902413; cv=fail; b=jKZfVp8OTCnKb99l2X1W3o+FY8DFboeCyK3OwiDRPuqppC/nfEiBC2NBrH5ZMeLTnpUfPdsSJUKL9grABeadX73XKAxeWuA3DcGvaRekKur3JEy7z1qQg33qSSxw3livavzvH41U+xX6gobqA6OcnxBwiVR68rtku6VGiZtyr30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902413; c=relaxed/simple;
	bh=kTRw4j5OKC1N/59Vd32M5cpT17i2r052Kw8SPQGT6sc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rlO7naIcKvYGGc3ymfUwZPrQetw7FOMlM9WS6iuvOCIbZPVFsQ4+aWBHBY8yqJDl8YOsRO/ORWup+gfyxmQVkJebLWh7lZ3rr54KWA8wKj/sW3scgzTJ3oggZTAu/HGf8YJYrcIpaq7mSOOFIwQrVXOQ3VFtfHlN9gQW2Ppv214=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OnGtnOf3; arc=fail smtp.client-ip=52.101.96.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OnGtnOf3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXk/M/dJaNwyAtj58Wve53gB88EmDpLITgkZzoB2Dn+hq36KgWlPjHPSUD7c1FSxcwC1qd5oNDefhO94h8NcozGuFta7qLW6cOhPnYCvI5N+0xWqf5L7+tuYMetyG+1scaq/jHu6/7XN8k+iQ/A13+p8H85xAc18Tmt1lGL7UFiKVqsSC7QcXydd8/r58ad9cxDJdc8vSV+7unHl4XUpL1fDdeOFrp+GPsNsLZZEgObKnh5FqsM4W1fmInmnDhc4EtgCL9NHltRrjaCjIlAMdvD1qRGpX6Z9APmZZCDurrJjD+56vmNKVDOzRjGux1nHHDQrLzD+Oe9JDyb5Ed90QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2trc4Jy/Zu1rsgI67ZRc/hxhYw5SdHWk0n0Nollr3c=;
 b=u54sn3jUxw5xmHvBRyg5L+WY8YfMhdTeSuc5EfA2LM17lf/cl81xqgdAKVAFRfHyIeHFxyzawxPLzimA0POTc3K17x9tuKmqyRLfxgC1n+GfAA69BPJ0fo8zfL+xfWWo9+JgTYbAoh+FT098zfH3eip82FmGOd4+j1I6R7Ye6bgQXJgGstZSy6C52oLRpvDYzmIfPOgrTCd1tVoCvknXz+7a81Ify7e98H8WFoJ2Po0ijRHXEVBjBwBWExRFt4Gs+/d/BjuRJCkLP6M1Gwdk3sYgAqvKYdH5o3g652jTBGZZMA8oqWdFv8AqtOwG4yYyaQbRHeMLznvgyTSi+t9DiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2trc4Jy/Zu1rsgI67ZRc/hxhYw5SdHWk0n0Nollr3c=;
 b=OnGtnOf3RhxVVYE+EJWOJFK1dx/b9xoBEPKJgTuNBp4vbfVNDFhPn45OD8Hc1a3jO6CMoih9On0zbIEAd99XR9AhnhgJiul4kH7ReiSCTPqdW1Y617yGDjP/oZj+L6giC0Z9H8phSpDAhZqqVB1RQvytZVfHSa5qXKpyQQjEGa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:06 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:06 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:53 +0100
Subject: [PATCH 2/8] rust: pin-init: internal: suppress `non_snake_case`
 lint in `#[pin_data]`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-2-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mirko Adzic <adzicmirko97@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=2211;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=uKh2wsjyuta+7TCwLBQEIENT9BfZkYLsX4gn0ItlPG4=;
 b=U786KB6phzr7q9WAQLTC2Ywp+8s0F741fn329tOtpIEjzET0kByejV/yYd62ptgRvIs1+BklA
 NQLVY+67UGuDVJC9W+t0+gry/929XdQC2rJiLuM4oHb8N8pRtJUnjcX
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8883cf-6c44-40bc-daf7-08debc143233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|6133799003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	eSGlq3GqvofM2WNzr5jH5lO+SocBcCO2dSC63ce4R6eiJ58ZBIB3X9ug4rvei42rzOxgLBzK9fT6tJCEN0wKEIMN+FgQh3tibAsvVnKCg6v6LW509z3rSjdsgehIb+N9Osg7AlmIMNCwNFloiOCWen3CjVm6QZ1aE0M3/ZPG4AcReA8xr1nGDmnmtPYu6mg1ootkxA2ErLxh618Oj4I7RfL1sdTvCchQjQF4kvQpgeXqEhfzYqTSG18N5yVJI5rb/DvSkXfSV5SsMe0z8gaFeYzNENl0aGjFEffA7ayFGt/G4O6EQV1YntB1SfWrp4soh8VSibd3JjW2YpCQ3KIrVqxZukDR9QKg7lyYrYp65QK38LLWrpDO5Htxx4U18ixcB41pIOU5R+hN05ghDbIo57kKhHdj8q42Dvhw/krmGUh/M1ZtkV2cRhCT12ECW7aQ2mqx6ieVtUrVyQRKodEupgLh3PKPc6mxqhLXcZGoRc6AWprMfLmHPF4zQAZYtqGKa9Nzx3az/e0/rNPH5DECAGvq0TLbdFk17G/tvAuMfSPStJJQZOCY5rT1vUrNj071Bd5Ip+wGfxF79yMZnjCQpOSbHtRvTSTBe0NDaXmr4UI70FJl7zU31kR338z3xDbvCmM1Qp/DvgwgrnXQadkifFwDLTPcspTigyqzTHJno4XGt+gDn6lJ2O6UShExycCW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVlYUI5Wk0vRE9qa2RLZUthbkFMZmY3UmtlbWl1TnlnYkI2aDY5SEJ2cldW?=
 =?utf-8?B?dXp0T3BHT3pTczZtNVYyQXU2OEdiTHVFUHhnS2VSOTB4V25FbnRaVmxOVzZL?=
 =?utf-8?B?a2o5aXR0NzZmd1JiM0NFUnlFYnRHdkt2WnJDYStiSWNyZW9LeFNndzJaUDcx?=
 =?utf-8?B?Qlc0N3R1aTMwS0tYUVBTL2FWczJYZjBqN3llVFoxN2hFb3NQU0NxRzFlaGdC?=
 =?utf-8?B?MzZaQTMrZ1VDUUJubXNyM2hpUWIvREVsZ0g5QkpyQUJ6ZlltMnorRW9QbFly?=
 =?utf-8?B?aEFSZ0RlZERRZGFLOWw2QnJ2ZUtINyt6dnBSTjEyc05rREhvQXdCYW5uL3Nv?=
 =?utf-8?B?Qm4rRzZEYU5aOUhWSDV6anZFaDJ2ZUdqN1BsNy9OYUNZZnk4a0doU0FMaVJX?=
 =?utf-8?B?MUhyZXphbWtoWXgvTHBTN0xNZTc5bzNmZCszdU5hd1l0TnFsb04rcXdLVUFr?=
 =?utf-8?B?WHhyOVdKSllScWVzTWZ0dUtlMGsyREk5QlBUT253UEFEWDAwcUFnckh6N0py?=
 =?utf-8?B?QkZKWmJBN1ZFV1V0S25hSDJHSlpYdmQyNjBUcytOUWxMZUtLenN0MjJCYUg1?=
 =?utf-8?B?eDZVZjk4V2VORTFBWVpDVXUrS1laWkVOV3R5cUVOYWRidjU5NGxRdWs1emk1?=
 =?utf-8?B?bEI3UVdqczFrcUpqaGtWeVM3L0h6WnhCZnhlTEtSeVhJNDIyMklRdzZsTWVP?=
 =?utf-8?B?RWFuTHRxK3RxaUFNTU45blZvVXdjU1NvNUp5cE1SRk1EQVhKcmZlOHBTR3FY?=
 =?utf-8?B?MnNYd0xyL3k2S1RndjkzajFiL3ZlM3ZGRHZZNDlLcEpPeVJKSFRySE9taS9I?=
 =?utf-8?B?eE5FVDJKSUhycnBQc0xNOElPcTVwUzA2UHNEUkUwMVBRZU9JZjAvNlV4ZDlt?=
 =?utf-8?B?RGVSYStvZFlMWW1tdkI2UkhuMEk2emo2aWU3Yno4VG0vRHd3OGNhQXQxZ0dR?=
 =?utf-8?B?U3BiUjhEZW5ZZVNMZ3crNHMrdXhnYjcrWXVYNmg3YkYweFpubWF5cXZTN0lD?=
 =?utf-8?B?SUNKNmdDQmVyL0lIc2dGS0p0S0MwKzUzWTRIczJLd0FBVVllcFlUQ0NZaFdr?=
 =?utf-8?B?OVdRRzRnTXFUbVlHNXkrb3R4TlI3dmNtREZtUW9jNFlNVnpUL2x3T3RaK2Jp?=
 =?utf-8?B?V0lMYVNYMDNCOVFVWVRkQzRucTM5M1kvekRveFNKeTdhTlF6UlFsZElacHFO?=
 =?utf-8?B?c3VLanlKTnZNREQvZjVGVFZmRDhpSndIbmtJZjFGSnZqWXN0Vk5lSWtMNFBV?=
 =?utf-8?B?QzJoZFhxaWtQdjgxZDE4RWlCYzAwdGJ2SUZYK210UERtZlRhSnczTGZoUWYr?=
 =?utf-8?B?Zis1T2J1UkwxUkxvVjdLVmcrY3RtK0wyL0pleUQrVnUzTjRLdGtYZWZVelh2?=
 =?utf-8?B?ZkROVSszZmhwQnlnNXFOaDZtcTlOMTRuQ2h4KytSQy93U2duUDJFUVd5L1VO?=
 =?utf-8?B?M2xVY09yN1BUUVJvYlRYVVlFZXhPT0hrRWlZaVVwd1lFT29OSDJEdDFmQi9Q?=
 =?utf-8?B?OUx1M1M2SXREVHRYcko4RlRKZ0tLQlladHJ5Nm9wRUoxUXF0eXR0Ylc3MWFQ?=
 =?utf-8?B?QWZZeTJRS1FZYlRqTWR0L2Zub0NQZTlieTZnNmQ5aUs4bGl3QUFHV1pYcUdu?=
 =?utf-8?B?L01kUHRhc3hnMGFuWDZjSjYwU0pmYm15QXVqdW9JQkNlRHp1bnFrSGVGMTB4?=
 =?utf-8?B?OXF3RFJjelhiSGFtUjFxeDhEZVVMTzZZQVF2cEcwT0RQQlNKWnBrOE1rNnUw?=
 =?utf-8?B?Tm1ZSk1aQzgrUlhwZ05LUjgwblhrYkl4VmhrWjNqMW1QOHpIam9RbDZPNkVt?=
 =?utf-8?B?ZkU3T1JYWmxpVW5RdE5jMk02Q1RJZzNEQXBuOHBNeTlLeGVPMnlWcTJKMnBC?=
 =?utf-8?B?dHVGT0djZVBEL0crakYxSis0WU0rS09HZFpJaE44R1hyOUFxblcwUlJUYVhK?=
 =?utf-8?B?b3RuOTk3VmVXMzhzUjZkcFAwOE84N0Z5bFlxaDV2UkM0Q3UxZVdURDhCbmt6?=
 =?utf-8?B?YlJFWE9PVC95cEJaMWpGMW53YzRTRDJRZVVVZlA0Vm12aWJhN1dFbmo2eklw?=
 =?utf-8?B?OEQ5OEFyRTdzR204T3VwRGkxQkx1YnRiZDJQRkErejhsVVpqeWVXTEZRK25w?=
 =?utf-8?B?VDBEdGxDSVp6c1VydDAxWVkyaTc5T01TUUt3YzJGVjd2NmpDRThmcC9ONCtI?=
 =?utf-8?B?eWJ0YzF3RlZLejdRT2lyMmplTjQxOGMyVTJZNy9hR2ExOTJkUWs0c0F6VFVp?=
 =?utf-8?B?RHh4UThoRnBFemZvTkEzaVlIZHlYUnJmRXFWdk4zcW5yUFZWd2dVK1lUNW5G?=
 =?utf-8?B?Q3N2bUR2Wi9OaEk1Rk9jc1FoN3VEbTlnd0YyN25FbTNnZTRGM1JwUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8883cf-6c44-40bc-daf7-08debc143233
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:06.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffsuSX6pcQVH7YF3fIh0BZV1eyo4iSL2LGK915QdH8rAlCczCBy8fp8O1Yap0xfaiAD9TY7lLpxKYAMWFMj72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

From: Mirko Adzic <adzicmirko97@gmail.com>

Allows `non_snake_case` lint on struct fields generated by `#[pin_data]`.

Since the same warning will be reported by the compiler on the struct
definition, having extra warnings for the generated code is unnecessary
and confusing.

Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 9ca8235ed3d6..9fbbd25bcaac 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -191,7 +191,10 @@ fn generate_unpin_impl(
     quote! {
         // This struct will be used for the unpin analysis. It is needed, because only structurally
         // pinned fields are relevant whether the struct should implement `Unpin`.
-        #[allow(dead_code)] // The fields below are never used.
+        #[allow(
+            dead_code, // The fields below are never used.
+            non_snake_case // The warning will be emitted on the struct definition.
+        )]
         struct __Unpin #generics_with_pin_lt
         #where_token
             #predicates
@@ -318,7 +321,9 @@ fn generate_projections(
     let docs = format!(" Pin-projections of [`{ident}`]");
     quote! {
         #[doc = #docs]
-        #[allow(dead_code)]
+        // Allow `non_snake_case` since the same warning will be emitted on
+        // the struct definition.
+        #[allow(dead_code, non_snake_case)]
         #[doc(hidden)]
         #vis struct #projection #generics_with_pin_lt
             #whr
@@ -386,6 +391,9 @@ fn generate_the_pin_data(
                 /// - `(*slot).#field_name` points to uninitialized and exclusively accessed
                 ///   memory.
                 #(#cfg_attrs)*
+                // Allow `non_snake_case` since the same warning will be emitted on
+                // the struct definition.
+                #[allow(non_snake_case)]
                 #[inline(always)]
                 #vis unsafe fn #field_name(
                     self,

-- 
2.54.0

