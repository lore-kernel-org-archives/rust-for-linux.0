Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC2139B978;
	Tue, 12 May 2026 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587804; cv=fail; b=n0V/HbZ6sNT3kR8gdKPp9UIXPTIdRVZFF8chsYNwyR/uWDDoIdIYkp15mgiINwqiXD+z40SUV5Mov/Mo1UDKBDNgIetG/QM2uL/5AJXw9Xobyi8nhIZi25Es1PLINElVN+6agYDC0Sz3SNrh5Poz9RkIaTAnnL/H2gxyAZIRFyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587804; c=relaxed/simple;
	bh=5tXzIjm7vWZYhcCX3hCm0NvA1SrqH8UMKR0dasGIK9M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=URLhqho5fFVohwalJZ4iN4HRgWvBI5TXNrRvlcWFsH/GmSe1L3V7KlVBTWMdwYGkZ68LFZmfgGMz6UckkO7qM7fb3Nwg62F/8CUUd6iJhpROc9e14LvNh5iJE7iuJwhU2xPoc+g/vMwtU9HfuRDNw46PkfDG+NIeC5eS9SsYnl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=tIVOyJkF; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="tIVOyJkF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvmZ0XTZ9+s104FDkNcXtQBZUr3hlynmN5oYpcp1G9O8EvS91uHSYIcNeTSw/eLnHvQGbGQfRO70faSyIlQ7FRfYUGm21MOP3tnvDm1OfTByISF72xYkmMG7MpP7QAf6Q+6BKG9dAjRlZvNh9pxDEv8+rqjz2QV9iEFMjE6dwdbC9xl2YTd0yY8+D40pY6jnvCSXFSyBTL3uq633oxhRvp4CjOpK1XLTFT867ElVU31f50pecDs45OrkD3Ra34pUVtodSnFCyGyDwGEWEj3oOWSq4M0WVOkymgCV1rmik1xrHXMcoLDZftCYigBODgmDooqA9B/gc6m0CGoCZ7yzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4F/b/5LV+ok7+qe2BynuejyNmhsWxgW93/W6apEYbWw=;
 b=DiB8NJYOl7kV8/31woZkhwxIhw30RoAcyLLnPAFVtvDhUx16hCuTxF/pI9bIb87GoBKF7LIwdrhjC77/sThAUNyxLwyYI6A1oawelyWtRnF7Ch37KlvDMhVsU5oHvn781EmcztL8iad3CPllfEUtUU1K6/+lb7BN98a0s+a7wflapRU7UFhV/W+g8Bjdeg7oHtvM/3lo7jWa5TcgW8Bs/OUpRK4dlZ4Kbm/U91MDt6EQo5MIckZMS915MC0ZNLDsjFG6qc4Up2SoJfr4iS/7LqO+nFruFYCb8yhB+f/6dDTTGfE7yusKJX33KiiJC4KA+Dt23/ffgmTxQUg0qeEgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4F/b/5LV+ok7+qe2BynuejyNmhsWxgW93/W6apEYbWw=;
 b=tIVOyJkFRGKwYpsAYDp5CqA7jEc5eohGCJTchOuU/SYF4NB9wYjuQjCmpuaDYTURejIkWnD0m79j7H+geWVFB+goCpss5rtG0CcmvWud5rCuKvfjLDu04CZ6lm/CEefHKD1e/+LtYsZ2SG5iaWySzi5qTyV6NZZeS8fwkDJm58I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:56 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:47 +0100
Subject: [PATCH 2/8] rust: pin-init: internal: pin_data: add struct to
 record field info
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-2-81963130dfbd@garyguo.net>
References: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
In-Reply-To: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=6285;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=Mj4fG9PJEbprNRBl8PEHNEkHDoHd+pPyBnmpgd9DfJM=;
 b=IjYGVeUJsTxE/e3L4ZNubI3UnIxAIPODXcjo2eq0ynslE/PSEeYRrxEoFbqKshA+aMzZn41uK
 mF8bbBHkTDjClviwayFjFT45S/bIf6qjOFnrxaD3e2GUNDpZ+hIKHRC
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
X-MS-Office365-Filtering-Correlation-Id: 5da61a8b-b38d-41ca-3c90-08deb01f6155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	02/mCMVbDxwPW7BZ+BliIKoZNGScZeasuHJbRs5K8MITJH64Knhua0opiOrGoE2cgyymfBhWoYfadGYDkdI+V1t5AHxXQcK9jZApzG59NjEPeM1bIKG08Vqz5bGd1coGmGfuNCziZOg2doQ9LOfjSHPlx6sHvtLqINUcVuaaIKgnPW03BO21OnHUzzROvy5e8iQ+emfAxS8KTmLWu3aR/ikULdHrWLhLzqnBwnF4USDX98jjm3IZkoYtg/mApdXuzpRyE0ktxjbOWX05K1Ij2/BeXwkcVuYno2jqbwSPDvMGI1KFoxTc61RdFFMd50FBZkDq6/NSWGzmI/645GQTsBhZIcblib6VmhxA+Q4m7B67x1KPMJZMhPawi4H6SYEIW33JgYv3XockvTGuP5CmUcAZkOEcbORrn+K7IA5fnPuEvip1uH/8C8iWWQqXzmT7Tnn4MKK/URn4tNKOikVOD+5Pfc/mhuERp33h/LJg4qLE2Cqkkbx+e142OT/tnn6q01n8vx62y221zupY3YEkDezq/gCpdpDP1Uanu+EQccRiricq7u4PxkEyb5rvDugyKHjVFHMB1Xwu4FW7bJC6malLfM8fu9GaY/H+9hOwmpvD0s5kXuBh+07frjoxUyy6xMlRf0FIT1V5C1bazTx6dPAKSISdw29+EF/xsqfpB3COPg1P2lHf0VbOmhvIydEc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(3023799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1dLRmYyRFVIVzBCcUFaU0xLM2FuMGpKbnJDc0ZPaEZCekFjOC83bG9xQ3RN?=
 =?utf-8?B?dktIUmZuMkEraHlaQkwvejVVQUZ5d1VlS2hQWFQyOExxS3R5YnJ5OVRQQ01X?=
 =?utf-8?B?L0JOZVlDTkg1OVBJUFArR0hxZm5yY0cxTWFXeERXeHM0SWdnVms4ZDJqVnNh?=
 =?utf-8?B?Z25yU1RtOTUvM1NXamFDdTE4UlFtZTFmNHJYUzBkVlRJRjRXY0NjOUs2THFG?=
 =?utf-8?B?Y0E4RkJPc3RKeXRoYmFSdVR0TXQxc2MxUG9TU1hKbUZtTFlFVGxyZElDQ0ZR?=
 =?utf-8?B?TFlDQjM5T2FxVmJoZlNtQnZ5RkxhakYvWFhZNHFTY3VQUDlkU1A4ZmxqRGFT?=
 =?utf-8?B?RENKTnRGYnZRUzdLODkrVllJZWQyTVc4UE92WWpYMVY5VTJwNnJEZC9Wcm5s?=
 =?utf-8?B?S3JmbURoMzlSMU5pRHd5U0RuQ1gyQW1odFJJdEVyQ1hhRDZHOVozeXRWbXRJ?=
 =?utf-8?B?a3NPOFI1OE9KeG5mc3E3VHBvNjQ5L2NFWVcvVEM4RTFURU1USDUwUG9ZWGUv?=
 =?utf-8?B?YnRIRllJc0laTGJZd1RNa3FUTytkcEI1U0U4Vy81SXJVOWY2ZkRPekFhTXVJ?=
 =?utf-8?B?M1AvVldFVHVQTzRvQjc5T3F6Y2h6T041NVlRZlZmZktTZDZORG9Vdm9PZFh1?=
 =?utf-8?B?L3BHYlJ6NEliakROcEdnQ2s2RVI1aU90c05DVUpmSjZISjRCUkUrcTJKZnBr?=
 =?utf-8?B?ZkNTbFpBeVFQRnlyZytKeXFZMVlCMVVhc010eW94ekhtcTNzRXdJTlRxWjdo?=
 =?utf-8?B?T0lXV20raUJ3ck9ONXo2NlpObEJVeE9LTDZKUngzRkhQRTZsOSsxZDdmSjZj?=
 =?utf-8?B?RVFPSXMrbUNpbk5KQkhFbE9teUF0anVVWWtid2YxS2kyT0FrSGZwcUk0ZmMr?=
 =?utf-8?B?aUZ6S21aYzBweEs3K1R3bktHOGg0NlY3NzZzZERJcVNqaWl4MmNWUEJ2cG1t?=
 =?utf-8?B?ZjBZQUtOcm5wcVRrZStNMFdPYVUxMmd5aDJmRG5hTG5BOERLNXlxTis1VXo5?=
 =?utf-8?B?akphTFFUSjYzQ1Jnb1FBVzlGSnR2N3pXOHAzb3ZwK1pkR3dZOVhDU005S25L?=
 =?utf-8?B?T1FqQ3JhbXprTjQ3Zlcvdy9hTEF5Wkd3aGIyeTRuWlQ3SHBrTC90Y3A0dFF2?=
 =?utf-8?B?cFhZVi9tZ2RVMEp4NU01SEI3Q3JhbEZ3RXZyd1lRdnFPS2RHWWRBVVpuV1dz?=
 =?utf-8?B?N0lvN3BVZllXTTJ2UUpYVDBhNFExK0czaVk3YzVPL3BkRmtoQnFQa3JYZDdr?=
 =?utf-8?B?WkRNVmlVWXFMOUhnWm9hRCtua2NtZnMzc2ZVem4vNTVvS1dnc2N0OU9LQWJq?=
 =?utf-8?B?WFJRdGFHcW5NMjNyYTRhd2lTcGVtN0FqR1NnQ2Vna1RyNW8rNm1uQis4a0lq?=
 =?utf-8?B?UWk1S2FKV3FzSWVJbStxb2VQcmNCdDY2aFFyN0l3V00zcUZKQWR5dmgzcklY?=
 =?utf-8?B?UUtIcTBYRktsRFhnZEdxZDBBaUNRdklEQ3FNVmJQaWx0c3dTeEpwYzFneTZO?=
 =?utf-8?B?NndZTkVJai9pc2p2Q0FRV0dzcVA1NnJreURPMS81VlV4d1kwMFF6ZTFYODJC?=
 =?utf-8?B?VzExYjFGQWJUaFJSTHlVVzV1Q2lzdGRwTDlZdmFKNXIwYW91NVNIS3Y1OVRK?=
 =?utf-8?B?K3pzS3ozKy9uV3ZrTjRlTVRSb28vT082UnI1NmJFSTdiVElFZ21ZSEdndi9w?=
 =?utf-8?B?VE1UeUhGbW12aW02b1BycWljY21UUGRrR1BmMCtSTmg3UFU5cWg1WHUxQTNJ?=
 =?utf-8?B?UkRvdFZobWc3TnJKZW8yRktBU0RPVm9LdXRUbURyeSt2SUZvZXU2b0NSN2J1?=
 =?utf-8?B?RnNyQ2pyaU54ODJVWE52ZHE1RFpQcUhOQzVtVFhQSUlLdkROR0FyNGFVVUo3?=
 =?utf-8?B?OFIyZFk5WW9lZXY1WVdHS1FremtTRzI3dXphaldiWXZzQkhpRlVxN0xtaFFk?=
 =?utf-8?B?UTFwazVoTVY1anBnaDcvYWF0Wk9lVWdEdFNVRTlZWjlWcndMUDlKNTBQU0p6?=
 =?utf-8?B?ZmlNbEFmU3hyTkxFeHpLdTBvUitTTUsySlZnZ3dJcmIxeGhoYW5sZjU2Yzli?=
 =?utf-8?B?cmNuZFROTDNMLzNFaWh3WmpYUFU4WEx5SU11OFY2K0tJZ3NnVnRoNmFzS3VR?=
 =?utf-8?B?RGk3WDRnUnNSM09oWUlBMGtMSlI1VU1HamdUTi9hWnh1eVlxbzIxQ2pJQXIv?=
 =?utf-8?B?UVRHMTNJUHFsYzMxMHRjak9IQXJadG9OVnd5Sjg4bmJ3VzJ2VlJudjAzdVlF?=
 =?utf-8?B?d01SYTducEY1ZFlFbVJvdUNXaFkvTTc2Rk5DeVRYZDdEVzBMWUZ4MFpzVDZW?=
 =?utf-8?B?eGlnaWgwUG1SUjllTlBLWFFTZ3EzeVk5RnJVcEpucGYzRzlkNGRRQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da61a8b-b38d-41ca-3c90-08deb01f6155
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:55.7345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFXNp8GhqIN/qt9JlJKoWbZNaI8ur0qjurqahHtir8weltTkUmvIziEI2k5jhvAcuztIdb5Ls50XslMvXeFurw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

From: Mohamad Alsadhan <mo@sdhn.cc>

Introduce `FieldInfo` struct to encapsulate field and other relevant data,
instead of carrying a pair of `(pinned, field)` in all places. This allows
us to add more information to the struct in the future.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 53 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 1a7098a4c6e0..0199d0143308 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -35,6 +35,11 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
     }
 }
 
+struct FieldInfo<'a> {
+    field: &'a Field,
+    pinned: bool,
+}
+
 pub(crate) fn pin_data(
     args: Args,
     input: Item,
@@ -73,24 +78,30 @@ pub(crate) fn pin_data(
     replacer.visit_generics_mut(&mut struct_.generics);
     replacer.visit_fields_mut(&mut struct_.fields);
 
-    let fields: Vec<(bool, &Field)> = struct_
+    let fields: Vec<FieldInfo<'_>> = struct_
         .fields
         .iter_mut()
         .map(|field| {
             let len = field.attrs.len();
             field.attrs.retain(|a| !a.path().is_ident("pin"));
-            (len != field.attrs.len(), &*field)
+            let pinned = len != field.attrs.len();
+
+            FieldInfo {
+                field: &*field,
+                pinned,
+            }
         })
         .collect();
 
-    for (pinned, field) in &fields {
-        if !pinned && is_phantom_pinned(&field.ty) {
+    for field in &fields {
+        let ident = field.field.ident.as_ref().unwrap();
+
+        if !field.pinned && is_phantom_pinned(&field.field.ty) {
             dcx.warn(
-                field,
+                field.field,
                 format!(
-                    "The field `{}` of type `PhantomPinned` only has an effect \
+                    "The field `{ident}` of type `PhantomPinned` only has an effect \
                     if it has the `#[pin]` attribute",
-                    field.ident.as_ref().unwrap(),
                 ),
             );
         }
@@ -143,7 +154,7 @@ fn is_phantom_pinned(ty: &Type) -> bool {
 fn generate_unpin_impl(
     ident: &Ident,
     generics: &Generics,
-    fields: &[(bool, &Field)],
+    fields: &[FieldInfo<'_>],
 ) -> TokenStream {
     let (_, ty_generics, _) = generics.split_for_impl();
     let mut generics_with_pin_lt = generics.clone();
@@ -160,7 +171,7 @@ fn generate_unpin_impl(
     else {
         unreachable!()
     };
-    let pinned_fields = fields.iter().filter_map(|(b, f)| b.then_some(f));
+    let pinned_fields = fields.iter().filter(|f| f.pinned).map(|f| f.field);
     quote! {
         // This struct will be used for the unpin analysis. It is needed, because only structurally
         // pinned fields are relevant whether the struct should implement `Unpin`.
@@ -238,7 +249,7 @@ fn generate_projections(
     vis: &Visibility,
     ident: &Ident,
     generics: &Generics,
-    fields: &[(bool, &Field)],
+    fields: &[FieldInfo<'_>],
 ) -> TokenStream {
     let (impl_generics, ty_generics, _) = generics.split_for_impl();
     let mut generics_with_pin_lt = generics.clone();
@@ -249,21 +260,21 @@ fn generate_projections(
 
     let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = fields
         .iter()
-        .map(|(pinned, field)| {
+        .map(|field| {
             let Field {
                 vis,
                 ident,
                 ty,
                 attrs,
                 ..
-            } = field;
+            } = &field.field;
 
             let mut no_doc_attrs = attrs.clone();
             no_doc_attrs.retain(|a| !a.path().is_ident("doc"));
             let ident = ident
                 .as_ref()
                 .expect("only structs with named fields are supported");
-            if *pinned {
+            if field.pinned {
                 (
                     quote!(
                         #(#attrs)*
@@ -291,12 +302,12 @@ fn generate_projections(
         .collect();
     let structurally_pinned_fields_docs = fields
         .iter()
-        .filter_map(|(pinned, field)| pinned.then_some(field))
-        .map(|Field { ident, .. }| format!(" - `{}`", ident.as_ref().unwrap()));
+        .filter(|f| f.pinned)
+        .map(|f| format!(" - `{}`", f.field.ident.as_ref().unwrap()));
     let not_structurally_pinned_fields_docs = fields
         .iter()
-        .filter_map(|(pinned, field)| (!pinned).then_some(field))
-        .map(|Field { ident, .. }| format!(" - `{}`", ident.as_ref().unwrap()));
+        .filter(|f| !f.pinned)
+        .map(|f| format!(" - `{}`", f.field.ident.as_ref().unwrap()));
     let docs = format!(" Pin-projections of [`{ident}`]");
     quote! {
         #[doc = #docs]
@@ -338,7 +349,7 @@ fn generate_the_pin_data(
     vis: &Visibility,
     struct_name: &Ident,
     generics: &Generics,
-    fields: &[(bool, &Field)],
+    fields: &[FieldInfo<'_>],
 ) -> TokenStream {
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
 
@@ -349,20 +360,20 @@ fn generate_the_pin_data(
     // The functions are `unsafe` to prevent accidentally calling them.
     let field_accessors = fields
         .iter()
-        .map(|(pinned, field)| {
+        .map(|f| {
             let Field {
                 vis,
                 ident,
                 ty,
                 attrs,
                 ..
-            } = field;
+            } = f.field;
 
             let field_name = ident
                 .as_ref()
                 .expect("only structs with named fields are supported");
             let project_ident = format_ident!("__project_{field_name}");
-            let (init_ty, init_fn, project_ty, project_body, pin_safety) = if *pinned {
+            let (init_ty, init_fn, project_ty, project_body, pin_safety) = if f.pinned {
                 (
                     quote!(PinInit),
                     quote!(__pinned_init),

-- 
2.51.2

