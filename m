Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE963254A9
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 02:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130314; cv=none; b=P61V+pOys5JST+2GkF49j7/fUCrwlj7bYsn6F2jtKdHwkc3vnoEjvM2bnlS5v2Cs1juz1wqhqE+w/f+vDPutqzkD6tKxjIhEy1aiVUhVMAGI0b2hfsMUtPtpjBJu1KnajQinKLyK/oteIHvTvVtsG3FYlMSH+w9/WgjVXGWET1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130314; c=relaxed/simple;
	bh=jy8mgvmzpGKOFzyvPOZqGWMmRJiQ3s6hVheMypI3Uaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7QmJ/y1ogBMm45AtnJ3BpTmiMdIcUl+29YcO7BIBObI9/upwRbic7cEtL3aVhSt410GfEJ+uYobr3CopWvCUqLfr2Yizzu02GNkh+3RPtlaWtsTjnANEbeji0/8csGZZw0Dy+J6+9Ht2WxKGTVAgUHQUD+nTZTVVzk7aOupZWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0+ujz9p; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0+ujz9p"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d8a00bcdso3633901cf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 19:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130310; x=1790735110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLvQRDhNdQ+386SmPeBLxsAnS2o1lMXmcOlmjU9lVHU=;
        b=M0+ujz9peXktUF5fY7twDXI6jge3I/CmgUx+tJPkhUR8BBlWiWCJvXKa2cS2f3DSPP
         L+tW77/W8D774bvrcqXTpwevukctElp2h0dxA14wUOrLkfvVE0rlCfsZRg0muKjv5MCh
         /JmQf2Hmdq1XuBrte5fWSy09gj13r0CWVFYbvkJQw4JPeGKOzEwczmQK50vAK+NhPIyf
         DDFpS/2lHVQUD0nY3nJSPkOrxv+ZKU1Z4j25q8F6bP7vt9wK2WmdviJmRdNn6Nve56rf
         iMXyh8inM6aHqy1n5zfk8DNa+NMW3PfbpPFRWGZOJNboyWbh9F2jogPday2lXADGFSvp
         p7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130310; x=1790735110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLvQRDhNdQ+386SmPeBLxsAnS2o1lMXmcOlmjU9lVHU=;
        b=hV4AM8nJuVsFnOAusBExdG1xm/KFWMIFRp2V/Mei1nKQFfdNBg4nwW4Zl73+CT6BW1
         rVd82bEErJ5aUY3yJTtM517ua6nIsNTfaeUhaBRIoVsW/ul2RAEvkDPIp0zY3EjWGFc+
         GLkZBYVAXkILQSRAWnxuPTG/+r1Ex/92lyFF6Y3HRo/bqj9/QEqiLRbR0r5gxw93Z4Bz
         R4FAYaAsW4R1A9c3go4inIZQCXUuRZTAk1582/5piyINZqQt67iwKB7goHLIjFbhrXxb
         23ESRVIX20X6MCCQoLlHXpYmYbUJzF42YLFhk9XAxFtthWZ/UWJEVJxa1NqYuf8Jjk26
         eFSw==
X-Forwarded-Encrypted: i=1; AKwUvBxDGLHP+N4OaBh015C3Z0WrXDetBgRHiGTgfvv7qKXiW9EQ15jnnM0oLOTsl+vrluxwmfLVx8DaVbTbRROiWA==@vger.kernel.org
X-Gm-Message-State: AFuF++npRP8CrVrcPVeM17Iz6KNyxvqPZL/PW1loZgUbriDDgFbMgS2l
	AVy7oY0gEQBNHVJ+RBW9lVH/7uRq20SrB6rVjv9ELOfFaBFonbti4sCu
X-Gm-Gg: AYBFou3pX3BJ/6JLCp0Ifr4FeDLnui/SBAIYXMeBNQHv5Gz0ev4oSO7NjlwSRzLqgEg
	hZV4XgTQXJ2Q+YhCq0b8gyYdYZlqKKrrUVmTq0ZPJyvjTwzcrkQCNdQ5a3zC+895/ZN5TPRkhTa
	cjN3VKkwr7iC3DzIiVDfXlSfwQE2MrnIksmVdCNUj0eMDV4MDmsZSczvJplX3Qofmj9vTXQ4kDu
	dGE0OA2JCdKpnWnzc7lAw4QZY5nq7qseb37BvcKmPMRNH5t13mkoWiLH/6tcfD0qWaZSGQtFgoD
	yFkX8o+n9k7kzd5lrhjlRqRuX/d/RtpEUnwzlK4lKcrJxQgLyebT/xD1aPaRNS5RT6W2C4II6Yd
	vVm9oVB+MAOWFF41siMZ4o88JVaWbqvbP7iCmUaYosQ6f9YLMvrI7s+lMBfo2QCH6N574PjNrdl
	G5gNy/vzHuDH0mRq17A17ssDEv9+7xyRwni0XdZV04770nKnFZaByAZ5lAx7ZExfbWBlEYvQ==
X-Received: by 2002:a05:620a:17a0:b0:93b:e9db:1bab with SMTP id af79cd13be357-93c251efb88mr212666485a.56.1790130310310;
        Tue, 22 Sep 2026 19:25:10 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24823976sm124500985a.13.2026.09.22.19.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:25:09 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-fsdevel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: file: handle fd table teardown in file descriptor APIs
Date: Tue, 22 Sep 2026 22:23:39 -0400
Message-ID: <20260923022339.3340694-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several Rust file descriptor APIs rely on `current->files` being
available. However, `exit_files()` clears it while execution may still
continue on the same task.

This affects `LocalFile::fget()` and the
`FileDescriptorReservation` operations that call
`get_unused_fd_flags()`, `fd_install()`, and `put_unused_fd()`.
`FileDescriptorReservation` cannot cross task boundaries, but remaining
on the same task does not guarantee that `current->files` is still
available when these operations are performed.

Guard the affected operations against a missing `current->files`.
`LocalFile::fget()` returns `EBADF` and
`FileDescriptorReservation::get_unused_fd_flags()` returns `EMFILE`.
For `fd_install()`, warn and abandon the reservation when the fd table
is already gone. In the drop path, skip `put_unused_fd()` after the fd
table has been torn down.

This prevents NULL dereferences through these safe Rust APIs after
`exit_files()`.

Fixes: 851849824bb5 ("rust: file: add Rust abstraction for `struct file`")
Fixes: 5da9857b127e ("rust: file: add `FileDescriptorReservation`")
Closes: https://github.com/Rust-for-Linux/linux/issues/1256
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Use `warn_on!()` for `FileDescriptorReservation::fd_install()` and
  remove the warning from the drop path, following feedback from Gary Guo.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260920200154.1194983-1-georgeandrout13@gmail.com/
---
 rust/kernel/fs/file.rs | 64 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 23ee689bd240..8b5b5ec4cd04 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -260,7 +260,17 @@ impl LocalFile {
     /// [`assume_no_fdget_pos`]: LocalFile::assume_no_fdget_pos
     #[inline]
     pub fn fget(fd: u32) -> Result<ARef<LocalFile>, BadFdError> {
-        // SAFETY: FFI call, there are no requirements on `fd`.
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if unsafe { (*current.as_ptr()).files.is_null() } {
+            return Err(BadFdError);
+        }
+
+        // SAFETY: There are no requirements on `fd`. We checked above that the
+        // current task still has a file descriptor table, which `fget` accesses.
         let ptr = ptr::NonNull::new(unsafe { bindings::fget(fd) }).ok_or(BadFdError)?;
 
         // SAFETY: `bindings::fget` created a refcount, and we pass ownership of it to the `ARef`.
@@ -403,7 +413,18 @@ impl FileDescriptorReservation {
     /// Creates a new file descriptor reservation.
     #[inline]
     pub fn get_unused_fd_flags(flags: u32) -> Result<Self> {
-        // SAFETY: FFI call, there are no safety requirements on `flags`.
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if unsafe { (*current.as_ptr()).files.is_null() } {
+            return Err(EMFILE);
+        }
+
+        // SAFETY: There are no safety requirements on `flags`. We checked above
+        // that the current task still has a file descriptor table, which
+        // `get_unused_fd_flags` accesses.
         let fd: i32 = unsafe { bindings::get_unused_fd_flags(flags) };
         to_result(fd)?;
 
@@ -421,13 +442,26 @@ pub fn reserved_fd(&self) -> u32 {
 
     /// Commits the reservation.
     ///
-    /// The previously reserved file descriptor is bound to `file`. This method consumes the
-    /// [`FileDescriptorReservation`], so it will not be usable after this call.
+    /// The previously reserved file descriptor is bound to `file`. If the current task no longer
+    /// has a file descriptor table, the reservation is abandoned instead. This method consumes the
+    /// [`FileDescriptorReservation`] in either case.
     #[inline]
     pub fn fd_install(self, file: ARef<File>) {
-        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`. We have not yet used
-        // the fd, so it is still valid, and `current` still refers to the same task, as this type
-        // cannot be moved across task boundaries.
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if crate::warn_on!(unsafe { (*current.as_ptr()).files.is_null() }) {
+            // `put_unused_fd` also requires `current->files` to be valid, so do not run
+            // the reservation's destructor after the current task has lost its fd table.
+            core::mem::forget(self);
+            return;
+        }
+
+        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags` and has not yet been
+        // used. This type cannot be moved across task boundaries, so `current` still refers to the
+        // same task, and we checked above that it still has an fd table.
         //
         // Furthermore, the file pointer is guaranteed to own a refcount by its type invariants,
         // and we take ownership of that refcount by not running the destructor below.
@@ -446,9 +480,21 @@ pub fn fd_install(self, file: ARef<File>) {
 impl Drop for FileDescriptorReservation {
     #[inline]
     fn drop(&mut self) {
+        let current = crate::current!();
+
+        // SAFETY: `current` points to the currently executing task, so it is
+        // valid to read its `files` pointer. The pointer may be null during
+        // task teardown.
+        if unsafe { (*current.as_ptr()).files.is_null() } {
+            // `put_unused_fd` uses `current->files`, so it cannot be called
+            // after the current task has torn down its fd table.
+            return;
+        }
+
         // SAFETY: By the type invariants of this type, `self.fd` was previously returned by
-        // `get_unused_fd_flags`. We have not yet used the fd, so it is still valid, and `current`
-        // still refers to the same task, as this type cannot be moved across task boundaries.
+        // `get_unused_fd_flags` and has not yet been used. This type cannot be moved across task
+        // boundaries, so `current` still refers to the same task, and we checked above that it
+        // still has an fd table.
         unsafe { bindings::put_unused_fd(self.fd) };
     }
 }
-- 
2.47.3

