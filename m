Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646F21E2848
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940529; cv=none; b=pR0j3ezl+hf3lydCAzWReMGf89N2QTcDQbB3FtG8BGIFSMFkwwWwLWKiJbvxJnJwnTMxizDSe1X1wanjwAxLyf+a5GkudNgPkZ49/QPADxvCBjoe2RC1Pmh0+VvUhUyFALukGOBW3LiXt8pxvbP+gtYIifZHplUG5Jxcz/+fLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940529; c=relaxed/simple;
	bh=lWyRs8EwRP9eKktqaEVV7KkDApnFrboXBIw2L8sIYQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBA+g1vBVnG/Be9EKWpuldJaZkfZSE+RD0EgDP6ejRviph5dLQ7IRKDLJZ3WkDB6he9/7fY8Akq0nCijOdWdji6Xd7T5oE4W5nTrHmfDnLo/d0JIcAqtWwX4BYoJCcUt9aFf6E24hWZwLzr/o4mD6I+D3rS3CrqyECs2xINSa7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=JXryRGpR; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="JXryRGpR"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7054f0e933cso12537957b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940527; x=1745545327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB1A7cvc79BaS5ylmvvIDJWYgvPRJC5rldZ4aqKNUrc=;
        b=JXryRGpRZwTZ0nASTeT4LAFvS863myXPM1IMrw4rtKYAPQQ3awSzGP9xhI5wrAY6bO
         C6FA4QAdsrbAFoJTHEu9sGE000bZy5s7yj347UdQjmaKQntVUMd7/rsxN4Sjf2eYlK3S
         j8pegQZhkUm1Fb5OLVmcPu0DsasWbybIKDXSdp6VdwXC57kGAnG5HObvtJR0L6GAYUZV
         udkezFrGEqLZoLup85diRXbZb+mrHzPgNqyDnPf8AZjaMS/JRxmehpp/WKRk90Ow95m2
         kXu/DwVftIy5XvZ89qkIJuv7wovD6TIeEqXJ502iZXTJFHPaA674m2IB1SNmumP/WDt+
         bFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940527; x=1745545327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB1A7cvc79BaS5ylmvvIDJWYgvPRJC5rldZ4aqKNUrc=;
        b=YNwBIZEX0YlIJPlj55Rh5NAuQXSvjRSTbRHvA4fAaVJuN1sbTQemOfQj2/33tmUsVS
         M9GAyBRODDigfGhKXNc7tR6zlWl/cATb6oLHddDjle+gZ/KKZECsQ1CNqsmKgFro1oAM
         H5NfQDLHtAPL4zb/OH0KGCW2pKyNFK0xHZc0+OhpDGQDoyNbZjXq1c0Ju/aFIJK02tBI
         ufVQjrhjk88HOGiXH6BUw0JxnCOR7TA4yN972qeBESPcCMNoV0+z6T0vykfCEhNj9fiU
         qIEsp4SP9OikNg3MVZGYby4uNJR4mjaaD2RVsqCzGS/xddXMYdxIwe3a2hKAtLOofq+M
         hgpw==
X-Forwarded-Encrypted: i=1; AJvYcCWMFgSIQY23ODECn5rIrhq+QDQ6wkHk1sr/Q3J+UK4HI9Zdi1PHeGpXbhhyJKgd70PpnLlx17JQZLBXo8WUOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWiduLyCF6wojgAQMSzhknis7woA0vedPd984U8EImu43/lBe
	1m3EocVr/Qiwd+icbCU5ys+HhbyxQjoM7qu4giN7l6EFJhBUHvzL7hWN2gF3fvo=
X-Gm-Gg: ASbGncu7tAPS2dpN8c9mBkL4vk06ZE6SAgsPtLSn7FmixPHh34n6bfrdFg12YAI8mvf
	/TN7kR9OYQRQk2f7ndi11K3yaQpGuiWAycz++pzQEm0XzHRGQXD7vqcq91od8SB855aLKSfjCBc
	mLgMQfsB5Ne/+rpge5ROwXfPBVLOSmpAp/TTv+C81CaXcqEpvfORaJpord1pJNUe+QkjnErUZoH
	2BTUlsn8nJfnXYpCQ7ttpYIMO7jZB9+F42EGiX53Q5iviIqx8CV7yzyVtlTSYY+BoEcqAaa8DPg
	rzPtOKBv1v/YOR0h8d8bWGMtzyz01h2KRZp3LjpDV3davNXgjxpGvHiYn4DDZZEdswsr+3Row29
	AwEkFiePG+JYF79yxqX5YIkaicpNzbSh9biDSGeqyNoU8uoM=
X-Google-Smtp-Source: AGHT+IEaodFbCrH95m8gcG0KxdEwL1rgFoYJnXev+SHNVhhr9Pyu1iRSnvHrOJp3DTWsZlFfG6QnRQ==
X-Received: by 2002:a05:690c:a99:b0:6f6:ca9a:e9da with SMTP id 00721157ae682-706ccc88d57mr13984697b3.4.1744940527326;
        Thu, 17 Apr 2025 18:42:07 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:07 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/18] rust: faux: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:25 -0400
Message-ID: <20250418014143.888022-5-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/faux.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 8a50fcd4c9bb..064b4f60af4e 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -7,7 +7,7 @@
 //! C header: [`include/linux/device/faux.h`]
 
 use crate::{bindings, device, error::code::*, prelude::*};
-use core::ptr::{addr_of_mut, null, null_mut, NonNull};
+use core::ptr::{null, null_mut, NonNull};
 
 /// The registration of a faux device.
 ///
@@ -54,7 +54,7 @@ impl AsRef<device::Device> for Registration {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
-        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
+        unsafe { device::Device::as_ref(&raw mut (*self.as_raw()).dev) }
     }
 }
 
-- 
2.48.1

