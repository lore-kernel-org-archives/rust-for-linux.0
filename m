Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89613A256
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Aug 2024 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723841287; cv=none; b=axEwFwtSHN/OEjTvJHw559Y3TauBjLZqy/9AhBaEs7szYaxYSHr9O3YB7vCMhwdlnwGvsvWkQMkIEJUNku0RDw9i7DBlNsJbJO8CpsPJ62UjznODpzyvsDiQKmBo1XlzcPa0EApZiLdsWH5Ya7uWScEOBZp1juMd78FugXkFxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723841287; c=relaxed/simple;
	bh=BI8PHNJTfXcLO+UUAm58BuWx0Vjek3ATKPy+xwLajGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BfC0pWel8iHvMqj7cckT6SJmtQqACgM+WpJYAoUJzR7nN0boeYFMumEermMeMDiDHpOPSjlNw3xJfKS7yF561wy5jbxzw+EW9bFlyxkXh8XBYiPbY8qZ7FGBKGhpkHdVkugAa4V+3Utm6i6S+3ubdCtwVTdqtIedRvicu6XkSpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=car5xSHF; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="car5xSHF"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e1159fb161fso3517514276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Aug 2024 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723841284; x=1724446084; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UpT8wOwNJORmlebbf/8Uat6NCTU+oJ243lKTzUmD5Y=;
        b=car5xSHFH3i0Cq7jF+LWSeABplesvyugBes6LyAKkfoRBX8TS0UGHRdTDTA/f41dil
         +6auscWedm984lycttAQaMZVGgpyVmTEReicovmu+R6dIlLwVavp8pwloSle66fn+Vlz
         aMyrPURvIPKpGk3qsPqs3kNkrd0Uwd1EucsSplDTkWZ+I8x8JjK7e5dvpnkZG6qgNqd5
         3YvCqf19v9K/u5RzHw5brXurXc2trRkyvZFKUxjswmzCji6eZoT3/z7NYEQ7k/rqKPya
         xqZZuiEt42Jx4Vx0mbPHBGGYkZbk9gRU56s4d3ZUXz8zgkLkXKDA8eeQefRD7Ffbm72d
         Ybvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723841284; x=1724446084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UpT8wOwNJORmlebbf/8Uat6NCTU+oJ243lKTzUmD5Y=;
        b=No8rSr8yyZjS9TyngqZFSNvhAPp3WaCpv6Ay61HuZGhIQxb2s2beBgrsTaziEbiNvV
         hA+/3bq1bMV+FQnWKHD0UxBOn1G18w57Uyby0l24atJgAY3wqnKRPBJpQL2URtWj5doB
         yk55KJmGxCWgVQmX0Ngqz9v/wgWIytQ17GWkG//5RZjiTIK/F1/IEJwwsEWhku7ctBym
         2xG45/krC28ky36UReK7nrI7oS0+CXZESe9NMBHNoHmyjOczh5KewXFwVOf/AX8PHr2I
         lY380ZuQyyYvXenas5JDSGNMAPkacBj3ne3F2NYEGRTeLmYdM/MUQnM8JNuvMMU62Gov
         g5uw==
X-Forwarded-Encrypted: i=1; AJvYcCVFe9VQr9qHMtUyX/HjtmnFJKlt0ad2901SiEvashTA8i0xe5joktKSm0xjBbec0I9l30cLElXu4wN9oITApg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyluP3BHRGvoF46nvUOziPDi41QilFY59GYBOnhToc6hzs8xgv
	yYz3U3XHyJGHmy7c/8AanMI/OV7wrPAWaEBr+f471ogGSYFZBKfm6lLb3n5jXcehVFUkTtfXeoQ
	k1toFG6Yq4Auw7o3CU1l0Y4XiGw==
X-Google-Smtp-Source: AGHT+IELGeBoRm8VfWBBL2EoMJHsshIWLt/5bDCdxr1SXybvD7gnLyzHvlUcyMT2Y8qs0F5lik0YliPldIynDvQbPT0=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a25:910e:0:b0:e03:59e2:e82 with SMTP
 id 3f1490d57ef6-e1180fb2b4dmr6070276.10.1723841283714; Fri, 16 Aug 2024
 13:48:03 -0700 (PDT)
Date: Fri, 16 Aug 2024 20:47:58 +0000
In-Reply-To: <20240816-b4-rbtree-v9-0-425b442af7e5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240816-b4-rbtree-v9-0-425b442af7e5@google.com>
X-Mailer: b4 0.13.0
Message-ID: <20240816-b4-rbtree-v9-1-425b442af7e5@google.com>
Subject: [PATCH v9 1/6] rust: kernel: add `drop_contents` to `BoxExt`
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
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/box_ext.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
index 829cb1c1cf9e..6cf79f96d6c7 100644
--- a/rust/kernel/alloc/box_ext.rs
+++ b/rust/kernel/alloc/box_ext.rs
@@ -5,6 +5,8 @@
 use super::{AllocError, Flags};
 use alloc::boxed::Box;
 use core::mem::MaybeUninit;
+use core::ptr;
+use core::result::Result;
 
 /// Extensions to [`Box`].
 pub trait BoxExt<T>: Sized {
@@ -17,6 +19,18 @@ pub trait BoxExt<T>: Sized {
     ///
     /// The allocation may fail, in which case an error is returned.
     fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError>;
+
+    /// Drops the contents, but keeps the allocation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let value = Box::new([0; 32], flags::GFP_KERNEL)
+    /// let value = value.drop_contents();
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
2.46.0.184.g6999bdac58-goog

