Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021091.outbound.protection.outlook.com [52.101.95.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFAD49BD68;
	Thu,  8 Oct 2026 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462305; cv=fail; b=Wloj3Ec8wzdo9pZytEyEaoYTgD5mIJX/q2vK/ioAdqRYi5IVrJBeS5TAOngdnEEoB39o8yHpLNJaa6FGoMYPWOK4SsZDksadMQcDHm6XOG62c1b2KIZXhAvaBEuE/peOOi51aZXyMGDflvl2zYfC1/61EAm4lROBRPurRxcPH5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462305; c=relaxed/simple;
	bh=uTHCwi+L8zO3k3qY933mrxLfpJzGteG6gj6Ocpe0ZqE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PAo/dzCpHmMxjkrfNjZiiZAk6iuur11SYgts+MPwhvMdpS9z2dg2NgrUvoCdIkKkcPoFQgGLe63N7QbAh31dSFKpvgQwR5a4tYt8LKdq4dtnnIqMY/pZ6r30cxKSOo0Vs3JwTYkMjpYQt1fzGAWyJgBbHGWdDoMmlbsp9W43o+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BkimzqRO; arc=fail smtp.client-ip=52.101.95.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BkimzqRO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enYs4THCSgCtkVTDIJ2uGERPWm8kF1O8dtW2Ws9GCWnBIIpE3LkUeCbrkQ9WNKss8dA4cCPrenHb0hwZthv4fvFVX3Llr+QqFIMLjFwfurLNKAYkJx94jWsYQ6oLxthm+dNeosUv2wVdH095kevw52TZxbt+r8KIT8XvT1qZDt6ZpG3Tm7Fmc7qdFyJdoEJ92QjVj4Bli3ts2Qsr0YqR/s48Hok1avNoU7gl41jfHmjObr7q9EC/2Wo8ZsjlWBZTLCdnSVx6LScz59u9PerhndpYFvxy0bmXM+Xwpk/qcOzFANnlAaCdp2DSCXnPODjaN9BhyuxDjib2Bot0QuhmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCI2qGMLblAfPoKVbzo4VpawIkUqkbmcgDJwcEPlh0U=;
 b=K7/zcv3+ZIedC+hvzv67kcOECXGeifoAshtJWFHpPdlAbiOlfkowTcMEurxHIjvop1LFUn+awokpp2ZMyDOG4y6H1oZkmxgN9/uypXATG56vqtG8J7t4pq+Y75sIHVAe6GvKSnMt/P4SZ/i726q5NhpoTKQtF3sNygX24iOa30bLUq5LVLLStu4FstVzjx56IYkmI8A1lvA5ZmMffY3yG6C8pSYrG5I38n3LfyDgpLMksMTDJ/Hi7gHET6X4Ycjp3U/LI2947oO5HYHdrU5AjOnnAtrEkRsxhmgFXsMiIYxS3uDf1VhYKK3TXVlvByfzLQpBfkgj6a4DGto3Gc7rMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCI2qGMLblAfPoKVbzo4VpawIkUqkbmcgDJwcEPlh0U=;
 b=BkimzqROBJq5ltjvugd0AgFOz7jnCsJIobi5lIpUCfjwZjfoqlAb2S5tatAIMWJ6QboKzlr+3//jkdIbqywY+NYj5EoI4jKGgP9gMlDXWIzshokmEgkDD8ZexxOLtXL0ERveMxlqmPUxJ7HZy5dNOBO+loZIYlo2lR4EZD7sJMc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:55 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:55 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:02 +0200
Subject: [PATCH 15/20] rust: pin-init: internal: pin_data: parse explicit
 `#[uses]` annotation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-15-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5340; i=gary@garyguo.net;
 h=from:subject:message-id; bh=uTHCwi+L8zO3k3qY933mrxLfpJzGteG6gj6Ocpe0ZqE=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7M/T+nHk67UT0lgu9XpenvWeILv928KVK4EIXU
 ZUV+x3epcZ2lLIwiHExyIopsnh0M6ZtYpwte1mr/CXMHFYmkCEMXJwCMJGfHYwMr5iPev6pXfSu
 5vK59X8Wz3D6tm+NhqPimeWy4oE/YoMusTIyrLNrb+C9d0BAS+Xv3p9199/tnrM6OJ8t5YNv0//
 oy8tMeQHFxEyZ
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c563186-37f6-4eb0-a509-08df25372932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	k1d39DrF83Y9ejRGuSi6XQQVTwEMqVibAYC5OCVg51FfIOESsfEUgFtEHzA6PuLxe8mqMgQ3xrDX3mY3Z5r36na5mRdV7zeNSAczMqmZ5FCuLRheeC0GC6KC1l/MjieB96kEBp+0KzoNKHZtwE6DrdTt0i5ehJds/AT0e2AwKSjE7SEbPNt+xcTxKViw7gQY9fVE6lO7qQaeU6MYrwKH7a6aaXvmO/o/b1GqijiG7gpmhYlpIC5o6QHsDNDffEG+HkaMZS9kHfqwaI0w880hvajA25SHEUTrAOM0RkbzE5wJKIbzClQX6DGtCnhCPkhucJAl38NLUW5fHNVPezmbD9UcDL20QUH8p+uuFVXIrXrNG8cw6dZB17m16pitJ9JtcCgzM0zj+wyLWMYb00eLTAQl95yq3dhESHnbXTBusNnbx9iIraVJJ6ERl31kTN41lIvHXbLQzqcEkb1D7E7/nspCywLPkp48eTAkyWwt9A7z5x7LtVqg/r+VIvRMjnC7za3V+oTP95hcMqmHzq+fIpmxVKCJAEAQdkLngQnXzz9wTFgYRgYwuP/M3g2zr2lZngXcgy5Pf0C64NU0aLxmYXgvUItenGaSoYkzuP6NvXvVdH5iKd0qlX4JSiPTVBNLLza4o2u9DB4RKWFxJ5GN76qqNLWYJn0ST7k/MkwZMoXe4cTk3LKA41KkZtbiJjX6WaS/rGkEHk0XBep5F2SgYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmJhTi9OSFRTTnJsQkpIZ05YcTNWNWh6RkpwL1UveDV2b1ZzanhhS2NDMnZD?=
 =?utf-8?B?T2oyRncxa3gxLzhKa1pNYTZsb3lkNVYrK1JLZ0w5NlVwZzVmZ29odFNZNXBT?=
 =?utf-8?B?WjNEODhSRU03QnNDWWllOHZRYXdwanREY28vOGpVaFh0dEV3czFxbCt1Y1Rw?=
 =?utf-8?B?MlVZUzQ2aTNCZFVQL3M2YmE2aFkzeDA1YUgrd1k3b0pQK0VVNkNzN0s1Nk13?=
 =?utf-8?B?WFlPTGRETGh3U3NMTFoxS3Q0SDFDeGdYTHdweUYwTFAydlpkaXcvdzBhT2F1?=
 =?utf-8?B?aHZjSnQ5TEE4TlRYZHJreEVHUlhuU1lvWkJ1Q2I0bTVJM1R3Nnh1NllWSTZw?=
 =?utf-8?B?NE5uMUNmQWhpb2dBVkIwYjBPdXg3WHFncG1JYW9aWnpNQlJ2MTdlRXlKTDhG?=
 =?utf-8?B?cDJoL3p2VWx0Rk5YSm95cFluY1VoeEY2WENwRlRKbTZ1bTVHSlZpQ1NrSWNE?=
 =?utf-8?B?dVdIdTFFcVQvdDI4Y3NQRDFEczlVNWRCVVRiVVNHMllvUFcrOTJ2YlpxRUpO?=
 =?utf-8?B?KzZRaVNXMlJ4K3ZudjA4VlloT1A5TVRLMmdWejJuTUpwL0VxcGhtWVF0TURZ?=
 =?utf-8?B?NnYvWG9zaGRSQmFpSmNLMmF5cFlxbk9qczI3NXZZYnpXaUhHWHFxaHZ1TXpv?=
 =?utf-8?B?UkxFcVBZNy9GOVBiTUt0cENjVGo0YkN4aFlIdTZzci9xRmxLK0pmK3AzQlNN?=
 =?utf-8?B?N2o2UmVZbGhHK3ZhWkVDWjIwY3pOdmpZa0FWSUlGbUdGN3BkU0ZmWDVIb0dT?=
 =?utf-8?B?dUJCbTB2eFZta25CbExBblZRNXQzcUdQdklFRTlFYWVBR0FiTm5TUzRSSmVn?=
 =?utf-8?B?SytBdzRDRDRYenorYzh3STlENldodU1JS0tCbnJ6bW0zNUk4cm04S1RVbkFF?=
 =?utf-8?B?S0lNMlB2QW9XVnFvdUtSbTJadDVWNDRvL3hUREcrSDBlaEJpMFduV0hCaWFm?=
 =?utf-8?B?WHJLUDNoWVYrdy84ekNGVUk3ZUw1OVFVeUN6dHQyUXl3UXNTSjBMVElxZXZX?=
 =?utf-8?B?VHBLMlgwTXZnVHJWRVVqcmxYNVcrQ1VJdzBKOWh3bjJDUXNSVC9ZTnpXeVVl?=
 =?utf-8?B?QzNkRllDL0pmSGtoWEw2eFUvVTBQLzBsT1BBK09sajU5S1VCdndFY3FWaXlW?=
 =?utf-8?B?UTlQRzhiTGhHSDVVTnVmQ0xib3lQQ1BkRGZXdjlxUVREWWRVQklhZkI4b09X?=
 =?utf-8?B?RVlyc1FRZFloN3Y5S0NEbmhpNTlDNUh6a0NHQmI1Y3VsVVNQekVzTXo2cWdT?=
 =?utf-8?B?NzdoMStGMjR1NEpHNkdtSS90d0tIUG5MU3M5ekdEa3J4Zk1nUndtamdzbnZS?=
 =?utf-8?B?ZFd4TWFONytoWm5uQlhWNGszY0FKVy85azhZRUJDUDhXZHNhZFRNNzBHMklP?=
 =?utf-8?B?RjgybE9QUkcrRHowbEsvcmpBaUFXMFErNWczbjRMV1gvWXhXT2pKRUZrZk5M?=
 =?utf-8?B?eEpzL0s1U2lxWHJ3b2J1UlVGUGRidVFGSVBadFM0dm1xMmRLc1EzamkvZ0ZK?=
 =?utf-8?B?ZDkyRE4wZFdEbXBqMExOd3FaWUN0elBaT1BTamhBQ1RwZWlnUWNnV1ZzLzlC?=
 =?utf-8?B?U2RScG9VblpYdVZia1EvWVZsbzY4QjVCdHpFcVQxMzl1cDNNaW1Ra2RuTmlU?=
 =?utf-8?B?MXFxTTdKNVRlNjRBOVNmZzFFeUVCemM4SFdBUXA3MHJHV01pb091ei9JTWpH?=
 =?utf-8?B?WjNEUXgyMnU5NDA1ckoxOURsMmxjU01GVVUzOFlnM2lCRFppVXZ3ODhwMGxT?=
 =?utf-8?B?Umx2VEJVMU1UR2tiTGFGZGhSTXEyaDdyUlRPenRUU0FUYVMvRExSTTc3c2FN?=
 =?utf-8?B?bFdOOElHNi95bVUzZjA0S2RUVllQL0hpWkZiZ3ZPRjNCa3RKSkc5YUp0blVE?=
 =?utf-8?B?VUk4RGQ5a3hucjd3NGNaUmpsVy9YL2hhaWdmOCtQUUVOUkJXaDdrWjJuNTMy?=
 =?utf-8?B?SHljWnZ5R09HVVgxSS8wMXUyNmFuL25WUWkzOHlHdUlXTStHdVRIYTAwWnNk?=
 =?utf-8?B?eU5lR2R0OUZkVGtDYzlXa2ZDODhldnMrdzVoeVZyR09KNHFUMThyekxqd1BK?=
 =?utf-8?B?R3V2djJZMXlPZ2tVOUQra2psSmltUXNBdGhVSjIrd0pNVmw3T3dmOUhkS01w?=
 =?utf-8?B?WG0rWGhRNnBYRWhtaG9zdDZQYmJTbnZNNWNrNTE4VTQwaXVKclUzOURMa0tz?=
 =?utf-8?B?NzFkcUp6ZGU1b0xRU01RTDNZQ0hDUlRMS21SWjJWbENJOWg5bzhsTmZ3RXpt?=
 =?utf-8?B?bThJbktTYUpURGlSVTZlN0dvRHJqaUNqbGVDMGNYZVkyVzFwVjlMdUQwUGl4?=
 =?utf-8?B?d2k0TnlxTmpaak5IbXNzdjhFM2p3azIrV2pVWTFUeHpRTTB5Z3RxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c563186-37f6-4eb0-a509-08df25372932
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:55.5422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxB42x0lqSIvCXQ7R0YLh5iTaln99hkaCxVhipgkGV0v3cu5MM7CBVuuaOIrpEQLWiXTZ7t0kUaghbYBnQUACg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

Add support for explicit self-referential annotations.

`#[uses]` attribute is used to mark what other field lifetimes are
captured by this field, and also the variance of the type in respect to the
field lifetimes. For example,

    #[uses('a: covariant, 'b: invariant)]

indicates that the field captures the field lifetime `'a` covariantly, and
field lifetime `'b` invariantly. Many types are covariant, so this is the
default variance if the variance is omitted (e.g. `#[uses('a)]`),
consistent with the automatically inferred borrow.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 99 ++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 4 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 54f0efef3226..d42d86ffd853 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -21,6 +21,9 @@
 };
 
 pub(crate) mod kw {
+    syn::custom_keyword!(covariant);
+    syn::custom_keyword!(invariant);
+    syn::custom_keyword!(contravariant);
     syn::custom_keyword!(PinnedDrop);
 }
 
@@ -93,9 +96,37 @@ struct BorrowedInfo {
 
 #[derive(Clone, Copy, Default, PartialEq, Eq)]
 enum Variance {
-    /// Implicitly inferred variance.
+    /// `covariant` annotation, or implicitly inferred.
     #[default]
     Covariant,
+    // `invariant` annotation.
+    Invariant,
+}
+
+impl Parse for Variance {
+    fn parse(input: ParseStream<'_>) -> syn::Result<Self> {
+        let lh = input.lookahead1();
+        Ok(if lh.peek(kw::covariant) {
+            let _: kw::covariant = input.parse()?;
+            Variance::Covariant
+        } else if lh.peek(kw::invariant) {
+            let _: kw::invariant = input.parse()?;
+            Variance::Invariant
+        } else if lh.peek(kw::contravariant) {
+            // Field lifetimes are inherently covariant, so combining with contravariance,
+            // we would constrain it to be invariant.
+            let token: kw::contravariant = input.parse()?;
+            DiagCtxt::current(|dcx| {
+                dcx.error(
+                    token,
+                    "field lifetimes cannot be `contravariant`; use `invariant` instead",
+                )
+            });
+            Variance::Invariant
+        } else {
+            Err(lh.error())?
+        })
+    }
 }
 
 /// Information about field lifetimes captured in a type.
@@ -131,7 +162,65 @@ fn cmp(&self, other: &Self) -> std::cmp::Ordering {
     }
 }
 
-#[expect(unused)]
+impl Parse for Capture {
+    fn parse(input: ParseStream<'_>) -> syn::Result<Self> {
+        let lifetime = input.parse()?;
+        let variance = if input.peek(Token![:]) {
+            let _: Token![:] = input.parse()?;
+            input.parse()?
+        } else {
+            // If variance is not explicitly specified, infer covariance by default.
+            Variance::Covariant
+        };
+        Ok(Capture { variance, lifetime })
+    }
+}
+
+impl Capture {
+    fn parse_list(
+        dcx: &mut DiagCtxt,
+        attrs: &mut Vec<Attribute>,
+        bound_lifetimes: &BTreeSet<&Lifetime>,
+        field_idx_map: &BTreeMap<Ident, usize>,
+    ) -> Option<(BTreeSet<Capture>, Variance)> {
+        let attr = attrs.extract_single_attr(dcx, "uses")?;
+        let punctuated: Punctuated<Capture, Token![,]> = attr
+            .parse_args_with(Punctuated::parse_terminated)
+            .map_err(ErrorGuaranteed::from)
+            .ok()?;
+
+        // Check for misuses inside attribute.
+        let mut set = BTreeSet::new();
+        for borrow in punctuated {
+            let lt = &borrow.lifetime;
+            if set.contains(&borrow) {
+                dcx.error(lt, format!("lifetime `{lt}` is mentioned more than once"));
+                continue;
+            }
+
+            if bound_lifetimes.contains(lt) {
+                dcx.error(
+                    lt,
+                    format!("`{lt}` is a struct generics and cannot be used in `#[uses]`"),
+                );
+                continue;
+            }
+
+            if lt.ident != "_" && !field_idx_map.contains_key(&lt.ident) {
+                dcx.error(lt, format!("`{lt}` is not a field name"));
+                continue;
+            }
+
+            set.insert(borrow);
+        }
+
+        let wildcard = Lifetime::new("'_", Span::mixed_site());
+        let wildcard_variance = set.take(&wildcard).map(|b| b.variance).unwrap_or_default();
+        Some((set, wildcard_variance))
+    }
+}
+
+#[allow(unused)]
 struct FieldInfo {
     field: Field,
     member: Member,
@@ -275,8 +364,10 @@ fn expand(
                 }),
             };
 
-            let mut captures = BTreeSet::new();
-            let wildcard_variance = Variance::default();
+            // Parse `#[uses]` attribute.
+            let (mut captures, wildcard_variance) =
+                Capture::parse_list(dcx, &mut field.attrs, &bound_lifetimes, &field_idx_map)
+                    .unwrap_or_default();
 
             let mut generic_lt_captures = BTreeSet::new();
             let mut generic_ty_captures = BTreeSet::new();

-- 
2.54.0

