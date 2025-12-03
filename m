Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16E2E2F0E;
	Wed,  3 Dec 2025 22:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800873; cv=none; b=i/8KjgYnwU0IyTHvGuArHm6CfJk6DMpVx4YTVGN4B1UO2UptCIV5Idwq6u/sHkicTtD0ggIqix7m+FBnrQzw5VAezLg9u249WwR+QL1HTUxGmf1ADdP9PKZfZnsUnpQ6h4vTIYMMAmcwmF6mgEAc+T5XNxF8GZsws/dTgE2/eEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800873; c=relaxed/simple;
	bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mq578Jee8mPr3qbakykzYkf9U9yGVYBXrhmjpquYRq0E7SIvt93iufjWwQlM8sJELft+ccU8BsTUo37GNmBUbpy4KCtH2su1N+syRHTNlengV9RIim7/df1B8/wJRDJqbBjvIvnTK9C6N8kjAkNn79HWmaqX1BdpIePaiHEaaME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0jP/Ud0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0jP/Ud0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD64DC4CEFB;
	Wed,  3 Dec 2025 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800872;
	bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m0jP/Ud0yOa10gIlxWprE9/j4xwsLyPG4pp22VYwn3LR9gbwlytJlZWvZ7/XHTZJT
	 5XQGVla9xE7q+Ug1Lo8oLaocWIfC4OOjZLDJuRhr5+wTLEw7X2WivNgZTmUjWhqNX/
	 QZZF9So8QuldZOau1jhj/tid0JtrIjF/ebVq28vG0bLc8KvGZwzTznNadD9JpEyUwR
	 rFzKB+hwrJV84gID6ajzUQZCt/Pwpq4gOgKE+20x62Iy3e3ZH9oYn5Jt/C5f5Xx8iD
	 dkLqy83j6Q+qlili/Cfm1BrKltw4kAOowq+AM0QbORrEkPjkBEKz3LRAs9m/ehf02h
	 RtwuNtKsI7MyQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:33 +0100
Subject: [PATCH 03/10] rust: xarray: add `contains_index` method
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=PrcApbk7BCNSPsQwnef2I6IdaZ2i07Y2ln8fzlwV9sQ=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkstUvW7+YPAChWwj2PNQcLbewxGouH19f/x
 ZM8ruj3xGSJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5LAAKCRDhuBo+eShj
 d5sGD/9g3byBD9oFAUj6QRSDtU1XnB2ifRdbJ/bCAiFS1M+C/K9xEDjhpCpi8kfWMpl4xpAtUSZ
 Lp5nFt6y6h0TYfUkuKKjuo8ONYHFh6TFrScqjpAWParm5hc69KAuAWDs5ZUs7pDO+taJSsVhWnG
 mZzk0wj5DltOSfE7kvek01rU4CcRW/q8FXNEorxC5VZ4Qo8qWtKGLQ6w1ADL7otDa/b2mkYdvMa
 ZEfEZ4vX4oUsomz6Hv55j6I9JR6HyQ4BKN2nmhwpjzO/zJkpywbcoBxt2mGF1RilEym+EtbTiP5
 o5UuY5MsFvX6T24QcgUPgOdSy4vpGQ8Mm2Tv6XHQOpan4Js3sxftjoI238TCzc3B9X03MaEft4G
 qSV4mOJW1v+J4q9Xee+uGEWcvCsFlvLBSlzRMQO28wk52p4yTKapAgfianXpSeAsHmHCzePalm2
 eF/hWIUIbt9RiaQxbxjH/CkrHxINK9ynesAaLli2ODcvuclepJfn1jFcxMeRETXVsWPKFXzNOWc
 CMBqV2lLXZkz8L75TBWaCbWyHXOwCO5LvtfIfH4IiJhbXnJqbnFbNb2x19RralZSet1QlM5Dqb7
 zCaaMAMqztcR6cvBowZkTsXqfQJUwobUIt49gQpMmWgNKiwW2Z7M5OFgtQdka3tuAVLl1K5MkD8
 xMmnQgeGSBafjng==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a convenience method `contains_index` to check whether an element
exists at a given index in the XArray. This method provides a more
ergonomic API compared to calling `get` and checking for `Some`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index d9762c6bef19c..ede48b5e1dba3 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -218,6 +218,27 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U>
         Some(f(ptr))
     }
 
+    /// Checks if the XArray contains an element at the specified index.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{alloc::{flags::GFP_KERNEL, kbox::KBox}, xarray::{AllocKind, XArray}};
+    /// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc), GFP_KERNEL)?;
+    ///
+    /// let mut guard = xa.lock();
+    /// assert_eq!(guard.contains_index(42), false);
+    ///
+    /// guard.store(42, KBox::new(0u32, GFP_KERNEL)?, GFP_KERNEL)?;
+    ///
+    /// assert_eq!(guard.contains_index(42), true);
+    ///
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    pub fn contains_index(&self, index: usize) -> bool {
+        self.get(index).is_some()
+    }
+
     /// Provides a reference to the element at the given index.
     pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
         self.load(index, |ptr| {

-- 
2.51.2


