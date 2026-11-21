Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266992;
	b=qiYFnnE1IHVFRUanIT2B9CcRVEtdAShqxo7o2K6jTGsBPyloq3HQrKzKoznJMDWA2v3f
	 IRoK3XlkfoblEf9TMeQBGCI90RVmN7ryHel/Q9pAAmLfN/jpWgZBbUPG6t26jMbxRcyJh
	 R7GI5SHm7UaksVWmuxi/9UxIzczZ9G+P3NgWTYkGS30snbfEeE+kEeCeQA1TfRyqkZdoJ
	 M535pep6KUv062HTx9wwtiwfWnr6fzLuG8LMKFOMImevoTmjD0LPaUBdqdQjN6mUvgld5
	 HanVNErHY0xBGg6sgb7RYrQUNNvjadvPUgJJamWoi2dJ2skskAreMnPTjCIty7HRy3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266992;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gd+29OyRmdmWrXF2MTU6Wupy3NXK/3/Bt0tj+QOE1v0=;
	b=xq7cpwsSR+FRHt4S3xtAxjyytfChp3gveDwRQc61jM6hCvfpsEjvD8/kdcbSIGEs05NY
	 gQLrB93yfFIVLmENTF1qNwfCL6goQwu5BIKlTiL6ukSa/VFcneiAjykFm2f//Hiz6e9ee
	 crQKAi5cw3Pu9ITmgNlHFjNYviTZzkM/XKvNQXXExeyP5LCkZHccaO6sZCFQo5lyQNzi6
	 358Sa0jDAXTLgpJiqkoSNRnJNp/FfiCaQ8ls60pxF/8HwRXVj4ChCMMhdtji9qVHkXWGk
	 009jeNWC0rdFYlOetdWj2ZXYTYXi5I50ieq7ulJQMEMp1ph8zjDcqBASSi/z+g08EHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Taku/ZE9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 79546606A32C;
	Sat, 21 Nov 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Taku/ZE9
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3F6FF1F000C0;
	Sat, 21 Nov 2026 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266991;
	bh=gd+29OyRmdmWrXF2MTU6Wupy3NXK/3/Bt0tj+QOE1v0=;
	h=From:To:Cc:Subject:Date;
	b=Taku/ZE93TTg9Og4nqXlZDf0tA+542GQTBJ6lGjf9EkUR7NYTSTTU6N2GADLqcBs4
	 wa3x0OhaRZTyyMVSkOVYuxxCTsJvF+gcc7ue7kMor1WG4kJlUS0K0sfZTzuAkaBLyH
	 GPnFI+hYWIsXlScchY9E4y92xlkcPMAik0ToY/R87q7ZdCl1Bi3ASVdxfMuwUv/yCy
	 6+PSJYh1qPEWGocZcHI0dALVy6sUOf/IpfrSo8WNfqlEZR2NFemoG28/djHZVJAW4R
	 zTdKlXo3C6EE3mGGYskrexdgLG8um95O52elZDRiewSupTKwWE7+WlZ6J1PgvWaYcO
	 X3EVtGW+pH1TA==
From: Joel Fernandes <jfern@kernel.org>
To: linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: Joel Fernandes <jfern@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: rbtree: remove redundant comparison in find_best_match
Date: Sat, 21 Nov 2026 08:16:18 -0500
Message-ID: <20261121131618.909529-1-jfern@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the Less arm of find_best_match(), the current node was recorded as
the best match only if its key was smaller than the key of the best
match found so far. That test can never fail, so remove it. It saves a
comparison and reduces lines of code.

Signed-off-by: Joel Fernandes <jfern@kernel.org>
---
 rust/kernel/rbtree.rs | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 6fbd579d4a43..5e64504d592e 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -493,7 +493,6 @@ pub fn cursor_lower_bound(&self, key: &K) -> Option<Cursor<'_, K, V>>
 
     fn find_best_match(&self, key: &K) -> Option<NonNull<bindings::rb_node>> {
         let mut node = self.root.rb_node;
-        let mut best_key: Option<&K> = None;
         let mut best_links: Option<NonNull<bindings::rb_node>> = None;
         while !node.is_null() {
             // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
@@ -515,15 +514,8 @@ fn find_best_match(&self, key: &K) -> Option<NonNull<bindings::rb_node>> {
                     node = node_ref.rb_right;
                 }
                 Ordering::Less => {
-                    let is_better_match = match best_key {
-                        None => true,
-                        Some(best) => best > this_key,
-                    };
-                    if is_better_match {
-                        best_key = Some(this_key);
-                        // SAFETY: `this` is a non-null node so it is valid by the type invariants.
-                        best_links = Some(unsafe { NonNull::new_unchecked(&mut (*this).links) });
-                    }
+                    // SAFETY: `this` is a non-null node so it is valid by the type invariants.
+                    best_links = Some(unsafe { NonNull::new_unchecked(&mut (*this).links) });
                     node = node_ref.rb_left;
                 }
             };
-- 
2.54.0

