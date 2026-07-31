Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DB331EBA
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 21:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534797; cv=none; b=mWYHDEKwRQrdnEh2l79jE8Tv7jd0BP3CIEFd19yw00d2jcJnznBT5gHS6Jurg6v2cSIpci1ewxJO4ffLS930wyKGGu0oIF43e1DkODuEIxpLqUF8RUmeDcp/ei06YRJ631u57utGLS0zwHUeqcafohyJGGfd/imVjvUVcVYlSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534797; c=relaxed/simple;
	bh=j5vpS8ZEODJmkH/N+ljLcRw6uVdYRS1WWkB7Xvoio/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+jG2al7MFStUDn085Dk0mXx//xhntUnMEiLIvFRPhSKvy4qzbT4/gu4JuJ08a1YRSB8yz4heCI/30hEfwXClmHQ9xsormh16sbfaeeZvwyJqFqnG2O/AqoqJN4WpSCaDtIGNuarnlJNkiRBBXWz6Wn/sroMKOWdjW118QpQuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki4BveLT; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki4BveLT"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81062fdeaf5so36020407b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785534794; x=1786139594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uv3ZuG/t2LPu91C3JVFaNglVqECVmJkRCcb3rg36a4g=;
        b=Ki4BveLTO0C/tOPMyqQffo8wBi+yLqonrhm0CElW5BbcsheZCCyGTRHpWpk2MRJpgo
         BifWyLTml+w5/Z8dvj+WegSGuevMsiD0Usnt5dTANp5VfBv/XTjDgw/62IXxwIB6MRBI
         Dyy8ijtKILDV0913rkPh6v223DixQpL4M7TQwfJJ/nVrwLWOKEnClghg3fqwlBR1OgFL
         Z5kQM+5vQHHmdpOleJMKVm5Df12mVaQG91/LlFsiGhkYFyp9+RK6CAImhzPCbH8MiOs9
         54lU+xoZQ3DnwCvlhlWQjFWY7BVX1n2qWkWz5IMmjV7HC/EcD0QpyUm2wTJ3GFWh3N9p
         dbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534794; x=1786139594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uv3ZuG/t2LPu91C3JVFaNglVqECVmJkRCcb3rg36a4g=;
        b=cj/X7GPfPenXL4QO3i/HeIjNddNZ+TFXdM2S2FcEBwhrj+qxhlXxLjsBMHT1/F3g1g
         TH+wiGQQiCRoWyqFh6ImcYz+tHWXtUhCFnCjjG8dwxYyY9+pbi3IVJWBllU8yJAlPLGA
         2mOavicY+MUBvfN9+MxWoAMLmMMPSCJ0SCvEGoa3nhdnZCSvHh6hjUTrChOj2+VPO7x0
         KqcDAjRrBVP8WhmjZV3dEvLQlkVQVcWpG0kTjzXVehc2FJwnW48XfjPC3QoeXm/iPwsW
         4ufaN90FkbO4dbyc2S95sjX2PDduACvpXbsUOr8nwXgBmv67gG+sSUQgQAABl9AVhi9n
         SKgA==
X-Forwarded-Encrypted: i=1; AHgh+RqfEG/265j6/2HcRacKrfJM+vK8Xp83xz3BEYt9XFY/sX2ln13JzsndfqniiQEVAiA5y1BeiFuhHsK6W6JbWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOzB1wJUR7KFjex9+cR85JNtD8rDTYr/Kvj1bewykiOXKNuGHc
	jtXXx6GMW7JMkT2HSTdWM916Rsf/TiptnY1kQ0Yaw6ZN90XPO4c1uJ48
X-Gm-Gg: AR+sD123n3TK+L9VwK0I5xa5+pQfmr+QEk7zRpw/xDuYtwz5giz4RGBmh6D2jBiJV6P
	NMZYOePfjqX/ofFAewxdOoU42UTlhLq6TkAtUoIQgMNuCbA+29Y9PZQYbNAdzQjNQkCoxJ2PTL1
	GCX8KYQ2OdgDorztjtC4mOlEcCZekd3E+5Yx41dKMw4EESUpviIpJZNMqIGFlmGpZmuVpfbAYph
	rPtNDgnR6QNwQdBQ1KVA/Kumb5qZ6XlekUU3cH/LWe6rNr73K0u8yMO3L2m8GN4G0L1fq7dOwG1
	Jh2KVO9R7W0O8HKyL5IDhIY8GSlGj73k+koAeGxOzLEFmqW2ezi67/J9cb8n9eqDy5+EZMa+zH5
	8AYHAYCaxZ2ZsyzXn2qmHg3yoEn//6GLsP6h+XfjAOpg+63uJEqZMbAMQjmM1ncdRLQIENTvc3/
	hV4HV98gdwhLOl0MLK+1IJYlvPBKbYzQmbV9mDWhr3IgAzfSE+ZlxzhyNFAhQGao/Cx72c2nbA5
	4Pe18CVJD15HRSA4JJ60D+Qa6hcqf0co6wNaGlgdTbRQtR4Jw0zFOum+vz9UJZs
X-Received: by 2002:a05:690c:698b:b0:7dc:3d2b:2e94 with SMTP id 00721157ae682-81fcbc4bc89mr33794727b3.13.1785534793695;
        Fri, 31 Jul 2026 14:53:13 -0700 (PDT)
Received: from pop-os.tail4f8d5c.ts.net ([2800:810:473:6eb:bc9d:6ed6:1f62:1459])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf610a0sm14439107b3.14.2026.07.31.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:53:13 -0700 (PDT)
From: Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Boqun Feng <boqun@kernel.org>,
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>
Subject: [PATCH v3] rust: rbtree: document peek_next() on the immutable cursor
Date: Fri, 31 Jul 2026 18:51:56 -0300
Message-ID: <20260731215157.2801197-1-juanpatriciomarchetto@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The immutable Cursor has a single example, covering cursor_front() and
current(). Its peek_next() has none: the only worked example of peeking
belongs to CursorMut.

That leaves the most common reason to hold an immutable cursor
undocumented. cursor_lower_bound() stops on an exact match, so a caller
looking for the first key strictly greater than the one it supplied has
to peek past it. When the key was absent the cursor already holds the
answer, and peeking there returns its successor instead, skipping an
element.

Document both branches, and the case where the looked-up key is the
largest in the tree and has no successor.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>
---

Notes:
    v3:
     - Move the example from the Cursor type documentation onto
       Cursor::peek_next(), adding an "# Examples" heading and adapting
       the intro sentence to the new context (Gary Guo).
     - Reformat the doctest import to the kernel vertical import style
       (Sashiko review of v2).
     - Verified with rust_doctests_kernel under ARCH=um: 321/321.
    
    v2: v1 documented only the exact-match branch, so the idiom as written
    skipped an element whenever the looked-up key was absent. The example now
    covers both branches and uses a four-element tree so the skipped element
    is visible. Reported by the Sashiko review of v1.
    
    v2: https://lore.kernel.org/r/20260729023420.1323906-1-juanpatriciomarchetto@gmail.com
    v1: https://lore.kernel.org/r/20260729014344.1244809-1-juanpatriciomarchetto@gmail.com

 rust/kernel/rbtree.rs | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 6fbd579d4a4..42f946a9bd0 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -856,6 +856,47 @@ pub fn peek_prev(&self) -> Option<(&K, &V)> {
     }
 
     /// Access the next node without moving the cursor.
+    ///
+    /// # Examples
+    ///
+    /// Peeking completes a lookup for the first key strictly greater than a given
+    /// one. [`RBTree::cursor_lower_bound`] stops on an exact match, so the peek is
+    /// needed only when the key was present: when it was absent the cursor already
+    /// holds the answer, and peeking there skips an element instead.
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::flags,
+    ///     rbtree::RBTree, //
+    /// };
+    ///
+    /// // Create a new tree.
+    /// let mut tree = RBTree::new();
+    ///
+    /// // Insert four elements.
+    /// tree.try_create_and_insert(10, 100, flags::GFP_KERNEL)?;
+    /// tree.try_create_and_insert(20, 200, flags::GFP_KERNEL)?;
+    /// tree.try_create_and_insert(30, 300, flags::GFP_KERNEL)?;
+    /// tree.try_create_and_insert(40, 400, flags::GFP_KERNEL)?;
+    ///
+    /// // 20 is present, so the cursor stops on the key the caller already has and the
+    /// // successor is one peek away.
+    /// let cursor = tree.cursor_lower_bound(&20).unwrap();
+    /// assert_eq!(cursor.current(), (&20, &200));
+    /// assert_eq!(cursor.peek_next().unwrap(), (&30, &300));
+    ///
+    /// // 25 is absent, so the cursor already sits on the answer. Peeking from here
+    /// // returns 40 and skips 30.
+    /// let cursor = tree.cursor_lower_bound(&25).unwrap();
+    /// assert_eq!(cursor.current(), (&30, &300));
+    /// assert_eq!(cursor.peek_next().unwrap(), (&40, &400));
+    ///
+    /// // The largest key has no successor.
+    /// let cursor = tree.cursor_lower_bound(&40).unwrap();
+    /// assert!(cursor.peek_next().is_none());
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
     pub fn peek_next(&self) -> Option<(&K, &V)> {
         self.peek(Direction::Next)
     }

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

