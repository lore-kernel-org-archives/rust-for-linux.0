Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0607830E0E5
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 21:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766783319; cv=none; b=tPZsg/R6a1KWvJGaw5KoV+zIVsp7jnnn7bA92L4TfLfo09FaEHoYaTr56LwJYdWJ2F1TCyCBABoNs9uyOUJrsyPFVgnVuwTv0rYoLBVgoMP4XvWr9vzauzZ3dGczrmdNQk6tS8nE85DodS8ptq47fJDdGaTIDKvoy2AOr3qTjpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766783319; c=relaxed/simple;
	bh=yRqOM84UfhvlX1GusCxviw7NRGJEsBz5ywTKlFKiQrA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bNVnkMGRZw/tjoskQMnOic2Z2fsLl5Sywpqr6XWJBHaJubrK1zS6GtR3jdFTwJsg5wNRq7dFk3dqoYYlG878WkLPxkHQbkzRugjXoPYQPpe/ESx8HZ5tXYSIPPfKKjFrytKK1kOd7n4a+XfoNam5i/9eXGLQOn4uh14WKeW9UiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1noZb4+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1noZb4+"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b99d6bd6cc9so15369319a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 13:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766783317; x=1767388117; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJS1IhwhkUR4azPowta91Z/26RTynx20SFmLNTxsNmE=;
        b=J1noZb4+nTuFrst5Xbr7d4Hzk064DFVXsFgIg+Y/rm7pZw0PN4u2dK+Xr4kOUwLkp7
         7N7HQTx90FCOH/Z7oYHD45Zm4XSjvuxahpsruKLoS36ZtchL9fmESkZRdOXUrzLjXf9J
         LAwmhKJkEQP5VIzbFUlZEZEEKBVe3HMGNgGAyTIqEY2X1XZPwXXjNr3gRmq2c96uDfpP
         sH9igTvmN8a/uTUqoO+cEWbgJc2ZHTF5uxsvs/n2iYFKhT+yVmNJHEhwwwfr434LQDM6
         D+QkEeMAQCwjaKmbAJdnOskTXjAWtkj3n12c8Kdpg65zFB+qB8wNBmQP+nYwcevxdcRD
         /W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766783317; x=1767388117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJS1IhwhkUR4azPowta91Z/26RTynx20SFmLNTxsNmE=;
        b=kDGK1+8OggMx+SPzXZPWLQtpGpKkfAb+h5v6EW9vwMZbwD2uX7zsJKX3aweIgTw4Pa
         4CuE4wcUSIy/7bbK9gdfPL6kSA5jNnkZ0QHyzKtYwI/fIxwqv86YW1JafNJJfB34E7v9
         eUVBFK4n2Biv7gYPNaRoxsEDSVpyfVpRypRQdHqohajpnjbx6sjPFpfQZIfq5hYM1HR+
         /vxWrryRtyjwIsTHGJaa5iFvstuhMLrK6QOt9TyRzgWS6I6i4hHP7NGT7W7i04wwvqK7
         uDRleQmVBKsyAxhTseABPhUtbjOFAMcVEvQD7HomlpKoSleyHkLa1SLRw45ggAjPFiS1
         p55w==
X-Gm-Message-State: AOJu0YyMBqadrIueCPoUGY0TZQZ/GD+lvaFhslhDUUK2Ooj4q/QoLKWn
	qyG3YMfUuSGfI4WsXMyrVbKx5xEu6lbziL4IruP6J7vknz2taIkApIL6lZm30QJQ4kVyzq3Uhoe
	kc66wqqM5/A==
X-Google-Smtp-Source: AGHT+IGWQCOT7tRQme+xoXGfeNeSS8GhTj7F5/XJQT6DU4knJWlizMnSMdxXfuhPgU3KtaUGxrfM8QSewT+J
X-Received: from dycc13.prod.google.com ([2002:a05:693c:60cd:b0:2ae:6000:3855])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:3aa4:b0:2ac:1b11:bf98
 with SMTP id 5a478bee46e88-2b05ec7425amr14867141eec.28.1766783317236; Fri, 26
 Dec 2025 13:08:37 -0800 (PST)
Date: Fri, 26 Dec 2025 21:08:20 +0000
In-Reply-To: <20251226-transmute-v3-0-c69a81bf8621@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-transmute-v3-0-c69a81bf8621@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766783314; l=3846;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=yRqOM84UfhvlX1GusCxviw7NRGJEsBz5ywTKlFKiQrA=; b=ko6Dp6YXYaL7fl8WCgXLr9N/+x0NSuA3igNCM4Fff6fIW6bFPFlQdUybmDtUJMTz/J70IZqI+
 ZujSc34JfQlCL/5dq4RAhDY2nSJJmUeYYmn4ZT+hIlp/tRylR2JQgLV
X-Mailer: b4 0.14.2
Message-ID: <20251226-transmute-v3-1-c69a81bf8621@google.com>
Subject: [PATCH v3 1/4] rust: transmute: Support transmuting slices of
 AsBytes/FromBytes types
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

Currently, we support either transmuting a byte slice of the exact size
of the target type or a single element from a prefix of a byte slice.

This adds support for transmuting from a byte slice to a slice of
elements, assuming appropriate traits are implemented.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
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
2.52.0.351.gbe84eed79e-goog

