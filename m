Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C968226B971
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Jul 2026 01:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289445; cv=none; b=hreaXEHDHPd7ouSg+TN6oowVOtDlAc4no5g2IcZ44asaJKeBs/ul49vEKVkGCQSFA+ZbSbruNgVAeukvs/5JVUpVZBCktIGhSPztuzkxXEQ7Wx8253bFXZB+AtXqEHScwLkPSkF7IK6fQkA0avjDuoxWqzDlMhDxKk53NRjwl0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289445; c=relaxed/simple;
	bh=p1+WZPY9iMyUHE77uorGtUqtSg/8ykpg6mH7vx6X7xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZU5Wrlo+E7NTmj97TOo0kcMytbhc0VojEQXUruBFtfjK8Dd3GAiEG5o8GU3jmoj4Rj6lurZuPi8s5cWh9ILnCtdEDQjAjVdUC/2YPu0DYNGre81eBmL3DjctTlzUT/jt3Cel5xkVFtqklLjzr5nrPtNtS71WZM51JdOfbZqLOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYUHtnBe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYUHtnBe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc73e322dbso5800725ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 18:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785289443; x=1785894243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vf6BATMJjhCFczLpr0p1PZtkcnXtQi/C3CVVFkL2lFA=;
        b=eYUHtnBe7sgUU3PpGeUwE/QToSL2QC7L2U67x3YXf/fCPoV9+XHzg/JBvV2Qn+SdmF
         KnalecYxqz7n3gkcdSWTGhTMs8EiKHfbv/DRb30GYQOCiSCGimuDAB/d3wtAYY2Cv00O
         ucvEVlLJjng2f2O1nEqzIrADwwb3QFfm9dJbWe5g3jGDgm5iq2Apcls+9GIyVsXElE3d
         nSGwbCKRspenIxqnRipTLgZ8UfnGyx42xz23m3DoXWB+INptmecayYtA9vHvVSxdxTSd
         nFCaARoayNpc+J9aNeyzxg715cRQbTwmCInX5mkRIA//fSLhg4IWmlVK53flNIK0UYJG
         wXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785289443; x=1785894243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vf6BATMJjhCFczLpr0p1PZtkcnXtQi/C3CVVFkL2lFA=;
        b=ndHEZcBS4za21wMQxNeWq/PKt/urdrYvk+kzTEN0s8Hnl6yu6l1ZgW7TGyYwcN1PP3
         tL/DWAzBTgdJuDcZcN+rap+RO4Zqy3ZaCZwPCtb0tDnroKohqI6IzgATLodON0qqeyG+
         mUzwkvyboMxSMdgNkg0BA96TXVaHF3t9bp6YlvFlFbUiumqcNMzn8wpFRLf+idpX7ptc
         t/W6C7MBqLxW+bD8sUGc3Lhr5SJPaj1Gs+kLWwU/9xhQGI7EpbDuExzdvTb9bt0rdgwq
         S5uuyy2GpvLbODchd2uNEV9uSNahdRZPcB8mX785j1pgh6XA+b6mkwkVf+xqqsI+uomM
         1XlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIOivKActUzUqqPpI7AdfYDDP1oslO5z0NFeO5D0lxNxbGmBnvGFkO3iVCpH5UkmdM01MeazubSm/ZoEfatA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz18WP6X8encrG5dNFlSTCvOFwklzPm0vH55ma2+q9yEOCxMajc
	mvUHxn6yfX275s5K/TcUw0Y0X09H7ASavtmQ+XDJlPIptimbTu2oBq7g
X-Gm-Gg: AR+sD11T2o1pMEOzpG1IQ4uu3rJt51joG8sNJyfDSaihRt/Vn7GH5VbOPcMNWff01aq
	nlFXi9dx+2Tr0tpksuvkEhozES8Ckra0WGBAB+JSIZSrZV/HUIPJoZBwNXBNXoQgDO++3GdQaFD
	fe1AgjhMkNoUPM34W1rgIGiFNLaFIvLxs2kqIcxc8lN5qI5Pf8h4o9XuqWnpc5S5kIGTeCPu3OR
	GZ4NVvUoTpI3JjpC0l4rReNl+u5ld+gCpWcRqF9XKDTsQvHvBe9zyunUyBg2OzR/mieRxslTE3q
	7w3aXMoHk1ojpxbt38/U9DHWdLx1Fkf20L7Pxqmo1Q6loPRXIQ8JDAyJfSYNdKkMp/6qtW1ZlJT
	xkQ+97eycJeHOL6X/wK2YXenpHDC/xLtZA70r2b4EF+goxJ5KR8b+WuuHh0rXrmpGWuEu36CqiW
	h/o+aTqGUawREbsbfnE+UsUdJbrIjoL0TDI+ckg3go1IXLU7QeCfonI+looSdwPu3SAZMN6/Zi+
	GScD3+kKeC+3rKPGfH6wV4GXbSq66k+tEdtyYSARAPln3I6HtJP
X-Received: by 2002:a05:6a21:7308:b0:3c6:3c5b:ff1f with SMTP id adf61e73a8af0-3c8ab0e21afmr5962968637.22.1785289442976;
        Tue, 28 Jul 2026 18:44:02 -0700 (PDT)
Received: from pop-os.tail4f8d5c.ts.net ([2800:810:473:6eb:dbba:a18d:8690:2c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265547bsm3421904c88.7.2026.07.28.18.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:44:02 -0700 (PDT)
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
Subject: [PATCH] rust: rbtree: document peek_next() on the immutable cursor
Date: Tue, 28 Jul 2026 22:43:44 -0300
Message-ID: <20260729014344.1244809-1-juanpatriciomarchetto@gmail.com>
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
to peek past it. Getting that wrong yields the key the caller already
has, which for an iterating caller means no forward progress at all.

Document the idiom, including the case where the looked-up key is the
largest in the tree and therefore has no successor.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>
---
 rust/kernel/rbtree.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 6fbd579d4a4..2a0379374e2 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -811,6 +811,32 @@ pub struct CursorMut<'a, K, V> {
 ///
 /// # Ok::<(), Error>(())
 /// ```
+///
+/// [`Cursor::peek_next`] steps past a key that matched exactly, which is how a caller
+/// reaches the first key strictly greater than the one it looked up.
+///
+/// ```
+/// use kernel::{alloc::flags, rbtree::RBTree};
+///
+/// // Create a new tree.
+/// let mut tree = RBTree::new();
+///
+/// // Insert three elements.
+/// tree.try_create_and_insert(10, 100, flags::GFP_KERNEL)?;
+/// tree.try_create_and_insert(20, 200, flags::GFP_KERNEL)?;
+/// tree.try_create_and_insert(30, 300, flags::GFP_KERNEL)?;
+///
+/// // `cursor_lower_bound` stops on the exact match, so the successor is one peek away.
+/// let cursor = tree.cursor_lower_bound(&20).unwrap();
+/// assert_eq!(cursor.current(), (&20, &200));
+/// assert_eq!(cursor.peek_next().unwrap(), (&30, &300));
+///
+/// // The largest key has no successor.
+/// let cursor = tree.cursor_lower_bound(&30).unwrap();
+/// assert!(cursor.peek_next().is_none());
+///
+/// # Ok::<(), Error>(())
+/// ```
 pub struct Cursor<'a, K, V> {
     _tree: PhantomData<&'a RBTree<K, V>>,
     current: NonNull<bindings::rb_node>,
-- 
2.43.0

