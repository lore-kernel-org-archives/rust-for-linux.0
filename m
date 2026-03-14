Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015D2727E2;
	Sat, 14 Mar 2026 01:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450396; cv=fail; b=pZ/tbhp7UQ+703kryV0PM04FxTLvmNmUJP+LtlkyRAwTNomxFVo1q/x1FRVMAaRfKIZbR2eNAl5+Y3I3lbKQB9S+Gi4JnCwnUzmht+OJxrP6bvS90C4N7MmM6nTfguO2Y5qZPMKSbFC6IMdpQO3rsYwJkx9B+7F/s6j8AEfEtX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450396; c=relaxed/simple;
	bh=0FP89CQyif/oPbzDEF0KNnDxci3xeSqE0b59wHIER0w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nokljz//RLHb2m9XVeAnfPfON63gYcNLdI145rcTSRJE8wp4DAemDp8oSKoyJUjbD3hEezfNuKyQ4OK0xdZUehTs4pitR8a/oq2qTiklbDdB2mlq+mThui6v/05A45Brio9kwxagNGswbWp1yq/+HFZtvGJrb2qHUx+NdpB+cc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rL6SeqwR; arc=fail smtp.client-ip=52.101.61.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rL6SeqwR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6HTmBDkVQ2F2LRlJyFX8TgDnTKlydYhyuJU2p7HAJxHkFXM00ThGK7h26k6mUwZg/nRLllZZPKaTKKIP0ZJnNNzl39N+hMo338pDSyOia+JjFoTlY7+jqmlee6byhvKzvYnWTyrZlrlcNFKFx8Gv1hcSbQngGMHBgICJWSlbm9dcBFxfeK1dhz+Xtm/FAyjHStpY4Z/nKk4mkQDHvd9Re0sd7lpgc03IW1UrXpHgVvaDTeB8lfxQGnybodNwbMvMlWLbviGdan5NbuX9TWeAFlBPiGcUAElXG8ZtRj8104Q5StTh417X6sM8jXjj6gv7KayHoOhqdKLIN1yOqolZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae4UeDgfUfzoEEPMB/DfNXHA5UjZCs21uT8+xeI1MT8=;
 b=v8kSvBuq+/Sg+v5f8678zQyf95zhcaYMW+elbZO8EQ6i/ugcS4jt7qPjcc312ZDzMXrUVGzZwTJVF/mz6PgXVsPP64Hy58oX0vcJRZWYV9PrEyOSx2c9ANEoNZbv8rfBahj2wJU8qnwnv/Ohh5JDYOZ/O7bN76Yrwz8PrG7N8hQdvBGRC9EXzsv7SPBsreLCGNB7Z68KErNDk/hoDjWugvcJb2ZOxWWoU25gz77gVnYvwaxPUof60vMIkQYXWxN4G3Y2oYomyStNiAooKICCA6xZu0L2JdVs2adfCCh54taVuuXB+fxgRu3X87kwQzVV0QxHrLJUXteSER9x6gA/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae4UeDgfUfzoEEPMB/DfNXHA5UjZCs21uT8+xeI1MT8=;
 b=rL6SeqwRuBLMWALFSZqNEDXTUnIxiRP4+3OFgXN2+mSTGLUKIkZswWepQnyvmOkwwHr7rJE1rde9sSFWcOfszyVJjfvWNT0IozD96/mbdf5UeWPAmQlllp622ouQ4Ike3W5j4tJ4pxk0N3xd8gGWx50OlWUneWgQPmDbqzG9LSB8bqLjY/k6tMvhA84T/ObUTiCV/ivvjPEgl1QdFvPTH7sCq/Be8kZ67DMZmKvdNrS5Y2NFUbZmOUnTPWbUDdAZZ3V+IVl686gkU6QbY3zGaD0Fow0kIMO1paxQHiM7rCh3X4lOLwxd6QY/B4T4LJ/SsIVUUnJTEmR74E93cV2MRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:11 +0900
Subject: [PATCH v9 01/10] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-1-86805b2f7e9d@nvidia.com>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f50645-caa3-490b-119e-08de8165edc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SgvhwETMeOLxeYE8CRz5dbfCn4OvCaub7dd71aLjIa2SK88cUlBh6Q/sMgN+VfxKi9zz43xAQ3mC5UXnp9fwY5Wte2AoqqU5U+SwQyhnQ9hlrD6FNwguTbZXWykMhJQ2sWcnPYORednle2xAgHEQt+rBCT02tUBWpilC52XXbIF/MzdkDzRksXUpQC+R9d4QRRqr9i5m8IsKO2+GnaNcZOeuZVQInnCHBvtxcXmzjT7OBdxB5eqqXWR2R/IuHSfXC/CNvVUYEE8J/eHmrIvJ6av0xuJS9Js77q40e9Fyxe+xiu89mW4IK51kz+vu1ZrC5O3cnPWffAqBjZvI5S5V/Idg9/s5QHYqzzyszbHCMzTHhTIccBJdkgYFR9lbaTCmNRTFxyBPXV7k62xmOGl/3fCVfyVcfSIAQ6LaSMBJ3OwNF3KKtuSDNGcr2MKX2gAGLZC+UMl2vubwRyfv93lbYR7Q+pvrOJDR2bnU+CIQub9I0LwpCCTlVVFv89xvp/yUdJAcrrAFuUuzsmj+r0rNvbW2ZTi5IfXRsrgMEGY8w6jv1HO01Z8giQqt28QmoiCzp6hrLXamejJU0G7spqwbrPwONEgG0QfY5Ovk4sVsWLr5RQGG7kdhKdHR/U1CYZYsWYoKsJgDBYd6ut2EvSwuMk22dTixgRywAHvBGkNgcgC3rUSd2/J81XTqWntcpKtGxfR7s0c7xxDPySnPke62Yt3lCdrOxXKNGwczQ+2wbt8JjJfUHO1D0GzsdCPBFPfje+Kgfsa6R1AxV5SwFHP2ZpgIG7ZZ/CXJnhn7+fIWnTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFVNDM0U2pEVHJtSVp4YmlYNm9KNUZnN1g1aW1ZdXZFRnJzZGJYRVZvU0hn?=
 =?utf-8?B?Q1NKTWVhNmZKOGlSUWhtWkw2MUdBZURnMnFvTllDOXNWRjhBRk1lbjcwUnBv?=
 =?utf-8?B?K0t1MWdMVUZyeDB0cUpLVDN0YTE5T0swUzg3MG1vUUtwTVVGNVhJYmdQYW9T?=
 =?utf-8?B?UExiU2FSQ21EL1FESk5pQ3lyZU9NdW13MmJJYmdBc2V2VUFJNitxakpwSlFr?=
 =?utf-8?B?eFhjUG5Ld1pNUkJYOGRlYndYZ3NPRDUxejJqTTdnZDBNdXp3RVFieUJrTmw0?=
 =?utf-8?B?djk4MktPYzhaVjdPdzlreXZIT0htbEtmNDFJejVjK1dIQXZPZGJHeTA0eGVl?=
 =?utf-8?B?NUZVcmRBVlB5VHl5K0lvSzNWNjV6NFg5TEV4RDl4YVAvVkxkQlY1UUVvZ2wv?=
 =?utf-8?B?ZTRCekIvc1BEaGFrbnRXekVZYkVzWUozMjVHVkFJMkMxem9FU1lvMVFvVkg4?=
 =?utf-8?B?SHBadzlhU2NMZlJHV0NzWFJhWGN0MHJkZ0lHbFV1ZGFEeXdyak5UN2t4QW0x?=
 =?utf-8?B?Zjhka3Q0bXZJOVVma1U3YSsyUEp4Z2dWY1NsZW5GT2lqTm95YXNpQ2dsT29T?=
 =?utf-8?B?T3lCL3BidHMrcFdlQXFpTnBoTk9jUjNFSnRkaVRUVEJ2QUtBbDJKVCtKSzdp?=
 =?utf-8?B?QWVld1VVbGZKbXRVTWxCQktMR21hdWgxZnpxWkF2eXZMeXViekEwN1gydjRJ?=
 =?utf-8?B?VENYUHd2cDZ5Ymd1YWhXbDJRcTFCVWFnNDE4UFFmMjczUjV6QkZRdmpieEc0?=
 =?utf-8?B?UStqZjRXREhoV2dTbFVnR0JmUEM3dWtPN0NVNXdUUTFoYkQ0UjdrS1B6dkk3?=
 =?utf-8?B?SnRKSllBZTZFRFN2d0xqRzVXenEzek91WGlnRmZoWVZicEhjREZZL0toZDZC?=
 =?utf-8?B?SXNjalhlNmZDLzVxZ1lEYUFnUURYNGlyOVZHTjA5QU1DMW9LZlhoejVydHFY?=
 =?utf-8?B?dkk3VGJCUjhJZ0tmTzF1eFkvRE1Bd1V2YldCUlZCa0d4Nm82UHExMHVQanlJ?=
 =?utf-8?B?ZzZ1NWZsUE9XamxYdk9lQTRweGxVL3FhNnd0dXh5Wkd5L1prY1BIWmJxcTRS?=
 =?utf-8?B?WFBDRlBRdGV2ZXdYMFpnSXJHTlBhdGxINkhOc0lQa1NnTEEvd205MEdoeG50?=
 =?utf-8?B?RlVNVWpRMkMvS2RUa3EzNjVkVDBtd0NvZnlrNDFid0F6dFpkYnhlVWR2eUZW?=
 =?utf-8?B?SE9HeURCdU9ZRzZrWXV0TmJvREpyK05IaU9rSDYxeWE1WEpJZi90aDhjTXpn?=
 =?utf-8?B?Ymw5LzMrOTFkOVZnamhRdUlWQ1JGZ1hmRGJ0NkNqeXF2V1lqaENQQlMxS3kr?=
 =?utf-8?B?dlJiUG1jZEtlZ3VVeWJYQUNQNlE3MlUyNmJMMzM5YXZJRzZNMUtra3dSRk9v?=
 =?utf-8?B?aFl6SHhqYWJjZVVGUy8ySE95L2lkWW1PNzFGT2p3bGMxQTF1eXhRSVJRRHVx?=
 =?utf-8?B?enM1aUlLTmFrNkF2YmJkMU1GcjNCejd2aE5NUUZqT3VhS3JxUmxxcnIwM2c1?=
 =?utf-8?B?Skg3QUtLRjdQZ08vMlMxenpad3RrRlloU0ZhRGx3YTFmcFpmd25lMlVkTkdL?=
 =?utf-8?B?RWxCeXM3ZnJ6VXExMGl3SHFEcjkvanlUOVdnSGE1YWtqQk1kclFYNjBnaEpx?=
 =?utf-8?B?dTUvc3lONU9kNlNPNTM1REJtd0NLV0RwcDJuT0NLTkxpYkh4dTFPVG45UCtV?=
 =?utf-8?B?UFRWUXJxNzVvc3d2NXB1ZDU5Q3Z4T2NRRlkzVFovcVVwY2F3aVE4T0lNYmZ4?=
 =?utf-8?B?TnRkUEFSdUxjZDRLdmtEbFd3VmMza080MGN3NXZ1WUZPL3Bud3BmTEdFVTJk?=
 =?utf-8?B?Lzl1TFlNSUZabDJhTndNeEVqYTJKeXBZWWE0SGp3aDZJbW9aYllTcXd5emxJ?=
 =?utf-8?B?RmN0WmpjeFplK0Niek8rQUx1cGs5Zy9QS2VFNllSOHY2NHdwYkVxVHZmTHFs?=
 =?utf-8?B?RDFBMnhqalRMWmtKZmVGUE9uM3IzT1pQOFZyRzIvRjJKbURDVVhPY2RQVmFr?=
 =?utf-8?B?OHFubkhQQzQ0MllGWlFZdzBMUno3QXk2SXRENWFoakV6d0pNZGlIeWRtM3Zv?=
 =?utf-8?B?TEZXRW5ycWtEWkNObW1LN005anViSDF6ZXZjbFhvMTkxc2dmcGtGUlNwcUdD?=
 =?utf-8?B?b2d0MmxDZVZpdyt5aEk0RDZqUGp5NWRucGs1eFVRTjhES3NPZFZ6eVRqWi9H?=
 =?utf-8?B?OCtqOFJsbkkxOEhJNENCSVJiS3hDWnBxanJXbFdHWXlJZ2c0Wm0rU3IwNlRt?=
 =?utf-8?B?TTVWMGJXYTNpd2NhVHY3THc3c0YvTWNBdHQrRFdFdG1aMnQvQTdnZ1BST3Ja?=
 =?utf-8?B?OGRicEpWUWl4M1VnTVRYaGlqZDNwVVJYWkczUjN6VE95cmhNcXpod1ZqcG9P?=
 =?utf-8?Q?mx7Wi018hvZTRRDqZHTbKXCPL9RuGg4Ya5hLoORNe6pXY?=
X-MS-Exchange-AntiSpam-MessageData-1: FTXwh+2eEsIkOA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f50645-caa3-490b-119e-08de8165edc5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:31.5923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAANUt5f4RcVExMmD0ae8cAy8Zs1wp2h2Lyjspn0F61FRVZ+2IMF3f0oYyOqhGDaiN8zAa3XEeg3blnkmt8c9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

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

