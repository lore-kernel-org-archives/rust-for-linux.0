Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022104.outbound.protection.outlook.com [52.101.101.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78BF3DA7E3;
	Wed, 16 Sep 2026 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560733; cv=fail; b=suBhgKablIKITrtJ5VauqX0hmDJXQasrWu0pAcdBY1kporSi/oPV28nixnO1m3wGsL7TZYrOvvaFXRUwqGJQ+9a/q/l8ENq+4qH0q7ji6xHrcly8dGOLutGpwLVR7KOVLvUjohuxE4XDsE9NfrRlx9SSbdceQdx2Vp0f++cA3J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560733; c=relaxed/simple;
	bh=9bB06ZAf3CJCVNJxnQlyWVsS8kE19FggGf5XHI0ESIk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=H17QwMF8RVvM2tneTk7RCcgJyEEGGlZ/z2iiPKvAkMDm4okxvg9XIImOAC4rwmH+yXbNDzRmbjN6tQfrhVkYeFxGd+/VIf84h0yEUnD+V93hTrB/yA696O5z9XSifTPP8460q3rwUFRC9u3K8WnuX6DxaZh/82m238OT2ohi9xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pD9M8y1n; arc=fail smtp.client-ip=52.101.101.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pD9M8y1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vetPmoygiSQXYQFNdOLC8POlciW243K92fVjWsXpPMi2xBAYtoZqI3EPjH2254qH8da1UIujk4V2kwduJJYLDIQVmujlrQeNNWRi/n2Cdz+4tpj3bK3qcMhRqB7TepaMMcF/hJ2/pQ8baM09MVgK37iAbpXnDj++iSwhRuPQ9YtVQn+ho/8gzbxHDgomPW+ZeSKcmt5UhHK+74bRDu+nD/jUn7wOT3E4CbGYhKNXdOXWmpE3KWy/DyQwuV/Vw6lJKXD4UbF38w9b78zp6UEzCv6ONCaEniLM9c3v2qv6uiRpHwDmorSu/MK5gQCD7atKTqhwEuRz1fH/Li/9DW7V8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jojXNGWvqUC3Qvo06oNgndGrCNp7DLuC+dxc9j/PNu4=;
 b=MwEYpyPEBM+prHSrSAix5y8HxUnXdkr6zAZJpGV77L/p/nHv/ildJ23/8/xfxUa4LwtRpHy/AkhCGYOaJaAmxObjsrIzxM7Er/88lcKr931ted/z+7Dret9mPR0xhMOkLAHxO+TwIBBRSOKxBdt5ZGuNBhpPU77dNa9ylG62nHpMt8vl9+sreNGnBg5JE35gqTtOa7cEZQpIS4YT06yrHYw4Eg5BWabCj0KfOr3ocIBUFqS5E8gQ9Bf/0wRDjyp5YJeqcmywPtxr+sHWAmyKIX37nLhdm1bL6IC+8y6eYJkDcHYd/G56S5Gc9GBONJTO0EPRzuDf/Cqv1wPld1yYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jojXNGWvqUC3Qvo06oNgndGrCNp7DLuC+dxc9j/PNu4=;
 b=pD9M8y1nllViXlltrPV/Qd+j/umjxiZhcj0fLhFHmh5z2FerUa8HSCcz96ftven6ApTQfe08k9aDl6LwGYjOhbc3uqquvRdtgxhut0B+cbNeNuWAysFBsqmQXnDz+qOMdgccFMOCICqX9Sq6ZZjISf12czPI5NhB3h2AICCk7hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3421.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 12:12:02 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 12:12:02 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 16 Sep 2026 13:11:34 +0100
Subject: [PATCH 3/3] rust: pin-init: internal: pin_init: provide span for
 slot projection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-dev-hygiene-v1-3-dfb6ae2588ba@garyguo.net>
References: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
In-Reply-To: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4175; i=gary@garyguo.net;
 h=from:subject:message-id; bh=9bB06ZAf3CJCVNJxnQlyWVsS8kE19FggGf5XHI0ESIk=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWavae4wCC5Re7DM33aIz7QDH/KWuiYdqN8ms+yS1J
 t/IxaSXy6OjlIVBjItBVkyRxaObMW0T42zZy1rlL2HmsDKBDGHg4hSAicgtZmQ4cmj+wuVSTXvd
 7Q84uDAu3rTrhGzCrY9yZftcIj+zd/9gZfhf/fSv+swNL66tOvs1f/7r3383PT9T88VnxoLIaM6
 OhKZLzACF/Eqt
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1869ab13-8b19-4489-224b-08df13ebb739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|6133799003|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	HxOwBv/FLMh/THerbYqGO/KywWH1tFFVTY+fKCFJp24IczilAZqa78/Ld+WmHT2cPPha3eIvBiyPJbn9mNxTh3bquAiEJAmSgV1h5tewiaAXtV/jXqBU2vS9A22Db4TWwEM5dwW2T976y5Hzx+4q6ssqP95YshBmeAJM7bQfAYhpEzYIxLDqnrdmWPqVy6IluSHzduMF3ZqOgcySCIYzISmNhvSgsBooUln4WRqxEMakz4kHHB033OASHdYPzMC+deMfhzRTLXR6eGGsiEXVstH6QQoLVU/k3rDmcm//TwGdsvx/9c95Sry7RT3vh+BO6Qsva5/cC0dary/ecFkCVkpGRA6Tbmsr4XGRIrJnr3LGPcsfZXC08rFtkIk3twGU+R4bUS49Pen2lF+gx8FlH1Od1SNPlu3siw72da5Z/yWWJa+rqnNkhCJlT/pFK3RsRMRzD7/NUT/nga0yicEz5UmoCe4Bvi6NJV6+URDoyPBlfJsgnlpd8SJOq2uvz3c8LP/XNzaPuH3xdzEtNmocI/GtqOI/X/m730/yUpps7wobf323nRBMPgVnjXDBXOayq09Zk8cYiqt/hbXF2f4ihX4e62PH3LlCXAtfblNQx8p6lpwrOjzDMndJBTSIB5CaN67NKUd07lUfIiujBrSjDsbuvq7W6S9Sbethj7AI82yd73Uqme0KZNeZvauNl2EwOXrXxhdG1coQCJ6fZ8BCWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejl4cXJqRmtOblJoaTRQTGtBNUlRZHBnTmlSKzhNS0g1WC82M2cxbWdmZ2ZY?=
 =?utf-8?B?cERnc3Zoai9VRnlJYXVlSXBqeGVkOGNxbE1VUkk2dVF2Z1QzK251SjV6bzlQ?=
 =?utf-8?B?NUI0Wk5VWWUxd0Z0YjFMYnpHUlNqUVI2UFF0TWtML2k4ODJWbE9OMUwraWd3?=
 =?utf-8?B?R1V6NjFPOGorZk5hTEt6eERtN3U1ajR0ZDZLWkw1QmF6TTZxR1JvdUVLbStN?=
 =?utf-8?B?cndaaHFvT1ZQZ2JGUTJSWm8ydGNsS0NDZXdtTHdsUi9FckxuYnc0MStUdU56?=
 =?utf-8?B?dFFKekw5NEs5amFGWjROMWpNQ0dHU0JBUU8venFoTjZnVVp1SEFrN0tFQ0pJ?=
 =?utf-8?B?Qi9KTXc3T1lOWG1VMnphc2MrRDdDZHI4L1k2bjRQSUJrK3didlo0RlhtcXZI?=
 =?utf-8?B?c3I3Y09IMEUraFVkby8vUVhCcXBOZ045czNScnBYVDBLVjIzQXFPbHF2TU44?=
 =?utf-8?B?TXNVUUdCVGxEeDEzTk1BU1FGcElKOG9SVGhUcEo5TDkxMkZuSTVOeFkrZUt2?=
 =?utf-8?B?QThBVlVpR0xOOEFZbjFvbGF3NU1wbEh1L29WUVdIYTR5SWpEeXdlKy9lc0wv?=
 =?utf-8?B?SFhnZmtuSDdmZ05WMGZUa3lKLzdGRHdEdDFXUi9xNm96ZVFTQU94U04zSHpY?=
 =?utf-8?B?M05Id2RubHhYUGJZZ2ptV3Bmd3VsN2hQWXkweW9kWkFKbkZwVzlRU3ZnNXFy?=
 =?utf-8?B?TkxCZUhwTUJTVTlDZkpzUmpGSk5rRGFzUytpWHIrQURGL2M0aWVLWUJydDc2?=
 =?utf-8?B?cUZmMzN3ZVB2TkM3SUNoQllWbjRKVjZYa0E0dFFMZW9nTmNaVmh1dWVMV1M0?=
 =?utf-8?B?Znc4OXVFcEU0Y0lEL0ZUVnBzT09OL3paUm4xaFdERlNxN05RdkRJNC8rditq?=
 =?utf-8?B?RHErcXpuTklLbUdRYUNwWGhiSmFOenVycXRqclAxN2tqSEd1OStGWHkwN0dM?=
 =?utf-8?B?STBGZVJGQ2xPbXRwd050YkE2VVlWQ0hNS3VqUGJkU3lPTkdyL00xZjRiNjNU?=
 =?utf-8?B?YUdiN1YyOTB4NE1ZTlZ0YTZuNE9sa09xR0F4bWxwMElLYjFMV0ZzTlhmN2Fo?=
 =?utf-8?B?T1Qzb2liekZzTDF3Y2orTC81dWcrTWo4MG9YemN5cnozKzNTeHdrZVA4bzNC?=
 =?utf-8?B?ZUl6WWNEZGVTeHI1T2pRNXJ3eWtRUDhPYTF2UTl0M09BQnQwc2laRy9ZcDJZ?=
 =?utf-8?B?eDVjRHVhYklvaWJ3SEN2WFBPY2o5Si9uOEl5OWFlQm96bktCNC92dnhPY1g1?=
 =?utf-8?B?L0xsVW1LMm8ySEVEWjN3czVpb0dPV0dUSVF3R3hwNDhIYVFqc1BKQW1GUzZz?=
 =?utf-8?B?ZXJ0QzBwMmNRTHRHa3FhNi9MOC9GczR4cHdSM084TkJheUZqanlkdkJnV3hs?=
 =?utf-8?B?bWhlQTRQMDQ2OXE5M1dFTlI0eW9vT1pwNEVHRW9md0kxWndaNWJwM0x6aEFn?=
 =?utf-8?B?RDBmOWwwVVQrSkRhSWNDUkRvZmt5Sm9IRzNxNXJydzBLWUM1V0FxSWR3bFVN?=
 =?utf-8?B?UVA1T0k2YUxpSDZ2RzBYb0lvQkdpVFRpajk2bldMWmpiUTlhT240ekw5bW5r?=
 =?utf-8?B?RjhFRzA2V1hWRUJwdUc2UGN3WUJFQTNCSGpia09tYzg0R2dpd3hqV3cxZFR4?=
 =?utf-8?B?RzNnOHArcUxNcXdGNUphNFRaWUNseCtsTXc5ekwvaktlZmNzYW9IQ2pFdHRP?=
 =?utf-8?B?T2JPVFcvWGhzU0tuLzJSaFdoYjdYUzk4MUJKNUpyUmdTOEZydVdvaENoMkJu?=
 =?utf-8?B?SjNmY3U0dy9Ja1dlNFdSYjlXRmJPdnkya0tsU3pidzZnMUJUTmFvd2NFbTNl?=
 =?utf-8?B?bHl0OXorWVN0em9JRkF3QWYrUDZhcmtzTjhPMzI2SjhPeS9yQWFJV3RlTGFn?=
 =?utf-8?B?MGJHQXc0MHJYMjIvSUpTeXRtWXBaNkczWC9qS2xwV1BPS09NTlNJWXNyb0Uy?=
 =?utf-8?B?QXVkTjI3THVKVXNmcFFTa0pzb1k5dlUvc2ZTVjl5dUtZdGFjZFNNbFROdUtB?=
 =?utf-8?B?VkJ4d0JkQUNFSm4vRkkzenJYY09PakorMHFEM04yWVUwaVVyYkc0NnNpL3V1?=
 =?utf-8?B?eWF6ditENXM3Y0I2cTRGUDZIaUllUjVMU2dvZUVUc1FibHdwTDY3U0s2ZGpi?=
 =?utf-8?B?QlVXRDRib3BiNkQ0d3Q4Skc3dDJXdktuWVpLSHFvVXNHRUMzdjhKdytIWjdH?=
 =?utf-8?B?MFowaWRYZjJzaEVuN1pwY1FFZkFLSjVPN1MvSHZ4OVhhWWh6NTBqeGpMcmFE?=
 =?utf-8?B?cUJnN1dtV2p5T0p2OFlmaEJEWllnVGN5aXVMZm1WSzF3blNhKzBMcDZXcjlx?=
 =?utf-8?B?djdrNXRKdnBZM2xXOURxQkM5WS91UHlIYlNYckZMdGNCM2F6UFIyQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1869ab13-8b19-4489-224b-08df13ebb739
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:12:02.3477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DfdWT/93KCUftaQfC2k8aRnGWXnwSrRWgae51GmQfDW9JqAo51yiXW60LqIbBPcfUZJkPs+NIM2pdnh8MzASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3421

When initializing a field, pin-init first projects the full slot to a slot
of the field, then initialize it by invoking a method. Currently the span
location is not explicitly set, so the error message points to the full
macro invocation.

Improve it by provide a span, so Rust will point to the specific fields
causing the error when type check fails.

Old error message:

    error[E0308]: mismatched types
     --> tests/ui/compile-fail/init/field_value_wrong_type.rs:8:28
      |
    8 |     let _ = init!(Foo { a: () });
      |             ---------------^^---
      |             |              |
      |             |              expected `usize`, found `()`
      |             arguments to this method are incorrect

New error message:

    error[E0308]: mismatched types
     --> tests/ui/compile-fail/init/field_value_wrong_type.rs:8:28
      |
    8 |     let _ = init!(Foo { a: () });
      |                         ---^^
      |                         |  |
      |                         |  expected `usize`, found `()`
      |                         arguments to this method are incorrect

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index a77ffef9926b..1d2db93dd33d 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -404,9 +404,10 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
             }
         };
         let ident = member.as_ident();
+        let span = Span::mixed_site().located_at(ident.span());
 
         let slot = if pinned {
-            quote_spanned! { Span::mixed_site() =>
+            quote_spanned! { span =>
                 // SAFETY:
                 // - `slot` is valid and properly aligned.
                 // - `make_field_check` checks that `&raw mut (*slot).#member` is properly aligned.
@@ -415,7 +416,7 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
                 (unsafe { data.#ident(slot) })
             }
         } else {
-            quote_spanned! { Span::mixed_site() =>
+            quote_spanned! { span =>
                 // For `init!()` macro, everything is unpinned.
                 // SAFETY:
                 // - `&raw mut (*slot).#member` is valid.
@@ -432,6 +433,7 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
 
         // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
         let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
+        let full_span = kind.span();
 
         let init = match kind {
             InitializerKind::Value { value, .. } => {
@@ -440,14 +442,13 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
                     .map(|(_, value)| quote!(#value))
                     .unwrap_or_else(|| quote!(#member));
 
-                quote! {
+                quote_spanned! { full_span =>
                     #(#attrs)*
                     let mut #guard = #slot.write(#value);
-
                 }
             }
             InitializerKind::Init { value, .. } => {
-                quote! {
+                quote_spanned! { full_span =>
                     #(#attrs)*
                     let mut #guard = #slot.init(#value)?;
                 }
@@ -458,7 +459,7 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
         // A tuple field has no name that could be bound here (the `_0` identifiers are considered
         // implementation detail and not user-facing).
         let binding = match member {
-            Member::Named(ident) => quote! {
+            Member::Named(ident) => quote_spanned! { span =>
                 #(#cfgs)*
                 // Allow `non_snake_case` since the same warning is going to be reported for the
                 // struct field.

-- 
2.54.0

