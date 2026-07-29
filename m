Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD8A2853FD
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Jul 2026 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292473; cv=none; b=GJcqNf6yc6k39WOTf8mxZvwhYBPOeNizeSZtewKm38nmonpfucwG1gdXlkw5zNqGb1p1mSoVvU4wWTLYmiHj68A/i3wrmucHEfr9X88CzVUIoqLJ8ct2TJ01MgF9zBsl9209YM3XUbgyBIOIlg1qNxdod9Q3RSRMHvoKsmc+X9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292473; c=relaxed/simple;
	bh=/Q5echcs87wy5N8RHfDyZZ+0hVIvuqNt0jLKhKmhOyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7eWMnqBU7jCevfMSUStemMZ4RQhCOnD6l5ZEm+Yp+JM/4tigFX8GJXYkUg9HfKt4IUNCncouEM/b0wherBRDqj7IEADBWk+jqS1RHYcXZEZNkHPXAlDenig4Rka8eoz5P0d3McN/CEFYHClqr9ePkHq50p6+QKL3gAVwlTdekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDy8Kr8Y; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDy8Kr8Y"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb973e6749so482209a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 19:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785292471; x=1785897271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hu55ATVdvTnEPZwxrNu1KzdPadDnHGU4s3Uhcf1SLcg=;
        b=oDy8Kr8Y1SbjW/ysQoqJOfsT3eRerauw9y0ywsCHTj5YmD8HgbTkKIixqBNsYx8H1J
         wZQ+k0o6/8aEARdGBqPJyLgK8shenyGD+CXcdNXDkcRtU7RYFmoCMvT5zXmCF+wHxaj2
         qHzMhB7BLKfuD/15atGS/u5hIB7xv+yuzQAhK26Z+7GOuVvbS0Nyd9j7RHGAGFNyv4Bf
         r3hCLlK5bfPna1gv4Sn32ue+IHnn7U7n1BGiezd4xH8lqi78P7k4U5WTh1O4lGt58wsX
         3EI+h/QnJqbADeC93dRnIaihbaMwWY0kUNQpyIgIG5XSHOTyNocOUi6Tf9S7r+2UHV4n
         K5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292471; x=1785897271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hu55ATVdvTnEPZwxrNu1KzdPadDnHGU4s3Uhcf1SLcg=;
        b=XQpMeDmZifsnEzjO5MdjIF/lmUxIBINze+V3BvxD7Q8YvyXK+o3GYfOd4JSRESJc+L
         GMQ8Sw+yuqw6AaA26dl0Jcn1EKnCv5bW+RDTMeHancwm+I+4g/1K2t6q5KsKe0KnRHHW
         cppeEa8aIw1MFHm320zkAgs8fTc58gvsTQqE3LG3Gh5bmxBxzC8gVd49aWgTQQYJvAKQ
         Sx4TFXCxw51ELAqGmezOwO8DhoWS2yAKr4MCYVrg3FyonYT91XyQGypTXNM1A0bVxKZV
         7DXVMNtjDaFJbE7kRB+BNAJnC1dIfPQCrmqlOlhDQAHKKUtQgDh4nKOow1mfCdxm2Jos
         k8eA==
X-Forwarded-Encrypted: i=1; AHgh+RpXsopnaDuUyH9+QPLSV6DqP6wS2uCznmJ4CJ/+Dsxo3fl/eVVmS0vNF5YRZ6tTAf4bls7i61JaWS5q7jeQoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgC7bk0oE14gOFlv4g92ZQmvwn6hVWJAZFAPhiirE75bjYeq1w
	+OOWTJwzw3iv1Cjlxequ1saUr3AL5oHo6gJci5hAt52wMQBG2WdAxivNtRcw3MDx
X-Gm-Gg: AR+sD11hmtPq5cIeTplb9AzPN4Qlb7ou3y2pVggVb3eCCdTGjhUvPYJxaKfWXAvkewc
	eu5bHv8Ayuz/mFr0sZatwxaKyDYM9m28MSodnBCYLEhhkV+y7XQCjSD7Yr1O91EZEyU80+QIOcs
	FVSlN8EvYCODD4+PI/jlePzlO1nMB4HDdjnLlX7HPEkVRKC8etpaDblPJWR8+jveLzBIb5zrB4V
	FV3YL3lY7RdkeV226RS+We3GkcytplHkhADkMz0rFev/zmeEMqgokpF31zNJmO/24QOs3ey19jr
	HJxzfKHuWrfayN9NmDroUKF1dFL7xkg4MdrVEFBUGLLVHPmJz+0ZLOJQgdRQfeiPsOGRUQRj0AH
	EE9HyaRN4NLttZwT1L3/umKktEN1z7ZPdF4nVwc1gxxiy0sYwatSqYSHR4w9e7c07Hb5DhGZTnb
	O5JN4na9npQ3m/uP2PVofZFD6ibg7yKFrs4+p453mLCw1FPMlabo5XVhPbnWTbhAr4KPlfUNoau
	r+jCvTJlUoljm3yckRonJ5+kDKHvIotfEN44nyo7lUohSegMdWE
X-Received: by 2002:a05:6a20:4e92:b0:3c3:8440:f6da with SMTP id adf61e73a8af0-3c8ac242b76mr6100376637.29.1785292470746;
        Tue, 28 Jul 2026 19:34:30 -0700 (PDT)
Received: from pop-os.tail4f8d5c.ts.net ([2800:810:473:6eb:dbba:a18d:8690:2c5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3250asm3657671eec.20.2026.07.28.19.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:34:30 -0700 (PDT)
From: Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
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
Subject: [PATCH v2] rust: rbtree: document peek_next() on the immutable cursor
Date: Tue, 28 Jul 2026 23:34:20 -0300
Message-ID: <20260729023420.1323906-1-juanpatriciomarchetto@gmail.com>
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
    v2: v1 documented only the exact-match branch, so the idiom as written
    skipped an element whenever the looked-up key was absent. The example now
    covers both branches and uses a four-element tree so the skipped element
    is visible. Reported by the Sashiko review of v1.
    
    Verified with rust_doctests_kernel under ARCH=um: 321/321.
    
    v1:
    https://lore.kernel.org/r/20260729014344.1244809-1-juanpatriciomarchetto@gmail.com

 rust/kernel/rbtree.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 6fbd579d4a4..ea8df886df8 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -811,6 +811,42 @@ pub struct CursorMut<'a, K, V> {
 ///
 /// # Ok::<(), Error>(())
 /// ```
+///
+/// [`Cursor::peek_next`] completes a lookup for the first key strictly greater than a
+/// given one. [`RBTree::cursor_lower_bound`] stops on an exact match, so the peek is
+/// needed only when the key was present: when it was absent the cursor already holds
+/// the answer, and peeking there skips an element instead.
+///
+/// ```
+/// use kernel::{alloc::flags, rbtree::RBTree};
+///
+/// // Create a new tree.
+/// let mut tree = RBTree::new();
+///
+/// // Insert four elements.
+/// tree.try_create_and_insert(10, 100, flags::GFP_KERNEL)?;
+/// tree.try_create_and_insert(20, 200, flags::GFP_KERNEL)?;
+/// tree.try_create_and_insert(30, 300, flags::GFP_KERNEL)?;
+/// tree.try_create_and_insert(40, 400, flags::GFP_KERNEL)?;
+///
+/// // 20 is present, so the cursor stops on the key the caller already has and the
+/// // successor is one peek away.
+/// let cursor = tree.cursor_lower_bound(&20).unwrap();
+/// assert_eq!(cursor.current(), (&20, &200));
+/// assert_eq!(cursor.peek_next().unwrap(), (&30, &300));
+///
+/// // 25 is absent, so the cursor already sits on the answer. Peeking from here
+/// // returns 40 and skips 30.
+/// let cursor = tree.cursor_lower_bound(&25).unwrap();
+/// assert_eq!(cursor.current(), (&30, &300));
+/// assert_eq!(cursor.peek_next().unwrap(), (&40, &400));
+///
+/// // The largest key has no successor.
+/// let cursor = tree.cursor_lower_bound(&40).unwrap();
+/// assert!(cursor.peek_next().is_none());
+///
+/// # Ok::<(), Error>(())
+/// ```
 pub struct Cursor<'a, K, V> {
     _tree: PhantomData<&'a RBTree<K, V>>,
     current: NonNull<bindings::rb_node>,
-- 
2.43.0

