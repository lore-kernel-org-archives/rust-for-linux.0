Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F12030CD8F;
	Tue, 20 Jan 2026 21:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768943612; cv=none; b=Z81KJCFc/hUH9OXYd0VIE+0sghWdktUb9HmBPe7aFHKtzd7v+8XF4Tdahrats+ZLsOjDQpUYHyAO7C0dbHZK5NoP8DcIE4siOT9K5rhfHUd7TcNNLms6RBbVqOfqL3bbz5DsV4gEB0I63E7MPDNWw+3CNc7yDrLLILQ2DtF829M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768943612; c=relaxed/simple;
	bh=QaPqJL6l3PJxwwQDaIxKNSe8mIzi+rwNhFz/apY0zxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A3NVln7aAti5hPRHE2zNhv7whegh1wF1cpjxWxGiHHE4kILelu2tzgg9ts6PY2b4QFhVq0Hmd0Dm1KqoDN9voxem/iKhjx746TcbAv+N0qkja2s021NxjAAR3lP2JYm8ui6/7rQ5W5o84Xm6kEhNiTTINnsZUBCfcINuy7Vvug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uj2UI0oV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uj2UI0oV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FD9C16AAE;
	Tue, 20 Jan 2026 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768943612;
	bh=QaPqJL6l3PJxwwQDaIxKNSe8mIzi+rwNhFz/apY0zxo=;
	h=From:Date:Subject:To:Cc:From;
	b=Uj2UI0oVrJ+PbmzMht37EGXnW3uagNu8MQDBxUNJLl+sgVERGg7Y1H1usFpCbwsZX
	 Q97ixNW70a85pu+14Rv/EKHBhg11StRpSnVwkt5cowA9IjfZQWyeZg9SQs3VFOWTg3
	 lE6ruXQyK2AqyelC89VcW48lsL2VofVcHYJjqWieYp9g/UQpoTPrBvUnE9HF6LbTwW
	 H+vzQKTUcuXRvhe1HXT/DW/acLlAYHdgLQHQ7JyIXTa6ZFF6a13l6NNVZrNuLqKsq2
	 s8UhRO920Mycn+tOO+vivWIh0j/8g0KkVW7r0JNmz/05l2hJS3XRypaNPQPa6vlX8F
	 1uZfNpSJ/XEfQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 16:13:19 -0500
Subject: [PATCH] rust: sync: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cstr-sync-again-v1-1-2a775a2a36fd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0auQWTsJEJXQqzQuEEYcF9gwrdEQ7
 i7V5Vv830CoMglMqkGlFws/y4A5KIj3UDIhp2Gw2p61sRqjrBXlUyKGHLjgyRub3NF5rz2Maql
 04/fvOF/+lu36oLjuG+j9C+JhDC9zAAAA
X-Change-ID: 20260120-cstr-sync-again-5912d7479909
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1768943609; l=1385;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=QaPqJL6l3PJxwwQDaIxKNSe8mIzi+rwNhFz/apY0zxo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKAxjYsezEb0D8kH/oTlrvBSJ8Zff/9FN5Rjqf9brPZ5oFrvDY74SkRWQiztni7S3CXw9CGaRJn
 w8wbD9bE23gE=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
This is the same as my earlier change[0] but applies to additional
code[1] which didn't make it to mainline in a timely manner and is now
queued for v7.0.

Link: https://lore.kernel.org/all/20251117-core-cstr-cstrings-v4-1-924886ad9f75@gmail.com/ [0]
Link: https://lore.kernel.org/all/20250811-lock-class-key-cleanup-v3-2-b12967ee1ca2@google.com/ [1]
---
 rust/kernel/sync.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index b10e576221ff..993dbf2caa0e 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -126,13 +126,12 @@ fn drop(self: Pin<&mut Self>) {
 /// # Examples
 ///
 /// ```
-/// use kernel::c_str;
 /// use kernel::sync::{static_lock_class, Arc, SpinLock};
 ///
 /// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
 ///     Arc::pin_init(SpinLock::new(
 ///         42,
-///         c_str!("new_locked_int"),
+///         c"new_locked_int",
 ///         static_lock_class!(),
 ///     ), GFP_KERNEL)
 /// }

---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-cstr-sync-again-5912d7479909

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

