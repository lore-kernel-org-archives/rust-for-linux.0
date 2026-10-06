Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021097.outbound.protection.outlook.com [52.101.95.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025F48F836;
	Tue,  6 Oct 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300603; cv=fail; b=rVLjTkFHnt0Pa+w7ye7YdVhEoqzmU/crz/n9HdmbS3xl7YskBffEqAlePZY/Ii1kK6IkwdZ8s/GDN7LwHzWkIqjB4kY165gML/Fdz+lxmXiIIMa0gPpLvglWPXFxORsSXl7DQ1c47yzRYUsP0BPOmOa9733To6MZFXYZVfEHYuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300603; c=relaxed/simple;
	bh=K/oN2jx23gBEkPX+QEEaX3VEWtz83q1foH0pc2rQgAo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nR2wN4PgeOftvVPb4bKPyrnBS31RwlJ91l8a06kOkPMOQLZI9x73Cw7Mb7BkgXQavdm+/Fvlidq3lAzo0vH9QqTL5z0DzRnJ7uYB58aifssda0FVp7jH9wQ2cnBLUnDB8+hQMekg/kFJR/4SKHI72KAgKuGrfNEnQi3vMnGYB74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=a5BS9/uy; arc=fail smtp.client-ip=52.101.95.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="a5BS9/uy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2v7rcnNfLcbG1Jq+zd2Q8OnfRRCCa2LW3oQp/rg9QK/wOML4gL5SSDy3oimsMV0Zik1X4qPQ/ps/nT/p35jm1tVV5Zm2M7yN8oWAmzkt9g3Kcm05HncfPE5BhpumeHASqUNoCeiq3QacE18tmRSdY4Hh3URNftx+QDYHMKrL88B8l28WfyS7WFZfPd7UuOWf2WXg813yC+f3bMiqnasHJbqhixiJCBSEuWfouLa9Ibl1rtWRfK61CvwHUUriIiKwb62yHbie8YKGzpyMhYnmnQCGXQYJrgMfldU+LF2x2MNKjsk3lCpUbeVStppKg3+lWbE6GgsEH1iAvcfcPcXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mIn3sCLl5MyGywT4StxJqgjSLiojdNU+Jt0jEUw+gs=;
 b=QPR8huBS8D3iPL5ms/6ypOqCoSBidLFbWzyMeZf53jgO71sAg2nxOOS9qaiq2qjv0in2H6vAJeIRXWaCbGrQwcSLpj01CvHqg+mLt+OOJgbqjJ0ghFpYIzebW9O7JG88wCG2TLYFKAeXEEB0JfvpIG8VJ9YOOnzz/n1GbCFUg8tgeDwXoqbUu7uFvuRnMn/uRPkuSMBxlm7NSqgQyza0b1PB7H94n0raByB9TStXYKAEIDzs9+vcOpAXTuqwneNn1pVNDBEbrSHd71wddvP6mnOcHCV+hC8AYF/ntUfDYfjEtxCgM6QjUuEx+0yxneIvH7TMxlAf4HkftdMggQJU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mIn3sCLl5MyGywT4StxJqgjSLiojdNU+Jt0jEUw+gs=;
 b=a5BS9/uyLUG0i7w92U631v/mp/nv/NPfMxvcSuxZAQNf8Jr3MVgAcM2kzWBCnNmX9TY26tt2/TeruPxracL3sPraFaXMWNRBoN3aKGL7z6ppZBpnjrfq2b5P0aWc5EAD8mN/tt7SE3EaEBVt3NIgIPcsSYloqiEdC/rj927A/FI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 15:29:54 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:54 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:32 +0200
Subject: [PATCH 2/8] rust: pin-init: internal: init: set span location of
 guards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-2-da716f740d6d@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208; i=gary@garyguo.net;
 h=from:subject:message-id; bh=K/oN2jx23gBEkPX+QEEaX3VEWtz83q1foH0pc2rQgAo=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF33q/6jlVf/GdX5Ild2TRrM3upzcqrtFTzTWfO
 beuV33Z1ciOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJnLXjZGh2XnVoZ26ghWP
 Te4/W11XHz2t9LfATNmGUq8ljPtDq2x1Gf77fjIIz6n66sfvf80siS0pK29BWcf0nI8bEy3kD5h
 N/soCAP5kRj8=
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1817:EE_
X-MS-Office365-Filtering-Correlation-Id: e98bd95f-ffb3-4523-7fc0-08df23beab37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FoQL5bG7YJIplo8to8qjfwGyIOIRICbc62aEcG20/XYDrKon//WtQ/qpM77C+2DzOLdh9eJUQXVJa/oD/GfVPRps9rvwU1fv+v5WCQta8Q6LabgqLcMHv20cifdrRHtv5/iACcO7whcnzPStY4OJ7/HKWUyrPE66/NcF4GdlDIgAbNnfoQ13DZifc4FeY/FjwbE6ewl3hQgPGLfHtEniBWKDDamDYFiEsRzF9PoI8Bs11t3ZX4zqKOJaY5asT8J4h4iI/jCnWfFjyCRWLivA/SFnWWGCY7E1D+3KfzjL3Mwlz1GT6ihec6+bhxW2qY39M59xVq/SO0CIkm9nTprdtwy4HFYxTtmLN9GpupVVZCquz87lXpPkIxUY3hBv9DriHT4ZYP9VT/wJVutFR4GMnQh1IGWn+wVWHSIG0aIGriJycnS9ApeZoMZBdIaq+01jYcqrv7fNzKrlyvYCqfAXEZOufxu9DEfJ+1aKoVO8+c3Z1OX3maaaT2FXVyoefDkF2+M4i1xyc773/sMh1U6VNm5m7gk6va0rAY0aBIans613DG3dHgFwVKa7IrFEP7MvkkzJZdtLtniDJG+ccZQ1ohOlnXgdz+FAAbkozdUngECOlnM7KCmOKNIRoIdHAfbElE3WpcqYgqZGoNyyFZBTjJeOf+9oLvVPTJgVxBlZcgFKNbrSJiDsLT7eR6Pbg3SVSMoFHtMkAz0HK8lEhc5H8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29DTUs4OU5SclhEU09rZUlBT2NzK2E4WEdpRnFPSHlEZnkzTC9xZTMydzlY?=
 =?utf-8?B?a21NNEdDL25rdWhTTW1iY1FxVHlBQXRKLzNPUHkwbzNsUC9ZWFJiK3NtWm1k?=
 =?utf-8?B?dDJ2Z050ZWVPRExtNi92QjlRcmJkUTFIeEc3bzFJZmVLb1NraXdQTjg5UnZY?=
 =?utf-8?B?Wm9zMnA4am1sWUV1NDdqNjk0ZW9wQTB1LzNhU3ppUnBWNVRvQnIvTVJTY2Jv?=
 =?utf-8?B?akRtK0Z0VjM0d1JFMlZKeUtjalJOTlE4T2Q0dlk3aHlxd3FqUHE1TXcvOG1N?=
 =?utf-8?B?TnV3QjlrVmhzck9XRVdsY0ovNXVLNGxTSG9ocWVhOW80Qm5jNTBpQ25IU3NW?=
 =?utf-8?B?RmUyWEh3QVJTaVY1ajdpaGV3bDBhRTJWamVNdFR0OE80WmN1OTZYSEx6eVc3?=
 =?utf-8?B?ZlR1d2ZmcUdLWkhpSFVPTVV4b2xJMDVucitwRW1qa2xtcTN4MjR2UE5DU0NF?=
 =?utf-8?B?U3RHTjNQZnVrT0dOMUpWUmRtSUpKV0FjWXJoYUlFOVVkZFR5Y0JJNG1MbFAw?=
 =?utf-8?B?YjJTazBObHBYaE9pQmF4c0R0V3FmTWNTRW9Vdnd0eXpsdXFpRW1GSFlRMzds?=
 =?utf-8?B?RFpOUzZNR2oxa1BUK2NQdzBlRi9VTDE1T3VsRE5YNTM4TVRpdXlwV2FyOElj?=
 =?utf-8?B?ZDBQNDFDUFA2dUNOK0U0WUpKd1daYk1BSCtFd3hRTkhrSUlzYmRoK1IrbTdx?=
 =?utf-8?B?ZDhCQ0doNE5ybnNWeTFTSk9TeDhBdjh5S1E3aXZjdkltZC9GQUJiRitnRXhk?=
 =?utf-8?B?alI3ZmlLTE1sRFlRdEdlN2N0ZmNJRlFaNFc4Vmc4YWx5ZGNGbEFzWkl2TElR?=
 =?utf-8?B?MFFNdTN6b3I0QzJrSEYxT2N0c05tRUpaWEhJdXM5TFNseis2b2FySkJlazZo?=
 =?utf-8?B?ZTFEeGlia2FKUS9qV3hTNmFWdkIwYjhhdkpvbTdQa0Y1aFZQZTR3VmVhTnJ4?=
 =?utf-8?B?dm4vc2ZWK1FFTjhESytlY2hoMVJmTWtENk1SWjZ3S2NtbjhIcGVJRnVuTXAx?=
 =?utf-8?B?elJmajRuVUVjd2dIOGs0d3JDSXNOVW83N1M1djdoSXdMb3lidVg1N0VYc1JP?=
 =?utf-8?B?VkdLWDhpQ1RIUDZtOXpoYjFJSmxSeUQwVmcxNGpIdXQxWFRmWTZVK1BkVFpH?=
 =?utf-8?B?aXZwWG5zb2hXR3QzbC81R05jV3hNZ2wyQ2ZMTEtWSzJiVWFjZy9LWE10QVBu?=
 =?utf-8?B?a3ZMeFdJb3FxME5lVzhrb3YvOVI4NStWZVlsWDhTVVpHSzhBOHpKOEdMYVVJ?=
 =?utf-8?B?TGlQTGhYclZKN2dTbGFSdC9SKzZwZDliZC8zMG41a1hJcE5LTDBwaDZTRDJM?=
 =?utf-8?B?eG9LakFsQTlGdkxTbm4zSys2a1Q3YTJ4c0ZpRU9mbWdyMWQ5M1V4dDRNM2xu?=
 =?utf-8?B?U3NkQ0FxSzFqSE1EUDRwYnFLWGhsVVlTdGZFR05rb2w1a0p3S0lFcXY5dGYx?=
 =?utf-8?B?Q2pLc2daZi9xQWlVbEpabDZGNmpNSDNPQ3dhdW1SaUYzR1lwTUp4cjM3clZF?=
 =?utf-8?B?bzIzU1hsU2dQbnlhbnFiUU10MEpyeTZZV0dISkJWSXJzMXBncTQ0Y0JEejJo?=
 =?utf-8?B?dDRrWWpZVDJaNkEvblpMT2p0TWJYb0cwT2FIUlpPNlpuUW4wN3gxSjhOYVRz?=
 =?utf-8?B?N3JBVGtUMFkyWkRvOVloaVlxU0RMc1pmeTk2UmZIMHhZa1M5bkVvbkxhaDZZ?=
 =?utf-8?B?SWR3T21PVjIwNFV2aXFlUlJRQ2l4azlDZVVwK2RBUThqL1RlanF3azloUnVG?=
 =?utf-8?B?VlZsajZCTHN2L1lKeW1XMUJDVTA1ZVZZTisxdkNzWTFCZTNyaEFZbGR1YzYx?=
 =?utf-8?B?dDZNWGZmYmtTN0lveGg2VDFKK3YzMklpbHp1eVFkK3dFa1VkcDI3c005TW9m?=
 =?utf-8?B?Vk1GVEVpbFF5K0l5ZUtwNVl0SmpIaXh0TWFqL2ppb0Z1d0NxdDhTODJYTDF0?=
 =?utf-8?B?OEdDelNNYk9Gc2lKOU53RVJoTmt6TzJiQ1lpK0w3R2hnbnlSRmhuRXhCdTc3?=
 =?utf-8?B?d1JZQmhhV2N0NW1jODJRdkdZMnArNjVETTRMMFBKRHB2ZU9pNzhtNzM5WkNC?=
 =?utf-8?B?TnhWRTdBWUthakE3QStWd1NQTDhDbGd6cGNXUlVjV3ZPRFBrQlRiV09WLytV?=
 =?utf-8?B?M3RLUm9SK1lqS1Yrbkp4UjVta2FwOTRXQlZNeWhSazdjdVV2THNXc2ExZmo2?=
 =?utf-8?B?NlFxOEx1VVVIQUxPdThlRzcwMFBUU2Q2cThwQ0I0cmlmOVJocGRmekFYNGZY?=
 =?utf-8?B?VHlZOVhxWVRLYm9WUVNjZzlKQjBWQlgyZExyNHlpTHdJcWpDMjFDcGZySFI4?=
 =?utf-8?Q?7lLAuZG1/2b8hmdv6o?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e98bd95f-ffb3-4523-7fc0-08df23beab37
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:53.4010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLRqeihwTtLTtLvlKsE6JHXYVAjPhdM7dmihi8R6fuUe+uis+k+UvIR18JMyuvG1+nT6CzoO1XvVzxNlpb0WUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1817

Set the span location of the guards to point to the identifier. The
generated diagnostic is still not ideal, as ideally it points the place
where the identifier is used rather than the identifier name in
initializer, but is still an improvement to status quo.

Before the change:

    error[E0505]: cannot move out of value because it is borrowed
      --> tests/ui/compile-fail/init/accessor_lifetime.rs:8:13
       |
     8 |       let _ = init!(Foo {
       |  _____________^
     9 | |         x: 0,
    10 | |         _: {
    11 | |             let _: &'static usize = x;
       | |                    -------------- type annotation requires that borrow lasts for `'static`
    12 | |         },
    13 | |     });
       | |      ^
       | |      |
       | |______move out of value occurs here
       |        borrow of value occurs here

After the change:

    error[E0505]: cannot move out of value because it is borrowed
      --> tests/ui/compile-fail/init/accessor_lifetime.rs:9:9
       |
     9 |         x: 0,
       |         ^
       |         |
       |         move out of value occurs here
       |         borrow of value occurs here
    10 |         _: {
    11 |             let _: &'static usize = x;
       |                    -------------- type annotation requires that borrow lasts for `'static`

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index f0b23d0311ac..80e4dc068d2e 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -413,7 +413,7 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
         };
 
         // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
-        let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
+        let guard = format_ident!("__{ident}_guard", span = span);
         let full_span = kind.span().resolved_at(Span::mixed_site());
 
         let init = match kind {

-- 
2.54.0

