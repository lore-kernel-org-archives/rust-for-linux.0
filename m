Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4630F543;
	Tue,  5 May 2026 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981916; cv=none; b=Tr003RcZHOqK9FOV+bDcyk0Fk+wADnUjvX/WwaHHh/YAJboa8MQBbRR9W8Rp54nBUPb23tjfDn3jmRQREdzDVtR0CqWHYcsxdaHIAqlMCMlo8ipgW9NFWmK2u2x88DCuJ5x8qR7qTYQ643mUGTXUoNGDV6MunGepQN9xof6zyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981916; c=relaxed/simple;
	bh=fQMNWYBhKU7S4yHc6MIn2aQglZGI2jSaRZLzkFEw2HM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MspuiUIyQ3MtujmWu8V1feBmy3XERIJ8TwZwtTL+jntG6zavRoCBhmzOvrz3PH4C8Mf2hEUb19dEWvjZJwQv5SdHWjNbI3cfzlqvOs+u6eyN/6s7+J8LG3FOlbLjKpZ28ajDILjZJk3mCy0GBK59cfC8mF6KgInkQcphff5W5BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olUnTwR9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olUnTwR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF92C2BCFC;
	Tue,  5 May 2026 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777981916;
	bh=fQMNWYBhKU7S4yHc6MIn2aQglZGI2jSaRZLzkFEw2HM=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=olUnTwR9pXAi54r30X4MZiukjwqEP9H9Lr6iY4EtSjJsW3rh9Js1mAfAJV5th+E/J
	 EHGh5FvTAq6S/bvCf6QWmzdxSeyOuvvejNIf91o7rsiDpgZphsEjrFQmFYr2/cJHMJ
	 PuQZlLSP6WRm0Nj62G+dXi8jxLYpwIpMF9K4cZNI5b2NbVtBgKUEwjKn4cOTveeyG5
	 iOwkKp+Yjydg1G7N2AW8k3FCuKQKPvas3cpZsq+oMp6ojP8eM3F+HbawzHDhTvXxH7
	 6J3z0JDN2dCGZxtQ9yIB9VHVd8nrFQlZZNk1fx4rQfWqkv5ah0sxS6HJhZHR4kS57h
	 vHpwUnwBYMMKg==
From: Gary Guo <gary@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: pin-init: examples: fix `useless_borrows_in_formatting` clippy warning
Date: Tue,  5 May 2026 12:51:37 +0100
Message-ID: <20260505115138.2466966-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Clippy 1.97 introduces new `useless_borrows_in_formatting` warning which
fires on the examples as we have `&*expr` where the format macro takes
reference already. Remove the extra borrow.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
The examples are not built in the kernel tree and they're really just
examples for reference purpose.

They're, however, built and required to kept lint-clean in pin-init CI.
---
 rust/pin-init/examples/mutex.rs         | 2 +-
 rust/pin-init/examples/pthread_mutex.rs | 2 +-
 rust/pin-init/examples/static_init.rs   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index d53671f0edb8..8d4902c584e4 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -220,7 +220,7 @@ fn main() {
         for h in handles {
             h.join().expect("thread panicked");
         }
-        println!("{:?}", &*mtx.lock());
+        println!("{:?}", *mtx.lock());
         assert_eq!(*mtx.lock(), workload * thread_count * 2);
     }
 }
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index f3b5cc9b7134..7c5c78b2ded1 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -179,7 +179,7 @@ fn main() {
         for h in handles {
             h.join().expect("thread panicked");
         }
-        println!("{:?}", &*mtx.lock());
+        println!("{:?}", *mtx.lock());
         assert_eq!(*mtx.lock(), workload * thread_count * 2);
     }
 }
diff --git a/rust/pin-init/examples/static_init.rs b/rust/pin-init/examples/static_init.rs
index f7e53d1a5ae6..3f4d4e20216b 100644
--- a/rust/pin-init/examples/static_init.rs
+++ b/rust/pin-init/examples/static_init.rs
@@ -119,7 +119,7 @@ fn main() {
         for h in handles {
             h.join().expect("thread panicked");
         }
-        println!("{:?}, {:?}", &*mtx.lock(), &*COUNT.lock());
+        println!("{:?}, {:?}", *mtx.lock(), *COUNT.lock());
         assert_eq!(*mtx.lock(), workload * thread_count * 2);
     }
 }

base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
-- 
2.51.2

