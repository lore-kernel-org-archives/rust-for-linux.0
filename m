Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC54279DB7;
	Mon, 22 Dec 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405690; cv=none; b=jEw1N46ftaYZVzdccvSFsandtuxyHmsvRN/8/6mVpwaYpxJ8Yx+wr2znLnoibl8/VLs6ihGjDg9zYVhuiSG6HtQaB8k2dKm6oaDvemPxBeQ+7ER3mvWpQAqRTHn9RTYjjmArsKPlmbip0k7nyTStm7VxFAGzI7zu2Xlxa7PR+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405690; c=relaxed/simple;
	bh=0d11QVK9Ev2Dz/qMQjhZJ9dFeqGYcbzod45ipeUugdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q56GWqx2x0FkY71RyQDISVkFL3xo/g6lBvm1yVgUTzPhfSUWuaVVBn1GMX0tA4bXUvHK91IBRtf0NEDoWz1igYczWXqGz5fwL/TUT4/z2QWDBea5Tt3GtdCVzEukNmmp/ZfATLtigHzlHwaY75s7wh5U/cP6AWi+qdgpNG8I+30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k43q7Bpl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k43q7Bpl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1386EC116C6;
	Mon, 22 Dec 2025 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766405689;
	bh=0d11QVK9Ev2Dz/qMQjhZJ9dFeqGYcbzod45ipeUugdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k43q7BplJFdPNAH/wNGsiyZXnYtAznxu/MWZ5MwFEQZ4F8wdDdvE2Q6qQ4+3H0EGR
	 R/0Tc7t07+ABAIHW6ZCpW15PXMo6ZumnJ/G2gb24UoFspA24bhqTr2uE4KQwsdNZfq
	 SICdpVdiv2VgoNtyKhpri9zq1P1oZUBnCJ6qUv7H3WUZMXA0XhceM57OSH2cbL2md6
	 ZAYIJMxQeXp+p7zybw5yfAP1QYjD0yXIPC6G5w7T3HS9uCLl/B7ylBAyW0bcNoxSAc
	 w/jxOciI8UiuqfaWqODlvZE+XB+O2WTqq0wVSBm23TXqlXqNfJtfOIbI5H0VJeIUwD
	 MuhAWBIPIsAXw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:14:33 +0100
Subject: [PATCH 2/2] samples: rust: i2c: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-i2c-v1-2-df1c258d4615@gmail.com>
References: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
In-Reply-To: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766405680; l=2514;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=e6wngjqR4FRY8Z65B6bWnRS2cUgbyeAj/EOZWZOPK9Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAa6Ugr/UMpQ3tCnfonNTSTKrU3pS4FAWSOOdDvzwEvlRnmFubxR6qVSyArkGUwkm628WhDroV+
 Vk/PM407YOQg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_i2c.rs | 7 +++----
 samples/rust/rust_i2c_client.rs | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
index ecefeca3e22f..6be79f9e9fb5 100644
--- a/samples/rust/rust_driver_i2c.rs
+++ b/samples/rust/rust_driver_i2c.rs
@@ -4,7 +4,6 @@
 
 use kernel::{
     acpi,
-    c_str,
     device::Core,
     i2c,
     of,
@@ -17,21 +16,21 @@
     ACPI_TABLE,
     MODULE_ACPI_TABLE,
     <SampleDriver as i2c::Driver>::IdInfo,
-    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), 0)]
+    [(acpi::DeviceId::new(c"LNUXBEEF"), 0)]
 }
 
 kernel::i2c_device_table! {
     I2C_TABLE,
     MODULE_I2C_TABLE,
     <SampleDriver as i2c::Driver>::IdInfo,
-    [(i2c::DeviceId::new(c_str!("rust_driver_i2c")), 0)]
+    [(i2c::DeviceId::new(c"rust_driver_i2c"), 0)]
 }
 
 kernel::of_device_table! {
     OF_TABLE,
     MODULE_OF_TABLE,
     <SampleDriver as i2c::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("test,rust_driver_i2c")), 0)]
+    [(of::DeviceId::new(c"test,rust_driver_i2c"), 0)]
 }
 
 impl i2c::Driver for SampleDriver {
diff --git a/samples/rust/rust_i2c_client.rs b/samples/rust/rust_i2c_client.rs
index f67938396dce..8d2c12e535b0 100644
--- a/samples/rust/rust_i2c_client.rs
+++ b/samples/rust/rust_i2c_client.rs
@@ -69,7 +69,6 @@
 
 use kernel::{
     acpi,
-    c_str,
     device,
     devres::Devres,
     i2c,
@@ -90,20 +89,20 @@ struct SampleDriver {
     OF_TABLE,
     MODULE_OF_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("test,rust-device")), ())]
+    [(of::DeviceId::new(c"test,rust-device"), ())]
 );
 
 kernel::acpi_device_table!(
     ACPI_TABLE,
     MODULE_ACPI_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), ())]
+    [(acpi::DeviceId::new(c"LNUXBEEF"), ())]
 );
 
 const SAMPLE_I2C_CLIENT_ADDR: u16 = 0x30;
 const SAMPLE_I2C_ADAPTER_INDEX: i32 = 0;
 const BOARD_INFO: i2c::I2cBoardInfo =
-    i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), SAMPLE_I2C_CLIENT_ADDR);
+    i2c::I2cBoardInfo::new(c"rust_driver_i2c", SAMPLE_I2C_CLIENT_ADDR);
 
 impl platform::Driver for SampleDriver {
     type IdInfo = ();

-- 
2.52.0

