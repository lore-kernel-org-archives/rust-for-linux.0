Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAA3FB14
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707148207; cv=none; b=V+UWnA1aHEr3qz5WBaFmR+C7F0uIL+vwdsHQsnQPvfwpQj8Ra2Qv/Olo75QGEo1ImRWm2D+0sXjxJRYcG7K+YTDUsVs0RAqaI3jNuqcB1hKSRoas5JtjcI+lKCpzkXf4IhrHlEt5yFoik1l5JorarUWP43VnwR1vpCYArL4GZ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707148207; c=relaxed/simple;
	bh=FR4T3Qjs2jKRsHMGwYv7pMd/5Tm8HyvFjH7AWhAgulg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ghvxp0Iw7Mg4IgANumEzAXVT+XapnS/4YxMaixQcS3/psj/Y2hkiwoZgCwNhEHmMCNQTD9/SUidmuol72EmJJ7faKcAZFeKMIteKcEeOR/UHZsyPUb5vTw8yofY7WwseHTpRrnE5gRjbffGy6eQcOHC73TDV8ueDRVSnKS6y5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wPZ8etjv; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mattgilbride.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wPZ8etjv"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6cd00633dso6318233276.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 07:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707148205; x=1707753005; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KixoytXQDGjoXAfvxRuyy14dtLsh1IkvCMs1kLMTxgU=;
        b=wPZ8etjvu/a0We6zybD5oAoPX7szcBceYVUEtMiWa3ZZrix76d58rDCkj7FojQPqdH
         ZmXPORLgWNqQWFWzdBV107HrPBpy1c6A1q5DQ1u9JNkVQwCuQlpScUulMKP6VyCuleJ0
         6dHcmeSwZEVGPfGT1D7jS+IB6RZrt6f2h2cLrGku+leR467FVVGe3vT213AA6N5XcWS0
         pa8RGs4idtdY2QEOyZyWoZilowaWZL+zqoh0ulBe0R8jHu1HKxVCoH2NOEQvKFHhkPDw
         aAPL5DKsWpmAz2R3dU4gHLZrV25PVdlMnaztzFDVtmXUN4/Ns7TRSNikrsJ0LIWWPr90
         3TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148205; x=1707753005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KixoytXQDGjoXAfvxRuyy14dtLsh1IkvCMs1kLMTxgU=;
        b=hVvN53y5giVtIyChQolJnsaRsGa9c00U7FXg8ZNCof96+zn7B9wSmWRmqnARVf8QJI
         Du82OqZbDyN0Gr0xeqjvMWEpVq9vB7ed7ODTwW4UlE+DLMlxOJLtSrr19rfTPPjFyK9D
         w/adIlY+r7iZrSvaz3S0u8kyY8curWX2ZruZchZNzrJQlKAuFO6DX+aZo3sXqiIZKR8I
         6myeDDkqn7VtoOlUWljedNPbgNV9y7ZmBBQYZxZHVvhfcIV1CeiSSSvaOJp9GrbRe2aV
         Z2TA+key5/lElTc9F5YSfikJOreSjEwD6lDSfx5nidve9QnJz4hHt+gkSQkNhDQnZoZ+
         /PBQ==
X-Gm-Message-State: AOJu0YyERjgo1QWanZfonZy1lOfYfegxlCIQO9rW0AY0xd2rku1IYiRQ
	7p1tbwVFmzU9exO5Nsc6W3K1S3dZQ9Oryav9WreOY5G80ja++hW0+IKackzU7pBTMnTTsswrX2W
	ziAgPhDS7ixoUrUZEH6hekguTTw==
X-Google-Smtp-Source: AGHT+IEU6z6eWwsI2wrzuaRC8jm+CHnZ6wBunkVHRxWVayHsmL35Oo/zIT20NC39+nbywkp3VaDfFSfpxPdFXrAwlcw=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a05:6902:138f:b0:dc6:dd74:de68 with
 SMTP id x15-20020a056902138f00b00dc6dd74de68mr440165ybu.12.1707148205361;
 Mon, 05 Feb 2024 07:50:05 -0800 (PST)
Date: Mon, 05 Feb 2024 15:50:01 +0000
In-Reply-To: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com>
X-Mailer: b4 0.12.3
Message-ID: <20240205-b4-rbtree-v1-1-995e3eee38c0@google.com>
Subject: [PATCH 1/6] rust: add `container_of!` macro
From: mattgilbride@google.com
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

From: Wedson Almeida Filho <wedsonaf@gmail.com>

This macro is used to obtain a pointer to an entire struct
when given a pointer to a field in that struct.

Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Matt Gilbride <mattgilbride@google.com>
---
 rust/kernel/lib.rs | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7ac39874aeac..c7963efd1318 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -102,3 +102,35 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
     // SAFETY: FFI call.
     unsafe { bindings::BUG() };
 }
+
+/// Produces a pointer to an object from a pointer to one of its fields.
+///
+/// # Safety
+///
+/// The pointer passed to this macro, and the pointer returned by this macro, must both be in
+/// bounds of the same allocation.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::container_of;
+/// struct Test {
+///     a: u64,
+///     b: u32,
+/// }
+///
+/// let test = Test { a: 10, b: 20 };
+/// let b_ptr = &test.b;
+/// // SAFETY: The pointer points at the `b` field of a `Test`, so the resulting pointer will be
+/// // in-bounds of the same allocation as `b_ptr`.
+/// let test_alias = unsafe { container_of!(b_ptr, Test, b) };
+/// assert!(core::ptr::eq(&test, test_alias));
+/// ```
+#[macro_export]
+macro_rules! container_of {
+    ($ptr:expr, $type:ty, $($f:tt)*) => {{
+        let ptr = $ptr as *const _ as *const u8;
+        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
+        ptr.sub(offset) as *const $type
+    }}
+}

-- 
2.43.0.594.gd9cf4e227d-goog

