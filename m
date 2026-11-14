Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686859;
	b=FNmd+Ramv6YLLh2WdoX3qWfZyDsmamaA/pEsFT+drs0Pb29ZB8oqVvWovsmz+SQzVZK/
	 fuBleA+cJTQT0/Kn219Q9yaNnD4K9Cey1mKHPAdnYD+ph8BAD5uT7HY2+rASjPw69l79a
	 S9Z5DRKWKpZIu6BJX32rWptCBMzuI/g9AgoStfTlA/Ncn4Fmvdv1ueo2nwb1DQDMjCxlQ
	 0wexD8JOeZOQp5+Ur9M4JLHvrrHzA1vZ8YTyBnNrG4Cu8C29qxVcLYsd755nhlIY+yL12
	 Mur3yY0QTqKutjSFD6LbOuLh3P3XebFnVjtAtK74zVbQ+VVXsAg4dwf2+ofkOKggxfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R7dtlKbfcr0G/r1hntPJsms+e0JAvg0N9xC2Og7VBO4=;
	b=e6E84ZjNUqaY00EYD7wTE1Rigss0f6SGDH19OtmzN+nCELMTmgVsShCPtpkvmpY1uXOL
	 dyRGdN7z8YLrnITWq9ePxIpE6XUHHQhAk2bKjs5BO/v7+rHkxpugWa2+KBUEMqZSYZtFE
	 OeA7+QWn3Lec1ejDey/HCdP0bYCseerUr4wNruJpZ58YfcMr8nl0BxSTcW/XeSGkdXaIS
	 1/2G4uYVLACpetMVWoA68TJcU15RxF32KMPc+pWaZm5n5dRcsAV+i2FXKptegLZlG0WId
	 nzeFjsB0jKXcTsgKJecEZ5oFMEnRel6nL8MnTH4Aqjvvyvi+BLWwTi9eO/aod25auBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IvfAUSKj;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF05606A329
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 20:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF05606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IvfAUSKj
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso33968451fa.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686857; x=1795291657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7dtlKbfcr0G/r1hntPJsms+e0JAvg0N9xC2Og7VBO4=;
        b=IvfAUSKjFe+lIwItADASVZx37xao2k+85nJ7ppGs3A/dDclCCLxikwEy6Z3VdsHaZV
         y9AzJxLa4EF8tWxeEZvG9ctnIzRUHMr7egjQ1jQpf3UIsUn7rE0n/xAGz88CIiYO6n8p
         +DMsf7/3OhbEjupQ3Hjkw2ttPFTiA2tcMg4VHaRDB+GCFLGtvqPxWNvgd8lsMkTG0KMP
         Gyo8ViqfJqR3w7O6JUHJvw4Ue6e9PmGssyG7kTpaw6pbbrjnV14RA7P2uRGP4RpiMRKX
         3LpndelVu8Fgd5VzWtgGaG5iSmiynimUFYvU2CvXekRyEzQ11JlDoIxzreJZoBwz58FY
         Osnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686857; x=1795291657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7dtlKbfcr0G/r1hntPJsms+e0JAvg0N9xC2Og7VBO4=;
        b=fFnN96WuoNECrx41RL3eYJDGRqHfVAh4j5a1R3DMDPmoihqlCLt8mRekDUQGDtDmcR
         YJ+nBx9MuiPBrFAkBjVx/8guy2wopYBy9HjX08dHor8wXiwz3AgSHcbh6GdIVdwpjsTy
         zD8WNI7qod9TqdAC76yr2ryfP0/tcPaD0NjIpXNOU7WyNm4fjkllCDR/JVwiquYgKMfe
         MR/J1ha+Dk0pyI+cb0CkD/zSzq/UN+CT+sLClvXcmMzoOMBE31ogirtqW2mc3aRonmXW
         MI93B30Wti7QnbzAVICjxoQXFKJcV5YzO7vHh7yQM7lug4OiNiYLrEhB8byn/HDIuq1X
         S8/w==
X-Gm-Message-State: APuU4Z/+fkZo0m83/HuKlij1iBfVd1lbwHQC+xzCrcWr7q5pO30LOIEo
	Ba4HhZU4uFTXbZqKYfYRfIC4w2nynd9tpnFp0k+G7pd+P/2nRPrD7eSR4lW9+XUV3jM=
X-Gm-Gg: AYBFou2Rtv7H8APoe8sJGQilxjXU1EA72BL1XMbQrksqOOvDZIjn/huWAViceAa6qdj
	bTBrWFGw+NNi+mNZsm7sA772KqVhJico5iO9TVJKJi0RSmobyLj87QrCVWCWQ7rLMy43shSiP36
	+qhuvKUS8PNwiDpAAnoVJLTU5eDf1kOiaQ9msHuy4Oyga8WkEhzeuVVZ7yPaBDEtDdX2bpDIqFk
	qjMAR/9aypRR0j9EzikBEsrkzYQmff2gFwgZ7DrUPFsW5jR9iKjAtdfSsPP4qeHAMVLC84xbKQ5
	/u9C0SCJofgWOi9zZ1g9FNWICchGSBUy0p8f6ljJM0Ytg/DDYMVZg5ex/IObh9pQNXWQ7XnsN9k
	j7eoL/Jqy9QHD/jt0TJwMR0svcFtOkuZ/2+OlWPu1RHd3/dFnjeSvLWbGJjCdhBUXfQOY0w6Oeb
	Oa6ndRcvqmIkXF2hOXFzYe/1QOT3XoTF9Sm60DPUvtmu1ZJ0voXsldAnEmOnw+rUAUgkvNRZYKw
	jrSBIF8fwIl3oeFgzfziQwdED4NLx2z6i34JOhXx09/ZPiScmCkEvzqmyzmsuGAQwrCK1h3NICV
	+KNskvkYVv1x5NCSEIy5hOu1JPnF//mXZPiHi6s=
X-Received: by 2002:a2e:be24:0:b0:3ab:4e70:6959 with SMTP id 38308e7fff4ca-3ae1c0008bdmr24199811fa.19.1794686857016;
        Sat, 14 Nov 2026 12:07:37 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712da125sm1891070e87.1.2026.11.14.12.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:07:36 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: sync: lock: allow fallible initializers in Lock::new
Date: Sat, 14 Nov 2026 22:07:00 +0200
Message-ID: <20261114200703.33229-2-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
References: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Lock::new() only accepts an infallible initializer for the
protected data, because impl PinInit<T> defaults the error type to
Infallible. This prevents wrapping a fallible initializer, such as
Opaque::try_ffi_init(), in a Mutex or SpinLock.

Make Lock::new() generic over the error type E, so that it accepts any
impl PinInit<T, E> and returns impl PinInit<Self, E>. E must implement
From<Infallible>, since initializing the lock state itself cannot fail.

This is needed, for example, by the GPU buddy allocator, which has a
TODO to move its gpu_buddy structure inside the mutex.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/kernel/sync/lock.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..26c071088b02 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -128,11 +128,11 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
 impl<T, B: Backend> Lock<T, B> {
     /// Constructs a new lock initialiser.
-    pub fn new(
-        t: impl PinInit<T>,
+    pub fn new<E: core::convert::From<core::convert::Infallible>>(
+        t: impl PinInit<T, E>,
         name: &'static CStr,
         key: Pin<&'static LockClassKey>,
-    ) -> impl PinInit<Self> {
+    ) -> impl PinInit<Self, E> {
         pin_init!(Self {
             data <- UnsafeCell::pin_init(t),
             _pin: PhantomPinned,
@@ -141,7 +141,7 @@ pub fn new(
             state <- Opaque::ffi_init(|slot| unsafe {
                 B::init(slot, name.as_char_ptr(), key.as_ptr())
             }),
-        })
+        }? E)
     }
 }
 
-- 
2.56.1

