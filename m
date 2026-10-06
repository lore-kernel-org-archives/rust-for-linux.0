Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022094.outbound.protection.outlook.com [52.101.101.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184CF4503E1;
	Tue,  6 Oct 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300607; cv=fail; b=F5MT8rAXQVx8ZxqVUGm47kHwilXmt2dORmJ/2Jcj1EibqQP6b0ozro/q8Z+9an8TrYKtCiJu+tfw6b5OZ59AP+rHSV0SP3zQCyZm4VYU1CJdtNmmSvL8J9qXzYXuA6geX9QOTdD2SAruFMKlhDQlcchgjWOQFGgNbeaLB3mZO4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300607; c=relaxed/simple;
	bh=ipaoGTGFXlAz6c14w/bmBWLjPThrUpF3hdUNZGSrhYo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AmcJq5PxxFcpY9hCZm4C8MwDLTqX60rwwEdhNtADvtdkvC8MG+ctudgGVl7qNDTkKWnAKDiY41eAEn9SZD+0ioWrtC8DAA/HeoHIuc7i/JgI8l5cprKV2smW5cdHSLSqQl9L1AFIsr63ySoFRVBiVbBvwExtuXtEcxLOqjGrhlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=R+jhEo/z; arc=fail smtp.client-ip=52.101.101.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="R+jhEo/z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFWGtzBPXK2GMMlYOv7vfnrZqnrBIHhClInMQFOlDCVJ1WrEfetxUFBM6JDQ3VEwogGFd8fjPRVRqycYdASLNmgQd1C3LiypYJCDxJnsYgBN8nCsWHFlkLxTGlS+qNF6wjQmetJ7Xpd53LGbYYKzvIaRKkoxJcmJVGlameZY6dQR3uVyjXwyTiP1SbqnG7Dbaq0AM8aFI/YsXLhuh+O04J2jpNOIVQDdnx2UwfiJ0vPzRGVgKyyXQ9DSQ7gCgOMd3bLVw6BNsPmekOZXbi7FYG75oEFNecPlMknhcSUVitgNTL8VXLGqi5lIewGxMWvjk19+vo+Pk0AMcK1HRWNuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgK1WRjg6Ysl9Mlw7T25/g3PWZ5X7ysvFC9T61yzL8Y=;
 b=g+ux0kDvtD/6GVXMZL+mLNhHcNMoCgvLEEziCWd9T/S4zaZKC13FIGbfVexNeIslSPZdzb24VOlUchZENbIX7LfdZ+W+ImAewILjJSbvtN++0daBmShDb/L7rVoiggB+1/QQA2nuDYL13tSnkV+0tlUisbJdw2vC70Pi5l03kn0j0l6F2UYb6cQDxdGYz/7cNraT2UxSx1F/G0DDq21MF0CrkA1DSG/EbsFd7+YV+7j6c62KlAkY0Scp32h7RTAL937NvrRPDP4rLFJmHE9ScZXic1DuwPPxIXwPA5KiYdetxnmsE3V/w7bocmFfFT27B0aqs+P4xMMHsALwL+KDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgK1WRjg6Ysl9Mlw7T25/g3PWZ5X7ysvFC9T61yzL8Y=;
 b=R+jhEo/z6Ol+DOR00EOrkol0C8syfRs8dW/+GS95lS5y2qaK2NI4BgZKINh5RcG8WcRn2X9HFtZbbD/T6xZgMZ69wFF7iSFUeK1iUf1Xwt//74vF6tguFYOcb3MFrhAFXregVLpluV/nvXvBqDxPOX3BnQSUZexTtr8S/ISPF64=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3101.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:162::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 15:29:58 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:58 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:37 +0200
Subject: [PATCH 7/8] rust: pin-init: internal: pin_data: rename `'__pin`
 lifetime to `'__this`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-7-da716f740d6d@garyguo.net>
References: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
In-Reply-To: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4346; i=gary@garyguo.net;
 h=from:subject:message-id; bh=ipaoGTGFXlAz6c14w/bmBWLjPThrUpF3hdUNZGSrhYo=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF36nJtuzs9S+JZZBNjilo7eA46WhsqSK85tiLq
 qNzwmet+dtRysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARJ5LMDL8+yD62unh2WPf
 1ln4RivvOZPbsuEWh6LEgs8MVyVety8MZfintSi6uuLR5Ycpiz9x8PmL3be46nT9vTwDM/trc4X
 PvjNZAYS1RsY=
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: VI4PEPF00000161.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86e) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3101:EE_
X-MS-Office365-Filtering-Correlation-Id: d063d82c-a08f-4da0-c14a-08df23beae0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|921020|22082099003|18002099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3X+/RnLdyT5w4mynb97oaRrkUK81INzHASPohg5C3vYZPUvXrrnrYicliR+b4vy+1/ZUdOhDI1/uS26mlKGunQlSTdQMbKthHSpJD15Ji/qUvi/HT7u1w/UhwQ11IxNHOzxB0J3BDMVjQI1u0v/iMw5APtzkWJJhO6a4SqCmpff1RaRQ6VkVAaMiESOGxDM86J8v8qcDc131Z45R3faRNzpFVetezqAqD+JBB2uwtcwdAPlv78l3+kFX4fVESSHiDZCOTW9w7H5yDnaa0i6igg6SQvLFNrft7VjSP/iqcS/TN7P/I2ro5L4n9xinircJgKFhdhv04SEeUBvz3NAe1T422DAq3/QMCC6QNOtXo+9NzdGg3DffLzgPmZm5tqRYBKgYwb5UPM6hf/DMDLuhnPUUqfD0a75ZALTbV4WZNdYibULm2+84VKeUWUpB57LWobKMf9Envk4pdZIawUprN0MaCXROcLWacDRGXPKfj6OKB77dHt59NbeGivAXVYoYIxrepuCDOSvz1Wfu0BTqegs6zwogk30N0C0imJ+BcEFa72hggikS8KK0SpI2SCjR4/P0XESOaO2eij5E/2A+L2iCwu64h3IOrEX9F0fHbLlc35oQDbtz/4hIvClUcbsl7XjLDs1AzO8/4/+jdtICuHkqAhDN3XjgAgqclonvnhWgS7qoluQOrIjJqFVJhyYca1F89c39QicFc81TUY3fGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(921020)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjF4UVMweXl0NnpmVy9BYVZYc1g5dzU4R1BnT0VPVFZQWUREOVlPa294dUdN?=
 =?utf-8?B?alhremQ1WXg0WFNhUEl6dFlGLzhtZ0N4RFNITCsvcGxCYjd1TGI5aWN3ZVN3?=
 =?utf-8?B?YjhDbWZOQXRmTVFUcTZqUUt2Z1NMaFRCbTBpakV1bDBLR1NkdUNKakFyTWVF?=
 =?utf-8?B?THM1WmZIZmlUZGpZNGk2R3N2SW5qTWo0Um9hK3VncWZadXhNVVdZL05iSTNU?=
 =?utf-8?B?RllzcXRLQ1laOVFpWUs5WERzZTFVYzNGRllCT3QyRklaZEFhQitHRjZrTTVF?=
 =?utf-8?B?WDRkd3lpOVFEQVFoVGk0RS83ZXhEczl4RnpjOWFRSXVRWjlEaXJJdmdRdUpK?=
 =?utf-8?B?SGlKQVNLaDF0QWROWFI5ZEpxS0d4LzhBTk0wZXlrYlVUa3plaTdMelZsa2k2?=
 =?utf-8?B?SWlXbEZtdzJoTzB2eklzalcrVTIxSkk5aXVXcTExYko3d05qL25OT1hHTlVC?=
 =?utf-8?B?QUk5SllIQTEwaWJHSlk5aXB4dTBCa2UxZ0xORW9pdld4cVhBYzVuUlR5R1Bl?=
 =?utf-8?B?eVl2a0p3SUZ6dC9JVDh0N2ZXckozajhaTWxYQUFKOEVnWkNIL3NLUnVUSjlD?=
 =?utf-8?B?OWV6Ymd5bEROdWkvR1BjOUFCdU0ybzFSazVlOWdTaktxNDkrMlFWd2xtdlJZ?=
 =?utf-8?B?cWt0NHk4L1FYZHBFV3RHMVZsSi82YWpXdVpOdnNwWnI3ODRYaGVwczVVeWVK?=
 =?utf-8?B?M1paMzdhcnJjMDhGM0VZRHZJaGg5MlAwZGI5YStWeXRnOTlUQlpCNGNzcnRr?=
 =?utf-8?B?bU9BS09DcFcwaGlZMnIzTkU2UUlHV0FRMHh5eWNUd2Faem1halhPbVh5clY0?=
 =?utf-8?B?ODlJNytyU3J4ZGpDeURPczkvSmI5VTk2RFZObE94VE5vNkU4NjJtVUprTjBa?=
 =?utf-8?B?T2dXWU02M0kwNXdqMHNIMnIrMGJDV2pWbDhST05NaHorbW8xZUR0eUxDZXlQ?=
 =?utf-8?B?dnNNazl6ZzZ2Ukg1VVVZcTBKNERrcEs1Y3FCcXdCMExia1A5KzE4YXB4MU1q?=
 =?utf-8?B?alZtR0lDYlZkN2R1SFpkK3FXYzk2NTUzbGYzSVZrOVhORG81T1YzM05OUlJV?=
 =?utf-8?B?aUwyOSswdHZNa1pVc3FIZmJ0dzRiOHJRb2s0VnVBekdzTDJUNTB5Nm5PWlVN?=
 =?utf-8?B?YTc3YytIOVpSbjE1QVl1SkJzSmNhL2ZaSFd5UXZoOGcvSGxZSmV4VzhMaUJH?=
 =?utf-8?B?Mk5vS0p2ZmprTGl5RlFZMWxWOEdpekpERTlKamQ2ZEYwd2VXOE9xUVlBUGNm?=
 =?utf-8?B?ZUgxZDRpaTJTSWpOeDdJRDFuUEpKdDA1M0tUVC9zTVdqTVYweTRYSkhkTEVl?=
 =?utf-8?B?aXhSZ1hLRjQyNDFLb0lnbmRyL3hSdEVlQlNGYjBjY3JRcU15cWpGNG9XUyta?=
 =?utf-8?B?Y3haWkpjYXpQSnUvZE1MT1Y0OFpBTDBWbGJiOURnUmFSQUd1b1RVdDlBQU5I?=
 =?utf-8?B?ZS9VY09CODJaL0FmNDl3N3hrOHcwVXRDbHg1YmROd3Q4VTdYNXFZZVJDK0N4?=
 =?utf-8?B?OGhWYWsvT1ZNb29jR2tXcGtMSHJkbHdYc1JCOG9sUFpxd0RmZnQ0d0RBWUU4?=
 =?utf-8?B?bk5qcWh2dC9zVDZYdmNHQktIc2UvWGE0L1ZBam95WElnUTBIUk1UVWIrUE9M?=
 =?utf-8?B?SjB2YnptUjg5U0RhS1RvY1hFVFRFMXJTNU50bjNxc0w1YXk3QlZWakJ1eGFN?=
 =?utf-8?B?dmVIK0paS1I2a2ZwVU13TjB4N0NjaHBCaGF5eDdDK3JlWXRkd2lRSXM4aHpp?=
 =?utf-8?B?UTVhbjRNYkwzZks1ZDlickxmSHJCZGdna3BCOTh0aEhOc0lVekthaFZwUFJm?=
 =?utf-8?B?RStSYzhJc2hHMFpPdlNucU5VUGsvbHpuVVl3cWlJbkttUWdWV2Q1eVh0eTBO?=
 =?utf-8?B?YXh1ekl5NmtIWFpoOXZWVkY5dlFFK2V2UDk3N05IWW1zdElvRkZzdzljU1VQ?=
 =?utf-8?B?WjVRd3NyMXdxRW9PdmxnSXAzQlBTcnU0UTQxUXBHN2pNRDNxbGFVMTJHZ1Ar?=
 =?utf-8?B?QW5TRVRvZytJQmIrdW5vUndzM3N6dlZVMVRoUlUxYzY5WkE5MHdPWFdyK0tS?=
 =?utf-8?B?MFBYenlJb0t6U1p0aHVuT1F3b0VRSmZmWGNRSDI1WmFzU3NPWm9YSnlXbHNo?=
 =?utf-8?B?V1F6WENsa0lXQXJxaXZ2N2dDSkt3dDkyV0RRSWppRlAyb1RBR29KR3dWZ1lp?=
 =?utf-8?B?bWoxei9YbXplckNKM3Z3RStrcTNjVmtsWDIwR28zaXF6b3BRYnJub0tiVitw?=
 =?utf-8?B?dUNYMW0vV0szV0l3RDJ5ZlVaa1RWOHhDTE01V1BCTHp6b2QydXFyVjgwdmw5?=
 =?utf-8?Q?wJlfwdk68AlKKOHPAQ?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d063d82c-a08f-4da0-c14a-08df23beae0f
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:58.1755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nc+BB70j1bizP2AUWYpMzT4pwDJSOjSw3L7TMkkpK/8cBnEfB0cHbd/7BE1YagIz68lyQL/ll4jnLJLN1JOpDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3101

"pin" is a very overloaded word in pin-init. For the generated projection
structs, the lifetime refer to that of the whole struct, so rename the
lifetime used in expansion from `'__pin` to `'__this` instead.

The `__pin_phantom_data` field is renamed to `__this` for the same reason
and for clarity purpose, capture a `PhantomData` of the mutable reference
to the struct.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index a4d6965c1572..6e18bc9e890a 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -325,11 +325,11 @@ fn generate_projections(
     is_tuple_struct: bool,
     fields: &[FieldInfo<'_>],
 ) -> TokenStream {
-    let pin_lt_generics: Generics = parse_quote!(<'__pin>);
-    let generics_with_pin_lt = CombinedGenerics(vec![&pin_lt_generics, generics]);
+    let this_lt_generics: Generics = parse_quote!(<'__this>);
+    let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
 
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
-    let (_, ty_generics_with_pin_lt, _) = generics_with_pin_lt.split_for_impl();
+    let (_, ty_generics_with_this_lt, _) = generics_with_this_lt.split_for_impl();
 
     let this = format_ident!("this");
 
@@ -348,7 +348,7 @@ fn generate_projections(
             if field.pinned {
                 (
                     quote!(
-                        #vis #name ::core::pin::Pin<&'__pin mut #ty>,
+                        #vis #name ::core::pin::Pin<&'__this mut #ty>,
                     ),
                     quote!(
                         // SAFETY: this field is structurally pinned.
@@ -358,7 +358,7 @@ fn generate_projections(
             } else {
                 (
                     quote!(
-                        #vis #name &'__pin mut #ty,
+                        #vis #name &'__this mut #ty,
                     ),
                     quote!(
                         #name &mut #this.#member,
@@ -379,9 +379,9 @@ fn generate_projections(
     let (projection_def, projection_init) = if is_tuple_struct {
         (
             quote! {
-                #vis struct __Projection #generics_with_pin_lt (
+                #vis struct __Projection #generics_with_this_lt (
                     #(#fields_decl)*
-                    ::core::marker::PhantomData<&'__pin mut ()>,
+                    ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
                 ) #whr;
             },
             quote! {
@@ -394,17 +394,17 @@ fn generate_projections(
     } else {
         (
             quote! {
-                #vis struct __Projection #generics_with_pin_lt
+                #vis struct __Projection #generics_with_this_lt
                     #whr
                 {
                     #(#fields_decl)*
-                    ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut ()>,
+                    __this: ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
                 }
             },
             quote! {
                 __Projection {
                     #(#fields_proj)*
-                    ___pin_phantom_data: ::core::marker::PhantomData,
+                    __this: ::core::marker::PhantomData,
                 }
             },
         )
@@ -428,9 +428,9 @@ impl #impl_generics #ident #ty_generics
             /// These fields are **not** structurally pinned:
             #(#[doc = #not_structurally_pinned_fields_docs])*
             #[inline]
-            #vis fn project<'__pin>(
-                self: ::core::pin::Pin<&'__pin mut Self>,
-            ) -> __Projection #ty_generics_with_pin_lt {
+            #vis fn project<'__this>(
+                self: ::core::pin::Pin<&'__this mut Self>,
+            ) -> __Projection #ty_generics_with_this_lt {
                 // SAFETY: we only give access to `&mut` for fields not structurally pinned.
                 let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
                 #projection_init

-- 
2.54.0

