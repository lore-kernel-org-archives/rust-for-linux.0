Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE749C4CE;
	Thu,  8 Oct 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462316; cv=fail; b=mgNYa9gq83EAoiQXOi4RpHF0W+KDrcMs9vQOB/UySKHLsnNTe0JV56mJckU01lJw0fkA6SL48Q/KcXJ0OBIaA+t1u/rT61pe/UDjibLzQ3aPgD48pe1DNf9xQSan7tf88F5Ynjx+1O4lTC6ERd4aC0GtAa01az+HkajPQHm5qog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462316; c=relaxed/simple;
	bh=zD+8JZfGooPOOsiUE2u3wLGK2JvmxmkLrUb5rGxjFCI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SxGFwW7SRNz3CS9vOM+IngDp3fbVasDem7kmfxm4ihYo95gzhXHUmDF5NWc0JOTBmGJB6FhZOidIEzd4AzbSc6UtGdXdYDHuwj4gesSvDgFqmhqMphTVnmFLiLqgFCzbDa02Pu2qmii2Lr2FidyhM6HOIE07ceMuwqHT55+G6aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=PVFZwKf/; arc=fail smtp.client-ip=52.101.195.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="PVFZwKf/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFlIsiGmSLUIiPnZriqO7dM04nzkG0ZE/RZ8FJSDX26wX0wWolmWTZN3ahWhDzH3Pd602O13NIGL9I8roG4mqZ1Qcz3XMPPT/s5NmW7W5kVvj1acCC4WnqFxVGRzWDUWhQ6peZLpUe5GA18FsnLcxw5pvW4XHIG73090roLcwnjl9/phPwkFSoPaG0XYdLrC23s8TM3xsN4nfqeiH9AUmfQMZhHZun7Pupax7Y9gA/a5Z7Ygfb/CHSJ5uKuumQXVzSUOgaqJeZxbmrgRuLDlr2Frv4fUs62y/EZFxenAkmhUcVvWQ5qyODadkA588nVcXGKc+scdK4y4JG67FVEXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9K6AGDNUJ5C7dpW0S2f/vM/2EQ+KIJNtd8JI0rLbcs=;
 b=X72yqp7rFmUjYwMXcYiyG6TYaFSm4b6EXMQ617OhEbKIixQK/jT9OIC+wfecbyusxyn79Y8X/CsR3hEiniSFtvzbqsOWHNHjwZwO+/uXAt1RCGFatd7f8YWi65/A2Dqd3S5aULOdilQSKLsvDZZJufMQGg8zl0250ZgHybuqZnoNoV2/s1l+JhwvSuawPzCnTrsvDPkyCRywsvr3sVvGrvZkoQ65eEAZbPu6GxOeGdLZpIQR6QZjw2mrJmSYMfW6/6nMagrSff8/IseVvssrbI1Rb/nnZzlKXc05cXQNjLjoPP1z5xuTHgRfO0/DIbQMUwwd/YfcJVyOCfrODgFJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9K6AGDNUJ5C7dpW0S2f/vM/2EQ+KIJNtd8JI0rLbcs=;
 b=PVFZwKf/WjxvaV1HMg4IELLlckdVR9ZquVtVog+WalfjOk3EowdvG97UtCK+lyInIU+I/Mh/yDDj6jQUp35rE32PbeL5cHKBOrb7woW8VtMHS3RzPjphjil64+UpgnwuDbNHC5un0C0zpg/6A06VNCDnc7/7ghV/uNCMGeqSlpk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB7245.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:343::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:25:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:25:01 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:04 +0200
Subject: [PATCH 17/20] rust: pin-init: internal: pin_data: complete
 invariant borrow support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-17-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2780; i=gary@garyguo.net;
 h=from:subject:message-id; bh=zD+8JZfGooPOOsiUE2u3wLGK2JvmxmkLrUb5rGxjFCI=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7M8ykZLeGV81wLfS9uj7p4DTReX6WCaLqh659N
 ZZd4CtgmdBRysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARPoWMjI8Xv9s9q+f5uzT
 hdqetHzTaVzAqfk+w1p+6fWGL1E+Fma8DP/0YxR4Nr2wuuKspGdxUKeJeX+tkGbAJJuc/FvTbi7
 YGc8PALRWQz4=
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4aa1eb-887f-4658-bb8f-08df25372c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|56012099006|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	6+PgEQlCrszIn3WsUBUL/BVJls6lh2auKvBdYn4pEAr8hPXSQ/7VlvmcrLMVqLbDif08Yj66797GI51L2MG2cu8Y5T9M+T4fXl81JTuBZBMZDyvXRmYmjHTgLQUyhqRrOB9PxlMUklIpLGJk6h8u9vwTO7iIloHT14ppW/MPTmBCTEDebIBbKRmuNoISgN0h9Qas6kvCoUelSk6mLDO3j/q8tyc6B55UjIhapps/7GEo1PZKq4SWMFNWVRgo8/raLVkMDh+KvzWTTTJIvbOMkRCQN7AHEWy1OY7r3sRpudz6wUL+S/gLAgtaa6JusfczIZZZCmE1FK4pTVl8IHyvl0tQD30YTTDPntGXboBUugOJiVEAKmgriofIoh0XVSAd/bZK9M8ZScvlf2z3o15ND+GEn13Q6NZxMxb0fqowDeKUykhvGEubc4O7tXaZGySxxqpDdSwleMjlk0D5NihZ0SGDVqaEKEzUuNXnyxuM1Ml9We88h9xgaWVCdnnRmsaqD7nuC8lxgOlJW/uPapYPe/kAUzBt9d5Yp5Z6d5nbd55EmdTAnzU99aKCbaZNrgFKblZreDJEXFGCkkJT6bQ/rb3NOnIc45MfCc9H3PBCVrsnTlnxStm/wcz0LO1z/h5Mzc2GpM2ZYWB4KReDr3lbH2sUjssbb4PQq7Dz+jVv5Z9iYoDwckwCPwipyhKvORMBsqlPBmqjdkWYuZtrmfaS6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(56012099006)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUw1UStRcWZNZ0JCZUJ2bytNbXdZNWVmUEN6L3V3VGtKTnNCSTlXb1BFeVJ3?=
 =?utf-8?B?cEdxbW5jVWVUekNzT3JoVThSRmYwdnRYQWFuS2liRUd4ZFdxdmdSc1cyVjJM?=
 =?utf-8?B?eVpXME5FdTZVTnJBYTNEZS83c3Btclp3aVAwalM5c2FhVTJQcTVQSG5wOWN0?=
 =?utf-8?B?YUFZRmx6bFNUcTBSUUZuSFNPam1DS2hVeGdlL21OaUdSWWJQVFFoV01TY1NT?=
 =?utf-8?B?SDlqanFnVktYa1B3QUI0M09VQU4zZmVPN2JkWE8ySGdEdTFmOWMycGtzQ0pz?=
 =?utf-8?B?TTBPclgrTUZ3N0xSUFNVakpnUFgzQjFnNmVIS0MyZ2Z2SkFjQ1dNdXl1UldK?=
 =?utf-8?B?cE9taG1vK2xubmtQRVJySHRVbzg5S0VHaDVvVjFWRWlkaUJCK2NkL0pReHhm?=
 =?utf-8?B?Y1lNcnczbk9XeDhTLy9sQitRNDFnTnhQWXdNTVdVMzRlbXlyUTFiZHJNL1RD?=
 =?utf-8?B?VmIzUDBVK0ZBZW1Da293MmRCV0xyMjU5eUxIMVMzcmNUYkhZSGozZStOTmE1?=
 =?utf-8?B?VDU4ckxMa3FOQzJuclZaaG9hTzBBUjZPaTJJZG9vT2NhZUhMUmg3Q3B1RlY3?=
 =?utf-8?B?UklVT2JhZXd5V05kQlBSS2d3UFBuQ2dDenVNRFQrazlMOFF3U0pHb0ZMcWV4?=
 =?utf-8?B?bE0ybUZTSEpLVHZpSk5ZM1lvd2FDVFRaVnF2K2ZzbXJUeFNDSW9yVkU1WUgz?=
 =?utf-8?B?NnFTYVBPTGtKcDJjdWRvblNPNytxWTFDNTVXWmxzczNyN29RakpQM3VYMjdT?=
 =?utf-8?B?YmJWYU1MOXd5dzZNaklaZ2x3SWpwR1gxUXpLeWNPQjlDWEtSMnhyOGFNcEpU?=
 =?utf-8?B?KzJmS0g1UGhiU2tmNzY0elVnSVFja0U4Q05qL0pmU2trZnc5T3Z0WEx4ay82?=
 =?utf-8?B?UjNEOUZpbG53VkgvRE5SUm53R3dGS0ZYNDU0YnFZTXgvTVFrcFNOajJ6eStC?=
 =?utf-8?B?Ky9VVjVsb3ltY1FkZStFNHFFODVTcHRBa1IzaGhXelFDR3V2UFkwN1Q0b2xZ?=
 =?utf-8?B?aHJ6eUNrZFN5V1FrY2xldlpic0d2MjdWMG5qREcyUmJiQTBHTWJzemtBL1Na?=
 =?utf-8?B?T1pNeStSMmo1dFZpcnRkL1EyV3dSVVBYQVJua0ZRZ1d2ZTAzVWcwNFNMQkd0?=
 =?utf-8?B?Skh6R0JWSGVFeGJNYnlqVGdObkNoWkFkeUo3bWdFUjhSRkRqcCtja3RtN2VW?=
 =?utf-8?B?RWZJU3RUQ3hGem53TXVzRmdGZ0RacU9ObHFMQ3BadEJCYit6ZTEreW80YzF1?=
 =?utf-8?B?dmNaTUlsR1Z0MjZaWFluZWVVbEVBTzlzUHNENVluUGxwTTRHNFA1QUlPQWxZ?=
 =?utf-8?B?SS84dTVsYlhNUnZsTDJ3VDJLUm94emh0Z2pCWDlOdmVCUnRTWGx0WTlBV0dU?=
 =?utf-8?B?Zm1PdUpzMVIvODhDeDB5S0JPeVZBTUs2TFVvWWFyRys2bFNTQkZJSXpBZHRL?=
 =?utf-8?B?Zy80T3AxNysvL1IyeUF5TXhUYWxQR3VHZmduSzF4S3hGN3RPT2VvaHNNMVJM?=
 =?utf-8?B?NW1mdEp0UUhQeklRdWY4cEVHL0g0bk9SUmdQZEtrWGdFN0VaL3dqT2JDRFMw?=
 =?utf-8?B?NnJtTi9lRTVBQXVHYWc2ODVlcncyV1FYazN2UVN5VzVPK2FrZVhmem01Mmxw?=
 =?utf-8?B?dEt2SDNkZXEzQlhrUGg1bm03YmcrL2pDcnVQTGZaMlVqZnhRaldJSzdLbEhl?=
 =?utf-8?B?NjJYVGlNYUVuTG5oSG5iNzBIWDRtWlhUQ2dLWE1oTVpib3IyOGROMEJlWDMz?=
 =?utf-8?B?bDZSc3VqdWRreUZEOVlDTU5saDhYU21VOUM3d1RTbDQzc1pjMEhRdnA4L0dF?=
 =?utf-8?B?M0VrQjY2U0hvMmhkckxBQUhpOXlOZ25EdU5YMzZXVUNjVzdGMXZ6c0xBMVZN?=
 =?utf-8?B?eWFPRjJ4d0tBczM1b3lIMExiS0t0WXNUa3Y2eURYbWYyVVlkN1hmaEEvSVpq?=
 =?utf-8?B?eU1KUmhsWnRGdE9nOFJLZkpFd3JZTlcyaUMwRThkbVZhVm5HZUpJbFVaUzYw?=
 =?utf-8?B?ZHBLa252KzRWRklUTWsvamgxTlVNRmEzKzN0SWJaRitVNlZRb2d6MTczbGZW?=
 =?utf-8?B?U0lmc1p0MVVmSy83NmQ0aVlENEdmQ0V3Vms1QmJmM28zWXNFWTYvZ29DRGsx?=
 =?utf-8?B?SHZQQkZiS1IzTFE3dng5cFM2M3puSHVrZWFOQWNmUDJDdnhRNDlZZUtXdmpU?=
 =?utf-8?B?WGlXclZrQkZKWHFrYXVNNUtRWE0wdytUV0k2bjduOFJTNXlSMktZWTRnKzFS?=
 =?utf-8?B?WUV6RHdHdUJyK25CUzJWRlAxekxNT0FJV1N0enN1Q0FIU3NIVHFleHI5K2VB?=
 =?utf-8?B?U2hydDF4NWJvclMvenFIWCtOZkMwbmNvekt4cHNlRU5WeEFEa0p6dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4aa1eb-887f-4658-bb8f-08df25372c92
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:25:01.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeXFHZd4coOrGmkltSUqJClMxI99L+9YzBtARgYbBwegBxfy6ulpA9rsztbOnYT+2HTt6JSSiKp8uxVRaBZpZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7245

Non-covariant types can already be accessed inside projections. As
projections are only generated for `Pin<&mut T>`, they're not accessible
otherwise. Add `with_{field_name}` methods so fields can be accessed using
closures with just `&T`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/selfref.rs      | 12 ++++++++++++
 rust/pin-init/internal/src/pin_data.rs | 19 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/examples/selfref.rs b/rust/pin-init/examples/selfref.rs
index 5e9494dcc17e..5212b9255b75 100644
--- a/rust/pin-init/examples/selfref.rs
+++ b/rust/pin-init/examples/selfref.rs
@@ -6,6 +6,9 @@
 
 #[pin_data]
 struct SelfRef {
+    #[uses('_: invariant)]
+    not_cov: Box<dyn Fn(&'str str) -> bool + 'str>,
+
     part: &'str str,
     str: String,
 
@@ -20,6 +23,7 @@ fn use_self_ref() {
         part: &str[..5],
         mut_str: "hello world".to_owned(),
         mut_part: &mut mut_str[..5],
+        not_cov: Box::new(move |s| s == str),
     }));
 
     // Access via projection.
@@ -41,6 +45,14 @@ fn use_self_ref() {
     foo.as_mut().with_project(|proj| {
         proj.mut_part.make_ascii_uppercase();
     });
+
+    // Access non-covariant type using `with_` accessor.
+    foo.with_not_cov(|not_cov| {
+        not_cov("");
+    });
+
+    // Access non-covariant type using `with_project`.
+    foo.as_mut().with_project(|proj| (proj.not_cov)(proj.str));
 }
 
 fn main() {
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index b35d32ff2bb2..b79710ba7059 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1445,7 +1445,24 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
                 }
             ))
         } else {
-            continue;
+            let f_doc = format!("Access the `{ident}` field on a shared reference of `Self`.");
+            let vis = &f.field.vis;
+            let with_ident = format_ident!("with_{ident}");
+
+            let all_lifetimes: Vec<_> = f.captures.iter().map(|b| &b.lifetime).collect();
+            let ty = &f.field.ty;
+
+            accessors.push(quote!(
+                #[doc = #f_doc]
+                #[inline]
+                #vis fn #with_ident<'__this, R>(
+                    &'__this self,
+                    f: impl for<#(#all_lifetimes,)*> ::core::ops::FnOnce(&'__this #ty) -> R,
+                ) -> R {
+                    // SAFETY: `SelfRef` is layout compatible with `#ty`.
+                    f(unsafe { ::core::mem::transmute(&self.#ident) })
+                }
+            ))
         }
     }
 

-- 
2.54.0

