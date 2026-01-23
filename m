Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E9223DD4;
	Fri, 23 Jan 2026 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191157; cv=none; b=sgtSUZPspdutvwXHSRiNFjv55UdCU7iL1EXriGiqGyYx60czDjRUN4lcBV/sd5hNsay1PsXQeJGT6ZGBZGVcWqh16NJOJuxAOEXAUDTj6f7Az3kZ6GXRdvAI7tJczmFGBE00CnaYyRhL43CxJ/csyRAUe+OeDqcmboU6C1LIR2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191157; c=relaxed/simple;
	bh=U1tCEh4VpDL/jPJvJXbOzA8YcdPeWexTaJlwZ3141Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlVcHVBn4XcMb/ZACwIZ+i6JX2YvngX/ntUBsCxEmuO96R9t1ulB+VKQ2Rh6pBSMp/+TKN8B1sqP1vcbbGZs9qLQrdyCNzCKeXglHvCDJmmP4vXkrcYX7p17k853K/omdZIni6ZMHtR/Vdo9GcyfMX4b8ncDfKjd/vABLzwIzmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQ1naV4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQ1naV4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4615C4CEF1;
	Fri, 23 Jan 2026 17:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191156;
	bh=U1tCEh4VpDL/jPJvJXbOzA8YcdPeWexTaJlwZ3141Y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=pQ1naV4kJUgPlAjntY06IEbGy1p/o2mVKellQH9JlV/8TM7TiY9C64YBRPdqjJNL3
	 dBU7AmyL5pqvn3qW8ott7tp4fooap4NQ+f/Nq/IFu0/7tb6GCwMnlhinj3QdkvQyah
	 BFTxBBE6oO6k5wNk1QN6bmQThuvOHJYh210Qe+e7KdY6mgtsEE4nFyjhHiExfYqHTb
	 igIuF0fLVpnI2FBL/+zgpaTyRiTUGeq8XKoUKKV3c1EPYnY+s2bBEmzOCG3UFnDrB4
	 QSYvPTFDBvARt6qcZDQ7b3wsolqCCJNbZrGdpt4qD1Uq+Sc9pWtZxQx1v1xg2GJNrQ
	 krXrN9mdJofXw==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Leon Romanovsky <leon@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] rust: samples: driver-core: remove redundant `.as_ref()` for `dev_*` print
Date: Fri, 23 Jan 2026 17:58:40 +0000
Message-ID: <20260123175854.176735-3-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This is now handled by the macro itself.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 samples/rust/rust_driver_auxiliary.rs | 2 +-
 samples/rust/rust_driver_faux.rs      | 2 +-
 samples/rust/rust_driver_platform.rs  | 2 +-
 samples/rust/rust_soc.rs              | 4 +---
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index f148124fe81f..c20961f16835 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -39,7 +39,7 @@ impl auxiliary::Driver for AuxiliaryDriver {
 
     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         dev_info!(
-            adev.as_ref(),
+            adev,
             "Probing auxiliary driver for auxiliary device with id={}\n",
             adev.id()
         );
diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
index 5330b77ea986..99876c8e3743 100644
--- a/samples/rust/rust_driver_faux.rs
+++ b/samples/rust/rust_driver_faux.rs
@@ -26,7 +26,7 @@ fn init(_module: &'static ThisModule) -> Result<Self> {
 
         let reg = faux::Registration::new(c"rust-faux-sample-device", None)?;
 
-        dev_info!(reg.as_ref(), "Hello from faux device!\n");
+        dev_info!(reg, "Hello from faux device!\n");
 
         Ok(Self { _reg: reg })
     }
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 9537dc38c563..f2229d176fb9 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -180,7 +180,7 @@ fn properties_parse(dev: &device::Device) -> Result {
 
 impl Drop for SampleDriver {
     fn drop(&mut self) {
-        dev_dbg!(self.pdev.as_ref(), "Remove Rust Platform driver sample.\n");
+        dev_dbg!(self.pdev, "Remove Rust Platform driver sample.\n");
     }
 }
 
diff --git a/samples/rust/rust_soc.rs b/samples/rust/rust_soc.rs
index 403c1137af77..8079c1c48416 100644
--- a/samples/rust/rust_soc.rs
+++ b/samples/rust/rust_soc.rs
@@ -44,9 +44,7 @@ fn probe(
         pdev: &platform::Device<Core>,
         _info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
-        let dev = pdev.as_ref();
-
-        dev_dbg!(dev, "Probe Rust SoC driver sample.\n");
+        dev_dbg!(pdev, "Probe Rust SoC driver sample.\n");
 
         let pdev = pdev.into();
         pin_init_scope(move || {
-- 
2.51.2

