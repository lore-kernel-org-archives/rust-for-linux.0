Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A0245FFB0
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463136; cv=none; b=H1WM4UqkAIJwhqZyAn3NjQXibemeuVxwXjRLsWcBhqj9Nksr9yCzlsmY3DqjeE1Zo6+4TaiERnxvlI7a2j5E0v8Fxa5t2LH7iu3+iHDBh26MncFY5WB3YcsMM4+Bwgf/pcDzAGoPDDhYG0eTkPgW545+pTZ5Yf5t+n4l4xEB7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463136; c=relaxed/simple;
	bh=uuU/l9JF/iZowlXBWJE6m0AYJaBt58n13GwlZUkEpvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hc11e50W1Bw9WI+3rxVAsGw1TB3izIU7WIFoMIUYX7B543mcsww2zHeptiC7fHqDkiUPCKd00gzi9bVOZdYscA4d7T5k3TNzUAfUbZEC2veVpLX+GQFdpNqcP1PqDMQ4lHBhyq3vEn/TrZ30sWzs9Jll3L5LoyKsKitPQ6N7B88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4VW6TDW; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4VW6TDW"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c6so2932391b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463133; x=1790067933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSfuwonf/WIHgTGI6ifOt5SgGmeBPJ0PHGizN2q97L8=;
        b=T4VW6TDW/qIgh1YlQrTnXqlhA7JlJ2OUTU6Lnunhr22/woI5AP43fV1gBKSxhtcGI1
         MiQjvLSGIcU0oaULhZsLmvlifSEg65XY9oW/mgwKryxGDLLvlS2cWKClEN65UoH4XI6T
         XL6ZQNbEAESDgliuqu2mv9SDNjCAtm7Bcf2G64Am6fWK8+hF0GRwUiXj+fUw3/IurWWQ
         6VCrqDhpuZwp/kBNlk5WXdyXTReE0AV+NrQ9/CBXPx++6JkfNMNyQVj6gaZTtzCe5M6+
         kqUOo1A7KV7/xnd5nP1LUe9dhYk2rieJC+juKjdnwdRNC+/wFXLgPQxfZc4ak77djHrP
         kC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463133; x=1790067933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSfuwonf/WIHgTGI6ifOt5SgGmeBPJ0PHGizN2q97L8=;
        b=iqz+sdfrbRkG/2blgJbTBUNffA35+Rcz+6yAn5R1743w5WAditkV90w4H9GfsxvEH6
         Lhd6Wi8x95mCyx0qCrgkmjlA6go+JUxK1OkmZKkdeeDjwqpFSXvh1t2fMQkOmBbLGxo+
         1JMPPiN9MLXAOzvKbKNWS4bvP2uIV9/g3TCspBRx/bbvDdsCSoY9lZKVG977jtPQaxfA
         2E4sdUXLPR7BRCvgbexLgvfH7sVaDMFtuj8Ri1Qc+8+qGw6Zps/kU1oWJ+vFzGpGy8Of
         hZklvXpObIdwdhjvpq7VB7T9r32Eco3T8bCkyHS7eYKT8WGEQenjO83N6V0dYLhJswfr
         eAOg==
X-Forwarded-Encrypted: i=1; AKwUvByzr+9zV77gpVUyhr9jhz0tk/jXOA9XYijzskVUEy0u+HJQ7SqeISsy/oUz+tjlg0WSRzpvn3/n8XwhSPDN6w==@vger.kernel.org
X-Gm-Message-State: AFuF++nNsRncRtZWIuLtuk2rTTIpJnSm3NfhU7xtytJAfVNAWQuB7+m3
	KAGTcKOpumc+aFX4c+0Os+UTBGkFjnyp/mDf/rL63dOJlbtzWyF9mWyw
X-Gm-Gg: AYBFou1ZL/nteLHh6YrLqWm92Yg1x8MnphM5jR04LqNFWA0CBWkqdUU7HD8pSkw4uZd
	kZ3U0yQdjcQ8FQLXDWelLm7tEHAZzWA1y5Fu3aZlzmKcyQu7MDXopmtqDfUsLfE1R2IlFkIv0z3
	e4UsdzRW4B4BOJlhzqVhwjTHQKZZTPh50W1TWqDSVHL2viEX/nLDkYs0tM6BeBVJvH/X01Cwkuo
	TLP4qI4+gkkrJIdVrpH9qByFLOr6tmPZbOEdKHaqpmegNFYUmiuRkaFjOkx12hG7qsVnQWuuMmX
	5a9mhVV4nR/33WX/zKq/wHrurTMF78tcV6sFR/dJwbyq9XxSUDn1Q8nLYGq7Q7MxotLAWFyr/a6
	fW47bCNhT2wwNB8lx8foZyJ1sFe3ryQcyN8XG6TM42Pu567v6Q3KQwwlY39neeMcARZUkmNWylK
	W0hgMRqv8sGiZ3lxMBhF8GrTDOcmnmLIVwSnXEy0pXXEfmAELggQTLPWOgkwKaLb/YIUKVjvhuZ
	voNq13vSEM+S9BfWaivz35g1mQvI6nTiRlfeEeXWz7geh51qk0I2BYHcr/53As=
X-Received: by 2002:a05:6a20:d090:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3db40422652mr13861188637.10.1789463132520;
        Tue, 15 Sep 2026 02:05:32 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm6495512a12.30.2026.09.15.02.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:05:31 -0700 (PDT)
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
	david@davidgow.net,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc ARCH_WARN_ASM bug table emission
Date: Tue, 15 Sep 2026 14:34:53 +0530
Message-ID: <20260915090453.1227034-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915090453.1227034-1-mkchauras@gmail.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
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

Tested on ppc64le (ltcfujiaac-lp3, 7.3.0-rc1+): pass:5 fail:0 skip:0.
Tested on ppc32 Book3S (QEMU mac99 G4, chrp32_defconfig): pass:5 fail:0 skip:0.
Tested on ppc64le (QEMU pseries, pseries_le_defconfig): pass:5 fail:0 skip:0.

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/kernel/Kconfig.test |  13 +++
 rust/kernel/bug.rs       | 209 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 222 insertions(+)

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
index 3566f0234ca4..cd90bd511479 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -152,3 +152,212 @@ macro_rules! warn_on {
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
+
+    // LINE and BUG_KUNIT_FILE are only referenced by the {file}/{line}
+    // operands in global_asm!, which are only present when
+    // CONFIG_DEBUG_BUGVERBOSE is set (the non-verbose _EMIT_BUG_ENTRY
+    // drops the file/line fields from the bug table entry entirely).
+    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+    pub(super) const LINE: u32 = line!();
+
+    // Null-terminated source file name — the assembler references this symbol
+    // for the verbose file pointer in __bug_table, same as warn_flags!.
+    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+    const _FILE: &[u8] = file!().as_bytes();
+    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
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
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, CONFIG_PPC64, CONFIG_DEBUG_BUGVERBOSE))]
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
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, CONFIG_PPC64, not(CONFIG_DEBUG_BUGVERBOSE)))]
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
+    flags = const test_statics::FLAGS,
+    size  = const test_statics::SIZE,
+);
+
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, not(CONFIG_PPC64), CONFIG_DEBUG_BUGVERBOSE))]
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
+#[cfg(all(CONFIG_RUST_BUG_POWERPC_KUNIT_TEST, not(CONFIG_PPC64), not(CONFIG_DEBUG_BUGVERBOSE)))]
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

