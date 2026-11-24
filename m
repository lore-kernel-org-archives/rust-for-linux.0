Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526841;
	b=lOsyfwSLggzNEX3vBKpLWaasIgX6RpkpINt4PVEWa5OgT93XzWpZkKMeFFNf475U1yEG
	 jIRmU3IZgOmVLZi7qf6v7vgsQnrDWCmOoHKNsAwriNI0Wpva4BRl6GGK2uD1ws5qt+DQN
	 vbHIxbJ4YEPBX+pl0QXeKq94zfiFryrYiXTOZUgFkkFBYHTx0Qlt6uxf4Fxk74gIinbG2
	 fdeqgbb62e9Xx8fOQ79jKRPHiGIX0mP6HdDPoYRGE38+N8DFF81mui5wIK89ML1qIP1Wy
	 uIUqInMuCnYfJxR+o1ycTNJinsf5aecP+wLteHZlol2sHxz1bBgwrDnsdJNnAbiUSyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9knFjMHe9w7dRyRiUwbfv/BO6CtQAiEfyZrTpR7EXyw=;
	b=vIniCo8iyI8RinkozVTAnDPcJDlaxU/2MbcWoarEKFLnGhuUAwglDGGHXKxO14hbiAko
	 TcnVDk207Em39dEcbyljQREs6Nm58h4//wqxgKITUVc5hj6uOwCgBcbH2JBGHVYyHbDtO
	 lQISTVxC9yTbjppJotedEP9vcCZJt2PSJIEESYTLZPXy4So/3+Jj3kdqi4cj8zzqmkvYu
	 MeUsq6K9esvaSPq6Z1L9klhcDc0dXxZ4IbpFghsLgMTOpdvngFBe1P7Wm3JEhf3NHuLpv
	 8D5TJ1Fj2vzgZQd08oFb5cqW3qPkav8QVgSXtcm58aFpzC80ygDr9xVW+EoB0Ev7Z5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=perdcq5+;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5D606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 13:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F5D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=perdcq5+
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so2243765e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 05:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526839; x=1796131639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9knFjMHe9w7dRyRiUwbfv/BO6CtQAiEfyZrTpR7EXyw=;
        b=perdcq5+AldvA+MchVxkXM1uXXl85DxiMbIRIkPbOjxRxoDIQF+j3bktB2r60qVjHp
         yaulLFm361z5YzaJ21WucI56qtVxWHfcE5rI2qNPNmDUHIqQje41ja3qLLkrSTsrHnrw
         JbyvJ8lj5xsxtj7AnMBmXjX6M85qtnBLMoZcZQTvRKLy/LU5GssPgB7OeAMc1odR72j1
         XNFMO+JQd5vGbFrlh4doMkM3yCaROeD/6p0VtvKd+y5G3K0WmU3WRmmnM9U0SLi843l/
         0fuNxlCwAFMTPVqUg9H//92D1Q87D/cjJiZb4Am7cAb4op54hH3hokyTPGVNQFr4NIsd
         7cUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526839; x=1796131639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9knFjMHe9w7dRyRiUwbfv/BO6CtQAiEfyZrTpR7EXyw=;
        b=u5G8ptSoy4K2WHpKhY2kX5twJXqtqzh8HXnpsCztDjAAXzMbQhDrGBZnA+az/OAghk
         XdDkwiV/XexvRl6xFiTIADBqAdIVDksKh+jWjdL4ka/DBPxC8M/tOM096EBYiI+wb5sh
         NCkCPZ0sqGwwd7QC0QSX8LU+SAynVQ8dhn7y0sV3/lBwVqv9Z8nUnC4NGTt1ZDKXTQ9o
         Fsq1rUgJd9EyMK8j/e17GRaF4zp3TBS6DP/pxZyP62HL8PIr6uCKVUuBf4iUfqf4Y+Yq
         JtbQDldZyRs8ZJaUKy8ZGi6/k1Ly1Sxo1bjgygxMB4eZOXK9fQq2I3/+Lts+Cr3zTgO3
         je6w==
X-Forwarded-Encrypted: i=1; AL+hErHlf3EjD0808QjD3WFbEkXuik6WTCMiDOxeOA2+3BXErZgrjwUBmU3Y4hz9RCfn7Lo3lJbmAFxOJTocNyarVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tjmr5Bh66aO8DIkE0ev5kF5Afun0qCVVbMCmpT74zQViZwF4z
	jjDBEel24rGXzrJNmgwdYezcV/cnfWLUEbGK1az/DjaoLJ/YblVBXCsS
X-Gm-Gg: AZFdTZddmdkrq9BJJ+j1irvVjtK14lcGQK1eFGJBPH1o9rPZjoFkvGjrMOMYhzU3H3k
	8Uz1p7SnlYmi9yOgoTa1BNRfizdH206NGW5kAn0GHO7eKGzP3MNe9j6kCI3t/787T03g3FieC4d
	CHJuoYzmhgU5w+Esre+EFTXcnQIWU6H9NshUPHkjOuhEvDWV+EAh7T1lYx0GAALolanDuDt0szX
	khdfRhHhPGxrMfKr2K1E1Qx+id5mmd2OI2sOWNwBeEMPE7UqmJOXd2s7WI5l/PZY30r9FhQjcXo
	ej4NSamdfxzHsFReJcRjJ7dhXu3hQYxqm7Q9G/Fd7K0muTrgbXkSO4oOjyjbomE/ZFu0VJNDV8O
	g1QWMLltasvpK/m13ihq5jls4cBfwCi60rbDyy/pcK2E82LReNstSw+tBtSjuNNGiaNlpzofRGE
	zW2hizp/VN4rtEXcYbcOaliiWgC3I1HN85rO8iTRJ2wmbI20eaBxrEVrdT3xvJpUgklFhdlRTb4
	we0ZhaUOMXJIJbvBTM3q7rT55VzbRjJltTw3bpBB1F/vAKFY+GHUsgtHf07oaZOa8frVWGc9Yev
	QZU8Zg8PbFEJ2kBMaZYmtbbIAKTQ0sQNvs2U
X-Received: by 2002:a05:6512:618:20b0:5c0:165:16c3 with SMTP id 2adb3069b0e04-5c1bc85f246mr3044609e87.64.1795526839090;
        Tue, 24 Nov 2026 05:27:19 -0800 (PST)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd064420sm3733777e87.71.2026.11.24.05.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:27:18 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH] rust: bug: add warn_once! macro
Date: Tue, 24 Nov 2026 15:27:07 +0200
Message-ID: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Rust counterpart of the C WARN_ONCE() macro. It behaves like
warn_on!(), but additionally sets BUGFLAG_ONCE, so the warning is
reported only the first time a given call site triggers.

The macro returns the evaluated condition, like warn_on!(), so it can be
used directly in an `if`.

Use it in Vma::zap_vma_range() to report an invalid range, which
resolves the pending TODO there.

On configurations where warn_flags!() ignores the flags (UML, ARM and
LoongArch), the macro behaves like warn_on!() and warns every time.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/kernel/bug.rs     | 46 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/mm/virt.rs |  3 +--
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 3b40b0bd3..a0db5c902 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -156,6 +156,27 @@ macro_rules! warn_on {
     }};
 }
 
+/// Report a warning on the first time `cond` is true and return the condition's evaluation result.
+#[macro_export]
+macro_rules! warn_once {
+    ($cond:expr) => {{
+        let cond = $cond;
+
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
+        const COND_STR: &str = concat!("[", stringify!($cond), "] ", file!());
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
+        const COND_STR: &str = file!();
+
+        if cond {
+            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN)
+                | $crate::bindings::BUGFLAG_ONCE;
+
+            $crate::warn_flags!(COND_STR, WARN_ON_FLAGS);
+        }
+        cond
+    }};
+}
+
 #[cfg(CONFIG_RUST_BUG_KUNIT_TEST)]
 #[macros::kunit_tests(rust_kernel_bug)]
 mod tests {
@@ -184,4 +205,29 @@ fn test_warn_on() {
 
         assert_eq!(suppressed_count, 1);
     }
+
+    #[test]
+    fn test_warn_once() {
+        // SAFETY: `kunit_get_current_test()` is always safe to call (it has
+        // fallbacks for when no KUnit test is running).
+        let test = unsafe { bindings::kunit_get_current_test() };
+
+        // SAFETY: This function runs only as a KUnit test case, so `test` is a
+        // valid pointer to the running test.
+        let handle = unsafe { bindings::kunit_start_suppress_warning(test) };
+
+        for _ in 0..2 {
+            assert!(warn_once!(true));
+        }
+
+        // SAFETY: `kunit_suppressed_warning_count()` accepts any value returned by
+        // `kunit_start_suppress_warning()`.
+        let suppressed_count = unsafe { bindings::kunit_suppressed_warning_count(handle) };
+
+        // SAFETY: `test` is valid as above. `kunit_end_suppress_warning()` accepts any
+        // value returned by `kunit_start_suppress_warning()`.
+        unsafe { bindings::kunit_end_suppress_warning(test, handle) };
+
+        assert_eq!(suppressed_count, 1);
+    }
 }
diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 63eb730b0..567665958 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -115,8 +115,7 @@ pub fn end(&self) -> usize {
     #[inline]
     pub fn zap_vma_range(&self, address: usize, size: usize) {
         let (end, did_overflow) = address.overflowing_add(size);
-        if did_overflow || address < self.start() || self.end() < end {
-            // TODO: call WARN_ONCE once Rust version of it is added
+        if crate::warn_once!(did_overflow || address < self.start() || self.end() < end) {
             return;
         }
 
-- 
2.56.1

