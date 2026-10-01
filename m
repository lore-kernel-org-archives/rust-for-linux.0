Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2446481246;
	Thu,  1 Oct 2026 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866857; cv=fail; b=VaIPxl3uFo6Wz0SjLDzYpu/wZwG91A02eJpgPnGNd7wwKN5tD9b3gD9phAvG8j5Jz9oKSbu68eVLJdWno/+1Bh+8mtdgCr9hPB0+oHd9A2zf18r1kAFxjcKV/EvUbjcyH4lXiGg8c1KUhSUoyBEitjt5qtoyu8WDwzGTx+y1T1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866857; c=relaxed/simple;
	bh=qYl6yJy7DzIHP9hzh3w0fHo2iVIuK2zntPjGB8WOM1c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdbZZoUx2/XFD20Znk1AN2+D+JG/rAzCOzaKe9SiLrA3brhbEHGtR2ltsZUWM2ZDMWs/hS5tiwqzsW8vQWzNWtPmZOByUgYezW9qvTn5Yw8u7p1uKU1GdH/mrxiDmDoKu1/G2P4/NWrIH2YEyDF7ThMVVnv6B3G41WzlrXW0L4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dRyVjgzo; arc=fail smtp.client-ip=52.101.57.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dRyVjgzo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3w5X3T8/67BYDteDtQQjBOuHXwRe6sgixxGeJgKRkJk6OnM9QXd8NhmBO4S9obFSnpbPhDqXgN8QZfWdUQb60sjUOW+oAyC3QD0D9FggdRfSRJMHIWAM8AgyYYfa6V+UZZXy4boAKHIiB97RPNarZMj14tqPLdBbgEFEZQ1vdvxMLPR8yZovlXZ8Ln3vaL6W3kEcUh9XC1oYh1TjCId6EV7adaelUJfIwu2ILtJC2uVJVKacwmfpn9+4MUXux4Bu4WMvWkz9OQJs+iJaZMMhsqrxp1ib2qa/och7Vtag4TD+b7KySM94IM7sijILJY/CFF5/GKOTgVj7u7SnSZ1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3m9uCKtP9rZHUiSp5/rIywpZTLc0+6ANCS+INLx8p8M=;
 b=l2KZ33+BQlzf6rzw/S9You1eqUVLAuFNKc/ZyjEcvdMTpwOo7+ns22F0Lh0pONccO2Im1WYPHUjpjK5xaif+1d4l2BmHrgFTzLAIUiikkXZAyl8P6LaDWPhf8sp6se1rfZYzVVjnNlVG3ZAqQmOTB1/g3URD/4lJa5girvt1osJy2rQQLhWNhrsFMn4BVeYvkvM/8PXzHaoa5QWGpWtmgNzE36zBG/8nq8nASWMYEO6gHh1cD3ksi+hEFnb4jRX6t2JYukQYEbnNJq36XGA2sOdgaXk/a7Qd4NuzNOlqL3Fzl6MOolfo6o8jL622zuJe5gelnrG6XAJ47wvcNMrNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3m9uCKtP9rZHUiSp5/rIywpZTLc0+6ANCS+INLx8p8M=;
 b=dRyVjgzo4+IwCx0AsKeJ98YcI2AGMzdAX0HWxRJzd9TpR106FEv+jFzXXO6gyQlvB8czF5pkAg9kDnMTB/2COT0ok/kChSuCUHwADCn1nytt8BVxJj8catT4XMd1ClBjRAE2DSJOORBfZwTgSpkE3UfC97J92nB4eykglnkMVXGXBmv0Q+xzpVD5hmB/lpPtdgHLNaCkl5ZUUWLv3tRACrupNJ0WsPWNU90K0c/srDZBUs6NBdLlCEDeZ4YBbKOL37NzL2B1TZ/4SHa7jEZvhFdhXEEsNOCzwXIZZs3jz0qxknBeat4+zOaN1+S0HuLZ9ojMYby9bjE6loInsFIT/A==
Received: from PH0PR07CA0022.namprd07.prod.outlook.com (2603:10b6:510:5::27)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Thu, 1 Oct
 2026 15:00:39 +0000
Received: from BY1PEPF000264B3.namprd02.prod.outlook.com
 (2603:10b6:510:5:cafe::87) by PH0PR07CA0022.outlook.office365.com
 (2603:10b6:510:5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 15:00:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF000264B3.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 15:00:38 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 08:00:12 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 08:00:11 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 08:00:06 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrewjballance@gmail.com>, <daniel.almeida@collabora.com>,
	<dakr@kernel.org>, <aliceryhl@google.com>, <ojeda@kernel.org>,
	<boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v3 4/5] rust: print: add dynamic debug support to pr_debug!
Date: Thu, 1 Oct 2026 17:59:39 +0300
Message-ID: <20261001145940.1077801-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001145940.1077801-1-zhiw@nvidia.com>
References: <20261001145940.1077801-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B3:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: af617e14-0401-433d-2aaf-08df1fccc130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|23010399003|3023799007|6133799003|11063799006|10067099003|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4FcPqHEmhLect77XdaJJ08VVB1TPsmnUVKmlAEMMewOIJSZyTW22IKMVGq0NLKrsyrd8WuNcJVawLpcF/b/E8puz7ZTB24FnWPPTSXTCjk+yDrY4GFhlVtx/PYucOf0zOv/6hdMO+ql9DtMlO1UjUDokPV/dIE96ZIpLWvxXOvgbRxnTolCKwsVFUq+Q+CoYBSo6XaCnSi/vcqniu84RWg71WZ8HUbmV/C3xojUerneNEjJS7y3PJ9QhXXY4rj5wceSOwCmyhhsQPhLYNtBqCJ+lUDnyWY4fnKGEG88q+QYxSyL2LUkGzX5sRatDc7UV+6tSOOmUW8asDVTEqffq6o+j1XPXbeBd10/ShfbKrf/45vG6VHArf7lGxVeFJiv454AyCKinqB1Ak7zzJVXHDONiEJeGmOQvHtogfNAs4/cPOSw7Q2EAek994TrXuPHzCH/OzipGKm56OMSLwloz4h/RAV6b7wwU9hmaktiubh4k4QA3IHbojU/4brYCDtv1Fhs/1f4cKwGmAnn3c2I+WSrlW7QwMwbUDpZwq+nr7/hliRM7qFKhuiM4AZUHR+6u+P+25Pf9v1OHsAQIrzVG7jxGKW+Kw0otqLWF5a1cqWdfppbYOqlkQpK/12EUPXCkVYFeVebuxPnZ4WoKEL09CbCf+Um2h3leLsrMH7bFQa+7xY2k8MxAKj/jmTxdQZBMpYYMeLepkaR5rj8zYNbF0w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(23010399003)(3023799007)(6133799003)(11063799006)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S8xwa+CYpOdEQufpAD5aYSlRfmyumJzCKOW3RarQ5ZEww1g5YrhOJUzMulo3HWLTOC+lnQzP1i3BjGgNJGIoSoBBn783Juv2fvYHEXGGzFCCRdqYiRuYWCLaxpjmxLctxT4dbsocNxL6R7faP904Q1GSRzeizdZRwpQA/hJvVEDM00PHUpxHJkU9144gelRTvlykHpgnuBdgmfGU+NlhSi9YRPgC3mFarWuCVEsxaud32z9wpBcPjHgZFUnQXjG4lM57+Qv6saWYUjFA4GVEAoK/lC8IEjGbia+Ef+MkJiCrrpwyeQ/fpgu2YzNxcVaxRNEaE7V2Nuse2VFgPpZhZpoVjgtn4yMUN4cTNeDEVW2TjC26BnpADjprpLIK93ywKYuZezYvRRPVEK4ZR2zHewjp+fumMmuE9oZa+r2+jdG4IZFZBpEHQtat5Io3/P5Q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:00:38.4578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af617e14-0401-433d-2aaf-08df1fccc130
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254

From: Andrew Ballance <andrewjballance@gmail.com>

Register Rust callsites in __dyndbg and use the existing C dynamic debug
core for selection, prefixes, stack output and module lifetime handling.
Keep the original Rust format string in the catalogue and format actual
arguments through %pA, preserving the module prefix.

Keep the descriptor in static mut storage and access it through raw
pointers, following the RFC v2 design. Use the nested-field static
branch when jump labels are enabled; otherwise read the print flag via a
C helper. Initialize every callsite as disabled, independently of Rust
debug assertions, and let dynamic debug control its print state. Without
dynamic debug for the crate, keep messages disabled while type-checking
their arguments. Evaluate arguments only when enabled, and keep user
expressions outside the macro's unsafe block. Use match scrutinees to
keep formatting temporaries alive through the synchronous printing call.

Use used(compiler) for the descriptor: the GNU retain flag emitted by
plain used collides with the module loader's SHF_RO_AFTER_INIT flag.
Provide a host-test stub matching the existing printing macros.

Pass Kbuild's normalized module name through RUST_MODNAME for callsite
identity, independently of the existing module! log prefix. Keep metadata
items in a separate scope so implicit argument captures cannot be
shadowed by macro-internal names.

Function names are deliberately recorded as <unknown>; module, file,
line and original-format selection remain available without inferred
function names or compiler-specific name extraction.

Link: https://lore.kernel.org/rust-for-linux/20250620210533.400889-4-andrewjballance@gmail.com/
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
[Zhi: Rebase onto driver-core-testing; retain raw-pointer descriptor access;
 revise bitfield initialization, configuration gates, Kbuild
 module identity, macro hygiene and synchronous printing; retain
 <unknown> function metadata and add maintainer routing.]
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 MAINTAINERS                        |   2 +
 rust/Makefile                      |   3 +
 rust/bindings/bindings_helper.h    |   1 +
 rust/helpers/dynamic_debug.c       |  25 +++++
 rust/helpers/helpers.c             |   1 +
 rust/kernel/print.rs               |  53 +++++++--
 rust/kernel/print/dynamic_debug.rs | 165 +++++++++++++++++++++++++++++
 scripts/Makefile.build             |   1 +
 scripts/generate_rust_analyzer.py  |   1 +
 9 files changed, 246 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/dynamic_debug.c
 create mode 100644 rust/kernel/print/dynamic_debug.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index aec32deef0a1..ecd1312ab35a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9262,6 +9262,8 @@ S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
 F:	lib/test_dynamic_debug.c
+F:	rust/helpers/dynamic_debug.c
+F:	rust/kernel/print/dynamic_debug.rs
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..b8be882be0e0 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -173,6 +173,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
+	RUST_MODNAME=$(call name-fix-token,$(subst rustdoc-,,$@)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
 		-Zunstable-options --generate-link-to-definition \
@@ -388,6 +389,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
 	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
+	RUST_MODNAME=kernel \
 	$(RUSTDOC) --test $(filter-out --remap-path-scope=%,$(rust_flags)) \
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
@@ -647,6 +649,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
       cmd_rustc_library = \
 	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
+	RUST_MODNAME=$(call name-fix-token,$(modname)) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_flags) \
 		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 4b31aa7f432f..385d04090628 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -54,6 +54,7 @@
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/dynamic_debug.h>
 #include <linux/dma-resv.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/helpers/dynamic_debug.c b/rust/helpers/dynamic_debug.c
new file mode 100644
index 000000000000..0ede4ee2eb79
--- /dev/null
+++ b/rust/helpers/dynamic_debug.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dynamic_debug.h>
+#include <linux/printk.h>
+
+#ifdef CONFIG_DYNAMIC_DEBUG_CORE
+#ifndef CONFIG_JUMP_LABEL
+__rust_helper bool rust_helper_ddebug_enabled(struct _ddebug *descriptor)
+{
+	/* Match the C dynamic debug branch without creating a Rust reference. */
+	return descriptor->flags & _DPRINTK_FLAGS_PRINT;
+}
+#endif
+
+/* The printing helpers receive Rust fmt::Arguments for the %pA bridge. */
+__rust_helper void rust_helper_ddebug_print(struct _ddebug *descriptor,
+					    const char *prefix,
+					    const void *args)
+{
+	__dynamic_pr_debug(descriptor, "%s: %pA", prefix, args);
+	if (descriptor->flags & _DPRINTK_FLAGS_INCL_STACK)
+		dump_stack();
+}
+
+#endif
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 440fb7638e3c..9730ab7fa143 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -62,6 +62,7 @@
 #endif
 #include "drm.c"
 #include "drm_gpuvm.c"
+#include "dynamic_debug.c"
 #include "err.c"
 #include "fs.c"
 #include "fwctl.c"
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 0d62beeedca5..60502f2e614e 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -18,6 +18,10 @@
     },
 };
 
+#[cfg(CONFIG_DYNAMIC_DEBUG_CORE)]
+#[doc(hidden)]
+pub mod dynamic_debug;
+
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]
 #[export]
@@ -376,13 +380,24 @@ macro_rules! pr_info (
 ///
 /// Use this level for debug messages.
 ///
-/// Equivalent to the kernel's [`pr_debug`] macro, except that it doesn't support dynamic debug
-/// yet.
+/// Equivalent to the kernel's [`pr_debug`] macro.
+///
+/// Supports [dynamic debug] when `CONFIG_DYNAMIC_DEBUG` is enabled, or when
+/// `CONFIG_DYNAMIC_DEBUG_CORE` is enabled and the crate is built with
+/// `--cfg DYNAMIC_DEBUG_MODULE`. Messages can then be enabled and disabled at runtime,
+/// starting disabled. Rust's `debug_assertions` setting does not affect debug logging.
+/// Without dynamic debug for the crate, messages stay disabled. Disabled messages do not
+/// evaluate their formatting arguments, but the arguments are still checked at compile time.
+///
+/// Dynamic debug callsites can be selected by module, file, line, or format. Their function name
+/// is recorded as `<unknown>`, so selecting a Rust function by its name is not supported.
+/// The module selector uses Kbuild's module name, independently of the crate's log prefix.
 ///
 /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
 /// [`std::format!`] for information about the formatting syntax.
 ///
 /// [`pr_debug`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_debug
+/// [dynamic debug]: https://docs.kernel.org/admin-guide/dynamic-debug-howto.html
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 /// [`std::format!`]: https://doc.rust-lang.org/std/macro.format.html
 ///
@@ -393,12 +408,38 @@ macro_rules! pr_info (
 /// ```
 #[macro_export]
 #[doc(alias = "print")]
+#[expect(clippy::crate_in_macro_def)]
 macro_rules! pr_debug (
-    ($($arg:tt)*) => (
-        if cfg!(debug_assertions) {
-            $crate::print_macro!($crate::print::format_strings::DEBUG, false, $($arg)*)
+    ($($arg:tt)*) => ({
+        #[cfg(any(CONFIG_DYNAMIC_DEBUG, all(CONFIG_DYNAMIC_DEBUG_CORE, DYNAMIC_DEBUG_MODULE)))]
+        {
+            $crate::dynamic_debug!(__descriptor, ($($arg)*), {
+                match (
+                    const {
+                        match $crate::str::CStr::from_bytes_with_nul(crate::__LOG_PREFIX) {
+                            Ok(prefix) => prefix,
+                            Err(_) => panic!("the module log prefix must be a C string"),
+                        }
+                    },
+                    $crate::prelude::fmt!($($arg)*),
+                ) {
+                    // SAFETY: `dynamic_debug!` supplies a live, initialized static descriptor.
+                    // Its mutable fields are accessed only by the C dynamic debug code.
+                    (prefix, args) => unsafe {
+                        $crate::print::dynamic_debug::Descriptor::print(__descriptor, prefix, args)
+                    },
+                }
+            });
         }
-    )
+
+        #[cfg(not(any(CONFIG_DYNAMIC_DEBUG, all(CONFIG_DYNAMIC_DEBUG_CORE, DYNAMIC_DEBUG_MODULE))))]
+        {
+            // Keep checking arguments even when dynamic debug is unavailable.
+            if false {
+                $crate::print_macro!($crate::print::format_strings::DEBUG, false, $($arg)*)
+            }
+        }
+    })
 );
 
 /// Continues a previous log message in the same line.
diff --git a/rust/kernel/print/dynamic_debug.rs b/rust/kernel/print/dynamic_debug.rs
new file mode 100644
index 000000000000..da4c40ed8fcc
--- /dev/null
+++ b/rust/kernel/print/dynamic_debug.rs
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Callsite metadata and printing for dynamic debug.
+//!
+//! C header: [`include/linux/dynamic_debug.h`](srctree/include/linux/dynamic_debug.h).
+//!
+//! The printing macros place descriptors in `__dyndbg`. The existing C dynamic debug core
+//! discovers them at boot or module load and removes them before the module is freed.
+
+use crate::{
+    fmt,
+    prelude::*,
+    str::as_char_ptr_in_const_context, //
+};
+
+/// A dynamic debug callsite descriptor.
+///
+/// The [`crate::dynamic_debug!`] macro places descriptors at stable addresses in `__dyndbg`.
+#[repr(transparent)]
+pub struct Descriptor {
+    /// The C descriptor, exposed for static-branch field addressing.
+    pub inner: bindings::_ddebug,
+}
+
+impl Descriptor {
+    /// Creates an initially disabled descriptor.
+    pub const fn new(
+        module: &'static CStr,
+        file: &'static CStr,
+        format: &'static CStr,
+        line: u32,
+    ) -> Self {
+        // SAFETY: `_ddebug` contains raw pointers, integers and, with jump labels, a static key.
+        // All accept zero; the pointers and bitfields are filled in before publication.
+        let mut descriptor: bindings::_ddebug = unsafe { core::mem::zeroed() };
+        descriptor.modname = as_char_ptr_in_const_context(module);
+        descriptor.function = as_char_ptr_in_const_context(c"<unknown>");
+        descriptor.filename = as_char_ptr_in_const_context(file);
+        descriptor.format = as_char_ptr_in_const_context(format);
+
+        // C packs `lineno:18`, `class_id:6` and `flags:8` into an unsigned int. Bindgen's setters
+        // are not const, so encode the target's bitfield ordering explicitly. Truncate line numbers
+        // as the C bitfield assignment does.
+        let line = line & ((1 << 18) - 1);
+        let class = bindings::_DPRINTK_CLASS_DFLT;
+        let flags = bindings::_DPRINTK_FLAGS_NONE;
+        #[cfg(target_endian = "little")]
+        let bits = (line | (class << 18) | (flags << 24)).to_le_bytes();
+        #[cfg(target_endian = "big")]
+        let bits = ((line << 14) | (class << 8) | flags).to_be_bytes();
+        descriptor._bitfield_1 = bindings::__BindgenBitfieldUnit::new(bits);
+
+        #[cfg(CONFIG_JUMP_LABEL)]
+        // An all-zero key is `STATIC_KEY_INIT_FALSE`.
+        static_assert!(bindings::JUMP_TYPE_FALSE == 0);
+
+        Self { inner: descriptor }
+    }
+
+    /// Checks the print flag when jump labels are unavailable.
+    ///
+    /// # Safety
+    ///
+    /// `descriptor` must point to an initialized descriptor valid for this call. Concurrent access
+    /// to its fields must follow the C dynamic debug and jump label synchronization rules, without
+    /// conflicting Rust accesses.
+    #[cfg(not(CONFIG_JUMP_LABEL))]
+    #[inline]
+    pub unsafe fn enabled(descriptor: *mut Self) -> bool {
+        // SAFETY: The pointer is valid by the caller's guarantee. The helper uses the same flag
+        // access as the C dynamic debug branch, without forming a Rust reference to it.
+        unsafe { bindings::ddebug_enabled(&raw mut (*descriptor).inner) }
+    }
+
+    /// Prints arguments with the crate's log prefix and the dynamic debug prefixes.
+    ///
+    /// # Safety
+    ///
+    /// `descriptor` must point to an initialized descriptor valid for this call, whose string
+    /// pointers refer to valid NUL-terminated C strings. Concurrent access must follow the C
+    /// dynamic debug and jump label synchronization rules, without conflicting Rust accesses.
+    pub unsafe fn print(descriptor: *mut Self, prefix: &CStr, args: fmt::Arguments<'_>) {
+        // SAFETY: The descriptor is valid by the caller's guarantee. The helper uses the C string
+        // `prefix` and consumes `args` through `%pA` synchronously, so their borrows remain valid.
+        unsafe {
+            bindings::ddebug_print(
+                &raw mut (*descriptor).inner,
+                prefix.as_char_ptr(),
+                core::ptr::from_ref(&args).cast(),
+            )
+        };
+    }
+}
+
+/// Extracts only the format string for the callsite catalogue.
+///
+/// The original tokens are separately passed to `fmt!`, preserving implicit argument capture.
+#[doc(hidden)]
+#[macro_export]
+macro_rules! dynamic_debug_format {
+    ($format:expr $(, $($rest:tt)*)?) => {
+        // The C catalogue ends at the first NUL; Rust formatting still uses the full string.
+        match $crate::str::CStr::from_bytes_until_nul(concat!($format, "\0").as_bytes()) {
+            Ok(format) => format,
+            Err(_) => panic!("the format string must be NUL-terminated"),
+        }
+    };
+}
+
+/// Defines a callsite and evaluates a printing expression only when it is enabled.
+#[doc(hidden)]
+#[macro_export]
+#[cfg(not(testlib))]
+macro_rules! dynamic_debug {
+    ($descriptor:ident, ($($arg:tt)*), $body:block) => {{
+        // Keep item names out of the user's scope, including implicit format captures.
+        let (descriptor, enabled) = {
+            // `used(compiler)` avoids `SHF_GNU_RETAIN`, which the module loader interprets as
+            // `SHF_RO_AFTER_INIT`.
+            #[used(compiler)]
+            #[unsafe(link_section = "__dyndbg")]
+            static mut DESCRIPTOR: $crate::print::dynamic_debug::Descriptor =
+                $crate::print::dynamic_debug::Descriptor::new(
+                    $crate::c_str!(env!("RUST_MODNAME")),
+                    $crate::c_str!(file!()),
+                    $crate::dynamic_debug_format!($($arg)*),
+                    line!(),
+                );
+
+            #[cfg(CONFIG_JUMP_LABEL)]
+            // SAFETY: `DESCRIPTOR` contains an initialized false key at the specified field and
+            // remains valid until the C core unregisters the module's jump label entries.
+            let enabled = unsafe {
+                $crate::jump_label::static_branch_unlikely!(
+                    DESCRIPTOR,
+                    $crate::print::dynamic_debug::Descriptor,
+                    inner.key.dd_key_false
+                )
+            };
+
+            #[cfg(not(CONFIG_JUMP_LABEL))]
+            // SAFETY: The static descriptor is initialized and accessed only by the C helpers
+            // and dynamic debug core, which use the C synchronization rules.
+            let enabled = unsafe {
+                $crate::print::dynamic_debug::Descriptor::enabled(&raw mut DESCRIPTOR)
+            };
+
+            (&raw mut DESCRIPTOR, enabled)
+        };
+
+        if enabled {
+            let $descriptor = descriptor;
+            $body
+        }
+    }};
+}
+
+/// Stub for host doctests, matching [`crate::print_macro!`].
+#[cfg(testlib)]
+#[macro_export]
+macro_rules! dynamic_debug {
+    ($descriptor:ident, ($($arg:tt)*), $body:block) => {
+        ()
+    };
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4349108e75e1..19ed7f2a2d49 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -325,6 +325,7 @@ rust_allowed_features := arbitrary_self_types,asm_goto,generic_arg_infer,used_wi
 # modules case.
 rust_common_cmd = \
 	OBJTREE=$(abspath $(objtree)) \
+	RUST_MODNAME=$(call name-fix-token,$(modname)) \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
 	-Zallow-features=$(rust_allowed_features) \
 	-Zcrate-attr=no_std \
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index dc1219736f77..5c9cb4df6e48 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -104,6 +104,7 @@ def generate_crates(
         edition = edition if edition is not None else "2021"
         crate_env = {
             "RUST_MODFILE": "This is only for rust-analyzer",
+            "RUST_MODNAME": display_name.replace("-", "_"),
             **crates_envs.get(display_name, {}),
         }
         return {
-- 
2.53.0

