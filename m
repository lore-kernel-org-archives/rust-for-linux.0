Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DFF3C0A02;
	Wed,  8 Jul 2026 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507053; cv=fail; b=LFK3CqJdjJGsGFSDlWV5gn1yT491q7GITZiZuBCdcV8lNmucUOtcSKgmGKoU46Fm932GxBB7Gpeg46EPmGlSmwzCMGbyF9m+55FDTeug9vCPwEUMfo8aO9L2rlW49RHtzo57+uH2bkqdM+wKbCfLExpeD6OmgOluj6vO8bOGT7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507053; c=relaxed/simple;
	bh=LWGPKQOKWkiG7DnD8dXOTOvyqKqQ1so1NeQCjkKGZtI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=HMVAjyBL2dmY49acwJ4e7gNPRvxI6W7GfF/zV52u6i7i2K4KJjGRkY6hIghmfkqZUHobL16UldtJe9rUZZPjInbYEExEiMbcqUpjK09Yp6oazKkm3aV3fMWtzBtSkK+92XbaI+019WJJBmDnEqXyzN6E7cWV7Lri/aXo4NoGfFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CVUA5VBI; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CVUA5VBI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqTx90ISiiEKnevAWzqnoinsu5VWHRt2i+OcUyugvivI94fwJjH0LfUmXKEB0mufltEiImBxNc6+0XZQa22NNc7N7x3qcIMXyZr4u1J1nkyvM0nk2v+8uLYFyr3pGL3L2oWxP3it5mYamSFOXhMQE8RxmNRJ0yaF4sa0mrv7pENcZo2ik4MERBd7WLmabIupBIpssDGHuOrbTenHCNWzRmVAxgPDXZ60BL42jZwu9lvbGkzXuW//1ey6BSBXuYposFXxNKq3aZ1Xbu9rF7CcpnH6IU+cOfh4Tp3ngQ9FeF8vdcgn+L4zRcgIucdcyOv34Tuh2Yt2tqd9CUcyGKp0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMkE87nBaCX95rEfuIDG47aaAEQA+scVACZlRBXq+tY=;
 b=Msdr7DMaU883I9UrHYNazUu2eIjf7RslatE23IrB9LTc1I0GhCnRlaEyovGj1NMNJu9TflHmsiQniydGSwWIog4QV6sHyDtXnDRQfvnu7NZSj5bdMEl9rJkkZVIXvN3dGGtA9xN6Q/hIIqmOM5Jrd+L1fyK6RyRobiWNR0DUeJ1kB0/X6qVIeaRrwDE7O71AbXKkh/e5Bncn8SthmnWYBp+TNURZPA1LtYFd8/s4N9pL+8nIMrBjPFiqnzpZ0hanutMvCrWq0HGGDK5C72LzNdttM7UAz2hdpkAmM0DpvLvHegl+0nK640QDraZSWfzTspnFD0RcbtnxM+fxaScO0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMkE87nBaCX95rEfuIDG47aaAEQA+scVACZlRBXq+tY=;
 b=CVUA5VBI462i7/BU7DN2AkjjEARBDjHI2E9ljsveYlV2NwvckXefk56PhAYUb5rR6DuzOKeAwemzZ64+WZTxlqXMBnEun1osmedw5LH/c/8jUMH73Bkw8QBzJotOpGqt6ycca1fuWFBZSPdGybQqYwbdA90DMbtyKJfgpdn3IzBAkpvAFEvlw4p+vR260ApJxru8dXZ9G4YSpLzZpsFvrd3ecDqkgGOHXvQZ4wd8MWqbOSmPEWVjf8RPGJy/LecsgiIGwuxZqZk09Xj15PDPA0/ERLH9+uP+wZI6PCysRmOoazEPMmzWvWek0dQR/K9tcQcTXeVMB3pKRTkZoVUSMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 10:37:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 10:37:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 08 Jul 2026 19:37:04 +0900
Subject: [PATCH] rust: export zerocopy symbols to modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWdOkVlPAqxAWOvzKsKDNFAhKu
 LtVl9/ivZ0SVJDoWuykWCVJmDJOZUE83KYnjPTZ5KzztrK1eUMDh/gy2GLQ2cD3ruGLO9eeKVd
 R8ZDtd2y7v9NyH8Hzd0PH8QERWe5acwAAAA==
X-Change-ID: 20260708-zerocopy-export-e6d29c42386c
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: e3844941-19dd-4bdf-57a6-08dedcdce29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10070799003|18002099003|921020|3023799007|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MjWm5tScxviL1ox3+SEluZIjmZmvnOfIhhem51aBoMihAkGGGpciRwMMSbIIsLVVQZtEfNHjCP1ITksl5pxKmN07BixsPAgiqRtnranqM+5d12ihLRYlkZbxK0PAG8nOTxDXUD1Q1d5Fc3fne8Xm87mIs2Uj4WJliLHtin6a1jnnDrTdvFuQzXOAUWDFq0GpOq2l2u+DCU2CilhTxBEpn2NFHIo1n6xHhf87cmHKdcdzs6YcYh0ct7zYpTik1tDNCjsCYeicZdVuEpStfsxnt9YVg811f56thVvn9PBnp46eAWd5Q1/GItaPu29+fK+ur+IEOei1hlIe2VqbMD3QeSrue/Ia4v+tGTU973HBF9ZNa85vQF6zOsGPLomT9iO7T2DaARoSxE2gqrDtJcOSj1vbSCeNQzLKptXt4NLBs8k0+1cjiE/OWVXss2qvhVRrBeCgJHJOY92QZTlkodI9+OxtaoS4sLdr1gNdvy0T0LYNwCN6ZX3m/Qi2TUyHYNC7KIYvDSfvq2uyXQNPOdQIczDG8ou2IYdNcaizUpXH5rEB4r9wfF/hsGF12iS5jRPwZBMKxVXoEiMF6XXHZHcN0cdFaV0b7zoNOjUWtzlPdOp1B6ONJoUMPc76IVUKET3Jqh2Zq9QPSALNc6if/gF8DusYkS8XlWvpZ/H1pk5miwrQrBU56J4YnR5DPiRZloZ1BV+s/51q16HnNGRNHK3F2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10070799003)(18002099003)(921020)(3023799007)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmNHZWhPUEpDZnhGUmp5Rmd4Qi90d2ZPMzR2MktPMEdNdi9kNXkreWtuaUJJ?=
 =?utf-8?B?VkxKM2g2QzBqanlJZWFLbGt3ZWVZVGtQZHhyWGFPWGROWnd1VlJBNHZVblFi?=
 =?utf-8?B?MkhxS1l6dDVOckpEUkZUWGY0NnV3ck9hd3AvS1NuYkFPYWRxc3hEcHptNlNO?=
 =?utf-8?B?R0N2NXN1emxORzdPa0llRmhtUG9DbGsrZnJqK2dtV08rMzgrUGVEUEhOT0Nz?=
 =?utf-8?B?b2NRYmtjSis3UGhWaXh4OEUxRWRIV3pxVE4xOTI2a0NuYU45R1lHM0F3UTVn?=
 =?utf-8?B?MVR3aVJ5YjRrS2JBbk5UY1JFS0hKR2lKUUZGaWoyd0dVRmpSMUE5V3lnK0RE?=
 =?utf-8?B?eHJZQ3dNNHVuR0d6amx2emovSUVjaFNnNmZWSWpJZDR1M3AyZEd3QmZmamJY?=
 =?utf-8?B?TXBNOEJIVFQwY0piYjViQUNTWlZiK3hEWnAzckVoczRRVURXNWF0TkJaNklK?=
 =?utf-8?B?dHc3dGZrVEc2MmVNdjJtcG90L2xwU0hjZFVTL0lwWW80d2t3Q2w1YXFtNm9l?=
 =?utf-8?B?MVhudk5QejBsRXh2ZjhiQXpUUDREQ1JpQnFZdjR5d1pTY3R1NDEyZG5kR1BJ?=
 =?utf-8?B?NzdsY1pCT1hoV2JBNTM5WTcxT1RtMHNIVTZseGVzSFJ5K1AyTlZBVE9RRkxX?=
 =?utf-8?B?cSt1TUlCQWR0R0tQbGxQL2w5b1RsTEptVUpxeHJiTUk3cTJDMTg5UzB2S3pV?=
 =?utf-8?B?MzUvQjRSS3lTOVEwSGlYdWhGcTFFVXhLajQ3K1hnTlRBdUJTVlB6WHlDeHdQ?=
 =?utf-8?B?N0lFTlU1cjloMUtmZWRjRFJSeEp5Z1dCS2w0QnUvQjM1bE43b25ZWnlxejhj?=
 =?utf-8?B?V2JCS3RPZWhoZ2FvTUhyNGs4V0xEUDZRS0lxL3VYMCsrMVl6WUdYY2h5aXo1?=
 =?utf-8?B?a0E4TFNXZC9aOHhPMUFkYVRnY2lkWCtoUDA3ZkZoV1o0dmZRU21EdWJhQy9y?=
 =?utf-8?B?b05BREVWL1U5UXArNnhSYVhwRDA1akh1eFQ3eFhWSEcwQkhMV2doOUxtSHRR?=
 =?utf-8?B?ODNBM3VNdzBNZzArM0xLMk9hTVFyM0pyRUJuL3J6ZXZvRWdKbXJSc2NobEpx?=
 =?utf-8?B?b25ra080a096RGhSaTdYbVQ4QlF4aFk2TGtPaVlscXBuNVhzRnNjTW42RTh4?=
 =?utf-8?B?Qitia3VKQjRWQTd0SHdOU2Frak83SDNBUTVvN2p0YyszZ1hBU0lOcnFGcERz?=
 =?utf-8?B?MllvSkg2bmFlNVFBWDB4VGVNdUR6bjkvbXZua0ZmUjRicHZUUW9TZXNud2c2?=
 =?utf-8?B?R08vTkpyYi80akFrWXFSM0VFVWxPdDNFNGFCaVptdFdNV1cwZmdKeG9UNVFC?=
 =?utf-8?B?bmQ4OE43YURLVW9COUpCNXRQeFlRaWp3MVFMZUcrMlZYUXFnNE1CMWtpeGRw?=
 =?utf-8?B?RFRFbkpjZFhqZVZZOXhqREo4bmIzcW43eWRMcmR2NHZnSjcrYklhcmREVnlw?=
 =?utf-8?B?WDUzbGFoNHZqMjczdU5NRDUwQlBKdEdMWlpkK3d2Y2xNVXFEQ1dBdVNPeGhk?=
 =?utf-8?B?TGFOdis5dVFnaEE4ZW1iMWprMkRJNkUzY005aG4rUGJZc0I1b1kxMVh6NGVB?=
 =?utf-8?B?citYWFRHSVQzWlNqT2ZhVXpkLzdSckRUUlRNYk83U1JXMm9hbzMwcHU4bnBu?=
 =?utf-8?B?ck9oNTR2bGhLbENJaXlMT3hBSjA5MTJIL1lBOUVrNjh3c3ZVVHFIdWtzWlMx?=
 =?utf-8?B?NElhMWozZjFkVm5EM0JFbDY5NWJEcTNJZHRYQjB5MzE1a3BjY0YzMVBEczFI?=
 =?utf-8?B?M2J0SnpTVldpWFdvNEt6eDZlRDRId1ExSlU3c01GcXdQMjlERDRSNi82eldQ?=
 =?utf-8?B?MWJsNGJ4a1BLUGNJZ1RsSDlJV1lkS0czbEk5T2NIZGlxWGZLVDBlWkdKM0U0?=
 =?utf-8?B?Q1pZQUc4RVN0d01vYzg2Tjg3Vmd3QTZ4c0tTQ01jZmNiL24zSGNjek1kYU1X?=
 =?utf-8?B?OUtGdFlTaHZRanlmNlJQalNyQmFrRGM5SVYweDlGMjNBVkZFUXdCWTRiOER5?=
 =?utf-8?B?SUpqSnFDSmdnekwvVDUwVVpqYjBQVGJrSDJzcXcwd3BhR2haL09JVVVFanJh?=
 =?utf-8?B?djBzMDhGNkZnVCtBNzh2RlNBRVpTWFE0RlJPUXUzbGwrQkpRRXdJN01aY0Ir?=
 =?utf-8?B?a0FEdUNYWTNHSnFlOWFualoyY1ZmOXMvaHhjY2FQSEc4NGFjY1hPeXNhN1VB?=
 =?utf-8?B?dUkrWnpjRTdrdHV1NER5ei9ZUEVSL1BWaHF5TzYrVFhuVll6a201L1d4cmVn?=
 =?utf-8?B?T0F3ZG9tUm5CQ0hTaktFUWl5N3NvRDM1UmRCc3hzTFE2ZzdTcEtnbFp2WTcv?=
 =?utf-8?B?aDBzenVlY3lvcHBYWlMyYmdKcUNpZHEvdHRrQkE1SnRVVTBNT0QrbFUrNVVI?=
 =?utf-8?Q?cZODbVxx6UNVEjaKYVIZ8s30OgKxxDnLgtNJeqwoJok3S?=
X-MS-Exchange-AntiSpam-MessageData-1: f4q+7jJo5KxH6g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3844941-19dd-4bdf-57a6-08dedcdce29f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:37:18.7566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kxrm4pxhovNhU5dnrH6kJzXZ10ZqEZHDnqP9Ix3fose1bhBzfQMR0OGENuPleYyn/qS3fPynifHFISNP2QGzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408

Non-generic, non-inlined functions of the `zerocopy` crate are only
codegen'd into `zerocopy.o`, with their symbols currently not exported,
making them unavailable to loadable modules.

This can break e.g. nova-core built as a module when
`CONFIG_CC_OPTIMIZE_FOR_SIZE=y`:

    ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo24try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
    ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_for" [drivers/gpu/nova-core.ko] undefined!

Fix this by generating and including exports for `zerocopy.o`, similarly
to what is already done for `kernel.o`. All defined symbols (~12 in
total) are exported since the compiler gives no guarantee as to which
functions are codegen'd.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
My `CONFIG_CC_OPTIMIZE_FOR_SIZE=y` config is uncovering the most
interesting bugs. :) This one was revealed after applying [1].

I am not a build system expert at all, so be aware that the patch is
mostly mimicking what I am seeing for the kernel crate and there might
be a better way.

[1] https://lore.kernel.org/20260702120324.40388-4-niyudi.honda@gmail.com
---
 rust/Makefile  | 4 ++++
 rust/exports.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index a870d1616c71..65170c6d31a4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
 obj-$(CONFIG_RUST) += zerocopy.o
+always-$(CONFIG_RUST) += exports_zerocopy_generated.h
 
 ifdef CONFIG_RUST_INLINE_HELPERS
 always-$(CONFIG_RUST) += helpers/helpers.bc helpers/helpers_module.bc
@@ -566,6 +567,9 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
 $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 	$(call if_changed,exports)
 
+$(obj)/exports_zerocopy_generated.h: $(obj)/zerocopy.o FORCE
+	$(call if_changed,exports)
+
 quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) PL $@
       cmd_rustc_procmacrolibrary = \
 	$(rustc_target_envs) \
diff --git a/rust/exports.c b/rust/exports.c
index 1b52460b0f4e..a9d6be8e8485 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -18,6 +18,7 @@
 #include "exports_core_generated.h"
 #include "exports_bindings_generated.h"
 #include "exports_kernel_generated.h"
+#include "exports_zerocopy_generated.h"
 
 #ifndef CONFIG_RUST_INLINE_HELPERS
 #include "exports_helpers_generated.h"

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260708-zerocopy-export-e6d29c42386c

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

