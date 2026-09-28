Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022083.outbound.protection.outlook.com [52.101.101.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3A4E36D8;
	Mon, 28 Sep 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616765; cv=fail; b=d5qeKmhHFHICaX5qEOCv0pJbGUPQgHbI45UFYLhM1vXeOr+RICjpIIp6swWFfvek44mGuwFVdF07a/NFb6qahyu7bANLvELgKYuVuHXpBxmT99TvPI7vdrljFwLUVPQ2DyvN9ujZAuUrNrmZwtj3GtC43dH26VMbrxNBTaz3gEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616765; c=relaxed/simple;
	bh=I/i53pf39Ox8h3S2gk581a4j8ztAw8DIVR6NGBCOuDw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=vAzWgmPzNlec6kt5T/sqoCmR4tZt58uSJRKoWzY3cBfikGQY45ccIgnJ903EPalnhOzg1aIAoqBZ1DTPU9I8S082OzWa+LuJjRTKMlLj79kmrQDVAPHr5flN5LCfAXXRWkCu6jA6n1T5RW8RaUDWd1pn1yw+haw/DbejWG3ZAXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pMdtLvv2; arc=fail smtp.client-ip=52.101.101.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pMdtLvv2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ll23i6Ip2q4H227uiyN+fQl1zwC+13a+1tVMV481EzBPZmAld5JKI3ky1/pr9fX35eA0s0uUq7V9ibKsjI5ej7kFbpaGMxFf5XsRQ04AbrxV6upb2pnOqOFZNaIBGBF06lUUi0G2jjfvIecDEvV0txeJCmjzqxLphEWZl0lVCLtS2dHg3nnxHMv1L61DYYvyBrhFXNhoGMGZnAqYJSgwvy4ITguomC0Jp+Ab6Qsh/eIvX/yp66H+ujAZVM19zCpXnh8p9i1KyhBO/ZYhCvU1MypL/f8WmotlkcpK30g3tK704g9iYqKxICdnvoHKL0lw629FJX1PkW0sDKeDJ6lD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkSMFg2q60M0rf8tHG5iEgsnjqurw635Et68lICB8wk=;
 b=T/vdtIAUYcqKMiGMzc2tpUOXTnzQO2ex6ONrD/t6KT4n2keaF7JEze+PqHZadVo1ZTlOt19GvEZpJ77ci2bmGvvB0UNGAR48eLjVmtK3o2+sq42moh4FYuMSL34XrdTt9ruJZGi6iiwIDbDJncLuGDNQQEyU6h9kYOk/hKz/mgO9K3X1gkudWNjuB9B/lEzv7oFEhwBy7R1rLe2RMELFz/fwVIxeOMBb2wOrT4xwCQogui/ZmGav11d1C81PlhJFBSklK9MlMUMr2Q+rZyRw/4s4pjcN8NEeufVZjutS3AKs1SR7mNoXVjgL8ANCxlzfW6g5BUP4DyBmr8AexYESNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkSMFg2q60M0rf8tHG5iEgsnjqurw635Et68lICB8wk=;
 b=pMdtLvv2OoD3gr8MfZuTuG2HqPQlCNuRysrVxX4SF3znGlvQq4bLIwmN9F/s/RI0Ujk5SJO3q+wrSdiC3r6AqEs9jo5uUHa6cB5HcwNouJnwVKzzQkJ/BbAP80k3F7uYCq/+AbTr5z/PYuKUTIrukhcOEglWRN0OIozT/cPwl1M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6824.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:348::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:32:28 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:32:28 +0000
From: Gary Guo <gary@garyguo.net>
Date: Mon, 28 Sep 2026 18:32:19 +0100
Subject: [PATCH 1/3] rust: pin-init: internal: init: allow reborrow of
 `Pin<&mut T>` bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dev-pin-init-sync-v1-1-e591c8e9cf0e@garyguo.net>
References: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
In-Reply-To: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790616744; l=1943;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=I/i53pf39Ox8h3S2gk581a4j8ztAw8DIVR6NGBCOuDw=;
 b=o7D3FIDWwkP6+MSMKOTtaRqq318ezYi8zMe9z0AyLNn5y8NG7criV3cAD46h6V8VUxm5hzLkC
 pYuDyolP2iCCR1TIwVvGx4FEzdilVEiXse0oFi0kDFHczMfoNfwfnrC
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 3207e665-4aeb-4c58-06a3-08df1d867628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|376014|7416014|921020|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MVVFfXCm2d7GEMDpzEGzbFBdYTGFS4HfMVcNIiR36Wl9oWf46oBXOzXHSr/KjEPKBwgXkHVzdKn4twsny5djQ/K/0PJ34G40Qq68ClTDXoNm4n0+9BcXRrkv0EmBCvGjRIkckZCVIbfIMn0o3+wbO7k0NKpZ0380z1oTHj3ApzjCXJIb1CrFlSELXtPPhgkPrGFCp6/tgOS3ABAbec86FL0A18mOfDkFHN221fzV/FS5r+41CO3y/fTUKBTqp8Qe7/BMfbOZBvsOZ05tldAgb0L5ZAtwU4XQyWasDR+CpOC+xMBqu7KHf5nO7lbY4a1atnT8FRWra7l7Cs6OdIlBBZfEzn7QP2XxfgOE42ee+tqfMOCxVZCvRczb0uWlJ2RKP3omFZhhXKfoj6YpSs7icvRTl1VzdI+bhNx0gfrOuy5yluOZlPoHjeq/271gKfdVlbxxYfsS3y8EH/Ur0QAndL3aR0aSgoNfcxytLGLX4q9PV+U00FAkzTMVyEdAOu7IQ7SopxCpN1b4CgyIbolGrY11gTN8fORqBPMxSHippaI0V9uiWyK3Z+v8k1ESpcF/59h1CIHL7/XZt+y1sy2b91yjOYbmZuxqnRSLL230T2fIrf13545QKU9mxEQUlV8JQ4UThDxDATluRZkWXXvOqt7ej2xOLXVSxL5hH8Jr9K8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(7416014)(921020)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b21ncmJzY3pUZGk0S2hYck0rbnJ3a3Y2VGRtTTFZTW9wZTdUdnl2YUl4SUpH?=
 =?utf-8?B?Sk1GYnE0QTVic1BhV0RiaWd6am1YUFJ4TXovZVJhTVN1OEFKaVhzVG5IOVZi?=
 =?utf-8?B?b3ZyRXRaSWdwT1JMZGw2Tk9qRE1wbVlZM0tFU3VBSjhrZ1hBUHcyL0dyZWZu?=
 =?utf-8?B?cWxjM1BlN0kyZi9YUDZmTkMraGNwM1k3YVB1Nnd3bnZrWE9qWHBZTFFDT0RZ?=
 =?utf-8?B?YWRhWDJwaE9Rc2xVOUs4L1k0SFFoUEZlZDNEWkY0QXEwcFFlbFdWT29JRHRp?=
 =?utf-8?B?S2M4UmwyUzN5d29jSmZ2YXM0S2gzTExNb2R0UkQzTVFZUW4zYWk0d09KZHJD?=
 =?utf-8?B?MlRJSzg3YjJsQ2tCa01YVGE0Q3dsaU4rYWk4RTZMcXJla3RuWEh6OWJkZkd0?=
 =?utf-8?B?eHR4dEZEUmhvV0JzK3h4dlRZVUszUFJOT3RGYVRtM1Ftci9UdUxzV0U2cmFp?=
 =?utf-8?B?RU9nWFgxbkVRVWV6UUpjYXp4WHVjYWp3OUNRQVRPNVptOHhIdWtMK0tyUVNH?=
 =?utf-8?B?QSsyeEJTT1RaTk9sRjBXWG1TcVdVWWYyNUpMeUoxaUJVL1RGVTExQUhhNEw5?=
 =?utf-8?B?Y3hrZE1LbUVKNkt1ODRrNmJ2R1pNaWlOMHhNOWdPUWd0Y1NFUGlvanE1YjB6?=
 =?utf-8?B?UjJoK2psNEQrL0tSUDdvYXV0NFhXNUVGS0FNei9EVkc0V1V5VVU2aGZCN2VW?=
 =?utf-8?B?SDFTdkJxKzAyRkxVcjQrUnM4VEJyWTBhL09NQzdNQm5yV1I2bXZoWnM3WmxS?=
 =?utf-8?B?bmkrUDk4dTV6S0hvMFBpSU9nTDdWbGxnQTBwS3lLak9ZVTNXZFM2NnBJZXdQ?=
 =?utf-8?B?N0UxeFdJTFpnUkRSc1RyNWgwQ1JDYVFjQ1JqRUVIQk0wbzZUT3NMVG9aQk1r?=
 =?utf-8?B?SllZZmN2RkRxQUt0b0Z3dmVJL3oxZlRhTlhJSkxxR1UwVCtBREUwUEF5Qmxz?=
 =?utf-8?B?OGVxMGdnY0hEcU1qd09CNVNxeWx6ZXZrckU2THFZYWtaREpLdTVmRTU0RmpN?=
 =?utf-8?B?TTgyaFFjcUthWHk1bmV3ZUdxb1J0VWFKSGUzQnpOVGNnUmRXY05Vek1CMS85?=
 =?utf-8?B?MjA0Qm15NUJCUEhKaFA5RkF5YXZjRlE5UW5mNm1Td3pDYmJOWU03Y0J0ampn?=
 =?utf-8?B?WWtuaHpUNTVWdnN4d2JpWFE5NDZOOFgvQXROVGRvYnpCVTV2R0pDZkhZV0R5?=
 =?utf-8?B?YUhkUnd0Z1JSOUl3RnpmSFBDY0R1bXREQ2tLRVNnS2xoY01PTTdLaHVUaWV3?=
 =?utf-8?B?WTRPSHIwODV6SWhVdFJkNzRFdjNCNUpLWFhaeEJRaytXNUR0T2xiWlZkcFBn?=
 =?utf-8?B?S0ZweUtHaWkyVWRYZDExbzZxZGtqSG5kMWovVUJ0YytiQVdTV3IxSDRHb1p0?=
 =?utf-8?B?eTFDamxGTlFMeDl6dFN1ZUlNZkhrclZpZlRUZW8vaE02eFRqK285dTcvanlU?=
 =?utf-8?B?MlZtOCtRc2c3Y2tsVTJUam9LVFZ3T0FWYXVFSnRpSXZtakt3TFJ1TXB6Q3B5?=
 =?utf-8?B?RERkb2pzZ1lMdlArczBrNFVJUnV6ZmlXeVpDN1dHNFJYMFBLbGFPT1k5SElR?=
 =?utf-8?B?K2I0T3JtR3BsTDBoUlFOM0dhQUhIaGlFNUpkQTNMSWFwaXFmU0lOWjFRYUdm?=
 =?utf-8?B?NWVuNnoyNlVuakU5TTh4ejZkWUF6UGRRVzFzdW5iaU1Oczg3UjEyVExKdjEx?=
 =?utf-8?B?UEZFbEZTRTJyS0xkQ2wwQ0taRWlLakJaTXJYaEQzM2p5M0Y5WTVqdVNxMi8r?=
 =?utf-8?B?czk0VVBOQ3pJOWUzbUdqL21ZcE9TMk9nVmZ1MXNyN0FEdHBYOG9mdlpCUHFr?=
 =?utf-8?B?QjN5bXVGWGhJaVBkT1o5cE11dmg4R3hyZnRkN3VrZXVLYkNJaXdydS9PTkNQ?=
 =?utf-8?B?SEIySWZXRDVDMjhQVTFKL2lMVlJSYjVmbmtpU2dkdmplVnliU3oxWnEwb3JX?=
 =?utf-8?B?WERuNWlCUGRwQ2NGaFBXUTlwNGJPVlRkc2JTeVoxTnNTUEsvVHJPaE9DWU15?=
 =?utf-8?B?MHNLbzRwc2IvbWNaM3VUQ1hxa1l4dEh5Y1NXWUZjYStCai9neE1oRUNTUWJp?=
 =?utf-8?B?bWhmNzhVSkl2Q2c0QThaV3NGUW1GRkg1eTFUSlRCL3I1clR0Tms2Tnc2WG5T?=
 =?utf-8?B?dVV4K1QrQlN5TlYzZEhEckc3bnM3VjgxUEVHUnpPOG5acnpvWHZUVmJLQ0pl?=
 =?utf-8?B?Y3BYVGdwd2xKZ3ZsT3NqUnJnVzJRS2ZmKzhPSnh2bkJlemErSUNPdlQxemEw?=
 =?utf-8?B?bS9QMG9LRzZtY0p3TjB2YVBZL1I3WDl2SGQ0TkZXakJYME1FbkpjVDNjQUJL?=
 =?utf-8?B?dm1WNGk4MFozbnRDN0lPUnZOU1JHSWVzMXdEWkI0UFBpZDM0ZkcxZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3207e665-4aeb-4c58-06a3-08df1d867628
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:32:25.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qms+EA3ziv6dsVfXt2AARC5l1rWgrLhU5YU6C3Paq79hCWEDhQ8sYsmqDUDzRDmigkvomcpxBucHPARFoc20+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6824

Use `let mut` for created bindings of initialized field, so `Pin<&mut T>`
bindings may be reborrowed in subsequent initializers or code blocks.

Without `let mut`, attempt to reborrow can produce error (and also a
confusing fix):

    error[E0596]: cannot borrow `gpu` as mutable, as it is not declared as mutable
       --> drivers/gpu/nova-core/driver.rs:129:17
        |
    129 |                 gpu.as_mut().run_selftests(pdev);
        |                 ^^^ cannot borrow as mutable
        |
    help: consider changing this to be mutable                                                                                                                                                                                  |
    119 |             mut gpu <- Gpu::new(
        |             +++

    error: aborting due to 1 previous error

Reported-by: Danilo Krummrich <dakr@kernel.org>
Closes: https://lore.kernel.org/nova-gpu/DLQXWXRP3P1J.28SLFOJJQ2EDK@kernel.org/
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index c5b5a0ce5c4e..4e77c7af86f9 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -446,7 +446,8 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
                 // Allow `non_snake_case` since the same warning is going to be reported for the
                 // struct field.
                 #[allow(unused_variables, non_snake_case)]
-                let #ident = #guard.let_binding();
+                // Include `mut` so that `Pin<&mut T>` bindings can be reborrowed via `.as_mut()`.
+                let mut #ident = #guard.let_binding();
             },
             Member::Unnamed(_) => quote!(),
         };

-- 
2.54.0

