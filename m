Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B83D4100;
	Mon,  9 Mar 2026 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069268; cv=fail; b=SFWIcmmYd3R791ro8zfyHVahPqjCHsEbWMPRRcPA8s/j547sQa9nJxNvQ0VXWOU1EGLI1RBWiaTHWJKyxwn7feE6VU6WzJn2htTq4vI5Y0b/yYckHv/klOw0DW2JcjdbIQW8uLooIXhJLKFzynCF8A2b5UQ57Pqy/ZIad2akbWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069268; c=relaxed/simple;
	bh=0FP89CQyif/oPbzDEF0KNnDxci3xeSqE0b59wHIER0w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U01ta5sMIIc5TYYVi4YQ7q3OTd8T9YsdcJDIMtgmYqmmxUoLyiq7iao+Ecwy/WM8Y0TEbDT082yNta+6cq/y6NT9zKSUcHjhdrQ7JeNvnzCxA2MDnL13Xk7kRzWr+Nx6Xl6UbLIrrPKGGKRoRSgiPy0w7LDElkTlo46r+kBLkzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cyO1fPVa; arc=fail smtp.client-ip=52.101.52.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cyO1fPVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2biOCraBkyLffZUj+1BUGKtzQ8xRcl6jaoz+es0xDU/pvakbMNfclTs2zGgAIK52iJks9EDtn2ed4FUxmppPY85+7Bt2x79lC+6isi09yW1014C+o5JzPdXojMQO5YjJ/NsHu9A5LPV3P73RZyEeD1EKnMP09h2KADS6b9Fgjj0bZppgrxdTq0gl8ARDgYGbn4LoNbBjE3Bvg/udJvcCtwOpnPXbStgoyc2Ccs1qjwqPBvtVRkHazkMGvLbxxwKKv62JBCccR6lvJqA+YzEDlm99+1m6CegyY82f8jQP1iZ9CjGqFnzXEqx2L9GpoxfHKJbI/fcqaLkhAWpq8U/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae4UeDgfUfzoEEPMB/DfNXHA5UjZCs21uT8+xeI1MT8=;
 b=nLwoN9rtb0LLA9taC+SvVFjcVt3CvRBKERJgWnlaZpF0YGR1YKtSYq8ztJEHty82qn1UHOfFye9j84o2bWOSMQt34Tur6ElZ82SpHde+pPxc+CScbg6ynZDMfxugYfAY2SEYDqHnuiMU//xXZm2MjHgmxu1Vpwwn2AGij3Q9Cha+iNxVVqFs9vCbN8CRrFMKpRAVY5lcndIZVU91xFleYNCQDjCF/tVcEw0E0z3yWqR12wO8jxXRp64JbfR2MYNa7ERuzQxIV7zBB3/UtLP/UQuAXYQIRKG3gSRtdsJ93ZVgNG8YyI6aS7ZAvjebTFAUZ8TDsle4hH4HFQ8/dYk6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae4UeDgfUfzoEEPMB/DfNXHA5UjZCs21uT8+xeI1MT8=;
 b=cyO1fPVacs9xDyy4bdsb9MCLn8UbX5qb7L2TCuYrsrtLmba5/w68HfVWYXyH6RLRB7eC4HC8TMGL12O9zkImkA0+EDW1wb1B2BWq95ONR28cA9/35k1etE8WGIWZMbyjqavhN6YFq8tuxKUF2K5Cp4RAc3g8IGxCBIMtWy9L1C0d9mVNUIlO6muwyuYSIqevYY7R2SypiDTEFtdzpG74PCVDYHyGEY661TBoKJcGgFHqXTESLvrQRk8mckidwK4gQQifjMG/r8XADK8Q9smqWjDCdXlydaxGY2VmWVHUwhYMYns9wye3txra327x6UdaXv8Y4tkApxamiQIuHwFiPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:13:58 +0900
Subject: [PATCH v8 01/10] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-1-424f80dd43bc@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf54a75-069b-49e5-33ba-08de7dee886d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	kOLEwebWbh4K1QckuaEjjgLMgthhVC1q4eEpCl1fvNVememHe2qMZ5fWcio4KN7XP1AkPabGbS86oZ8B4vYnPOtW6zJ66jhQzaItclYXtIcJCMRtGoEhz0ghQFExXL7yzl/RtUMjnUjJKlulzKmxfyvH3O1hew5NOAaHbyoRc0TpyMuG/7CVHP24Lc+uOGZ1tlwurcH00LZPAtYsEWU+jhEmlBDTxNisGYt0Hvgabe5NIwgVn9ktNCtMmqbt59CkUUvApc+hhBe8P6vJggYM6vt5pGsbyaiyVh8nhw5PwEs6Ct3bS/LTioVDvQiuITTnoH8w/rixoVZkPgi+3alB/adc1rYXXCKP5vdZl5EDc3GZm4yUbk38qpMpRLfiPhJTtb+oEVpgv4puem+NjoNl1YDq36aTrrMKRt2Hgp+ScyzwI2HlVH++iOOb+mZxIFlFYac0xpGADVZlwJGe2pIVdIndxzPY0N+Ntg+69CoH+lmSB/7INbiu7WZwRIknii0Yj0REsiZPPW+JFW2tQRyVX4oHORfrJTkZsFtSzXpBfqlAaeCbqI0Szb78VirzYVD/vOw+r99Ar2eADvERnrrd3AbL/Z2GLV6bAZ6TjQKVRAxzG+W4AUN8at4BHabMNKc9o10v+SHOyFPlgNfoN3n7vL00aoyaHfzD10whEu4YsczjU5fTG9E1hPcRt6yJV9LhE/lgZ+KdbdjckdEq5cWD2k5dEdrCoFUhF4kiWGhgUshKDA3H66Onvk9g9oDGynQnhDg6Y7ECP9CooJjk6KORog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFgxdzVoUDZOV0EzSlVpcVNic2dmR3ZRcWZQOEs5WHp3VGJybTMwK01wcXdY?=
 =?utf-8?B?Ynllb3duQ3VDVEF3Wm42ZDVUbDJGWEhSZXNTZFZndGE4Wi9VT1ptZEtwWXNN?=
 =?utf-8?B?QklHZTFRSkU5a3R0RFlTMEl1citoK0pIN0phdEpuQlQzd2VJNll6QnJ2VUlD?=
 =?utf-8?B?SW1nYWd1NXB3TFFSRjA1ZjRPZDZzR3hrd1UrSmxWYTNmWjQwL0pTNjlQNDkz?=
 =?utf-8?B?b1lDWGc0bE5YUHlVVFNPam1xc0VSNlBmTWczK3lZRmVGbU5lQkk0L0Jmd050?=
 =?utf-8?B?WXN3bFpSVy8zd3Q0eXVQTXk0djN5Z0NWa1FGYnRINWtYZ01RRVFMU3VHM0h4?=
 =?utf-8?B?NlgvN29oMVZRVXRTVGc4cm5MTFJ6a3k2Tm5LcmFpajlsVFJwYks1Qk9hL3JP?=
 =?utf-8?B?YUNSOE5OZFdDZkJ2QTVLVnFZL3I2Y1c5OVVaQ1dKQmk4ZmpvSzhtTDRaOU9v?=
 =?utf-8?B?Z1EvUmpHK1JwbWFGSE1WQ2hLTndDQTJDMHF6b292RTBWZHdEOEk3c3hBUEtj?=
 =?utf-8?B?Z0ErclQrV2VhUGxPUnp0TTFTZzM2ZzArUy9GckhJWmg1MTVpRjVQQ05xbzA3?=
 =?utf-8?B?WXplT1F2UVVrWkYvRHBjSk02TW1Xai9pbGZYejZ0R0VTU1plNjVjMWZYUnVy?=
 =?utf-8?B?QWVzSk9LQVBENUFRMy9icmxOZWhsZ3dZdE9CZ3FCMlZBZU1wYk41d05mT0dn?=
 =?utf-8?B?R2FmYWJRUVJsVm00dzlvNTlFT2R0aGNnT2h2S1R3ZFZyZXZ6YTJBM3ZIMWVy?=
 =?utf-8?B?cllWUFhDOWhaSDhlUUY3UG1IZVFHU3g0MU81SVhSVVBkWWtCQWZGZ015TmxY?=
 =?utf-8?B?TjNscXZEazN6N0krWTBuV0h1eXowbldwRFl6aFVnQXFTYm1pSHJQbU1ETUJJ?=
 =?utf-8?B?dExubmsrNHVKaUx3czE2enpraldMNTc3VGVqa29Udk1tNlFYU24vV3R4dXFp?=
 =?utf-8?B?SDYxSjZuVXg3L1VUc3lwMWRZN3pNKzhkTWxYd1haTHF5dXR2elZ2K0s4T2tD?=
 =?utf-8?B?RHB0MTZVU2JqTXVFRXhDYlFzNm95YTZTN1orYWZ4azg0TFdIM3N5c3RQV0JG?=
 =?utf-8?B?K1FFTTFMc3ZMYWh2M1N4Nm1pZEhTZjRMMjNJSTFGNGRncjA1NTFHWmw1NWN0?=
 =?utf-8?B?bmNjUXlrUDIxVWM4ZzI5QkRPUnFiUGlBSy9TOTdVYXlFT0pGdG9sMHE0UDUw?=
 =?utf-8?B?Y1hFeGVEWDB5SG5RdlI4WmprWlM4bTJMY1B1S0Urb3FUZVZSdTFBZ2RRSi9J?=
 =?utf-8?B?U2FNdXI4V3NIdGlyd1EvdFhzNjliRVpxd0RwN1JQSEUwVm9ybUdVRERpTWxv?=
 =?utf-8?B?YXR2NGFpTysyUHFZL3pxZGNGM2xNTlNVZGtsamZpSi9oVGFKRUYvQVA5cFZW?=
 =?utf-8?B?bm82UE1lTXZxN0M4aE52V2tJM25RcHB2VmlUZFhWTW53dlB2QjMyeWxsdmww?=
 =?utf-8?B?TlBZS0lyRUdSR2FhbzZOWE1LU2hSMUVpUnlkTSsxejRqTmwzNlJOZGRsVUVz?=
 =?utf-8?B?WWIvNWFtV2hpWjdsWDc3d1k0RUkvZDA0SWVvQU5mcnFjeVBIRkN6N2lvSzBG?=
 =?utf-8?B?WlJWTGJ1MmFEUHpiam1VdFFGejVQcHNNNHRYM09mcWhDUXljd0tqMjB4bHo1?=
 =?utf-8?B?VTVJaStqN2hYRXFJdlgxenVhSENWdFNscHMzSkRML2lTb2RtVi9UOG15cnAz?=
 =?utf-8?B?V3pjbm1FUThIZFBVZjEwTEtaUjNwbzhtWFV6aFhad0R2RzBxM2M4dFk5RHZy?=
 =?utf-8?B?TWpzOUF2Z2lCZ1BRYWlWczVheGcyZXBmRWVkOFd1aDQvWTM4aVBaNjc1NlFk?=
 =?utf-8?B?eHlCNUpPK0k0RUowQVJKYXpRMEtqUzd6NDkvd0FEWVhFNi9kclFrZ3VoWlVu?=
 =?utf-8?B?d2daRHk1Vy93YWVISGMyUklCdHpCSDFsZ3Bic1JiWkpwa2ZOTng0M05sbWJt?=
 =?utf-8?B?cGgzM1NJMnJBY2JsMkM2K2F4TkJjTlhrOG1xTWhMRUZ5S1E2cEVJK0k0ZWRI?=
 =?utf-8?B?MmtOb1RvSktqRDVYaEVLNm10UGg5dXNaYjM1cUZxWTRZa0xXQXpPajZadG1B?=
 =?utf-8?B?NUNKU3h2OEVsWXBockpMbCtQWExRQWZXQjN2SG5MRkY1cStUaVhOekFFY1BT?=
 =?utf-8?B?RStqK1BXY3kxd0tpSmVNZ0MzU1pqdGlzd0tyK2s2c1FBMUQ3Tm5MR2RQc3hn?=
 =?utf-8?B?ZDYwUzB3T3ZEU0VtbVNIaHppY3ZoY3ZpUTVjNWxySk9YTUJpTDJ6Mmhkamt2?=
 =?utf-8?B?K29PbzNTT0hqMGdwdmFPYUJjdndtRkZNMFZiOTBXMy8zNmhpVDJJSEJJRk83?=
 =?utf-8?B?NVlueFNmbDVDblV1UEpnclVpNlRaa0JvYngxM21mQjRBNkdPZzlCT3B2am1V?=
 =?utf-8?Q?842z5BiN+76LWpn45gg9d+zJ2mTXxLc4R2YVNLqOkglNo?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Eqq81tvwokAUQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf54a75-069b-49e5-33ba-08de7dee886d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:17.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fchXAjNJd9+plibijh1Or0pnsQy95zpz0sjwN6N+xWG4ZHJiLDtmyE37hUce9C5TAIRpW7hPRvnc5gkDvjdHBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

This feature is stable since 1.89, and used in subsequent patches.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs     | 3 +++
 scripts/Makefile.build | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..cddeae8b6cb2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.89.0.
+#![feature(generic_arg_infer)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..923886735299 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -314,12 +314,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,generic_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.53.0

