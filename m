Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A7440A0D;
	Wed, 23 Sep 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187649; cv=fail; b=JX9uPzmXPlJPxwPt/NbjYGHvcsrq8KYpRmJDX5UN/b0xk42u3TG9ovidT5BZv7sWsnYnVpKl63CHvGeLFMuhutFz87cNcSOG6tYzaq/39hzXR360eVOV/l3CtJ/II4Xi/axef4batR8x+gYDZR0dXd1Cp0WNMRIvoShe9CobRto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187649; c=relaxed/simple;
	bh=XBtIXC0M1dFD265oUX37BthhCp4tgf4WqOpUNB+x+Dc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dij52KSO0mWUoqSu3md/r0+8roKl8ceReqDYV/S/AXu0i/q4nt9NxZI3jX023G9g6x/6SoWPFIj8wDD543bECJoIsVtZm0ksmBEjuXoIitWZxaBS+oIWZai8lug9VKOSmprKeCkwINotLRjTbHfkHm+FZAQHTSe0gaEEa1GCnk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ywbWwgpN; arc=fail smtp.client-ip=52.101.195.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ywbWwgpN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irOn6YlrvsyFm/WQRGQ+oWmq5ZoDD0kncs3KDVBd908s+pAifGaIMLccvb35wFd+lfQFX0MtY93wfFr2DTfJ4pufBMQmKPixMDRR6IQD0wXouXs4WEgOtxiCV8v+gharrl+tsSxivSD8Uwt6BvOiJU/94gfDVAnhWvDYDwGpVoEgh1z/goApFaf4S00EAV6auvNjKXa2DTCLnQXOnmm2jzFerHQjBy+RkyXAcjSe3tFhvs9FloWPIb/YidTIGFi/qBgK2XnymiCMCfysgZ0RzqittDqu+D4u4d4ehwDgHmi5543G48sdJpEi2pXm3dJ+x2l4h69DUGkpvVWbtZVhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig74jBLf4exwIbUiNoo0NMqworQNGKyMXUY6p0euWJ4=;
 b=hgzvoGCpxSJsBc96lI6uP53C01nV8k5dMlO8FXmdowGEE1Z/bXttyLYZB34ouPD9jpv1fGkvrfw2mwWYFNeqy0A+hNt8coChYUGKO5GkyPw/p9Y1IXcc+2Ew2D9tisWWNZL+mWWPPQQxUMh4YUS9kgJHdzvkAReWEyM9SBZxVYj1otW+oRvfFVgvE7+5jgVkFsilHO+vzmB6hjry1VsvgJJDQamWeu3pBpL7K/6TqFyLMLq7CRZEzehzYocKR59EIpD11KQf195sdDYxpaa1At4axLyQ6StEWldVzKv1evD3y8mQr2bNUmSZk1EH5+GAOr2jwCX/J9fnD52YS3jXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ig74jBLf4exwIbUiNoo0NMqworQNGKyMXUY6p0euWJ4=;
 b=ywbWwgpN9SUj2bX+IEb8u0+QqKbDKXi7A7LDb3bWqm7QzqpyZd4+BqrYiBBu513MJEdXc0VUwGPM9bNwB+XLei6NPypMCB3WkQ4mPwNaTNjUOKHU2s3Suco4Ousri/mHM8vDtCjOBEKKE+XhCcVTW4vV9cb0OuHZVdQUA3Ii4Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 18:20:33 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:20:32 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 23 Sep 2026 19:20:16 +0100
Subject: [PATCH 3/5] rust: pin-init: internal: use `HasInitData` to provide
 inference help only
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dev-pin-data-diag-v1-3-e4d7193569e5@garyguo.net>
References: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
In-Reply-To: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790187630; l=6175;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=XBtIXC0M1dFD265oUX37BthhCp4tgf4WqOpUNB+x+Dc=;
 b=odXrfX27yKHDWly874CndI5qVIAwOmrng0LbrV9jFuH56vs98UfRKMByH7PlWeJVaYtCLzXhS
 P2SWAyHuP/eA0WPl4Vg4Tv84zd+ZXYOZOMOH7xqc+LxtW1Io9HjN7xk
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c23128-28cd-4deb-3a13-08df199f5a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10070799003|6133799003|18002099003|22082099003|921020|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	gAd8LjaK5CRWZpV4MEJ8eVDsus0X2JiegFGv1jj2D/14j9OkgUkrKPvEV6ISMlsZW0W61Xg92uZyZrjcXmXksBPa9i78caMuWGiEdG1A4hML0rxDqmGjfDxb46tkdUc5HwdzRUmF9EiQtgn4Fw4l9xqz/aSseV9bilGjRv5jLxQexS+CvJTMqtiI/CxR45Iz3ANY1AXK1vnPRZplmi4OZblkaLYf9OrZq+kcpybc7EzzeyndQf5YYkWpeMHiB33Y1SfDmfdI/lHV05cvb2omHhiyb/l2DosqpRo25pXpxsD/79pUNLHIpPyQ0qwyftu2drvKcMRbo7qfAbuMNZHAW05nH/sebdpF8iN2HzzDRNGNKUgn30y5njVSxdHj5l+7kxzBNTY5og/FwruXHKEivnWQecec9oW3YUn5fqG9uNbR3P1lgYzvvfPRy9YaOwUL389z/loqkeiR1p2nnP/ELuWnVS5i+SEoUk960+qN7/iy1XEm/SxgnmGagpxBjA7K9J59pdMbMgZTHfUW6MjUwFV53/FXbFQYyyVKEpfhFPaOnfEX26HXZWT5lm/1IxdLxYaOPpqvHe3g5nIbmvyXeDOE0ZBrd9qJudtU16eDLDTVOB2Vrm/gbvjtL3unJFfirgBBXQNJ9QtIjYqmvUvktirxigyE18GJc7HDXSzYRLCUY0IpuL3aF/HeY7/veHb7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10070799003)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdCeHc1eTdyY0lQV2JQcHZLT25GR3IzZmg0bFRPbVc2RllmRzNYZ2N2ZjJm?=
 =?utf-8?B?ZUV5ZVFCQmxlQWFqaXcxL1E2Z0VoSkxtV2ptUzZ5dXBkazdsNVVkYUJFWVZ0?=
 =?utf-8?B?dC9Yc3RtRFM4MzQ1WElYbjNLUHlRcGUxZXcrVGE2d0JzMUJQZy83NW1wZW5t?=
 =?utf-8?B?UXQzYkxPRWo5RFY4bGUxK0Jla09BOHNmKzRMV1FuTTNwOExYWk94czVUUXRQ?=
 =?utf-8?B?M1RDWGIrdTN5eEVjQklJR0JDNVA4Sm1INU5pVHg1Mm9lZUFRck01UGNoRHlz?=
 =?utf-8?B?dTR0STFXcUtreTd3UmxJU3E5UWlONGNvaVZaVXRqaC9RRndJT2hFY0VpVWxz?=
 =?utf-8?B?ZGxldWQrNWV6ZXVIUFBmUytJdHZKRW9hNXFWSFl2QkhYTmlrQlFZdDZmd3pa?=
 =?utf-8?B?UVdwejRCZndBcFEzbHYrc2JJdHRBVDF5eGtJSjcxdU1DOThXMmJ6UjYrdGdk?=
 =?utf-8?B?VUdIMHhObnh1TFRhdXNWdVcxOFdHWkZFN0N2MXZjSHNqUXFpMk5ZbnJmRDBG?=
 =?utf-8?B?UVJxSUlnd2xmTTBRS3NFWmJUWjEyM2VPMHBYak1WcFIwWTJBTmloSmx3TG1a?=
 =?utf-8?B?dnJkMmIvbWxYeDRLT2NuYVVlOEMrZXF6ZEUrYnlDZWNoMEpwSFVqWUtLaDR2?=
 =?utf-8?B?K1BpU3ZkNEFxclozMDF5T202ZnViUGlqQmxXMDJsd09idkV4ek1vVzVuZ1Bp?=
 =?utf-8?B?d0VrY08xTmwyYm5vTzdCUnA4WkJzRXQ5MTdpQldyTkxRb0lqb256b01uNjY2?=
 =?utf-8?B?aThnb0d6a0xkV1Q0c3A1eTI0clpIdUNMZG84Znhzc1AzUWlFT0dnRkxDWjBB?=
 =?utf-8?B?ZjAyVFpBV3pzSDBrSlpncXZYeFNMVWRKN2JtMkhRdnNtSCtrQjZnaEhCK3k3?=
 =?utf-8?B?a0VUSmZwOFFRQnJaUHk5SjlPdkNMNElrdS9XZ0pTQ2M0bzNiS0t2NzIrNmxD?=
 =?utf-8?B?d2h6ZmJuQjRNS1ZYTThwZEpLREFyWFhTNEovR1RzVW1qdDZFcVVkUDA2aGg4?=
 =?utf-8?B?alB6TzZVNEdxdzF3eDhaVXQwdjBYSHdCUUs5TVJKaHRnVkFCZ29DWkQ5bjgx?=
 =?utf-8?B?U01kSy9OUEt5ODV5YVdLd3ppeDRHeFdnRDcxUG15dFBib214NFJtMjUvRU5I?=
 =?utf-8?B?S2MyMDkxcUtSYTBVamFkZmcwdS9xL0czQStxeWFtZlRDVUVCc3B5ZDdrSkdq?=
 =?utf-8?B?MlNPd2crdUYzSlNzanhaUC85MCtQVDM4WVRMYkc3bDhFM0xVeHVyY3lDOTRR?=
 =?utf-8?B?WjZ3SGJmeVlsbGpxV3NpUXdWamtWS0F2SDdTUGNucDMydm1ZT0RxQWVaa0Y4?=
 =?utf-8?B?ZmNKK2d0MWViSWdsSEZaR2FtbEV0cWFXUmhnbG5xblMrQmpoSkJweGp6a3Bo?=
 =?utf-8?B?RmRwZThOUTN5Nmg1ODRoT0UxdjFIdlArSU9rWUxpdUFWbzFiaGtaOEk2VFRG?=
 =?utf-8?B?WlJsV2U2aUFEeVU5ek55ZGxBOS9rdFcvNk5ZM3NpSVJrY2NieXIvZXoyeFZV?=
 =?utf-8?B?VGlHQ2tSVGlqY0dIODZ2eTFjNWdHcUhyZE8vOHgyZlRiVXlTSTQ0Q1kvbEQy?=
 =?utf-8?B?VFRHL3JSNStick91Q3pEeksxbGFWRm0zZEpybkFDZFhvc1MrcS92cjh2Z3hC?=
 =?utf-8?B?bmtBUDZjT1BoUTNGVmYySmV3MU1PVHR5U3NZM296RmduYmgrRGs0VmdLUk4x?=
 =?utf-8?B?UUxWSG5jVCsvRXJLV1B5WDRXSEs5R21PSHlPY2FVMU0zL0xOZGhOOXYzZm8y?=
 =?utf-8?B?L2JlSjdKMGxsckdaYytFcllaVkNmMDlPZE52dzFCa0dUQnRtcGRsSThna2xx?=
 =?utf-8?B?QlBoNHZxN2JKSXRnOVlsSXRYRHFtc0VuWFRzUC9hSnVRYUNHU29scnFZYVNq?=
 =?utf-8?B?TjIvWFdUYWJISFREWS9mM1dLNEJhVis0bFYvM3M0OHNXcU9qWnFWYlYvclBu?=
 =?utf-8?B?MVVLN01JQ2JOUzJkUERGcVNoWldRQXB3czQ0NnV2RWMvOUJrZFZlYUhUZlM2?=
 =?utf-8?B?bDQyU2ZxMTdHZHBzWk1oV20xY2ZKcmpQMWc2cWs4akZocXQ4TVVLRnREWHVH?=
 =?utf-8?B?MnBoWjhwUkVCTUdNbnZkNFNDck5Xd2lxQjVUNWRLNEp1d1lTbURNOUZ3TytK?=
 =?utf-8?B?UldURUhwbXhHNXp6bkNEcGF4RzQyb21UOXI3akl0UlJMVks3TlUzMXJ5Myt5?=
 =?utf-8?B?ZittUjY5anV5QWIxbyt1b2RDRi9oOXY4bE5ITzlJVnNoMXloSFR1bkE4U0RQ?=
 =?utf-8?B?emwwYW5EckdtdmJXREIxU0ZIVmdNNTFKcElBVXZKQVp0eiswNklmc2MxN1Vi?=
 =?utf-8?B?MHZtdUUvS0haUktBbWNHd2RGb0dKWk5YN1RlZTdYMndiTFBXSTdyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c23128-28cd-4deb-3a13-08df199f5a6b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:20:31.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtS7csiYXFlBuIlZZN0oyv0w2UafYBQAKGiO10YFA9UPSoXy7rCGqSkkvPcJgQNqOKZ9aRONVdz8a4MZEyDehg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6301

Currently, type inference of the initialized type is done by use the
function calling syntax `PATH::__pin_data` or `PATH::__init_data` to obtain
the required init data type, without needing the user to explicitly mention
all generics. Switch to always use `HasInitData::__init_data` to provide
that inference, which will not produce method-not-found errors as it is
always available.

Change `__pin_data` to take `InitData<Self>` as the receiver, so for types
that require `HasPinData`, `HasPinData::__pin_data(data)` can be used to
obtain the needed type without having to mention the user-provided path
again. The expanded code also uses the span of the type, so diagnostics
will hint to user that the type is causing the issue.

With this change, the error message when `HasPinData` is not implemented
changes from

    error[E0599]: no associated function or constant named `__pin_data` found for struct `Foo` in the current scope
     --> tests/ui/compile-fail/init/missing_pin_data.rs:9:9
      |
    3 | struct Foo {
      | ---------- associated function or constant `__pin_data` not found for this struct
    ...
    9 |         pin_init!(Self { a: 42 })
      |         ^^^^^^^^^^^^^^^^^^^^^^^^^ associated function or constant not found in `Foo`
      |
      = help: items from traits can only be used if the trait is implemented and in scope
      = note: the following trait defines an item `__pin_data`, perhaps you need to implement it:
              candidate #1: `pin_init::__internal::HasPinData`

to

    error[E0277]: the trait bound `Foo: pin_init::__internal::HasPinData` is not satisfied
     --> tests/ui/compile-fail/init/missing_pin_data.rs:9:19
      |
    9 |         pin_init!(Self { a: 42 })
      |                   ^^^^ unsatisfied trait bound
      |
    help: the trait `pin_init::__internal::HasPinData` is not implemented for `Foo`
     --> tests/ui/compile-fail/init/missing_pin_data.rs:3:1
      |
    3 | struct Foo {
      | ^^^^^^^^^^

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     | 22 ++++++++++++----------
 rust/pin-init/internal/src/pin_data.rs |  2 +-
 rust/pin-init/src/__internal.rs        |  2 +-
 rust/pin-init/src/lib.rs               |  3 ++-
 4 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 1957be83a196..e98182c65447 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -269,18 +269,17 @@ fn expand(
         },
         |(_, err)| Box::new(err),
     );
-    let (has_data_trait, get_data, init_from_closure) = if pinned {
+    let (get_pin_data, init_from_closure) = if pinned {
         (
-            format_ident!("HasPinData"),
-            format_ident!("__pin_data"),
+            Some(
+                quote_spanned! { path.span().resolved_at(Span::mixed_site()) =>
+                    let data = ::pin_init::__internal::HasPinData::__pin_data(data);
+                },
+            ),
             format_ident!("pin_init_from_closure"),
         )
     } else {
-        (
-            format_ident!("HasInitData"),
-            format_ident!("__init_data"),
-            format_ident!("init_from_closure"),
-        )
+        (None, format_ident!("init_from_closure"))
     };
     let init_kind = get_init_kind(rest, dcx);
     let zeroable_check = match init_kind {
@@ -313,11 +312,14 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     Ok(quote_spanned! { Span::mixed_site() => {
         // Get the data about fields from the supplied type.
         let data = {
-            use ::pin_init::__internal::#has_data_trait;
+            use ::pin_init::__internal::HasInitData;
             // Can't use `<#path as #has_data_trait>::#get_data`, since the user is able to omit
             // generics (which need to be present with that syntax).
-            #path::#get_data()
+            #path::__init_data()
         };
+
+        #get_pin_data
+
         // Ensure that `data` really is of type `data` and help with type inference:
         let init = data.__make_closure::<_, #error>(
             move |slot| {
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 30d9b8b54d8a..a12e5a44a512 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -538,7 +538,7 @@ unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #struct_name #
             type PinData = __ThePinData #ty_generics;
 
             #[inline]
-            fn __pin_data() -> Self::PinData {
+            fn __pin_data(_: ::pin_init::__internal::InitData<Self>) -> Self::PinData {
                 __ThePinData { __phantom: ::pin_init::__internal::PhantomInvariant::new() }
             }
         }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 15eca4869bc3..f236db47d18b 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -86,7 +86,7 @@ pub unsafe fn new() -> Self {
 pub unsafe trait HasPinData {
     type PinData;
 
-    fn __pin_data() -> Self::PinData;
+    fn __pin_data(_: InitData<Self>) -> Self::PinData;
 }
 
 /// This trait is automatically implemented for every type.
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 4110590348c6..319485dc18ce 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -920,7 +920,8 @@ macro_rules! assert_pinned {
     ($ty:ty, $field:ident, $field_ty:ty, inline) => {
         // SAFETY: This code is unreachable.
         let _ = move |ptr: *mut $ty| unsafe {
-            let data = <$ty as $crate::__internal::HasPinData>::__pin_data();
+            let data = <$ty as $crate::__internal::HasInitData>::__init_data();
+            let data = $crate::__internal::HasPinData::__pin_data(data);
             _ = data
                 .$field(ptr)
                 .init($crate::__internal::AlwaysFail::<$field_ty>::new());

-- 
2.54.0

