Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0951FF7C7
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 02:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782958732; cv=none; b=kkdwa2V7eFfMGIjvF5QLfY/YuclPC1RCAGGDAqfn329RTpi6CeAO+WZxx/L614twQjHgwoC7ciXzyh29EqcQ+itB1r9f8bDpeQACrxHW2rHb1iGFw9RgowwaJBcQ32cCCuWXnHOfebDL8uHJM7Z7OpgUdGQ/i61F/fCI4lwg98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782958732; c=relaxed/simple;
	bh=7/ez2+THHT/9gvK9u1Jh1DBEIhlF+06iy9vkW8F9AfE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OuyXTvDgiDx0ZxW/Dvafm/0hQ528lTPrfvrSeHwBgADhoSbxHYUVvB9UAJS0ruve8N71E5e/2KckHS/shrThBRnoG5nNLy9Ih8Xi6x6QVCQO1UHJ1FIn2RcNDeaRBjgk4dpjRT/Bx+QvqUIVefoloiI02jKTayUdQiPoTxVjcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=109.224.244.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Thu, 02 Jul 2026 02:18:36 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] rust: uaccess: refactor to use `overflow_assert!`
Message-ID: <20260702021811.758731-3-contact@antoniohickey.com>
In-Reply-To: <20260702021811.758731-1-contact@antoniohickey.com>
References: <20260702021811.758731-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: 79092b06d44e33c03591bff840cfba22e1a3d2e8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Using the `overflow_assert!` macro here adds documentation to
the intent of the assertion, and avoids local `#ifdefs`s by
encapsulating the conditional behavior to the macro itself.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..f04c913f23b6 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -11,6 +11,7 @@
     error::Result,
     ffi::{c_char, c_void},
     fs::file,
+    overflow_assert,
     prelude::*,
     ptr::KnownSize,
     transmute::{AsBytes, FromBytes},
@@ -655,8 +656,7 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], s=
rc: UserPtr) -> Result<us
         return Err(Error::from_errno(res as i32));
     }
=20
-    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
-    assert!(res <=3D len);
+    overflow_assert!(res <=3D len, "strncpy_from_user wrote past dst buffe=
r length");
=20
     // GUARANTEES: `strncpy_from_user` was successful, so `dst` has conten=
ts in accordance with the
     // guarantees of this function.
--=20
2.54.0


