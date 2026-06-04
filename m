Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B0B3C9EC6;
	Thu,  4 Jun 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603244; cv=none; b=JQ4z+tOl9y1JaY1swgHtyrnnDwrY3wh6ygvVrZ4ea/rYc/qs1bVMmIpdnjndaWTmYQ5k8wtOyFVwia8ebDeW0djNgrbm0nM5tBQhrTQueg7fbQM5EKcS6DGlQfhXCazu510xK6prV5X0MxifsHOAFd4MFi/yumu28esSrerFbuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603244; c=relaxed/simple;
	bh=ezQhkpviZx/0cjtMqszOUvlxFZxlxC9tkEpF0/WvfOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuuQ7tonNIU5C3EhZuz/+dpT8bZyxh/BJRuo5L0HvTt8tMi620ULW++dCztqyg4VkfQXM9+IaH9eLaFULv3Wvz/cCh7pzKvsluu9LhRyCR5gXjZP1bbXAAkny6lV/PNrcbXZuwhlbiWksbgobkPFgCiHONuavSffLJWCGZVv9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cySSMS0w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cySSMS0w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29BB1F00893;
	Thu,  4 Jun 2026 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780603240;
	bh=uzpE/Seo/CVQh6i9kKpA38HdPooRgCjlsYOlxSZWRAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cySSMS0wQoYMLFZzNwdzKmfmDrtcSP/NCTMcBFjGrWbz/6X+Fz/vnrepqH5ta2nh1
	 lhCk9aTbZPsqiZNsvbjOpL4PQxz8kP+DABIXN56KvsyAjv59XHUSu7zIHiAoEbqhPm
	 1esZpcUGWk6ajslGpO2jjpcIxVt6RdEiE6v7A1RYXbUZ8oEM1XcBwgXVVBKTFf1wg7
	 A9AfnP56HKtTmklCWvGhwU/UpbvkpJ/N3Xx67srCiTyhHV1gejmg4wmO0SpwR+eOcl
	 Ac5Hdplhy87NTF5pJ+2+4er41Stu9yUF0Qjed+2CogvW7P+aqeNxfZXdaox+bkAki9
	 laeW5QIFtTTTA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 04 Jun 2026 21:58:11 +0200
Subject: [PATCH v4 05/11] rust: xarray: simplify `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-xarray-entry-send-v4-5-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
In-Reply-To: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Tamir Duberstein <tamird@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ezQhkpviZx/0cjtMqszOUvlxFZxlxC9tkEpF0/WvfOY=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIdju4CQhaBJkwad79lAfp/ue4pLZH7qUsiCm/
 +qQ25t3ElKJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiHY7gAKCRD6UCkIqsW9
 0PkLEACqUwe49HzCnXbMEXytmhd0EooYaXxjvSqDIcIDhP4BqsAGSFzbXsRfdR93yV15pTd5Btl
 JHv74i4b5Z0UVvF6rEXcae2n9TT/TdoVv/YNvAQPOxodV9+9pCG64KN4WoVJm882c8kllHD70qk
 tikJcRAEbjzyuVBJLcxZXzqkRiSG5Q9sGUHb/P9OacmoI9I/czaNbF+qmD7KqDV4zJwY1z2zni/
 lgoGOJFES7OBBQPeLRWZpfHgViKACn71Fetc6wyljzbj2iSwwm2pEAtOLFFNxtbPJub04IgQfeH
 S7TZ6+OE6b/N0Wsz4vVgOQB+gsSlDqG9cuvkgayZ8xasT1X6h3snzsh+VL6DXuzLnxAb083ktup
 Wx3n9CP4v6XAmNyDEf1KG9jQiAaQ+OqLjFyfshRwHn+2l0dL1YUlFd3O3ncsb35BJOj8QoTegAo
 soE0Crn8McmYMPM64I0llHlTFjJsVxwKrMVViZb1/fY5FQXsSLNOwWllgKwdCkSpGwQYgX/7WHm
 fxjoYCVj4oVoQ4kMayxYBlTYUrcfz355KKByl+Y4455Mel4QLQlngxC9hYIcQdNjlQohUFBwzQp
 n1fy6EZejVLk87xWLxOfnqFhP9BelJBmHncIW3inXaCP1jgOVFdU4IJrvuIvaVpR/Gq8hk8tBNZ
 eVEHfHszdt31wHw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Simplify the implementation by removing the closure-based API from
`Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 05e6dc1ffe69..7da57c778669 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -212,28 +212,23 @@ fn from(value: StoreError<T>) -> Self {
 }
 
 impl<'a, T: ForeignOwnable> Guard<'a, T> {
-    fn load<F, U>(&self, index: usize, f: F) -> Option<U>
-    where
-        F: FnOnce(NonNull<c_void>) -> U,
-    {
-        let mut state = XArrayState::new(self, index);
-        Some(f(state.load()?))
+    fn load(&self, index: usize) -> Option<NonNull<c_void>> {
+        XArrayState::new(self, index).load()
     }
 
     /// Provides a reference to the element at the given index.
     pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
-        self.load(index, |ptr| {
-            // SAFETY: `ptr` came from `T::into_foreign`.
-            unsafe { T::borrow(ptr.as_ptr()) }
-        })
+        let ptr = self.load(index)?;
+        // SAFETY: `ptr` came from `T::into_foreign`.
+        Some(unsafe { T::borrow(ptr.as_ptr()) })
     }
 
     /// Provides a mutable reference to the element at the given index.
     pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
-        self.load(index, |ptr| {
-            // SAFETY: `ptr` came from `T::into_foreign`.
-            unsafe { T::borrow_mut(ptr.as_ptr()) }
-        })
+        let ptr = self.load(index)?;
+
+        // SAFETY: `ptr` came from `T::into_foreign`.
+        Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
     }
 
     /// Removes and returns the element at the given index.

-- 
2.51.2


