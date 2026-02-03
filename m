Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913A3BFE4D
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133601; cv=none; b=GDKYdCDpuf1I0p/BCNTn9aGiTcYWLSefYQGNAVfZeo0ogbsoDg1TNE3QugCtQN8qkoaC/kf3CwAsj8IeO3ti6OtlzC6DQKsW1YYSL2E6cQ7tXUG63Mubp6XPZ5mKIFcREj7HvarPdwIV5la3wgqcAt9t3RmAQii7w2GamtYnChA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133601; c=relaxed/simple;
	bh=B6pUx1j5pFgygp5i69R4pVf7HKotofgGAbGCOoefnlg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kxh8QaEtuHxqJ/OJT0vVdUL6AmTO2hhC84wpcPvtUkNmdfXfWXvn5T8DvRCsBt7PIM/LIGPSGnVs7iaN2KXNUx7mzcYD/nGlW/4Jw5m6oUH5Ip84jBTWJGmKBBj/4NwQezOnjo3GI1qigm12hM3rziEGnarNWOj5rEBB6DGGB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y2uRjLBv; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y2uRjLBv"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b72b6fc371so11046460eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133599; x=1770738399; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QkppxUftz38QVidHBNdTmT2F8VCX5EZWUQmqLBEfqQ=;
        b=y2uRjLBvfn8tU0Fib3HMepDwJoWScAED2Z8NPq3Gb/KgpISVXuSCYzTnz44Ub/2RsT
         D7U6ytX5exnDF/M5d7XJTOfIWO1jSLzkHCKJ760z/84PHHyNZ/xNXj+hldbCx7CVdEf6
         bLTsvzBrKbsN3uczsLy3EEvMn7+YhLgQ2UHG8vcPTfGZWVVHkVqe/5Be3uRQgFo/CWrW
         2iPF4pmBY0lK62lO+0QGAOD0CRipFxc7Wfjvd7ScQlgpmL53VrRbgkwa4gbqAiKTnbYY
         ceIbuvIvnTo/s9H4QcwXhX8bsXOzXT+mjWn1TBzC2aVWXFSNwZXizt4LLuN7ou3SJWMo
         HNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133599; x=1770738399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QkppxUftz38QVidHBNdTmT2F8VCX5EZWUQmqLBEfqQ=;
        b=u5IkndXHqGCvCrMGkiMBrqRWdlWHrXFR3yNV0KuBRbR3sYpm+fvhwpe960O3UMphwS
         j1v1IgE2rM7SGMttApodE5iNI0EbiDH/FB/brmjPmUpmXYIanuhkKOTBtFOP0SexWvEP
         1E3uukbXnpRPosKaG+ZyeB6y3M5E7bsRMSqL/OwnDAXtJf9/juRcbQAAqa2WWVV95Y5l
         hx5kKsGMNXbsagTvG48qZ9i75Ut/F9MXwBaDsxQqW49ENUQWK7bC4XBNFLy6/AydAPBt
         cZ+Rh4ORJFHL9WZu0PRemyn50Vm24JIdePIy+vkBOQ82d6r843SBHS2P8iLLmko6PB6L
         bPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqYEMORw3yUAxttG+4Q1AGENTDuMjclSEoniNl7AjE9ecMqa0VqungTBmOJ4PGQYhEB0yzzHDDaqSXZtB4QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsd8toAnXKwAOkp4HZvL/wGcL9XPxKNvFpIQ88E1828ns+By/j
	F3L0VRJsYOxi1p1OB5SJPmXO5D9AAAwUvq0aUDkNif6LUL+kGrUNLRUhJtCPul21FSz1sas9kgx
	AIc4Rssc/gg==
X-Received: from dydb13.prod.google.com ([2002:a05:7300:80cd:b0:2b6:b139:8515])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c8d:b0:2b7:f415:53da
 with SMTP id 5a478bee46e88-2b7f41562demr4507487eec.39.1770133598871; Tue, 03
 Feb 2026 07:46:38 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:31 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=4973;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=B6pUx1j5pFgygp5i69R4pVf7HKotofgGAbGCOoefnlg=; b=fxAPn9jEKutvpJgCWN9uhdCYYPvpNSAPYUiC58vFHXa9srmJAEVvTYAI4ltyhlDhosBAKf3Rg
 E9oiUBNs6ZcCvvrOXXHz6bHCDz2FOMAAS2YvT7aTHhFBqLoubFyOfDq
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-2-d6719db85637@google.com>
Subject: [PATCH v2 2/6] rust: io: Support copying arrays and slices
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds support for doing array copies of data in and out of IO regions.
Fixed size arrays allow for compile-time bound checking, while slice
arguments allow for dynamically checked copies.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/io.rs | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 056a3ec71647b866a9a4b4c9abe9a0844f126930..6e74245eced2c267ba3b5b744eab3bc2db670e71 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -266,8 +266,9 @@ macro_rules! define_write {
 #[inline]
 const fn offset_valid<U>(offset: usize, size: usize) -> bool {
     let type_size = core::mem::size_of::<U>();
+    let type_align = core::mem::align_of::<U>();
     if let Some(end) = offset.checked_add(type_size) {
-        end <= size && offset % type_size == 0
+        end <= size && offset % type_align == 0
     } else {
         false
     }
@@ -323,6 +324,25 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize> {
         self.addr().checked_add(offset).ok_or(EINVAL)
     }
 
+    /// Returns the absolute I/O address for a given `offset`, performing runtime bounds checks
+    /// to ensure the entire range is available.
+    #[inline]
+    fn io_addr_range<U>(&self, offset: usize, count: usize) -> Result<usize> {
+        if count != 0 {
+            // These ranges are contiguous, so we can just check the first and last elements.
+            let bytes = (count - 1)
+                .checked_mul(core::mem::size_of::<U>())
+                .ok_or(EINVAL)?;
+            let end = offset.checked_add(bytes).ok_or(EINVAL)?;
+            if !offset_valid::<U>(offset, self.maxsize()) || !offset_valid::<U>(end, self.maxsize())
+            {
+                return Err(EINVAL);
+            }
+        }
+
+        self.addr().checked_add(offset).ok_or(EINVAL)
+    }
+
     /// Returns the absolute I/O address for a given `offset`,
     /// performing compile-time bound checks.
     // Always inline to optimize out error path of `build_assert`.
@@ -605,4 +625,54 @@ pub unsafe fn from_raw(raw: &MmioRaw<SIZE>) -> &Self {
         pub try_write64_relaxed,
         call_mmio_write(writeq_relaxed) <- u64
     );
+
+    /// Write a known size buffer to an offset known at compile time.
+    ///
+    /// Bound checks are performed at compile time, hence if the offset is not known at compile
+    /// time, the build will fail, and the buffer size must be statically known.
+    #[inline]
+    pub fn copy_from<const N: usize>(&self, src: &[u8; N], offset: usize) {
+        let addr = self.io_addr_assert::<[u8; N]>(offset);
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // assertion it's valid for `N` bytes.
+        unsafe { bindings::memcpy_toio(addr as *mut c_void, src.as_ptr().cast(), N) }
+    }
+
+    /// Write the contents of a slice to an offset.
+    ///
+    /// Bound checks are performed at runtime and will fail if the offset (plus the slice size) is
+    /// out of bounds.
+    #[inline]
+    pub fn try_copy_from(&self, src: &[u8], offset: usize) -> Result<()> {
+        let addr = self.io_addr_range::<u8>(offset, src.len())?;
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // range check it's valid for `src.len()` bytes.
+        unsafe { bindings::memcpy_toio(addr as *mut c_void, src.as_ptr().cast(), src.len()) };
+        Ok(())
+    }
+
+    /// Read a known size buffer from an offset known at compile time.
+    ///
+    /// Bound checks are performed at compile time, hence if the offset is not known at compile
+    /// time, the build will fail, and the buffer size must be statically known.
+    #[inline]
+    pub fn copy_to<const N: usize>(&self, dst: &mut [u8; N], offset: usize) {
+        let addr = self.io_addr_assert::<[u8; N]>(offset);
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // assertion it's valid for `N` bytes.
+        unsafe { bindings::memcpy_fromio(dst.as_mut_ptr().cast(), addr as *mut c_void, N) }
+    }
+
+    /// Read into a slice from an offset.
+    ///
+    /// Bound checks are performed at runtime and will fail if the offset (plus the slice size) is
+    /// out of bounds.
+    #[inline]
+    pub fn try_copy_to(&self, dst: &mut [u8], offset: usize) -> Result<()> {
+        let addr = self.io_addr_range::<u8>(offset, dst.len())?;
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // range check, it's valid for `dst.len()` bytes.
+        unsafe { bindings::memcpy_fromio(dst.as_mut_ptr().cast(), addr as *mut c_void, dst.len()) }
+        Ok(())
+    }
 }

-- 
2.53.0.rc2.204.g2597b5adb4-goog

