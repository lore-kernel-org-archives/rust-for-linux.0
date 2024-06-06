Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF919939C
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717685424; cv=none; b=gZd7qf2lpP5aOEDF9bfjYd76sx6C2FwEf3JZ9LV3r5RjIl4h423lutu7maveWpDCLMyOtaf1kyI2JWU2p404RlGqIQ+DLlcg5PVUmiYURVma6BY4Q4mvu1oL8VFKu6OnYCUNUpHJZoqR83ncB/l02eCEV7o91Oi2+ruMBuPINys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717685424; c=relaxed/simple;
	bh=6KVODQnYtWNQoMLw85R2yUtqc1xp53xILtMXwocmZ5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jtIdMbc0cQIDqdolQTTcPpFhQRXIzjDLvjU87A1u0eCf+N0sUbyENT0aDAansMWk8nllYbQa2YqdDU/tEwXregHiPG/GPOJRE2mx1i1axrBI5f/45bCm4NY/HKVKcZpDDgSRWtAI7PeXTeAl8dl+udwuQxueGokqxPGwgFC10UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V8tpqz01; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V8tpqz01"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfa78a1b142so1853582276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717685421; x=1718290221; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D83xpw4zc0nTnhAHOcVsYRJWLRnvj7gUU4+SqE71h3c=;
        b=V8tpqz01VBw1o6lsZL/rw9ymWya02o6z2r6MtsgVpvnn3oTJq1j3p1Y0lfHud8BzT3
         xxxKLeyat7GpL/eyLA+KpwQRXMW62OLYneRX5LWghnRU638TaLjKyvETDtOAde5prLHM
         q9XcxkvYL4ca48RY9HTpz2RFKtJcWKwIzMf9C9JiE4CkU0Um2mNTuiikYyJiSOZZ2nG0
         alUiF+hdZ40oBWcwmK3m/xGWdHW+PL0jBkqv5Wonpmi4N/wNB0juq6l575LD3wQ6qGgd
         LDntH9q6NV1o30fnb7OMDbf4Bihkagt3w58/yqLzAgPcvENOJbX0oY2PbLyEtG70W0m8
         E4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717685421; x=1718290221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D83xpw4zc0nTnhAHOcVsYRJWLRnvj7gUU4+SqE71h3c=;
        b=fTUttI+RLFlu+AK5/BAVZCN6Llv7eESXQ1NHZxIlb5hA6k/1fYHoO7OtlK4guWPpsd
         tfkct188aFYP1Ss9RpUCnb60CSLW3kuPJitp9OhSbiuFLYeJrEjTQCOh/ll7a9xQXBN+
         tucdFUIfkm35cttvmq81ZFJrKVUW2KYEuTxJLIlbqjxvr+EfB+osM9zQ8JPJ7rswkDnv
         XR2MAcM2PTjOU4USjLXsw4tS8WQh3oHf7aXAQFFK8CcjgECp4Zi/cgScelSMJrLE98oc
         jaaNOarXZfl+5iOXkaYwnaOn2OJkQV9CP5m4u4C85gY7AM856rWOSY4p7KDIphPL5QhT
         kEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Cz90cQzbjqbWMBMQjFnF7ZepiTizamhv2vZ7roYEl11FXs84BKfVgF+ML9xUPlUC5aywbfjEYvWHeNX5N7b2Dl0nxtZzHCmROwWlwn0=
X-Gm-Message-State: AOJu0YwBXghtcSHYLivxxqFkxa0XqkjTtQw5MTgEzEj/q22yrEIOt3p+
	Kc6Fia8d7hYjAt8EG+O5priWL55HmELLlB9dNbFE3TgqRK9I2Mg0Iqi4ZB4syCfPMdaMYzz4hSQ
	p6gyE6K39VCJ4ukGCmI0R1XayLw==
X-Google-Smtp-Source: AGHT+IGw3wLc7XnxXpEgcjIpc9GAoF7EZlm4CA11KQkZmy3hezSnaWe5GPHz2Zn7qS7Ou2teHPex30H7A4lXSUxWEmE=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:6902:18d4:b0:dfa:56fa:bb52 with
 SMTP id 3f1490d57ef6-dfaca7df41cmr347156276.0.1717685421503; Thu, 06 Jun 2024
 07:50:21 -0700 (PDT)
Date: Thu, 06 Jun 2024 14:50:04 +0000
In-Reply-To: <20240606-b4-rbtree-v5-0-96fe1a0e97c0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240606-b4-rbtree-v5-0-96fe1a0e97c0@google.com>
X-Mailer: b4 0.12.4
Message-ID: <20240606-b4-rbtree-v5-1-96fe1a0e97c0@google.com>
Subject: [PATCH v5 1/6] rust: kernel: add `drop_contents` to `BoxExt`
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
2.45.1.467.gbab1589fc0-goog

