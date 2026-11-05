Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893397;
	b=gP/tRofWczXz55ElKmDXmUeg7v622YyIK0V+FRUEg/XBtA3Wb5EySVeq4jq+5jJggwXZ
	 +PNdq1pSxyp7/oql3bZ9qcv0ozwVwEFeLjoXh9sC9T32mX6O/rXzl9EWeE1Eaest+yU3n
	 0W3Ttcxl3zN6RdZwhqxIdZnDAjNxI2CneSoxJXWNJZEjUOZnoohBblXyH1TALtY/t8UFG
	 Geap6gG60gM+WCs1TxBXtycQ/tNiVtX6fWvH9NzL9Ug97cf91KbYp3HPFzD0Md3Gi7icU
	 /uGbBer9bfUeNBc9/IAPv0e7HbXdPjPEpKQCXmctQ8nv+ghg1Pze/ZzCRgoPfJ65L5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893397;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XVHg8rCc4dXHGWkUjDjDTvbKqDG1Es1+qQKKZdsLPmw=;
	b=4HHba03RA4PcNfeZtB22Sirt+WIJemHD3mmnxa1qpNragTVIhmyxfg+TgXK+Ws3JFGbZ
	 +OtxORN47/vjK+2In2LcaB6al1PC0727HXOGsHE1XLzX1GJPJlVm9QV7LegkEfrECyxle
	 IAl8cQFMfLByG4X1HzHNMP9yVwH6mWJnjgvUd8sqZDf0KSfLiGxfPJFnpAWcbgerJZhp0
	 vaYdDxRe8RyRMY9dH/4QeWbCOc0TO9ZbtkR/45LbdYOlMDvMo8RCRbaBDAIO/OBruCTqW
	 jwuMe54mE5ncFaYprVu6wx5ua7ViBy+KGHTWY8labklOqCZAbon5j8KDs0aQwgbiqAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aan6Q1i8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B5606A337;
	Thu,  5 Nov 2026 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aan6Q1i8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCF71F00A15;
	Thu,  5 Nov 2026 15:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893396;
	bh=XVHg8rCc4dXHGWkUjDjDTvbKqDG1Es1+qQKKZdsLPmw=;
	h=From:Subject:Date:To:Cc;
	b=Aan6Q1i8Osgd1DpoaIQnMNgBdVa5TjSkZbHwbKsYe6ne+WW6rH8qbumzt+ejd9zBZ
	 cn7f2dN/GNtk0zQ0UCb8qKJXTTg5wnHNz068mbdSVFeDktt+QI3sIAAeN2hoaxFqCt
	 vYeqXDypNfPAZ55tJXBgtZqHNoD3J/bavFceVXf7+ejUHeSA85V0Sc7/c71yMnfrr0
	 M6bcg0mpamuAW6lRgGqHyROBPEFKxGwMtFbK5HmUuVF5aftETPdJIDZ8dATUbot8ps
	 A+LQfaQo62D1wwYcS5eqlfNVeYC+e7yzmVYb43YWt9avcBYl3ntlh84RDQsOr0NQAI
	 Wo0TSk0tLOArQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v3 0/2] rust: impl_flags: add convenience functions
Date: Thu, 05 Nov 2026 16:42:43 +0100
Message-Id: <20261105-impl-flags-additions-v3-0-5b17c01c2b15@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOj7GoC/32PQW7DIBBFr2Kx7kQwxtjxqveosgA8OKg2TsFFq
 SLfvdSp1HTRLv9o/nszN5Yoekqsr24sUvbJL6GE+qli9qzDSOCHkhlyVBxFA36+TOAmPSbQw+D
 Xsp+A15I7Z41uzJGV6iWS89cd+3K650hv74W+3ofM6ERgl3n2a1/l9iAhWsEerX317cRHpw+BI
 lgljq002BrR9blmX46zT+sSP/ZPstgl/x+dBXBQTd3ZzplOCvv8SjHQdFjiuBMz/lAU/4uChcI
 HbFGik4qbX5Rt2z4BdyUoumMBAAA=
X-Change-ID: 20260215-impl-flags-additions-0340ffcba5b9
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2934; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=HCuFUWDeHns1IU4/tw3GzxH+24Pb3iHCfGvwFidDSIk=;
 b=kA0DAAoB+lApCKrFvdAByyZiAGrso/SgPCc7Oyx3vMGJTevTkJD68xKW1xYwgiplCSE+f+vgY
 4kCMwQAAQoAHRYhBFeK2cjZZnYmKsBqhvpQKQiqxb3QBQJq7KP0AAoJEPpQKQiqxb3QK7MP/0Bi
 QkBH3YqH4sFMJyol1mvQEj3go0w0ivZJGmxY1pjPNx0Og+l4L748KJmxYbv1CpBtSpgfJnlr1XX
 LRrQ5iIrstvjHu/3IWnzVnRrRAM5zbnN0Y7/elJ9HoXjhpp5t9UdNveuWgkq2KKZ+T8Nl8ZfLli
 9TwFoil1+kZ/5BEwxBUyIKN3WCOGUwIh2unTd529N/iJc/7BlG6gVneFfwqpKzC90yiO1kUnw7C
 1B6IhMbD7lOhLmyYVBbdF22cpBgs/mVpDPlZLiPVI4//dxJfUsMlPhYO1smCOi/ZXLdUApaP+5K
 x+J5NTPKg7251jc8pjUOXqdzFM4TRHrDJy64LGlZpfOF6qzzDt42eLW3pm20JrXqWMoYMEV5Eyu
 WRVBtpcacwChevK/8eQk163Zrs5NpvtRCpLv45wdWZ38bS3VJgALeaUl/Tz+1Dyw/w6K6k2Dpiw
 3py+ilNnnACn9BCI5zmkBAvfX7Q8B9dklsoyOegXLF6yCdbMQyOpubYMWgoF6lU8F/nhaN4M66V
 5z819JU2yPGnzs0yJthrhSr/V7dpmJy6x8Y4pt6TECs/FdQoiAkGdNrNjj7JJOFGANYRdvZIKUy
 9o2KTv26C+Ph/Y3slZ99I/zzloQ3vTy83AXCW5c5q0W9k8DZAmo1MpZ4+yLVbCxdm8jI1Eqq/Fh
 DGF62
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a few convenience functions that makes it easier to work with the
`impl_flags` module and C APIs.

These conversion functions are useful when assigning flags to C structs in
Rust abstractions:

  let mut lim = bindings::queue_limits::zeroed();

  if self.rotational {
      lim.features = Feature::Rotational.into();
  }

  if self.write_cache {
      lim.features |= Feature::WriteCache;
  }

Or when providing flags from C to Rust:

  impl<T: Operations> RequestInner<T> {
      pub fn flags(&self) -> Flags {
          // SAFETY: By C API contract and type invariant, `cmd_flags` is valid for read
          let flags = unsafe { (*self.0.get()).cmd_flags & !((1 << bindings::REQ_OP_BITS) - 1) };
          Flags::try_from(flags).expect("Request should have valid flags")
      }
  }

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Use `Self` instead of `$flags` in the `TryFrom` implementation (Miguel).
- Drop the hand-written `TryFrom<u32> for VmMapFlags` in
`drivers/gpu/drm/tyr`, which is equivalent to, and now conflicts with, the
implementation generated by the macro. Without this, tyr fails to build
with E0119.
- Expand the commit message of patch 2 with a before-and-after
  comparison of the `gen_disk` call site, the alternatives considered
  (`as` cast, explicit `From`, container temporary), and the trade-off
  of offering operators on the underlying type (Miguel, Gary).
- Use `pin_init::zeroed()` instead of `core::mem::zeroed()` in the
  patch 2 commit message example (Miguel).
- Rebase on v7.4-rc1 and on v3 of the `bits()` prerequisite patch.
- Link to v2: https://msgid.link/20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org

Changes in v2:
- Use an `as` cast instead of `core::mem::transmute` in
  `From<$flag> for $ty` (Miguel).
- Replace the `match` in `TryFrom::try_from` with an early-return
  `if` (Miguel)
- Construct the result directly instead of via `transmute` in `try_from`
  (Miguel).
- Use `Self` in the new conversion impls (Miguel).
- Mark `TryFrom::try_from` `#[inline]`.
- Extend the rustdoc example to demonstrate both new conversion
  impls (Miguel).
- Link to v1: https://msgid.link/20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org

---
Andreas Hindborg (2):
      rust: impl_flags: add conversion functions
      rust: impl_flags: add bitwise operations with the underlying type

 drivers/gpu/drm/tyr/vm.rs | 13 -------------
 rust/kernel/impl_flags.rs | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 13 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260215-impl-flags-additions-0340ffcba5b9
prerequisite-change-id: 20260212-impl-flags-inner-c61974b27b18:v3
prerequisite-patch-id: 4f477e1886497d4ba3898867e2765c7324b62ba4

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


