Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975F26980B
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638488; cv=none; b=SqMz73+arDN6poRzav2hPhe+mWDf3YARxa29NRK2Wp+60kn2Lw7uLfPdxvskO6pg1q1RE5AcGI77c9VCsW6mrDyd9Xe0y3AgI17oiHVMazss4mwSnTKOSpSJOa2y/GRKskPLF7IeaBAhNrlkuayAUM5ixfGqN40HCRBBTBZRaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638488; c=relaxed/simple;
	bh=RPs39+G/2/WRBdJP3KwTQnQlR3Lp/kvURzUIgtDgvwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qupdL8hob0S+CW2+eyycgVDSsUw9PBrXR+KqFVmvDn/24jXxKMKZHCFI7LS4TU+nt6N69mhlaeDdcTlc0w8o0m5WhXDi390Gso5aUG9YIsNRYH9UXrm80TmQ479i/UFQPpyO6H410WFIJIaViTdkEi/a32Cjn+/+AxHj9Vm6Fjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpvJi+Kr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpvJi+Kr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74019695377so3102004b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 00:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638486; x=1748243286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=TpvJi+KreG9k+1tnyhg46J2UAumtPDce3pxuk/EPgy9RF25DuB/valuzxXRAOIzTX/
         5zr5MF4xvECZ3/d+xd0M24bFSUzUOtAN24ifMNxOgaFLFeYy16psv0DRCgTt8rzNaK1g
         hGphfvcsFtV4K5sjUuyugXdLGPIfWxl/ktSsqZ6z0mIpMYWBK5Y1VXjTCOyp0beMSAD0
         uOer9o4z9VYJwtpYkawNXQCfECTbUDncvYusT5Ml6duR/7j3ibBX6PdpTUnOrKhEsPtF
         I8praT4zGMDz5KdygZFooZovOscrT0qfiBc1aIb4kmBiVWPQt37P9ykwEnd9NY8M9KF9
         3p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638486; x=1748243286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06XWI3zWvI8xB81BSzBcpZnXhq7zBjUBfZT4cp51CDs=;
        b=cpK1DDJ1e+sLhRqauRZ8Mbn+Mg1MX5rMLNzmk+9PitIWiqMDDGhS4KP/++OQJBqNs5
         M1VJtDcgl3J8CyeFsl3MghqERDBlmMcI4J/hoYfJkFGYlBBSSR/86GtTSv2Eo6M/u9EY
         R9WONBPMgdquEPm/fsHjcLBXO6Wn9+mID6K0Wt1s0VcfQ5JG1KZODxyfVd6+vs/l+y6f
         60GppkEg5UE9qvkepMkg2AkVYU1vNIj2RJPBiHsAhdj+jj8IBZmGUOZ9uhFiilcaZbOB
         Jr7c8htmBNnsw8ks/dZQNardemSx4pHof4tClHncfYLuWP5dWDRaISiUGGZJRkuIO97g
         IyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzLx8e4RetEeaX3ximJqe20PPn0AqfFB/IBtl1gafCvtIqescUzYrTSv0uqr/2ug8RFNqeiH7o60/hdYwuhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvp/jVTmhRzh+ZQXAnJ+lCCWQ5boK8NQLnESH8nYWslK6rVlb
	XActBcuSLxxFDN7Mpf7vdRxQUd+qUKTpbt2w/YCHNUQqQX8d2mXWIO2jTpRzWoBNhHY=
X-Gm-Gg: ASbGncu4N7M8OLW1Pk5/7bVXV0HduEBF48/V1HiMdDF3E3F4BdMWdPJmYcEA7gf5q57
	VNxJXcq6DLLjTaw6a4rAACxCPnKAM6YkAHKu0cGyHIvf7pP3mvawQhhJCsvJSN3H5G0h1JhvzbX
	RJgJ3xmS7yZNZAxU/YL/0Y46Jqk6mqCoqhMnr9f6+C4LEIk10WRBEhg3nxGIE4X9bLsib99RdTa
	zQnsmiRV69ZL3qLx811ePbWQ/J9BN+t7nv9YxjlI+sx4dOAiKuzCbDLZ6n17TtMHawZhTWR3gZH
	R8Mfapaq8tph+j9ss6vlR6xoa3iB0X3STp6wGqKMfdov1L156Imh
X-Google-Smtp-Source: AGHT+IHDxTCILxiZSszxnTc982DJY8orsb9n0sCiFXe5hNTg/g6o+f+sr8ozsUbLXvO9AluZPucbQw==
X-Received: by 2002:a05:6a21:a0cb:b0:218:c22:e3e6 with SMTP id adf61e73a8af0-2180c22e3fdmr15396853637.12.1747638486393;
        Mon, 19 May 2025 00:08:06 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742acb8731esm5294876b3a.168.2025.05.19.00.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:08:05 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 06/15] rust: macros: enable use of hyphens in module names
Date: Mon, 19 May 2025 12:37:11 +0530
Message-Id: <21b4c30db60f22d56cc6386a18564705ad3a6f4a.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anisse Astier <anisse@astier.eu>

Some modules might need naming that contains hyphens "-" to match the
auto-probing by name in the platform devices that comes from the device
tree.

But rust identifiers cannot contain hyphens, so replace the module name
by an underscore anywhere we'd use it as an identifier.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
[Viresh: Replace "-" with '-', and fix line length checkpatch warnings]
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/macros/module.rs | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index a9418fbc9b44..27cc72d474f0 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -185,7 +185,9 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
 
     let info = ModuleInfo::parse(&mut it);
 
-    let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
+    /* Rust does not allow hyphens in identifiers, use underscore instead */
+    let name_identifier = info.name.replace('-', "_");
+    let mut modinfo = ModInfoBuilder::new(name_identifier.as_ref());
     if let Some(author) = info.author {
         modinfo.emit("author", &author);
     }
@@ -310,14 +312,15 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
                     #[used]
-                    pub static __{name}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name}_init;
+                    pub static __{name_identifier}_initcall: extern \"C\" fn() ->
+                        kernel::ffi::c_int = __{name_identifier}_init;
 
                     #[cfg(not(MODULE))]
                     #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
                     core::arch::global_asm!(
                         r#\".section \"{initcall_section}\", \"a\"
-                        __{name}_initcall:
-                            .long   __{name}_init - .
+                        __{name_identifier}_initcall:
+                            .long   __{name_identifier}_init - .
                             .previous
                         \"#
                     );
@@ -325,7 +328,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name_identifier}_init() -> kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -335,13 +338,13 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_exit() {{
+                    pub extern \"C\" fn __{name_identifier}_exit() {{
                         // SAFETY:
                         // - This function is inaccessible to the outside due to the double
                         //   module wrapping it. It is called exactly once by the C side via its
                         //   unique name,
-                        // - furthermore it is only called after `__{name}_init` has returned `0`
-                        //   (which delegates to `__init`).
+                        // - furthermore it is only called after `__{name_identifier}_init` has
+                        //   returned `0` (which delegates to `__init`).
                         unsafe {{ __exit() }}
                     }}
 
@@ -381,6 +384,7 @@ unsafe fn __exit() {{
         ",
         type_ = info.type_,
         name = info.name,
+        name_identifier = name_identifier,
         modinfo = modinfo.buffer,
         initcall_section = ".initcall6.init"
     )
-- 
2.31.1.272.g89b43f80a514

