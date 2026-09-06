Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34393DDB07
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788679041; cv=none; b=TYS+OOq77lUrpHKiDqk/TPBk9DJDhaoh0zDqDXWrQ7g2H8Mqi8s76Z3v98Dh/rnOSKj6S7LeAQjRvCl4LjeiV5gLF2YN8ssgst++t3CAf5jXKzRwxGrU1qj1QMsiIah4FFx8ZNd0JJkAalHdPJEbIrP8KpWLQ2i5XQYAxJiYLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788679041; c=relaxed/simple;
	bh=1Ri6jWwNAKWKJpRPAfcZVQJ0GPmWeJJo7bFkWZHv8sw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbEXVblXsAdph8qR00I0bIBsBUVhx2RvqgVNsiJdr9T3277OxI4YhSSkt0D3iL3ysVVC53B+TpOOnnYqrghzZB8mEU72sJrEeMGsufrcIWL+KRYqUsla7QkiR9pStDrfjsAEQl7ohmo9hFdvkpZw1fXQie6TAUwlY6STwiSpOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Y6YBnGSs; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Y6YBnGSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788679027; x=1788938227;
	bh=/Y/AqUbNVZkajcwTPWzScwSYtBpnkVaFtxCp5vUyZqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y6YBnGSszgnzggGcxruBxFRZbaU7ixlet0MKmZWhz1WIvXMeRQt84Z6y7swCjKVog
	 2l/uhk4u9k7KbPt9rPz0PHyuSzbyJyv9OOyslyVXPGA0yY+V3paoKtHjoPI8IJQA1I
	 6Auxa73h0zJ36a2oXPVKqOxC6jzxoJXa8xJ/Aw6gtmY+iQQ5RzWIyDs1U0p9WMJCTT
	 pYmpD7xrtCz7zQsSpZTr4IApfuE4H/ZlFQ8OJgDLD+DJozclODl/6sGsvC+p2az9jK
	 KDxJ45F/b9SU7XmhKQvTIDA+vNQJ11uGMUp+6WtlHZojtDmdP8/nH9Gw6T64uhMM2j
	 4P1wE7zTz+e3A==
Date: Sun, 06 Sep 2026 07:17:01 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 2/3] rust: uaccess: migrate to zerocopy's `Frombytes/IntoBytes`
Message-ID: <20260906071635.160615-3-sagartaunk@proton.me>
In-Reply-To: <20260906071635.160615-1-sagartaunk@proton.me>
References: <20260906071635.160615-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 8e891fd18680e461b03150e2c665a4baffc537b3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace explicit imports of `transmute::FromBytes`/`AsBytes` marker
traits with their zerocopy equivalents.

Link: https://github.com/Rust-for-Linux/linux/issues/1241
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
 rust/kernel/uaccess.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..d93c1a21f324 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -13,7 +13,6 @@
     fs::file,
     prelude::*,
     ptr::KnownSize,
-    transmute::{AsBytes, FromBytes},
 };
 use core::mem::{size_of, MaybeUninit};
=20
@@ -525,7 +524,7 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
     ///     writer.write_dma(alloc, 0, 256)
     /// }
     /// ```
-    pub fn write_dma<T: KnownSize + AsBytes + ?Sized>(
+    pub fn write_dma<T: KnownSize + IntoBytes + ?Sized>(
         &mut self,
         alloc: &Coherent<T>,
         offset: usize,
@@ -599,7 +598,7 @@ pub fn write_slice_file(&mut self, data: &[u8], offset:=
 &mut file::Offset) -> Re
     /// Fails with [`EFAULT`] if the write happens on a bad address, or if=
 the write goes out of
     /// bounds of this [`UserSliceWriter`]. This call may modify the assoc=
iated userspace slice even
     /// if it returns an error.
-    pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
+    pub fn write<T: IntoBytes>(&mut self, value: &T) -> Result {
         let len =3D size_of::<T>();
         if len > self.length {
             return Err(EFAULT);
--=20
2.55.0


