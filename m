Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7141C84AA
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741852007; cv=none; b=nt70E9XqPq8MvhSiauyu7g70uab4YoIRAq/b3+xqTtBqw04F09zwyAgPEv9DtGor+oQt2hzYSQ5mHetH+DzP9wM4AStfYJ3X39+NFJ3BviQEQqb4iNNc5lOj0KNfIWmNbEKUkZr+mWZm7XDVXCNbrVInsfL0XGgVUV67s6L3QfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741852007; c=relaxed/simple;
	bh=Kcw/cri+106dKos1f1Natr9iLqISBP6t2M/k6NuJoeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+ewHQP7I5TARsruXbMStXzXZrCZaYmiHnMB2DNQP5KYgk0rC1U9W6nowOaQO6BnBRXC9CRIG1Npm7+QAAErPOFuaLqTlpYyingeoXW1kyw/zpUxarn+bj0CHMto2wpX5iCPMcpWivihKBt0oWl4fGfA+xnJ7+UDwL402b/+42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wVVBZDUw; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wVVBZDUw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741852002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A1k4rvRiNGwMmsF5RLcMl0KSYAR5wW+8BJa1JeXnczs=;
	b=wVVBZDUwJMfdTy9EFL9OKjRb4HM/biVq9ZaJh0Ar2oo+cRJH67geNPyjJXZhKgquo6Pz3I
	Wbpa/MhNEg05bLPlCgxyLOvtff4qSGAzTB/CmziQ+4OAX3PgItsWQYflwsOBo1hP15oKD9
	QgZ7J4exDWdpCXvn2EGXIGxCzjGmJsE=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Kunwu Chan <kunwu.chan@hotmail.com>,
	Grace Deng <Grace.Deng006@Gmail.com>
Subject: [PATCH] rust: sync: optimize Rust symbol generation for PollCondVar
Date: Thu, 13 Mar 2025 15:45:36 +0800
Message-ID: <20250313074537.729578-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <kunwu.chan@hotmail.com>

When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
with ARCH=arm64, the following symbols are generated:

$nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
ffff800080019e90 T <kernel::sync::poll::PollCondVar>
			::new::{closure#0}::{closure#0}::panic_cold_explicit
ffff8000805b8e04 T <kernel::sync::poll::PollCondVar
			as kernel::init::PinnedDrop>::drop
ffff8000805b8e04 T <kernel::sync::poll::PollCondVar
			as core::ops::drop::Drop>::drop

This Rust symbol
(<kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop)
is trivial wrappers around the C functions __wake_up_pollfree
and synchronize_rcu. It doesn't make sense to go through a trivial
wrapper for its functions,so mark them inline.

After doing so, the above symbol will not in output.

Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
---
 rust/kernel/sync/poll.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d5f17153b424..a4f92c545fec 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -107,6 +107,7 @@ fn deref(&self) -> &CondVar {
 
 #[pinned_drop]
 impl PinnedDrop for PollCondVar {
+    #[inline]
     fn drop(self: Pin<&mut Self>) {
         // Clear anything registered using `register_wait`.
         //
-- 
2.43.0

