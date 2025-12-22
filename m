Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878C829A32D;
	Mon, 22 Dec 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406956; cv=none; b=ZQfaWvvHI6nQocchhBcAkQHwd9N9s9DMBRHtr99vTz7TGhvYx+OsqSktwKRUy9gDueGsHsVgwUF6JgYzQu11wFQxNKYVm4l6VM7C1BA52UDhZwFEKn7Rjq4lfPB59A68MJzDLKdxsPhbKckXV5mX6fh14rgEVvJXCnyls43TIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406956; c=relaxed/simple;
	bh=dYSg3oVdufgzL/W13arMrKcCV9A5JJmzSffp3kHFq2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmW1hAwlYNPyJIe8zwz4cJUFxqFafwEFxkxvswViKNL2B3B92TgDqcbs0be0PfMX94D6bF9Clqc9GFQGnS050gYzKh5NBeK/9/iABce3efps/UYA1LyE7ZC0Yq7Jyiozy5KsPTVL9XBi70cnDaxTfKi+sA7zb9BPIzIfBRDH+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQJ3rFx9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQJ3rFx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1AEC113D0;
	Mon, 22 Dec 2025 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406956;
	bh=dYSg3oVdufgzL/W13arMrKcCV9A5JJmzSffp3kHFq2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bQJ3rFx9gdZltXZP5dI/b4heuDpQYfRDq8bl06P0xY0Qj7D6U+5L4Jv2QFuVlxY5d
	 y6AzXtJXe3YzzznTSlssJSWQ1eS5oEW99631jV4r4kwL7u+Xn9t6G5CryyXZAnI7X1
	 roNNhB2EC/CnSwV87jhipE8x1WMk70srzfaxYHhoaGjs+5JJIJTZ+Pus6SLFlaZDFQ
	 pDeq52SnfjJr0znYGOu+0H8f3D9uIdmMH73oUZH8OeLsiCWyUCYdt+3QSkaiAWTbGV
	 tNQKP17bpSnEiuGuXoBLcHGEVbbPGu9gAy/DzmkgTRQWX2PqcYmHh1yinmtQjlOpkl
	 BpvvcpFzs8ivg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:35:31 +0100
Subject: [PATCH 5/7] rust: irq: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-driver-core-v1-5-1142a177d0fd@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406931; l=2062;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=L02rHNwqlKnpUDu9cZ6amzsQm+VwhgqPRTW13V9PPFY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAndKJlAuFBouzwIkP/nWdHkSbKLG9+X1dNneKVFcKXvJWT2QhHGrqr4ZNGsYH/np9kyxmFjuMx
 XhkMiHAA6+wA=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/irq/request.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index b150563fdef8..67769800117c 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -139,7 +139,6 @@ pub fn irq(&self) -> u32 {
 /// [`Completion::wait_for_completion()`]: kernel::sync::Completion::wait_for_completion
 ///
 /// ```
-/// use kernel::c_str;
 /// use kernel::device::{Bound, Device};
 /// use kernel::irq::{self, Flags, IrqRequest, IrqReturn, Registration};
 /// use kernel::prelude::*;
@@ -167,7 +166,7 @@ pub fn irq(&self) -> u32 {
 ///     handler: impl PinInit<Data, Error>,
 ///     request: IrqRequest<'_>,
 /// ) -> Result<Arc<Registration<Data>>> {
-///     let registration = Registration::new(request, Flags::SHARED, c_str!("my_device"), handler);
+///     let registration = Registration::new(request, Flags::SHARED, c"my_device", handler);
 ///
 ///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
 ///
@@ -340,7 +339,6 @@ fn handle_threaded(&self, device: &Device<Bound>) -> IrqReturn {
 /// [`Mutex`](kernel::sync::Mutex) to provide interior mutability.
 ///
 /// ```
-/// use kernel::c_str;
 /// use kernel::device::{Bound, Device};
 /// use kernel::irq::{
 ///   self, Flags, IrqRequest, IrqReturn, ThreadedHandler, ThreadedIrqReturn,
@@ -381,7 +379,7 @@ fn handle_threaded(&self, device: &Device<Bound>) -> IrqReturn {
 ///     request: IrqRequest<'_>,
 /// ) -> Result<Arc<ThreadedRegistration<Data>>> {
 ///     let registration =
-///         ThreadedRegistration::new(request, Flags::SHARED, c_str!("my_device"), handler);
+///         ThreadedRegistration::new(request, Flags::SHARED, c"my_device", handler);
 ///
 ///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
 ///

-- 
2.52.0

