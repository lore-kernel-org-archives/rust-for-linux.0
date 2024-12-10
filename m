Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E08223332
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823563; cv=none; b=WS791dWvmlBR0jSMKAjS8xYNhuXDMup8lhmefrHjXUFBgXZ6g3mZIhFK83ikBYov3BDLvOOnQ1VM7Kj2xCI97iABdUb2x5l8OoRo/HdGBGlriad5C4WgjoDyKWhozKtoKAT/0jawZr3glhNUaXJ2mOY2w9RNNdUMgTk52K0UK0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823563; c=relaxed/simple;
	bh=aek/y/cbvMTTZ9r/rORZzJl2SZOCrcfNQ8ty0c60zNo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aDQV3oRT1b2cW7Vk/U2b99SfrqolY0DEfUgM+kumrQN09sCutAozkKhvGtL1xrPA006FQVAD5McpNhX79FpeK+H3nnmbeqlGjhvpSTG4YceMwHBR94S0Le5TsAzAah4yOkKe7q0by/rw7ONmHNcyW2WXWwkJh9bpQ2TBoNsOVaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p5x6Bsd7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p5x6Bsd7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-434f02ea82dso22991985e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 01:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733823559; x=1734428359; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kWaVy45L0tBSJtf9uYr4OfEOAz7jglrJk5DHXJ8wYs=;
        b=p5x6Bsd7FIFan08ers5gnAoYLzMrAhPEOIvQFiskbLZxDXWfuzYhWY42cogynbUzLb
         0Qyt+vzOlC+lHq6lPja+TTFsTLiQuMp0RtMZTwjzb2EmU5iCNaJ1WoiPHCTyWh5uorG/
         5prSbbYETswWzG/pBIhNJFlZRwUVE1tprwjxKfz/fiwAmCAUPwLIhrTD9d3pdxehhv/O
         A9Av19QcQnQvmsquBozkVidQC27dGC4B3WJGeaeZMrM8AzKHVtbUMAiJzFWEHZmtmuK3
         7s04Zt+ChXFHVbxvmHa/CZIdETBtlxWjjyZVSX+QGkpVIcZNvr0zYT2zgUo2T09vvY8a
         ESXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823559; x=1734428359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kWaVy45L0tBSJtf9uYr4OfEOAz7jglrJk5DHXJ8wYs=;
        b=NzDs5qK+N3jeVhO7taMffu0cARUAnRkWvt0L88tLm5m8CysFG7c9fXUgtneTeRouIb
         md6EwTIEa5SostSLaxAp8b7NEYv8kQw9MrmP/gtIYTykI0db4VcD+u8kpOsa8KaEfyHN
         T0P8/Z6F2PsyOTFnBaV0iFMPJjnJ0LyvBlfoHu++Qy4VksmimEINhsn9UXiR/9jyOTGq
         x5Q/MEBiapvtwLQk5gAvSuHvHe3DzKqLqCL1l/gAOiPzugbBwpFzcctnDnbouXr7+fPu
         vI3YlCP3mkgy0xyi6hM1LnZ8/W1M7dBD6VbJHui1c+1F5n4VsHsaR9oMgj8LmGfsXX9m
         IZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXYsG7Vrl8yb9gFGn3IzmvTJzyv5pAeDkQdpMs36Wu+LeGx8zXUwx1z+IWda9sYUB+qLq+Kl5mMifpeyZUAFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgiOm/I8enh/3HCU6vxZQT62f5G1bdE+eRqm+nXXHU6AMefOd
	z+Bt1p7Tw/NhxIDPWBf3GxdHxpYSp/auy3JFNSzI2cEPlM227AD+a+NH2c5Z4Zr7B5OtY7fBG6h
	d7PQH0/jbj2LYSQ==
X-Google-Smtp-Source: AGHT+IFW3BnNsQzFJv9xXvweoZrl0STZsGsb/9OZ/j7ipAtnEX4zMq/6qndxSYkuWRRnQB92Kkbw3FDvNH4rdQI=
X-Received: from wmcu17.prod.google.com ([2002:a7b:c051:0:b0:434:9de6:413a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:358a:b0:434:fd77:5436 with SMTP id 5b1f17b1804b1-434fff500a4mr35015645e9.15.1733823559619;
 Tue, 10 Dec 2024 01:39:19 -0800 (PST)
Date: Tue, 10 Dec 2024 09:39:00 +0000
In-Reply-To: <20241210-miscdevice-file-param-v3-0-b2a79b666dc5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210-miscdevice-file-param-v3-0-b2a79b666dc5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=aek/y/cbvMTTZ9r/rORZzJl2SZOCrcfNQ8ty0c60zNo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnWAxBrZpLxFs/Jyz7wOv9uc43/vuu33Sa3L2w0
 lKlxRSDAA2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ1gMQQAKCRAEWL7uWMY5
 RgseD/9CLIBbvbxAG4DKD7RUsA9cRKhZzhKtiqV9EROvRgA/QuTQDhpYFU3SxObTfD3t2C37uOz
 2eHoWKIrE/0BVrnxyGbBsgnjNkikyB2EFdLJW4+Gcyl814mkSqDfluYyzKu6nUy8pbjDU/MVBLJ
 kn21x1dTIdpz6i9K507CKUW484Y3anF4drN7KGp/EpQGyY8n6VIZryB984Ex5Ab1yN7dfUFPpTk
 xIA2HlAF6RIYzVgAMGNWEhv3PssvsWX20ILGSS97RRWk5SMttfVcUnJUyhrGmDSs5XNtyFXBY3s
 JPyO7tjLwusevDOaORDhHxRSQM1dbLKK0loFifShzr2afGsD4DGxH5IFaCFwgbePs8a+wKJIk2s
 QyHDmV5HZ7EpryN0tGQwFCwSyvSaTA6s6O67EDyDmFxALamQM6zxM1miclSUwJFs6bX5HsHGMaF
 STljKqPqsi/A0509wWGSj+8PidpAxpdv/mpiY1CsDN0TmRmbyGN5WxHXLowhDJHTWsnDL/Po1kq
 8+ZYBZj1lJUKJsud4on4eluYXRe3isXw8MadI9KhYRcilP9yDIuburyP33/rAibJA9v2qsk+xQh
 0CPO17bhwSWgpky68xu5EooZaWX435c6qsBLJ5HbyuxX1DmuRBw3FIGxRcIRkCl1zaoyEHYYoG4 U6SV6eK0Lw6DrJQ==
X-Mailer: b4 0.13.0
Message-ID: <20241210-miscdevice-file-param-v3-1-b2a79b666dc5@google.com>
Subject: [PATCH v3 1/3] rust: miscdevice: access file in fops
From: Alice Ryhl <aliceryhl@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Lee Jones <lee@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This allows fops to access information about the underlying struct file
for the miscdevice. For example, the Binder driver needs to inspect the
O_NONBLOCK flag inside the fops->ioctl() hook.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 7e2a79b3ae26..0cb79676c139 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -11,6 +11,7 @@
 use crate::{
     bindings,
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
+    fs::File,
     prelude::*,
     str::CStr,
     types::{ForeignOwnable, Opaque},
@@ -103,10 +104,10 @@ pub trait MiscDevice {
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
-    fn open() -> Result<Self::Ptr>;
+    fn open(_file: &File) -> Result<Self::Ptr>;
 
     /// Called when the misc device is released.
-    fn release(device: Self::Ptr) {
+    fn release(device: Self::Ptr, _file: &File) {
         drop(device);
     }
 
@@ -117,6 +118,7 @@ fn release(device: Self::Ptr) {
     /// [`kernel::ioctl`]: mod@crate::ioctl
     fn ioctl(
         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
         _cmd: u32,
         _arg: usize,
     ) -> Result<isize> {
@@ -133,6 +135,7 @@ fn ioctl(
     #[cfg(CONFIG_COMPAT)]
     fn compat_ioctl(
         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
         _cmd: u32,
         _arg: usize,
     ) -> Result<isize> {
@@ -187,7 +190,10 @@ impl<T: MiscDevice> VtableHelper<T> {
         return ret;
     }
 
-    let ptr = match T::open() {
+    // SAFETY:
+    // * The file is valid for the duration of this call.
+    // * There is no active fdget_pos region on the file on this thread.
+    let ptr = match T::open(unsafe { File::from_raw_file(file) }) {
         Ok(ptr) => ptr,
         Err(err) => return err.to_errno(),
     };
@@ -211,7 +217,10 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: The release call of a file owns the private data.
     let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
 
-    T::release(ptr);
+    // SAFETY:
+    // * The file is valid for the duration of this call.
+    // * There is no active fdget_pos region on the file on this thread.
+    T::release(ptr, unsafe { File::from_raw_file(file) });
 
     0
 }
@@ -229,7 +238,12 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: Ioctl calls can borrow the private data of the file.
     let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
 
-    match T::ioctl(device, cmd, arg as usize) {
+    // SAFETY:
+    // * The file is valid for the duration of this call.
+    // * There is no active fdget_pos region on the file on this thread.
+    let file = unsafe { File::from_raw_file(file) };
+
+    match T::ioctl(device, file, cmd, arg as usize) {
         Ok(ret) => ret as c_long,
         Err(err) => err.to_errno() as c_long,
     }
@@ -249,7 +263,12 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: Ioctl calls can borrow the private data of the file.
     let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
 
-    match T::compat_ioctl(device, cmd, arg as usize) {
+    // SAFETY:
+    // * The file is valid for the duration of this call.
+    // * There is no active fdget_pos region on the file on this thread.
+    let file = unsafe { File::from_raw_file(file) };
+
+    match T::compat_ioctl(device, file, cmd, arg as usize) {
         Ok(ret) => ret as c_long,
         Err(err) => err.to_errno() as c_long,
     }

-- 
2.47.1.613.gc27f4b7a9f-goog

