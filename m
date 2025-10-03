Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640E284896;
	Fri,  3 Oct 2025 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759530478; cv=none; b=bVFwrt9FkLOzwmdzZnvyYjIEEMzRQf40XhbWoF0Du99olfvcaxI2pvkZTUd4l7FAhIu5P41Gb8ZTWU/qEE6fOHngPXvxofLG3G/HZwbNf/ouheqpbTNolWu6MPk9NEo0aZML13+lbtDE46qF0S/WfLdS+aYkRcsyci34hIYyp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759530478; c=relaxed/simple;
	bh=VNb5eDcF8RARULTBHZCZEkai56X5jDRHIAV+rCYZit4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ajs8qyJv9DIetbw9wOLGdw4aSuHEoi1uzHc4Cun/+bHt69iYmqLbXkJWJbhqEZTWOVDNLeGmlpqyEUqIdZDPlj0UpzwEoG5E+abd5+up5RbuJ5C+MPsBIlCcKhCx+iahtSGWuUCA3sADWL8+1bjPRkU/cW7ni7iqj6eFfBI0cEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9UubbHC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9UubbHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB81FC4CEFB;
	Fri,  3 Oct 2025 22:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759530477;
	bh=VNb5eDcF8RARULTBHZCZEkai56X5jDRHIAV+rCYZit4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9UubbHCOsGYzO0fLDPWQtj83RCwmONyYz7iokKv7Rkf6R3fPhqc09DSqvfULIKnr
	 ztT7uferkG+oyNlY8mzjALssn4vgUhTDRMaaiNnjx8AmMLSNutw/ZrRleHC44NGygq
	 k7RQPH6OEoGQFJ2YO6TIGGMuk8fhFkyJKnDDqMAR3g1VtZ7hP30lylXV2t/r4gdDRV
	 Dzoqn4unSXs7Nz2fL3yGCsziL/wctTdjc+EnibyjxZSK3Sp1Mzs71KrY4icBRQ9UE6
	 t4ZVkSn6d+WnMuGTNgvGLvQwh9E8lRm1oAV5k4mAZrN5ejLcMhk1q3LMYG+db+G0u6
	 fMpqslOX2Inig==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	mmaurer@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 5/7] samples: rust: debugfs: add example for blobs
Date: Sat,  4 Oct 2025 00:26:42 +0200
Message-ID: <20251003222729.322059-6-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003222729.322059-1-dakr@kernel.org>
References: <20251003222729.322059-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the Rust debugfs sample to demonstrate usage of binary file
support. The example now shows how to expose both fixed-size arrays
and dynamically sized vectors as binary blobs in debugfs.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 samples/rust/rust_debugfs.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 82b61a15a34b..75ceb95276fa 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -38,6 +38,7 @@
 use kernel::debugfs::{Dir, File};
 use kernel::new_mutex;
 use kernel::prelude::*;
+use kernel::sizes::*;
 use kernel::sync::Mutex;
 
 use kernel::{acpi, device::Core, of, platform, str::CString, types::ARef};
@@ -62,6 +63,10 @@ struct RustDebugFs {
     counter: File<AtomicUsize>,
     #[pin]
     inner: File<Mutex<Inner>>,
+    #[pin]
+    array_blob: File<Mutex<[u8; 4]>>,
+    #[pin]
+    vector_blob: File<Mutex<KVec<u8>>>,
 }
 
 #[derive(Debug)]
@@ -143,6 +148,14 @@ fn new(pdev: &platform::Device<Core>) -> impl PinInit<Self, Error> + '_ {
                 ),
                 counter <- Self::build_counter(&debugfs),
                 inner <- Self::build_inner(&debugfs),
+                array_blob <- debugfs.read_write_binary_file(
+                    c_str!("array_blob"),
+                    new_mutex!([0x62, 0x6c, 0x6f, 0x62]),
+                ),
+                vector_blob <- debugfs.read_write_binary_file(
+                    c_str!("vector_blob"),
+                    new_mutex!(kernel::kvec!(0x42; SZ_4K)?),
+                ),
                 _debugfs: debugfs,
                 pdev: pdev.into(),
             }
-- 
2.51.0

