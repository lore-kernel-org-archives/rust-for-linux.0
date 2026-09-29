Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD32459E1
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691262; cv=none; b=SjVmr7sGX9/PEx4cR/wMshQ6eaTU5n5i8IHfD4PVrHp9yUC8n7i4cCAwSrtpZNMFDVs0+C7BqBV/o95UuP4k+a5+C4S1mQj1OXXm0vn165Sur61hQd4E/5stux67RO+ET9FBnANj/WSS7VfprSnGr8+FSHi7rkRiyW1yO5mP6n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691262; c=relaxed/simple;
	bh=q/uIYLcPSFObDJjtPbKhA7rAxxJvoJzI8r/TGrW80ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+vW0JMJ+P8Cj2KBa1dLaXRTerd8Sj0WCR25ZhZNEcEdpGtVLEz8aMEdLGJpazbdoqod0uPdfUEI/rXWQLkffNEL6Rej+CSOwJXX2LyICzr7GrNdh156t3gygkKvSHDG57sVo/9aFRTRVvhJOzIyk70YyEYuH/UpDTxGEfT6yVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcNL2wOY; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcNL2wOY"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3428f70d7e7so2476812eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691260; x=1791296060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSqpMHsSCgHMp6sYSZJ0Zph1nPml/+XmXvdv8QAUIRw=;
        b=OcNL2wOYKfKHVMBEOS0YQnJZcLynWJs7LcvoBd3N2H+e7n47w5CGn1ooc8lDurjs5w
         rAK8hKihJADI6YQyigci8Oo4/AalUWmIO/pofs9mpPENQd53IaYvz5EL2xfhsX6gCUWA
         Si2zzmS3L8QGhPbhypyW9Xe8KWJ5LylGtn7oONA1TR3iV3fkVSdAhpNMJG37OYz6dTZi
         hyzbV+U0uvd8u2XR4L8VRp+jw12VzDVzuUSoqMAJxsvRGES2C7eZAJm8pcHFO92oa1l8
         hNpVBq1/jcUNkHDQ1Z2PDNaNmOSlHweJ+P4FWEIvDbZrWGjXDr9+ecXUDIv1p/qvLEZt
         g6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691260; x=1791296060;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSqpMHsSCgHMp6sYSZJ0Zph1nPml/+XmXvdv8QAUIRw=;
        b=xmNiCO4+BEQYZSAr8APetcuulmCmc9GebHJEcCbL0zF9mnge84Telno/GAOTqyiXY0
         Q1hRh7TLs08/adDjdEVUPL0qs+FpyR+Dge7k88l3QCGuSs9imJatXarN3j85AijmQfCm
         QSrMU7cbKE9igW0bb53XUGjwpX9+x722STJWGlK7kojQRLXfUXwf2pTce4EokC3HFJ/4
         Hj7DvKSFfTriNmLkg8qb2CcMq6a0FzKX7fEb/CRNPVKbG4UQlg02K5Dg2/AAXAB81a3I
         bFPV63vwruZHaLKvBha7U23WpdF9/z+Wc7qKVEY8jJ9wJxas9ENhdAjZke7oopwU7Sx/
         Sbzw==
X-Forwarded-Encrypted: i=1; AKwUvBwh6mAnYkFLD/ptulB9t/HnXAwP4Ysg/04Sg6RDpot4rBWaxzAb2J+CKz75TQpM+jlzj8B2ltBo8gmDVIK89w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuKSHkCd+gvkNemVZTUac+m2K5QbNO0gBz/o0hJwn7t7Yyqh8L
	ZoBvRyttPqtKef3Dg1OHTa6+aWbXgERHCmZuQhfkaZood7HXJ91QgLU=
X-Gm-Gg: AYBFou2sd4ESSfGiGoFyEce3FcnovIU4WFT/D9t5Gw/CttTao4tYSRHrCsJON8wQ4Dn
	RCFnaZnOBnzibbghwwABLGc+S2qdFJXo7TwXizInf/cBgVsEX56aa4EXq0kTvmPZ0UmOVh8e/MG
	6sdynNG86Jk/0ZfYUWsb4XFp5/4OjeU12aFjKM1wJqnAyDpn2kcLkDM0uWwtTCWw/E5u9cUKSa9
	h5rkEKXhp2OE76wZVUhcM78W5o4Wd6NxirLnz3gmkqut+PZw68cYup54mEdVr0wRZmU76Odstys
	xXb0F3+0BJbgGSQiinEfWpG/0vdjWjNGbONdWIj1RGTBLlGo30oZvtT5uEsu2QtW84aM1D/HiS+
	fmVU0ZHF/kXMrmLX4MIvPlOPNNERx/SDgRYf5jJUggxVz0uXV3QA9teqhzuDBHSKOx/aMDmf0sP
	rHMOckYc4norV0G4JI8Hjnoa+i0QQt7tNi/tmUSMxNxRxf42ntx3C9WcGvj0eyMK7/RLI4IDOXV
	MWwJKncBBvoLcFePERuoDayTFSH1QWLbTacId4hpC3YYxdSVA==
X-Received: by 2002:a05:7300:80c9:b0:334:8fb7:1dfd with SMTP id 5a478bee46e88-342700c75e6mr17555271eec.8.1790691244787;
        Tue, 29 Sep 2026 07:14:04 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:14:03 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 2/3] rust: kunit: allow same test name with different #[cfg(...)]
Date: Tue, 29 Sep 2026 11:07:42 -0300
Message-ID: <0f710a749bec162c3cf96f83d8425e7ad48e78e6.1790599486.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sometimes it is necessary to test the same code paths under different
configurations. The `#[cfg(...)]` macro can be used to check if specific
configurations are enabled and run tests accordingly.

Currently, defining multiple tests with the same name under different
`#[cfg(...)]` attributes results in a compilation error. This patch
removes that restriction, allowing identical test names across different
configurations.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/kunit.rs | 22 ++++++++++++++++++++++
 rust/macros/kunit.rs | 20 +++++++++++++++-----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 5fa4d994e0f7..5ff988ab76a4 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -347,6 +347,28 @@ fn rust_test_kunit_in_kunit_test() {
         assert!(in_kunit_test());
     }

+    // Tests with cfg have the same name on purpose because we are implicitly testing that
+    // tests with the same name but different configs do not throw a compilation error
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "y")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        assert!(in_kunit_test());
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "n")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "INVALID_VALUE")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
     #[test]
     #[should_panic]
     fn rust_test_kunit_panic_in_kunit_test() {
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index f1d0210e6a49..18cfa463c8db 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -45,6 +45,8 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke

     let mut processed_items = Vec::new();
     let mut test_cases = Vec::new();
+    let mut test_cases_cfgs = Vec::new();
+    let mut test_case_number: u32 = 1;

     // Generate the test KUnit test suite and a test case for each `#[test]`.
     //
@@ -135,7 +137,7 @@ macro_rules! assert_eq {
         // Add back the test item.
         processed_items.push(Item::Fn(f));

-        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}");
+        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}_{test_case_number}");
         let test_cstr = LitCStr::new(
             &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
             test.span(),
@@ -172,15 +174,23 @@ macro_rules! assert_eq {
             case.attr.rust_should_panic = #should_panic;
             case
         }));
+        test_cases_cfgs.push(cfg_attrs);
+        test_case_number += 1;
     }

-    let num_tests_plus_1 = test_cases.len() + 1;
+    // This dummy array is used to calculate the exact number of tests cases that are active
+    // depending on their #[cfg(...)] attribute.
+    processed_items.push(parse_quote!(
+        const TEST_CASES_COUNT: &[()] = &[#(#(#test_cases_cfgs)* (),)* ()];
+    ));
+
     processed_items.push(parse_quote! {
-        static mut TEST_CASES: [::kernel::bindings::kunit_case; #num_tests_plus_1] = [
-            #(#test_cases,)*
-            ::pin_init::zeroed(),
+        static mut TEST_CASES: [::kernel::bindings::kunit_case; TEST_CASES_COUNT.len()] = [
+            #(#(#test_cases_cfgs)* { #test_cases },)*
+            ::pin_init::zeroed()
         ];
     });
+
     processed_items.push(parse_quote! {
         ::kernel::kunit_unsafe_test_suite!(#test_suite, TEST_CASES);
     });
--
2.47.3

