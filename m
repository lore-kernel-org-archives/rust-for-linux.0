Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021088.outbound.protection.outlook.com [52.101.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3269F4FDE74;
	Thu,  8 Oct 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487648; cv=fail; b=TyXfzinc8kzEvvmfq6N56g9+6PvLcZrsXeNaPkeTMzBP+kjVzKJTd7GpqBQMzI2DaKibRteei0qyGYuxGGpeHq+uKTdyvPdZTBf2dQ96z9fVGbxn+Ue9HZP6MLLJn42rfJrr4EanIlfEX0AmHcX83qB088I450yAR9qckrz6OP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487648; c=relaxed/simple;
	bh=NDUUKU1iZzo5wN/MD1oRXboDIbuElla9V4Mf5ntD5qY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dmndbLSOxoGcZwj74rFg2vW3x3MFjZAkyLWKEGWfduwSarCwK01SQppasAiAx/mhHEhKSpP2xbOBZ5e0FCcHLgiE2Ji+7xvjzyGvKT1i+ZeBg8PNjwtcbHYIathe//eF7Gm4uNa3UI+9vKMdNee6g+3MU+d/4NXVowWgegD0QWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dcTHJefy; arc=fail smtp.client-ip=52.101.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dcTHJefy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOzybTIEUdLXl5W8/J9AikTqeDoNEKqAN+CPT5k7XyIqGKBAPKnxCbc90zqW7/3WycglKG1uY3hY6r+TuehmENqntEpaSV5ZK2PyeKHNZf3TOfMC5+CXtuNrilutGGgHgX0fbXKeiO1LMzNom+KcnKv23gqLZCD1a5ErhwBw/kOB6K2pOLSo7kkFQy4lxoiIg5vHYx03ZZj9e6Et13FD4JqXVPw5ft0QDA/cIJAzsMuIy2EbwHw4+Plu3XkvoT0c+TJpamStey6DPcE1psTlA2HJZanEc0RuxwdK4BuCbFZlFilmtzk/TlEDSIdm1mNXcKYS6ChduuwKBrqLOWDlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvI5Rg8Bp0WjYhErvTFgpubsXlixWi/AVFjx+z1tmnA=;
 b=JV1W+o2yF5E1dEVcy+JxtU0M6POSrOiitM52J+YEb/Rs6SawbscyqCEsjeGW6vo7WPOhaWP/VsrY1ikEbUJkwUgK5vk7Sx4ORJXLpD/zn5hxV+jwmkl2zJ+RzSrkZY63/pH/b7liOrSOVS6EoCXl6WHil+OexOvE2+qdDDByWOCsPp+x1Au5al+KZ5J4eLv0pKqCrM6jJxowwuQ1Lecdksgpb6zAoVt4oyqGLVoxehFVvFsi4UhcuQdjvJfRT0O5UpLtx1W5JN7obXhRAHPXcSrYsgvOh4Wxtqi4JpcDwhYkdZwIZyFGH33KUIZlTnkr10Nd1rG87JbLTaaPf6hDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvI5Rg8Bp0WjYhErvTFgpubsXlixWi/AVFjx+z1tmnA=;
 b=dcTHJefyYJ2QUF70SZ8km1RU3fqklymETK9jNjcpofRX6NQWy/XnPJQUUGoWjXpIgk46x9nSGINnAQC/lCo+quUYBXY1kOEG+ZoQjuL3aPCYrGx48X13jhf6ieDiWzxm3VIL8bv3YJ4e2kvzO1fWUg4Nw/vjpQ3zWJLxUoctFcU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:48 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:47 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:39 +0100
Subject: [PATCH v2 15/20] rust: pin-init: internal: pin_data: parse
 explicit `#[uses]` annotation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-15-e280b3c8fba5@garyguo.net>
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5384; i=gary@garyguo.net;
 h=from:subject:message-id; bh=NDUUKU1iZzo5wN/MD1oRXboDIbuElla9V4Mf5ntD5qY=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFQjY1N5/ITPlC+N9O+n69AO6VzxWvDPQ/qGzP
 c14z3fZnuKOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJrL7PCPDB/HiLI/bdrfT
 FVaJLuTX3P55u6fgxTOL+vQXW+au3hOezfC/1KWgpiSyM6Sya0P2q38xpxrjz8mdKvny+vLjCtZ
 bFz/xAQCDnEto
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7852b7-a41c-4bed-c1de-08df25721890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|18002099003|10067099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	BkIwl0kWIRdC0k2/JPbPgUxiTrYlZpzeRxhPIpSvVMXHfpGmlvnQ+ct4RcMGiAy34IrN1Q7HaIRjMZzD4nhIS36NsZlbD9svUPUTFPzsmcw8zKHpOYPxiI9SmAQKTQDVALYEGVsS0p0bAhH1sTWP3e33JPs4DOtWdhpjfetFmjbY2j7F2Fs6m329C7oApVfTnNuQyYV5McR2NjiMgak2sq4CE1HS3uSqo3oQ7EtF9NvmHJ/kMZbxubNW1xGwUQwhRkExm7BM1ZPwuJskvpfZDfUe/81TUJB57Tma95PWo04NmhRn6w9tk7fEvD2MbGvx7rZsmC/lGvjWunsrakPQgrC2Snp2ntPQM4emlNpVnYs2B2fJwB9IBajxmABN0hwZ/EWM3DpBnIcWCmXl7k8zcW+/Lt4ZKNQ+5qOvx6nQTXjPUO8Ct3H8adxLXqXnhhRMdeQ+SDXUyRCU8BlHcfoDnOpw87udEt8mYjNhG81k5xFCCMSbHz5l7NvCneLewxZByHL3YX/yorECnyw/cNw+EXntslqLCrICLcdNUu0T/WHJoR3dG9pw4hRQXfrmAl3ciDfjBZndA3z4hrXIVmdL8ChUM6f1472lFc58ef35SKFvk2hzn055v7B3aijOvheUQ4/dIpxVr0KXOyJ3iQ9P44FVu04aJT+1xwYFEGpi584vY+vRN6UP0zA0y/mDvwwdHVCOcFC9eqLY3VBEJLAP6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(18002099003)(10067099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVg2cW1zQXBsZU1GTmExL1d3YXRnUjN1cGp5RkdDMThzbkpsL1VzZzdOaXFB?=
 =?utf-8?B?Y2VoU1RkR3JFeXhwdG5uRFJtN01GVkZCZ3EwMmxuSHI2WWZOeVRLSlNjK213?=
 =?utf-8?B?eXAyQytmUWQwa1QyYmp3KytrN2tFV0hHL2FqMXlGWUtmZGhPSG9rTUFXa2Jr?=
 =?utf-8?B?NnZvemlvTEZ4UjJGVytEOGErZU9XbWQ0aHpudlBOU2w2ZUV1RWFaRkJsaGxL?=
 =?utf-8?B?d0ZUd0RYQVdNcEkzVkI1Wm1rY3ZQaGVaT0g2bkI5NnJ6WmxmcnlSTUZabWov?=
 =?utf-8?B?YjdEN3Jxc09qYkN3aERpVXp4WUJNYVBHcng2Rmd6eithMkRtSFlmMUM2dEo4?=
 =?utf-8?B?VXRjNnU5YW5BVjM5OHZtQXRuRlFCd3RYMHduRnZSZVNlNUgrSmdUNzErdFhz?=
 =?utf-8?B?d09Oa2pVNjZQSHVSR21ZcnRER0pnSUsyN1N4dEs2eHNjMkZoQXY2S2RlbklV?=
 =?utf-8?B?MDFoOGpyWWxoWGhvS2lWMUtiVC9tV0dBcTR1elltYVpUKzIxS2JZelV1OE85?=
 =?utf-8?B?bCtSOW9TdW9lb010TWgycGI4UytaK3NTcFJqellFN0xDRG52ZGhyTWNvN09K?=
 =?utf-8?B?K0t4eGhPaVJkQTdoK0NLWkJPeDM5RSs0SUFLdDRZMjlsZ2lGRUJqc0dDQzhL?=
 =?utf-8?B?eUQ2TXFxNDM3SGZ3Y01FbVpTNUM1WW9VMGJhVnE0dkxwZjR3czdQYTNVem11?=
 =?utf-8?B?Q0ptQm9QRUx0d2hPMDh1MERZcDNybWJDYzN2M2d0eWkybTAxenlmcTRieHAx?=
 =?utf-8?B?M3Z2ODRyQjJBMTg5U1FXUVIxNFZmWGVuYmxZaURuV3VtY09NdDc3ZzFXOWJV?=
 =?utf-8?B?a05xd2ZaY25XZDBkQzkvSnVSdERYK2JoeUl2UFFvcWlvT05UR0h1ZDVUei9G?=
 =?utf-8?B?RlBXUG5lbVdlZnkyNFhxS1ZpM083VStvbjdqS2dsQU1BbmxiZUVXNkRaWlpU?=
 =?utf-8?B?TlRDZGVjTE5VZ0ZOb0I4M2o0WlFqWUdYajhsU09XdytWa0xJNFUzUFVac1Ri?=
 =?utf-8?B?cTBYalliamdTMWpRT1hSLzBVTHMxR25rbW1sY1p6ZHpxY0QrRXlHQS82OTR2?=
 =?utf-8?B?SnkzZDdudTBDb1U5VjdvTTBNMzk3WmpqSkM5Z2JmT2k3RThKWlhuV1hmSnM1?=
 =?utf-8?B?SzdiQ1JTbzIzVG5pdENFclF1TU0zL0dZbWd2c2RMZG5Nc2lLcTdxaVNFWlZY?=
 =?utf-8?B?VWhWMHEwY01JOUNVN1RWM2VmSHdITlVCWlA1aTRjSXZLOUJDaU1wQjFQbVNW?=
 =?utf-8?B?WlZhK1ArYjR4SE9ZaHVtem5SNHdhTFRHVGZLWW9DN1FYRU9RVWpiMHFuTjl5?=
 =?utf-8?B?bWthMHJQU1p3dmtDamJzU0RaMDN2cmJSY0NXMHp0ZS9YUERMNkhIY0dVbktX?=
 =?utf-8?B?RXg4clkzSGs3UzVLUkhvYzlXVjlQVFFPWEpNN1JMZ0E4OHVoMWhRVzh1aklE?=
 =?utf-8?B?K2xrd2FtdlZTZlNxcXltMVdlMjhJWXJLd1hRaFovZjhCUkZvbUJydWRjVEpQ?=
 =?utf-8?B?SVJVWWxRMG90VHZLS2U4MzZPTGtNNHh2KytoeHVyVWVVZGtDV1ZUdUlGSDBR?=
 =?utf-8?B?L0lvb2RIOGJ5UDM5c0xqS011YzdNa04yV0U0Q2xpbzBNRk1xTzdDMUNFNXF6?=
 =?utf-8?B?VDFVNk1EQVRQdUtRWHMwcFYyaDg4MjhndU1Jelh2TEJSTU9VOGU2OHNLVnZq?=
 =?utf-8?B?b3VlVG9aN1RLK0ZlVGlETWpwQUFGYTZlRXZaQ05sa091Uk1QMklxK3h3UWVP?=
 =?utf-8?B?NHBJWW0zdzFYSlBDWkFnM3FHSkZSS1BtUVVzbWZQRXNMQXdsK0RSM09WMHdV?=
 =?utf-8?B?N0RXMG1ZTC9Hby90cWpkeDZkaUNjelBiazZwZkgyMGJUODk5ajByR0VBZDBW?=
 =?utf-8?B?UXhRYVMweGlWOEdBSWNPejBzQ2hvVUZlZ1RXZW44dFFLN2ZsT0QzamEyRFFy?=
 =?utf-8?B?TisvQmFpcEhNcWJDZndrN05tZ0ZGQlVmOWtFNmd4TnBVT052NGMwYUFWN0NL?=
 =?utf-8?B?VVgrcUpxZ0QwaDJCaWVNd0d0eFl4T3o2aUJtTnVJdCtpZzFaVU1wWkM5U2VI?=
 =?utf-8?B?Y1FkS3NnQkdJc0drNzJyTk4veDI4WHBCMWljYzlMZDd6aXdQUTl5Z1dyWGdy?=
 =?utf-8?B?cit1ajVmTlFsQloyREZFYTVJRzhGYUlSVXo2aVZzcm9xQkZqcGxia214ajdI?=
 =?utf-8?B?OEZhSytzdFdPeUZIRTIzdUN4ZDZsTjhoZ09LbUVwd05zdUt4YmtmNUJpckxX?=
 =?utf-8?B?SGFZUUxqR0JVWkgzNkQ1V0N1VGtDamZVc2VoUG94SHhDZVNEYXNtL1BtbEhW?=
 =?utf-8?B?bUFTUjB3Rk9rRTZ4WGVFTCtTK1RHQ2pVQUV6ZkxTQ1M0QzRZZjVsQkRWZE9l?=
 =?utf-8?Q?4dWUDfZIb+GskT82Uq9nR4osYUPGKtHvxzT73HXiWllOl?=
X-MS-Exchange-AntiSpam-MessageData-1: JahsMhfg/7uzAQ==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7852b7-a41c-4bed-c1de-08df25721890
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:47.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxO63/PdFtYUlTSF6ZRkNORZ0RmZ1D2At3l5Na/ZJlfxRRUKnZphMPmcwcExQtTKv7dAZY6cCBN4JsPSDrVWIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Add support for explicit self-referential annotations.

`#[uses]` attribute is used to mark what other field lifetimes are
captured by this field, and also the variance of the type in respect to the
field lifetimes. For example,

    #[uses('a: covariant, 'b: invariant)]

indicates that the field captures the field lifetime `'a` covariantly, and
field lifetime `'b` invariantly. Many types are covariant, so this is the
default variance if the variance is omitted (e.g. `#[uses('a)]`),
consistent with the automatically inferred borrow.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 99 ++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 4 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 5f37628fdf0a..5f9f4f3ac39a 100644
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

