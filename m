Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021119.outbound.protection.outlook.com [52.101.95.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDD3BC667;
	Fri,  1 May 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643121; cv=fail; b=ZwlNsCUyZLZXDkuVAIpvBQnSOvFjEoApBdx62cdtVtvPpprRYQUpPBIhzCMFvTfyXr2ZKjECaNHZK0g+tQ5ScvFgPaTq6hQRbGL1g18thuDaRkuLD0RT0eRZGgx3bTXQpFLEUDXKB6vlxNZQhWb24e6XR7polA5kpoGgfPDtLeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643121; c=relaxed/simple;
	bh=k+B89HJ0mXc7ic+ei+wfqaNSVXT8x9P3Yf+Mg90d2Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gMxhJbAn0vbqVH7ZuBO9ON5KfEDDGf3yWEm5vB+quFsoSGnfEg6B25gH+mNokbJmveGP2QIXp6TdJ9NMlN70x7P4ujXW32mjIaqIUAA20FJFky8SpbUj3mIzeeqgIckp4p9ah7h244mpPiLz2qBFnprkVvjycw+zhShZk+ussYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZPvTrlTk; arc=fail smtp.client-ip=52.101.95.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZPvTrlTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdJ6k3MwnhYyk7GWn+ncEdU4U9/OTFiG4BE6IiuSSjmPYsLgF/DLtdS9nr30lmDeTeCfVIeh07RatDCo5U05bf/Q8BtSSbdz2I5CJP0YniDQ6nG5hyDZELOU8Ufe7ObmcZhO9GPnQ+1D0j+dfj8llUjyTYBSoKoSYph8Aor9H7MRCtA0AAxuKZqwkqCnnZpcon9l1PG4lJGZYy4ZgZnLQMM3qqtgIYzm7rKI4Z37KhUuNRxxXS+MD3ZpjWPLCMNeTAeIukIBJoih2qF9kfEmzQ/TZt33e8kW6CY2JilKn74Amk+Mbgduto87bfh+MgQPdM1WsJEKCoARpgjXEgz3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYJeY2QI/WtTAotxQZKvhnZ1UbEAnU+HiN3OW5pKgp0=;
 b=DljfJd14wodHQwjRONzhiEl7CBwIuZldOJKihWTUoiJTqL/PGqzc23+XCGobthRaAN9pYZ31J7sF4J2YU+WXez6QMzUGqEx+I1oEQh/PPlvE2j36yWuDzyfCV1DwUSgjtQ4jmokxByTVwPd8Ptl4Lv+Gi1QAFcL2MMLtuwM+TETky6dG7IBSFnSupgTSTuxrY3eNGkG9iMYImshBUJ8qLGDGzGwXj+O0Wq8A1VMvIQuc9j8wgn5J2HeiTsIkDRj9GPtceJc5PLLWsAX9PmVDOf3dAk/GAd7oQ/MBczpX51TQmeXOgAfJCDXzzk1hkgphpUV/NMNpI7J/3hHvdXXC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYJeY2QI/WtTAotxQZKvhnZ1UbEAnU+HiN3OW5pKgp0=;
 b=ZPvTrlTkmRQAvSW/5q1+/JoIgaicls2aDJw56OocOWQeKWu84Mz7StNEFutMH4VQQBoPF+0VarQjlH8kY6P1nuXHQYef+r/dT4WALdT2ZmWS4TaP0R4zukiMsi6suXnKjG5yGMsGdo/Xw1S7Xtn8gc3Jymqaxh9jmvg9gUUWmUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB7218.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 13:45:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 13:45:15 +0000
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] rust: pin-init: internal: remove `collect_tuple` polyfill after MSRV bump
Date: Fri,  1 May 2026 14:44:45 +0100
Message-ID: <20260501134445.3809731-1-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: da4f5bbe-ded5-4b94-f5f5-08dea787dfe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sq2QOdWM9OWEoQjEcoWCOtwv9GHWQPFnqh69dKRrCPOlPiPGLcvIhoNLCJS9Hyw9rATklVXkeOSXTkzfMVPhoy8GL8Y8QKXGnk1TnMvVdanKImIn0f10IBU+t/58wNa16oe4r/oKtGSyntZtuov29ere17tQ9mZpLJTAm59buAPv5J7VU9pFv8VTsYus5cE5mOItWfykB9eRrLqwQZ5hXNOtmJ+wZOgyfGv87ZkFcBcQ1epUKEq9vWcOyvLArQTSVtNjuGAsAovxzarQsThhNqa3KyZd65Yu+sU10TlZV6VjLEAKkoDXPsDm3HIfMoiPPsGdhGgLU5D84fiAUPoYnB8rWE76NGo7fX8+ME6VJ22YeIauuStpM5KNpHeczeJtT806RFWw/aGIvUHwRskrOiGZ0XB2mkNOM7HNae86u1xGHrA1KsHfJIGLUMbDjD7FP5qtsINp5stTAIRMSiSK5zPufbSsTFPoiRptULkIgDYMVaOj/qsOAP/3tNA/gntc/hIQh12ZTZ4UHt/rgMFlpL7CF+D/YMugYnbndh2FlgfH/CaK9pO6115CQjvvD0shFucswbFCGB9/4BP2q9e04f/E3rt1EiCdhDSd5Cz8owYhfOZtS7tMhOW0WBm3MXzyvT1AtcLDh7qpYS/EKKgSpbmlehZx7EOr8scolpsGnXts0mFm76PAhog8VvOMqYU4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3dz0NkfVJtYqsMzuf1UjdqogyCMEpU2/MVgE3uk53jmVlz8ZBfRYAoUPFsLQ?=
 =?us-ascii?Q?M+XM5+N+kxgnEDSQ7itJ0z9NuzI/RDJzkt9qJpakZngkXgxmCJ2IwUAqHm0D?=
 =?us-ascii?Q?1OQnUx0w+tlQRo0mstbjUY/16zkbdXom9sqYzGg7/AXTUYKhICBzVmMSziEI?=
 =?us-ascii?Q?u4sB2R7aT/uZH3Q3atNZX/1PDDB5DiUxEpD8iuIWWgYpB2q5Anc8nk193Fha?=
 =?us-ascii?Q?b4Wc1Ab2K1vdyDhDyT/OBdkTckS2xNHb0IfE5GvUPor1KhfA5aN7BSQv4A7a?=
 =?us-ascii?Q?X2Auw99Ts2UPmubO0m7wptlTVDojirm7tlrCj+2hpAxFVA3HUOIygRapFI/6?=
 =?us-ascii?Q?+mfvfxHkWSC+tFz5F8Qbgfzk8jNkqnRKzzKHKb2DIo4IiPc8C/TyFiPfqtDu?=
 =?us-ascii?Q?n5WkAqNVdZD2PTj31lY3BC2wrwKjSkTshyVo9IrZx7BPCuSkr4mwuNakVFU0?=
 =?us-ascii?Q?4lXDJXPHYLHdNHuCpxabRLXvWA+gGs8Lob4uPjsgW35iMyWV0AE6P0xuqLJT?=
 =?us-ascii?Q?pf0PX4MIe2CWKWOyXgfbFPDMceSkaSl/xSwyTGAni/nOz10Ne0vq0FZLKx1P?=
 =?us-ascii?Q?fWzjfc9coXN43BnL7QjvZrkAt7Dm/ViOm1n7pFzrnRnKJnSs2977UI3DsIC0?=
 =?us-ascii?Q?lMQr5P5KQMmZeiNdzoxD/AFOwB0wc/WQNgTnrPT2wJK52WYP8Idg/c5wNBM3?=
 =?us-ascii?Q?mEPYGmHDLoSCHg3uucR4EmbtsNARRQJL40PoKRytQbTRxVhh4id56L4sPdug?=
 =?us-ascii?Q?DcJ2Oxd5WjCg6fRnNgHXyxMqc72GYSyfQrK6IwHIYPjWbPrQgfDFx1LwYRw3?=
 =?us-ascii?Q?/hMGDheCuxnA3UoFNhuQYnlxWime8nqjDgeQHXrj3YNBMDmD5LmBYlJEPz4H?=
 =?us-ascii?Q?VFZT8tQGOJSO1EpqcB9usWb2MvejUAzF8J1FYA42EvZ51lrSh/1h+EUS5Hrc?=
 =?us-ascii?Q?F1Qcr00cB0Dbi7z95BLwaEp1x/shcYvTNNto9cb9XPDd/0XsU/+aBlMhwaHj?=
 =?us-ascii?Q?R3A58R3JqBIv1ujJcFdqrbzJGpRW/oXtr/3+Fv/Ck4nj4kqfxZjtVE4B2GU4?=
 =?us-ascii?Q?zNgmb+1g24D+/YBOEXKjqLzgNaqIgm0jyS6hPaV8VcUW1e2OUSh/D66f8YlX?=
 =?us-ascii?Q?vDFKdGuNYmlVv0LonDgjfPMp3Du8XtouHZyO3fz+18E/etwUSDgEEmoCifxO?=
 =?us-ascii?Q?kisYtnbjJpG8R+r0HnRdEA46pLzvqAqEMltSET96eDYWlXpliT1IkWK+7ygq?=
 =?us-ascii?Q?NnNtxUJo+RBcwhFTxdQfL48DmVixrTPK0XDXnbcwtAYuBVdGqRbKIdYReLgR?=
 =?us-ascii?Q?pH7Rj8WwiVYNIWBOKR3/YslzC/G3mVLKYWXiKajtNSsNwdjmbTZPW32eWFaC?=
 =?us-ascii?Q?9QMsrOd1zQplKECymdz+HVrEeMbPA3zlqIEo4EwSeScOXixOHkWsofiYQbfh?=
 =?us-ascii?Q?XClUzvll8QlmUNKbnHPLd/l6Z/+i9teLUdAH+lI76wy2k0oZDyn/F1j9totw?=
 =?us-ascii?Q?yl4eG52gVc1WZYvkeh9wRLAumbQlwup+TCYa32N9fKdB4yJkA5QXQPjKd0iO?=
 =?us-ascii?Q?6de9j4me1zbOo5GIwjBFqa5LMMFPF9UwjjOeNcbtox4Dt/OPAqhuLDQE1jBS?=
 =?us-ascii?Q?GorikL6zGYQdTyeACp6x3ZpJnKrl5p4pzvJyYw3ta6V419q/KjNn2MAyzz+e?=
 =?us-ascii?Q?k1bC3nrAMCepDOPwaYk8k05v9VzoYjC37ptxgUe+Dt6Dgm9xDLhpKWDrGW4p?=
 =?us-ascii?Q?q26Hx+Vvvg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: da4f5bbe-ded5-4b94-f5f5-08dea787dfe9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 13:45:15.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIS0lcp1FmjRUlF5G6nhrXraHGP0vn9qAc3nNvKVkTQ+aPHaNl8SW6fU0d2Uwj01k3TacM/VAkta+Oz93cgC9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7218

Tuples implement `FromIterator` since Rust 1.79. Remove the `collect_tuple`
polyfill now the MSRV is above 1.79.

To avoid over-identing the closure, I move the `Field` destructure from the
closure parameter to a let binding. This keeps the diff small.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
I've missed out one remaining case where we kept a workaround for old MSRV.
Send as a follow up to the series as this'll be in the same upstream PR as patch 9 in this series.
---
 rust/pin-init/internal/src/pin_data.rs | 27 ++++++++------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 163a31ed1556..be3d97a38225 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -247,17 +247,17 @@ fn generate_projections(
     let projection = format_ident!("{ident}Projection");
     let this = format_ident!("this");
 
-    let (fields_decl, fields_proj) = collect_tuple(fields.iter().map(
-        |(
-            pinned,
-            Field {
+    let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = fields
+        .iter()
+        .map(|(pinned, field)| {
+            let Field {
                 vis,
                 ident,
                 ty,
                 attrs,
                 ..
-            },
-        )| {
+            } = field;
+
             let mut no_doc_attrs = attrs.clone();
             no_doc_attrs.retain(|a| !a.path().is_ident("doc"));
             let ident = ident
@@ -287,8 +287,8 @@ fn generate_projections(
                     ),
                 )
             }
-        },
-    ));
+        })
+        .collect();
     let structurally_pinned_fields_docs = fields
         .iter()
         .filter_map(|(pinned, field)| pinned.then_some(field))
@@ -498,14 +498,3 @@ fn visit_item_mut(&mut self, _: &mut Item) {
         // Do not descend into items, since items reset/change what `Self` refers to.
     }
 }
-
-// replace with `.collect()` once MSRV is above 1.79
-fn collect_tuple<A, B>(iter: impl Iterator<Item = (A, B)>) -> (Vec<A>, Vec<B>) {
-    let mut res_a = vec![];
-    let mut res_b = vec![];
-    for (a, b) in iter {
-        res_a.push(a);
-        res_b.push(b);
-    }
-    (res_a, res_b)
-}

base-commit: 320c27bef338777831ec8615a8ec7e08812d0374
-- 
2.51.2

