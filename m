Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D44C9005;
	Tue, 12 May 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587804; cv=fail; b=CgnCpdn4lZlvVT4OMktY4hBoZGCPW/wmnmFMuJku6ooJOy6la4I1kHugjOYwyvZuxH4x/s9mpe7KHh/ZBIWBihIMMrVzM0Wtf2Z9DE79lddkpJGpfLxh5fAltjbIU3uHpmm3sBxqeyLv8r3MHsBPEGypGuAc7ZjYiK3eppwUbIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587804; c=relaxed/simple;
	bh=u5LXXiEW9poXeDqRI0Vxq5VsTDSZs5/LBcHjil/3FBw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HtrV9012JU9I/1AZ5mMo5pTUpOn+nMJNs/xGda+8HYDh7OZtiNYzykPp/6gjJvjZdhHIikrrReab+8EkHBWs0eR2U8Q1Fc6FlSxGu/QvoWvg0cTQfxXTPWZz1nB2ryapXgLlpFKynk1OyK48Qk03KJD0McPqRFBO1hJEvppchaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZdTRUlOP; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZdTRUlOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPZJngmiZZJYO4Fppe7LRvlOj9Y+oLA7IjbDEEocwzrJ6rGyEGgl3srEh1qBcY7BTMuV7yAL7DL0/SuH5bzNOH3fHUqT2XcpEdUl8FDS4rzXHaSFkLzX7y+VhB/oh99cxgBafq5EHA/DDDNolHE0zXwduxpz8WmdwAIEXvm6cvPLKq0tl/DZm0SyRmJvBqBZaE4dARv76+wG6GMyLyUJjqbCrM408xXep4exhzpu0uJnIpB5RlKMLrLUnO/4c4H36ccFRg/NKR6pfYBwthrSZJjYH/+9ZYKgE6gYatxHwCAeSKwT1mbndU1kiLOScTeHahtdGn3wP2SB10i4e2rlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Qkc22OKzw0wtA1+53+llsTIsMV2YHE9EINy6ztFj3E=;
 b=JzNoL0PREOW47gQnyUn/QKEq+hwzPmtbCqc/vz7uKmDMlhkinjR+88KDSdLh0IK1pT4QYX4M/QUh93BuQO804ZNvpavh4FTat0cxdeoQ0/BQToobyHDFzDKbceC+ahDxNzCFbfS2kMq3u2iPwoWoKegA3DiBLK09UhI6+aH7IJEqCAfPDAOei0IRpCZTUCPuplta6MTcZpXyPDOkgBvcqvL94t1Pu9cQ4F7Y/jALgCY4Ok0WbxdUn5DQSuQAqlTNSZC9cqnRcjv7wPFQg8tvBR6CTk9yGsFUE3MBsZL7bYcgONjn8AVOKv7NzBy0RPWTCsH15hrcV3ICYaqdXFR+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Qkc22OKzw0wtA1+53+llsTIsMV2YHE9EINy6ztFj3E=;
 b=ZdTRUlOPy8CA1PPFL4n46UPPqsn5eu7YrngTMjRaVyDdfQGsI/LQukywPiXKR1At8/qE34L+oVSvqkGhTcOIkyjVyg6Qe7aJT4G4kXd7DAgdpeJuapa5jM+02Ot1lLP7y/0fcp7j7gVr8wboHtGz9wK86ENZZcxYBgrK70E/IZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:55 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:55 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:46 +0100
Subject: [PATCH 1/8] rust: pin-init: internal: pin_data: use closure for
 `handle_field`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-1-81963130dfbd@garyguo.net>
References: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
In-Reply-To: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=7660;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=u5LXXiEW9poXeDqRI0Vxq5VsTDSZs5/LBcHjil/3FBw=;
 b=IEl6tZlIUNPEM0iYZXet0SF16T1RRtUIZR4YcA1j5KBFLBIgn08xXLVMhTL5bzSEvaEXKQoFm
 p7LR0IQu/vKDGWlb0OuSf9b9jGYTUg4wbRMggadDb8DuPMEQGKNX4rs
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: c734f7c0-0e0e-44c2-d0ee-08deb01f6129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IECAsPIbK1iubjixwSwgGH0LW9jnPseyvVVmr0t3YI1XK+ZcNbUu4kuhDriI99sFhSff4Uh0AZ94FqS6M16+tIU83TndeBKqpRUEO2S8d6EmS+V6sSm2ftg5yHvMKB6guQwYVWAo6J/l4wjM64Gfk9BMhsg2cDZVoMKtDtRuq/X9KwPyVSjQbMLSBPoO7pDyyoqMc0wnu/82QtizoTY6VwyAW2FdhXoBy/y6YpsJKNHU/KCdi+zGQpMvaN3wXd6ggbSwtj+6PbdSdpiYW6dpoJ2pZmmp0qn1lWU8dz6B4iol1wt+4Qi07sxW0w2Q5f10ANDCVmXehkMxDNXgByRVb+dq7Zhfpe0y6VPzSrg89jeI9BKMPTsfNdZ1cgnbf74MfOYNx9Zl5a0TXWidxXl36QHfsFCZQTpYxHIKnocaynQnsS8zzn7pvgIl21GT5/VSQC0EKATHzwc8J2/mScR1OdJQ1U5aw01pucNfYaAYU2hitWBVQWXxGToEAbF2nDyZNUPwq7HaW9i5IsI4tBmyiiGO7zMQZUECA2NTKVJYadq8JHqsa3vxkGWCh86zKdNDGJQmQdXFvAz6D7QYC8xb9BB4Ke4l1T3AlyRr3nN1raSvFV4228xD7C1jS/N98r/yYh/HLZorYwh24MfbK+mCCWaQjV8VSNbLqg1ndv3dVQs6fHhEAS2+VOTAKWAn9whV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2Ywa2tlcDdtUS9BdllzZlJQNUpLQUNFVXc0aHRmZ0ZiNndJZmpOVXVwb2Ur?=
 =?utf-8?B?bTlKbWxuVnI1MjVKZXJIS1BNZGxjOVFSRzBPMjFJLzNiRVhtcXpFSW0wWGF0?=
 =?utf-8?B?QWxHa3hkWDY4V0dHN2hqQmVTaGx3eHMzTU9TZElOWjRQZFhwQmlEbGYvdjMv?=
 =?utf-8?B?bjhPbW5CemQ2NVZpTUZwajZiNnozUno3a0x2UU5FdmdRMUpDc0Y0VS95cTIy?=
 =?utf-8?B?WEhBTDdtL3MwdjFVWU5Ca1grK0x0dE1IRmV5ZnFBUEEzS1lSUzNjeXQzbzBT?=
 =?utf-8?B?Qkh0UmVCQWxWTWs2M3BPWnZ5eDJVNG9sU3Y0QzNVbWlIZTY2SWNBU3VwTVE0?=
 =?utf-8?B?SkIvY0svcVBtZFhCaWQxSDIyZUFqQVFUWmJ5TGt2dWpiWEFjYmUxK0VwUnho?=
 =?utf-8?B?TzRMTk1ueDB2cENHN3pWcmpYWWh6R0wrSkl0azUxZ1Y2ZWpsZkxJaFJ6YjJX?=
 =?utf-8?B?ajJwNitKRGZDc2YwSlFXdEIyYzZPMlZxMkE0QjRLaHFMdHRQblNXZEx4SUdB?=
 =?utf-8?B?VEppUEdCQmdwY2dObXVzR05ic2UrbktnTzZWRmN2ZXlONDJWYUFOR3gvTi9H?=
 =?utf-8?B?YnUrcFM1dkE4KzR5M0tUeVpBQXFyVmgyZ0JXaHgvRzV4clgxakJhK3pGUXl1?=
 =?utf-8?B?TWJ1NE5wUXVCSGxjSVFRamg0R0M4enVITGNpOWhvT0F1MFZPOGZHakdjQ1JG?=
 =?utf-8?B?M1M2SkFjQlB4TTZ3RTE5c3RlYy9sTzM3WjNVRGNmT0k1Ui9kNnM4STB6K3Yz?=
 =?utf-8?B?aHQ4MXY4R0JnMnRqTnlIa1FtUUYxTEdrRE1hWG5tUnJnL0pRK256cktUcTRY?=
 =?utf-8?B?WnhBbHFRQzUwSkJtazg0NnVZbis2Y3lNQkxWcUlxa1VkdWpWMmlVS1kxOFhQ?=
 =?utf-8?B?aCtyN1N1aEJqQk96RHQ5VUxiaVNWYW5lTFBGaVVFeGV5NnBnTG5kaFJTN29y?=
 =?utf-8?B?SzdlbDZCSjlaTXQzakFKUzdRSXNna2laMG1FS1JLc2toOG13RWRIa3lUVXJ5?=
 =?utf-8?B?QTZTdGlBMTlzSVVGUUdEeDhRaGwzTTVRQkxiV0J0V3ZBdHNUK0Z5cGV5QTJk?=
 =?utf-8?B?L0V5cmVmUzArT2NVV29PSktkZTlGbGRMRXhTK00xcEpmSEFzblFMOTZJRGNP?=
 =?utf-8?B?Uk9Zb1dZK05FWk8yL1hGUXZZZVhUTnVwVmVIQXFQQmhoZlhCOFc5K3J4aDYy?=
 =?utf-8?B?YjhVZmxaNE8wV3RCaWVrNndOd0pLZ1Uxb2gvaFdlRGpMWXljOHVTNlBPTmhE?=
 =?utf-8?B?OW9MVUpWdTdqTFJsOFZYUkUwOE1TdEtrS3c2REtZbTJYb0MvOUg5ZHBQTnkz?=
 =?utf-8?B?c1FTOWUrNXRHc1RBMTJEMS9aT0ZPL2hsYzE4OVJ3dXRxeGZ6Z004M2tVdUtR?=
 =?utf-8?B?eXozUHRKeDhUT210NDY1Wkc3Q1lXWURqSlRXdWQrbEQraEVkR2s3VTlmNHZn?=
 =?utf-8?B?aGxqb0JVMUw5R2dCR1V0Sko4TFNESUxZT1hDZ2hvN3BZTVhxVDE4SzhwUi9P?=
 =?utf-8?B?blBZUGdnT3I0ZlUrSkkzUWdtZ0JSd2VDc1ZXNGt3bmw5Rnk5N0J2TXR6WFEr?=
 =?utf-8?B?cTcrbjhIN2RUSXphYkR3a0ZrNW4rTkdFUDJta1l4dytzSjQySHNNRGRMVzNs?=
 =?utf-8?B?czJLdnpSNWphZG1RWnc2cDh5MWVEYjUwZGkzZEZkOFdjM3pReXdRZ1B4Umsr?=
 =?utf-8?B?ZHc5L0swMU9Bbkl3dHp2VXVDKzhIVXdHaTFnRno5YWZCaTBFSUdiVEh1Uy9P?=
 =?utf-8?B?ZFVvcisrVE1wOUVldjZzRVA1OFRTWThhMFpEaDNqUWdDcVpoS0J1bFdTWTc5?=
 =?utf-8?B?dU9hNzgwWnV1bGhIcWtacFNDV1c3MjRKV1ZFb21qWm1HQkxhRnI5ZUE4U0du?=
 =?utf-8?B?a2IwU2tHRVpZZHBwUHV1bnpFWEh0V2xxWGhDVStrVGpRenNNMWl4ekYxQzRX?=
 =?utf-8?B?REhDdHBzUDdzRldzUFl3WGRXeFJ0OXdQZFY1QzJzSGExSFNJT1lUajRmUnlB?=
 =?utf-8?B?dlRxMG1oYWFqazFzRUNwZHF0YmMwVWM3Y3ZDbW1RU3hhSHMrclJKUWo2Nk0r?=
 =?utf-8?B?UkdCVGxFUzh6ZTl2WVRLNjZxWnJ4NGIrK0o0V251NVJGUzVOejRvUGpBQ0xN?=
 =?utf-8?B?V0dTY3IvWVVJTU1DbTU4R1dUc205cm9vQmllb1FULzNjcjgxU0ZyWDVpQ2Yw?=
 =?utf-8?B?bks1RTVHOUx6Tm92YmxPdVhVUjQ0QUNTQVpKWVVlLzZ1cVhBRjJCS2lPQ01P?=
 =?utf-8?B?eFZaUVdkZU9WNVJobkRZbjdzeXNmQ1NkNEJqSUxrMnBDbHVoNW01NWpvU0hi?=
 =?utf-8?B?TjZ1VzM5TkY0NFJEdXRPWGJmdVg1MEVJSWhySEJhU2RPNGRZOHN0QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c734f7c0-0e0e-44c2-d0ee-08deb01f6129
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:55.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEuemvTZ028IgxyoRMfdGr3PrYifYFIbW10/dxEjuQQCQ4OviQd0/FI3YXbtHZVR1IdLGPkLtMNQsJpbnJSj5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

`handle_field` is currently a function, which precludes it from referencing
things in the scope of the parent function. Given that it's only called
once, inline its contents to the closure that invokes it instead, so it can
directly reference `struct_name` without having to pass in as argument.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 144 ++++++++++++++++-----------------
 1 file changed, 70 insertions(+), 74 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index be3d97a38225..1a7098a4c6e0 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -336,7 +336,7 @@ impl #impl_generics #ident #ty_generics
 
 fn generate_the_pin_data(
     vis: &Visibility,
-    ident: &Ident,
+    struct_name: &Ident,
     generics: &Generics,
     fields: &[(bool, &Field)],
 ) -> TokenStream {
@@ -347,78 +347,74 @@ fn generate_the_pin_data(
     // not structurally pinned, then it can be initialized via `Init`.
     //
     // The functions are `unsafe` to prevent accidentally calling them.
-    fn handle_field(
-        Field {
-            vis,
-            ident,
-            ty,
-            attrs,
-            ..
-        }: &Field,
-        struct_ident: &Ident,
-        pinned: bool,
-    ) -> TokenStream {
-        let ident = ident
-            .as_ref()
-            .expect("only structs with named fields are supported");
-        let project_ident = format_ident!("__project_{ident}");
-        let (init_ty, init_fn, project_ty, project_body, pin_safety) = if pinned {
-            (
-                quote!(PinInit),
-                quote!(__pinned_init),
-                quote!(::core::pin::Pin<&'__slot mut #ty>),
-                // SAFETY: this field is structurally pinned.
-                quote!(unsafe { ::core::pin::Pin::new_unchecked(slot) }),
-                quote!(
-                    /// - `slot` will not move until it is dropped, i.e. it will be pinned.
-                ),
-            )
-        } else {
-            (
-                quote!(Init),
-                quote!(__init),
-                quote!(&'__slot mut #ty),
-                quote!(slot),
-                quote!(),
-            )
-        };
-        let slot_safety = format!(
-            " `slot` points at the field `{ident}` inside of `{struct_ident}`, which is pinned.",
-        );
-        quote! {
-            /// # Safety
-            ///
-            /// - `slot` is a valid pointer to uninitialized memory.
-            /// - the caller does not touch `slot` when `Err` is returned, they are only permitted
-            ///   to deallocate.
-            #pin_safety
-            #(#attrs)*
-            #vis unsafe fn #ident<E>(
-                self,
-                slot: *mut #ty,
-                init: impl ::pin_init::#init_ty<#ty, E>,
-            ) -> ::core::result::Result<(), E> {
-                // SAFETY: this function has the same safety requirements as the __init function
-                // called below.
-                unsafe { ::pin_init::#init_ty::#init_fn(init, slot) }
-            }
-
-            /// # Safety
-            ///
-            #[doc = #slot_safety]
-            #(#attrs)*
-            #vis unsafe fn #project_ident<'__slot>(
-                self,
-                slot: &'__slot mut #ty,
-            ) -> #project_ty {
-                #project_body
-            }
-        }
-    }
-
     let field_accessors = fields
         .iter()
-        .map(|(pinned, field)| handle_field(field, ident, *pinned))
+        .map(|(pinned, field)| {
+            let Field {
+                vis,
+                ident,
+                ty,
+                attrs,
+                ..
+            } = field;
+
+            let field_name = ident
+                .as_ref()
+                .expect("only structs with named fields are supported");
+            let project_ident = format_ident!("__project_{field_name}");
+            let (init_ty, init_fn, project_ty, project_body, pin_safety) = if *pinned {
+                (
+                    quote!(PinInit),
+                    quote!(__pinned_init),
+                    quote!(::core::pin::Pin<&'__slot mut #ty>),
+                    // SAFETY: this field is structurally pinned.
+                    quote!(unsafe { ::core::pin::Pin::new_unchecked(slot) }),
+                    quote!(
+                        /// - `slot` will not move until it is dropped, i.e. it will be pinned.
+                    ),
+                )
+            } else {
+                (
+                    quote!(Init),
+                    quote!(__init),
+                    quote!(&'__slot mut #ty),
+                    quote!(slot),
+                    quote!(),
+                )
+            };
+            let slot_safety = format!(
+                " `slot` points at the field `{field_name}` inside of `{struct_name}`, which is pinned.",
+            );
+            quote! {
+                /// # Safety
+                ///
+                /// - `slot` is a valid pointer to uninitialized memory.
+                /// - the caller does not touch `slot` when `Err` is returned, they are only
+                ///   permitted to deallocate.
+                #pin_safety
+                #(#attrs)*
+                #vis unsafe fn #field_name<E>(
+                    self,
+                    slot: *mut #ty,
+                    init: impl ::pin_init::#init_ty<#ty, E>,
+                ) -> ::core::result::Result<(), E> {
+                    // SAFETY: this function has the same safety requirements as the __init function
+                    // called below.
+                    unsafe { ::pin_init::#init_ty::#init_fn(init, slot) }
+                }
+
+                /// # Safety
+                ///
+                #[doc = #slot_safety]
+                #(#attrs)*
+                #vis unsafe fn #project_ident<'__slot>(
+                    self,
+                    slot: &'__slot mut #ty,
+                ) -> #project_ty {
+                    #project_body
+                }
+            }
+        })
         .collect::<TokenStream>();
     quote! {
         // We declare this struct which will host all of the projection function for our type. It
@@ -428,7 +424,7 @@ fn handle_field(
             #whr
         {
             __phantom: ::core::marker::PhantomData<
-                fn(#ident #ty_generics) -> #ident #ty_generics
+                fn(#struct_name #ty_generics) -> #struct_name #ty_generics
             >,
         }
 
@@ -452,7 +448,7 @@ impl #impl_generics __ThePinData #ty_generics
 
         // SAFETY: We have added the correct projection functions above to `__ThePinData` and
         // we also use the least restrictive generics possible.
-        unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #ident #ty_generics
+        unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #struct_name #ty_generics
             #whr
         {
             type PinData = __ThePinData #ty_generics;
@@ -466,7 +462,7 @@ unsafe fn __pin_data() -> Self::PinData {
         unsafe impl #impl_generics ::pin_init::__internal::PinData for __ThePinData #ty_generics
             #whr
         {
-            type Datee = #ident #ty_generics;
+            type Datee = #struct_name #ty_generics;
         }
     }
 }

-- 
2.51.2

