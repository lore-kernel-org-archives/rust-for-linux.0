Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B291C695;
	Sat, 14 Feb 2026 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771061272; cv=none; b=pH821btRYS8rT5PMEn1FaVsmhBnqu62kvGZ8J/jcKDiqsWxcTd9MAVcw7ZNc2z2kF1p3/Q0uPTIPtiR6a7Pk283RJ5RVz0r+uGgzh7Bw4KuQnupVJgnx8BtXQY+zEL9y3dZc/Jec0vuuLRhaH6hdo+UMF0OZ28Qb+xIOXUIqzyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771061272; c=relaxed/simple;
	bh=XqrIJkngJbnl6RlMSFsNpsnRJcsI3jBTQ2HPUL24bEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFs07kXk3ZHUVDf0i+RfuzJpUfK5piDZrLyQouZTNTgozOtWSIw4tdGWf4xm83WiuADs2lkOH9D/Q7hTPSZvMI3GbuToVPKAPsTERCW+BkCND+E2Q0ahsViq44UDEnuIK9w4TLQjT1Ds8oK/arh2xWB8qEuZz45gVoBOc6G70WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKK8y51C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKK8y51C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31537C19421;
	Sat, 14 Feb 2026 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771061271;
	bh=XqrIJkngJbnl6RlMSFsNpsnRJcsI3jBTQ2HPUL24bEE=;
	h=From:To:Cc:Subject:Date:From;
	b=tKK8y51C0nltdRlKhXlmgBsNyI/47TOxxxhEQNyDY8B+G7bOGEz3c7ubpMPZerJ36
	 gW0XK5Tz15Q6WoQvi8M/lju3y1QIxWYuXaK934sUl95tw0KXd1Lt6TnDDtq4yRREjf
	 GjIUBKybjcwv87AdlpDekChWdZO3PzbCk2J58kUCjAyWtnTSLYpetuY0P6efkmpYbV
	 FxqhrHs/5FmQzvyPyiZQtvVd7EVGiLclIfKUS1LnWuUXMr9xzFJFmBNQjD3371PgK/
	 AGTRn8lgxt/OsTSLMLRjezF6XWr0Bt0m8AB4/GFsXnGKVLLcFq+maWqYPWEOzIBI7n
	 vlXIQMcPPTzHA==
From: Benno Lossin <lossin@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: irq: add `'static` bounds to irq callbacks
Date: Sat, 14 Feb 2026 10:27:40 +0100
Message-ID: <20260214092740.3201946-1-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These callback functions take a generic `T` that is used in the body as
the generic argument in `Registration` and `ThreadedRegistration`. Those
types require `T: 'static`, but due to a compiler bug this requirement
isn't propagated to the function. Thus add the bound. This was caught in
the upstream Rust CI [1].

Signed-off-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/rust-lang/rust/pull/149389 [1]
---
 rust/kernel/irq/request.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index b150563fdef8..2ceeaeb0543a 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -261,7 +261,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_irq`.
-unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn handle_irq_callback<T: Handler + 'static>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> c_uint {
     // SAFETY: `ptr` is a pointer to `Registration<T>` set in `Registration::new`
     let registration = unsafe { &*(ptr as *const Registration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
@@ -480,7 +483,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
+unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler + 'static>(
     _irq: i32,
     ptr: *mut c_void,
 ) -> c_uint {
@@ -496,7 +499,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler + 'static>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> c_uint {
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in `ThreadedRegistration::new`
     let registration = unsafe { &*(ptr as *const ThreadedRegistration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.52.0

