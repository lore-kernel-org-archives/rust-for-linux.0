Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022118.outbound.protection.outlook.com [52.101.101.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25303DA7D9;
	Fri,  3 Jul 2026 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086464; cv=fail; b=eUlhfZQ9dWPjVxzgacCtKAPKuA4/E1NrZdYMK2WR2R95VSoFDLuU1l9iLyZawzt6BJj4JkCs9XzPZqNvroJGhdoz23WCoLcVEn0vUHsP5q1yCQOkXi6/soHRBAOCU88F32Z9RUjlZPbIEMWq7I/bEd/wc62fclal7JYG790yPVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086464; c=relaxed/simple;
	bh=mDpVdhOmrpvZNwVS4aLQT4hqtCY3ELL85uHg6nKymTE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CrwheM/jdMXNnYGYG/hJhb0CBqvsGHQHScngDPGIwv2C7sLHArIFR4AzPLwQUraGfEQLzS1rK7mtbucAFDG5NUeQxPe2JtVFftsecuYQ5gtQrzanOEaFAM+Vo6Plm4ofU2s/w0LOSQwXIFi+7xThC1QPcAXsbvZ/vnAysszhcs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cUrlXGsR; arc=fail smtp.client-ip=52.101.101.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cUrlXGsR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1NjMwv7fWtIuamWlpZwAOAPThbRldSNINAksdPRKzG8nKECScy/p9IJqR9ugxasV7IoW/Ol1ye6w+Fnt1oXp8nY+bS+rRKs9Xbsj6KgoAJRTcrggCZbg9zp7DaQLgOiIZPUVoZbrvy56cJHU2h1UGVwqnvoyut+ROXdPnUITmWG1bLPkmYUSDo5J1UiUVK4t6X9C9QzZ+JRxHIF7/1pW1W4S5hXLsYCuXtd5Of4t8mGPbzMg8lzXiagQM+8qp1xELoYuZ1Ra5LPvnnYSNxXx6Ogq2zJaZOW8SExmKz5ZvKAiDS4Q2szQM+W855zJ2S1g141UWf2IhVispQVLwZnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeXDBqaZTNi+iE/pOQv8spo0XqEEdwKXNo9fgs8h5M4=;
 b=XOHTiJ4QNH2e578aKpX7+kMeUNG4uhgJh1mYngzcbuy41FtZZAFiBAEbDDP6Po142VMUbz+DShTI9eEL7/oQ32S0ru1fqtFRyR93u5cgmb6k54eE55RwQTuQzJMfXa09456Bvkzz/Xt6YZ0+go6veLpYEUcqG7ULC/FWtYa65yRfsZVgvRoFgiWLxI5JE/OpeyAzIoZ57Ayjsa874EgKPtBg4pclogL9Q62O2TzGQvKcqmt7Y46rOAQ4iaG42KvfnNzaggvwmBCiwolSWF6AUJzPbH/iQJ11rdwLyy2Vh2HF4C2LVHJPmuAuvqAhWIQn5MF8ClzwkgJtzDN1GSwpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeXDBqaZTNi+iE/pOQv8spo0XqEEdwKXNo9fgs8h5M4=;
 b=cUrlXGsRWcuWEH0Bky4/D6eSssyehg94+1x7sBEay2fHW89Yv2Bt8cZQM1um69HLlGjFE7DZvGmofnHCARvpvBi9lT3p7BvPXbV3xJGb624kEr/NoL66xRfm7KtAaddhYjNU+XzAtWWlNYD/5CG0PR9eA5zXt6ZBR3KpvT3Yf3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7305.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 13:47:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 13:47:32 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 03 Jul 2026 14:47:27 +0100
Subject: [PATCH RFC 2/2] lockdep: delegate Rust lock class printing to Rust
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rust_lockdep-v1-2-1c21c62d0341@garyguo.net>
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
In-Reply-To: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
To: Boqun Feng <boqun@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Lyude Paul <lyude@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783086451; l=6862;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=mDpVdhOmrpvZNwVS4aLQT4hqtCY3ELL85uHg6nKymTE=;
 b=6m5A4zPP54DIqP3iQqhIM7yLtryCy2eeCJTfkAoNqoRXiciOeFNraEY76jF3Ivr0zeRt+X6EZ
 h/KkHHk44rIAjfKLQQAId+9sYYxuPrf6xowOoL8T/4hL2s8jLOAZ4dQ
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 0793be7e-327b-4b30-6da5-08ded909a1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|7416014|6133799003|18002099003|56012099006|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	kJadFTteNvT6KDcIcRSz1X3Re/8vnpv04JOKHEmQFXSW4Jni/2Ws/QBcqqhG2g13vxmdraTjEhj4pH2UFInFZuEBfXeERmz5EMl/EvdQLFIWkmz98Ff5RDumBlYziWvapPzFAZwV8u4fYTVzjB6oWFAALfuQmw5U0qQXbjrZk7VZPua4eKR2sMICmI33q+mHMTKlwrmiXxyXnmzh5KmL1THOG8+p03V50ejuWen8ijRgEUHPi5sumS4xKcdGQ1E80DPZfJWuVJXHWOXaJDq8epiB4FUxCA+DlcY9IxwTbRLV4HQp6pHfE8vwhsyu+NKBcIr5a8XqGDfxsVt1LMld/nQJ4kP4uIJFZIQ2/3jhwN/MDidIBfvqUD1wBULkCGEGdOVZ4dsd9h2wgW9t5ThB9YcI7CKSSfyW9cxqA/J4gvEIO+zS6L8PMcOKhSKWne/IlEXfNm0u0HX8HPQ1lGmtenVTQrEwC889gGgAdPFMbXbcGmhThLuTIvHhxmI0+VcTlLqMJdByPH5gLYjABD6/prWsuwXTY+23wa8ju4NKNcvR2I6Kn1GwYD3mDdl85sPVtqhMQef1510DGSFWuIpZ7Tps+DCAU6w4DXlToZGoMVyYtI1eGHumtg5CVm+A+rjNJ0uYLyL+FFxohqegj2raQ6ne8hmqwQPiUwj7kiKKhEfFo8uFLoO/MSzoqDJIgSvagLfXvtrkHndsNO9aXvCXLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(7416014)(6133799003)(18002099003)(56012099006)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3YxWUlRU3NTVjNoRHlLdUs2VlFMV0NHcEZBa0NOTis3dTA0NEIrTTlOb0cr?=
 =?utf-8?B?dEVXVVpoREEvZ3VrZERySGpwT1BnZTVnSlVOMmEzTmp4ZTRWVXdLL2Zzcmtz?=
 =?utf-8?B?cFo0WHBHR3gzRkdmbkgxN2x0RUhPTEQyUXRBaFBPVm9QY1NXdFA2WHNBY0VQ?=
 =?utf-8?B?MDR1eld2WmQzZXZlcFhBQUJnUElaM2xET1hDd3NMUkZueWtLMGhZNFJEbFEz?=
 =?utf-8?B?dW1tYitmcU9tcm5EbHAwTzg4VnZ1RUdtemtiait0UnMrajBIb2Q1aHJZUUpu?=
 =?utf-8?B?TitaQnZDSXlkNFVzL1Q3Z0dBdEY4ZVdBL0RoS3Y4QjV4QkxFMnBHbDk0SjNE?=
 =?utf-8?B?OGU3RFpTK0tGL1JWRW1DN3VFTVBYS1BRSWpaQ0pFckozaS9tdThXT2w3bVd3?=
 =?utf-8?B?ZzJwam5QUjdiNXFsSHNpZFhudkdzUkJjNmltdkNyWldEbmtQbE5tRUFON3ZF?=
 =?utf-8?B?VU9VeXhZU3F6NDZlN0ZRNDRtY0tKa2pYeThNVTV4ZWRCeE5xK040SHhzbUFD?=
 =?utf-8?B?dk4xcGRJL2oyQjdNM1JpVWVUQ2kxQUluU2paN04wT0NHU2JIaHdLUWJlYitn?=
 =?utf-8?B?cHQzWDVOdGNsNCtZK3BBMldIY3NvK2JxbUc5WXZBc1Jycm1WV3piajhNaXNF?=
 =?utf-8?B?MkZKSW4zY3BqL2R1cExzTXAzU0s4cWNRWUNod0lxN0VscXR1THJaYU1SaE5R?=
 =?utf-8?B?SG9qcFAyVVlqd1lRdHZnR05teFVyQzhjTXFtSDZrNzVqMm10V3lMb0ZPaHNX?=
 =?utf-8?B?MVh0L3FRc2c4V3lENytLUldMbFlYdURGbGY4ZFRTVDNPVzlhYitHdzdvYWRI?=
 =?utf-8?B?MTFKcFR4ZFYvR3dqT3VSbFZBUzNMRVJOVnFtNU8rdDdaQzZWWUtEcFFPSU50?=
 =?utf-8?B?UGsyaFh3MnAyUi82R1FCRGZxc2krdjdCKzVLU1pBeWNVc2gvYlZCWjRDQngr?=
 =?utf-8?B?SWI5cisxMGtNZzJGSk1ZV3YzblNJYmlkbFFXTzdsbFR1SW9pYjdIdElGWFVL?=
 =?utf-8?B?ZlR1SzFOR3h2VHd6dXZuejNoVk9PRW82RHZUMDQ5VUVJd0JiemNRYUFFU3Bi?=
 =?utf-8?B?NTNHWmRZR0dMamlBdnhGcUdIeWtmRnJBMjVwZVZsOEttb3BURkJlYmUyL3Zu?=
 =?utf-8?B?TGdxUExpSHB2Rkx0UkZQQlFuUXZIV2FydlBmeFRWeFdibGlXWTc1dDBYRDhy?=
 =?utf-8?B?Szh5WmlKNlJ1ZXBTd1I2UWIzQURHRzhVSlFqRDVEMU5IOSszblQyTkwyTGRC?=
 =?utf-8?B?OWZTYm1sa084emNGMHY0TzRuelBjVWN5Y1RMZ2tUWWRrUElaZmhUSW5LSStu?=
 =?utf-8?B?bzNDRStiQitYSVpKSm1wNnk2eDNaKzlFWktkclF0K0R6TG51U0Jjc2wxQ0Iy?=
 =?utf-8?B?VU1yQjN6cmI3eWdjS1F5TEYrVGhwU1QyUHFMOGorbnNHUTVJZ1JRL1dQZ3cx?=
 =?utf-8?B?Umt1QjZzWkY1Zmp6c1RxODRpV3Rob3pnUHFMRGpTQ0RUZ0N5MkpqSTBhakly?=
 =?utf-8?B?ajk4OUxjMTcwRVBFYTliYVZ6RS9Pbkcrc0xWOWJSbXhwSzhPS0VadFppMjVQ?=
 =?utf-8?B?R1FqMmVRR2VkTGFmYXVUU3pwb1ExQXF0RTNQeHBvNTkwT2ZMcWNxTzg2Tk1X?=
 =?utf-8?B?V0dsajlPUllFTGE1eFlYbThzc0owVjJQN1VuRlZRTkY5czVYVEpRbEM2V0JJ?=
 =?utf-8?B?STJpbEVsN2cxdDE1bWlxenlObmMxWUszSUVwUmtxd0FWdURrMmFpQ3J0RENl?=
 =?utf-8?B?Y0RQVnZMekR3T1gwbG5pMlplNXBFVjA5SDdvZW5JRGdpRnFoVDZVSmJ0VlFz?=
 =?utf-8?B?TzJsYlNzNWFJUE5jUEdBTmpKc2g4ODFJZURiZ3Z2SWRlNzNXRysvay9JUHU1?=
 =?utf-8?B?N1FIUmFpdTRmUjhWTjBLWUdFKzVRcTJKVHhxYTdRL3prdEVXUlJTNFhVVHZL?=
 =?utf-8?B?U3d5MTVidlgwNHJSZitLU2hrdVZxLzVsM3B2WlJ6UWNPcWtqOVNyQ3lxQTBq?=
 =?utf-8?B?YURGNjVOenVDdVIzU3BjQkRpazdJZ21XU29lWE9UMmM5YU5ONVV2VVk2Qk1l?=
 =?utf-8?B?QzZTRVJENXRnTm9MRXRyeGxmcHNPVGcyeE1VaCt5bGZmVVFNLzB1RnpkU29L?=
 =?utf-8?B?bXExZGRzRXBJUlZVZUEvRlk5LzhXQUh2aTlWTmZEVmZ3T08reld3bUFkeGhF?=
 =?utf-8?B?V2NtM095R1VGV1Bzd3J0aUk5bDhCK0NSbkFzVVNFSlVBMmJuR3FEYVRsTXdX?=
 =?utf-8?B?T1R3c2JidlhTckFyWndBQnJDdVpad0t1MkttRVF0SlBzRzJvSldibHF5V1Vr?=
 =?utf-8?B?MnlqMlZCK0k5QjhOYjNSWStJT3ZWTHQ2MkdBMHlZZmFNb3ByYVlJQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0793be7e-327b-4b30-6da5-08ded909a1b9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:47:32.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8Sq4arXEvfnG00IEsfIkWQQUQmGN/zLP4PN0edc/EaJohL7sBF5TG1XuUKAYCWyeP0lK71LZO+AL58ZC7pFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7305

Add a special "(rust)" name which means that the lock class comes from Rust
`#[track_caller]` and thus should be delegated to Rust code to print the
name.

This allows locks to be created with usual constructor syntax and does not
need macros anymore.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 kernel/locking/lockdep.c           |  7 ++++++-
 kernel/locking/lockdep_internals.h |  3 +++
 rust/kernel/sync.rs                | 24 ++++++++++++++++++++++++
 rust/kernel/sync/lock.rs           |  8 ++++++++
 rust/kernel/sync/lock/mutex.rs     |  8 ++++----
 rust/kernel/sync/lock/spinlock.rs  |  8 ++++----
 6 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 2d4c5bab5af8..1e05d51e710f 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -724,7 +724,12 @@ static void __print_lock_name(struct held_lock *hlock, struct lock_class *class)
 		name = __get_key_name(class->key, str);
 		printk(KERN_CONT "%s", name);
 	} else {
-		printk(KERN_CONT "%s", name);
+		if (CONFIG_RUST && class->name == lockdep_rust_name)
+			lockdep_print_rust_name((struct lock_class_key *)(
+				class->key - class->subclass
+			));
+		else
+			printk(KERN_CONT "%s", name);
 		if (class->name_version > 1)
 			printk(KERN_CONT "#%d", class->name_version);
 		if (class->subclass)
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 0e5e6ffe91a3..d18d50f7fd99 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -134,6 +134,9 @@ extern void get_usage_chars(struct lock_class *class,
 extern const char *__get_key_name(const struct lockdep_subclass_key *key,
 				  char *str);
 
+extern const char lockdep_rust_name[];
+extern void lockdep_print_rust_name(struct lock_class_key *key);
+
 struct lock_class *lock_chain_get_class(struct lock_chain *chain, int i);
 
 extern unsigned long nr_lock_classes;
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index cf76fb37c460..cf35858469d1 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -8,6 +8,7 @@
 use core::panic::Location;
 
 use crate::{
+    pr_cont,
     prelude::*,
     types::Opaque, //
 };
@@ -150,6 +151,29 @@ fn drop(self: Pin<&mut Self>) {
     }
 }
 
+// We want this to be completely unique so lockdep can identify when lock classes are generated with
+// `new_static` mechanism, hence making this `static` and attach a `link_section` so it cannot be
+// merged with other constants.
+#[export_name = "lockdep_rust_name"]
+#[link_section = ".rodata"]
+static LOCKDEP_RUST_NAME_BYTES: [u8; 7] = *b"(rust)\0";
+
+// This should only be used in conjunction of `LockClassKey::from_caller`.
+const LOCKDEP_RUST_NAME: &CStr = match CStr::from_bytes_with_nul(&LOCKDEP_RUST_NAME_BYTES) {
+    Ok(v) => v,
+    Err(_) => unreachable!(),
+};
+
+#[cfg(CONFIG_LOCKDEP)]
+#[expect(clippy::missing_safety_doc)]
+#[no_mangle]
+unsafe extern "C" fn lockdep_print_rust_name(key: *mut bindings::lock_class_key) {
+    // SAFETY: `rust_print_lockdep_name` is called when the lock name is a reserved value indicating
+    // that the lock_class_key is static and backed by a `Location`.
+    let location = unsafe { &*key.cast::<Location<'_>>() };
+    pr_cont!("{}:{}", location.file(), location.line());
+}
+
 /// Defines a new static lock class and returns a pointer to it.
 ///
 /// # Examples
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 447fec291cdf..66d51c860483 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -127,6 +127,14 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for Lock<T, B> {}
 unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
 impl<T, B: Backend> Lock<T, B> {
+    /// Constructs a new lock initialiser with a custom name.
+    #[inline]
+    #[track_caller]
+    pub fn new(t: impl PinInit<T>) -> impl PinInit<Self> {
+        let key = LockClassKey::from_caller();
+        Self::new_with_lock_class(t, super::LOCKDEP_RUST_NAME, key)
+    }
+
     /// Constructs a new lock initialiser with a custom name.
     #[inline]
     #[track_caller]
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index 3675ce244e08..c730196b9d2d 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -24,8 +24,8 @@ macro_rules! new_mutex {
 ///
 /// Since it may block, [`Mutex`] needs to be used with care in atomic contexts.
 ///
-/// Instances of [`Mutex`] need a lock class and to be pinned. The recommended way to create such
-/// instances is with the [`pin_init`](pin_init::pin_init) and [`new_mutex`] macros.
+/// Instances of [`Mutex`] need to be pinned. You can create such instances with the
+/// [`pin_init`](pin_init::pin_init).
 ///
 /// # Examples
 ///
@@ -33,7 +33,7 @@ macro_rules! new_mutex {
 /// contains an inner struct (`Inner`) that is protected by a mutex.
 ///
 /// ```
-/// use kernel::sync::{new_mutex, Mutex};
+/// use kernel::sync::Mutex;
 ///
 /// struct Inner {
 ///     a: u32,
@@ -51,7 +51,7 @@ macro_rules! new_mutex {
 ///     fn new() -> impl PinInit<Self> {
 ///         pin_init!(Self {
 ///             c: 10,
-///             d <- new_mutex!(Inner { a: 20, b: 30 }),
+///             d <- Mutex::new(Inner { a: 20, b: 30 }),
 ///         })
 ///     }
 /// }
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 091167ceda66..f8bec26f1cee 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -22,8 +22,8 @@ macro_rules! new_spinlock {
 /// one at a time is allowed to progress, the others will block (spinning) until the spinlock is
 /// unlocked, at which point another CPU will be allowed to make progress.
 ///
-/// Instances of [`SpinLock`] need a lock class and to be pinned. The recommended way to create such
-/// instances is with the [`pin_init`](pin_init::pin_init) and [`new_spinlock`] macros.
+/// Instances of [`SpinLock`] need to be pinned. You can create such instances with the
+/// [`pin_init`](pin_init::pin_init).
 ///
 /// # Examples
 ///
@@ -31,7 +31,7 @@ macro_rules! new_spinlock {
 /// contains an inner struct (`Inner`) that is protected by a spinlock.
 ///
 /// ```
-/// use kernel::sync::{new_spinlock, SpinLock};
+/// use kernel::sync::SpinLock;
 ///
 /// struct Inner {
 ///     a: u32,
@@ -49,7 +49,7 @@ macro_rules! new_spinlock {
 ///     fn new() -> impl PinInit<Self> {
 ///         pin_init!(Self {
 ///             c: 10,
-///             d <- new_spinlock!(Inner { a: 20, b: 30 }),
+///             d <- SpinLock::new(Inner { a: 20, b: 30 }),
 ///         })
 ///     }
 /// }

-- 
2.54.0

