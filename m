Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF337C0ED
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Sep 2026 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196388; cv=none; b=nsR1V+0srdbMuYadt4dkpsEB1bacoujvDLC/W89WYnZPv4+vpJhOjNTYLUWFfpuqvsEsSuYZEYQ2unDYDE67PXBJH9MmZzBmkUkKPuYs5hNo7ssnl3yFcXLBk0i6DWwm4rogkJ+1qXl4qiTDeUI6XWjasIYlaXZiEF3ow+Xhb5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196388; c=relaxed/simple;
	bh=BD08R8Sa4D4ClCOUP4lcnJAg26ODnIk2NBjsrklw5rc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLddQMSmTzvBad1GYBwvedPbdDzsmJ1t9uQlTFx5NRoxKYbSIUpo5Mmf9CdhVJICu2HSctT7u4Zx195CKIIs1FHROsV0OaETP65rHMcwgsHy+hfBeu7VQzZYIAAhA1Fqn0ffUGi8gw9d6kufsZeUdxVp/NGyf0flytpUXswz+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rW62vY6d; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rW62vY6d"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1719385a91.2
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196385; x=1789801185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQBQeHY/m2oxf/tBIxLoCVyblcJokzqcMJJjpX+vwvU=;
        b=rW62vY6d0Ij8FTgR3pM1fF+Q5OQicht8TqOl2ElZaolgRZF7MQ0eHxAovCY48suAnC
         rxRdPp0xdVi7qRL4YQvD9Quc0ako+afmgrUmfNFT8KRAJB0WehJooGxIjs6iUSyVFMts
         fz4N1WTJIt+bEsgJtk0AWZKVMgSshu30UHJUNlZjPkG8zW4FQid1bf+DVcmEkahYpnxq
         i2nnbL0vk8ZOy97LbId3zo0/wlOPWyOEE5nD1RMiQHeG039u0NNmZ3JAyZmtsrKHjInZ
         yP5Rc7CUbcts5kQuiGmByPiWaTK369gyZH3nnqqX90ScyF3XR/wTZ1LYejIjUegxNui5
         7oZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196385; x=1789801185;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQBQeHY/m2oxf/tBIxLoCVyblcJokzqcMJJjpX+vwvU=;
        b=nvRC7UQ9WgSIoAfbTJIafJdr16gl+MfOarGCc1q298Mx3cYJqXkloK6YdrUkotLQTO
         52EN5tFqD7/JGdu6rYBZuTSHARVntDBEUxB8QNGw/srdCzpWY1NV3uLtwR4ibgOnZTFX
         6O7q2dFYbgenUFpAe5zSgOAtuIuVkWGeugEns1yb2yRbNvx/ga5xv3pkYsUzQnJ9sY0C
         nWB8PoDbI/Z5Fi6yPtgF2ouNJ3/INIvMyVuZE6MJZMq0F8MIXjWj/lDXHtnkBhbykuI8
         DTsVSs2/rBAzQh2oJB/mY1PPegX1X4L7FlR1A/qwKBheLDr3wZSDycTN1MBgrtvQofMq
         4evg==
X-Forwarded-Encrypted: i=1; AKwUvBx3QH7HWOeUODEIYSn+QC5QBsqI6X20taoko9iSpCOKpptPsENwFp1jUB8/xpctS3QkKm174dv+xeh7sn/Tpw==@vger.kernel.org
X-Gm-Message-State: AFuF++lgyDJc8vt2QmSDFkjevNXzrNY24HDx1Fju8BKVx4QNh5/kVmKf
	PfzDr53NPOBFSCCsbUC9AX4LdehQXptDxIVg/yRuqJmP8rnb1oJM/d1M
X-Gm-Gg: AYBFou3u7YXIdw7LkfpWFXZe4mzQrt2COGrhDck3I53j1h6PH53iPiaa+uXK4MRfKBD
	fwGS/V7Wt2gi75t1+WrreAamHG/510R/w49snPTFhLlE7fozKzM7wA44EcRZGOeZ/K+gaXKf5Pr
	Q7Kac8udZwOmuaTh+hIYc/O4JJLmJ/nBimNgvUAOMMKwTBs6SzOkQflOLous3tjWCprLI/Qior8
	cH5W2l80o9k0Bk3O+2cRaqTlI6d9cruMJtDJCexpozsuN2XFdUVrqI5Pq382hxGjKvA0N3nInJ1
	FHRYqH/jZPqFpbiekBPp7UIcSGeo2VDET+s6oXAZ0CxoYbuen4+igxZU5iKGY0I2Lp8jSuQ/AFH
	038wYodwOW7wAQvdPy6BOkuje7NfX+FUcbKbfatPE7XAUj8dJk6AswIScrjnfNsIUcdunmULCx0
	GkUrfM/pLN8HK3I0ljmPw1IzKeaVEXEquod7F7+oEtd011lQKHo4H/5hQfjcDAIz06UbjX9Mrrp
	adE3TK0bWFN3SDxNupkuFfBH4HFfHYUELSAxit8CaZaTA==
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr13190186a91.1.1789196384673;
        Fri, 11 Sep 2026 23:59:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:44 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 2/2] rust: kernel: Add KUnit tests for powerpc ARCH_WARN_ASM bug table emission
Date: Sat, 12 Sep 2026 12:29:02 +0530
Message-ID: <20260912065902.24017-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912065902.24017-1-mkchauras@gmail.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Verify that the __bug_table entry emitted by ARCH_WARN_ASM has a correct
bug_addr displacement — i.e. the '1b' label reference in _EMIT_BUG_ENTRY
resolves to the trap instruction — by calling find_bug() with the exact
virtual address of the twi instruction, mirroring what the real powerpc
trap handler does.

The trap address is captured at link time via a .dc.a 1b relocation placed
in .data by the global_asm! block. global_asm! is used instead of asm!
because LLVM eliminates asm! blocks in dead branches; global_asm! is
file-scope and always emitted. BUG_KUNIT_TRAP_ADDR is defined as a .global
symbol directly on the .dc.a word so the linker relocation lands on it —
a Rust static initialized to zero would end up in BSS where relocations are
not applied.

.dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
so BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust side, making the
tests correct on both ppc32 and ppc64. The global_asm! block is split into
two cfg-gated variants (CONFIG_PPC64 / !CONFIG_PPC64) to select the right
.balign since concat!() only accepts literals.

Five tests are included in the rust_kernel_bug_powerpc suite:

  bug_entry_found         - find_bug() returns non-NULL for the trap address,
                            proving the bug_addr displacement is correct
  bug_entry_is_warning    - the emitted entry has BUGFLAG_WARNING set
  bug_entry_file          - bug_get_file_line() returns the correct source
                            file (requires CONFIG_DEBUG_BUGVERBOSE)
  bug_entry_line          - the recorded line number is non-zero, confirming
                            the {line} operand was substituted correctly
                            (requires CONFIG_DEBUG_BUGVERBOSE)
  bug_entry_addr_is_in_text - kernel_text_address() confirms the trap address
                            lies in kernel text, not data or zero

The suite is named rust_kernel_bug_powerpc and the Kconfig option
CONFIG_RUST_BUG_POWERPC_KUNIT_TEST depends on PPC && GENERIC_BUG,
covering both ppc32 and ppc64.

Tested on ppc64le pSeries: pass:5 fail:0 skip:0.
Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0.
Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0.

Assisted-by: LLM
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/kernel/Kconfig.test |  13 +++
 rust/kernel/bug.rs       | 171 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..5a82f0812c89 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -83,4 +83,17 @@ config RUST_BITFIELD_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_BUG_POWERPC_KUNIT_TEST
+	bool "KUnit tests for powerpc ARCH_WARN_ASM bug table emission" if !KUNIT_ALL_TESTS
+	depends on PPC && GENERIC_BUG
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests that verify ARCH_WARN_ASM emits a
+	  correct __bug_table entry on powerpc (both ppc32 and ppc64): the
+	  bug_addr displacement must resolve back to the trap instruction so
+	  that find_bug() can locate the entry — exactly as the real trap
+	  handler does.
+
+	  If unsure, say N.
+
 endif
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 3566f0234ca4..da43e62ddcdd 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -152,3 +152,174 @@ macro_rules! warn_on {
         cond
     }};
 }
+
+// Test-only constants and file static referenced by the global_asm block below.
+//
+// global_asm! is file-scope and always emitted — LLVM cannot eliminate it,
+// unlike asm! inside a function which is subject to dead-code removal.
+//
+// BUG_KUNIT_TRAP_ADDR is declared as a .global symbol entirely inside the
+// global_asm! block so the .dc.a 1b relocation lands directly on it.
+// A Rust static initialized to zero would end up in BSS; the linker does
+// not apply relocations to BSS, so the address would stay zero at runtime.
+#[cfg(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST)]
+mod test_statics {
+    use crate::bindings::{bug_entry, BUGFLAG_WARNING, TAINT_WARN};
+
+    pub(super) const FLAGS: u32 = BUGFLAG_WARNING | (TAINT_WARN << 8);
+    pub(super) const SIZE: usize = core::mem::size_of::<bug_entry>();
+    pub(super) const LINE: u32 = line!();
+
+    // Null-terminated source file name — the assembler references this symbol
+    // for the verbose file pointer in __bug_table, same as warn_flags!.
+    const _FILE: &[u8] = file!().as_bytes();
+    #[no_mangle]
+    pub(super) static BUG_KUNIT_FILE: [u8; _FILE.len() + 1] = {
+        let mut bytes = [0u8; _FILE.len() + 1];
+        let mut i = 0;
+        while i < _FILE.len() {
+            bytes[i] = _FILE[i];
+            i += 1;
+        }
+        bytes
+    };
+}
+
+// Emit ARCH_WARN_ASM at file scope and capture the trap address.
+//
+// BUG_KUNIT_TRAP_ADDR is defined as a .global symbol right on top of the
+// .dc.a 1b directive so the linker resolves the relocation directly into
+// that symbol's storage — no BSS, no zero-init problem.
+// .dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
+// matching the usize declaration on the Rust side.
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, CONFIG_PPC64))]
+::core::arch::global_asm!(
+    concat!(
+        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+        ".pushsection .data\n\t",
+        ".balign 8\n\t",
+        ".global BUG_KUNIT_TRAP_ADDR\n\t",
+        "BUG_KUNIT_TRAP_ADDR:\n\t",
+        ".dc.a 1b\n\t",
+        ".popsection\n",
+    ),
+    file  = sym test_statics::BUG_KUNIT_FILE,
+    line  = const test_statics::LINE,
+    flags = const test_statics::FLAGS,
+    size  = const test_statics::SIZE,
+);
+
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, not(CONFIG_PPC64)))]
+::core::arch::global_asm!(
+    concat!(
+        include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+        ".pushsection .data\n\t",
+        ".balign 4\n\t",
+        ".global BUG_KUNIT_TRAP_ADDR\n\t",
+        "BUG_KUNIT_TRAP_ADDR:\n\t",
+        ".dc.a 1b\n\t",
+        ".popsection\n",
+    ),
+    file  = sym test_statics::BUG_KUNIT_FILE,
+    line  = const test_statics::LINE,
+    flags = const test_statics::FLAGS,
+    size  = const test_statics::SIZE,
+);
+
+#[cfg(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST)]
+#[::kernel::macros::kunit_tests(rust_kernel_bug_powerpc)]
+mod tests {
+    use crate::bindings;
+
+    fn trap_addr() -> usize {
+        // BUG_KUNIT_TRAP_ADDR is a .global symbol defined in the global_asm!
+        // block above, placed in .data at the exact .dc.a 1b relocation word.
+        // The linker resolves it to the virtual address of the twi instruction
+        // before any Rust code runs, so reading it here is always safe.
+        extern "C" {
+            // .dc.a emits a pointer-width word: 4 bytes on ppc32, 8 on ppc64.
+            // usize matches the native pointer width on both.
+            static BUG_KUNIT_TRAP_ADDR: usize;
+        }
+        // SAFETY: read-only after link time, no concurrent mutation possible.
+        unsafe { BUG_KUNIT_TRAP_ADDR }
+    }
+
+    /// The `__bug_table` entry emitted by `ARCH_WARN_ASM` must be locatable
+    /// via `find_bug()` using the trap instruction's address.  A NULL result
+    /// means the `1b` label reference in `_EMIT_BUG_ENTRY` resolved to the
+    /// wrong address and the real trap handler would not recognise the site.
+    #[test]
+    fn bug_entry_found() {
+        // Non-zero proves the .dc.a relocation was resolved by the linker.
+        assert!(trap_addr() != 0);
+
+        // SAFETY: find_bug() is always safe to call with any address; it
+        // simply walks __bug_table and returns NULL if nothing matches.
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        // Non-NULL proves the bug_addr displacement in _EMIT_BUG_ENTRY is correct.
+        assert!(!entry.is_null());
+    }
+
+    /// The emitted entry must be flagged as a warning (not a hard BUG).
+    #[test]
+    fn bug_entry_is_warning() {
+        assert!(trap_addr() != 0);
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        assert!(!entry.is_null());
+        // SAFETY: entry is non-null and points to a valid bug_entry.
+        let flags = unsafe { (*entry).flags } as u32;
+        assert!(flags & bindings::BUGFLAG_WARNING != 0);
+    }
+
+    /// With `CONFIG_DEBUG_BUGVERBOSE` the entry must record a non-null file
+    /// pointer pointing back into this source file.
+    #[test]
+    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+    fn bug_entry_file() {
+        use core::ffi::CStr;
+
+        assert!(trap_addr() != 0);
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        assert!(!entry.is_null());
+
+        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
+        let mut line: u32 = 0;
+        // SAFETY: entry is non-null and valid; file_ptr and line are local
+        // variables passed as out-parameters.
+        unsafe { bindings::bug_get_file_line(entry, &mut file_ptr, &mut line) };
+
+        assert!(!file_ptr.is_null());
+        // SAFETY: file_ptr is a null-terminated C string from BUG_KUNIT_FILE.
+        let file_str = unsafe { CStr::from_ptr(file_ptr) }.to_str().unwrap_or("");
+        assert!(file_str.contains("bug"));
+    }
+
+    /// With `CONFIG_DEBUG_BUGVERBOSE` the recorded line number must be
+    /// non-zero (a zero line would mean the asm operand was not substituted).
+    #[test]
+    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+    fn bug_entry_line() {
+        assert!(trap_addr() != 0);
+        let entry = unsafe { bindings::find_bug(trap_addr()) };
+        assert!(!entry.is_null());
+
+        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
+        let mut line: u32 = 0;
+        // SAFETY: entry is non-null and valid.
+        unsafe { bindings::bug_get_file_line(entry, &mut file_ptr, &mut line) };
+
+        assert!(line != 0);
+    }
+
+    /// The trap address stored in `__bug_table` must lie within the kernel
+    /// text segment.  If the label reference in `_EMIT_BUG_ENTRY` resolved
+    /// to data or zero, `kernel_text_address()` would return false.
+    #[test]
+    fn bug_entry_addr_is_in_text() {
+        assert!(trap_addr() != 0);
+        // SAFETY: kernel_text_address() is always safe to call with any addr.
+        let in_text = unsafe { bindings::kernel_text_address(trap_addr()) };
+        assert!(in_text != 0);
+    }
+}
-- 
2.55.0

