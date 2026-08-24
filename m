Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A495331EB3
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578362; cv=none; b=hKonJ1Aip9gAYZZ+ngQJW4EWT2FjpTSSJHcnhkeKiMdX9fm214hO95D3GYPEVlW0UIDjHSUCKly4VkxEy8xdX1RCE2oFPfQOl8iTf7vKY+KJlr38qA31KHTXsMWaBKRN9m4X/PB3bfNPVFN6CTCU/zcCJ7Am3BWBJhhknCbMjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578362; c=relaxed/simple;
	bh=YfAj7Hq5j01TH+3vaBnyDfmaZcon3bmqMrJi0FMNuqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSu2dlJ2+XutA3g9L8shB41AB/kHuvRcFYmzYg5wVKOAZDj2zXrqa55eTDIhzTAUO9uLclWjgQX12/rOkP4r1MwQrDVaDJkUopu97bDaf5BGZqB9Voyq4xfmMPsSOt62u6FZFuyWUoAxUERXko/gv8BnyWcD5Fc/H4Adyt9mDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et5r9HBC; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et5r9HBC"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5902512a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787578356; x=1788183156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWihVktJioXn/Vi4ldSRKChKVyZxwxwgVdPhf8US9+o=;
        b=et5r9HBC+P8mbOIkmeplMW9ec1iDjR3c3bfQpPQZMJIqSk0HfMHLWj/R8aXczh4DuQ
         H+/pyVzE5KnYaG0qLaZ9DGUELFttwK9CexZcIcEYqrLAKa/8DVbgKh3kmJNtbS0qOEJ1
         vnYZoHVMzKTgTiXz/hE4IpoSzxuHEGQCrjJCzN3a/TddylOKBqkYQBLh9hSdCbP+yhDV
         e7259qOfuRR3S7BTX/TLL+44jt02zgS+prtKnKdPpJx1EjZfaAWYFARdzm8w3uSLEjfg
         rUoULZsQeKgUyePlkoKedCETaCaTUeHm0t3/JBfSHcQZw2FS6QI4YwpAKC46YseHNep+
         IqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578356; x=1788183156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWihVktJioXn/Vi4ldSRKChKVyZxwxwgVdPhf8US9+o=;
        b=OMbKfZFaetzj9+VuWOohcteC3YmOKwUFPYUDJEcz/947ae6NiHk2IAYLWR1+nmMdy7
         SLKAod1GiS97IMDYEhl0QeeotqS+ZndoFpyhUj9sIQDXU6WmIqzr15apgT81219ZtkO2
         zhsukvkCOi6JZtuH2EaJFgtD8Rbd2YpmkQVmVQPK5/pyIepVW76Ld1alRGraOFEYFjxJ
         E5F/PXE0sft77hl+wQKcZtB5D6vJ+w6eKoauDzazdu2sWTfwu9yo1LS4cNtt5tXgZ6fi
         TYN8A8+mM+/BIkbWoVaFVi8bphTosA79NnbACqFMMma8+pgh9vLb+ydxUpyHM+7pO7x7
         1zXA==
X-Forwarded-Encrypted: i=1; AHgh+RpcCsORHWZKgoW1WKCdjV/3FsvSBVNMAnHY3LesvJ/dA0lGM+em6xb792UKvM9Ukx4BLdbkwSFV3Q7vG+4weg==@vger.kernel.org
X-Gm-Message-State: AFuF++lgK36TYT7Fw5cOUiASD9v4RlI8LHvQ6rd1BbwnEmGGkeWSwcLu
	klyO6o667bs8SVxIwmPrzZY/FIrU6v2TYw4jM3fD54zyeHhtFtAtVYMh
X-Gm-Gg: AR+sD10JFvQj05tBun8z8tgYuQ2PRf0UKhlqtJ3BZkuCAhWoNulS7fSN3lSsqXi5H1+
	lMt2B2UZ8RIXjdTpG/XmmCCVoU4xnv7S4kcJjvVzfyVLkQe0xS4BSiJH7Af502yVxwbtdUV1Lz6
	I6GrfKGvl7BIrmAAbdcniTcyalZU5vjrVE0Yc+PGKrq+OJFWKbQ+avI9YhGcnrnHXrwt8ufeqBX
	gBSGjOrUdgdUpRT9ks0gbcG3kw/ypZr/YfAHvmyejMROETQTIHsrmt7XT3frAtno+p3uXLVBP/3
	bSAKrzT2xpSrxISX6tnO9LqvJAfCMpQttF63lVri5CWxdl/Vzro76OwLTCe97PUL5FZK2zmjDX8
	czVOqk2zl6MuwxvQ7uZaXzYOjZC/UoUEncithGTH0sYhLMKip7uH22vTZk3NR8O8+t2CiB04mM6
	GGP4rwboML4pgDjoxbTDFHnsaGb5Pn5+fAynixU/NiBYVbIUEjx4Qq8BjgpBkQLd0Af6XTO8qXr
	/ImkDAD3gDaOig90wijsBy6
X-Received: by 2002:a17:907:845:b0:c20:fed2:898b with SMTP id a640c23a62f3a-c2492782dbemr1773358066b.23.1787578355990;
        Mon, 24 Aug 2026 06:32:35 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f8f2asm1313492266b.36.2026.08.24.06.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:32:35 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Mon, 24 Aug 2026 15:32:30 +0200
Subject: [PATCH v2 1/2] kunit: add extra assertions to KUnit test cases
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-lockdep-kunit-v2-1-36a6fec9f72e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787578351; l=2610;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=YfAj7Hq5j01TH+3vaBnyDfmaZcon3bmqMrJi0FMNuqE=;
 b=1GsTEq+NRGPrEh9oD+Q5Lqb+6w8QYjaRHF34ZxA/3IP4ue09o3lxSaOS590+QVioe2sfZ5DCq
 wOiN8Qv5PFjCkr4jw2S58I0Q97HgzlupyEIlqGGBflcTRfMHqrChlXn
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

add extra assertions for each individual test case, that checks that
both `debug_locks` and `TAINT_WARN` are intact after the test is run.
The assertions are optional behind CONFIG_KUNIT_EXTRA_ASSERTS.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/Kconfig     | 12 ++++++++++++
 lib/kunit/try-catch.c | 23 ++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 94ff8e4089bfb..38801f7493669 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -142,4 +142,16 @@ config KUNIT_UML_PCI
 
 	  If unsure, say N.
 
+config KUNIT_EXTRA_ASSERTS
+	bool "Enable extra assertions in KUnit tests"
+	depends on LOCKDEP
+	default n
+	help
+		Enables all extra assertions for KUnit which includes asserting `TAINT_WARN` and
+		`debug_locks` from lockdep. A KUnit test suite (and test case) is inserted
+		at the start of all KUnit test suites. This makes assertions prior to running any
+		tests, as a pre-test integrity check. Assertions are made after each test case which
+		asserts that each test case did not trigger either `TAINT_WARN` or `debug_locks`.
+
+		If unsure, say N.
 endif # KUNIT
diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
index d84a879f0a789..7eea3af4c9671 100644
--- a/lib/kunit/try-catch.c
+++ b/lib/kunit/try-catch.c
@@ -41,6 +41,11 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
 	struct completion *task_done;
 	int exit_code, time_remaining;
 
+	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+	int debug_locks_snapshot = debug_locks;
+	int tainted_warn_snapshot = test_taint(TAINT_WARN);
+	#endif
+
 	try_catch->context = context;
 	try_catch->try_result = 0;
 	task_struct = kthread_create(kunit_generic_run_threadfn_adapter,
@@ -70,7 +75,23 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
 	put_task_struct(task_struct);
 	exit_code = try_catch->try_result;
 
-	if (!exit_code)
+	#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
+	bool extra_assert = false;
+
+	if (debug_locks_snapshot != debug_locks && !exit_code) {
+		extra_assert = true;
+		try_catch->try_result = -EDEADLK;
+		kunit_err(test, "Test triggered lockdep\n");
+	} else if (tainted_warn_snapshot != test_taint(TAINT_WARN) && !exit_code) {
+		extra_assert = true;
+		try_catch->try_result = -EDEADLK;
+		kunit_err(test, "Test tainted kernel with TAINT_WARN\n");
+	}
+	#else
+	bool extra_assert = false;
+	#endif
+
+	if (!exit_code && !extra_assert)
 		return;
 
 	if (exit_code == -EFAULT)

-- 
2.51.2

