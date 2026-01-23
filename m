Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E02989A2;
	Fri, 23 Jan 2026 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191164; cv=none; b=kS/YNvpCHdI14LChcrSfIuxnhBJ5S8Ay9Ck4zI9gCIOlCmZyWOv69Eyxc92YhEa+rx1hCtbcptP4GkSpB6e8MpGQFMYpO9BqkFvhlg3oUJ7fgHPDCOd3vvk8MYInm5S2QfbIIY5gpbwtvqOZ/SbLlmXkOc1vbzfxNOW30mI/STw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191164; c=relaxed/simple;
	bh=+UwSwiUQmOLx1BjOanN5kU1pJQAqGUY3S32DrvsTb0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dd3RKSRWyqOwaKe0e6QH1XN1HKkP0oEKr2X8qE/xKrFsXiQf84xwQb0i/KWJEoSlOyhDXkkI2EP1riFTZUOy0d1Lyx9BPV1c8XBQiR89LegO0QS1gRVTqsubWU3DioiSh47gMJWaVPU8hhQzmrFCCuE6t50hu2MOScnaW4AbgMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYOfKgF0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYOfKgF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A7FC19421;
	Fri, 23 Jan 2026 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191164;
	bh=+UwSwiUQmOLx1BjOanN5kU1pJQAqGUY3S32DrvsTb0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=YYOfKgF0V8wa/Cf5wp4xfPuUaJKOiWIUKlddbHfFlZ7YbbCzSIyWJrjnpdkDLgU4b
	 B/gNK7dU8BxSEm7uLwUw2EVPiFaTIyEvo0FhUcHKqsATn8lOnD+1FSl858F/79brYN
	 qsJGWGTI8TTVAXxLM/tuJxoEo4rHXZX6n1riYcLw1495crqainxuCfwy2xj423FULq
	 7RCCFicI+fl6SZHurubbp5WE02wjWkmBEMkyKgt6l7TucQorePfZncUxjKclQrb33z
	 D8DO1rruDB2jI8eBtHniBaH5FMnJ06Vn1rh+shLhunUFqIsZdCIe9deXxoRKQZNMsX
	 P2BG/PZNdFQNQ==
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
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] rust: samples: i2c: remove redundant `.as_ref()` for `dev_*` print
Date: Fri, 23 Jan 2026 17:58:42 +0000
Message-ID: <20260123175854.176735-5-gary@kernel.org>
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
 samples/rust/rust_driver_i2c.rs | 10 ++++------
 samples/rust/rust_i2c_client.rs | 10 ++--------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
index 6be79f9e9fb5..3079d57fe473 100644
--- a/samples/rust/rust_driver_i2c.rs
+++ b/samples/rust/rust_driver_i2c.rs
@@ -44,23 +44,21 @@ fn probe(
         idev: &i2c::I2cClient<Core>,
         info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
-        let dev = idev.as_ref();
-
-        dev_info!(dev, "Probe Rust I2C driver sample.\n");
+        dev_info!(idev, "Probe Rust I2C driver sample.\n");
 
         if let Some(info) = info {
-            dev_info!(dev, "Probed with info: '{}'.\n", info);
+            dev_info!(idev, "Probed with info: '{}'.\n", info);
         }
 
         Ok(Self)
     }
 
     fn shutdown(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
-        dev_info!(idev.as_ref(), "Shutdown Rust I2C driver sample.\n");
+        dev_info!(idev, "Shutdown Rust I2C driver sample.\n");
     }
 
     fn unbind(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
-        dev_info!(idev.as_ref(), "Unbind Rust I2C driver sample.\n");
+        dev_info!(idev, "Unbind Rust I2C driver sample.\n");
     }
 }
 
diff --git a/samples/rust/rust_i2c_client.rs b/samples/rust/rust_i2c_client.rs
index 8d2c12e535b0..72da5499f150 100644
--- a/samples/rust/rust_i2c_client.rs
+++ b/samples/rust/rust_i2c_client.rs
@@ -113,10 +113,7 @@ fn probe(
         pdev: &platform::Device<device::Core>,
         _info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
-        dev_info!(
-            pdev.as_ref(),
-            "Probe Rust I2C Client registration sample.\n"
-        );
+        dev_info!(pdev, "Probe Rust I2C Client registration sample.\n");
 
         kernel::try_pin_init!( Self {
             parent_dev: pdev.into(),
@@ -130,10 +127,7 @@ fn probe(
     }
 
     fn unbind(pdev: &platform::Device<device::Core>, _this: Pin<&Self>) {
-        dev_info!(
-            pdev.as_ref(),
-            "Unbind Rust I2C Client registration sample.\n"
-        );
+        dev_info!(pdev, "Unbind Rust I2C Client registration sample.\n");
     }
 }
 
-- 
2.51.2

