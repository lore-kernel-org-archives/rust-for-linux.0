Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C933B6C0
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578413; cv=none; b=Z8X5vsVtKDuA438LnZxOl6+TQDYyxAunnO9tW29kpvKSUKcg9J0rzRpIs8wPSWotq4pDns9keEFET0EjqyyS5cxgitK66qg3n47gEPQov3zW7a/KsT6y4rz3YVPY1gCtPYGw+8DTcp4TgR9/2u6VwYy5cZ2w2fkj4nQ8jZTtDBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578413; c=relaxed/simple;
	bh=k6qM4owknwmZ0WB40LW8lN6xxPZevEl5Zk/TWP4cnbg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XEiJ7zuNtVwI3tDogYTkMfmxe1xpWmVzoXgM6I8XQD41Hb/kS6cgut1mdkEsC2tG3EbpfgV5/NjS5EJwnCxuVkWTVQCHeui5wgqK87DjCH5aHiObJxiy78j790h67zx7zwFcYkvXuP3WiX5c2xoIa7FUMCSh5jdpRjlWpCQ7vpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pnmRaWYb; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pnmRaWYb"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4801c105717so17818995e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768578410; x=1769183210; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8XGtH7eRIWG3NpNTBCWRXdsIlOUMi+HesazDDnaKxAg=;
        b=pnmRaWYbrBgOHG7cjnY4gp4KbssLfUrSO8jNlM3Z3K0/iS28Snh2Bkm45Vd58CF1VF
         L7fCMNVGIoVdGybnzRw6R31ov6J0bFBS9zDmYZF5/FujhSHhlmKQYUX55gZvpqANYsot
         Vto4NAIqQxzRIfKVJ6LQHLztHaq76mWUl++kAByEa8TziGGl2SKnLN4H07+rsujwIZLg
         6tTyBNYHjyKgKecOl/L04qwrwxTy/E0D6rwZK2TEVgjKQ73JMdIdA9C++eSYRnd9Q0vT
         1TmsyjaxEyhe7J/E7W910R8wUlTT3dW653cEv0Mj5QVpDCmEHSoSgGqcep2rEGMTtzd+
         vy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768578410; x=1769183210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XGtH7eRIWG3NpNTBCWRXdsIlOUMi+HesazDDnaKxAg=;
        b=xOi+GQ4olYMNM6fNMPEK+KYKLsQokyTGh8mAUG3rWQhrrPPZsr9tUWskBvh0O+obEq
         wEe8JEsJrsXQDsR5dHORLKBSNcEfrv0BmX+Vi4iIT5GUcOaQSkwJnUgOnp2Wb2a/Y6xq
         6Wv4WoaZpO2xvDMLZNGsBd3+i6FM84cyWOToKp/GNNEBnkzzofn1ZbMaK4Ci6hSq1c5O
         6m50zQPI08I7HCQsxWjW9uia+kc5Ygl2vP3a2SVbdAZ7Zc9sg6nDdVBPPmjQG9nSB0JT
         P4P2rZ29d6OP+LuUc16Az92dhX2DdjSs5VZR8c6oLurGD2ibbMLYz1E/Xg1Mm+yFKW50
         /Fdw==
X-Forwarded-Encrypted: i=1; AJvYcCUjMo05JLUntQTOj9aKx3VMVuI81F2LzYVlYHQBK8kv/+YMqSNE1eZiNh0wLij06JYqiMQble0hFXkklkgYIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5KDhKZNjnkpVo0OiePimJThcdIAXMwA3k4QNGdeDJmvLpfLM4
	wXW8EQw2D91092f4Rspf8vbOq+L75EcuJ0w75BXDX5wwAihghCEVaf6wSm/pyCmKcPi/N7aAEQQ
	Ur5b7F77O9eOJibT/kA==
X-Received: from wmlz25.prod.google.com ([2002:a05:600c:2219:b0:47e:e02a:29f9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6099:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-48024c96d6fmr18214815e9.7.1768578409946;
 Fri, 16 Jan 2026 07:46:49 -0800 (PST)
Date: Fri, 16 Jan 2026 15:46:37 +0000
In-Reply-To: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2699; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=k6qM4owknwmZ0WB40LW8lN6xxPZevEl5Zk/TWP4cnbg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpal1mlwNdQHuRPBnDEkbjpMyIXbDK8SMRSGlpp
 bXnMzHOe7KJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaWpdZgAKCRAEWL7uWMY5
 RmVgD/4mrfBYDwKDTh846tUygrVVBpPGrwR+pu3KEcaHS9S78rcPTu0xCPHY9Ylnb36FvqkeRQc
 i0plU0JogkIjXeS2MZOwaSS9qf9UJ9TQ6QbLm8tDYn60m+RsMzhSQBwxGV3NQJCs7BREt/RUeCC
 vXZPgmd+AidlxjiKE3/JinBtZvRX1ueXFTu0Jcb0l2dy34EWKNI5w67IdP9WwrvwuCDv64M6oQZ
 2CiBVwM4kg6OMDm1eW6JGRKJAorC/MTCo4ZvA5WI7xD01o27uQQNEjVz8hJYpY7aC4kWhWPv/SY
 h0JJ8QFnK/4PGvCJYY8b262ZCD+cp7Vie74YvFq+g99oNsvk+mtbVRIMETJjmuMpbUvs2v4ocz1
 8pQcNFUp9MfPINoTOZHt7Pn2R/VTIDqng5id7dpFmwJasygE46pPliliNf57woIYHmhDQkLH6Hc
 ZqmBVClr7yQoFjtP7sbkK8sFNIeZhVSHGkN7rkxH4TmOCp3MUumlf6qZH8npTt9SYmV/IzhmzaN
 jQLPNRHRxbxx7HMj7eb/V0AhQVQK98Nw5FB0JhhySTtJqU/36B0oWZYiisLbvb9pe4e9rjHZWWj
 aTdpPHe6XJhq80yU50gMk72HkHc/sDA+xke8/t3BEpQ/9Et1c0C1OQ27f1Q4I89sIDYzSJgTYU4 7v8e4h7qDx1dlyw==
X-Mailer: b4 0.14.2
Message-ID: <20260116-rcu-box-v1-2-38ebfbcd53f0@google.com>
Subject: [PATCH RFC 2/2] rust: maple_tree: add load_rcu()
From: Alice Ryhl <aliceryhl@google.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Andrew Ballance <andrewjballance@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, rcu@vger.kernel.org, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Now that we have a concept of rcu-safe containers, we may add a
load_rcu() method to MapleTree that does not take the spinlock.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/maple_tree.rs | 52 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
index e72eec56bf5772ada09239f47748cd649212d8b0..c466a9fe0a9a059ad5cff131085d610b76050420 100644
--- a/rust/kernel/maple_tree.rs
+++ b/rust/kernel/maple_tree.rs
@@ -16,6 +16,10 @@
     alloc::Flags,
     error::to_result,
     prelude::*,
+    sync::rcu::{
+        self,
+        ForeignOwnableRcu, //
+    },
     types::{ForeignOwnable, Opaque},
 };
 
@@ -233,6 +237,54 @@ pub fn erase(&self, index: usize) -> Option<T> {
         unsafe { T::try_from_foreign(ret) }
     }
 
+    /// Load the value at the given index with rcu.
+    ///
+    /// # Examples
+    ///
+    /// Read the value under an rcu read lock. Even if the value is removed, it remains accessible
+    /// for one rcu grace period.
+    ///
+    /// ```ignore
+    /// use kernel::{
+    ///     maple_tree::MapleTree,
+    ///     sync::rcu::{self, RcuBox},
+    /// };
+    ///
+    /// let tree = KBox::pin_init(MapleTree::<RcuBox<i32>>::new(), GFP_KERNEL)?;
+    ///
+    /// let ten = RcuBox::new(10, GFP_KERNEL)?;
+    /// tree.insert(100, ten, GFP_KERNEL)?;
+    ///
+    /// let rcu_read_lock = rcu::Guard::new();
+    /// let ten = tree.load_rcu(100, &rcu_read_lock);
+    /// assert_eq!(ten, Some(&10));
+    ///
+    /// // Even if the value gets removed, we may continue to access it for one rcu grace period.
+    /// tree.erase(100);
+    /// assert_eq!(ten, Some(&10));
+    /// # Ok::<_, Error>(())
+    /// ```
+    #[inline]
+    pub fn load_rcu<'rcu>(
+        &self,
+        index: usize,
+        _rcu: &'rcu rcu::Guard,
+    ) -> Option<T::RcuBorrowed<'rcu>>
+    where
+        T: ForeignOwnableRcu,
+    {
+        // SAFETY: `self.tree` contains a valid maple tree.
+        let ret = unsafe { bindings::mtree_load(self.tree.get(), index) };
+        if ret.is_null() {
+            return None;
+        }
+
+        // SAFETY: If the pointer is not null, then it references a valid instance of `T`. It is
+        // safe to borrow the instance for 'rcu because the signature of this function enforces that
+        // the borrow does not outlive an rcu grace period.
+        Some(unsafe { T::rcu_borrow(ret) })
+    }
+
     /// Lock the internal spinlock.
     #[inline]
     pub fn lock(&self) -> MapleGuard<'_, T> {

-- 
2.52.0.457.g6b5491de43-goog

