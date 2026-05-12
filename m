Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CFE3655D6;
	Tue, 12 May 2026 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587821; cv=fail; b=tiiiJDNQUwndkh2idPZeP7Gp+ywDjdkcYPNe80V+Hcv8kzVCBbg8O8cBobI8SkDXWQFqMoQwfYjM88yR8KO6ofqLra6ZvxU5AzZHpUELrAFQraIIFWPzxRoHroTeaUXxlidxgJX8eostGdmWDHFDMKaJeBp7lzmKKMGVc2iWlTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587821; c=relaxed/simple;
	bh=r5LPMsmcEvlqvyY+vGqNDYlcJLCBDylHbwDWsH3j+7E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G8zvbFMUdPPf5L3/dV1DLzVG9J5pNNRP4tS77c/t886nrXST7ULWqpeSb/+4/ntyCjWHB6RO7TeTr1dgKMqDtRAzkNggJqlaKFlZOZrq74Ldw3U3ajH1cpInAMBNCyyywIAt0Udm0R+sU77qIYr5yDR+WWcVtuxgHbaY2ihVuQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pu1yajgj; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pu1yajgj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sITjO41Ppgp4PAECyUxAZaqqS9VCPR4Y8YPg+QNu2b39GLRxP/qFab3RFOQ5evv07dTSqT6JHpS8F5a5sf6y/gJuOUNT7pWJRxME3/gwQSgEw7CgDcD8lFaLvJ7FovFRU1hThfU7okjmKgQutz7wHnkPzXWuX+SCVBDJyRuVwtNFnOb+BKEyVar42+Gsxx4c6a3gldn2UwSsL8saFp0paNaYdwnrsSBKTKEU9rXR98lTdqIyfiuJpnh0bcZwjtqb9rFVe2is67U+bT1xncDw+CZPQkQdbj56DCidNzKs9nqHNthvDcVYp8aY0v942hofD79MIrPWMU7/iXV/Vub7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crY0Y8A1tckyi5lSL3ElgJvmc/Zd4Fy8C3BbBMb9Puo=;
 b=qqs2vX7brXmlvNACIrCj6SF3sksNuoRkCwMzjDYbrM26G/E5iipNDMpCjXQNjTQ3UgIgIhMZNvIeh/uGYfNEieLxCh9anXHt/AHgWo3KstVAo0i42i5FocKxEJp0Vz1NsybtbXOtI6dfg5phAZ9ikKQSiK89Uanwe+EzHbCSMX+ZPMXGaN6EEndPxEkmGWaHxGgueasRK04G443sVPX6WJ7EoNM5+s1kh/DZ+HIi+blpggwf3ID9JO9/8BseC9UAhyLiPTgbPgSlt5mFPV7IEn6ZApd7dB4D+1IoVeTJu0dbmpJS8OuWn3sz6e60Bbv+Fyas/X/JC081bC84jKwhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crY0Y8A1tckyi5lSL3ElgJvmc/Zd4Fy8C3BbBMb9Puo=;
 b=pu1yajgj5Lw+wTZW3agWuCnJaF2R9di41MQKIYI+xMQts7mVRRh9A2BCcyyQoRBtdbEMty8besF+RD2Wdi4eNAGWVS23PiwWdlhB8MYHXZT3RXnLZWpLwasUZuPuOI46MUbbfaTRCv+Ot7YiOQopTRd8fEQeNduOGYNo/RPBlt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:58 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:52 +0100
Subject: [PATCH 7/8] rust: pin-init: internal: project slots instead of
 references
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-7-81963130dfbd@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=15980;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=r5LPMsmcEvlqvyY+vGqNDYlcJLCBDylHbwDWsH3j+7E=;
 b=iJpKdtJ2amh5XwiNbjzB1UhJQxyRZ1RFpdCpucpYny3qIble3unkcOch/O95d8jkPE6u51Cm+
 qZdEH7uqhHBAgJXq3qQDycqsr9Bi5xaFgErf0FSGv7REgH/DoegqQvT
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
X-MS-Office365-Filtering-Correlation-Id: 6bd9eeff-4804-48a1-89b6-08deb01f6226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UGewr6DLrfQmG3mOd+2Bx5o8a5P4PqQx2bVKtYtjRpQikZeN0ogL5LUC8Fz9B9cUH3bbs1QZPlGW/++aYtDp7KISdnP1Pg+ErPYMCYqRoeZIJErTF7VtgiBZdQIm8nsw2KvpmTGX1WkUdRJeFu6kkRkU2k5LGGajeq1dhfOT0cXKFNMyvhz9fDPKtiu2uoBchNYhlVPEbD92vbjrVzFzgM6TBZevVOi6At0zsQGGIdsYgUBkG33NDPNRpLZsUHRYf6b0JU9BjgorVHEbeNwMAAL8WVrbKB5VfpGLUIZ1cEmKUHrf+ZyBQbQmUSyV/LjAzlDiVYibp3G9dzsUn0tmnz7yqXbn6N9MgC982oKkzk8qhVykmqgpKP1l/9CZ28upNeySZy46sgM1IAsU5GglOL8Kd6ftTbSQf/sS5icEwKk+beyNyFD79EHEnCbLwlwefvsNQ9gt7DchkkusGU3qbRTMXEgfbrb8oqB4Tdu4sLa9qnxn4rM+lW5e8DjrW7vy8wFdfI1QGG1FGPE+fQgDdwxIkYmWmofO7F2XnC7xsaBoGnYjGHhK1xdoleHzkxgeuSrTJH44Ts1PbB8a+B3scM3GvLRXkUBzZt9FpRwk3TYDK2PNAUVmW9foRKOGeWWuNCxdX/IuxxB5JNMFnlBMJgLyXbmEzFiarXm8U4nr2HHeuIJpR65/X+7boYlR2LSN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1d2THZKazBOZUVJNHQycTJSVEZ5SnhxMlBJMkI4WTJiZ1VNeWZjM3pyaUlz?=
 =?utf-8?B?d1NiSHUvbExIeXM1eDdtNndMZUdycWxiTS9YN0llTTdRVHA2bXo2OGU3S2dR?=
 =?utf-8?B?Ky9YV2V1dlZoSWVuK29ZU0szNlhNM1lVcysvOUFqNHlKaW9OVXNqN3pzTEtF?=
 =?utf-8?B?dkEzdmRlUDgvVXhpbVRuWlhtSHdqWkR2T0F6MHI3WkY0djQ3Z1JrRUVyNm1q?=
 =?utf-8?B?U2xxakZ1WGhrcUw3Tk1RM3ZqVXUrdExqY2ROZUhRUUtCcG5QbnRUMjljWUFO?=
 =?utf-8?B?VHM3Y0xpTWpVUVlMQVNkQVJoYjlXS0xXK2hERTlvY1plWjhBR1hLb01CMmpP?=
 =?utf-8?B?eDBkUXRIWkxRM1NZV014bUxnWkM5L00rNkpJWjdBeXpxeHZJMG84UVczbXQ1?=
 =?utf-8?B?eU1BaTF5OG9zRUg3eERWU2ZSdzAzbEVRdDJxMjhjU2ZMR2tXU1k3a3ppLzQ0?=
 =?utf-8?B?VmJXZUY4WUJTN1dZSDlHOVBMamoyTlc5ZkVCSHpMS2ErWnpsWU5WdDZmaWJL?=
 =?utf-8?B?L3BnSnh1L2VsN0JpVDZsU0JEU3oxbmdZQ05vZy9DWDdWWE9jTTZGSGxaSXJ1?=
 =?utf-8?B?TnBpM2t6OWdnc0lqM08vYUtaSEJ5dUhHMFhuNFN4eHRYaWM0TWRTelVmSWZq?=
 =?utf-8?B?VVpRb3BpQWd2ZTZFUk9ZUFpyb2NwNXlHNWhSdzR5bXY5SUdkbFVuMHRNb2k4?=
 =?utf-8?B?NUszOS9SRGxOaEkzUm4wekFORGlyNnhVaTdicDNHQWNWQzRQRDcyeW5MdFhl?=
 =?utf-8?B?bGlWRElXQTRkMHpkeFk4MENZa2ovc0c1MTJ6RkkxaVlFaWlmb3hDdnVHVnpM?=
 =?utf-8?B?TWMvNi8xaHZhZ2dROGdDYVBxazhBTEtZSXJjMytLUVVuU0txMk1SMnVKWnFp?=
 =?utf-8?B?dTkvQmxiY1RZVWd2RVpGNmdQVGdPNU5IRm51WGN2N3Z6Mm9UU2R6WURmODAv?=
 =?utf-8?B?WTJQWmdmZnJjb0tTZjlGTFJTYmN6QXBnbXpqZC9YR0YrZjJiMGRiNkROT3ZV?=
 =?utf-8?B?d2ZsTEtGa1VPL1JEUlRZMzYrUXF6aGRid3JST0NDQk1pMnRDNDR4TEk5aEda?=
 =?utf-8?B?ZENJVEQreU4xU1NnS2pBKys3YVQwdGwxWjdYMVA1c1pCVVZsQmUvMGlaTFVu?=
 =?utf-8?B?UEQ5UVFjM0dWb2ZDT0EzQ2YrMS9aWWs1MjVxTHg2a24wZytINFIrTzBMamR3?=
 =?utf-8?B?ak8yNTdDcFpwalFhSW1LRmRCb0NLYlBobzZHZEFNRWp6MWd5NkhkUG5qRWZC?=
 =?utf-8?B?dU1SWHdEQjBXbURuNU9HMHpMWEVYbXVRZFV4K21YYmpVUmxFOEJBcExXVUYy?=
 =?utf-8?B?bXRVWWE2L3d3Qks3YlBaSWIyWDdkb3kwOWlTRjRYOXhDbjBDTXdqWHdNZG1w?=
 =?utf-8?B?emV3UkFRMERZaUNESllEbkxCMFhyOVVhNWUyR043MzhmSFdMdS9MNmNmeGVz?=
 =?utf-8?B?YVI1TmZsWjFzd01SVVg4cGZrV3BRbXpVL25BUTVSZTZ4by81VlBIRGNwOGNH?=
 =?utf-8?B?V0JSRTJuSk5LNGxxdlBId0phdkFmcTZ2dG9NSTJkQjM3RDk2MEJVbE5EcWpw?=
 =?utf-8?B?NHVWcXBuWjUxRER1dG4zejlySXBIZ0JJNHB1a0RydDZUN1JIUDlPNVMvb2dh?=
 =?utf-8?B?V3oyZ3VSUUFiUWNTVFczc25sR0pkN0pDMHFFZGJmc3VMVnhiKzF4WE1DSHdE?=
 =?utf-8?B?eWt3TmlsZTYwb2xWRTFrdUVBZmJyaHp1TWlwbS83alZSLyt6ZUJwNVlQeTVF?=
 =?utf-8?B?NjlmczZWV0VtRzFPTHYxOVdlRE12RnBLd0d1ZS9oWThiOTBLdjVCYzh3Wkw1?=
 =?utf-8?B?TUcra1Zia0RuT2xMamNjTDFqelNnQUkrNFRjUkI1M3NxZWVOQ1hZSHdMTm9F?=
 =?utf-8?B?bUNwWXBCbzRJTVMyRDR6MFQ5QmFZZXhYZHY3VTh6ZnVOSFV0alVraWtqWWdB?=
 =?utf-8?B?WGtQTUlDSXRSYk81TENQNUpwQ0J5UWZnYjlrZWEvS04wRGlEWG13WVo1SnFu?=
 =?utf-8?B?elpPN1lVK21DN2IvaE15U0RJdmIwOWpTTnRna1d3UjlSR0ZKVEM0MEFtQkdR?=
 =?utf-8?B?VmVtUHdNZW1yNkhrV2g3d3I1ZHYveVZ4eVM1elFwL0picWZ4c25oSWVGUDVu?=
 =?utf-8?B?SXdaRnVQSS9RbXdQd3ptaElTWVFZbmZNZzRXWnVhYjQ1cjlCajFLM1dZS0dV?=
 =?utf-8?B?Z0JkNHoxVHZyT3EwSFhUS2FOY0N6NWhTNTJ5enNHVzZiMzEzdk56VHpINVc4?=
 =?utf-8?B?UU1oSkFkbGZPdUFnSWw3Q1lFQ2pzbVJ2eC9YdHRPYnB1YmxDTDBGSDdZN3pJ?=
 =?utf-8?B?Zm1kWkFXYWtqTElkbE85SWVqdHEvZ3hJTnVRMEtmclBMUWwwU3doQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd9eeff-4804-48a1-89b6-08deb01f6226
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:57.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXfmh72f9DOSfhZ00asDIBCaClG2xlIYql3/hP1YSLxTo79wsF4RIps2lQALJCrmpwZ1vdPG5KcZAe5To76q7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

By projecting slots, the `pin_init!` and `init!` code path can be more
unified. This also reduces the amount of macro-generated code and shifts
them to the shared infrastructure.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     | 113 +++++++++++----------------------
 rust/pin-init/internal/src/pin_data.rs |  52 ++++-----------
 rust/pin-init/src/__internal.rs        |  77 ++++++++++++++++++++++
 rust/pin-init/src/lib.rs               |  12 ++--
 4 files changed, 132 insertions(+), 122 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 11affa76d1fc..e6f5ea06f91b 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
 use proc_macro2::{Span, TokenStream};
-use quote::{format_ident, quote, quote_spanned};
+use quote::{format_ident, quote};
 use syn::{
     braced,
     parse::{End, Parse},
@@ -242,102 +242,61 @@ fn init_fields(
             }
         };
 
-        let init = match kind {
-            InitializerKind::Value { ident, value } => {
-                let mut value_ident = ident.clone();
-                let value_prep = value.as_ref().map(|value| &value.1).map(|value| {
-                    // Setting the span of `value_ident` to `value`'s span improves error messages
-                    // when the type of `value` is wrong.
-                    value_ident.set_span(value.span());
-                    quote!(let #value_ident = #value;)
-                });
-                // Again span for better diagnostics
-                let write = quote_spanned!(ident.span()=> ::core::ptr::write);
-                quote! {
-                    #(#attrs)*
-                    {
-                        #value_prep
-                        // SAFETY: TODO
-                        unsafe { #write(&raw mut (*#slot).#ident, #value_ident) };
-                    }
-                }
-            }
-            InitializerKind::Init { ident, value, .. } => {
-                // Again span for better diagnostics
-                let init = format_ident!("init", span = value.span());
-                let value_init = if pinned {
-                    quote! {
-                        // SAFETY:
-                        // - `slot` is valid, because we are inside of an initializer closure, we
-                        //   return when an error/panic occurs.
-                        // - We also use `#data` to require the correct trait (`Init` or `PinInit`)
-                        //   for `#ident`.
-                        unsafe { #data.#ident(&raw mut (*#slot).#ident, #init)? };
-                    }
-                } else {
-                    quote! {
-                        // SAFETY: `slot` is valid, because we are inside of an initializer
-                        // closure, we return when an error/panic occurs.
-                        unsafe {
-                            ::pin_init::Init::__init(
-                                #init,
-                                &raw mut (*#slot).#ident,
-                            )?
-                        };
-                    }
-                };
-                quote! {
-                    #(#attrs)*
-                    {
-                        let #init = #value;
-                        #value_init
-                    }
-                }
-            }
-            InitializerKind::Code { .. } => unreachable!(),
-        };
-
-        // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
-        let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
-
-        let guard_creation = if pinned {
-            let project_ident = format_ident!("__project_{ident}");
+        let slot = if pinned {
             quote! {
                 // SAFETY:
                 // - `&raw mut (*slot).#ident` points to the `#ident` field of `slot`.
                 // - `&raw mut (*slot).#ident` is valid.
                 // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
-                // - `(*slot).#ident` has been initialized above.
-                // - We only need the ownership to the pointee back when initialization has
-                //   succeeded, where we `forget` the guard.
-                unsafe { #data.#project_ident(&raw mut (*slot).#ident) }
+                // - `make_field_check` prevents `#ident` from being used twice, therefore
+                //   `(*slot).#ident` is exclusively accessed and has not been initialized.
+                (unsafe { #data.#ident(&raw mut (*#slot).#ident) })
             }
         } else {
             quote! {
+                // For `init!()` macro, everything is unpinned.
                 // SAFETY:
                 // - `&raw mut (*slot).#ident` is valid.
                 // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
-                // - `(*slot).#ident` has been initialized above.
-                // - We only need the ownership to the pointee back when initialization has
-                //   succeeded, where we `forget` the guard.
-                unsafe {
-                    ::pin_init::__internal::DropGuard::<::pin_init::__internal::Unpinned, _>::new(
-                        &raw mut (*slot).#ident
+                // - `make_field_check` prevents `#ident` from being used twice, therefore
+                //   `(*slot).#ident` is exclusively accessed and has not been initialized.
+                (unsafe {
+                    ::pin_init::__internal::Slot::<::pin_init::__internal::Unpinned, _>::new(
+                        &raw mut (*#slot).#ident
                     )
+                })
+            }
+        };
+
+        // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
+        let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
+
+        let init = match kind {
+            InitializerKind::Value { ident, value } => {
+                let value = value
+                    .as_ref()
+                    .map(|(_, value)| quote!(#value))
+                    .unwrap_or_else(|| quote!(#ident));
+
+                quote! {
+                    #(#attrs)*
+                    let mut #guard = #slot.write(#value);
+
                 }
             }
+            InitializerKind::Init { value, .. } => {
+                quote! {
+                    #(#attrs)*
+                    let mut #guard = #slot.init(#value)?;
+                }
+            }
+            InitializerKind::Code { .. } => unreachable!(),
         };
 
         res.extend(quote! {
             #init
 
             #(#cfgs)*
-            let mut #guard = #guard_creation;
-
-            #(#cfgs)*
-            // NOTE: The reference is derived from the guard so that it only lives as long as the
-            // guard does and cannot escape the scope. If it's created via `&mut (*#slot).#ident`
-            // like the unaligned field guard, it will become effectively `'static`.
             #[allow(unused_variables)]
             let #ident = #guard.let_binding();
         });
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 713a43c27826..3278a54510e1 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -352,10 +352,9 @@ fn generate_the_pin_data(
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
 
     // For every field, we create an initializing projection function according to its projection
-    // type. If a field is structurally pinned, then it must be initialized via `PinInit`, if it is
-    // not structurally pinned, then it can be initialized via `Init`.
-    //
-    // The functions are `unsafe` to prevent accidentally calling them.
+    // type. If a field is structurally pinned, we create a `Slot` with `Pinned` which must be
+    // initialized via `PinInit`; if it is not structurally pinned, then we create a `Slot` with
+    // `Unpinned` which allows initialization via `Init`.
     let field_accessors = fields
         .iter()
         .map(|f| {
@@ -370,54 +369,29 @@ fn generate_the_pin_data(
             let field_name = ident
                 .as_ref()
                 .expect("only structs with named fields are supported");
-            let project_ident = format_ident!("__project_{field_name}");
-            let (init_ty, init_fn, pin_marker, pin_safety) = if f.pinned {
-                (
-                    quote!(PinInit),
-                    quote!(__pinned_init),
-                    quote!(Pinned),
-                    quote!(
-                        /// - `slot` will not move until it is dropped, i.e. it will be pinned.
-                    ),
-                )
+            let pin_marker = if f.pinned {
+                quote!(Pinned)
             } else {
-                (quote!(Init), quote!(__init), quote!(Unpinned), quote!())
+                quote!(Unpinned)
             };
             quote! {
-                /// # Safety
-                ///
-                /// - `slot` is a valid pointer to uninitialized memory.
-                /// - the caller does not touch `slot` when `Err` is returned, they are only
-                ///   permitted to deallocate.
-                #pin_safety
-                #(#attrs)*
-                #vis unsafe fn #field_name<E>(
-                    self,
-                    slot: *mut #ty,
-                    init: impl ::pin_init::#init_ty<#ty, E>,
-                ) -> ::core::result::Result<(), E> {
-                    // SAFETY: this function has the same safety requirements as the __init function
-                    // called below.
-                    unsafe { ::pin_init::#init_ty::#init_fn(init, slot) }
-                }
-
                 /// # Safety
                 ///
                 /// - `slot` points to a `#ident` field of a pinned struct that this `__ThePinData`
-                ///    describes.
-                /// - `slot` is valid and properly aligned.
-                /// - `*slot` is initialized, and the ownership is transferred to the returned
-                ///    guard.
+                ///   describes.
+                /// - `slot` is a valid, properly aligned and points to uninitialized and
+                ///   exclusively accessed memory.
                 #(#attrs)*
-                #vis unsafe fn #project_ident(
+                #[inline(always)]
+                #vis unsafe fn #field_name(
                     self,
                     slot: *mut #ty,
-                ) -> ::pin_init::__internal::DropGuard<::pin_init::__internal::#pin_marker, #ty> {
+                ) -> ::pin_init::__internal::Slot<::pin_init::__internal::#pin_marker, #ty> {
                     // SAFETY:
                     // - If `#pin_marker` is `Pinned`, the corresponding field is structurally
                     //   pinned.
                     // - Other safety requirements follows the safety requirement.
-                    unsafe { ::pin_init::__internal::DropGuard::new(slot) }
+                    unsafe { ::pin_init::__internal::Slot::new(slot) }
                 }
             }
         })
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index d7fdcfef41d2..854fbcaa93f3 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -251,6 +251,83 @@ struct Foo {
 pub struct Pinned;
 pub struct Unpinned;
 
+/// Represent an uninitialized field.
+///
+/// # Invariants
+///
+/// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed memory.
+/// - If `P` is `Pinned`, then `ptr` is structurally pinned.
+pub struct Slot<P, T: ?Sized> {
+    ptr: *mut T,
+    _phantom: PhantomData<P>,
+}
+
+impl<P, T: ?Sized> Slot<P, T> {
+    /// # Safety
+    ///
+    /// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed
+    ///    memory.
+    /// - If `P` is `Pinned`, then `ptr` is structurally pinned.
+    #[inline(always)]
+    pub unsafe fn new(ptr: *mut T) -> Self {
+        // INVARIANT: Per safety requirement.
+        Self {
+            ptr,
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Initialize the field by value.
+    #[inline(always)]
+    pub fn write(self, value: T) -> DropGuard<P, T>
+    where
+        T: Sized,
+    {
+        // SAFETY: `self.ptr` is a valid and aligned pointer for write.
+        unsafe { self.ptr.write(value) }
+        // SAFETY:
+        // - `self.ptr` is valid and properly aligned per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        // - If `P` is `Pinned`, `self.ptr` is pinned.
+        unsafe { DropGuard::new(self.ptr) }
+    }
+}
+
+impl<T: ?Sized> Slot<Unpinned, T> {
+    /// Initialize the field.
+    #[inline(always)]
+    pub fn init<E>(self, init: impl Init<T, E>) -> Result<DropGuard<Unpinned, T>, E> {
+        // SAFETY:
+        // - `self.ptr` is valid and properly aligned.
+        // - when `Err` is returned, we also propagate the error without touching `slot`;
+        //   also `self` is consumed so it cannot be touched further.
+        unsafe { init.__init(self.ptr)? };
+
+        // SAFETY:
+        // - `self.ptr` is valid and properly aligned per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        Ok(unsafe { DropGuard::new(self.ptr) })
+    }
+}
+
+impl<T: ?Sized> Slot<Pinned, T> {
+    /// Initialize the field.
+    #[inline(always)]
+    pub fn init<E>(self, init: impl PinInit<T, E>) -> Result<DropGuard<Pinned, T>, E> {
+        // SAFETY:
+        // - `self.ptr` is valid and properly aligned.
+        // - when `Err` is returned, we also propagate the error without touching `ptr`;
+        //   also `self` is consumed so it cannot be touched further.
+        // - the drop guard will not hand out `&mut` (only `Pin<&mut T>`).
+        unsafe { init.__pinned_init(self.ptr)? };
+
+        // SAFETY:
+        // - `self.ptr` is valid, properly aligned and pinned per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        Ok(unsafe { DropGuard::new(self.ptr) })
+    }
+}
+
 /// When a value of this type is dropped, it drops a `T`.
 ///
 /// Can be forgotten to prevent the drop.
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 4098c65d63c3..e891d65cc469 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -867,12 +867,12 @@ macro_rules! stack_try_pin_init {
 #[macro_export]
 macro_rules! assert_pinned {
     ($ty:ty, $field:ident, $field_ty:ty, inline) => {
-        let _ = move |ptr: *mut $field_ty| {
-            // SAFETY: This code is unreachable.
-            let data = unsafe { <$ty as $crate::__internal::HasPinData>::__pin_data() };
-            let init = $crate::__internal::AlwaysFail::<$field_ty>::new();
-            // SAFETY: This code is unreachable.
-            unsafe { data.$field(ptr, init) }.ok();
+        // SAFETY: This code is unreachable.
+        let _ = move |ptr: *mut $field_ty| unsafe {
+            let data = <$ty as $crate::__internal::HasPinData>::__pin_data();
+            _ = data
+                .$field(ptr)
+                .init($crate::__internal::AlwaysFail::<$field_ty>::new());
         };
     };
 

-- 
2.51.2

