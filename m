Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF34C9F
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 04:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183465; cv=none; b=JEuRfJu/gCDHmZ/kzGm0Tn2FI6+boRWEhFhyVEbPz5Ar/qUhfKQjI3sHwbaVH2IZXk1U8c6d0NAZRP6owVxmqCPJDoPkZsYbfWbxaHp7DUWw++CeQT1y244XCkeDBrQvZEqGGqOaqAxzKGpAStwNLUDIj71+mEGLcCC6c0aRsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183465; c=relaxed/simple;
	bh=UQczbJJINksg9RChdSK+z3ZVyXio4KjtiG6ElGO1pKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=c38K97mJBAuU4QkI+UNwLas1EsT0Kb0CvnC9b64ZLksBTKJEbHtEIWS9dG6PjqH1yeeo16QexBdkKMVBVFytjmq8Jll7DUICW/vooMUGomsVbyDAtALu1hIonfREui7/DlgmMeHOIA6KFPNZDsGCOy8djho207qZJAvY9K03vQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AnOd8j7q; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnOd8j7q"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c9907967so1686267b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jun 2025 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749183462; x=1749788262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4aEyrZFNk/1CL01crfYm+eFmGehcO94b8G4ubo5r+k=;
        b=AnOd8j7q1ugKK9K8ks8t4YNupvJ+yXE9tSBbwFh2zsgXclgsFQV99jK34HnXgb0PDb
         sw0lMNz/lDUthjqyuDkX5LkSy4WUh1DvVVT052wDJ0hcOvz8bLksybS4YrtlER0YHz+a
         iN+EoOjERpPcVZX/JrmuWSvrPihVgeFcw8DFVgavQMpYCTuFpySwv/PfLIA/ZAkrgXrT
         QXX1dwGQMW9mJMeOM5VBCygVQLdT9xtzp/lMGKcuwHOhPe2Vw4EiYDwjyfPVwVak3kry
         GMsvuSmS00aaG8TAAdLuUzVZ7RTwoz/6FqLb3Ej9idrA9BOW5Dq4t0lECp7vzeVPUTlQ
         p9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749183462; x=1749788262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4aEyrZFNk/1CL01crfYm+eFmGehcO94b8G4ubo5r+k=;
        b=tqGYU8YVAwUkJwTiQ/XPubzjyQoG3FQz4KE6jZw8tKDYGkAPlnP2E6nDmk0YtMHJbd
         fOuLS7MonDsy9gDwcHVG8uzJQ7CZBnX7ijAgjWXhtu1CVdfCJsNGqcI47TIv/XWH9gio
         pobfV3Lsy/a+qjRknxHfiVx6PTbUNOtRlCkT9DzCPv0uuL1E2WTV5M3qS6aZ3F76ffB3
         5r1j0YP1ChQkFP7iodgixn9DJ5SJHqlpC7rFMwoUs76zctxrVTdSfhWJK9ePYq7ycxkj
         GsTgJviK3SLFTzsuDasFRE9GkKtoVoS9RQfGeJ8io/lOyqOUicL8F4jiAslDQYZOFFko
         jZaA==
X-Forwarded-Encrypted: i=1; AJvYcCUjX53zn2VyCtXqu/W17O6vkJsAW6aSpMglig63FZZEyru7gHxuI1yh5+QTxh6QGcEdLe0a2ShB2uXdK/iHDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKHTGqfEBdzFmVPZqIPm8X8LpB/xRsBiEWAw/eZDOhYCAVywF
	hVTkXT5RRBYyYlY7LVPb9nHAkMt5FEfPwSL0z05UbhNogyHun5T7FmWD8rRiQgQhOJg=
X-Gm-Gg: ASbGncvwjKd51xrobA6/uecsLQoI3PnsP/EAXxwNWe4TWnKK97NUjwUQnD7W+Ub4rw0
	WyK/tYgEbXBbXanEU6/aEbJGgF+7yGwhWmOAQclr5h3YuiGH43XcvEmq5QHyf/ttgHU2OPEv5he
	yZ2e0jHzuieTsgucKkdXMeIb2RYR1giCc48aPGDZfILmDlskDjm6H8fqHiQd/iD34TS3OzlV/Q2
	lpD7x6NWmXAbTHTAvKuHvY60Fy05aEUZlwIFV+RqQq7aaKDe8h8D4mOJ4SlKwsqRFldge4WE49c
	1CEUL+V8PoMrCKhdM7INA9vufhdDo3nb82Hcy61MvgZ1GAA5TiQgF/ZfhWeqmK8=
X-Google-Smtp-Source: AGHT+IF2LowmZhLzFucdSuxz1wiMxL5SZAl0Mf2BPTZjTMLgb+HM9hELn+kmbzYtxQLVBabHLHUR4g==
X-Received: by 2002:a05:6a00:1142:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-74827cfb07fmr3098083b3a.0.1749183462550;
        Thu, 05 Jun 2025 21:17:42 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3859csm433912b3a.36.2025.06.05.21.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:17:41 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yury Norov <yury.norov@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: cpumask: Validate CPU number in set() and clear()
Date: Fri,  6 Jun 2025 09:47:28 +0530
Message-Id: <8b5fc7889a7aacbd9f1f7412c99f02c736bde190.1749183428.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The C `cpumask_{set|clear}_cpu()` APIs emit a warning when given an
invalid CPU number — but only if `CONFIG_DEBUG_PER_CPU_MAPS=y` is set.

Meanwhile, `cpumask_weight()` only considers CPUs up to `nr_cpu_ids`,
which can cause inconsistencies: a CPU number greater than `nr_cpu_ids`
may be set in the mask, yet the weight calculation won't reflect it.

This leads to doctest failures when `nr_cpu_ids < 4`, as the test tries
to set CPUs 2 and 3:

  rust_doctest_kernel_cpumask_rs_0.location: rust/kernel/cpumask.rs:180
  rust_doctest_kernel_cpumask_rs_0: ASSERTION FAILED at rust/kernel/cpumask.rs:190

Fix this by validating the CPU number in the Rust `set()` and `clear()`
methods to prevent out-of-bounds modifications.

Fixes: 8961b8cb3099 ("rust: cpumask: Add initial abstractions")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/all/87qzzy3ric.fsf@kernel.org/
Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
Closes: https://lore.kernel.org/all/87qzzy3ric.fsf@kernel.org/
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/rcpufreq_dt.rs |  2 +-
 rust/kernel/cpumask.rs         | 49 +++++++++++++++++++++++-----------
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 94ed81644fe1..f396c8f35069 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -70,7 +70,7 @@ fn init(policy: &mut cpufreq::Policy) -> Result<Self::PData> {
         let dev = unsafe { cpu::from_cpu(cpu)? };
         let mut mask = CpumaskVar::new_zero(GFP_KERNEL)?;
 
-        mask.set(cpu);
+        mask.set(cpu)?;
 
         let token = find_supply_names(dev, cpu)
             .map(|names| {
diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index c90bfac9346a..75d4ce916b4f 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -37,13 +37,14 @@
 /// use kernel::bindings;
 /// use kernel::cpumask::Cpumask;
 ///
-/// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: u32, clear_cpu: i32) {
+/// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: u32, clear_cpu: i32) -> Result {
 ///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
 ///     // returned reference.
 ///     let mask = unsafe { Cpumask::as_mut_ref(ptr) };
 ///
-///     mask.set(set_cpu);
-///     mask.clear(clear_cpu);
+///     mask.set(set_cpu)?;
+///     mask.clear(clear_cpu)?;
+///     Ok(())
 /// }
 /// ```
 #[repr(transparent)]
@@ -90,9 +91,15 @@ pub fn as_raw(&self) -> *mut bindings::cpumask {
     /// This mismatches kernel naming convention and corresponds to the C
     /// function `__cpumask_set_cpu()`.
     #[inline]
-    pub fn set(&mut self, cpu: u32) {
+    pub fn set(&mut self, cpu: u32) -> Result {
+        // SAFETY: It is safe to read `nr_cpu_ids`.
+        if unsafe { cpu >= bindings::nr_cpu_ids } {
+            return Err(EINVAL);
+        }
+
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `__cpumask_set_cpu`.
         unsafe { bindings::__cpumask_set_cpu(cpu, self.as_raw()) };
+        Ok(())
     }
 
     /// Clear `cpu` in the cpumask.
@@ -101,10 +108,16 @@ pub fn set(&mut self, cpu: u32) {
     /// This mismatches kernel naming convention and corresponds to the C
     /// function `__cpumask_clear_cpu()`.
     #[inline]
-    pub fn clear(&mut self, cpu: i32) {
+    pub fn clear(&mut self, cpu: i32) -> Result {
+        // SAFETY: It is safe to read `nr_cpu_ids`.
+        if unsafe { cpu as u32 >= bindings::nr_cpu_ids } {
+            return Err(EINVAL);
+        }
+
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to
         // `__cpumask_clear_cpu`.
         unsafe { bindings::__cpumask_clear_cpu(cpu, self.as_raw()) };
+        Ok(())
     }
 
     /// Test `cpu` in the cpumask.
@@ -180,19 +193,23 @@ pub fn copy(&self, dstp: &mut Self) {
 /// ```
 /// use kernel::cpumask::CpumaskVar;
 ///
-/// let mut mask = CpumaskVar::new_zero(GFP_KERNEL).unwrap();
+/// fn cpumask_test() -> Result {
+///     let mut mask = CpumaskVar::new_zero(GFP_KERNEL).unwrap();
 ///
-/// assert!(mask.empty());
-/// mask.set(2);
-/// assert!(mask.test(2));
-/// mask.set(3);
-/// assert!(mask.test(3));
-/// assert_eq!(mask.weight(), 2);
+///     assert!(mask.empty());
+///     mask.set(2)?;
+///     assert!(mask.test(2));
+///     mask.set(3)?;
+///     assert!(mask.test(3));
+///     assert_eq!(mask.weight(), 2);
 ///
-/// let mask2 = CpumaskVar::try_clone(&mask).unwrap();
-/// assert!(mask2.test(2));
-/// assert!(mask2.test(3));
-/// assert_eq!(mask2.weight(), 2);
+///     let mask2 = CpumaskVar::try_clone(&mask).unwrap();
+///     assert!(mask2.test(2));
+///     assert!(mask2.test(3));
+///     assert_eq!(mask2.weight(), 2);
+///
+///     Ok(())
+/// }
 /// ```
 pub struct CpumaskVar {
     #[cfg(CONFIG_CPUMASK_OFFSTACK)]
-- 
2.31.1.272.g89b43f80a514

