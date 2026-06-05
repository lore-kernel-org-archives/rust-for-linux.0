Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBDA3B14DE;
	Fri,  5 Jun 2026 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664701; cv=none; b=sCBkGQqKtwQwHF/zchbzWMAs3lsfZjjUwgfIFPXNkTokoaikhcF85dNTkFrPeY4SmTUkFzdRRhbXdethwKuu0iE9RRFfWYwhsuF+1UJfrp/uSsBDGb9lJOTDU+nZ/26uTUJpeg1qnb5i3/L64OrGdjRRc5xE5r5PKjdzDHxqXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664701; c=relaxed/simple;
	bh=yn/uFktBaRKKfNXGcAf8tIjXvcECzndSbjOXGvHYTdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IK7ber66vhQaGfrh3SVOKNRm/6fy4Q/frQB+XfIW7kEZlZLfRHKUGWb/3UZ4Bujxr0SOd06AnzUlC32jDKibHUpIbC4ld2yQIKzJ1r2V2h38ocS2Z5eqBNqQSnz8rnHA19KzwyckDioVDTxO2+1iA5sym9DnLyHgMteW5FMv1No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1VYQuxp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1VYQuxp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACC21F00899;
	Fri,  5 Jun 2026 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664700;
	bh=o8DlpVD9LgwUgxNnhayGiKLF93CI9bcGHocJqlvcBWo=;
	h=From:Subject:Date:To:Cc;
	b=S1VYQuxpwZaRfq+JcCPZqXg0WkarpD6AURyA4a7k29p86Yu+aSYTTVI10xo+BEgJE
	 T81oPvG4Mz4XckhNXnIa2eY7B4rNRKvNANWnINt6I+v5prBJOxh2iSoB9Zv6+dfqgt
	 CSzYWXKd2QTIZRtxqNm0p/mYDYuvX/ckswD9AAiEocejeAwNXURyx06bfWUD5DCUzO
	 s8LVgprILGH8YtLCiTykvHVXsqq9gnuoKJsorfs/q3WspJYLb18DywdBnpUCzytNXE
	 f/tyLFCIBIOhrxkYkvE5gOOKHUO4T+SQ4SqVOLptbLF5n3Lq4fOlxMVlkZ+Sz034Vp
	 XUPxdBREOL6yw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v2 0/2] rust: impl_flags: add convenience functions
Date: Fri, 05 Jun 2026 15:04:37 +0200
Message-Id: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGXJImoC/32Py47CMAxFf6XyeoyS0Bdd8R+IRZI6xZo2haQTz
 Qj13ye0G1Ysj2Xfc/2ESIEpQlc8IVDiyLPPoL4KsDftB0LuM4MSqhZKVsjTfUQ36iGi7nte8n5
 EcSyFc9boypwgn94DOf7dYi/XnQM9fnL6sg/B6Eho52nipStSc5AYrIJ3ay6xO9W7k72ngLaWp
 6Y0qjGy7ZKCl+PGcZnD3/ZJkpvkc+kkUWBdHVvbOtOW0p6/KXgaD3MY4Lqu6z8U1k33HQEAAA=
 =
X-Change-ID: 20260215-impl-flags-additions-0340ffcba5b9
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=yn/uFktBaRKKfNXGcAf8tIjXvcECzndSbjOXGvHYTdQ=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsln/ZVKz0GyKQTts7+oA8urwzMT4m6ubEw3C
 fn3Ru+/OhOJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLJZwAKCRD6UCkIqsW9
 0KpRD/oD59M2BdjmH1vMiYlreRj9zVtFKRYPYnVi6WMK7mFnDw/QUYZY+7FA9g3zRxhSrl+eOOE
 HBVpMLgmgqEGVASSqMow/0zarYmC0renRRreDDCofkJtpCAsPj7+rsUsqMQl2Lfb0xFgUl9+Jxs
 zF1e82qwsqoiDs2BC+T7HMEUuospPrGeefqn9K0g0+lXwSO+YWEaoDYlsevATEMQpYsb93YZRjr
 4VNEyROdhxi5CpeWTwRXqBKMJdhV5H4HNtq5/2nEGAieVOhppIdN/d4B7cvRntxC7gcEnN3h+Sw
 BIwyw/AkZiEecHFrt1fLferuYB+d4Jv98K92bWP+seTWKQ1usTjgZ91+tg2HxALQzzsFb9lybyC
 BVXZ9jyq/5HeEtGEvxNDH0fFdt84M/we/76fvrYQhjBZoxbRwFg1Y7LUQUtc2GKzqmyFtbZMS3O
 Wqsse/Y3YxljX3CYu+Io1OjpMK5wBzCltm4zy8iANhsK/fOqy5ICt9J16wCNIfsrBDamKfe+5Y6
 3Woaxfbyv/U9m/IaWwKf2TBmE1dTWTlO/RvtQx87aojBpCKtxTOw9VqS+ml8Oj1YfHFCzJb+N2D
 NVoTk+N+Xz432ibskWPiEa/B9yRF0rS+HiARRT+BTJAiWFEi7tXImZ8bh+VuS53Qfp2ADRp1U3f
 QNJOEKknnoX2sIQ==
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
          Flags::try_from(flags).expect("Request should have valid falgs")
      }
  }

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Andreas Hindborg (2):
      rust: impl_flags: add conversion functions
      rust: impl_flags: add bitwise operations with the underlying type

 rust/kernel/impl_flags.rs | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260215-impl-flags-additions-0340ffcba5b9
prerequisite-change-id: 20260212-impl-flags-inner-c61974b27b18:v2
prerequisite-patch-id: 379fb78c07b554278fae3c42d84d62bcfcfa0d45

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


