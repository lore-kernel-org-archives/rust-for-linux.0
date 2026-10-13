Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566424BD34F
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886957; cv=none; b=W/3w4mAHqO7/Imx/qyn25lGvgAMX+VY7G/lixdwJBSdNtehBOrZK4XT3S+4OopTFzznlyl2B4erBMCD3ZoQc9247WFG+HeU0wtxY7ZI6VBVVYZwkZ8+D4AsUP15Bcx2RaAvQsKYAoLAf/MzaZrebATJuksABMd0HHwqeMnIS/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886957; c=relaxed/simple;
	bh=93xC3/upfsa/twJxPDQzew/ko1gX/yS9rNw89pYITeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVZY7XOf8lDK1LXEcJXOPl3UQXcacah3syQXuCeQCM/YJy4Cof4Vvyd3anmMa3Escgw0f6y3mgoTJDSqCEr7P3bWkH26b9CmFKkzYKw54IUKqnL1MoDH+hX8/6HMW0Scbd5sAN2b7eN73ffKO0CUkE3E7MKS+e+Q8xuiIYDXBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfIh5/+S; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfIh5/+S"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so2566454a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886954; x=1792491754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7clhEis3l5vh76pGdzr3b2EmsBU2JfvAO16ToGyoS0=;
        b=SfIh5/+SkjKmQ2Jh7X15wUMX2+aJ1bixo8jnJPeY889SzYyu8GNbSYLL9RzQzyTGL2
         ksTsiI6J/b46ZKJhH0WtyJhc84U7JQl+V34r08MkvpceFaGo7wj75d8oIm/jeGQLIcN0
         KPdkF1WdMPMBQDXPHg+5+2rFWo8YYX2Nc+02gQkjriD5vpLQr4jIzvJ22/b2w+RNfLqA
         fsCCNE6ga+td5Uwt1vDvJYm7RuvDri4MKTpcBofZAzaNFnoCPV58JrdossKDtLn2IC2p
         3vv8g7QDpEpHcZRYx20lIuS+LHMqCxMAW8vIMMtScKkY/HkUUCxm2hj86w4yC7dvyN1B
         +b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886954; x=1792491754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7clhEis3l5vh76pGdzr3b2EmsBU2JfvAO16ToGyoS0=;
        b=WbbFaZAxzY2UgRK0nTTXRTYFn+/c+Ybf6O6h63FLgbpvR/E8USrZA9bD29MCyej6tW
         1+ENuGJ4muLaerNn6L6OD47brhEqGSHsZMMz9tTgdFA3t8ne3ww0jCk7gjHycDeSLOGx
         STZM3ZkZbU4XIrqR6ATog5eK1X3m7XH+2W5JL4j9q3xkPQ8bRvXiNYgX8bHEMY1NjNs2
         dHiZMLoRCltOA8Imc7vH88osN0+FFYEMnnX1gXsdT+Nf4d8XdLv28u7u6HCWuLywfeSs
         njlTH+/1czdFFCMNRK55bIhInFh8sZVSJY4EI1TSgkJjnq6qRZ/TPupfs6XwBTT3Zssm
         GTDg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+zcIkcFtAfrMDz+SPM21dDpxT9ZZOK4tdt0I++0iRY4ARBME/ljmsjlAa9w+uivcs1hK3walCTAz5+MgLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjXXBZU/0KgWNxMcowdWXej16hatY/YHwCVrdwElD+E2Upx0Vi
	9pjUCU37GUTTdo2YTuU18W4xHN2QFa6zE4HNTffcKKO8ndDgKf/AAKTw
X-Gm-Gg: AYBFou3pSWq7Sw4B0jHBMAh40bb+iOEjnQuyLDqseXW3uEabaqFO/S/vcAZhx6xhbK/
	DFK/nEqcBOj09QQ+q9z1ya1jrcU4fiOCn1MW0Zb9qX6iSIZf9TmayehurRE3LxN9O53iaYkOOgu
	LmZXRhceBaKw5bgvXPXHpYvVFSKGmZaFpAimonwI0weYxl+WMLcSrg/kXkVNH72H5g6IrNfvOzq
	kLjsMeQTWUBbTmg/Vr5HoLNruxZsv7Gh7VdVsrVvbEMgC/4DcpaiAKWuODZpWM4CcYcgl2qazem
	JvW6Un44F7ixn41V5+MwNPCvfYVbkxGkx5p69KSHa16Wmp9h6u0/NJu/biyasshcxBpArxvaYTb
	TkSo14hYiiEcu5x91Ekpv8nIgSdzOY97yEIw+OqLtz9jGLreoXd1fpR8NKwOJGD4XKbQGMmSLD1
	XWYyxGz/uIQ0vUgnuba+lnFli/R5iQCn/qX7I/T3TKqZMWwYXNtNcw349ISWzewuB5wgIJU6/Bh
	YXFXeiAJSowXKop5g81QrdnDbarOkAzxQM=
X-Received: by 2002:a17:907:2da9:b0:c31:82aa:dd47 with SMTP id a640c23a62f3a-c31aa017e24mr1179807566b.44.1791886953580;
        Tue, 13 Oct 2026 03:22:33 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:32 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 13 Oct 2026 12:22:23 +0200
Subject: [PATCH v3 3/4] kunit: add assertions for TAINT_WARN inside of
 kunit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-lockdep-kunit-v3-3-cdb8ff720c1f@gmail.com>
References: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
In-Reply-To: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
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
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=2647;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=93xC3/upfsa/twJxPDQzew/ko1gX/yS9rNw89pYITeg=;
 b=E4/SRkMIxWTOqpH4QGDb4bSD8sDdigI2DpKpj0JtUUCDX40gIqrqWG97Yt2KATqvDlHYDk5dB
 oaUWhab4BnzARRDlv8e6XKVuv0jCqx4cBBdD2bwv/9iyL4HDhSSiFpD
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

Assert that the kernel is not tainted with `TAINT_WARN` prior to running
a KUnit test case, and assert that it has not become tainted with
`TAINT_WARN` while the test has run. If this is not enabled,
writing and running KUnit test cases that trigger a `WARN()` does not
fail the test if the test itself passes. If enabled, it marks any test
that triggers a warning as failed, and forcefully skips all proceeding
test cases, since the taint cannot be cleared and the kernel is now seen
as unreliable.
The assertions are gated behind `CONFIG_KUNIT_FAIL_TEST_ON_WARN=y`

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 1292a0799c33..6d6f1e947db5 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -81,6 +81,30 @@ void __printf(3, 4) __kunit_fail_current_test_impl(const char *file, int line, c
 	kunit_kfree(current->kunit_test, buffer);
 }
 
+/*
+ * Fails current test if TAINT_WARN has been set (changed) after the test has run.
+ */
+static void kunit_check_taint_warn(struct kunit *test, unsigned long tainted_before)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_WARN) &&
+		test_taint(TAINT_WARN) && !tainted_before) {
+		kunit_err(test, "Test triggered a kernel WARN");
+		kunit_set_failure(test);
+	}
+}
+
+/*
+ * Skip a KUnit test if the kernel is tainted with TAINT_WARN.
+ */
+static void kunit_skip_if_taint_warn(struct kunit *test, struct kunit_suite *suite)
+{
+	if (IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_WARN) && test_taint(TAINT_WARN)) {
+		suite->forced_skip = true;
+		test->forced_skip = true;
+		kunit_skip(test, "force skip: kernel is tainted with TAINT_WARN");
+	}
+}
+
 /*
  * Fails current test if test turns off debug_locks.
  */
@@ -487,6 +511,7 @@ static void kunit_run_case_internal(struct kunit *test,
 	struct timespec64 start, end;
 
 	kunit_skip_if_lockdep(test, suite);
+	kunit_skip_if_taint_warn(test, suite);
 
 	if (suite->init) {
 		int ret;
@@ -539,6 +564,7 @@ static void kunit_try_run_case(void *data)
 	struct kunit_suite *suite = ctx->suite;
 	struct kunit_case *test_case = ctx->test_case;
 	int debug_locks_snapshot = debug_locks;
+	unsigned long tainted_warn_snapshot = test_taint(TAINT_WARN);
 
 	current->kunit_test = test;
 
@@ -549,6 +575,7 @@ static void kunit_try_run_case(void *data)
 	 */
 	kunit_run_case_internal(test, suite, test_case);
 
+	kunit_check_taint_warn(test, tainted_warn_snapshot);
 	kunit_check_lockdep(test, debug_locks_snapshot);
 }
 

-- 
2.54.0

