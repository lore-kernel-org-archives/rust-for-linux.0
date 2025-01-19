Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA91DFE29;
	Sun, 19 Jan 2025 22:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324702; cv=none; b=o/Jq5evLkkkuLf/tNiseP1oj9K6XokInA804ATNLQuz1XPuSZoK0J92qyB4+zvntn3lEPtMEL03O4ctzvcMtMnnYEy3zrfPCc2tFeKseDNQrP5QbKetvzljnzcwVMTy+7GuPakiO7ygtD1h46RSi26AaOSlK4Y8SjWm4jDuVbhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324702; c=relaxed/simple;
	bh=QuP40hh0ZwJRJ5uP+8xtANV+0kwNhDyRXKba5T9Q1EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKVeyYv99CJ4iDW2KjSgmnalmE0+9DTGo+CG8gzu8vX/Uo9A9uRv6xV7uYAJx0rNH3yyE/pBg9mDqUtETelb6WPL0jjsBMLfWb8yfdTS5n7bHXxladFO8CMHSgWpygUiACCO3Qu1cDBAshboIYtLNAklKBtCMVuHVjOqQXItAow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWTMnXYs; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWTMnXYs"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso6697701a12.2;
        Sun, 19 Jan 2025 14:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324699; x=1737929499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJ3Ct9+FDvp+LJoSNj9IUPXHQq7XwQY7LemlgwnvcKA=;
        b=lWTMnXYsehKLP/urdy45iY33jQBJuKgCFxHC0kFnlnp4l3r+pXav1kxXnDbsieOTY8
         H/CL+2bWkfCsJiwmjsWH3fYDQvF0ac7STp24Mw698nJL22kQjwGnGUYWfwbEJ+eZ6Xuj
         N8GuMDjkAimUrQl+lsEIQkQKLf7hWiWERToFv10AVixOjXBYKPFeKgOH879/9kPn5iXZ
         XZ1yegDsAArtwnitLOJxrij1faeGa/+Qc90LcqTGWG8cUPxqQG8ouTxrAh+0qmPjHt4Q
         Ac/K8xuRDBGXU0yqHkwWg2qkF+ZbmMD83r7pGY4/kzSVsqZYwZOtaryfM4aQPbaw5bjn
         OK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324699; x=1737929499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJ3Ct9+FDvp+LJoSNj9IUPXHQq7XwQY7LemlgwnvcKA=;
        b=I8b8rT8nuu6IfQnfXX/eccYYYxbkCbsoeQCDoXMObBMISEVzvhWxvqzATlDQQY7a/T
         uXbdzmkumoXl4Fb/dch/y66gUGBnwqYpU/JL+b2QFnKgav97dnQH5hWylSgJkdoYqzRd
         imVly/SnbIev6heHT2NcfEyBFU/gWN1VjVxGIPCR3Vwad1BU3IY1pmoUSVpHiS4zCfNJ
         1A2wUnNkfTCa8v6umz9qrTK0OzzVTL9SFoCbc/V9W7xPOm0zDLlrlVq5Xl0LiT077XZI
         PP7P8mDBL7s6qTDZ1M2hB14/tkfWtr62YR+G/EFaR27UofjNlFLlO340CAV9Lg3bO1Ms
         yRrw==
X-Forwarded-Encrypted: i=1; AJvYcCW+9Gsk/x60YONCuIWZfo5x+7/DRnWgJ2RaXZaLOpXa3YmRHQnsM8ujdYtjYRaD1RQpkkNwgQo0fMsBoyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKNGdCf4fh5G6HCxkmc1MclVc4sqzPEzfiLnvF9tPtryywxbTn
	5WPQTDmzB80mC/ko1krszMIcj8ZZvtkhSeAxKvlsfcM+DWM7HOhO
X-Gm-Gg: ASbGnctIHsOfbkqKCUNkqat+Sl8nAsSaMIwbO2WyFSLvCjL4QkbsqIk0w8HwNUFaH7H
	TdVKdRbjuCBRvnvPHx6TpicNb1C1L5+H1H2I8Kl+qPgGu0ePvAbAtzjexlwi2DuCidJ0elatdRv
	lBXq8A/30oni2Ktg3zMKBZXKnZ0e4Da8eVOg2Shs8wkj51g/KGvt+L4jyFdriVulKI27umTzvww
	QU86mvP2Ulnbeu6TVC8TSKeF+mZ+atHC9dcvPfDmSUQX9TsevuTSvTizw==
X-Google-Smtp-Source: AGHT+IFPCT+kzYM2/gjWgMBA62sijk6ruu8jmgp/3PNW+s/eI0ZSWvZ5ZLNr4MHKmy5z1GuqotekCA==
X-Received: by 2002:a17:907:7e91:b0:aa6:a572:49fd with SMTP id a640c23a62f3a-ab38b3ce71cmr964428466b.54.1737324699174;
        Sun, 19 Jan 2025 14:11:39 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab384c5c3e1sm537196366b.7.2025.01.19.14.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:11:38 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sun, 19 Jan 2025 23:11:15 +0100
Subject: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737324695; l=2744;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=QuP40hh0ZwJRJ5uP+8xtANV+0kwNhDyRXKba5T9Q1EE=;
 b=QHOs7usN/SSRJ4BipgBqJJaCnLiGS3/DmF291dTyTpYeKJcvzgb9AjzhJYMwVSOYRIZDGwLwc
 yQzAV8AiN9CD2e9IaM0GzB/b2Rf6cftbGkV4FHRR91dYBdG+eaozfHN
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Share the mutex stored in RustMiscDevice between all instances using an Arc
and the RegistrationData of MiscDeviceRegistration.

This is mostly to Demonstrate the capability to share data in this way.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 samples/rust/rust_misc_device.rs | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 779fcfd64119bdd5b4f8be740f7e8336c652b4d3..956b3b2bd8ef7455fcfe283dd140690ac325c0fb 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -104,7 +104,7 @@
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
-    sync::Mutex,
+    sync::{Arc, Mutex},
     types::ARef,
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
 };
@@ -136,7 +136,10 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         };
 
         try_pin_init!(Self {
-            _miscdev <- MiscDeviceRegistration::register(options, ()),
+            _miscdev <- MiscDeviceRegistration::register(
+                options,
+                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP_KERNEL)?
+            ),
         })
     }
 }
@@ -145,10 +148,8 @@ struct Inner {
     value: i32,
 }
 
-#[pin_data(PinnedDrop)]
 struct RustMiscDevice {
-    #[pin]
-    inner: Mutex<Inner>,
+    inner: Arc<Mutex<Inner>>,
     dev: ARef<Device>,
 }
 
@@ -156,7 +157,7 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
-    type RegistrationData = ();
+    type RegistrationData = Arc<Mutex<Inner>>;
 
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
@@ -164,9 +165,9 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         dev_info!(dev, "Opening Rust Misc Device Sample\n");
 
         KBox::try_pin_init(
-            try_pin_init! {
+            try_init! {
                 RustMiscDevice {
-                    inner <- new_mutex!( Inner{ value: 0_i32 } ),
+                    inner: misc.data().clone(),
                     dev: dev,
                 }
             },
@@ -193,9 +194,8 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
     }
 }
 
-#[pinned_drop]
-impl PinnedDrop for RustMiscDevice {
-    fn drop(self: Pin<&mut Self>) {
+impl Drop for RustMiscDevice {
+    fn drop(&mut self) {
         dev_info!(self.dev, "Exiting the Rust Misc Device Sample\n");
     }
 }

-- 
2.48.1

