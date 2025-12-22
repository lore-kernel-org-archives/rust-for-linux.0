Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3EB29A312;
	Mon, 22 Dec 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406940; cv=none; b=mQ6YflbvgPzYcbeHK2G/eHFkeXU7Ubtz2Yv4r9saAPyySUxFONyv0uOO1JY8G9cuA8LSKwUt7BLZyj+s8ljoW58Un3TOQ5ot1UNIIr1vlt0FJ7YzmonmBOC0sM8c9W6VYqyTblSIuPoUTAA+8bL7+H2iaJQuXzMNYs15WUiogHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406940; c=relaxed/simple;
	bh=drUNuwKRIeYo3aZL0WqkYRPMSOhXeSndodp4MXIUrt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOleTWc32GM6elLVB6yaiooltDWFhWR56mwVXPXvHJE+JkYkHVTm/7sraQWaimOk41TjPs/rpUibGd3QQqmMz6mIqDGi5Asxb4uB0xq8dZ5SAM8ijATNwAZvVB0FHDxLJLaOEvqf4Yl5LMp55A68Zmg2FDE0KItaEyRckOCXGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYIwghCd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYIwghCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E4EC4CEF1;
	Mon, 22 Dec 2025 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406939;
	bh=drUNuwKRIeYo3aZL0WqkYRPMSOhXeSndodp4MXIUrt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qYIwghCdrvOOb4RCD2GsOTYCwiBSQCle9Np6YC3PQ21XmMrIIxkWvLI3kBYGnDf3H
	 04oI5edw4g/RsZPxwDxTr7TDA00AWkAIaPcIFCCWqUTwstgtu/HzzPbKR69MrdR3M7
	 WFU9NLh9eoCKFGGqHGNxHgwxEc9x3hQ5zooksTfX3IjxYj0sFsI7ap+NapFsdidcoe
	 HXCBHWPhDXlnjr9Yx6QAV27DLWCyF22AYfuqbu0fhtyZZ96XMCOhordMEE5QD4O2TI
	 qBa76wFK4U6j3JJhgQSr95Abe050GaTqTju0sxzUkdyEc7xaVO56BvCquOpfe/ozRS
	 65xtb3mfKl1CA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:35:27 +0100
Subject: [PATCH 1/7] rust: auxiliary: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-driver-core-v1-1-1142a177d0fd@gmail.com>
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
In-Reply-To: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406930; l=1194;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=BVDdV23Nh6e2Ckn6TwYKXo68sSRbr3pGInAvEOSVe/w=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDsKWgMARMDErf9c+y1rdphqPMwTb3TZ7XuXhDp7tuBVTxIOOyOILuTsPZlVK+wcH0IAhQ0okug
 9NHeqCJ/2oQc=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 5761ea314f44..1e4fb23cfcb0 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -5,7 +5,7 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    auxiliary, c_str,
+    auxiliary,
     device::{Bound, Core},
     devres::Devres,
     driver,
@@ -19,7 +19,7 @@
 use pin_init::PinInit;
 
 const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-const AUXILIARY_NAME: &CStr = c_str!("auxiliary");
+const AUXILIARY_NAME: &CStr = c"auxiliary";
 
 struct AuxiliaryDriver;
 

-- 
2.52.0

