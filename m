Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB94157480;
	Mon, 22 Dec 2025 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406096; cv=none; b=ulYlUH48mtW5vfv7Fil7ypYpVZf+wtW4TzE/LsDqXCvUyr8maxIXaaYt1nmuFYsY6A6gptzTFQ/ACDpKPSII3yRBJua++8HTxLimuV/pQh1uNlUQ9tJS8YQBSV/YPptgoTI7Z47I2f3RtIwwo1QEws6Z8miR+xgtJQjmFRClGRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406096; c=relaxed/simple;
	bh=ek2xz558ftkpNkkwFOEXohAxiUiqeobmdKxLVg5bADg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IP0Alz0dv7vDO5fcbUIyBrNSepg+v7+A6yQP9YD5Rx7g86+tFHlUai05KJdhmEiZUZRyrJzcyHrZevVyScVdyDlny/uMsNVVMYxtqw9T/hoYdI+SjRwdo6BsGVKp77Sdg83VmDlDdIz1Dw6uj/ZnRZAacFvP2SacxQv0w4TDvOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B79evPIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B79evPIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EF6C4CEF1;
	Mon, 22 Dec 2025 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406096;
	bh=ek2xz558ftkpNkkwFOEXohAxiUiqeobmdKxLVg5bADg=;
	h=From:Date:Subject:To:Cc:From;
	b=B79evPIz1FxtMLFxVCyDSvMbNelvpbpDABcBIp37RJ2hKR+1T8AfJcwBXbY9VkR8r
	 DGlvnsl0yRgpG9s8lvyXJbLcvAhLRijCH5oCG977XW8YDxuG8IqkuhOjaOce9mOQHZ
	 ClBYGVojnL5nFnlLPKaCQMKVscGIMSehWmDuFclJyooSYPQg6jTZoxY2GXt14SKw1a
	 UQkq1Gww0Pxgf0mgPnwVWOtZhTHeqnpZJIElNPYqxGBHohxIsBJHNXV4KOnVpI5qXE
	 LToDt63IPGoesheSeepPAAe6DS/H+ob/+rM8HrDDpWDCCSs19j1FJdMua3osVx4HPc
	 6PAGPNmagUykQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:21:23 +0100
Subject: [PATCH] rust: miscdevice: replace `kernel::c_str!` with C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-cstr-char-misc-v1-1-d218537d28ab@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqEQAxF0a1IxgaqQongVqQHWkaN4IfElgZx7
 13q8PB49wRjFTaoshOUDzFZlwSfZxDHZhkYpUsGclR4IsJou2KaFGexiK4PPoTONWVLkE6bci+
 /J1h/Xtu3nTjudwWu6w+Gd78ZcgAAAA==
X-Change-ID: 20251222-cstr-char-misc-0f4144d0a7b2
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406092; l=1301;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Pslohf2TfBKRgVKO8/PtJolNNRTsz/IN/lr0LkQtwVY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD8RKaqj4wOO9jtUDTo6wW03UhouFeWjLxAvRy400uOyKrNIN6YdKq2H6fZFx5iFlqD0bhcNem1
 z6k73AM5ILgQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_misc_device.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index d69bc33dbd99..49dd5814e1ab 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -98,7 +98,6 @@
 use core::pin::Pin;
 
 use kernel::{
-    c_str,
     device::Device,
     fs::{File, Kiocb},
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
@@ -133,7 +132,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         pr_info!("Initialising Rust Misc Device Sample\n");
 
         let options = MiscDeviceOptions {
-            name: c_str!("rust-misc-device"),
+            name: c"rust-misc-device",
         };
 
         try_pin_init!(Self {

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-char-misc-0f4144d0a7b2

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

