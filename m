Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE16D41C62;
	Mon, 22 Dec 2025 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405560; cv=none; b=bcs4RiJZnAxpKgdYpqef0PsJgH4BzOvYX1xEN1jy2jI49R3Qr0m7ixvez19ELDAwmMjqsaKqEBzfzifTpwcQHChctf2idvZYNZSoTDElaLY97S3Jn+s/sKTLFO+FAhymw4e2LGv1fUIv7afV3xScwaPMRdOqQB2gTDTWcBWmqXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405560; c=relaxed/simple;
	bh=OcSEG+YKDqVTtqxdYcjWdAL2Ur2/noKCQGBuknD0dQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mBhBq2ZSZgXwj0HfO3Tcu0bWf+WMSwgXVwVwkITgtobo+IkO7D65qswHKkxhI6fK89bNcb5CdEXp1hfukzQcXWSiFrBhYfyNLrmttLhnPR24fggddZf5mTUJE2B6n5BGAa8ZBwNUo84wg6/wvGZsBHns6kBR93/NDfzjr5LPJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iG3hEU0g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iG3hEU0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548A2C4CEF1;
	Mon, 22 Dec 2025 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766405560;
	bh=OcSEG+YKDqVTtqxdYcjWdAL2Ur2/noKCQGBuknD0dQI=;
	h=From:Date:Subject:To:Cc:From;
	b=iG3hEU0gcR1ne9lwkqGARDqQFnn6L2sVV4m/qkj8Jxi1NYSbmCqV2lQsEBobKUqBd
	 Pt87YvSy4fFPuHQlQq1dPn7NntCOR7AofF0YDOAMxDNVtjWdmy1oTkTuZ9ukrALHs6
	 ZF4KpSL3kf7Y2t70LUNh6HTF1gotosf3GS2k1BPhqR4Ib5WhdrPFdTRz299iaa5hNV
	 GRuhY+r1PuuITCI4Vy1bvsmldLgUzcHkxzNbEbZC6N+KOkIoUGhcGc/AZGX2oLOqNn
	 fyDA12nuww2F9jQoCdQfdXT9ybF6mp3wu+RP4WWrv7z3mL+3OmbRtLI70dKlJ8WO4D
	 AYRTWQ7TBcr6w==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:12:20 +0100
Subject: [PATCH] rust: configfs: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-configfs-v1-1-cc1665c51c43@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXRkcbPVcSCmjIWJR1EIu6uW
 H6L9y4QCkwCdXJBoIOFFx+h0wTs1PmRFA/RgBkajYjKyhaUXbzj0YnKyZDJKnS6LCA2ayDH5/d
 r2t+y9zPZ7Z3AfT+joq8ycQAAAA==
X-Change-ID: 20251222-cstr-configfs-3e5e5092f187
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766405556; l=3362;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=R2h8TJvhVkm1Ebiy+pqt2x1n24zEyDBxP+3cQrB7TuI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOkmZPE7Qz/vEe/A58tSb3alGEaBu3w5nq8fqLTM3a+CVakhfSjYdbUGiBsceRwbGUv1FpGAtnD
 GPpbAOXi9+gs=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/configfs.rs       | 9 +++++----
 samples/rust/rust_configfs.rs | 5 ++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 466fb7f40762..2339c6467325 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -21,7 +21,6 @@
 //!
 //! ```ignore
 //! use kernel::alloc::flags;
-//! use kernel::c_str;
 //! use kernel::configfs_attrs;
 //! use kernel::configfs;
 //! use kernel::new_mutex;
@@ -50,7 +49,7 @@
 //!
 //!         try_pin_init!(Self {
 //!             config <- configfs::Subsystem::new(
-//!                 c_str!("rust_configfs"), item_type, Configuration::new()
+//!                 c"rust_configfs", item_type, Configuration::new()
 //!             ),
 //!         })
 //!     }
@@ -66,7 +65,7 @@
 //! impl Configuration {
 //!     fn new() -> impl PinInit<Self, Error> {
 //!         try_pin_init!(Self {
-//!             message: c_str!("Hello World\n"),
+//!             message: c"Hello World\n",
 //!             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
 //!         })
 //!     }
@@ -1000,7 +999,9 @@ macro_rules! configfs_attrs {
                     static [< $data:upper _ $name:upper _ATTR >]:
                         $crate::configfs::Attribute<$attr, $data, $data> =
                             unsafe {
-                                $crate::configfs::Attribute::new(c_str!(::core::stringify!($name)))
+                                $crate::configfs::Attribute::new(
+                                    $crate::c_str!(::core::stringify!($name)),
+                                )
                             };
                 )*
 
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index 0ccc7553ef39..a1bd9db6010d 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -3,7 +3,6 @@
 //! Rust configfs sample.
 
 use kernel::alloc::flags;
-use kernel::c_str;
 use kernel::configfs;
 use kernel::configfs::configfs_attrs;
 use kernel::new_mutex;
@@ -35,7 +34,7 @@ struct Configuration {
 impl Configuration {
     fn new() -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
-            message: c_str!("Hello World\n"),
+            message: c"Hello World\n",
             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
         })
     }
@@ -61,7 +60,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
 
         try_pin_init!(Self {
             config <- configfs::Subsystem::new(
-                c_str!("rust_configfs"), item_type, Configuration::new()
+                c"rust_configfs", item_type, Configuration::new()
             ),
         })
     }

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-configfs-3e5e5092f187

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

