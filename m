Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018808;
	b=SRtiT4Aj4apc6IggB3i6atINNoq0QkLqy2hhF3vKZihvuZSsRrtLORUlOGuy5EH+cmNo
	 jLAOVb9KWjr8Cn0J/s4+L6oKlSGor62Bf8J8sMmIh8Go1xGxkYLwETbl1otSe/hbiC8ew
	 6O0nAeIo3DQ7vmkl11wOrkRsm/BHBj6IWQ30N19QdTB8konEx5KHQyrXVgjw8zAanaz+d
	 n8jNdDM12dz0pB3T+VRpD+7cow8WoQBrmgXfrKAm2drQkg6RcmW21me1OdRr5JkC0FHUh
	 d8AjLhBHJPXbcIUcemSvhVYsvvTFfL7VecisLPS++khA5wY8iFall7fE/4mgDYM/n7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018808;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uCzsAHfG2GG1TKcmv3qtbUoyTJ0D8//If2TmNeNJT/E=;
	b=xtah+0PXXzOgGAmTSga/SvY1dFRT5f52rEKJR6kq8YtFFaEq9uGInKKAVuIoXuS7d+x7
	 TbzoImlTb0hOIpPZBK4XXgg+5E+TYV4zbeZJC6/RrrNVqZ9hikl/OnBWbyNqC5rltw8T3
	 aaHdDY7zSCfVhXInSPdl60y+tF4tilEF0Esqjk9L/dUIlsLKGEpU4xDqj3rHvqd/Vxoju
	 iBr2oQT2JhLFY7x1SOo2pzzAmx1MmF/nm92owQz6InZL8b0mWTxaToDg/T0g0ei7Oey71
	 3RM3b/qzKRqp11cHcYNOz8LQnl8TePnIE6l1tofd+/icJSwdrBhsk2+rKKDzYp3moZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCq0VVyu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A975C606A320;
	Wed, 18 Nov 2026 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCq0VVyu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71D51F000C4;
	Wed, 18 Nov 2026 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795018808;
	bh=uCzsAHfG2GG1TKcmv3qtbUoyTJ0D8//If2TmNeNJT/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CCq0VVyuaZC7TMMPGtFzx0XVDuzrN8oYqqSdjQTubBqqPg+5uDqo5Vwidu0OEUGzD
	 ts5syafrdMKiinQ2d2noDr3exdiuqZMWz2WAYaNPlU85FgzKEGUK4viWJOCjh7x0VC
	 XYTQf7PMrTUPe6CGhmxKTl8SpxHfqJbF6Q79bgxTYDpZlUimNLJAMX188K+HxRfU3Q
	 sayQpTC4FAuiZw3qULX7l5u7jerfC4G0XinvfREsVpnsjaWFiF2b+h4S24tikYJ/zD
	 JdnoUbq3FxrHbX4e/ubU/0O25yU5IHGQ3+9DnHI0JCqZkuIoxkGfKeN3LZ4ITBgzQi
	 4vd/6RUa/1nfQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 18 Nov 2026 17:18:18 +0100
Subject: [PATCH v22 2/6] rust: page: add `from_raw()`
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-page-ownable-v22-2-d63ff73f4075@kernel.org>
References: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
In-Reply-To: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 David Hildenbrand <david@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mike Rapoport <rppt@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Wilcox <willy@infradead.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>
Cc: Igor B <igor.b@beldev.am>, Vitaly Wool <vitaly.wool@konsulko.se>, 
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=RFqpoS61oPhlsX7JmfJMDZ9W0OPZutOP01Pks9DxGDc=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq/c/vZPk3whkK9euDvasPgkdkOb+N5sydCBf+X
 HvnG8ly1TqJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCav3P7wAKCRD6UCkIqsW9
 0L3mD/970WoLXCH+ipc7bu6Yv3qRN/TjkLpw4TjzbqY2hfJtejMwLbE/1/X4JQGysFX62f6IGsj
 KWjwkH+aaAsuCsWoYzh4UMz/e7mXUY8MRpuZ6YdvRv331JZGTgoupTq+1H9v8ae3lzsZjIhNm+E
 7ktho8mokfg0LCOivC6/blw4UbCZFlL98QK7sDSojzcaNQ7skfMa7OCTFnvyZPbFdKGyk73hfMv
 caIu8D4pwKa+AK8cMcr1E5DSttZ9R79kO1HdZHmXd2NjH+D5B2oaDjGLzssLAM+gSNS/HaFfU0l
 2PMGeFqqKSE3JOCPXQc6Mn4rW6dl5hfy7qiyGn8ohj+QeD2iMsmlyIDSKIbTJBZyGBpstHVhJOJ
 MhMmQI1Z23RgMMUZeqmZLYi+OVfGlQtz0W4Dgo9tYd7FeOLKIDRiuTIus3NHJXbVrU50S7Z3oFB
 QH2EZxq7dcCff6ZhG3Lxaa08r5jEPYpYIHjxeSAZyYfQAkwExjwT/+wazrf9sKsaKy79QuzEjlX
 bHiaEfTzY5Brx/Cl0+ZbfN169iARltNqCc3UMj2CzPh1eZaVgQ6ZHM8lzC7RfusGbCPL/HN6GZi
 DkbTfBEMXx1QpkoAKN+YnPFa0GHO/KztcvnsAOW2ipjjqX6MkxZCoS5IbI7+VQdPCtB+w/exme8
 VTjCniRarKb9oSA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to `Page` that allows construction of a reference from a
`struct page` pointer.

The method is available for all page kinds. The caller selects the page
kind and must ensure that the invariants of that kind hold for the page.

A `&Page<RefCounted>` can be converted to an `ARef<Page>`. Thus, for
`Page<RefCounted>`, the page must be managed by the page reference count
and taking additional references to it must be permitted. This is not the
case for all pages, for instance pages owned by the slab allocator. Such
pages can be referenced as `Page<Base>`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index b2a17c86e7de..2ceeac0237d5 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -217,6 +217,30 @@ pub fn nid(&self) -> i32 {
         unsafe { bindings::page_to_nid(self.as_ptr()) }
     }
 
+    /// Create a `&Page<Kind>` from a raw `struct page` pointer.
+    ///
+    /// It is up to the caller to select the correct [`PageKind`] for the page.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that, for the duration of `'a`:
+    /// - `ptr` is convertible to a shared reference.
+    /// - The invariants of `Kind` hold for the page pointed to by `ptr`, see the documentation of
+    ///   the [`PageKind`] types.
+    ///
+    /// Note that the invariants of [`RefCounted`] do not hold for all pages. For instance, pages
+    /// owned by the slab allocator are not managed by the page reference count. Use [`Base`] for
+    /// pages where nothing is known beyond their validity.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::page) -> &'a Self {
+        // INVARIANT: By the function safety requirements, `ptr` refers to a valid `struct page`
+        // for which the invariants of `Kind` hold, so the returned reference upholds the type
+        // invariants of `Page<Kind>`.
+        // SAFETY: By function safety requirements, `ptr` is not null and is convertible to a shared
+        // reference.
+        unsafe { &*ptr.cast() }
+    }
+
     /// Runs a piece of code with this page mapped to an address.
     ///
     /// The page is unmapped when this call returns.

-- 
2.54.0


