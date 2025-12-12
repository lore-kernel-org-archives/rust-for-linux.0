Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5730F7F0
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582954; cv=none; b=rYDSaJfV1M0WectyfHVbJ3agGwDlF++lgwSTokdOLNEy5f1bFaW8uwPHyo3RF1N2GN54PIJeEY5Tgq5PnM2ak9tzXN2pR+nu7KSClPk98mSp8n0pjysSLXwsg0T9zQXG7roXm2dBWwaE82v29Eg5HU5IqUl9ifGpvM00lQxjRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582954; c=relaxed/simple;
	bh=zWmWPrNOhUkM882JMpbDBfEGQcxG/fITkb9z+Trg0V8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EHrGSXolpsWLhvLiijp08qkHTkjxxlDLBlq2WzXgaRjBDnYpb4Fcdt+E7hb9HWcgf2P5ybEBBcHvWinriN4RCOenjPrARHqXhN6sSluN9teb2x2QB0lf5rQvfn0tdKazHjeqZVnXG8r1bkO06xkI/czwE7Ta9JzqMza5ryGGWSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q+1zyVJI; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q+1zyVJI"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b6097ca315bso2747374a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765582952; x=1766187752; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEnDmHEq/pjEOk2KbWPaIkOgwqje/3X84mpIIYgLImI=;
        b=q+1zyVJINRXqdnaXxIC3VK9Bwr1UiVPUX3bbI7P7MOchvc8rgQbwUKyTIdmKPErRRb
         4ZzSb7DvmdHlzN337iXjyatKgBHqUDqyb8mQAsOZEPkvH+x+DOl2LOl3vFpuE40hOCW/
         UwukFfZsmovpVfnf1e7Vb1OjjtBaDeI55MgrA8TYn3Wd+1aFBJH8za1Sv833YNzVmDUh
         srfG/idFd2lzD+3XVYxftI0isw9KrEiD15mC6jqBlpYmd13rkQWBXVNd/CBVC2yc5eoJ
         29nPHgqrcl9KPEeZUZAn7ynBxI86rsBg217FemesmlY+DY7Ph8ZE7OhudDKO/kXxsT9X
         rhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765582952; x=1766187752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEnDmHEq/pjEOk2KbWPaIkOgwqje/3X84mpIIYgLImI=;
        b=XL1RVo2fP9vOt32DADWGKRDQvxqUlY2Jk6iKgYu3NSAXfUR1cyHJvWG1PpYArLGVmS
         Qe5CfZQbwpAtddHUBuH8ZAXJ1LoH9ipb6QsQYfq48wGOcILj8kVB69+0Q2FIt6owai73
         cWzO6ugwAppY99ONaCoUh1VuWm0NXfIVN0KvQNTJbtt7KriurigJSHnGeWKItSNt7UxA
         S/TjawespD+BMu4JcT96y2RZj8g+P0n1xeAlY1cUwuCjBKDqmBrLLkipw0TZctClOzhS
         YFDQUvEFbMvI6q4xlKZlol0a4cA+Z5BqfHtv/pQm0OWsgo1N2PbtEyZmwrQZkmgvoWke
         SOuQ==
X-Gm-Message-State: AOJu0YyHV+cp0/g3W79I0DWavSyHw3hcoBit1eYgvzbFrDgvIYNqmpxH
	eN0Qf4DdYvEVbJSEThKRa2CpORj4NnqtXS9u3GD63z7E3MsDQlWn2uUVJ0z4EBj++Sqe9N+UL31
	fKtc4YLVcnw==
X-Google-Smtp-Source: AGHT+IGjrlVj6t2VMO6pNuEY3FLrlWBfPb8VdKSXQTdk2nAip8yza2Lg/t5wuRdSBSs7QnkzuXNi9H3EA4j3
X-Received: from dycmv2.prod.google.com ([2002:a05:693c:2802:b0:2a2:318c:8559])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:53c3:b0:2ac:4db:9481
 with SMTP id 5a478bee46e88-2ac2f8d1712mr2421622eec.19.1765582952141; Fri, 12
 Dec 2025 15:42:32 -0800 (PST)
Date: Fri, 12 Dec 2025 23:42:19 +0000
In-Reply-To: <20251212-transmute-v1-0-9b28e06c6508@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251212-transmute-v1-0-9b28e06c6508@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765582949; l=3786;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=zWmWPrNOhUkM882JMpbDBfEGQcxG/fITkb9z+Trg0V8=; b=7VRIUHwRNnlmURhG35fKZRQowcBdjQWcur0LUck1p6YJhaARGI8bUve3O5kQ/GvSfzFB+Mr8O
 RRYKuB7fqcHAk+oX25ohbK2kyKme8TsaEVGbY0GVLmrcvFk+TUWoa5A
X-Mailer: b4 0.14.2
Message-ID: <20251212-transmute-v1-1-9b28e06c6508@google.com>
Subject: [PATCH 1/3] rust: transmute: Support transmuting slices of
 AsBytes/FromBytes types
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, we support either transmuting a byte slice of the exact size
of the target type or a single element from a prefix of a byte slice.

This adds support for transmuting from a byte slice to a slice of
elements, assuming appropriate traits are implemented.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/transmute.rs | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index be5dbf3829e25c92f85083cc0f4940f35bb7baec..5cc5f4fde4c31cea3c51ab078b4d68f3a0a2caa1 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -122,6 +122,78 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Option<(&mut Self, &mut [u8])>
         }
     }
 
+    /// Converts a slice of bytes to a slice of `Self`.
+    ///
+    /// Succeeds if the reference is properly aligned, and the size of `bytes` is a multiple of that
+    /// of `Self`.
+    ///
+    /// Otherwise, returns [`None`].
+    fn from_bytes_to_slice(bytes: &[u8]) -> Option<&[Self]>
+    where
+        Self: Sized,
+    {
+        let size = size_of::<Self>();
+        if size == 0 {
+            return None;
+        }
+        if bytes.len() % size != 0 {
+            return None;
+        }
+        let len = bytes.len() / size;
+        let ptr = bytes.as_ptr().cast::<Self>();
+
+        #[allow(clippy::incompatible_msrv)]
+        if ptr.is_aligned() {
+            // SAFETY:
+            // - `ptr` is valid for reads of `bytes.len()` bytes, which is
+            //   `len * size_of::<Self>()`.
+            // - `ptr` is aligned for `Self`.
+            // - `ptr` points to `len` consecutive properly initialized values of type `Self`
+            //   because `Self` implements `FromBytes` (any bit pattern is valid).
+            // - The lifetime of the returned slice is bound to the input `bytes`.
+            unsafe { Some(core::slice::from_raw_parts(ptr, len)) }
+        } else {
+            None
+        }
+    }
+
+    /// Converts a mutable slice of bytes to a mutable slice of `Self`.
+    ///
+    /// Succeeds if the reference is properly aligned, and the size of `bytes` is a multiple of that
+    /// of `Self`.
+    ///
+    /// Otherwise, returns [`None`].
+    fn from_bytes_to_mut_slice(bytes: &mut [u8]) -> Option<&mut [Self]>
+    where
+        Self: AsBytes + Sized,
+    {
+        let size = size_of::<Self>();
+        if size == 0 {
+            return None;
+        }
+        if bytes.len() % size != 0 {
+            return None;
+        }
+        let len = bytes.len() / size;
+        let ptr = bytes.as_mut_ptr().cast::<Self>();
+
+        #[allow(clippy::incompatible_msrv)]
+        if ptr.is_aligned() {
+            // SAFETY:
+            // - `ptr` is valid for reads and writes of `bytes.len()` bytes, which is
+            //   `len * size_of::<Self>()`.
+            // - `ptr` is aligned for `Self`.
+            // - `ptr` points to `len` consecutive properly initialized values of type `Self`
+            //   because `Self` implements `FromBytes`.
+            // - `AsBytes` guarantees that writing a new `Self` to the resulting slice can safely
+            //   be reflected as bytes in the original slice.
+            // - The lifetime of the returned slice is bound to the input `bytes`.
+            unsafe { Some(core::slice::from_raw_parts_mut(ptr, len)) }
+        } else {
+            None
+        }
+    }
+
     /// Creates an owned instance of `Self` by copying `bytes`.
     ///
     /// Unlike [`FromBytes::from_bytes`], which requires aligned input, this method can be used on

-- 
2.52.0.305.g3fc767764a-goog

