Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57DA1FA178
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757988802; cv=none; b=dMKZ2ES7j0IB23CRlsAICCOeiWlytlovWnuN6miKdhafECb0hNj7/wQ+vtRxqK6/QPVPAwU0pZ1IGen/jowribg1w1v9Xlg5RYceTGV8ftSNoBRQcUbwUkv9gWBxcJbpxmJ4QkFeveMUGbMxZDha+ql/WwJ0ntI4WZXrycFxyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757988802; c=relaxed/simple;
	bh=63Eed1AGHDo9S4Ou3nokkLZgcL/r4X7OBZlcnMtH0dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFBR5DTNtROLMyw5DwWCnFdjkhf+kcksQJxgGm5PTIu7JkoCLGJ6VGMkrAJm0Oi0ja7MUVvBdjLfsf9YQ38TPKo1x4YRAuICceskq7voXQGvMgvf0hx1FRWH3IMEbmtuGlopUIoH3ewmE8uOv4+IENKnsdLaJgv44wzNnyY/+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkPsEXnN; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkPsEXnN"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b7d5978dd1so1132791cf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Sep 2025 19:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757988800; x=1758593600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/eibL+O0VniEknODGPUG78nx8oFSYP60kLiA+ryyvw=;
        b=OkPsEXnN9xDatbVLQHFW/rv3bOhLDnLZ6rjt+3aaaDGxKf5/uYdGf59JmHXSzPD08U
         pgxalLkLw9b9tJQcgGkQDdlQWfEzkI1jrMP4KQ7t9FzEYs4PaBfPPN1KOuGiTOBI7HYD
         HP7hGBt7EJmPDJyVV/w7LY4qZBr+PEP8D1RbsuRyHXwqqDz/RF1O16ISVHzWrRHsChkz
         es9kpX7Pe+jxygfWOPL69fKTZgVYnEEUYdjZ2UhGIgq8bjaYfT5WobG9jO60VONm2tIN
         fhTjYKhOam1q2NuVU16jz+PMeIJEgDTzAiKlE9Z01kAN1knuHkW9lrgMxQY6maJxPOu2
         5lAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757988800; x=1758593600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/eibL+O0VniEknODGPUG78nx8oFSYP60kLiA+ryyvw=;
        b=GgMfTzw3268/uwMiqaQXu9qVd1M8y9n1v1JaGAtMVft3nWVnBZo3Eb4srZdFXALZ7u
         +9MD0AMtPGjwVSxSfJczDaC7yKd03ghQSj9/83BDQXAkPO7ZoNAWRc2GZy2dsEYk/GBV
         WodfVKI9SDW/MCowNU0JcNqxfga3I2aloHeKsoaYdQQGnfkWsZIhRJcOsrYxWnpSYZ/r
         aUNxEZemwQOpukaX98EQsadNLUfpQIHeLgQQqLg/Ywz79ObDEAOJ/Bz9t63SJHCRLRwq
         XRn7ALrzfnJhBEvXSK91goYqhChrQyLgaXJvjM/scutDUxVlL0qqisP81VZZ04VG04cd
         B8yA==
X-Forwarded-Encrypted: i=1; AJvYcCV/y4mw7xdqFpm5DIjGBLyDXgi63xmBlAGD5/y8mZ7o5cmbhmJBmfk2eYZGxucgOjyC72NNx7B2a2ITZMga5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb6j/skZhZm+8tEv0S6JvH8FDNQ0COV5fhcKAtjfDsk8ketXZ1
	MBLEsw08C6J/FIsCtI2rnaJWYOIMZLX4nxtorfgndvwaWHW40NVAbkB9/7qycK7BRXM=
X-Gm-Gg: ASbGnctDISCiVjLQnJ5CKd1hEgn05dZAiAsvSFdDjpUzB9In9CEQmFfRoNmjPM1vpO0
	sIpH5E5rvABU1VObcGu+H1/X7Er902NzF+BbXorNbkwyVZMuTAlp+79NY5Scdond3z3B+f9c/MQ
	aPpZ+9tf4ls+gTYEHLvd18Td66B9IM6Vx0qZRC7v21IEaUu/hVH+qTugc0Z/1i/ATrUjT8UcHNK
	o4CQrzWdlvnV927gI2Ul+87x5vU04jZG3lhehKVBB0yLdeQVteYU2FSj+A2rrOVe4vlEgzuf4JI
	iN3pDgqsI57uOhmMNptQX5DurFBUwmy16jKgeqN2p+5BPMPLd8POVQchSu2DSVR3PJlqshjVM3V
	Zks63k4X0MA9HjF1vTYmvFp3EOcbTyDuIFTXYyrd0RMdYvPXVAudbRpj0WOx0DGaO0WqcQsW8/n
	4=
X-Google-Smtp-Source: AGHT+IElPNaSB1I/oDphF2Gyyhf4jYycwL+QLl4zkaFX5meaS0NxeOxmAFNM/Wjf4a1LrPqSryt6WA==
X-Received: by 2002:a05:620a:4707:b0:806:7c82:fd2f with SMTP id af79cd13be357-824013d7de0mr2025803585a.75.1757988799703;
        Mon, 15 Sep 2025 19:13:19 -0700 (PDT)
Received: from ovo (wn-res-nat-129-97-125-181.dynamic.uwaterloo.ca. [129.97.125.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c88db181sm903897485a.4.2025.09.15.19.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 19:13:19 -0700 (PDT)
From: Kaibo Ma <ent3rm4n@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Kaibo Ma <ent3rm4n@gmail.com>
Subject: [PATCH v2] rust: kunit: allow `cfg` on `test`s
Date: Mon, 15 Sep 2025 22:12:56 -0400
Message-ID: <20250916021259.115578-1-ent3rm4n@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250907201558.104566-2-ent3rm4n@gmail.com>
References: <20250907201558.104566-2-ent3rm4n@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `kunit_test` proc macro only checks for the `test` attribute
immediately preceding a `fn`. If the function is disabled via a `cfg`,
the generated code would result in a compile error referencing a
non-existent function [1].

This collects attributes and specifically cherry-picks `cfg` attributes
to be duplicated inside KUnit wrapper functions such that a test function
disabled via `cfg` compiles and is marked as skipped in KUnit correctly.

Link: https://lore.kernel.org/rust-for-linux/CANiq72==48=69hYiDo1321pCzgn_n1_jg=ez5UYXX91c+g5JVQ@mail.gmail.com/ [1]
Closes: https://github.com/Rust-for-Linux/linux/issues/1185
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Suggested-by: David Gow <davidgow@google.com>
Signed-off-by: Kaibo Ma <ent3rm4n@gmail.com>
---
v1 -> v2: applied suggestion such that cfg'd out tests show as skipped on KUnit

 rust/kernel/kunit.rs |  7 +++++++
 rust/macros/kunit.rs | 48 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 41efd8759..32640dfc9 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -357,4 +357,11 @@ fn rust_test_kunit_example_test() {
     fn rust_test_kunit_in_kunit_test() {
         assert!(in_kunit_test());
     }
+
+    #[test]
+    #[cfg(not(all()))]
+    fn rust_test_kunit_always_disabled_test() {
+        // This test should never run because of the `cfg`.
+        assert!(false);
+    }
 }
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 81d18149a..b395bb053 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -5,6 +5,7 @@
 //! Copyright (c) 2023 José Expósito <jose.exposito89@gmail.com>
 
 use proc_macro::{Delimiter, Group, TokenStream, TokenTree};
+use std::collections::HashMap;
 use std::fmt::Write;
 
 pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
@@ -41,20 +42,32 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     // Get the functions set as tests. Search for `[test]` -> `fn`.
     let mut body_it = body.stream().into_iter();
     let mut tests = Vec::new();
+    let mut attributes: HashMap<String, TokenStream> = HashMap::new();
     while let Some(token) = body_it.next() {
         match token {
-            TokenTree::Group(ident) if ident.to_string() == "[test]" => match body_it.next() {
-                Some(TokenTree::Ident(ident)) if ident.to_string() == "fn" => {
-                    let test_name = match body_it.next() {
-                        Some(TokenTree::Ident(ident)) => ident.to_string(),
-                        _ => continue,
-                    };
-                    tests.push(test_name);
+            TokenTree::Punct(ref p) if p.as_char() == '#' => match body_it.next() {
+                Some(TokenTree::Group(g)) if g.delimiter() == Delimiter::Bracket => {
+                    if let Some(TokenTree::Ident(name)) = g.stream().into_iter().next() {
+                        // Collect attributes because we need to find which are tests. We also
+                        // need to copy `cfg` attributes so tests can be conditionally enabled.
+                        attributes
+                            .entry(name.to_string())
+                            .or_default()
+                            .extend([token, TokenTree::Group(g)]);
+                    }
+                    continue;
                 }
-                _ => continue,
+                _ => (),
             },
+            TokenTree::Ident(i) if i.to_string() == "fn" && attributes.contains_key("test") => {
+                if let Some(TokenTree::Ident(test_name)) = body_it.next() {
+                    tests.push((test_name, attributes.remove("cfg").unwrap_or_default()))
+                }
+            }
+
             _ => (),
         }
+        attributes.clear();
     }
 
     // Add `#[cfg(CONFIG_KUNIT="y")]` before the module declaration.
@@ -100,11 +113,22 @@ pub(crate) fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     let mut test_cases = "".to_owned();
     let mut assert_macros = "".to_owned();
     let path = crate::helpers::file();
-    for test in &tests {
+    let num_tests = tests.len();
+    for (test, cfg_attr) in tests {
         let kunit_wrapper_fn_name = format!("kunit_rust_wrapper_{test}");
-        // An extra `use` is used here to reduce the length of the message.
+        // Append any `cfg` attributes the user might have written on their tests so we don't
+        // attempt to call them when they are `cfg`'d out. An extra `use` is used here to reduce
+        // the length of the assert message.
         let kunit_wrapper = format!(
-            "unsafe extern \"C\" fn {kunit_wrapper_fn_name}(_test: *mut ::kernel::bindings::kunit) {{ use ::kernel::kunit::is_test_result_ok; assert!(is_test_result_ok({test}())); }}",
+            r#"unsafe extern "C" fn {kunit_wrapper_fn_name}(_test: *mut ::kernel::bindings::kunit)
+            {{
+                (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SKIPPED;
+                {cfg_attr} {{
+                    (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
+                    use ::kernel::kunit::is_test_result_ok;
+                    assert!(is_test_result_ok({test}()));
+                }}
+            }}"#,
         );
         writeln!(kunit_macros, "{kunit_wrapper}").unwrap();
         writeln!(
@@ -139,7 +163,7 @@ macro_rules! assert_eq {{
     writeln!(
         kunit_macros,
         "static mut TEST_CASES: [::kernel::bindings::kunit_case; {}] = [\n{test_cases}    ::kernel::kunit::kunit_case_null(),\n];",
-        tests.len() + 1
+        num_tests + 1
     )
     .unwrap();
 
-- 
2.50.1

