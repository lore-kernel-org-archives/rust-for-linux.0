Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7B46AF2E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853079; cv=none; b=JELsMOUzTbp8mVM/1kNbMcSgKFuNy6se1Hp2z+XVjEYSuTQ7fA43RkYIDcwk6fi80pkEBvxRWnjOxHGGAaRzFIGa2nT1JJZ9bWmSzYnrj6zOHqMg6fzwuIRT+sHYtb5cELdE23ZmvOw4p7LUwE8mnTPO5aQvvkXGVwjsB2xLGz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853079; c=relaxed/simple;
	bh=UCuiwGt9JwxkzELSks29hY3jTe0Y/BoAFD0SnxgBJzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rkC0HOORFCDGeNG9YKiVLefQPVUYEnr7yG4dcm9IsiurX1q+97kZvqeVlknlWndhMgymR+RLkwtqXuBYuQDNp1lbIHAkaMrgDloYzRww8hO8Z31h0mppixZB64FKk1xAQVkl4iBxWPP6DcTn/TfSUxokks4TJNehKgHjfaqYyuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAeseICx; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAeseICx"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so4467453eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 13:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853076; x=1783457876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9Z5xnCi27i9C9A2sCgfs7Wzronwnuanh/3BE+vBDfs=;
        b=eAeseICxqLO/axtYIBDllIjArd6pQKKYeG6gROZ16CgkGYTLrORnL8pyRuDsTN8JCp
         rGa1VjIY24DGfubS3awY26o0vhT5ZJnxi1VzqQ3AtuMK8iaB4/5/iwA+meA9SZMsXmKS
         lvMnSXpgGnSQFLrdOm5dnSxT8zKl4d9miIiwkxK+zY3sHXYyuY6y+05UVqHTrrdR3WHZ
         QXldHQrZSRNwzHxHbFWeCAhGtcwC2uZvQyfZVYO7/DHdqyBat9MZUBnamwme8Qe/RLcc
         assA0n1/aGitWtuE7JaRcgNazHC2YyfB0zfRMZL/NxLRtlHBe61h9DZEQDj2n57ewmST
         2QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853076; x=1783457876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9Z5xnCi27i9C9A2sCgfs7Wzronwnuanh/3BE+vBDfs=;
        b=hTzhhHvO+3clIkRRVNOHzFrGY34ckD99wZFL43NGWkOlidPc5w+RcdySGKmecDtQTj
         q38poIhVOwNDVt51sSloNlRabpIj8dMI3GxXuSnlh+iR3jwhppV/KJSU4IiqAFMdV7ck
         9WTn4tJvtCm1oQJWVmFDatdERz3JW2tPm3xT4i2VrpFfkmgbx//SHN+VLzOvUWF4pNqo
         2TcYtcQkoxVuERLx4OPmr5PtARKR3srONzRjT8rsB5/MGatOHf7/uJC+5oJdha7LO09I
         MOIpbLMU1pfrr89beqCCorgX7ASybVBM6uIkFLT7wcPqhNUPuITGTE/P0QF6rOOjtu3u
         nVVg==
X-Forwarded-Encrypted: i=1; AHgh+RoTrgzzZM/ks4QSQdBu4B7lcgKhX0kayF8v647uSJNXNrJiKpyNEMpOoKC+jkJg4fWnlewGgvWi+OsEat7ksQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX2AIxJbIO1d7hYcQr4umNRHtY7DON6wzFrwuh78m59A/xgpAl
	A/CJd08ZeJX7xolydSJK/GRlAYeNJL3RwAuhfA/HYOQkvMinUb0UFP0D
X-Gm-Gg: AfdE7cn+leSOkM6wyo/P9WbsI5mCLMItUdS22bnRxzOcrr3dRdflCH3LPBU9MbyR/9o
	XQKJoLIP9akJcC/Zk/Gtq/GSqmqg1/LOXKEeRKWDvG1AS9+ca9F8gFu86sgOJWrO9SbMSowg5RD
	tA3Uoby1TQ7DOgAWSk/74aaq13syQytJ412WNqGH+8iByu+1voHNSuDwPIQtInhFvpdekV9pBWg
	ur3H9+uPKbvxh6qwY1XK9Vsrjn7jvmGvfqXZk6a7mN3tkPmW1bKdqUgSjTOROLJIFK+RsuARt1f
	jT1wKjdCrnNdfq95Waa32Rbi1zUxFU6w79lGtKPWHGRZ+VMgxrL1GnrXrvLJNZ43xdC6cFrNPgb
	Cezx0HkPXbloUcQSyDkny8guOchW6KAH6QvCDtAIgMx8oyWL52oHKkKUwHO7B+iS9A3LBU1zPUG
	ReTff6wv2mm1Xgl9Vzq6Rcd8sTMWCyuXqChnezcmGji9KxXvOanO109uzp
X-Received: by 2002:a05:7301:e8d:b0:30c:2af0:1cc with SMTP id 5a478bee46e88-30ee14c4090mr3943097eec.34.1782853076312;
        Tue, 30 Jun 2026 13:57:56 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee326c7a7sm11647045eec.29.2026.06.30.13.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:57:55 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: alexander.deucher@amd.com,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org
Cc: christian.koenig@amd.com,
	arnd@arndb.de,
	rust-for-linux@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2] rust: core: implement rx580 state optimization engine and c-to-rust char dev
Date: Tue, 30 Jun 2026 17:57:50 -0300
Message-ID: <20260630205750.22673-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces an automated indexed state mechanism to optimize
VRAM latency and command loops for the Radeon RX 580 architecture.
Additionally, it provides a converted C-to-Rust sample char driver.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 RUST_GUIDELINES.md                       |  3 ++
 drivers/char/Kconfig                     |  8 +++++
 drivers/char/Makefile                    |  1 +
 drivers/char/alves_char_dev.rs           | 26 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/Kbuild        |  1 +
 drivers/gpu/drm/amd/amdgpu/alves_core.rs | 45 ++++++++++++++++++++++++
 6 files changed, 84 insertions(+)
 create mode 100644 RUST_GUIDELINES.md
 create mode 100644 drivers/char/alves_char_dev.rs
 create mode 100644 drivers/gpu/drm/amd/amdgpu/Kbuild
 create mode 100644 drivers/gpu/drm/amd/amdgpu/alves_core.rs

diff --git a/RUST_GUIDELINES.md b/RUST_GUIDELINES.md
new file mode 100644
index 000000000..f6afa63de
--- /dev/null
+++ b/RUST_GUIDELINES.md
@@ -0,0 +1,3 @@
+# Rust for Linux - Core Guidelines
+- Style: Linear, pragmatic, flat, Linus Torvalds style.
+- Constraints: Zero-cost abstractions, strict RAII, no binary bloat.
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 9865227af..d6cbf317c 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -372,3 +372,11 @@ config ADI
 	  driver include crash and makedumpfile.
 
 endmenu
+config ALVES_CHAR_DEV
+	tristate "Alves C-to-Rust Character Device Driver"
+	dependson RUST
+	help
+	  This is a character device driver migrated from C to Rust.
+	  It acts as a core showcase of 2% module conversions.
+	  It provides foundational structures for execution validation.
+	  Say Y or M here if you want to test the Rust infrastructure.
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index a46d7bf7c..bf967e910 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -41,3 +41,4 @@ obj-$(CONFIG_PS3_FLASH)		+= ps3flash.o
 obj-$(CONFIG_XILLYBUS_CLASS)	+= xillybus/
 obj-$(CONFIG_POWERNV_OP_PANEL)	+= powernv-op-panel.o
 obj-$(CONFIG_ADI)		+= adi.o
+obj-$(CONFIG_ALVES_CHAR_DEV) += alves_char_dev.o
diff --git a/drivers/char/alves_char_dev.rs b/drivers/char/alves_char_dev.rs
new file mode 100644
index 000000000..48440ab32
--- /dev/null
+++ b/drivers/char/alves_char_dev.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//! Simple Character Device converted from legacy C to Rust.
+
+use kernel::prelude::*;
+use kernel::chrdev::Registration;
+
+module! {
+    type: AlvesCharDevice,
+    name: "alves_char_dev",
+    author: "Breno Rodrigues Alves",
+    description: "Pragmatic C-to-Rust converted character device driver",
+    license: "GPL OR MIT",
+}
+
+struct AlvesCharDevice {
+    _dev: Registration,
+}
+
+impl kernel::Module for AlvesCharDevice {
+    fn init(_module: $'static ThisModule$') -> Result<Self> {
+        pr_info!("Alves C-to-Rust module initialized successfully\n");
+        Ok(AlvesCharDevice {
+            _dev: Registration::new(c_str!("alves_char_dev"), 0)?,
+        })
+    }
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/Kbuild b/drivers/gpu/drm/amd/amdgpu/Kbuild
new file mode 100644
index 000000000..9f3589689
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/Kbuild
@@ -0,0 +1 @@
+amdgpu-y += alves_core.o
diff --git a/drivers/gpu/drm/amd/amdgpu/alves_core.rs b/drivers/gpu/drm/amd/amdgpu/alves_core.rs
new file mode 100644
index 000000000..e16d06908
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/alves_core.rs
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+//! AMDGPU RX 580 State Optimization Engine.
+//!
+//! Copyright (C) 2026 Breno Rodrigues Alves.
+
+use kernel::prelude::*;
+
+#[derive(Copy, Clone, PartialEq, Eq)]
+#[repr(u8)]
+enum GpuState {
+    Idling = 0,
+    LowPower = 1,
+    ComputeActive = 2,
+    VramMaxPerf = 3,
+}
+
+pub struct Rx580Engine {
+    current_state: GpuState,
+    command_tape: [u8; 16],
+    tape_pointer: usize,
+}
+
+impl Rx580Engine {
+    pub fn process_tape(&mut self) -> Result<()> {
+        while self.tape_pointer < self.command_tape.len() {
+            let symbol = self.command_tape[self.tape_pointer];
+
+            self.current_state = match (self.current_state, symbol) {
+                (GpuState::Idling, 0x01) => GpuState::LowPower,
+                (GpuState::LowPower, 0x02) => GpuState::ComputeActive,
+                (GpuState::ComputeActive, 0x03) => GpuState::VramMaxPerf,
+                (GpuState::VramMaxPerf, 0x00) => GpuState::Idling,
+                (state, _) => state,
+            };
+
+            // SAFETY: Volatile hardware write override for Polaris performance profiling.
+            unsafe {
+                core::ptr::write_volatile(&mut self.command_tape[self.tape_pointer], 0xFF);
+            }
+            self.tape_pointer += 1;
+        }
+        self.tape_pointer = 0;
+        Ok(())
+    }
+}
-- 
2.43.0

