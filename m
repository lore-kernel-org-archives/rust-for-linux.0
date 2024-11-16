Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D701953B0
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731786762; cv=none; b=qIlkE8nLYPnc5IazdSlEoi80Bxh9HUsv/FCdSWYCZr6r4/DKWG2qwdMiJK+lQrV323H4i60LDuDzVYpvlKcQzGSsAVxkKO2CRGtUL7v2v3B+TCza1qB+Vu4qee/ZTdtR3uPXBsKe+QnqyS1JrbJPWBmX+sA/Krkk5I6yrSMlx/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731786762; c=relaxed/simple;
	bh=aSg1sT2DdVXcoiJEN9ITY94if0PR9BvNxMcJUvH0fT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUfzLhZV+YQ5BcAwiyem5gadsbcEjkdKylkhMh+zzNx2bPIZrk5HYalvX+QPcer7nPINCXtCAq0MJLh+bezX2Fy9HNJeC2L40iowhI2cau/xA76diznaX/6KKYxD91fLQvxXeKpxkkvx8eiZWdocr46gRV/n3iJlqr8EgH3xM20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=bH6IKhuX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="bH6IKhuX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431695fa98bso23581255e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 11:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731786759; x=1732391559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ip5pQscRbbdQVewQRGx05s1AlqAOiXm83mKhGdPSZss=;
        b=bH6IKhuXjmYoKsS9lVrbjzJCJ6prG1yNW3qjd2Ch5vEMRh9CWVvbofP47PTlJ6Cftk
         p9bDvEgIXyuoWNNjtDo3KMnD1vIjA1Ye+6E8AJxdIxqTlnakn6+SU1pCf8/rRpULhl6l
         JHhMws/Ho9plS5qQdT1NfWW2zw5TKL0oxG3+WXjpVV1ndMMBOwbyu1fUCWBNM2BvWH8e
         +UQG2xEi28yLG7alBJnKXQ6Pa3EjqoUA2GAJPngA2A8kwcY2jpZG8Xcq+YR6PBv8nGQv
         AYWav3gXnK7LYW8437hq4dTUKIN0JY+XzQ46mOBeyuQa5OIW3j8eMXSUplAe4hoch9Jy
         rDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731786759; x=1732391559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip5pQscRbbdQVewQRGx05s1AlqAOiXm83mKhGdPSZss=;
        b=FiYVpXTNM3/HyvDxwltOt2SfNobKQoMyJaWnB8G3bjuQ2s7gORhS7/TCWAN0MYTMxG
         +raO2sTmQ+z/EXmruxhQLECCMQElRZj2dGKzGBh2zRBpvetqVNWdUJQb61Jv+ej9iR3o
         7cHauTzazHRQKunkJoodVHX1KI/vrS7p+b6jFXv/eDgJHThXIybeRxQ9N+ePXL3zo68C
         dQoMuOpWsUL7g0ySOYvOCRSJ4nvawX9qULxOY14W+QzJvSPPrEzJmeLLvk2UOKc69V6+
         5/H5MOCHiGcmMLWGYNjVV1q24yxoW5k0Mc4CJFanFVqUwGyVN4Sye9RAccNuaWKXjgZc
         Y7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUoLB5gY+m2B4Qlx48ko0Bk/IP4PVl6nMid9cl0Xa/A1Q0dq3yYvvrrx7vpdGFYtHG4zkabM9elULn+MWHGdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoERP0JpfuFk8dUmJQvK3DOLmnkbPYXqOwvIlaE8SWLb8ftno/
	d7/2FiN2cIzqZht/5xkXTa8ZAsqOcKzCTZafedIm7imvhUIQf2IqpGHlITSp0kI=
X-Google-Smtp-Source: AGHT+IF3l8CNuJFRLLnYmXo45yg15BgX7s6cSiY8UBYJDcLP3+wBpXUM3GHvOGepJu9/6HCQJwI86Q==
X-Received: by 2002:a05:600c:4f10:b0:431:5c1c:71b6 with SMTP id 5b1f17b1804b1-432df74c8f1mr70941445e9.17.1731786759038;
        Sat, 16 Nov 2024 11:52:39 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27fcb4sm102846905e9.23.2024.11.16.11.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 11:52:37 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH 2/2] rust: kernel: rbtree: replace unwraps with functional programming paradigms
Date: Sat, 16 Nov 2024 20:46:18 +0100
Message-ID: <20241116195221.373332-3-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241116195221.373332-1-daniel@sedlak.dev>
References: <20241116195221.373332-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/rbtree.rs | 78 ++++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 38 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index cb4415a12258..3b1436ab0ac3 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -36,17 +36,17 @@
 ///
 /// // Check the nodes we just inserted.
 /// {
-///     assert_eq!(tree.get(&10).unwrap(), &100);
-///     assert_eq!(tree.get(&20).unwrap(), &200);
-///     assert_eq!(tree.get(&30).unwrap(), &300);
+///     assert_eq!(tree.get(&10), Some(&100));
+///     assert_eq!(tree.get(&20), Some(&200));
+///     assert_eq!(tree.get(&30), Some(&300));
 /// }
 ///
 /// // Iterate over the nodes we just inserted.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -61,21 +61,23 @@
 /// // Check that the tree reflects the replacement.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &1000));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &1000)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
 /// // Change the value of one of the elements.
-/// *tree.get_mut(&30).unwrap() = 3000;
+/// if let Some(element) = tree.get_mut(&30) {
+///     *element = 3000;
+/// }
 ///
 /// // Check that the tree reflects the update.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &1000));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &3000));
+///     assert_eq!(iter.next(), Some((&10, &1000)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &3000)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -85,8 +87,8 @@
 /// // Check that the tree reflects the removal.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &3000));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &3000)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -128,20 +130,20 @@
 /// // Check the nodes we just inserted.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
 /// // Remove a node, getting back ownership of it.
-/// let existing = tree.remove(&30).unwrap();
+/// let existing = tree.remove(&30);
 ///
 /// // Check that the tree reflects the removal.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -155,9 +157,9 @@
 /// // Check that the tree reflect the new insertion.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&15, &150));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&15, &150)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -677,7 +679,7 @@ fn drop(&mut self) {
 /// Nodes adjacent to the current node can also be removed.
 ///
 /// ```
-/// use kernel::{alloc::flags, rbtree::RBTree};
+/// use kernel::{alloc::flags, rbtree::{RBTree, RBTreeNode, Cursor}};
 ///
 /// // Create a new tree.
 /// let mut tree = RBTree::new();
@@ -688,31 +690,31 @@ fn drop(&mut self) {
 /// tree.try_create_and_insert(30, 300, flags::GFP_KERNEL)?;
 ///
 /// // Get a cursor to the first element.
-/// let mut cursor = tree.cursor_front().unwrap();
-/// let mut current = cursor.current();
-/// assert_eq!(current, (&10, &100));
+/// let mut cursor = tree.cursor_front();
+/// let mut current = cursor.as_ref().map(Cursor::current);
+/// assert_eq!(current, Some((&10, &100)));
 ///
 /// // Calling `remove_prev` from the first element returns [`None`].
-/// assert!(cursor.remove_prev().is_none());
+/// assert!(cursor.as_mut().map(Cursor::remove_prev).flatten().is_none());
 ///
 /// // Get a cursor to the last element.
-/// cursor = tree.cursor_back().unwrap();
-/// current = cursor.current();
-/// assert_eq!(current, (&30, &300));
+/// cursor = tree.cursor_back();
+/// current = cursor.as_ref().map(Cursor::current);
+/// assert_eq!(current, Some((&30, &300)));
 ///
 /// // Calling `remove_prev` removes and returns the middle element.
-/// assert_eq!(cursor.remove_prev().unwrap().to_key_value(), (20, 200));
+/// assert_eq!(cursor.as_mut().map(Cursor::remove_prev).flatten().map(RBTreeNode::to_key_value), Some((20, 200)));
 ///
 /// // Calling `remove_next` from the last element returns [`None`].
-/// assert!(cursor.remove_next().is_none());
+/// assert!(cursor.as_mut().map(Cursor::remove_next).flatten().is_none());
 ///
 /// // Move to the first element
-/// cursor = cursor.move_prev().unwrap();
-/// current = cursor.current();
-/// assert_eq!(current, (&10, &100));
+/// cursor = cursor.map(Cursor::move_prev).flatten();
+/// current = cursor.as_ref().map(Cursor::current);
+/// assert_eq!(current, Some((&10, &100)));
 ///
 /// // Calling `remove_next` removes and returns the last element.
-/// assert_eq!(cursor.remove_next().unwrap().to_key_value(), (30, 300));
+/// assert_eq!(cursor.as_mut().map(Cursor::remove_next).flatten().map(RBTreeNode::to_key_value), Some((30, 300)));
 ///
 /// # Ok::<(), Error>(())
 ///
-- 
2.47.0

