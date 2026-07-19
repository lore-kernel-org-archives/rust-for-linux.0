Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D1382286;
	Sun, 19 Jul 2026 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784455022; cv=none; b=pdMIaLqYO0JcvvL8yq55SHw/LxFkklmcDhDa0Qe6/jRw6KmNxSmGpMuwFPDsejQlJFaHPYc6GZ4VbuRjifsxmiYVE9KGeF7p2QNVHHLZfpvGXDtZZX4uU0xDR0l79jJSKapIxkIDY1oTYEj/XNfZKbbwvN2PbKVlecoN7vZTGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784455022; c=relaxed/simple;
	bh=XhzX01iuK8q6iUMm0djlscTXc59T2XaPn4Us2HkbBRg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DFbFLTOk/3CK6emWVVeZVHB8QP5uV1+m+xyVY54wir766+DG5Hq51OBRCfyXY7FDrutVDYeLwEFfLVcFd2s57ZJJfcHJ+IE7s/ttDhpJE8luGO01+rxYrdHjY82jc4gnr4b44Xlb/Io7lrOzcBklhmxArum8Qg4e66JINq+OuDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOE4mMCZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOE4mMCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76AB2C19425;
	Sun, 19 Jul 2026 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784455021;
	bh=XhzX01iuK8q6iUMm0djlscTXc59T2XaPn4Us2HkbBRg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SOE4mMCZmsnU9jzeZGdVy3PINSzB/oFyIrbxFU6OQYljhxwOojU2A1elHkxwaYBxU
	 K/Uvs1OzF0Xkh6fM8E7LSBj064Eo/8ewdakA7kUzFKrVYWPcQ4Cpimnn0uXu6hdJNp
	 R4Wv5dWzheIgacWN+YtQqJICZTVT1NXxVMwYfcAOwofq3J6I2320d96QvHI1TRYq/x
	 RzAKNofKr1Vr1Q+QdP6Gu3O9mnLQpt0FBmUlNAHui697MU79rHeXqPu/cHe1l9cZZt
	 6ykkw5V7WgKo3qMDZ/owgRqFXt8taiexbwNp68a7z95VAlIOeoGQm9TH3gVC7WAwJs
	 anSTZXfwD9HKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55477C44520;
	Sun, 19 Jul 2026 09:57:01 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Subject: [PATCH v2 0/2] rust_binder: Update bitmaps to use
 kernel::impl_flags!
Date: Sun, 19 Jul 2026 09:56:57 +0000
Message-Id: <20260719-b4-rust_binder_impl_flags-v2-0-7a5debdfa39c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmfXGoC/32NQQqDMBREryJ/3ZQkGlu66j2KiEm+8YMaSay0S
 O7eVOi2yzfDvNkhYiCMcCt2CLhRJD9nkKcCzNDNDhnZzCC5rPlFKKYrFp5xbTXNFkNL0zK2/di
 5yFCVukJtuquykPdLwJ5eh/vRZB4orj68j6tNfNOftf5j3QTjuZZc2LIXSpd3570b8Wz8BE1K6
 QOfihsZwwAAAA==
X-Change-ID: 20260715-b4-rust_binder_impl_flags-e53b4ebca85d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784455020; l=1893;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=XhzX01iuK8q6iUMm0djlscTXc59T2XaPn4Us2HkbBRg=;
 b=Q3q/KQXqhmTBtJPM8ShcHpKbtEGsWTEqHnb1AmQmVAB+HqMO/Qe4UySi5FKTMHdlOoCBdXL8a
 /uxyx+utWQyBRFeZTU+4lVqUV42m4TdUtmXrblHgJxW7hYsugc1q5uP
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

In the current Rust Binder driver, internal state variables (thread
looper states, deferred work, and transaction configurations) are
represented as raw integers and manipulated using manual bitwise
operations.

This approach lacks type safety. Because the compiler treats all
integers identically, it is possible to pass a thread looper flag
into a function expecting a transaction flag without triggering
compile-time warnings. These cross-contamination errors compile
cleanly but can cause runtime bugs or undefined behavior.

This patch series resolves this issue by migrating these raw integer
bitmaps (`defer_work`, `looper_flags`, `flags`) to strongly-typed
bitmasks using the `kernel::impl_flags!` macro. Functions now accept
specific, distinct types rather than generic integers, preventing
flags from being mixed up. This transition also replaces manual
bitwise arithmetic with readable, safe methods.

Based on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
Changes in v2:
- Drop Patch 1 (defer_work) as it was merged into char-misc-testing.
- Rebase remaining two patches on latest char-misc-testing tree.
- Link to v1: https://lore.kernel.org/r/20260716-b4-rust_binder_impl_flags-v1-0-b4201d3f15b3@google.com

---
Jahnavi MN (2):
      rust_binder: Update looper_flags bitmaps to use kernel::impl_flags!
      rust_binder: Update transaction flags to use kernel::impl_flags!

 drivers/android/binder/thread.rs      | 68 ++++++++++++++++++++---------------
 drivers/android/binder/transaction.rs | 58 ++++++++++++++++++++++--------
 2 files changed, 83 insertions(+), 43 deletions(-)
---
base-commit: 2cedf2272f1bb42471e646868ac572cc5752bd91
change-id: 20260715-b4-rust_binder_impl_flags-e53b4ebca85d

Best regards,
-- 
Jahnavi MN <jahnavimn@google.com>


