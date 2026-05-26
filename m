Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E503B83FE;
	Tue, 26 May 2026 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820756; cv=none; b=Fb93PEqLuA0HFKOxB+f7ompH3d7n9fZRrVV0FMwON1t78DmWVAkE9uQUiLTg6bwoGfgWMSNsgbm6kZrsO7DfJB49hIv2QbTkSyUFfJtpmmp3uAdVCK1Hi8yiIskf6ZM6jFEjg8kSduaG05FH8DblqfjZgLJIgqSe4Gj8k7xZjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820756; c=relaxed/simple;
	bh=LBX/QK/p5Al97nY/e+SyN3iwQBLFU2tiCHh7nRsBh9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fq7TMFZBm1Lci6TZomD3FeyRRSViKWNLrO8MREjuHBPQpP10dGF6FJQrk05M3A21YSjcf4iPuebaPGrKFsHcIQW7TUKQ+kE0qDQxkIp8KpnP5Nnt0L6kH2RQgYjaH4sPjUrX1dTFNUAcy0PB56F4Q7zB6fk1oDDnu6BjT9i1wjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2NK+Qnt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2NK+Qnt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E107B1F000E9;
	Tue, 26 May 2026 18:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820754;
	bh=BnJ0DUTozfsd1Ar2S8uzI1534gbM4pg+0/Ixpvn6/Ec=;
	h=From:Subject:Date:To:Cc;
	b=n2NK+Qnt9vm2H0JdCokhabvF+SoVE8NGoNBQ6ARDorOATHCMlKTUK8DwuAP5LEDDs
	 EsFLIQbVcCrd3+CdrJpwnHs1fYEbL85YTpmAAQmFrCR94K0fJ3UOuSKhTDTeBkX2wG
	 3F2xmAZ4wbrEOLdQgS0PWdDMaa6KSUNapYxmrpmYed3KxsgLTxr6o0HKSXTFr6YZYl
	 dbFDUraikiHH0+WW2dfkg1temHFaGFzOxAxz6GGzkT0tl8NJgfYMKTSszoHXLxqKMR
	 10eEiojv15qyqLOl5z0XRB35UMoBRYTK9ptUko9Q+75v1v/XoURWl7pH+csi5DUtUw
	 +dUpzsJs2uXww==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 0/5] rust: binder: reduce `as` casts
Date: Tue, 26 May 2026 14:39:06 -0400
Message-Id: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkwpUMSV9zAsoB1h1LRkWhsN4
 e4CXsDlS95/fxYBmTCIczYLxkSBvFtBHTJhxs4NCGRXFkoqLSuloCdnkSFEJhNhYp/Qdc4gyLo
 2FVprmrIQ63xivNF7T1/bH4dXf0cTt95mjBSi58/+nfLN++Mm5SChsBqbUmo86fLyQHb4PHoeR
 Lssyxe4HbOm0wAAAA==
X-Change-ID: 20260522-binder-strict-provenance-077c5eddc943
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689; i=tamird@kernel.org;
 h=from:subject:message-id; bh=LBX/QK/p5Al97nY/e+SyN3iwQBLFU2tiCHh7nRsBh9w=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiL86rM9rEBXJnLBJ8L2WcGLxj/kK9Y7GCSxTs50u+E
 pq7UVmsYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTP3sXI8EdO66Dsm0gFhiWz4wVNN15y2vA2/XXEj5Pln+dY5S+aGsHwV2rOaZ+
 zE1quRaQ3llQcKpJzqF+hfOtc344HpYZ7+u4uYAMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Follow up on the treewide Clippy lint series [1]. The Rust Binder driver
retains local allows for `clippy::ptr_as_ptr`, `clippy::ref_as_ptr`,
`clippy::as_underscore`, and `clippy::cast_lossless` even though those
lints are enabled for the rest of the kernel.

Fix the Binder violations and remove those allows one lint at a time.
The first patch replaces Binder pointer-to-integer conversions with
calls to the strict provenance APIs now that they are available at the
Rust MSRV.

Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com [1]

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v2:
- Drop ref-to-ref transmute patch.
- Restore various `as` casts needed for platform compatibility.
- Link to v1: https://patch.msgid.link/20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arve Hjønnevåg <arve@android.com>
To: Todd Kjos <tkjos@android.com>
To: Christian Brauner <brauner@kernel.org>
To: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org

---
Tamir Duberstein (5):
      rust: binder: use strict provenance APIs
      rust: binder: enable `clippy::ptr_as_ptr` lint
      rust: binder: enable `clippy::ref_as_ptr` lint
      rust: binder: enable `clippy::as_underscore`
      rust: binder: enable `clippy::cast_lossless`

 drivers/android/binder/allocation.rs       |  4 ++--
 drivers/android/binder/defs.rs             |  8 +++++---
 drivers/android/binder/freeze.rs           |  2 +-
 drivers/android/binder/node.rs             | 14 ++++++++------
 drivers/android/binder/node/wrapper.rs     |  2 +-
 drivers/android/binder/page_range.rs       |  8 ++++----
 drivers/android/binder/process.rs          | 14 +++++++-------
 drivers/android/binder/rust_binder_main.rs | 10 ++--------
 drivers/android/binder/thread.rs           | 24 +++++++++++++-----------
 drivers/android/binder/trace.rs            |  4 +++-
 drivers/android/binder/transaction.rs      | 14 ++++++++------
 11 files changed, 54 insertions(+), 50 deletions(-)
---
base-commit: fc1ce3afa2e61b4b15e71436ece91b0441a9f4f0
change-id: 20260522-binder-strict-provenance-077c5eddc943

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

