Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A2274FFD;
	Fri, 14 Nov 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128854; cv=none; b=q0FaA8FxUWw3aMr6Go7LC4T9XAsKsQjaOmmpNvmYErGeAmfAH95nFliZlRHZtgyKs7+TKVoAE9dkAkirgk8XJYnBEFZ06ThYwkjYObGzMvROWK73nETljf4hsVdUH5dC+PUqCtlMf9LHAUXnMZE51kYDHfPvivO1sjW0FfCVzWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128854; c=relaxed/simple;
	bh=2aHywPuZecof9weD6RQMjMpfuZcXQx7L3grfJDoeLGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZN+kIe7I8b/vgXs7Sc1bQae7dZzNwLYD2TWB2CBCWmSWsM3PjpY2fgNqo8rl3i7u3a+1WRNqt5DC/Ygjf3z8dQNsfFq6xGJJmgU0p+Rcct/bUTLzKYakwu6xCz0Kymqh5q9b4ZHo3FICrIWg9PvupfcMVCzTYkYXg7i1w5YGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDem07Il; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDem07Il"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A45C4CEF5;
	Fri, 14 Nov 2025 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763128853;
	bh=2aHywPuZecof9weD6RQMjMpfuZcXQx7L3grfJDoeLGM=;
	h=From:To:Cc:Subject:Date:From;
	b=SDem07Ild13Nv0+csO/cnSwgEudPooDD6PYEF/cw4hYhle3GXkjIbno1dWRjfjDAg
	 UyGbP09TLbDCbu2wDvl5V3rw+vChj1c0FwG8BP1YxBSbrBs9RpH8EF1q/XINJxep43
	 GHePAtNd/s5kKjSAeHeN3n2qcu4TdXY5ioHYKOaZDpjYrUhxg3bih4vhLKFhd6MNmQ
	 1kqAd8EOlzsztHWL/oIkFBohyg7Hu9+bngqE/YFFP9AcnLEBioCP276i7Fdwbz7QPX
	 W4yBR24I1WU9c0Ovbq72Wbej6z9k6maIlN4ezMw2sZR/pISiSm4mzrMtYh480S24sY
	 44PwHCmleRdpQ==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] rust: lib: Add necessary unsafes for container_of
Date: Fri, 14 Nov 2025 15:00:21 +0100
Message-ID: <20251114140020.327075-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When trying to use LinkedList in the kernel crate, build fails with an
error message demanding unsafe blocks in the container_of macro:

error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>::byte_sub`
is unsafe and requires unsafe block
   --> rust/kernel/lib.rs:252:29
    |
252 |           let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
    |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsafe function
    |
   ::: rust/kernel/drm/jq.rs:98:1
    |
98  | / impl_list_item! {
99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
100 | | }
    | |_- in this macro invocation
    |
note: an unsafe function restricts its caller, but its body is safe by default
   --> rust/kernel/list/impl_list_item_mod.rs:216:13
    |
216 |               unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
    |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
   ::: rust/kernel/drm/jq.rs:98:1
    |
98  | / impl_list_item! {
99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
100 | | }
    | |_- in this macro invocation
    = note: requested on the command line with `-D unsafe-op-in-unsafe-fn`
    = note: this error originates in the macro `$crate::container_of` which comes
    from the expansion of the macro `impl_list_item`

Add unsafe blocks to container_of to fix the issue.

Fixes: b20fbbc08a36 ("rust: check type of `$ptr` in `container_of!`")
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
I'm currently writing DrmJobqueue, a new piece of infrastructure. It
uses LinkedList and resides in the kernel crate. When using LinkedList
from within there, for reasons I don't fully understand the error above
shows up.
The other testing infrastructure doesn't seem to run into the error,
though.

P.
---
 rust/kernel/lib.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fef97f2a5098..a26b87015e7d 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -249,8 +249,11 @@ macro_rules! container_of {
     ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
         let field_ptr = $field_ptr;
-        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
-        $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
+        // SAFETY: Offsetting the pointer to the container is correct because the offset was
+        // calculated validly above.
+        let container_ptr = unsafe { field_ptr.byte_sub(offset).cast::<$Container>() };
+        // SAFETY: Safe because the container_ptr was validly created above.
+        $crate::assert_same_type(field_ptr, unsafe { (&raw const (*container_ptr).$($fields)*) }.cast_mut());
         container_ptr
     }}
 }
-- 
2.49.0

