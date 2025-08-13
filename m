Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9B2F0C62
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073658; cv=none; b=OGSTEqH0O5R6zzTOKCeyEcvls4mafdWl7rbLgLzY8hIxxgQx6y4bzCKHklSJzRgRS7QDZeEgAxeejEZRBTv+NyUeV5MJ4r4xOwFH7yzY3sT9m1l75bhuZL0YFVk5B31DWuCyjRDmTgbGpP6twpx6oxt8g0muwUP8Uf6WQAl524o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073658; c=relaxed/simple;
	bh=NvRCQIGdGJIWo6z/G2tCNyjPRInHwov/dUCUXA2+eg4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LzxtXxhy4A1dS+nCOsTgG8rdVYxDhiZXZ8M2lUcQRsdYc2wp6PBYIhAQwOkXa9kiSr4QYyzVuADfWMwHKYYPc1qxLLEA3CbVZqZMbihReaJ8yqPo/cdaikbdjNXe3k3nve+Ob3m8XuB1YZ07FqjxXkY8szRyf2AdnDRANx+GLX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CGgnHZqR; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CGgnHZqR"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-61865148a8fso683719a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 01:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755073655; x=1755678455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIJ+x4zOPX38S26xHW3ogZFnx98GYdUErZ7Lc5KD+uk=;
        b=CGgnHZqRnP6hypYuIMgtA8dk3mxaj8E0SySdzd+EGl9kTwFOE2TArc0R35M63GgkvX
         QF6qOosS3nMVCLMlCyM5spWtbWNjCf3zsuyIubBDtHE0jYjM64Shbi7vGMo8IbKNsW1b
         A5nKLVKIUcJHKBzW5zg9CV7kycEU6/q/0c0Txwnx6pOqA9k4w3EKZEitJspz0oZ6LfBz
         IBpxdnStH6t2mg/QaPfyz6l/PR5xLMz8uTnr0cvUTvmZe7g8+d0/V9hX2tNdoEFtYTh8
         Ps5B3R3idC/KBYEnSO/LBdbzxWpOmJE9pQ5ugSVLvT4ZK9ei6L4cHcR52KcjaZytnBgD
         UVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755073655; x=1755678455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIJ+x4zOPX38S26xHW3ogZFnx98GYdUErZ7Lc5KD+uk=;
        b=Wo8/diCNtb/mClt1W/NdeqcObyXvSZssQiSEWWUmnTF9xWjZ0G2vT9nz0DCZp+Zwcb
         LpErqrx784VgRR2Cq3rFqEqaR1PcaFDJd7h3YRo6q0IyvZ59SWShZQ87Pa/ihwOpQNVf
         9xds+UlKGCVKtJ78VI8IiP0a/9TO7oI3Wq+evnwVZJaY7bPrg6HrJg0H4T4FQf9y7aJ7
         8e0wl0bg7UiXWWn9+6GR3deQvaAIoK+wZAr5hWRIVuQaBmKuLYh3Y1O+Sz9CksmCw3k8
         9kC2hFgVX0Hytf/VQQr1NdUY1KD9YxiqQonse9b4SSGjs/+stZ5kXnOkU32enBQDmGj5
         sDzg==
X-Forwarded-Encrypted: i=1; AJvYcCXItyYq4JVKwrc4744XpMGevfkpt1uIJQn5Fv6p8W1LB2uLudSmpN6A2EWJKHQ6GlJDR40/hFMNBG49/x8ltA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxkoIq78LkYtvLKHMSfEX5TQCLk6yFC+2rEwJQHPhnIFrU0jt
	HE+ysnlUjMaHBhdRW+AiijzJo/E9I/E0QUMob/1t9HxRPlwWi9qwie/RcPxqfCmbpVEqSHlJG4l
	qq3rlM9oRrSkoSRyqwA==
X-Google-Smtp-Source: AGHT+IE8ydanFwGG7KesQpAN8skGF2NnY35RVGG+5pSg3DQ1udrmQq4PkLWonfAcxDhio26JiagvnS+7olbq9ac=
X-Received: from edn14.prod.google.com ([2002:a05:6402:a0ce:b0:615:49c7:ddf6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:44c9:b0:618:273b:4f51 with SMTP id 4fb4d7f45d1cf-6186bfd5757mr1340836a12.23.1755073654306;
 Wed, 13 Aug 2025 01:27:34 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:27:20 +0000
In-Reply-To: <20250813-iov-iter-v4-0-c4f1932b05ef@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250813-iov-iter-v4-0-c4f1932b05ef@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3154; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=eF5bCKQbWoDK+4GDnO0XjfTUd6tLFH3Wpg7SaPmi7HE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBonExt5tmxz5dadRkEbyP/qbVmEqwLito1TQxGa
 v2Wm02OrvCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaJxMbQAKCRAEWL7uWMY5
 RpmfD/0SM46L161T6o/+tvWN8XkkrrDFh1/r3CbeOCqgv8y6x9N1PLE1/g48HWviJyhJ/pOqUO9
 LD8siSkS1DgF7oZJuvPfMZN+Zh5J4hhqLsoQgvuDAe6tZa4uQjTFF4N9hcF/6ikgxBpUwZq6wBa
 muQbThm+pD/m6TGglZIeVlIbia1tVO9LwbTMXPUlhdq3OWP9D7NQ2TaYlm1fryLb7vdC6CCb98S
 Czw1+YvaoVVEflEX7/mMvNBE4gM6mdmthjDsDW4OdggnMjCp8OHn6GOd4FACMYbY5mHBi6vSUL0
 Y9FRNAxJapcHlJqbfFi/r9g5hz9gIvLfRiI30G3UtlUGJ4bHP9zxsFdVR0UGzHWnzLpHAMTlKsJ
 Z3Tis7T6h4UPTZ05WdcULNVAO/QumFEJF2xdnsjZ0fSmJ3N0HV0z5Fi1vitRQuRQ9pk3o3QdVL9
 ALvHnfOJsLgyeaQAbClEHbXhbWxEMfzeReDhVmqTlG/pvS7MBCZMiKtzVtdqvTn0A8tbdrSQ8p1
 kynBLZ1oNqksBSJRedldc0rDMuF2R3nqMd6ZJh0bHYAe/gegvTuiXIeoEie3M6e7jlPnjQwcQ2e
 HA4bPUiYawyvDt+jJUzv8GdE91FRXoT9QrP1qL64/eUD2zXFuP7u+j1VL0GLfr8M6JcyonHjbjM YAyPkNAoT385bCw==
X-Mailer: b4 0.14.2
Message-ID: <20250813-iov-iter-v4-4-c4f1932b05ef@google.com>
Subject: [PATCH v4 4/4] samples: rust_misc_device: Expand the sample to
 support read()ing from userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Lee Jones <lee@kernel.org>

A userland application can now operate on the char device with read() in
order to consume a locally held buffer.  Memory for the buffer is to be
provisioned and the buffer populated in its subsequently provided
write() counterpart.

Signed-off-by: Lee Jones <lee@kernel.org>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 samples/rust/rust_misc_device.rs | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index e7ab77448f754906615b6f89d72b51fa268f6c41..9e4005e337969af764e57a937ae5481d7710cfc9 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -100,8 +100,9 @@
 use kernel::{
     c_str,
     device::Device,
-    fs::File,
+    fs::{File, Kiocb},
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
+    iov::{IovIterDest, IovIterSource},
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
@@ -144,6 +145,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
 
 struct Inner {
     value: i32,
+    buffer: KVVec<u8>,
 }
 
 #[pin_data(PinnedDrop)]
@@ -165,7 +167,10 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         KBox::try_pin_init(
             try_pin_init! {
                 RustMiscDevice {
-                    inner <- new_mutex!( Inner{ value: 0_i32 } ),
+                    inner <- new_mutex!(Inner {
+                        value: 0_i32,
+                        buffer: KVVec::new(),
+                    }),
                     dev: dev,
                 }
             },
@@ -173,6 +178,33 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         )
     }
 
+    fn read_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterDest<'_>) -> Result<usize> {
+        let me = kiocb.file();
+        dev_info!(me.dev, "Reading from Rust Misc Device Sample\n");
+
+        let inner = me.inner.lock();
+        // Read the buffer contents, taking the file position into account.
+        let read = iov.simple_read_from_buffer(kiocb.ki_pos_mut(), &inner.buffer)?;
+
+        Ok(read)
+    }
+
+    fn write_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterSource<'_>) -> Result<usize> {
+        let me = kiocb.file();
+        dev_info!(me.dev, "Writing to Rust Misc Device Sample\n");
+
+        let mut inner = me.inner.lock();
+
+        // Replace buffer contents.
+        inner.buffer.clear();
+        let len = iov.copy_from_iter_vec(&mut inner.buffer, GFP_KERNEL)?;
+
+        // Set position to zero so that future `read` calls will see the new contents.
+        *kiocb.ki_pos_mut() = 0;
+
+        Ok(len)
+    }
+
     fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 

-- 
2.51.0.rc0.205.g4a044479a3-goog

