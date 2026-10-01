Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EADC2DFA2F;
	Thu,  1 Oct 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866852; cv=fail; b=IWsn9WqaZlFRXZ3zZWP/TH98GaJdg71Nz1aeLEX2geiobizI5meSwyAL5LnXUZ6zcErzJYC+1h2WTV14Im5ezXvukXxabgkxeqZvxUDyfwpzEE/PMskcECJFUvSIxWOOff3jOxlH1WKFsGPvrm9+LnhOPZcEGAVM2BoZ6I5960M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866852; c=relaxed/simple;
	bh=+ecRKVTxZTZrtBEBzuEtzhPmyDzxqrR+4cJDuopSLsU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AmQIaQu1bzxlJog2sTz+x2TSJyndVu/tbcpOFR+zDPxKm9Ba6sMJgNokrhyQYFAN8CpnRfaQkyGuGRjHZiaF0pNCl/GAupvc34QqharqkpJkbleutTpIJ+n9s4rztiMt4+xr0z2lTQnSjBibM0QVFZqSLm93gQVUKgWJecTwJyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lGa3NT2N; arc=fail smtp.client-ip=40.93.196.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lGa3NT2N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJUV2Fmzw1FP7o2BQJJYrcGdJ+kvMxfZtCBdsf0uI83KE3MSbTD/gIsUro8bxoSOTxh0Tg4L1rV/t87bx+4Zv9dtdEiM1llgUtreJbAvIvjq9mwgorLyrl0ecqbqmvE59tX/5qcwOGQz3r2Lv945uIJYoGnCmS/gfFuMLRstGOKujAUC6MmsDp2FpIIJ0OYPKmYsPk8k59V1eGZeNrvQTZvwMFc4DftezhTLSqgrikg1OSsp4VH0tV7o8bIoFEpGjsVxNFjNJBnx4Ik9bGfwR4qTD6s2LGVdEqDDm+bbiQb5xeCrLJPnKOvauBWSyTVdpfBY+N1sRRXKY6iD/48TJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCHI0RtDpkyj48I+Ar7KpKjnFfVmBxd/TY3HEbhcvMU=;
 b=MjLYJsVgW6LJYP2V+CuaW6cC1CFGSdQal534NL+oC69mIDprA4R60SynYVU+rCLLRdruHAYWUXwksDNV8zxKvmCS3IoZvCyQeyan+zXrgQB3YPimuE+srzIUxDEPgHoHFd7PQ7mw0eG2RL320MwhlxQ+6Q7asuzl7jLz6rRn7CRSrlR0MSd7gtvUfwAXxr8xtArNzzEXxPaqrhRs/Q3i2rmL8GoBIiSKn+eoVOSiTnXQ2GWwmYNEf9J2adg7hy5pVP1iX2cpcwXSG6gt27BeSQHIHFHo6LE4NrWyUo0vvQAIZcZeULgl3kA75c5dOPpxe+fP3oB8QzzjN/nAwXs0Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCHI0RtDpkyj48I+Ar7KpKjnFfVmBxd/TY3HEbhcvMU=;
 b=lGa3NT2NkseCZKgHwEXCYwPhV0mAamFe4EO36qHt+0s8Lm9jv8xw36JRHrcz2wAr7pWhVJF7u2/TuBfpgzEuPqadjhb8QLmg/j4Pdk7W5ct74PaT8HZO6wnqK3B+gIbzHg9G3B5zEcBzHHKfYZ0iOjVQPfdM1oB/edRlYeHaXVBAEyTYqoCuzZDQFe6YJpQPzjYAjyB/AGP6bcThKvFPpJIeSg8WOw/0s8aX6LXJDca8b2XHH+fFoHJGq+GSVfB4DkwuUxlr3HxsFfNGYos4AMzu7bNXoWX8ZyDQR75OejIGW0rwQ5Pgf9lsKy32TifcZZrMM0jbsq2J0ZG0rXtnOQ==
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 15:00:42 +0000
Received: from BY1PEPF000264B5.namprd02.prod.outlook.com
 (2603:10b6:510:2cd:cafe::5e) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 15:00:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF000264B5.mail.protection.outlook.com (10.167.242.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 15:00:42 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 08:00:17 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 08:00:17 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 08:00:12 -0700
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
Subject: [PATCH v3 5/5] rust: device: add dynamic debug support to dev_dbg!
Date: Thu, 1 Oct 2026 17:59:40 +0300
Message-ID: <20261001145940.1077801-6-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B5:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9026b6-5483-4026-f793-08df1fccc3a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|7416014|1800799024|82310400026|22082099003|18002099003|3023799007|6133799003|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8i6CZ4mg3sNyKr0BXWuKdRlpMrKJLSLFJMDUrmeBayMMuMkUpb4OkBWTZjQ5axQ7UmSAc4SR74N8xaKviLOJbe5QahFeredsNjdj2RiaKs+9vayOnPUo3x5yeQeZRhgE9BJlCPQ5pyfRn7nYEfHpIz7P2Vv8bYKi1FXCUmAl683rGBZg34I9xI52DoZUB4psevHz7QwhLU4PeK+35nlkuaWhfhASyhnBTNaEkNaZl3lmYa5dIdgWuL2KTrgFpayefdMZfRcehib3ntv5xgQNPaeDaNG6tjVhImP5ibwSmzzAQdW7oGXbaXvA4BB2UitxrydZOqxvBmCud1tz9bUxyutHfLfsH2pWt4Cge6a1ueyblgp/BI96kIVPOGRNeJOisB5FlzH+6Q1p7m+ZN81FTOn9c3Rr/oLdBWnk3soqVrk8tWCjLABE2yjrRhYml+stgU+vBbD4Iwf2r+9XZ7c6FjE+16B598tPabTi66vZSLcQ3sHfzcK9RcWPx+9EWSI9pNnqwzF2XEJXuJlqgHZAabDEmtY+6VnqVGSexZkA2OuhL2XOx2mSMiLj9Fj12tC0Ije4XGW+Wdu0+TYVKJObUR/yUPLVPNZWn62/Bq1XsR9JluZyJnaThKj8j3miyvZI8kzQzbmiK13m3djDAGJT4CA2MLX221rDTjem89HemiCXF09mRhTiQJyes3w4rMWzmfdFj+j80EL/NwFXNUx05w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(7416014)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(6133799003)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H1E5qc40Wt4Qor1UfOvGR1r3oU4Hjqy1RguyW4CDIX392bjAFt6zofXRtsiSUJJnw7TpkBpBXrDUCZaskQbK6iYTz7PDjZ0szxXmr1/Pn+5jijyhybepS19LbXQHtxypbAneJBwDt7TrmmXMjFWNaUZVfTFkDQEaK36an/WrbkVhLQhSrOEht7L2LyfprXBke65GoZ96eTjkcyo2zOw2Stq6u9jUdBhfE35ZjgCPQw1rAVKuain+TDWwGc9on9TbjC13OKKfjO6r6aAWjgsqkKeBBeQZhgQjWMq1la+afPxsuYDL6wxt08Uhn/zCtJdneNFYTuP9S1qkJZP4PR9eIayoUFmi27poJag45ob7CObPIZeg+ECdUb23AvsS44K9eQkyy/DTRy/kdS5iGEEbyzM0pzDNEw2faZLJ+ofgrTBaGU5XWPx3kFi3Svb1K1Go
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:00:42.5558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9026b6-5483-4026-f793-08df1fccc3a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067

From: Andrew Ballance <andrewjballance@gmail.com>

Use Rust dynamic debug descriptors for dev_dbg! under DYNAMIC_DEBUG, or
DYNAMIC_DEBUG_CORE with a per-crate DYNAMIC_DEBUG_MODULE opt-in. Route
output through __dynamic_dev_dbg to retain device information and the
standard dynamic debug prefix controls.

Evaluate both the device expression and formatting arguments only when
the callsite is enabled. Calls start disabled and are controlled only by
dynamic debug. Without dynamic debug for the crate, type-check the
arguments without evaluating or printing them. Debug assertions no longer
control either path.

Make direct Device::pr_dbg() calls unconditional, like the other level
methods; callers needing callsite control and lazy evaluation use dev_dbg!.
No in-tree direct callers need conversion.

Document configuration, module selection and the explicit function-name
and embedded-NUL limitations.

Link: https://lore.kernel.org/rust-for-linux/20250620210533.400889-5-andrewjballance@gmail.com/
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
[Zhi: Rebase onto driver-core-testing; use the revised descriptor and
 printing bridge; keep device and argument evaluation conditional in
 both dynamic and fallback paths; keep caller expressions outside unsafe
 blocks while retaining their temporaries through each printing call.]
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 41 ++++++++++++++++++
 rust/helpers/dynamic_debug.c                  |  8 ++++
 rust/kernel/device.rs                         | 42 +++++++++++++++----
 rust/kernel/print/dynamic_debug.rs            | 27 ++++++++++++
 4 files changed, 110 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 9c2f096ed1d8..004312c0e9bc 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -390,3 +390,44 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Rust printing macros
+====================
+
+Rust ``pr_debug!`` and ``dev_dbg!`` use the same control file and boot or
+module parameters as their C counterparts. With ``CONFIG_DYNAMIC_DEBUG=y``,
+their callsites are initially disabled and can be enabled at runtime or
+through boot and module parameters. Rust's ``debug_assertions`` setting
+does not affect debug logging.
+
+With only ``CONFIG_DYNAMIC_DEBUG_CORE=y``, select the Rust crates to include
+in the catalogue using their Kbuild Rust flags, for example::
+
+  RUSTFLAGS_my_driver.o += --cfg DYNAMIC_DEBUG_MODULE
+
+Without dynamic debug for a crate, its ``pr_debug!`` and ``dev_dbg!`` calls
+stay disabled. Disabled calls do not evaluate their formatting arguments
+or device expressions, but their arguments are still checked at compile
+time. Keep required work and error handling outside those expressions.
+
+Rust callsites support the ``module``, ``file``, ``line`` and ``format``
+selectors. The module is the name supplied by Kbuild, including for callsites
+in nested Rust modules. Hyphens in this name become underscores, just as for C
+callsites. This name is independent of the prefix printed by ``pr_debug!``,
+which continues to use the name declared in ``module!``. The format is the
+original Rust format string, with ``{}`` placeholders, rather than the C
+``%pA`` formatting bridge.
+An embedded NUL ends the catalogue's copy of the format string; Rust
+formatting still uses the full string.
+
+Automatic Rust function names are not provided. The function field contains
+``<unknown>``, which is also what the ``f`` prefix flag displays. Use the
+other selectors to select Rust callsites; ``func`` cannot distinguish Rust
+functions. Rust callsites use the default, unclassified debug class.
+
+For example, to control a module named ``my_driver`` at load time or while
+it is running::
+
+  modprobe my_driver dyndbg=+p
+  echo 'module my_driver -p' > /proc/dynamic_debug/control
+  echo 'module my_driver +p' > /proc/dynamic_debug/control
diff --git a/rust/helpers/dynamic_debug.c b/rust/helpers/dynamic_debug.c
index 0ede4ee2eb79..fd2cfc57a3e6 100644
--- a/rust/helpers/dynamic_debug.c
+++ b/rust/helpers/dynamic_debug.c
@@ -22,4 +22,12 @@ __rust_helper void rust_helper_ddebug_print(struct _ddebug *descriptor,
 		dump_stack();
 }
 
+__rust_helper void rust_helper_ddebug_dev_print(struct _ddebug *descriptor,
+						const struct device *dev,
+						const void *args)
+{
+	__dynamic_dev_dbg(descriptor, dev, "%pA", args);
+	if (descriptor->flags & _DPRINTK_FLAGS_INCL_STACK)
+		dump_stack();
+}
 #endif
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6849..968ac16ebb91 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -370,14 +370,13 @@ pub fn pr_info(&self, args: fmt::Arguments<'_>) {
 
     /// Prints a debug-level message (level 7) prefixed with device information.
     ///
-    /// More details are available from [`dev_dbg`].
+    /// This method prints unconditionally. Use [`dev_dbg!`] for dynamic debug callsites and lazy
+    /// evaluation of the device and formatting arguments.
     ///
-    /// [`dev_dbg`]: crate::dev_dbg
+    /// [`dev_dbg!`]: crate::dev_dbg
     pub fn pr_dbg(&self, args: fmt::Arguments<'_>) {
-        if cfg!(debug_assertions) {
-            // SAFETY: `klevel` is null-terminated, uses one of the kernel constants.
-            unsafe { self.printk(bindings::KERN_DEBUG, args) };
-        }
+        // SAFETY: `KERN_DEBUG` is a null-terminated kernel log-level constant.
+        unsafe { self.printk(bindings::KERN_DEBUG, args) };
     }
 
     /// Prints the provided message to the console.
@@ -929,13 +928,19 @@ macro_rules! dev_info {
 ///
 /// This level should be used for debug messages.
 ///
-/// Equivalent to the kernel's `dev_dbg` macro, except that it doesn't support dynamic debug yet.
+/// Equivalent to the kernel's `dev_dbg` macro.
+///
+/// Supports [dynamic debug] with the same configuration and callsite selection as [`pr_debug!`].
+/// The function name is recorded as `<unknown>`. When a message is disabled, neither the device
+/// expression nor the formatting arguments are evaluated.
 ///
 /// Mimics the interface of [`std::print!`]. More information about the syntax is available from
 /// [`core::fmt`] and [`std::format!`].
 ///
 /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
 /// [`std::format!`]: https://doc.rust-lang.org/std/macro.format.html
+/// [dynamic debug]: https://docs.kernel.org/admin-guide/dynamic-debug-howto.html
+/// [`pr_debug!`]: crate::pr_debug!
 ///
 /// # Examples
 ///
@@ -948,5 +953,26 @@ macro_rules! dev_info {
 /// ```
 #[macro_export]
 macro_rules! dev_dbg {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_dbg, $($f)*) }
+    ($dev:expr, $($f:tt)*) => {{
+        #[cfg(any(CONFIG_DYNAMIC_DEBUG, all(CONFIG_DYNAMIC_DEBUG_CORE, DYNAMIC_DEBUG_MODULE)))]
+        {
+            $crate::dynamic_debug!(__descriptor, ($($f)*), {
+                match ($dev.as_ref(), $crate::prelude::fmt!($($f)*)) {
+                    // SAFETY: `dynamic_debug!` supplies a live, initialized static descriptor.
+                    // Its mutable fields are accessed only by the C dynamic debug code.
+                    (dev, args) => unsafe {
+                        $crate::print::dynamic_debug::Descriptor::dev_print(__descriptor, dev, args)
+                    },
+                }
+            });
+        }
+
+        #[cfg(not(any(CONFIG_DYNAMIC_DEBUG, all(CONFIG_DYNAMIC_DEBUG_CORE, DYNAMIC_DEBUG_MODULE))))]
+        {
+            // Keep checking arguments even when dynamic debug is unavailable.
+            if false {
+                $crate::dev_printk!(pr_dbg, $dev, $($f)*);
+            }
+        }
+    }};
 }
diff --git a/rust/kernel/print/dynamic_debug.rs b/rust/kernel/print/dynamic_debug.rs
index da4c40ed8fcc..e7250013998f 100644
--- a/rust/kernel/print/dynamic_debug.rs
+++ b/rust/kernel/print/dynamic_debug.rs
@@ -8,6 +8,10 @@
 //! discovers them at boot or module load and removes them before the module is freed.
 
 use crate::{
+    device::{
+        Device,
+        DeviceContext, //
+    },
     fmt,
     prelude::*,
     str::as_char_ptr_in_const_context, //
@@ -90,6 +94,29 @@ pub unsafe fn print(descriptor: *mut Self, prefix: &CStr, args: fmt::Arguments<'
             )
         };
     }
+
+    /// Prints arguments with device information and the dynamic debug prefixes.
+    ///
+    /// # Safety
+    ///
+    /// `descriptor` must point to an initialized descriptor valid for this call, whose string
+    /// pointers refer to valid NUL-terminated C strings. Concurrent access must follow the C
+    /// dynamic debug and jump label synchronization rules, without conflicting Rust accesses.
+    pub unsafe fn dev_print<Ctx: DeviceContext>(
+        descriptor: *mut Self,
+        dev: &Device<Ctx>,
+        args: fmt::Arguments<'_>,
+    ) {
+        // SAFETY: The descriptor is valid by the caller's guarantee and `dev` is alive for this
+        // call. The helper consumes the `%pA` arguments synchronously without retaining them.
+        unsafe {
+            bindings::ddebug_dev_print(
+                &raw mut (*descriptor).inner,
+                dev.as_raw(),
+                core::ptr::from_ref(&args).cast(),
+            )
+        };
+    }
 }
 
 /// Extracts only the format string for the callsite catalogue.
-- 
2.53.0

