Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D252D2837B
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jul 2024 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722112256; cv=none; b=mwddjtijK++yFatE1qAm6BlqfedMHoA9K/te7ZNMiB09qu2odjfK6v2Vor0jpgJSzOqSQZ+bC3YrpoQduLlekmGOnOBVId+7Qxm92oiispUXBGCcVv0TNaNLRDvICbsuRUwz/k268La1C83eVTCgTQS86Jt1P60/ox+Lb1f7S2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722112256; c=relaxed/simple;
	bh=JMYAJfnvh5fBjtCAE9lnpRby5Iz4gLoiR7otAicAG7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XWLtwTd1mil6wA1P6tUruKzmlaUR4EbvhLQGaMfVhsXt0sXQmEDheMLZRtwgRHv0rTEXNUpT8+1h2fIa8jv/S+L0OXnVgpb7TUkW3xctQnxtYR22LfCrbsiw6VD1f7nHsqkrdRmLexEusLIe6bhMNaupDsT1s82+0NOWT9V981c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AN5pXvlL; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AN5pXvlL"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0b2af9de57so1653792276.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Jul 2024 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722112254; x=1722717054; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nsba2l+mTog8DKmlCLg5ao+hwsKRjwNNTQ3oaykOYeU=;
        b=AN5pXvlLRuRwkGJ8ZnkhIEEzrhFazra0EcOXiCxHpZrqbuFKBAyT4FgaX7YFSDZLBj
         YzVFVG+niIAnl6zj5ZVtYiQ/3guqBWqlm3OJmLwAPtShuhnG/1dO+AfxkgDl49y0M7bF
         avV1uz55gUUgeLB1sUHqAazYYjI414lu9azj5RXjVn88arvB2/noBQrio43amdWFq1xS
         Hrz1DojZ0b+8n8Uwmn8dk8xi8HqoU+Fh7mrsbovacws5oHr53egCM6F/Sw31VHP+p+wa
         j65EznzWqy9iNRiGzuildY4qLxZXz8QDMtslalXOtvOVxammW30wSgVoZmSUljHlVTuK
         DooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722112254; x=1722717054;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsba2l+mTog8DKmlCLg5ao+hwsKRjwNNTQ3oaykOYeU=;
        b=BichMTLF43fmOV2X00WeN/+pAEQOS/hppgKNl9kCBTDBeByGcnScJc+bd3JkMt+1kG
         xRlwX4mXE3hQbeQXipchurtWjr4JY6Mfs4ohD2plmchmqfCBWu/uP2JF42rvR4UmAISH
         EWBr/hg9wOY6yx1hmDsYG2AUsTglT9t928w30Za6sia3CrnGkjtvzs+IN6YKttq4WKCu
         p7iW5OsFaFQjTyAVz2F5NJ2ChGt3/5eXXhxvILUceTFuwVi6AmSya0WoyxgtDyzgBmZp
         /CYx3U7Bh23Omynn86NaSGP3rXEcDAqtFZZyDc1nh4LyIu7lV2bX9W6bqqxEOX9M1l8Z
         ETxw==
X-Forwarded-Encrypted: i=1; AJvYcCVMiSf4Avk9oPlUya8j305SToPPTdF/R3tARBmv5soJG/MatJjYYCIlDsA531Z1nvvlSIeTaihrYNnqJIFMcTnR+8gVRAx0VAFNNMrlZiY=
X-Gm-Message-State: AOJu0YzZ81pSpeISCNq6QmOMbQ942jv9QndhWHHEEaTdmsGVPrD+oxFK
	GLD1NLW7YFPKSmwTXWfKSq1/UVw1PEuJGCMlEMeYtPJiJDNLQkJZmHEsEP0lMva0QL34P/I8GMr
	mmQZGzNwULV2wjxteCPz98rkr/g==
X-Google-Smtp-Source: AGHT+IHpu7bjRnigEBEh0qhoPcCoGcFLnuGxtsTcc9qvNxSWHxq1NqzBuyWbVE6j5NNmPxREKIAuQuV4TpRKm7sYoyI=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a25:868f:0:b0:e08:6c33:7334 with SMTP
 id 3f1490d57ef6-e0b5454caa4mr86236276.8.1722112253919; Sat, 27 Jul 2024
 13:30:53 -0700 (PDT)
Date: Sat, 27 Jul 2024 20:30:46 +0000
In-Reply-To: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
X-Mailer: b4 0.13.0
Message-ID: <20240727-b4-rbtree-v8-1-951600ada434@google.com>
Subject: [PATCH v8 1/6] rust: kernel: add `drop_contents` to `BoxExt`
From: Matt Gilbride <mattgilbride@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, 
	Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="utf-8"

From: Benno Lossin <benno.lossin@proton.me>

Sometimes (see [1]) it is necessary to drop the value inside of a
`Box<T>`, but retain the allocation. For example to reuse the allocation
in the future.
Introduce a new function `drop_contents` that turns a `Box<T>` into
`Box<MaybeUninit<T>>` by dropping the value.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Link: https://lore.kernel.org/rust-for-linux/20240418-b4-rbtree-v3-5-323e134390ce@google.com/ [1]
---
 rust/kernel/alloc/box_ext.rs | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
index 829cb1c1cf9e..557895db4f48 100644
--- a/rust/kernel/alloc/box_ext.rs
+++ b/rust/kernel/alloc/box_ext.rs
@@ -4,7 +4,7 @@
 
 use super::{AllocError, Flags};
 use alloc::boxed::Box;
-use core::mem::MaybeUninit;
+use core::{mem::MaybeUninit, ptr};
 
 /// Extensions to [`Box`].
 pub trait BoxExt<T>: Sized {
@@ -17,6 +17,20 @@ pub trait BoxExt<T>: Sized {
     ///
     /// The allocation may fail, in which case an error is returned.
     fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError>;
+
+    /// Drops the contents, but keeps the allocation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::flags;
+    ///
+    /// let value = Box::new([0; 32], flags::GFP_KERNEL);
+    /// let value = value.unwrap().drop_contents();
+    /// // Now we can re-use `value`:
+    /// Box::write(value, [1; 32]);
+    /// ```
+    fn drop_contents(self) -> Box<MaybeUninit<T>>;
 }
 
 impl<T> BoxExt<T> for Box<T> {
@@ -53,4 +67,12 @@ fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError> {
         // zero-sized types, we use `NonNull::dangling`.
         Ok(unsafe { Box::from_raw(ptr) })
     }
+
+    fn drop_contents(self) -> Box<MaybeUninit<T>> {
+        let ptr = Box::into_raw(self);
+        // SAFETY: `ptr` is valid, because it came from `Box::into_raw`.
+        unsafe { ptr::drop_in_place(ptr) };
+        // SAFETY: `ptr` is valid, because it came from `Box::into_raw`.
+        unsafe { Box::from_raw(ptr.cast()) }
+    }
 }

-- 
2.46.0.rc1.232.g9752f9e123-goog

