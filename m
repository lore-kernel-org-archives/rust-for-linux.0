Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1E233933
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786125049; cv=none; b=iudsZxdp+EImqGSCcl+wejtP7jYYa//WXV7+bose4ta/jZec+f1fdcxaerJWqjBOg3Mrw+f5m7UwNCI3Yj1qsvC8jcSJvHVtmjJYKt3309RoL9nO/mIRlj6hM4Bvkk39tbc8BMYcEk6wQYv2esYii6hHpBlrCLbx+w1LlW4NDVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786125049; c=relaxed/simple;
	bh=x3CeA13VMVGWTbJa/CNHCUW5Ewi4urB1eHhuTyyeb7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=di2xCccqUJfGNKWH0DDkeCbAQJL9V0J8fqL+2j2uPaB7412sR0b+nQND03F1y30ilhbeDaaXgF1bIUE1xj6Cje9KGfoFvjG7rmU0QVBfFX7y50iWZ7Bk9QdCPXl3Jn1nEF0L0g8TbjvKLfWTkoNUl1TksyGYu0e5ewGYt7pdWY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGEaFPpj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGEaFPpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D464D1F000E9;
	Fri,  7 Aug 2026 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786125048;
	bh=BtASWQsl2SwC952uFducW7TJCynmdYWIDvKfLJHKzyU=;
	h=From:To:Cc:Subject:Date;
	b=bGEaFPpjLORTF5qGYDMnWEMXRWeBg+v5ykY3ului7pRsdw0R8Szev1QyVSPZSWOfv
	 nQNZF8RjlBB74c8MYtKdVo0WtJxO2yZy0Z+BkjCLEZXUPOhz4Xg8WgentpgTeplXJP
	 mMhBfaoIu0raIzl8r/eviPHPMJv5gYuCCzH5+cBebc4QBPMhFFUBdWy+W4ow1WAcDI
	 qlAnWZvkUDMXGa+X2pJysgInDOOgrFKFv9H6x/nsxznvZR73T9HVwL2wHYwLvuqN6P
	 HDFllVE+TylbwruNRs3nKTX6k5g9ihHbq09ffOnuPqcKtnciwlkijSQU3P7jw9Ocjq
	 Vk9prN70xJJtQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Antoni Boucher <bouanto@zoho.com>
Subject: [PATCH] rust: bitfield: always inline test conversions
Date: Fri,  7 Aug 2026 19:50:12 +0200
Message-ID: <20260807175012.142083-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Antoni Boucher <bouanto@zoho.com>

When using the Rust GCC backend (i.e. `rustc_codegen_gcc`), GCC does not
inline enough these `Bounded::from_expr` calls:

    /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel::num::bounded::Bounded<u16, 2> as core::convert::From<kernel::bitfield::tests::Priority>>::from':
    fake.c:(.text.unlikely+0x7be): undefined reference to `rust_build_error'

    /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel::num::bounded::Bounded<u64, 4> as core::convert::From<kernel::bitfield::tests::MemoryType>>::from':
    fake.c:(.text.unlikely+0x90d): undefined reference to `rust_build_error'

Thus, similar to commit bc197e24a3ac ("rust: num: bounded: Always inline
fits_within and from_expr"), mark them as `#[inline(always)]`.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Antoni Boucher <bouanto@zoho.com>
[ Reworded to add the error and to follow our usual style and sent on
  behalf of Antoni, who found this during his work to support Rust for
  Linux with the GCC backend, i.e. with `rustc_codegen_gcc`.- Miguel ]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/bitfield.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 35ede53f2b8e..a0d089423f21 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -581,6 +581,7 @@ fn try_from(value: Bounded<u64, 4>) -> Result<Self, Self::Error> {
     }
 
     impl From<MemoryType> for Bounded<u64, 4> {
+        #[inline(always)]
         fn from(mt: MemoryType) -> Bounded<u64, 4> {
             Bounded::from_expr(mt as u64)
         }
@@ -606,6 +607,7 @@ fn from(value: Bounded<u16, 2>) -> Self {
     }
 
     impl From<Priority> for Bounded<u16, 2> {
+        #[inline(always)]
         fn from(p: Priority) -> Bounded<u16, 2> {
             Bounded::from_expr(p as u16)
         }

base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
-- 
2.55.0

