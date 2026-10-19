Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423421;
	b=QIpbdxY8D9tw/DYt26ugBOAbZmejSkpcnTKgWIB+GeE4ItxjXijBJkIL8R3imkUD0otq
	 cEXq1U0K6RV07EY0JLpQ9PMqYwWE0DSk+f8mipH9M52m9mYtZOJAEXfmbztvsrX7f+1f7
	 p6sInnsl4sxgTlgJbGuTYx8J8LMm9wuuKOIHKtuQgOUhWyxYyGJufSz9o4lHdP06aUkZH
	 8GrN4VACaqhm53AeEjlZEmTksrTI6E4JmRDkr0fHWXT7TaiWJVekX4+DYuVIRib5WNApM
	 kPyKX/l5It4dfKys8/xcYz2c2/N9zq5dh986Umt3MEK5I+Mg/4I+bvUyuZtSeE4VgAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
	b=URk4EHHzpvRBdZ7TKG12n6uRTKp/kF0gN5yRZQu3nlUN4u9312dlLqv/5KspVCqDJw42
	 NS6JxLX0RNDI+nxfsFjOUj8ehTvOs5WtMODyWjh1dCx6mYVSLU0dVB/skcF69fTa5pEpV
	 MdBIMe+bX85wbnyHoRxHYNOluDy2Wqax/6nnnYayC6KNH+QioMp6i32luQjKBDuwv8low
	 QHntIX7FIHVLU5L+H0lJGKnM7wDBb7rHMpowdSy9XL8y/6OKB2f/0nGzufiFurluD+iel
	 HdzQlBwCkYrHrqLhkYxAH6Jag39M8/yOqJqvPKV9pHdJyWRqneMH+j3mDijWZ3AyhXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=amID5UL4;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBB60ACCE9
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 15:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DBB60ACCE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=amID5UL4
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso231726241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423420; x=1793028220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
        b=amID5UL4oXgN2w3QpNshWz8S3hujZxJ9MR4VBu06GHjgko5FygdPkAxZwfXKgMCwry
         YuVILTkEunVHZWkCmzaRtv3M5bxJOVERp674cByKUZUjQev9Esvej04i0K1nE1BugUPr
         6qsfWeztU62IUCEUcL03iAJdtK7I33wfsCljb/0uP4CmorynANmX4lapU3I5ta2vUPjU
         G9DVnlIyhbMjhqo9kiIzUr34HINGxpkKHa5Sat/rlADIkx9bWeDlzft+MrnKNEZaitVK
         Sg5x916X45FNuCxnpG7KBxtwzWrT5bN9NWpXH+tVT8pMgVz0n+BZ9Vj3C3H8FXUuQzDj
         s5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423420; x=1793028220;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
        b=FzB7t6uk64Xdq4GOn53vd5nwQDJFwMjGZlpdRoB8VmXjK/oYYputjRLXs4DYk4Fbtm
         5EHVfN+d1adcIcKJO0XQwJBjkoHsx66+9z8CeeoqCBiQ8sW1m0UIzQTxHYmIFUKdipdv
         jfneWoTDgRLLWfK7h9f7SyvE7OV5Qi1xoFVAabDoMu9uAq+WFALegnkc+jl57XTKS4cT
         6f2SpZu1gFEpC6dKwMIJXgay+U13B/8sJXFJtIiguqB/p0Bu/BU8tE+QlfGrBnZs/Ent
         eueJcqyzuN+LDH6p6dOKqAKpLHjlFfFsRNLK+iJ8/2b5QTdrK8Tv6/mLxl7gWZ73lNeT
         epng==
X-Forwarded-Encrypted: i=1; AKwUvByX9kmVifvl2RukHP/YMoITVgztfbnHqT+H1uaF7PBTmjJJ1bcNu1mGf+6CMwNqKaIiafTJ+mO/dBN5DmSRQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIiZHOPUPP5oiX8/PuYtAnxK4O5cWovKFCkJsEjhH97og0Pcr3E
	Z6xQ5ql6/6itBxGVO844jBduiVkzglYa6XCfrVJjw95kcsznshpzsLk=
X-Gm-Gg: AYBFou3nLHistgIC5o6MyUQk23fTmLznbVT3vE1MqElTHUqDRs/+hTN6jr4NOblurbH
	9yFChnIonVPSa39dBFNeI6BbWlnXTKDrghvHZBElaxajxjnPme5zvcE5LHgcL0efvFkuzysHlHi
	GrSCXbxqgS1if2dLdwhon4FNhlaUznqKV/4W4/k7QZ8MYTv8NH7K0xm9bvOo5wrFy2Kq0mAlWcZ
	hc0no6cA/sWu5epONMsKx8KA2lDnw5IE6Xb0PfzCIfFMESVOdSUOQvWCXzp3luOnR68pPNWOSw3
	23cidkpxU6CUnpjKiUHTfJJrRl8O1Cf4TJZ1zI3JF0l9uIk60JyRgdfSQw2/B0Elgv+stqMJuxl
	BcL7QT7lm5ZmSx8uBeDC7lpTBWc+XeSDKDS9HMwzw7lSe8g+GDzaVoG8sZP1g5A2wbv15X5H2A1
	uXoUGZuEyNXMYx55ek0sg8szUkrmXD5qWYcjPppVYmfdhRf6yKEOMSTFQMm6k5cLtRQE90TLeCp
	YAFzaYs/3pbkNr45U4TWNOG8UwswaDqKnnRkjLwKzDBnA3ulQ==
X-Received: by 2002:a05:6102:5127:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7cc36aed490mr1758525137.31.1792423419903;
        Mon, 19 Oct 2026 08:23:39 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc77198ec5sm453357137.4.2026.10.19.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:23:38 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for &I2cClient
Date: Mon, 19 Oct 2026 12:23:15 -0300
Message-ID: <20261019152329.620610-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&I2cClient<Ctx>` since it has had no users since its introduction.

Fixes: 57c5bd9aee94 ("rust: i2c: add basic I2C device and driver abstractions")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
To make sure that there were no remaining users, I checked for usages of
the `try_from` method and the `I2cClient` struct using rust analyzer,
activated the modules that were using `I2cClient`, removed the
implementation and compiled the kernel (did not trust entirely in rust
analyzer because it does not find usages that depend on this
implementation like the `try_into()` automatic implementation).

I also checked for usages in all major versions in most recent versions
until the introduction of the trait implementation (from 7.3-rc7 to
6.19), rust-next and linux-next to find the last usage and mark the
commit in the `Fixes:` tag.

 rust/kernel/i2c.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 0487bae811fb..b4ff25c830fc 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -5,7 +5,6 @@
 // I2C Driver abstractions.
 use crate::{
     acpi,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -517,26 +516,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &I2cClient<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the type of `dev` equals to
-        // `bindings::i2c_client_type`, hence `dev` must be embedded in a valid
-        // `struct i2c_client` as guaranteed by the corresponding C code.
-        let idev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
-
-        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
-        Ok(unsafe { &*idev.cast() })
-    }
-}
-
 // SAFETY: A `I2cClient` is always reference-counted and can be released from any thread.
 unsafe impl Send for I2cClient {}

--
2.47.3

