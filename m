Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B6227596
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Feb 2025 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834139; cv=none; b=Uc4/1Vh4lQ2XyDam2Je91BK95ngvb9hZAIlA5z8BvuF63OoLK5wKNqBz+GKfG/VC/XnbKsUgL57jQ5C5VRs48JtbJwC5R5tZ8o3FmU+B8+6Oaq7lKR3E83n5/wXGulR8E7iHjwz+fyLbkQ+Gs0wRRAyfEGasAID+S8TrUZ7DKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834139; c=relaxed/simple;
	bh=Ot/T0jCd4T7tNCR433fIHwM84YOZJZy/rRbe6ZLnftM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ppz6MquGOBZ/k3LCfSq658Tg+hrnwq4yF5N3tmVbTfGoqsVjr5A1P0bSI8OG0z/cfrB2I4FPFfRxtSpMn/LpHSgVNR0xzQhvzhQtbUwiTjDjL/GmIbkXYtfzo1USccWEMXUxB/P62PhcAm3Spm6oNiwWVqSRJBnpRJvZf1z/ESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zUoR3pTF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zUoR3pTF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21670dce0a7so16610275ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Feb 2025 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834137; x=1739438937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9/+ITx7jdgxCni5rtLO0HfiqPVNFjTWeSm9ZunqSOA=;
        b=zUoR3pTF6YmbxQRUQ8Ws3B0zZbQMmK0CTochc8/i7A/gnubm0ADABBO9+k7MXWRqAS
         urZGm2dDo2ZZePeWLFvvihxJ1TYZzJZJ3HjMW5+DO27fr8/V/NtablMOmIyPK+WAMOuD
         084PT5xrhzqYZMelFQWI7MTZY/unlUScwFsjzqR6k2MYKqRhr7Q/9NvJvhQGyE82J6dU
         4FmZ+hDMzSoPcOy1IoFb/d9Npmy74SBGSrvoLxtoMmbda9Vb0fA83qWGT8YnODCzsF3n
         nKPoUKXyCjMoUpvxK4tFr1r4azrehnKIQBe/prHlKI2kNAkKN3Ba5YB78ILHlnMVw7eV
         51GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834137; x=1739438937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9/+ITx7jdgxCni5rtLO0HfiqPVNFjTWeSm9ZunqSOA=;
        b=aURk0VMLcsUdhy95pPW6auCdenCk8Ix3Iu1RPETj9XYEInY98DUvk/2bNNj8lFfGWO
         UN+8PkI0qXxqqM7qaaeu+hHZU/1C6zudZjY8PkUw2muNXAC3Gp3ocfO4wC2WEF/U2c7f
         ln7DvOzB267X358+9KiXfpYKcezmc88CoPDGa06KpzDDNjoyPFseEguySpLkd22fEkMa
         W8uHrmern2iLqYwc7N4WxU0gaOjiThHeg6tgiMq8xh6SxEV1+MPf2JLkZTouzBmhN5Y5
         UHgMBaVz50kgid2GZtiPpjS2/VVEQFmU2EEO9Mzc0cEEFN1LwxLaQrb6+gLsXiga9R9r
         t8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjgUXav3wYftrpI/1FN/ZBLjY5/22k5Ng9ovq64PNyXusRYOcKddU8rWJvLeOf6k33jWIQErsER8tlL82Q1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQkrnJckEZpnlOWXiWMoKEW2llaDVNvvf0dgR0DUmhNPcqgts
	Ms8920ejIRKU8d/+1fGsNAyB8sV+s8EYO6e9t1P2viSvTpeGa1ISwL04lXgnZFw=
X-Gm-Gg: ASbGncs549HWwWHv8xxrYualIoy7WNpn6XTTkrQvebtvKTdQMik1J65CzcooIA/LMJR
	qf6JSC1IFxr2tU58c3zsS9SnF37GUOgmvl7/c30552JVoVmbI0+1nuE4mK5E39E382BVwzErneR
	cXUzspo/zjRVUSNO6f7Y2MwxZOd2EUZuSRXrekqGqor3OK8LX0LqwnFKlM/0432IcpKmYkCGqOT
	JNX4gy+h1NosKdpdid2KstOKhs+PSO+pynbXFn/bluoXuVQEIHuI3cN3/Wn2QsiHq/0bE95GhdW
	jHR0ydaZ3NNakuGVSw==
X-Google-Smtp-Source: AGHT+IGJC2iQJEI3sTGW6GjKdvP/nRc87YJ1GkI47hpYxHY8P6Qy5pjuZWMZBFlY67UgbnD1fdAThg==
X-Received: by 2002:a17:903:41c1:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-21f17dde2d4mr80139535ad.6.1738834137385;
        Thu, 06 Feb 2025 01:28:57 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b02dsm8145955ad.74.2025.02.06.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:56 -0800 (PST)
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
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Anisse Astier <anisse@astier.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V8 01/14] rust: macros: enable use of hyphens in module names
Date: Thu,  6 Feb 2025 14:58:22 +0530
Message-Id: <99ca28045252ba77c302d74e57c2976e60744c4d.1738832118.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1738832118.git.viresh.kumar@linaro.org>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
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
[Viresh: Replace "-" with '-']
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/macros/module.rs | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..2e740bbdb598 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -182,7 +182,9 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
 
     let info = ModuleInfo::parse(&mut it);
 
-    let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
+    /* Rust does not allow hyphens in identifiers, use underscore instead */
+    let name_identifier = info.name.replace('-', "_");
+    let mut modinfo = ModInfoBuilder::new(name_identifier.as_ref());
     if let Some(author) = info.author {
         modinfo.emit("author", &author);
     }
@@ -298,14 +300,14 @@ mod __module_init {{
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
                     #[used]
-                    pub static __{name}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name}_init;
+                    pub static __{name_identifier}_initcall: extern \"C\" fn() -> kernel::ffi::c_int = __{name_identifier}_init;
 
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
@@ -313,7 +315,7 @@ mod __module_init {{
                     #[cfg(not(MODULE))]
                     #[doc(hidden)]
                     #[no_mangle]
-                    pub extern \"C\" fn __{name}_init() -> kernel::ffi::c_int {{
+                    pub extern \"C\" fn __{name_identifier}_init() -> kernel::ffi::c_int {{
                         // SAFETY: This function is inaccessible to the outside due to the double
                         // module wrapping it. It is called exactly once by the C side via its
                         // placement above in the initcall section.
@@ -323,12 +325,12 @@ mod __module_init {{
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
+                        // - furthermore it is only called after `__{name_identifier}_init` has returned `0`
                         //   (which delegates to `__init`).
                         unsafe {{ __exit() }}
                     }}
@@ -369,6 +371,7 @@ unsafe fn __exit() {{
         ",
         type_ = info.type_,
         name = info.name,
+        name_identifier = name_identifier,
         modinfo = modinfo.buffer,
         initcall_section = ".initcall6.init"
     )
-- 
2.31.1.272.g89b43f80a514

