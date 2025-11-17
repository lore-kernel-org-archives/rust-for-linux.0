Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313FD2D7D27;
	Mon, 17 Nov 2025 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397491; cv=none; b=tofWoef34+fdOTTf3r1MwQRQ0yMIer1i318lekDCSgxJiYpEz4LBE9eQdwcqJEDPqZYQYKWH1Xa/S44jPVAlXoNB+WlaRgd1tpA9Shho1rwXJPfP6YXDli/Tjwkv3i1XCyFG7Q9AncOKPEI1M8g9EAvrwbiy3avM9E14dtMZSAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397491; c=relaxed/simple;
	bh=Q172/h973FAIfj678H8sal2abJGVy3dkAmRXR+Lm88Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tg5Jfx3BoahMo52AcTGjNOjZPU/B2ZRr7kkeSm+0xhIuWu4wF4KLNp0V9EPNtnE+uwon8UljmpyviscmmyqKN34fR4f/xeNPAV+VWuDbl6g6XHlTotKzOmyuuZwf0SmcRcyJyv9u7PD+Kpo5YyaE3ZS4Zg6H58h9oj00XStH69c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7RcKHOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7RcKHOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5C1C19425;
	Mon, 17 Nov 2025 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763397491;
	bh=Q172/h973FAIfj678H8sal2abJGVy3dkAmRXR+Lm88Q=;
	h=From:Date:Subject:To:Cc:From;
	b=f7RcKHOfalNUo5zkpeaQaaC0dnX0qv0rFribAZ/I/fIKCFag2YdeD+Vcjo5VzfBRv
	 SxUgJuj7ZTgu5zIeYB3GZgPnvdBo3f7l848UKq06t9XXyItBkptYmNiVkjgH871w4T
	 DQDuoSI0C+q5iBvIZSV8ZWBUgGJoTIREIqdRmYsIiCMd5VV3srRSUh4yEumzvk2iUe
	 UoAsyCJzOkRC6hhmExA94Udq4SQkYGkYMDp+3A0MYDrxDy6Yeup+92TxZSfsQW+RA3
	 oFJ/xeX9w5SgYDuFbMK7xX1InBN8WBID+ohA8XO2+IYMrquCzhf/UfKqT456MGSWKq
	 N8eGYRTK59EaQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 17 Nov 2025 11:38:07 -0500
Subject: [PATCH v4] rust: sync: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-core-cstr-cstrings-v4-1-924886ad9f75@gmail.com>
X-B4-Tracking: v=1; b=H4sIAG9PG2kC/33OwQrCMAwG4FcZPVtJ2s46T76HeKhdthV003YOZ
 ezd7SY4keEl8Afy5e9ZIO8osF3SM0+dC66pY1CrhNnK1CVxl8fMBIgUNAK3jSduQ+un4eoycCy
 MMRspCihyFg+vngr3mNDD8Z093e7Rbudl5ULb+Of0uMNx+/dHhxw4CK0EkNFZRvvyYtx5bZsLG
 7lOzEQm0kVCREJvCWJbS2jzX0J+CESUi4SMhEI8SQWxjFbfxDAML7lh4GRPAQAA
X-Change-ID: 20250710-core-cstr-cstrings-1faaa632f0fd
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1763397489; l=2416;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=ufFkxsIvUaCwMgizei3wrzGqpkkBJf4w9O/sayizE00=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFc2xkdBNxM9rRaKkR9Afw683sxNvj0HVujKdzKk4BVI5BD2gISVlwHPvgBK1FgPeN2cQUoaWgH
 SkTWCh0C58gQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
This intentionally includes only those changes that can be taken through
the Rust tree. I will send separate patches after rc1 for the remaining
changes.
---
Changes in v4:
- Drop applied patches.
- Drop rust/kernel/net/phy.rs patch; will send to netdev after rc1.
- Drop changes to `new_spinlock!`; allow callers to pass plain string
  literals rather than C-string literals.
- Link to v3: https://patch.msgid.link/20251113-core-cstr-cstrings-v3-0-411b34002774@gmail.com

Changes in v3:
- Include all patches that can be taken through the rust tree.
- Split "sync" patch into "sync" and "workqueue". Kept the tags on both.
- Link to v2: https://lore.kernel.org/r/20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com

Changes in v2:
- Rebase.
- Add two patches to address new code.
- Drop incorrectly applied Acked-by tags from Danilo.
- Link to v1: https://lore.kernel.org/r/20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com
---
 rust/kernel/sync.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index cf5b638a097d..c94753d6413e 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -48,7 +48,6 @@ impl LockClassKey {
     ///
     /// # Examples
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::alloc::KBox;
     /// # use kernel::types::ForeignOwnable;
     /// # use kernel::sync::{LockClassKey, SpinLock};
@@ -60,7 +59,7 @@ impl LockClassKey {
     /// {
     ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
     ///         0,
-    ///         c_str!("my_spinlock"),
+    ///         c"my_spinlock",
     ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
     ///         // `from_foreign()` has not yet been called.
     ///         unsafe { <Pin<KBox<LockClassKey>> as ForeignOwnable>::borrow(key_ptr) }

---
base-commit: bf724be7f00cf2cbafc105422476f6242e917a90
change-id: 20250710-core-cstr-cstrings-1faaa632f0fd

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

