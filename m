Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13AC1DF97E;
	Sun, 19 Jan 2025 22:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324700; cv=none; b=U3cPeZogUjq9iPVAEPOVLGMPZgp1qZ4qpP5ZhF2V2ujzv7drC2dmMsnW8j90th5/sSImIl/I2jgCR5vBj1WSawW0n4EkcK44ULshQZK1ErDfHnnVFYlfK11I3OzuAUmzlz9UulPl9IECEljOuf2WF2yX1w/nDcgX6hw/c9zbRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324700; c=relaxed/simple;
	bh=/ocJOCcadGqaCIlMjyqsVq0PNhuWqfuppJTIv21+n6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZlEzRXzRo/B4Vmw/gYmUp5eMW46XPqntHJodbNwFvgFmqfdhlAD67N1qldKCmuBzsSYOtAKQdH5+t20Cznt1qCLUC4B9EGchdGVNX0zPHtcSlu5+hpTiPqNhOgp7nfv9mnrTh8YvrGHe+HQt2/gMwK0yQvDDFJCWDIS2tpBO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUVCaRRo; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUVCaRRo"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so786425666b.0;
        Sun, 19 Jan 2025 14:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324697; x=1737929497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Khz1JjLxJaBmhOjx13S4TINHeYiBeTICVOP+ik+E3/M=;
        b=mUVCaRRowKsp+s9DtNia8QtJBgwveY4gD0G4RZUUyMkNo0H0flXzEjzDvDiil7o4/8
         gQPwNc36ZqTMqJOBcdTqRaLvY734FPAWscwhbe4KuWfhE8Q4cWXFtg9YXQS7e0kS5/lC
         HQ+++hVHIEKlKjRdFxiODTkpL2+FNFWuR2ZTtZcQJkG+fKkFEHOvFwruAYtoe3oVch+j
         cbmunXoG2cDIMoEE//VViG7OB9iR48vwbvWK+pDz9kzJl6l15NTir7X8WH26aYSH9t9f
         tVSNvTfiT0GbbnWyT1lyUXZK5J7bxSOZqOHFmTv4d1ZTc/3hV4UArkLwsnlteQTFdjdw
         0p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324697; x=1737929497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Khz1JjLxJaBmhOjx13S4TINHeYiBeTICVOP+ik+E3/M=;
        b=IMBBgLxVl5KUs0Dy8GPuQ71sCRizlXu05aX1GsvPHbMz2FmvWZb1broYlfKY3yhTLS
         7//dr6Fw1WfLyxwULPmvczry/nvzThIRgeHrFZbyZZqhtK4FSVkeX3h+c/d4eBU4dTly
         5jWHfmXz5JSwP2V7uUFv/BmLrpQkEi8xGUGYQIylXNB/GqYT+Pv5v1rSAoqYm18DHkp2
         vW383vsXz4EClM7deAdVIk4PodAfDo4fV8WYXghPj0GuHej54sJ2pn3Rpp6nctTgDCQ1
         R7UX5sHTlWkFtw9ljQCBzT4nI5RIQPXGalKdwT0Hc07cLnm+Cdfs8A5FGtrQ3LzWofWF
         ZVDA==
X-Forwarded-Encrypted: i=1; AJvYcCUWhUQNhGjy4tZbnpNsLw8zJI2ema61ZwpbuxXtTOkecQJ+uBpPuePskBXrSNJwMdvGJXqooz0Zv5a+YZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFsO18vkf+675l+bXB/NjoHtojAww4DjlIm11XToJO939dT32
	UEV3rsN2ojvGH98gvYC9VeYZfzfKYjvFuEIpSeWE1NafZR8aTSHv
X-Gm-Gg: ASbGnctT9N9F7ynSM9BSPeZT74PR5fUiUyFpFeu+f/dCNqKssTknqsOuq8HfiLwgE1d
	K0vu3K+zviH6sVomRBdkk8/V+OHjMixAjbAduc85c6lO0TxGFzWKCxFoeZNnTrYDql/A7Jkkh7k
	eYmhIm9E6OJqaRPMIKv61yZB9nWzdm2mDA2xCqXwyWLrdG/OPOBeJUFiDLGuS1moa02Z0iSkdKX
	PyW3SWJ2PMPLNRQOvge3pKTg/RMZX2grw0gUigd4JDxxoFfmMbKB/qk3g==
X-Google-Smtp-Source: AGHT+IE8rIr7S+MErgrddAbXPvlaDp8/rRuozN0kdc15hOD+oUg5AgNEXBdW8PJ8uHuFjZ3vo4Ae5A==
X-Received: by 2002:a17:907:2da3:b0:aac:742:28e2 with SMTP id a640c23a62f3a-ab38b1e8216mr1079239066b.6.1737324696974;
        Sun, 19 Jan 2025 14:11:36 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab384c5c3e1sm537196366b.7.2025.01.19.14.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:11:36 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sun, 19 Jan 2025 23:11:13 +0100
Subject: [PATCH 1/3] rust: add Aliased type
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737324695; l=2801;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=/ocJOCcadGqaCIlMjyqsVq0PNhuWqfuppJTIv21+n6g=;
 b=OmcTwxG0vwk0I2cyBK9yMq4QAPg45oFItiXOHOHTdBiUvkZB77c0NZFyFikmEj+J9gTNxDDqt
 mQF+5pUdzxhBba1uCFK9e8F1dtt60IV9UdMpzDKfzsREH+d6H58ctGU
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This type is useful for cases where a value might be shared with C code
but not interpreted by it.
In partiquarly this is added to for data that is shared between a Driver
and a MiscDevice implementation.

Similar to Opaque but guarantees that the value is initialized and the
inner value is dropped when Aliased is dropped.

This was origianally proposed for the IRQ abstractions [0], but also
useful for other cases where Data may be aliased, but is always valid
and automatic drop is desired.

Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/types.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 3aea6af9a0bca70ee42b4bad2fe31a99750cbf11..5640128c9a9055476a0040033946ba6caa6e7076 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -528,3 +528,43 @@ pub enum Either<L, R> {
 /// [`NotThreadSafe`]: type@NotThreadSafe
 #[allow(non_upper_case_globals)]
 pub const NotThreadSafe: NotThreadSafe = PhantomData;
+
+/// Stores a value that may be aliased.
+///
+/// This is similar to `Opaque<T>` but is guaranteed to contain valid data and will
+/// Call the Drop implementation of T when dropped.
+#[repr(transparent)]
+pub struct Aliased<T> {
+    value: UnsafeCell<T>,
+    _pin: PhantomPinned,
+}
+
+impl<T> Aliased<T> {
+    /// Creates a new `Aliased` value.
+    pub const fn new(value: T) -> Self {
+        Self {
+            value: UnsafeCell::new(value),
+            _pin: PhantomPinned,
+        }
+    }
+    /// Create an `Aliased` pin-initializer from the given pin-initializer.
+    pub fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        // SAFETY:
+        // In case of an error in value the error is returned, otherwise the slot is fully initialized,
+        // since value is initialized and _pin is a Zero sized type.
+        // The pin invariants of value are upheld, since no moving occurs.
+        unsafe { init::pin_init_from_closure(move |slot| value.__pinned_init(Self::raw_get(slot))) }
+    }
+    /// Returns a raw pointer to the opaque data.
+    pub const fn get(&self) -> *mut T {
+        UnsafeCell::get(&self.value).cast::<T>()
+    }
+
+    /// Gets the value behind `this`.
+    ///
+    /// This function is useful to get access to the value without creating intermediate
+    /// references.
+    pub const fn raw_get(this: *const Self) -> *mut T {
+        UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
+    }
+}

-- 
2.48.1

