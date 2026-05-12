Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736464C9572;
	Tue, 12 May 2026 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587817; cv=fail; b=WaZVrq1/D6X2kWNfYo7dwGDb7+jicDXLUio2nVbj5cED8ZHq79lM5MLTJU2bGx55OH2GflP9Zo8TMzI1KpGAioKSPJdilKwUqNrfzjrr+A6CBxkRj0e5aqsE2U3HD1cIpnpb+59T40CEYeDq04/Y/NrEh2pBd2N/CQ8hl/AzltM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587817; c=relaxed/simple;
	bh=DY8nNU3+6c7nzbTevT14WWbHK/zSTmonr5Bef/Q7s8w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hmNtInZo9jlTplFxN9HJQQFeTJPeAOa2F3Z3FYKJBgHTrRd48Hc/sQXIn+GAfTtbG76VpfXF7FxMA4N5DNUmTUylc9i5TViJ+dJDDHMFvifgqeD0jTMr1z94QedyNCOn2+h4S4we2ntY1Y7RKPZHKITsLTuzhVmfZh4fq7RVn2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=khchRyam; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="khchRyam"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XANqVeVKqZEpow+pmUVRy7aRkqfMpU5mKIdhNd2ertPSZI1aaUj9JAmPLPdto4/vdl3ef4j5Z5pDBv1pmcPeQz13Ivhq6ur1BtyvAfaiY8hoGK74bp4l9LfTHXlOaAJuyH0wQmxZ16y8+ziLqfN7J4adwKNOj8TsicYnJFVzTjGeCTwOoQiZ83R/URi9CduJoz21sHEhU1c7dZIbT2kc7IzJLbuU0pXR+Mitog3ABiClyOLIv5SFBtA9fIunApBnwk5mkb5tvXk8apWfcr0/zGKSAyVgctaxiLyCJxUJ48HqsSkR8cwJmQnxURtRQhw/yHzO+y2RrjKTWzZd12HMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evlPlJINrTR110dPin9ZpXNp2mlJ0M7g9olskDiqUxs=;
 b=WwRPEU/vt0ojwFdHsK4wrIKXjwhbA0vhke7XkPQOrY2CcfKNYGy7Epkkls1w9SO1AMyAOkctN85QIKCcK8LuxWww76synD5O050UAe90xTK3K2F4SQkUaPlv/8gHYvtDoVEkUzDXpHBsxYr5UAOOSXqdVkvsufdqksSQu8cmsgENdWN8VRtJM9AMMbuAngGm+gGCPMWSFKnMSAsFDQiHcraw9F4sQ7ipi2AkXUp2/fqLceM/laqYoaRUXfpGXIoPntattQAZ4cRT0AigVX8vfTIwhDbn/moR7ek7ViCQVqqTBXANECD/sLui75vu8J78VgfoImvyRqd7c4zIweOXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evlPlJINrTR110dPin9ZpXNp2mlJ0M7g9olskDiqUxs=;
 b=khchRyamQFjrzoCam+T6oj9F+lc+2v78E0lr4KTgt5oTEeLlJmX+ByQ12aYyfk8eRebjXSgFucZZKQjxDPNpD8sD0sHoxFjyZ5mS/d77/GRhHG3h/NFHykLU0FGg/ipyJc8WsiEe3f0u4ksm4Tg2XYG2YvfiC0qjaAxbuJwRtZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:57 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:51 +0100
Subject: [PATCH 6/8] rust: pin-init: internal: make `make_closure` inherent
 methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-6-81963130dfbd@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=5706;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=DY8nNU3+6c7nzbTevT14WWbHK/zSTmonr5Bef/Q7s8w=;
 b=YAzNpiO6OZs3CwIuA9/V12jUmgJ5vJZReU5/yEL4p68ZRpuYjNsS80d38sz7GeBJv+O3bERfx
 mnTB8DwgVAWAOv0799++VOJrKdKzUAfx1KV/yiJk53VMuTqNOxKyWQd
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
X-MS-Office365-Filtering-Correlation-Id: bcf17c94-8488-43c8-f956-08deb01f61fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a71rwq/IocWR5a56PoRAw3Qnr5JEjDiJkvIpag/LQkI45VWu9pfqJ+i2qamDx4RSPBzoRNYLtF5JfW2MiJlcS39lOP+wgQLoqYrFs16Ck8LwW9iUI8Xy6irhb24Le0nwoL2ay3a8X4pwDrn21EkfuSwOkAwlQibbcVprHJuakmxz0H5N2aspxFxvRF/tV/G1GCHT2fnIBbS24JzbVXBXQ7EvQIEmowaeipLWFAb98fvsUMOP7tVuDhzEBja+MyZSJgz+frJ+Ba+QIjXSgxNxqDENxA8UX0Poclk6yzm0FWuZL0iLYN1vcpn423KDlg/BF6qrwSqOtUVhpv8Op8llxH6JifF2HwHZ4yzpPguhEGdr4DXU4UITRXfseVn0D5L0r5WAOZFfTjHBp3YQK7Vo3hzfTFHpTYWSB+AxVAK3b+zLDYjbfI16Av4Ekf4VpBSisYi1xdB61m/zDmM93lpT/imrtAaSDEAFL2Rr9WYgXUrLLS+qRqb4EcbNTjc7oVzLleO0vrudpibbyCQs4/kzzfyqZBT5wyJgCLko5uja0+W69DZehJxB/qYljGBAiTxU68n9pF1LFjZVJGP84zGYJfzsHaSSx8ZFI6UMj8YHf/M4MqcCeEPgd5K7LuX8M1tgWNhsc6U8pl8xcTj0jgG2Xd3yVWMjlZEl2EzSWJtensjXjpwm/Spsk8Kb5yYq33nx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWovTHNPc1V6aDNIdlJvWDRkeDNvczluZGNLemUxM1cwRlhMdEY1V1UzNjJy?=
 =?utf-8?B?QVBFc0dvZzRLNXNMajhYNnJzbytxMUtCOUx1K0JiS3hCVnpwbERod0NRdXZl?=
 =?utf-8?B?MWNGdC9aTFAwaUJmMDZ5N3lkSVlkaC9GVzJsR2xiUm85dCtjYmV3SWFKSnJs?=
 =?utf-8?B?VllEektwd2o3OEdwNkh4UnhOSXVFdkt3WEF5SUhDK2ZyM0I5YW11UzhUWlhs?=
 =?utf-8?B?dmhNNFEva1RYVDh3UkE0cmx3MzlXUWFFRXpRalpCL3lIQXdMRGJ2c3ZaV0xi?=
 =?utf-8?B?Zm9lZjlBLzBmYUVxRG1ReHpXWjdvT3NTWWlYTTFYN3Z2NEhkM2VYdU92TkY5?=
 =?utf-8?B?eFAwRnFCVUR1d3JWNWRiRksvaXRadmtLSDREVTRydEhyMVdVVEM0RmdpeEkz?=
 =?utf-8?B?eTRJV0V3cVluTkRJS1h4cG44UDNORWpiYVczTko0RUxBc1RDNzN0T3hua21m?=
 =?utf-8?B?VmpTb1ROR3VyK254Um8xd0ptL2ppL3ZFRkJhczJVVlVucHc3K0xFQzRwc2V0?=
 =?utf-8?B?TUVxcG1WTWExWUpZQVk2NHlhblA0Z3kweC9pS3lVKytIT04vYUFMNjZkajkx?=
 =?utf-8?B?SlkvelJ1RkNQOXdpTWV2T2U5bm56OU5CQjZjdklnV3FOdmRpSFVIVG4xTXN1?=
 =?utf-8?B?Y0RyT05nTHNhZVcrK3VjT1NLajVFUHpwQkpUdVNMTzk0MnkxSkg1SmQzM1Ix?=
 =?utf-8?B?VEQ5UE5PZ29ka2JrR2Z5a1VpdEV6cktoWTN6K052V0s5MWQzMTNuaW5KR2tT?=
 =?utf-8?B?QVJmTHZXYjBudmFFOFdhTDhrY1MzWHVOaE5YQk9CZ2VwTzhPRTdMaDZYTnQ1?=
 =?utf-8?B?WjV0WG03UkY0R0V1SURqdC8rL2VpNTlDU3pKc2RkVWZaMThOK3V0Q3oxZFVl?=
 =?utf-8?B?WjEwZVZpcVJja1BUN0tZSFh1akF0bzFjc1UrNUtpY09pQXVsM0dSVEFyQXZn?=
 =?utf-8?B?MC9kek80VDgyc3VpOUQ0MmpDMFRFckMxTzk4UlNkZEVTR0NybWFqV3E0VW4x?=
 =?utf-8?B?RkNDazY2b24zN1FUakVTdVA4RGF0ZjUwS3k0dUtnVUE5eUY2bGIwcndRbXBH?=
 =?utf-8?B?czR2QzA1dXBGQXQ5Mkl2cXFNbHorY3krWFh2ZkZTcGhnWTJ1ZlordGNaS2Vn?=
 =?utf-8?B?TitXSzJDWitkaWVYdFBEc0lFTnh1SjJZQ2MzOGlSZVdvS05yZExXRmdiYU43?=
 =?utf-8?B?UWhqbERLT1BIK0JhclFicWFnd1BUUVRoUU1FQ1pZQzg4OWVabGc1OXRNQTA0?=
 =?utf-8?B?RGh6VWVuaHU4Y29zU3JJN25EajBQZEI4dEhCQVZXOWtyNVhFd0JXOXd6cFZB?=
 =?utf-8?B?RkpDYXBMYXhhalNpblFjSWdlaW82Z2kwYnUyLzdUcUVOUEFwSDUyaUpDSTRP?=
 =?utf-8?B?SkhPMExxOGVmMUh2UmVtOFlWdEZpN2xVMGVDV3BRQTRPSHg5RGpTRGlYVFhC?=
 =?utf-8?B?M2dMZjFxeUU2WjhPNWtpcjdRaFYyRUNGOWlMRk1IMDFoeXpCWi8wSUZhYy82?=
 =?utf-8?B?WWV2NmhiZ1d0NWt5Z29RK080STNwQmREWHM1Y1NWU3U5NGZZSVdoaGZLNFlv?=
 =?utf-8?B?akJ5Z29wdEsvenRGa2lMTXVaMHNUWXRUV3BiRHNRemROeGtCTzdvKzZjVHkv?=
 =?utf-8?B?Zld5TFBHRjZ5UjRIcWZCbnZGUGtTVWQ3blRtUElhOFZzY3QvcEEwZEtRR0Jq?=
 =?utf-8?B?VnZNbzQybXJGRzM4citpZVBFdGdIb0dqKzBjYlcrU2dqOFI1bVR5TlFHRlpI?=
 =?utf-8?B?UllIKzY0SGtxWVFiNkZtK1JlRGhtdTNnVUdwVW9HcDgveXRaVldsUXlzQk1R?=
 =?utf-8?B?aUIzSGIxN092OWlqTjk1dyttRmhJTzFPNkpzWjh6VnZ5SVBGaXRUQU5Ib1cy?=
 =?utf-8?B?c3k5b09Sd0VNM0tESU1nbmFBL0R3YU5peEkyQy9IajJwZHVvUmZ4eHFpenJJ?=
 =?utf-8?B?ZGxTUUlQRzNBL3JDUS9XNDZhbWV2dHI0U1lsQTBXRVl4MXI0VWNZSk02WUwz?=
 =?utf-8?B?VTVSSjU5SXMxWkpRUVZkYkJYVklIZjk2SWxnUG8vQlZhVHRjQ0JpYTBwR1pO?=
 =?utf-8?B?alJETHdtbnAxVjJjT0NFMU1MK2ljOC9PaDdmK0RBM0duM3dqUGpBM1hpaG5G?=
 =?utf-8?B?YVYzNWhMTTVCMVJRV3kxZWx6VFhaaFVDa2JPdlVzT1M1R3FNWU56RWZweVdQ?=
 =?utf-8?B?MFFQT2NveDhEUGJpckFTUnQ3WFBwT0hYdE15OEQxQkExQVhYMmk4UHlTUytn?=
 =?utf-8?B?dFRaNW5JZHQvTG9rZi9qbkpLTzk2NFN2bllyRUpkMUhHbWdHRlJNdThJUEdU?=
 =?utf-8?B?ZGFVeFpjUWRWNlVPcDZiM2xPUVN5WkVURmQyVjdSY05UZ0NDdmFIZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf17c94-8488-43c8-f956-08deb01f61fa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:56.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzFEBE0MFEXYZhhlWWOZvZzjlVpTKHoRr3wYiDbxyKBTT0G6g1ijD2oiH+4n6aXh8xysLxrACR7UxXgZEPeTnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

The `InitData` and `PinData` traits do not need to exist, the inference
helpers could be inherent methods instead.

There is no risk for calling the wrong methods even when user defines it,
as inherent methods take priority over trait methods.

With this change, it unlocks the possibility of attaching additional bounds
to the method per type, which is not possible for trait methods.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     |  7 ++---
 rust/pin-init/internal/src/pin_data.rs | 17 ++++++-----
 rust/pin-init/src/__internal.rs        | 52 +++++++---------------------------
 3 files changed, 23 insertions(+), 53 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index a0b3c3790d43..11affa76d1fc 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -103,17 +103,15 @@ pub(crate) fn expand(
         |(_, err)| Box::new(err),
     );
     let slot = format_ident!("slot");
-    let (has_data_trait, data_trait, get_data, init_from_closure) = if pinned {
+    let (has_data_trait, get_data, init_from_closure) = if pinned {
         (
             format_ident!("HasPinData"),
-            format_ident!("PinData"),
             format_ident!("__pin_data"),
             format_ident!("pin_init_from_closure"),
         )
     } else {
         (
             format_ident!("HasInitData"),
-            format_ident!("InitData"),
             format_ident!("__init_data"),
             format_ident!("init_from_closure"),
         )
@@ -157,8 +155,7 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
             #path::#get_data()
         };
         // Ensure that `#data` really is of type `#data` and help with type inference:
-        let init = ::pin_init::__internal::#data_trait::make_closure::<_, #error>(
-            #data,
+        let init = #data.__make_closure::<_, #error>(
             move |slot| {
                 #zeroable_check
                 #this
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 90f6b05b957c..713a43c27826 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -447,6 +447,16 @@ impl #impl_generics ::core::marker::Copy for __ThePinData #ty_generics
         impl #impl_generics __ThePinData #ty_generics
             #whr
         {
+            /// Type inference helper function.
+            #[inline(always)]
+            #vis fn __make_closure<__F, __E>(self, f: __F) -> __F
+            where
+                __F: FnOnce(*mut #struct_name #ty_generics) ->
+                    ::core::result::Result<::pin_init::__internal::InitOk, __E>,
+            {
+                f
+            }
+
             #field_accessors
         }
 
@@ -461,13 +471,6 @@ unsafe fn __pin_data() -> Self::PinData {
                 __ThePinData { __phantom: ::pin_init::__internal::PhantomInvariant::new() }
             }
         }
-
-        // SAFETY: TODO
-        unsafe impl #impl_generics ::pin_init::__internal::PinData for __ThePinData #ty_generics
-            #whr
-        {
-            type Datee = #struct_name #ty_generics;
-        }
     }
 }
 
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 010e8bfc6cd3..d7fdcfef41d2 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -113,30 +113,12 @@ pub unsafe fn new() -> Self {
 ///
 /// Only the `init` module is allowed to use this trait.
 pub unsafe trait HasPinData {
-    type PinData: PinData;
+    type PinData;
 
     #[expect(clippy::missing_safety_doc)]
     unsafe fn __pin_data() -> Self::PinData;
 }
 
-/// Marker trait for pinning data of structs.
-///
-/// # Safety
-///
-/// Only the `init` module is allowed to use this trait.
-pub unsafe trait PinData: Copy {
-    type Datee: ?Sized + HasPinData;
-
-    /// Type inference helper function.
-    #[inline(always)]
-    fn make_closure<F, E>(self, f: F) -> F
-    where
-        F: FnOnce(*mut Self::Datee) -> Result<InitOk, E>,
-    {
-        f
-    }
-}
-
 /// This trait is automatically implemented for every type. It aims to provide the same type
 /// inference help as `HasPinData`.
 ///
@@ -144,30 +126,12 @@ fn make_closure<F, E>(self, f: F) -> F
 ///
 /// Only the `init` module is allowed to use this trait.
 pub unsafe trait HasInitData {
-    type InitData: InitData;
+    type InitData;
 
     #[expect(clippy::missing_safety_doc)]
     unsafe fn __init_data() -> Self::InitData;
 }
 
-/// Same function as `PinData`, but for arbitrary data.
-///
-/// # Safety
-///
-/// Only the `init` module is allowed to use this trait.
-pub unsafe trait InitData: Copy {
-    type Datee: ?Sized + HasInitData;
-
-    /// Type inference helper function.
-    #[inline(always)]
-    fn make_closure<F, E>(self, f: F) -> F
-    where
-        F: FnOnce(*mut Self::Datee) -> Result<InitOk, E>,
-    {
-        f
-    }
-}
-
 pub struct AllData<T: ?Sized>(PhantomInvariant<T>);
 
 impl<T: ?Sized> Clone for AllData<T> {
@@ -178,9 +142,15 @@ fn clone(&self) -> Self {
 
 impl<T: ?Sized> Copy for AllData<T> {}
 
-// SAFETY: TODO.
-unsafe impl<T: ?Sized> InitData for AllData<T> {
-    type Datee = T;
+impl<T: ?Sized> AllData<T> {
+    /// Type inference helper function.
+    #[inline(always)]
+    pub fn __make_closure<F, E>(self, f: F) -> F
+    where
+        F: FnOnce(*mut T) -> Result<InitOk, E>,
+    {
+        f
+    }
 }
 
 // SAFETY: TODO.

-- 
2.51.2

