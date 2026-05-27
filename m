Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022088.outbound.protection.outlook.com [52.101.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E8F44E027;
	Wed, 27 May 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902415; cv=fail; b=FzQX0vBnXAETjiiElWbBMTfCc1rJCzYiMndA1vu+PljlL+Rf7/APzUUpOhoyI+346qHv+yFgpe8wNYib34D7lFm2THY4DPDAplHvfpDMtagwxRrcue1GG4VSSiNw0XEiN87g9b4LT+SabhmZfl+zWWZARIHiL19M8RuCBn8ai8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902415; c=relaxed/simple;
	bh=jgSHAzYzOUdkc0YGaJO9f9QmiU2kyK5PbYPccyXGl/U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sq5GI5FrABC38V1trEfgJpxO9W9Pdhs539ihvEj7J1Kab8B2ujpmef6m0mSfEIS/CbwiUcPGO+X9cUJCWtUE3XWGxVht6NWHsTXLt82SzsmNfU9mEUco/kVxfe9nbDyO9VhkYQQ34FtRZ+FPL/rZcxBNbmfUL+mM9nuT6KHtMlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OLaBmtO+; arc=fail smtp.client-ip=52.101.96.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OLaBmtO+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0rUzO6KwVui7FjbQdpGkLZL28fkUgktDpEk50hDwRAH2gGvO5J+tgBgxWltK+BsUBidPv5UBgAj23MHt7hmjwF3IuKlmGq5Uh1XCcB6BxjzBhf66CjuYZu3y/2DUiSvVxU4hqQ9hZMmZ70zAr4suwyYkqZ29D3UXI0V5sbcW96vXFGqmWJYicfu5xTlqr7ujGhbs+LSl2iOixzoSE7fTIZlXQbrze54mvBWOQHbsfHa71d/J/YyEKbNdKgKjdCsM+RUxYBz4720GRqaQvY5DpZkWQzwlT/lUYF+H1jdx2UJZUDFqEri3S019escsw14972N2gwQ2/MsNkE+7UP3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok9Gb7BaRWMk6WZjIlXNBX2AYOLaBVXgEKXWS46W50I=;
 b=Gvit0JR0WcMdUwR1KLxoib/VktWG44vjPvzZQz7fV3AF+6/x8WH8JI+lEaxD/AZxMTB+pIwhHEwqcw0Xe+3q/w33V+cOjLzc1BA4PWh7LLVr2KsZ4ZJwymG3kD6TkmfVQGB2nr9XGqO4agv358bGFfilQ66ON1webym2qritUpHS3FP04lokAYliEgxWIC8biv/g+kfEJ+dR3QIddvUV5NdWr+aPfSuTJ3mQ2JU4APZmas90g4qC+eKFB2paPSrS3VYAZXmkdYVlZFSqqZIj4UL18Ls4rz5WhvqQ9IqSvOsXZUx3/8Iq0TIQ9MHPMAsjAGsPaE8GWA9V3dbdjWvvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok9Gb7BaRWMk6WZjIlXNBX2AYOLaBVXgEKXWS46W50I=;
 b=OLaBmtO+dImH+TT2bVcJsJApaxfFrHlUVmdw+HNDftVcIKtWayLGNhOmH18rSCpKrisndoOy5nrChVZdQWNbBlbxHMPxVOxJqqRv2q7kooXow5kDdPfFkq4YIKGd+tMHc5ap26222S+Bx39AeYkE66H406J49avaheyVPFHa55U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:07 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:07 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:55 +0100
Subject: [PATCH 4/8] rust: pin-init: docs: fix typos in MaybeZeroable
 documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-4-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Xiaobo Liu <cppcoffee@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=826;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=1a2qKlYHAjfFG8diPnZ7PMcVB17v+Kn0nZbJgswPNDw=;
 b=oAhywkA31CHlTkTA1bkDyrvdl1q4ElrjkUPYSm64SapvD2tLYW57EoagWVQkwETZvSqIFOV14
 u4ENe3i0MSpDi0oKCfSZ6GFaQgtf9wjrXmoKQYMKdd9tntWlKRTTpJK
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ae910e-af8f-47b9-d2b1-08debc1432aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CuOSWjEGrx4OIU3hs8DQnNrXYyXijU0GXhyZyUwhI5eKQfFC78TQb11iJ7mHxR+XKrqMd8ImT9hZwsAoeuLbT9q2YBAH5zYynuH8UGGSUsPfk8j3CTAVm0I9Q1N2FGoNb8dfxHjJOoDpE9Ej1l/iDgVxgpkOiL2jY9ngGUWsxPF6LHbt4XtGQTLnI9auJGKNd0NTEHgI6l7yKWaoZi752Fm772kuyjAU2Oul+8hKpO5rkiXrnwxfdFxaMCBDSVvjl8KnNhaSZRZBAlvQzr0mVtJmvq1I9PVTOfxqhDR2zpsAVsBkOqX4yLh352Z1iuj2g+V7UbcdEAwLGco6i0VzVAh6thAnGeGi8t17jZLHxXZVRR8Ej1sw7v4CulzQULQjsbRfkxcLKBCSaLjab6+Icuadt/LfIPBoAI6x74hrR5d8H/CVUGN9g7V+1FuVnXKTwEAn493cdq/8XW1tLTaut7LKigiyfK0FI48Vup2rKfv8qnImlFFdB425PF7mLbOt1hch5EOBxli9z1Aw9JZ3Cec3ozvIBcIIG17iXrNHZpVKipAyv5pY9830BvaEyawBYQ8XF78cJmGZKG0xZ0Llo/1ABBQsoxpBjNYbBvWSuuNcJ7GmCQNN785UnFY00HwRIHiDAXv0bXZyrbWYQH4lU2URSYNg9OPoYgOxG3q70vPn1NaTNE4A/CP+wvsW2BsA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M01Nb0JWcTFseG52VzNVVk8yN2ZaVFRoTHFQczVWdUJiVnRHK05tQjNaU1lx?=
 =?utf-8?B?aTh6NStxNnZLYlZWVzdBT3NrY1pnQTFwQ1Y0RUluWGtIVDNUcVdEREkvaE5I?=
 =?utf-8?B?Kzg1dm9iQTVMa2hKZzRxeDg1a3gxUUdRek9xUGJUdW4vWUNjM0xCVjhBdFhn?=
 =?utf-8?B?N0duSHpTS3dER2J1VVJXMDl5RGwrWEFQYzJPNGhBV3lVWGh6UFdZY1kwM0V4?=
 =?utf-8?B?eHNrMDVvMGtPZStxd1JUSmtHWENZWWRoaWl5M0tKZFBOa3B4OE1EM240SSt1?=
 =?utf-8?B?QnQ3OE5sa3F0M0ZkNWZZRFJFaVNQUTM4aWxEYm0xK3pzRXNENG9MYi9MOTF6?=
 =?utf-8?B?ekcxVVRPcmxnUUt3UjNYM2w0Um1GS05FWlhjSG1NYUxHMEhVYkk5QnVhbVRF?=
 =?utf-8?B?QXMrbmhYeDBmTmxMMjhiMEg1OFk3VVNpMTQyQ2h5S2lrREdtamt4TUVEVy9o?=
 =?utf-8?B?bFpXeUNoM3htRktPL2Z2YzJCb2o5Szkxc3lidUsvRTZqZHl3L0xqampSUHBB?=
 =?utf-8?B?ck94WUdkUmFVMlV1Y3RzNEcxcWZsNzV0SXNZTm9ua25pa1NsTEF1QzNUUWp6?=
 =?utf-8?B?aEtlT2NJeHNLRW1KTWI0M045Sjc3emJOVVk4MGZad1gvd3RyZTlCL2toOVV0?=
 =?utf-8?B?VnFVR2l2MDV4b3BYSjJad2pyRFZSRHV3ZFVEZEtCdjE2SHA5SFZaalcwSkxM?=
 =?utf-8?B?Y1hZU3EvZ3hDQ2tuTEcwUzlpbmpyczNqSGo5TTAwYnlkT0NNUkZXVzJuckJI?=
 =?utf-8?B?eXZNblA5SFYraXQzZUkybDFkVElybjZxai9DNXRidlYvN2VjUlZIN01MeU5m?=
 =?utf-8?B?d2pUbHVDS25FcXEvQUpxZlFkNWJlMUVCOXRpT29oTGUwd09yajkzSXhyQTRS?=
 =?utf-8?B?SzF0S0FWbGJZWkEyMEFsY2ZNbHRKbGdqenVsdExsY2x0WHlOSUlSQXhKdVho?=
 =?utf-8?B?UFhHSUJHY2ExL1dieTBSeG5EcGRha3RLYld2d0ZtUFRydWlWemJYbTdoL3Bw?=
 =?utf-8?B?YWxHbnRDSldJNURJL3FvNitBUTdiOVlqVjUweVI4NzgxdGtKRUQ2QVVSWmli?=
 =?utf-8?B?YUdWV1JVVUJqanhNTFhYcHE1REVhZFNVa3FiQXhRTWtnWmsvZTIyZjBqb3Bl?=
 =?utf-8?B?dEEwWlR5NlA5TDU2K1J4ckFBeE5Meit6cDhDNzdYTUE0V3RueVhZS2hqM2Fv?=
 =?utf-8?B?aG5abG5scy9heW1RNmhTTXRjUVpnanp3eUxsajZ1RGMzckZCaDZ1Z045REda?=
 =?utf-8?B?dkRaQzg2VGh6K3NRT3YxdG9xQmNMNGI4NDkydmt4dVkrVTFtVGUrRTk2T3BL?=
 =?utf-8?B?bHFTQ2VCYTArb2dpL012ZllPR0RUQXJIL0Z3cmFaNnNJVEkrNlRuREMxNGJZ?=
 =?utf-8?B?ZmxuM1pFencyUzI1ZHEyTHJGQUVveW4vZU9pY1pEdDQwQ1hsUXh4M1lPd0hO?=
 =?utf-8?B?azZGUWYyY3JVYWp4UVhHOFlPMldVbytCZnpKOUVyWmViR3ZldG14WklqU3Zo?=
 =?utf-8?B?K2ZGZ01YSStnSzlXOUtXYXhJRmtSYjlpMG55bVBtcTVGVkQybDNrckdDSE1H?=
 =?utf-8?B?M0pCVlNQS0tBZTMvcktlZ0VBS2xCR3d2U0VGNmJjaytXMXk2cUw4N29GUCtY?=
 =?utf-8?B?RVczMUtLVXNYSzVyaU50WldudzRZWVpUcXlHc1hmdG1XYkkwbEU4TnJUek1n?=
 =?utf-8?B?aDUxMk5IektOL3J5NmcrbmFLRTVDVGFKSThXODloY1RoQ0ppYzMzaXB2M0hH?=
 =?utf-8?B?VVY3R09ybVA1SnlsRTR6bXpMUXNhcklIZUd1RndUWHVjMFpJRzFPODdyNHhV?=
 =?utf-8?B?cGRzWjRsYTdFMTlTM3VCU3dWRjBrYnRRejVHTS85a0ZTOFZlQ3VYZnRhZmdN?=
 =?utf-8?B?Um1admIrSGxLeEFwcW1sQjB2a3M0cTFhbHlsc0N5cnVkOTk1OGQrYlpsTS9T?=
 =?utf-8?B?L0dON2JKclNaOTM1VWExZU0yQVVmMTFySjFnQVF3UmhhQVFsRmJzTk9xeVds?=
 =?utf-8?B?RXVPSkZ5UkFUeDdITGNnZHR5ODJQV0hadlpPMnJQRkVELy8wangzeVBsQkhF?=
 =?utf-8?B?bHJPb2VGMldWR1J6Z3VZRmd2SktyT1BuRkpPSjVJd0pqQ0txaWpnV0t0U0J4?=
 =?utf-8?B?YU1WMTUyMW9JaFA4Z255d1UrVHdjdlZmL3ltUlRLU0t2NDM3Y1JMb3RZd2JS?=
 =?utf-8?B?Rjl4ZnRhQU03SVN6QXovV0kwYWNxK1IxcTdjTFA3Y0hmaEE0ZUF6ek4rMzQy?=
 =?utf-8?B?ZTFIM2ZOREtwMGdRZDZCNWF0QUtTcHpMZmtxQWdWV21FaWpqSlpQL0JRRTFi?=
 =?utf-8?B?UjhuRlI3bU1jVFV4Q2lIWEJzTUdMSHNrMkJjSEkwZkRmNnJ2ZVFVdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ae910e-af8f-47b9-d2b1-08debc1432aa
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:06.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kG1fZ2jAsmRqb03PFTYk362NE0VUFCHHhVUVWVyOQ63ubf2DJkkRO8zVa2QNPsH7aR3ntgGDDoBqEtTwVmwCCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

From: Xiaobo Liu <cppcoffee@gmail.com>

Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index c9e2cbe27915..84099474324e 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -431,7 +431,7 @@
 /// ```
 /// use pin_init::MaybeZeroable;
 ///
-/// // implmements `Zeroable`
+/// // implements `Zeroable`
 /// #[derive(MaybeZeroable)]
 /// pub struct DriverData {
 ///     pub(crate) id: i64,
@@ -439,7 +439,7 @@
 ///     len: usize,
 /// }
 ///
-/// // does not implmement `Zeroable`
+/// // does not implement `Zeroable`
 /// #[derive(MaybeZeroable)]
 /// pub struct DriverData2 {
 ///     pub(crate) id: i64,

-- 
2.54.0

