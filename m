Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021079.outbound.protection.outlook.com [52.101.95.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4FE49892C;
	Thu,  8 Oct 2026 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462261; cv=fail; b=e7Ip8AMBVmVQnZHhk0LiJVMN0vcL8uL3zkaeQgv5uParcfz9Gt+vdMEy4caoOYqCsUxhJHMws+cRY12pZdtnqib7AJU3RcPhRvheMGLvUUytBPmUN9LDwo4xvSDtuq4QJCkhScafH/B0c8MGLgrHRd4eEctxc4NNu6IA6fUeV6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462261; c=relaxed/simple;
	bh=umz5dI693yqE8aaqdo1tjCnmy18+Sysw/gODqA+oMmo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KLAKrzARCOiVBXuMOWfzaNURwzac9fYQc1siZdbXh5tU/incFS68z6EPb5eFOIg3sm22gGd6IxKUz8Ep9Ts2CkI93PePJzfgZg8y7qnnyIE0DiEPWE+GRTsSAJbs5LK+EYHR+uEr3p8ylD8khhv8RFyvGzyPuTFljHx2W7lJsIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LbHqX/KL; arc=fail smtp.client-ip=52.101.95.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LbHqX/KL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9j62YYXGjO/JkoO6x3WmhWtajecwLA3WfUDFYn13Cn6HgMcs+6nvjLoWDur4CZJzCS1ApZrr6TyrxbhM+M4ZeO7/BJoiNd4NM2Xn81wW66J23PNye56m197QvDa1YN9EK90OJgxkY4BZ3ysrdkqRUncdp6Uy0iARGou9CFqTk2+IksQF/LLBkb6yfCWBTfc5FKylx7tEAE3AOVu54U7kHvjbulNN7Iho06/CeYLrGFeirK6IAZGWCuYOTtQItQQ3DhWG47Us5xMoYhblxtQYx8b+ZyYM5/kuK3EKQNinTJEwl9MaqL7jN0Bv6jvmf44fxkhsfcGl0bcAVxxbfTrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtrHN6NZUfw5AU/JWZO1jkQDG/NS3Vr71hTFdIJz5YY=;
 b=CTue9dyMubMPUKCt33Js/6vy21QnEbRSS0LEsxfkEBzy5gMpZBfEtAW5REEDQIrDd1Urv1Jk6412Cd0gG3Eu2lG6zyfoEQKoIiIXfP9C4j1j3W/iqGcO5sP5fsuzrvZbhBt2IgYQVb797OHFdgPs0MPy7GI8aGAF7cngS568QLSq57/fj+csGq6eNG6VxvdM3wBKRyX4zclsQKhOVS70KXFGXTD2evKSiJ/gKG5ZBnzW5dE3ruxUHzb1GAT3DBzcp+3el7XOmpcyQ9ieMnHIEXXbI2R3idkEFz7490H4ZemvFU1pQLEw93RBFC9bhfHiQiD3rG1BD2jcSZrxVkBekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtrHN6NZUfw5AU/JWZO1jkQDG/NS3Vr71hTFdIJz5YY=;
 b=LbHqX/KL140QuGs5VxdXK0jvZidzHXIeni/YMeDDXHto+eVQQn9kxHxnuJExuU86ShG9dugQ0O3pD2Wm2u3QY0c/9STLD0TdAVyjZPSw4qiVnMQp6ZeUz36B5z9gkhCifL09TF66oZSsdhECeGhyy89LDgoD57MDLY4oNGKOee0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:16 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:16 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:48 +0200
Subject: [PATCH 01/20] kbuild: rust: allow `clippy::comparison_chain`
 globally
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-1-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=gary@garyguo.net;
 h=from:subject:message-id; bh=umz5dI693yqE8aaqdo1tjCnmy18+Sysw/gODqA+oMmo=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7Ux3nHpvbsrn1zTT1tqRbIWqzpxllPPkkvGjrl
 r9LrVfeUFjUUcrCIMbFICumyOLRzZi2iXG27GWt8pcwc1iZQIYwcHEKwET+bWZkWLtqnY/q1nWF
 gaF7Jtw7ymzAf2gpX3V8SCNr5vNIlY7FEQx/hYSqTmv4P0/bIl6m3tPs1f8oc7OVnfeNjU03nmS
 uCw3nAgAKvEik
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
X-MS-Office365-Filtering-Correlation-Id: 0b738714-943b-4448-0f96-08df253711b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	znFdwz1DGFLberpvreJJD9u9JCXg7uvyuI91NFQVvw0ME9RHWwr3+8lOU5u1BuN+d0Jcu3UBR6vwG9yf5KFY1d6+DI1KFy/K9inhvTltKWAC8I2CNqRfrzynpUdAq8x6fvr5Z6XzC8JGECxxycnoQDJfaxL1yjhZ21ki2YQpKj7FAQhTXFeIO9xXHrw9TOJICX+4YzUs6sj7WLuTP4UJYuOs8ECd7/yVDR3/BO+toTwRqN6znDUQgEWTUl8NeDEIsoaNQlQCaBiN2Ms9P3t2rXUjZckoiq37HaJC7UZuZoXa8PzFjJdhNXIoWarZAn6IXBPmuHC/ECKElqIEGnzntKk5qDNNsCLk3fCgwLWmgnVuU4JysR8gJ6ukm0Vy0DPFrQdg1tpIT4+0yVZ10MXMCUIjZ/1AGiQd77UhIY4Vuweb+wFqPfwPT5DkHW/ZHBBNK0UNmFpNJuk2qpOtNX+UDrcGYHTERMn5DwOiUID+w1o5HnWALn9ys+Kl9RRrK0PlvB32lbCdalevLpv3IuJlMknTKVlJ5unqUoxZQ5yguBvRK/qVj1SP+du7fc4NvBAynTpFbDhtdT2MwHRJYdFo6SNwlqkmTRdz2AiybyMwj3uLi41cMXGmMz6X1kl/OJgCq8AwPFzyQjRci9WyIl/tRfwa1uh9ntFOzK3t9DrbAbASu0tCKKHCyhF6n02a8EPWZLdIhP7iWtJqRA/lg9BUpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlIxb2t2L29zNXlweERNdExDTm10ZTFrZ2owUUkyNVkycnVYK3RWdUZFcGk1?=
 =?utf-8?B?MUkxek1rNTF2U3NqUnJ1NXhxZGo0empDS3hnZHdjNXpodnRnSnVYS0gzbzNR?=
 =?utf-8?B?d0loZzVnbFNnazFPSXo4RTJLS05JbktKMUpmdzRsMWluR0dBWGsrbjlOYXdq?=
 =?utf-8?B?cFBNSVVIRGJaeGVzWWRXZS9Ha1ZXTm1uQUxMOTJNQTJvTzE3eFdRVTljQ2Uw?=
 =?utf-8?B?OFg1ZFJGYUtyNnFQbWdWaWk0NGFLd3hDUjRSZ1BGc0VCdWEyQTJLaFZvYnI5?=
 =?utf-8?B?b0U4dDRjMytNTmtWNjZpNEE4VVp2TldpakVOWm1zVDJpYVA0Z0JiYks5dVJp?=
 =?utf-8?B?Y2FEZUVwT0hYSk5UaUpaYUpreUpES29EbTdLNWZEakJEYlZTUkxHRlRid244?=
 =?utf-8?B?NTAwN1dpYlhvNXozODUvWkl3TlB6eXluWVFiSUZkYUIzaitMMFQweE5wTTVz?=
 =?utf-8?B?dEJRVDJQeVhuLzhCdUFIdHI2aGxGcXM3K3JQb0Q5elhXcEVCRUVPRVpyQmRI?=
 =?utf-8?B?alpEaFVzcE9yYzZOSXJsS3BBRnlYajFzcTQvYklyWlFRMEI4RmFrOEpRVUhI?=
 =?utf-8?B?U1R6QzNYUWtKblgyMDhBejNkWmRsNnpSV2swaFRuZW1ybFFMbklGL0VFaTMr?=
 =?utf-8?B?UEcyN0tHR2RLSWlEQ1JHQ0Z2QW9BMUpDZHJDZVZ4bjFUaXVDZEFvQzZnOWxI?=
 =?utf-8?B?TmR4YkRrM283S3QweHQ4N1FjZkVqVG10MnAyaVI5bExPdkRUUGtnd0ZQcURC?=
 =?utf-8?B?Vzl6dXMzaGd3V01BKzVINWtsZ0V4UElna1gvUXl4VnFLeHBtQWZFa2dkQkNl?=
 =?utf-8?B?dnF4UVZ1TEdla2lya1J2c2VYZnZtd1VJS2JLQkxrQXJjTG1kbzd6SUE3enlJ?=
 =?utf-8?B?cDd0a0dQK0QvV00yd1BMVEgxUFRYRHJXRmI1L3hPN09GUWVsdU53dzhxQ2la?=
 =?utf-8?B?eUc3dDM0YWp0bFBnL1NKcVZSOE9hdXBQVXY5QkNPM0EwSDNPczJUTk4xNzk5?=
 =?utf-8?B?Q0c0dytCbHJja1RLS0ZLZ0cxK0oxd3VDYXRxMERheXJiU0t0QmZEelB6ZFV2?=
 =?utf-8?B?S1JQTUZsSW1BMHJoVTVkM2Z6SXkwWE9YWTEwYU4xQ25VOC9aR2lVd24vcDVZ?=
 =?utf-8?B?UWk3bFR3YjF3WHorMEo1c3hoTnNHU3QzdmRiZDlvWjljK3lSRmlpaWtrQ3Vp?=
 =?utf-8?B?dmJMYmVJSm5CcHdJRnFoRU1VazlSejZzOURyWWVWZVRjM2h0YnVFcW9ZMEFO?=
 =?utf-8?B?RkdXbW52UjhVSEpSbmNDbmFKMU9tbnV6S3o4OVViS0laZXRSa0J5YVIyS0w2?=
 =?utf-8?B?SkxDWDA5U3J5c1c4VTgyS2hRUzlQMDNSYUNkTW1wd1JmbU1LOVlMRFRWaXh2?=
 =?utf-8?B?ZnVEdjFvUnRmS3NLb0VUS3NudTY2SDF3dDM4dHhjdGdjMkFPMFA4alhDcjBs?=
 =?utf-8?B?TTBqaEx3SGcrc0xQYlFnTnFKTTRqeDcreFBOSGt0Si9Cb2RHUTZsckEwSUho?=
 =?utf-8?B?TzVWOW4xd0ZtTC9pdHVEYkZ1ak5rcmE2dER6a1JIZmt4R1V0cTJGYkJqZ2lt?=
 =?utf-8?B?N24wdlMzbW1YYzFSc2FmWU0yMWJYT2g0L09EN08rbGJnSzVsT2hnTGwzOTdy?=
 =?utf-8?B?c1VVdWlub1lYNC9sL0dBazJTaG1VckxjMHM1TFVISEVkQVA5ZDFOWkdXYnJ3?=
 =?utf-8?B?TGN5Zk12Smk3c1pIazR3QjJHTnRudzRCT3pHZFMvb3pCRHJxTVJEUm9tUy9Y?=
 =?utf-8?B?a2U3dEZQQ0JiWDczeTQ0MnRlMldhamZRUk9WZ3d2TlUvVkpnUkNaRURuNUtV?=
 =?utf-8?B?eGpEVk1wNk5US2ZlM1dJejcxaURJODZTR3A0MEhpUkFybllxV2FtMkErWXR6?=
 =?utf-8?B?YWxnNGE3VHZsemlFSjMrcFNQYTJIOEltRkJ0K1dOOVZDeVNDV1RodVMwby9F?=
 =?utf-8?B?My9yNmMvY0dFaFY2M2hSUSt4M2wyaWVMMi9sS2xwSTJla2JPUUhnTU5qbkoz?=
 =?utf-8?B?RUROWE9CclVsemRlM1I3OHIrVGJkbmVCTVpxOEZyeWdReWZHQjlqazFpb0tY?=
 =?utf-8?B?OUh1VWtHZk9yb3A2bFM1dHBHTnk3Q2p4NGpxcW54bzE1U2UrVDc4ZmhXQTNR?=
 =?utf-8?B?c3JqdnM1WUR4Mjg1US9tWnR6ak1OeWkrTnpPZ2JSSm4xTTZERkJBbWVLdEZw?=
 =?utf-8?B?MEhrY2ZpNWlDYmNkRnpuMkR1TWVxOE8yUExWdnRwMFNFb1QvclFVNGZwVUVF?=
 =?utf-8?B?QlZ6Z0RDTmEyVHhiZEp4U093UWJxemxxdHBualhWeWRHRmhlbGExQXM1Qi9P?=
 =?utf-8?B?RTJMNHRsMWZJekRHNE8xRis0d1IwbGVuUTFEckRScHpRdi9aTXpsZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b738714-943b-4448-0f96-08df253711b6
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:16.1215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9br9bgVfmrutm9WXW6T5o52mSQQLj7nwPXwnWTY0T1XkYgxulaSG4UZmQw0S5k0eDt8uVLg9RLoumyfDQd41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

The lint would suggest comparison chains to be converted to match on
`Ordering` instead. The suggestions do not always produce more readable
code, and also it can produce false-positive when not all ordering has a
branch.

The issue is known upstream and thus it has been downgraded from style
lints to pedantic lints, which makes it allow-by-default since Rust 1.87.0.
The current kernel MSRV is 1.85.0, and thus the lint still triggers; allow
it globally to match the updated upstream behaviour.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 0f1b80100b47..2839c6c5045b 100644
--- a/Makefile
+++ b/Makefile
@@ -476,6 +476,7 @@ KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 # These flags apply to all Rust code in the tree, including the kernel and
 # host programs.
 #
+# `-Aclippy::comparison_chain`: the lint has been demoted since 1.87.
 # `-Aclippy::unwrap_or_default`: the lint is buggy [1] and ignores our
 # MSRV. It can trigger depending on the optimization level.
 # [1] https://github.com/rust-lang/rust-clippy/issues/17379
@@ -494,6 +495,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::cast_lossless \
 			    -Aclippy::collapsible_if \
 			    -Aclippy::collapsible_match \
+			    -Aclippy::comparison_chain \
 			    -Wclippy::ignored_unit_patterns \
 			    -Aclippy::incompatible_msrv \
 			    -Wclippy::mut_mut \

-- 
2.54.0

