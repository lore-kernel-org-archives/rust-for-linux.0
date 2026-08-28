Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4444828506F;
	Fri, 28 Aug 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919942; cv=none; b=oMoUDUU+rCEvgJMQ+wP+DFjnuONkNb0MCRptCdmw/Qhu2nqDbiZI35Ekj6bEVWqgp8CW6UPF1TpGRfVV3hhor0K6aB8hMEPoVLVNQrAZItIkB6DdNRsgXe/i/MBUu6cQhuvKCrRSFcRN4PTR2c/xN6WrI4JpYeo3HNPFAwoSq7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919942; c=relaxed/simple;
	bh=IFJThm7Quy7+3iM7IFmU2YRvj6HpIh0yQPYV1PnWIXs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l7KyhZjn9oc4vk5Z0NVHeEkV3ZVjAuNaJ5Q2PYvJE8rFoCXN0l631zznLbpI+vFI+1HedxCeyOWBBxWT29pYjO7HSoamT2lHef1SRbNKwdNV+y6K1GaBlv27AOCBGvprxKVJYFvKj8szmj/3BMIOu5rAZfWktlhwIPGsw1FPs0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=J6DxClv7; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="J6DxClv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787919917; x=1788179117;
	bh=ioc7N/DHyC2OCX29/pnKy6AAZr4x86kUrEuq9zrZ/tg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=J6DxClv7WR0xRLaoZXGbJ2zqHH4sC45IKmRr+N1Odo/Iskc0A1vfmUjoR+sS/dWLO
	 T0f/O+3XHUCToC7OTdirKFNiWxTbqWikoNn3UAFEgIERnGP8gHCilM6IK8WXUgOkiw
	 zggRsCGmU0+2sk7e68nVD+iuZB1k5geuxDdEpl1QsZSO8AWcBHOmskGR1m49M2RLt0
	 mt2h3btoqHaitC+G5UCzc7EbQhaGpH97/O2UOU6dniylocOciuI6G9KPhvI80/KAAq
	 ZXPD6ewphszrss7KWa0wvTQf2XuaAJDfZtCDD1LY052FKav9eJBCz/Up5C51FccRKJ
	 A57Vdfmy/kVwA==
Date: Fri, 28 Aug 2026 12:25:11 +0000
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
From: Nils Lehnen <nils.lehnen@proton.me>
Cc: Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, Moritz Zielke <moritz.zielke@gmail.com>, devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Nils Lehnen <nils.lehnen@proton.me>
Subject: [PATCH] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
Message-ID: <20260828122444.475-1-nils.lehnen@proton.me>
Feedback-ID: 188354734:user:proton
X-Pm-Message-ID: 7c6534725af5e162780d73ab9d99593e74e429ce
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Benno Lossin <lossin@kernel.org>

All types in `bindings` implement `Zeroable` if they can, so use
`pin_init::zeroed` instead of relying on `unsafe` code.

If this ends up not compiling in the future, something in bindgen or on
the C side changed and is most likely incorrect.

Link: https://patch.msgid.link/20250814093046.2071971-7-lossin@kernel.org
Link: https://github.com/Rust-for-Linux/linux/issues/1189
Signed-off-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nils Lehnen <nils.lehnen@proton.me>
---
Resend of Benno's patch from the Zeroable series [1], as the issue [2]
asks; same shape as the security.rs resend Miguel confirmed today [3].
Rebased onto rust-next: one context conflict from the
`as_bytes_with_nul` -> `to_bytes_with_nul` rename, resolved keeping the
current name; the change itself is Benno's, unmodified. An incremental
defconfig build with CONFIG_RUST=3Dy passes, so `pin_init::zeroed()` is
fine in the `const fn` context.

Moritz sent an equivalent patch earlier [4]; Miguel's review asked only
for a formatting fix and no v2 followed.

[1] https://lore.kernel.org/r/20250814093046.2071971-1-lossin@kernel.org
[2] https://github.com/Rust-for-Linux/linux/issues/1189
[3] https://lore.kernel.org/r/CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi0=
4y5sfQ@mail.gmail.com
[4] https://lore.kernel.org/r/20251030-zeroed-of-rs-v1-1-1c46d025128e@gmail=
.com

 rust/kernel/of.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index d0318f62afd7..75d5004d2221 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -31,9 +31,7 @@ impl DeviceId {
     /// Create a new device id from an OF 'compatible' string.
     pub const fn new(compatible: &'static CStr) -> Self {
         let src =3D compatible.to_bytes_with_nul();
-        // Replace with `bindings::of_device_id::default()` once stabilize=
d for `const`.
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut of: bindings::of_device_id =3D unsafe { core::mem::zeroed(=
) };
+        let mut of: bindings::of_device_id =3D pin_init::zeroed();
=20
         // TODO: Use `copy_from_slice` once stabilized for `const`.
         let mut i =3D 0;

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
--=20
2.43.0


