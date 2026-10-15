Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB825326CC
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076256; cv=none; b=P+vBw9JWqjeYvCl+WwReKnLGgRAZPhlxzodTTraYAIScShLQBgcvXwVxKEX4Jc6xyd4YivpjBE3NUNLpw86THzX03GNMAqHNG9SXDNLFLaJC7G9YbMJb5KymV2lf7sqZvfyLUTnNqrUbl9KeeewOZsbsHy2RdSRIMPCyCbJstIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076256; c=relaxed/simple;
	bh=nbtf2aJFUaL/4iH/qLfpXzTeoJ6Tlhbj6DaOj27+188=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=n3QZHmqL6kJMGjxkD08g4Wys5UENgWLgpJ7VvSvMXg3jVb10Eiqoo1rBuNLnsPhXcijiXrMDMb/Y/d9yRTURUpZoHBM5UcDIekEbkoQFVdCNrnygadGF2JcZdPdRpZnIOfAKM5LfUTQBhSxA1gQOUh0XrOfjYJh6Dd34M0bEM1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EZasvRAj; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EZasvRAj"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so17262835e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792076250; x=1792681050; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gOPLD1Nk0xD9uDIf10OzE40FWH2sqAvdDlcLSS3lQok=;
        b=EZasvRAjos5Z9twr/kI65YM9wdYqGfB5UoPJL2pol/ju2uoTKdBPr1nyQUP/ZLLMIH
         MBnG3IlODF05yBX1GwZnYJyGhJrnycv6DNblJkwzq6+/QaCwQph7gA1Z1xwFj6WXVcef
         W+raxletovlSkMJaiylCjoiSQKMYcaZ5XmQT/jk294q+1UgkPGArMzrVkyjoJec0N+tc
         /HaDgv+NV1EuwfpLLJtOorWdwscXBr4aPN1447opaOPfFN6R51vLspa4th4Xc24J3BqZ
         1Mjs8Rt01sA+voKP7UkAyrGoDlmYdL5WZqdP9FsFWko60LE0zw/gH0WHPloWplgHccUx
         UI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076250; x=1792681050;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOPLD1Nk0xD9uDIf10OzE40FWH2sqAvdDlcLSS3lQok=;
        b=KwnnPGfCVaBEGz/ZBWnLxlfGvU4CJ/uxu1xpVjOSPtmsjh683evycv1ITYNUhFgG77
         BRt3i9f/9UZR6jym8ZAq1K50zjUJFNe8NVyeroAccuKgk6ZqQCRGnRE7EqBG0LWuTdkW
         suhzIKgT05ZGKFr7z/9s8ael6UPWuiDY5S+7NltdumTOAc2diEdyexRGYc0FuAQrNpHe
         MAzH0+3PVyk6BH6qBvJKMeqcbyGp7F8X4bibO2sK6KFJJUa9XTCvs9ZJdgQwcAdr58dN
         JDII1CIR2DKxT2+2SVzfilNVfFb/LDY6hwxfSJ+uJKTS43MTiS7cO17/xpuPKwNPFPEw
         9TPg==
X-Forwarded-Encrypted: i=1; AKwUvBz8+PEKvzNwrSw+0QKxWl+7m+Vs30nIJGbUFWzdDoTQDI5lyt7+pv6n+s3xZcJ6iR50FPfSMhRr0FutvItDpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvkegB5oGBUbmn7SnqOeqi5ATMQppkecvek6YRvaOmKcB4pLka
	CDzoIA10sIE2aJzXNpeyaVmF8XMVhGZpX+IN3tLunitBgWn3qJVXBSLTqGrJbVcHMFL8iXrGCz1
	QGQ==
X-Received: from wmbgx18.prod.google.com ([2002:a05:600c:8592:b0:4a1:7fbd:344d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3f16:b0:4a0:2150:55fb
 with SMTP id 5b1f17b1804b1-4a18e44395bmr382529505e9.4.1792076250083; Thu, 15
 Oct 2026 07:57:30 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:56:14 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015145714.3327543-1-elver@google.com>
Subject: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports ThreadSanitizer instrumentation via LLVM, which is what
KCSAN relies on; however, Rust code is not currently instrumented.

Pass -Zsanitizer=thread and the same TSan backend options used for C
code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
with C (though rustc currently rejects linking crates with mismatched
instrumentation).

rustc only accepts -Zsanitizer=thread for targets that declare support
for it. Of the targets used by the kernel, this is only possible for the
generated x86_64 target specification, so restrict instrumentation of
Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
Rust code remains uninstrumented as before.

All TSan options used are supported by the LLVM versions of the minimum
supported rustc, so no rustc-option checks are needed (they would also
fail, because x86_64-unknown-none used for option checks does not
support -Zsanitizer=thread).

Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
omitted for Rust because rustc provides no corresponding option. While
disabling tail-call optimizations helps preserve complete stacks traces
in reports, it is optional and not required for KCSAN to function.

With this enabled we can detect data races in kernel Rust code and
between Rust and C code.

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Add note on -fno-optimize-sibling-calls to commit message.
---
 Documentation/dev-tools/kcsan.rst |  7 +++++++
 lib/Kconfig.kcsan                 |  7 +++++++
 scripts/Makefile.kcsan            | 13 +++++++++++++
 scripts/Makefile.lib              |  3 +++
 scripts/generate_rust_target.rs   |  2 +-
 5 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
index 8575178aa87f..3bb8754f844b 100644
--- a/Documentation/dev-tools/kcsan.rst
+++ b/Documentation/dev-tools/kcsan.rst
@@ -14,6 +14,9 @@ Usage
 KCSAN is supported by both GCC and Clang. With GCC we require version 11 or
 later, and with Clang also require version 11 or later.
 
+Rust code is instrumented as well on architectures whose Rust target supports
+it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
+
 To enable KCSAN configure the kernel with::
 
     CONFIG_KCSAN = y
@@ -121,6 +124,10 @@ the below options are available:
 
     KCSAN_SANITIZE := n
 
+  Note that ``rustc`` rejects linking crates built with and without KCSAN
+  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o``
+  cannot currently be used for Rust code.
+
 .. _"Marking Shared-Memory Accesses" in the LKMM: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/access-marking.txt
 
 Furthermore, it is possible to tell KCSAN to show or hide entire classes of
diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index 4ce4b0c0109c..f0096e1c8b61 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -10,6 +10,13 @@ config HAVE_KCSAN_COMPILER
 	  For the list of compilers that support KCSAN, please see
 	  <file:Documentation/dev-tools/kcsan.rst>.
 
+config HAVE_KCSAN_RUSTC
+	def_bool RUST && X86_64
+	help
+	  rustc only accepts -Zsanitizer=thread for targets that declare
+	  support for it; of the kernel's Rust targets, only x86_64 does.
+	  Elsewhere, Rust code is not instrumented.
+
 menuconfig KCSAN
 	bool "KCSAN: dynamic data race detector"
 	depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
index 19f693b68a96..01af6fd71006 100644
--- a/scripts/Makefile.kcsan
+++ b/scripts/Makefile.kcsan
@@ -24,3 +24,16 @@ kcsan-cflags += $(call cc-option,$(call cc-param,tsan-instrument-func-entry-exit
 endif
 
 export CFLAGS_KCSAN := $(kcsan-cflags)
+
+ifdef CONFIG_HAVE_KCSAN_RUSTC
+# The minimum supported rustc's LLVM supports all of these options.
+rustc-param = -Cllvm-args=-$(1)
+kcsan-rustflags := -Zsanitizer=thread \
+	$(call rustc-param,tsan-compound-read-before-write=1) \
+	$(call rustc-param,tsan-distinguish-volatile=1)
+ifndef CONFIG_KCSAN_WEAK_MEMORY
+kcsan-rustflags += $(call rustc-param,tsan-instrument-func-entry-exit=0)
+endif
+endif
+
+export RUSTFLAGS_KCSAN := $(kcsan-rustflags)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975..78f1c23e54be 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
 _c_flags += $(if $(patsubst n%,, \
 	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
 	$(CFLAGS_KCSAN))
+_rust_flags += $(if $(patsubst n%,, \
+	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
+	$(RUSTFLAGS_KCSAN))
 # Some uninstrumented files provide implied barriers required to avoid false
 # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation only.
 _c_flags += $(if $(patsubst n%,, \
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 7687b0dd5474..4b02bffa6b46 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -231,7 +231,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
-        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
+        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thread"]);
         if cfg.rustc_version_atleast(1, 91, 0) {
             ts.push("target-pointer-width", 64);
         } else {
-- 
2.56.0.385.gd3acb90ef8-goog

