Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8422A4FC;
	Sun, 26 Apr 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245680; cv=none; b=bXucE9/GFYjTiPauYFHwJjcmRBtZvnVDrKZhkJoHToo+W9uO5lJzZJExr/Oyzj9aC++r8aUiKvnuK3TX7Rig32f03y9qnV7tajbdHGgJuo6kn3JjyAwlzDUKCXTE5e7rHsOEVhJvuCX2ug+UO3giok1nyQ/Wjljy2I1QFmN0s/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245680; c=relaxed/simple;
	bh=UTSmpS84M8P1qrH4sOLaIrBb2yUIU1WXnwR772HPffk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+msB9vHIOQy6DuVjXwhUuXRLj+wX3SB7BVIBO8MRP+cBHpmKzyJoyraEIOMHBqBnUMAXcFp0BheKc3SBR7q1JpzH4ob9pGeV1yI/r5e8gSzBry9Sivkq74a410QQYn0D6PEufscy2LgPCcpGsQV0deicsR2ExGk35a/CasXVZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI447fSf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI447fSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9FDC2BCAF;
	Sun, 26 Apr 2026 23:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245680;
	bh=UTSmpS84M8P1qrH4sOLaIrBb2yUIU1WXnwR772HPffk=;
	h=From:To:Cc:Subject:Date:From;
	b=NI447fSf8T6QDFUpTln5e2NRQXdAbRV2yyIILyO36zsZuXKUMGQJWJzMwRYPwN7So
	 bzuKZXF+2AeAkv+nKxEjc+41BDZOhEdvZpFxJ7caGjwx0x+1UAGEsMeLwG7I+zLzg5
	 w29x1416poQn4sOOYo3cMmIW3DPckH5Kw1+BSzJeIkUk7+CDAeQe/vdhEypcbiU2A7
	 gdp9D7PKItSCD08+/uBs1M1GSFUGglJVL1CRyiXKThhilR4OmjjmJOR8OqFzIi9kia
	 ptVQ6y50SwD5oQ76FC8e0PHTiTNReqEgFOFBztItVI+XGepc903KvZ1Q6WtfIPaCyh
	 RsurnYMhCT0XA==
From: Miguel Ojeda <ojeda@kernel.org>
To: stable@vger.kernel.org,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 6.12.y] rust: init: fix `clippy::undocumented_unsafe_blocks` warnings
Date: Mon, 27 Apr 2026 01:21:13 +0200
Message-ID: <20260426232113.279040-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stable backport in commit acc105db0826 ("rust: pin-init:
add references to previously initialized fields") introduced some
`clippy::undocumented_unsafe_blocks` warnings [1], e.g.

    error: unsafe block missing a safety comment
        --> rust/kernel/init/macros.rs:1015:25

As well as:

    --> rust/kernel/init/macros.rs:1243:45
    --> rust/kernel/init/macros.rs:1286:22
    --> rust/kernel/init/macros.rs:1374:45

After discussing it with Benno and Gary, we decided to clean the build
log by doing a minimal targeted stable commit.

Thus, depending on the case:

  - Reorder the attributes so that the existing `// SAFETY:` comments
    may be seen by Clippy.

  - Add a placeholder `// SAFETY: TODO.` comment.

Cc: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Fixes: acc105db0826 ("rust: pin-init: add references to previously initialized fields")
Link: https://lore.kernel.org/stable/20260421111111.57059-1-ojeda@kernel.org/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Greg/Sasha: please let Benno & Gary Acked-by the patch before picking it
up -- thanks!

 rust/kernel/init/macros.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index e477e4de817b..d6e27c522115 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -1012,6 +1012,7 @@ impl<$($impl_generics)*> $pin_data<$($ty_generics)*>
                         self,
                         slot: &'__slot mut $p_type,
                     ) -> ::core::pin::Pin<&'__slot mut $p_type> {
+                        // SAFETY: TODO.
                         unsafe { ::core::pin::Pin::new_unchecked(slot) }
                     }
                 )*
@@ -1235,11 +1236,11 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
         // Unaligned fields will cause the compiler to emit E0793. We do not support
         // unaligned fields since `Init::__init` requires an aligned pointer; the call to
         // `ptr::write` below has the same requirement.
+        #[allow(unused_variables, unused_assignments)]
         // SAFETY:
         // - the project function does the correct field projection,
         // - the field has been initialized,
         // - the reference is only valid until the end of the initializer.
-        #[allow(unused_variables, unused_assignments)]
         let $field = $crate::macros::paste!(unsafe { $data.[< __project_ $field >](&mut (*$slot).$field) });

         // Create the drop guard:
@@ -1278,11 +1279,11 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
         // Unaligned fields will cause the compiler to emit E0793. We do not support
         // unaligned fields since `Init::__init` requires an aligned pointer; the call to
         // `ptr::write` below has the same requirement.
+        #[allow(unused_variables, unused_assignments)]
         // SAFETY:
         // - the field is not structurally pinned, since the line above must compile,
         // - the field has been initialized,
         // - the reference is only valid until the end of the initializer.
-        #[allow(unused_variables, unused_assignments)]
         let $field = unsafe { &mut (*$slot).$field };

         // Create the drop guard:
@@ -1366,11 +1367,11 @@ fn assert_zeroable<T: $crate::init::Zeroable>(_: *mut T) {}
         // Unaligned fields will cause the compiler to emit E0793. We do not support
         // unaligned fields since `Init::__init` requires an aligned pointer; the call to
         // `ptr::write` below has the same requirement.
+        #[allow(unused_variables, unused_assignments)]
         // SAFETY:
         // - the project function does the correct field projection,
         // - the field has been initialized,
         // - the reference is only valid until the end of the initializer.
-        #[allow(unused_variables, unused_assignments)]
         let $field = $crate::macros::paste!(unsafe { $data.[< __project_ $field >](&mut (*$slot).$field) });

         // Create the drop guard:

base-commit: 59f8529e78a2fc581c35fbed58169f5e8c79b8d7
--
2.53.0
