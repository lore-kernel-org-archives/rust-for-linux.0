Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC90330B0E
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578364; cv=none; b=h+7QQw4xq7V8S6UCbjP6+hGRuXHTsgpbK1VrcVehWbLZboXLAL+FJdQMC5pXna1p77wlbEX2Psd2Xyhh1aywMgkYELT4G196eOJfHo67wFPYYhee/lr9IkJCzR6KbQ/9sWLuo68jTXoux5ZiN6Sonzx2hOxtRChsX82oflSQ1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578364; c=relaxed/simple;
	bh=BMm/D+92KohjIhMn3W0NfZFT9jPV1Xow0HI6rE4BsoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUQW5R3kV4w5rDUsTq17FzOateR1SAZyC/m4di9P1l8kiYskoiM0dXKc+JEegGoqMZuny155hVEzQcIYyvrrzGd5NVKN2nQk6RRhmXx820F6kpwi2QzVJMxuwwDqJkXPyDKhCCv8ZTdh2QRawNMoOqbDAI00v8oq3gXLh3CiXxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X73Hk6kR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X73Hk6kR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c197eaaab00so578487966b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787578358; x=1788183158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCd9ogdP+10eYPCwT1duiz6StUC+972KZLg0HwZ14BM=;
        b=X73Hk6kRlKmSGRvl0UmKPAUFAEPJ/HO5Cmzo0Zzhh+NOAbyrbeSVzekl2MPtSrRRTI
         oJCtROpFAZy39xa2X6a+XFiIuCo2U4tYjqt7RD9fmnZXyJANk4TeaGcgabSJ0AZW9Ytx
         N+eq06f2Cs8f3cFmUQ9e82av2evHR2DlB/4+bNZvgp433djnux+pUsbQUAxzA16uFdm0
         wCCS/+5NuI470B2tIsNY2tHjLF6230JE/xApj3BH8OLsE/jmKttP8dfRYkSwjOaGAjjW
         T2q2iyLu9k7WRIrzUaQzwCYvg0CWo9ZTjwgMYlyrcYx4xzDyUDu/wTKXKkX3MoO2+Kle
         aBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578358; x=1788183158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCd9ogdP+10eYPCwT1duiz6StUC+972KZLg0HwZ14BM=;
        b=EOvibDavB1bV5zUHQg6pOSVueQ435SD7Jf4EAsc67wMQbpm+OJC2KADpAmEaVAO/2u
         tMsKThDHIaj3T3WYMhlOW9em72eRT54xiCLpq9DsRLGcJALd/oN9InNFiqgXyQdBgmJJ
         k7Lxeuxy6d2/dvZ+ygpP+RrK2T2egU478QDTVgfeu32M4XgPV3+kT/TkXpTBBb7jG+pw
         ernrdFWV0dMKYm5TeN/tWgyDo9DiunVhcbvP3VWnFlO2CtOmHnrq9KhFOe59v4eBT+qW
         /qpUN8lLhtD5rvZq6haPs2kJoXlzZ/b/nvwjK5uJYrD1YTg6Occ0/HddziBF3zElkkVm
         /5eg==
X-Forwarded-Encrypted: i=1; AHgh+RqcErgI2naY3Ix6bcjoxZdsdt/wRJLX/fHf3VSDHf6RU0m9U/IMN4CWMANWMgVEk0WFenlc75jw7qBczh06zA==@vger.kernel.org
X-Gm-Message-State: AFuF++nUXjTj6MUzYHJJUTKW/twnI+n8hdkImb0WemfVg5sWjIviiNcM
	8CXSHJ+ujBF2Z1JINDZJdbifFEOlO/gRqVMMxY9QKLp+EAiGqH8rCBQe
X-Gm-Gg: AR+sD12IWJvanu1cl95YKY/oL7utdkDfn4+8dRS/pAna2Ow0ausBkvf5uAlufG5OcN4
	fljEicLScKMxpZocz/PEA11pNStietcrnRzLXMxsVOB59+/xsWVKrWmYUaSMt+YnPXGS36vpzLj
	FXVtKU0Usj0nIootkHOYBI2ylKrJrUi7PFeT28AsOVmSTqji6gyZnQZa9PMNsoMsuFV4KtXBsSL
	C1E/arHirM9diYAuDQwPKjGbqcvsbNEvF+9OOveqiX0CRd/KciITbgtBCYjJToJyJvFYEeDLFmJ
	ovwx1ExUIIwSfomCYOGRvTCuwpIHikhH71+PWlBgdITROSxgg6FQmI06ZljipaC7AShEuObUBBx
	Y5C/t9Avx7G+Cl5CxGjeAfTSmJl49BAbOGJoqU49YSCGTuP6accENi2KtkZnDXZjk9WC0mTIuAz
	Ji+Exj24k3xFbi4Fu7H21Peg+LHtjBqgb7lCaikFeOikrwDibbqFyQVvLsfTYA1D0awAGoKAEq3
	ZB7onn+TXGYEdl2ghpHX19t
X-Received: by 2002:a17:907:1c18:b0:c20:88a6:8210 with SMTP id a640c23a62f3a-c246a4f0b8cmr3078721166b.9.1787578358109;
        Mon, 24 Aug 2026 06:32:38 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f8f2asm1313492266b.36.2026.08.24.06.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:32:37 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Mon, 24 Aug 2026 15:32:31 +0200
Subject: [PATCH v2 2/2] kunit: add KUnit test to assert kernel state before
 KUnit suites are run
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-lockdep-kunit-v2-2-36a6fec9f72e@gmail.com>
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
In-Reply-To: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787578351; l=2612;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=BMm/D+92KohjIhMn3W0NfZFT9jPV1Xow0HI6rE4BsoA=;
 b=wtZ/QA57BgH0s+WicRIuLyTQh70Xs0NsSgzHTe6QfLwpfcGol8xLQbN5UxHK/lxtsGAzBpcTx
 0P0ioPFye0bBemufbNawEGPE6BUq/J54ydkAUaFRzwPrhbh2HI8H6Sw
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

add pre-defined KUnit test suite and test case that asserts both
`debug_locks` and `TAINT_WARN` prior to running any (user) KUnit tests.
This asserts integrity before tests are run.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/executor.c |  8 +++++++-
 lib/kunit/test.c     | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index b0f8a41d61d36..0db67fe7f09f9 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -290,9 +290,15 @@ void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin)
 	size_t num_suites = suite_set->end - suite_set->start;
 	bool autorun = kunit_autorun();
 
+	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+	size_t num_suites_plus_extra = num_suites+1;
+	#else
+	size_t num_suites_plus_extra = num_suites;
+	#endif
+
 	if (autorun && (builtin || num_suites)) {
 		pr_info("KTAP version 1\n");
-		pr_info("1..%zu\n", num_suites);
+		pr_info("1..%zu\n", num_suites_plus_extra);
 	}
 
 	__kunit_test_suites_init(suite_set->start, num_suites, autorun);
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 99773e000e1b7..e64c6d1575280 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -835,6 +835,30 @@ bool kunit_enabled(void)
 	return enable_param;
 }
 
+#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+#define DEBUG_LOCKS_OK 1
+#define TAINT_WARN_OK 0
+
+static void pre_kunit_assert(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ_MSG(test, debug_locks, DEBUG_LOCKS_OK,
+		"debug_locks are off before any test ran");
+	KUNIT_EXPECT_EQ_MSG(test, test_taint(TAINT_WARN), TAINT_WARN_OK,
+		"kernel already TAINT_WARN tainted before any test ran");
+}
+
+static struct kunit_case pre_kunit_assert_cases[] = {
+	KUNIT_CASE(pre_kunit_assert),
+	{}
+};
+
+static struct kunit_suite pre_kunit_assert_clean_state_suite = {
+	.name = "pre_kunit_extra_asserts",
+	.test_cases = pre_kunit_assert_cases,
+};
+
+#endif /* CONFIG_RUST_KUNIT_EXTRA_ASSERTS */
+
 int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_suites,
 			     bool run_tests)
 {
@@ -857,6 +881,12 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
 	}
 	static_branch_inc(&kunit_running);
 
+	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+	kunit_init_suite(&pre_kunit_assert_clean_state_suite);
+	if (run_tests)
+		kunit_run_tests(&pre_kunit_assert_clean_state_suite);
+	#endif
+
 	for (i = 0; i < num_suites; i++) {
 		kunit_init_suite(suites[i]);
 		if (run_tests)

-- 
2.51.2

