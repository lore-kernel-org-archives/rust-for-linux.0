Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBA2299952;
	Mon, 22 Dec 2025 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406960; cv=none; b=g1RJlnOxqr/RGeHimF6qLsZ/HpyvngrrjgFM2xjv0dQLg75LwCEXzRoaf9ANNWwJ1+vwKl6aT2lH+88hGl6PVMs/ZSD3953DOxXJrYLPUZGaOglkCe9+KHzKvhs1kl+vT8/qIFWiYSzkmZ9CsZcnEKTixTsVOvEVWtjEpVWAlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406960; c=relaxed/simple;
	bh=GZefr2miDJVPz7/AUrQZGGN8nlgyECV12X9IsaSBhCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ieQTkoX5wF96Sadc/HixGLIF9cLzuFMxmwCrgooIYJMEbO5ByV6m4f/TOPKrju+XlzLmaf8694FH0LJGwRcyvHY9PpnEA6rU01DRTytxr47EqeobwA54LdMHJCAmwFCcf4tGbTlizyTPHcq/HEZqtM4mGv8HGLPLOy0d0FlOA3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixjllw0w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixjllw0w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8282CC4CEF1;
	Mon, 22 Dec 2025 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406960;
	bh=GZefr2miDJVPz7/AUrQZGGN8nlgyECV12X9IsaSBhCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ixjllw0wAHsjklLaIb3kMcqfoa3UeqL5PKLzncxqgiW3PH2yxeUHFPCFXVwpzoKsj
	 k898X6+CjAm8Q97Y3TRHUnVLaBaXa6Yq/vuu7zecO198swOvIjDtElOIfsStdaFsvm
	 szi592WB+7oQ06+cvBoNf/WQx5+gjn9PZEzui/D3oH+wo0nEeE9fFmjNTcoH0ogjbn
	 +uYgJeR3kDxqZennDRzibNbIoSUrPNho4vKtkLkb8MAFlLqbeWk2h8MezSgy468BYi
	 LiCwMwQaifkKPqxgfH0Zm0xiYUOfDrlB7N+saxeIF0IaoC+7pK5MqACW+tRIaTxTse
	 mh/yBPee+pxmw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:35:32 +0100
Subject: [PATCH 6/7] rust: debugfs: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-driver-core-v1-6-1142a177d0fd@gmail.com>
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
In-Reply-To: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406931; l=3123;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=wnJzdd7Q/TsdMm0CR2JTey0rC7wKqMRx7YZzm8OaozQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNQv54f8lXcI0JW5/+ZgOT0kqH5VnR7sBAanDaln/RB63mYRHhl/n7qd8XPaTIPr/iCytWIAmIL
 sYV/J/kcrXA0=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/debugfs.rs | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index facad81e8290..fe7c8c5e3301 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -102,9 +102,8 @@ fn create_file<'a, T, E: 'a>(
     /// # Examples
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::debugfs::Dir;
-    /// let debugfs = Dir::new(c_str!("parent"));
+    /// let debugfs = Dir::new(c"parent");
     /// ```
     pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
@@ -115,10 +114,9 @@ pub fn new(name: &CStr) -> Self {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::debugfs::Dir;
-    /// let parent = Dir::new(c_str!("parent"));
-    /// let child = parent.subdir(c_str!("child"));
+    /// let parent = Dir::new(c"parent");
+    /// let child = parent.subdir(c"child");
     /// ```
     pub fn subdir(&self, name: &CStr) -> Self {
         Dir::create(name, Some(self))
@@ -132,11 +130,10 @@ pub fn subdir(&self, name: &CStr) -> Self {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::debugfs::Dir;
     /// # use kernel::prelude::*;
-    /// # let dir = Dir::new(c_str!("my_debugfs_dir"));
-    /// let file = KBox::pin_init(dir.read_only_file(c_str!("foo"), 200), GFP_KERNEL)?;
+    /// # let dir = Dir::new(c"my_debugfs_dir");
+    /// let file = KBox::pin_init(dir.read_only_file(c"foo", 200), GFP_KERNEL)?;
     /// // "my_debugfs_dir/foo" now contains the number 200.
     /// // The file is removed when `file` is dropped.
     /// # Ok::<(), Error>(())
@@ -161,11 +158,10 @@ pub fn read_only_file<'a, T, E: 'a>(
     /// # Examples
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::debugfs::Dir;
     /// # use kernel::prelude::*;
-    /// # let dir = Dir::new(c_str!("my_debugfs_dir"));
-    /// let file = KBox::pin_init(dir.read_binary_file(c_str!("foo"), [0x1, 0x2]), GFP_KERNEL)?;
+    /// # let dir = Dir::new(c"my_debugfs_dir");
+    /// let file = KBox::pin_init(dir.read_binary_file(c"foo", [0x1, 0x2]), GFP_KERNEL)?;
     /// # Ok::<(), Error>(())
     /// ```
     pub fn read_binary_file<'a, T, E: 'a>(
@@ -188,12 +184,11 @@ pub fn read_binary_file<'a, T, E: 'a>(
     ///
     /// ```
     /// # use core::sync::atomic::{AtomicU32, Ordering};
-    /// # use kernel::c_str;
     /// # use kernel::debugfs::Dir;
     /// # use kernel::prelude::*;
-    /// # let dir = Dir::new(c_str!("foo"));
+    /// # let dir = Dir::new(c"foo");
     /// let file = KBox::pin_init(
-    ///     dir.read_callback_file(c_str!("bar"),
+    ///     dir.read_callback_file(c"bar",
     ///     AtomicU32::new(3),
     ///     &|val, f| {
     ///       let out = val.load(Ordering::Relaxed);

-- 
2.52.0

