Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3238CFE7
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983952; cv=none; b=XTu+BoIXyqIeB+4CBspU6icougNPfSyEHp+KCOZxqZGlTi84VgS0j+mXlXfL0sWHdG2LzWhmIwlQOTrXlmK0UIJb6RO8ZpocK42cDitjFbQdLLfTnbGqA6uwFCDRNuwa079ZNwh/O7fS/wqRtj+ltbtTsSnqCwDRG0TmOovn8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983952; c=relaxed/simple;
	bh=fqcJ+PNsbp4v+0KD+uFOQcjUhnvq4xIKDznujFuU1YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bvb/erg3Zb/DoRZxEx/9xd7eceV2sOC8rxw7AlA+wZbY/s8uy2QrBMdHFjlLp1MKEpBTURRuuM0GYbOQu9+Q2siU1sc/yPBxycq5OeGv6xuKzByVIpnfykkkXQ8LArfyoQjBId3hDw6xiABWBhofF0qVg7VsFGqlcrbrrSbE0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=HFOO6Cxd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FLnwZUs4; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="HFOO6Cxd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FLnwZUs4"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6AD281D0014C;
	Tue, 31 Mar 2026 15:05:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 31 Mar 2026 15:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983950; x=
	1775070350; bh=MME7blCSKfrB8aY6o38GHKaZ+Be46+EQEu30KklWMd4=; b=H
	FOO6CxdxGbf28ebi3qgRO0OVd6ntEzTuyaVsURHXe3VYwD97+Z1SfjcAKgtB5JN6
	hNMkryZOrdp3LyBsYerzGb2m4/RCGDKWAta3W/RrgrW27xwL8AMH0scmuZ8gJqtg
	tOWgXPDe3sWNJtgHZBVvCbsUrMJ81GL/Avkx0OYZcmNaFqeqCQ5laYEIoRcdHTSv
	pkvvngQJvM/u/VlTNZZ8dfEL3jdcMXSfk14s0bBUoV/0ThhnS7KMze7Jo9dqUK0C
	26AC5zy5EA9ZGcIJPi+oN8ZD5XrUlXWSfCfhU4PAlHqylY+0mLGQ91pWnRn8dvGc
	GQy9t8fdpGGZiHRu5wPpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983950; x=1775070350; bh=M
	ME7blCSKfrB8aY6o38GHKaZ+Be46+EQEu30KklWMd4=; b=FLnwZUs4NnJD3nj8e
	T1Csgu694tmCYpxiz702Hx4IwwkPkpE0VZviq34EWTd7gqS9BURNflW3JZJrMkVO
	nHG1yKTU/SZzyHAv+SJR98ssRCFXowK14Ca8b6S3YuTQsLYyRzW5UTb3CzPewaWx
	DIHz0yVz3d2BvpY/G94+Vo1tcJTUGsxPpK1P/018yxSe5a7nUGpYxAY067OGBFw6
	QwT5IJoyNPI12vdZN803E7dn6gEINTr2cP5xZ1Nsk/b7dOVhPk4p0LtXMSiV4RBD
	Ks1TMV5HI35fonSP4Yjm+TYAgEki1I/i1OXnnCRDn7m5LCc7oQKq3rj8X47SRlgi
	pDp9w==
X-ME-Sender: <xms:DhvMaf1Ce-RBdx_1M4GmVg3yxx_GQqiEyABNyO1mBa0Vr4Q5Dipe1g>
    <xme:DhvMaVGUFZGlhOWaGp5AroVTeCGNfDAgrH15SpYe-72Pshpt_t_xi-Z3fcqoXh5uI
    3WIp32jvdhvMAm0XVv4nYIoiHzhY2CVn4CVhvvdfrQZ0dEJsLR_t0k>
X-ME-Received: <xmr:DhvMaU76BpBxQuHKRUw51T7bU9ggnCr7MoRJ8lWXrJ2Dzj1vsUjkJkC7jg_Hz1209lU3xSMKEPKP0CJOqNED0GQuO-ybXhafZ4SXM9bSH4s_5RI00vLe93pAA7x9gCrfH0Y_Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueduudehfedvtddtudfhtedutdetffdukeefudefieehveevudeutdeivdfg
    teejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepug
    grvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrg
    gurghhvggrugdrvghu
X-ME-Proxy: <xmx:DhvMaTu14tTwnM-OIWOBYTT5wLlQTlO692W8-teHXDmR77n24_gkXQ>
    <xmx:DhvMad5h_zwKp89tFo1SYS7-Ud69p_2TJYmeDk80YEm78wU-7NMbgw>
    <xmx:DhvMaWVt6HUmwP_CIRC1C85YtuK_LBB15bBmVOqThuQ-AzfQNiZMRw>
    <xmx:DhvMaX9lRv2Zajbpv-FMLxOV4NFov9UPg1iUZEIrLqt_Hmey2e2LJg>
    <xmx:DhvMaTnDj1GbnHrJyBfL32AIesfxjHIRUZmvtWBMBMK28G3fL0ZfpizG>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:48 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 05/16] bus1: add module scaffolding
Date: Tue, 31 Mar 2026 21:02:57 +0200
Message-ID: <20260331190308.141622-6-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ./ipc/bus1/ as the new home of the bus1 module. `uapi/linux/bus1.h`
will provide the user-space API, but is left blank for now.

The module setup and the user-space API are written in C with the intent
to expose a C API to the other parts of the kernel to use in the future,
if desired.

The internals of the bus1 module are written in Rust. The exposed C API
is defined in `lib.h` and only used inside of the bus1 module for now.
`bindgen` is used to generate Rust symbols for `lib.h` (and
`uapi/linux/bus1.h`) so we can avoid duplicating symbols of the C API in
the Rust code. This way, we can rely on the C header and the C API of
the Rust code to match.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 include/uapi/linux/bus1.h |  5 +++++
 init/Kconfig              | 12 ++++++++++++
 ipc/Makefile              |  2 +-
 ipc/bus1/Makefile         | 28 ++++++++++++++++++++++++++++
 ipc/bus1/lib.h            | 18 ++++++++++++++++++
 ipc/bus1/lib.rs           | 18 ++++++++++++++++++
 ipc/bus1/main.c           | 19 +++++++++++++++++++
 7 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/linux/bus1.h
 create mode 100644 ipc/bus1/Makefile
 create mode 100644 ipc/bus1/lib.h
 create mode 100644 ipc/bus1/lib.rs
 create mode 100644 ipc/bus1/main.c

diff --git a/include/uapi/linux/bus1.h b/include/uapi/linux/bus1.h
new file mode 100644
index 000000000000..4297e7a00ab9
--- /dev/null
+++ b/include/uapi/linux/bus1.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _UAPI_LINUX_BUS1_H
+#define _UAPI_LINUX_BUS1_H
+
+#endif /* _UAPI_LINUX_BUS1_H */
diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..20e8a577d9a7 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -502,6 +502,18 @@ config POSIX_MQUEUE_SYSCTL
 	depends on SYSCTL
 	default y
 
+config BUS1
+	tristate "Bus1 Capability-based IPC"
+	depends on RUST
+	help
+	  The Bus1 linux subsystem provides capability-based inter-process
+	  communication. It allows services and operating system tasks to
+	  exchange messages, send notifications, and transfer data and
+	  resources, using an object-capability system for implicit access
+	  control. It is highly scalable, yet guarantees causal ordering across
+	  all its operations, including the builtin object lifetime
+	  notifications.
+
 config WATCH_QUEUE
 	bool "General notification queue"
 	default n
diff --git a/ipc/Makefile b/ipc/Makefile
index c2558c430f51..6fa8c3b1c47c 100644
--- a/ipc/Makefile
+++ b/ipc/Makefile
@@ -9,4 +9,4 @@ obj-$(CONFIG_SYSVIPC_SYSCTL) += ipc_sysctl.o
 obj-$(CONFIG_POSIX_MQUEUE) += mqueue.o msgutil.o
 obj-$(CONFIG_IPC_NS) += namespace.o
 obj-$(CONFIG_POSIX_MQUEUE_SYSCTL) += mq_sysctl.o
-
+obj-$(CONFIG_BUS1) += bus1/
diff --git a/ipc/bus1/Makefile b/ipc/bus1/Makefile
new file mode 100644
index 000000000000..1f2fbbe8603f
--- /dev/null
+++ b/ipc/bus1/Makefile
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0
+
+quiet_cmd_bindgen = BINDGEN $@
+      cmd_bindgen = \
+	$(BINDGEN) $< -o $@ \
+		$(addprefix --allowlist-file=,$^) \
+		--ctypes-prefix kernel::ffi \
+		--no-debug '.*' \
+		--no-layout-tests \
+		--rust-target 1.68 \
+		--use-core \
+		-- \
+		$(c_flags) \
+		-D__BINDGEN__ \
+		-DMODULE \
+		-fno-builtin
+
+$(obj)/capi.rs: $(src)/lib.h $(srctree)/include/uapi/linux/bus1.h
+	$(call cmd,bindgen)
+
+$(obj)/lib.o: $(obj)/capi.rs
+$(obj)/lib.o: export BUS1_CAPI_PATH=$(abspath $(obj)/capi.rs)
+
+bus1-y :=		\
+	lib.o			\
+	main.o
+
+obj-$(CONFIG_BUS1) += bus1.o
diff --git a/ipc/bus1/lib.h b/ipc/bus1/lib.h
new file mode 100644
index 000000000000..e84c47f97031
--- /dev/null
+++ b/ipc/bus1/lib.h
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef __B1_LIB_H
+#define __B1_LIB_H
+
+/**
+ * DOC: C API of the Bus1 Rust Module
+ *
+ * This header exposes the C API of the Bus1 rust module. It provides the
+ * necessary hooks for the C module code to call into the rust code.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <uapi/linux/bus1.h>
+
+#endif /* __B1_LIB_H */
diff --git a/ipc/bus1/lib.rs b/ipc/bus1/lib.rs
new file mode 100644
index 000000000000..7c3364651638
--- /dev/null
+++ b/ipc/bus1/lib.rs
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+//! # Kernel Bus1 Crate
+//!
+//! This is the in-kernel implementation of the Bus1 communication system in
+//! rust. Any user-space API is outside the scope of this module.
+
+#[allow(
+    dead_code,
+    missing_docs,
+    non_camel_case_types,
+    non_snake_case,
+    non_upper_case_globals,
+)]
+pub mod capi {
+    include!(env!("BUS1_CAPI_PATH"));
+}
+
+const __LOG_PREFIX: &[u8] = b"bus1\0";
diff --git a/ipc/bus1/main.c b/ipc/bus1/main.c
new file mode 100644
index 000000000000..bd6399b2ce3a
--- /dev/null
+++ b/ipc/bus1/main.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#include <linux/init.h>
+#include <linux/module.h>
+#include "lib.h"
+
+static int __init b1_main_init(void)
+{
+	return 0;
+}
+
+static void __exit b1_main_deinit(void)
+{
+}
+
+module_init(b1_main_init);
+module_exit(b1_main_deinit);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Capability-based IPC");
-- 
2.53.0

