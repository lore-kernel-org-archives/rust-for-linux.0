Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1780448B8A
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761895; cv=none; b=QCE8JQO68TPSIOemjk97v7ZFrB/0Syjp0fj2G/2p1U5ME8uqGSoQhEAh2WM5Aqjj6luSu/NC4UOyDKwaGqHMOucAQgq49hMQ5ifPVvRH7KzDrX7IdyPF3Bzfvq7sO0meCBCa2iIfdzlUcpPj4bQaK5iimwLq0I/2R1Mpvitjr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761895; c=relaxed/simple;
	bh=FJ7ig0FPnRlMyxePWhAE+2w472fgLPZbNxPIYQDx3u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUHP6VD1uBPeSQF7yVBuYzSAzIvqlSkmr6W2YSscV3rNn7O7wTnGRm1IwXrxoaZDPnuqrFKUvsDQuOPE/MDM53gY2g+eiXmFwFlPaV/uT0GqY2aqcsslztP+srhl3//th3UN2MZBbw3ACwOgYCQRdofnF+2kyc40HBTfW/3T8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=PoMBQpdZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="PoMBQpdZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso9358005e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761892; x=1788366692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RT+LV1hqO39gFg4H4Z4mtcLyIbhpRf+QBu2wWoptAs=;
        b=PoMBQpdZAApmQP2QpkpiDK6k/opu+jtxJ61X3zfjdraGjvUYnhPq1NnwqZ9/5G1eLd
         zejtultnssDutLgEwvmxLkmd9TtQ48y8VLQO8kuEegtDCnn6XkAWotJrTGR5YOqBzkGm
         /vj+NCSEtJ9iDzf2YV3oTvKWiP7HuAO54mEfYY4Pw9ujbkqpOtXepsSop+EZvAW5XjGN
         WwZy0Ru9+sTq77j2+if4sCv108ifswkrWcmgpV5Qdqjyj30Bdwitda+7suR51X14HYws
         Kh+oTlhogB+Jhz47D/ig6siGz6M6ILaz2RbkRAZopp3xlQfHDQAp4IX1Pype2hKfIqzD
         WgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761892; x=1788366692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RT+LV1hqO39gFg4H4Z4mtcLyIbhpRf+QBu2wWoptAs=;
        b=ApdZSvgv/qfcObbR/PL5noxP6o/R5jO7/vHyDwFXP9dlbl1Eah+xc8KT1AvoPy05Qe
         u97sPVC+R4eDIeYZluNpXt0lGG7ME318e6b7vn0LbmBiaRiDkZbuNpADUeZK/v+pCoS6
         tlWGzXIOO2FtnLRLEjGpHmh3CzlQsGQWm0VvYa74p4EzA/7jJj8+nxyjY4pauOjx1v5k
         ovQ+/g5Yo+OA6/TGwdoOPsvw5Op8RI+2KV34brQeosun6M3kwumu5HHC7lKggYrPPQwf
         QjEthJvjdgF3+GOw8Mz/ttnoX7Y1SK+PMMqJBh/nN1aBOgQuqm42urChKg4mSHyX1xRe
         KZxA==
X-Forwarded-Encrypted: i=1; AHgh+RpeXIBy/3LREz/tzBH/tNNeyTyDXJmdZSATeN82cgyqwUcGKI6EuYb6I4hbwGVIni94IGm2I5CKKC1tIF3Ajw==@vger.kernel.org
X-Gm-Message-State: AFuF++mvKDTo5kaS3OrTl95p0dtj1UqNf2FWc916DKhLs1Trm/K+tUv1
	O0DgZ/B+6+GtqY+NohMZb9R48QZ+pgvdzjtJ8JjmfLjFAWD0ZynR1KqnAuoo9WW5+A==
X-Gm-Gg: AR+sD12TQ2QhCGCGaCYaBXp4yzUjoHm/TgiD9wxehtSbIBvkfb26e8nomEIACb5GOO3
	dHnxFs5kYMd4dyoWfrp7s5nFTUR9TlptZlyvUInnYsC4CfV5/FjatG0nJQmo3iKk37SivqSBgi+
	P8ua+F24pso7teFJq21a1ZN7hCEUyThEpLSo4Pv6QDqnJhoEz3au2XgBZpUvASMRVD/VBo24t/5
	K7T3JiXRgjXaCqzlB+r8CVVQhisw63d0rryTzUrHtVP9kBUEHUzjYmNPKtXe7/ZHAffsJiMFjGa
	4O0cw0BYTmeKkmnJnDVChQYuznqr50gFDhnad/JAYsWTOZ8O2cM79Opl5S+RaUkqdE+dPcTg6OZ
	QNd5uBfTclunCIou/sOovrmQ/hyigGYy/UyoSobOMoCdb93+X4YERDbqcb+x4hXNmJWikP5r1Uj
	OhrG4Wlua512KdltOECl/7uUTHZ0CdLb4lJdDJGlNG7DlOLa8Z+rVvt2BJp/MuAkdm7iTQt8KWA
	XOsAUd2ewV46qLAo6nrqrzWQi7V3zbXdnTdu9P0aYksJQk=
X-Received: by 2002:a05:600c:8518:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-499dc720ae9mr95399745e9.9.1787761892048;
        Wed, 26 Aug 2026 09:31:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:30 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] rust: usb: expose device descriptor fields and queue readiness
Date: Wed, 26 Aug 2026 17:30:39 +0100
Message-ID: <20260826163101.4168-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A driver that identifies hardware before it decides to drive it needs the
device descriptor: idVendor, idProduct, bcdDevice, bcdUSB, the enumerated
speed, and the cached iManufacturer, iProduct and iSerialNumber strings.
bcdDevice in particular is the only revision a driver can read without
already speaking the device's own protocol.

Add can_send_n() alongside them, which reports whether the next count
queue slots can be submitted without waiting and reaps completed slots on
the way. A protocol that must not block halfway through a multi-URB record
uses it to defer the whole record and service its control plane first.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/usb.rs | 96 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index ad40c814616a..782bae53584d 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -1430,6 +1430,7 @@ fn is_active(&self) -> bool {
         matches!(self.urb, Some(QueueUrb::Active(_)))
     }
 
+    #[inline]
     fn wait(&self, timeout: Delta) -> bool {
         let millis = timeout.as_millis();
         let millis = if millis <= 0 {
@@ -1441,6 +1442,7 @@ fn wait(&self, timeout: Delta) -> bool {
             .wait_for_completion_timeout(crate::time::msecs_to_jiffies(millis))
     }
 
+    #[inline]
     fn finish(&mut self) -> Result<(i32, usize)> {
         let state = self.urb.take().ok_or(EIO)?;
         let active = match state {
@@ -1700,6 +1702,34 @@ fn reap(&mut self, i: usize, timeout: Delta) -> Result<bool> {
         Ok(true)
     }
 
+    /// Reports whether the next `count` queue slots can be submitted without waiting.
+    ///
+    /// Completed slots are reaped and any transfer error is returned. This is useful when a
+    /// higher-level protocol must not block halfway through a multi-URB record while waiting for
+    /// endpoint progress; callers can defer the whole record and service its control plane first.
+    #[inline]
+    pub fn can_send_n(&mut self, io: &Io<'_>, count: usize) -> Result<bool> {
+        self.inner.check(io)?;
+        if count > self.slots.len() {
+            return Ok(false);
+        }
+        for off in 0..count {
+            let i = (self.cursor + off) % self.slots.len();
+            if self.slots[i].is_active() {
+                if !self.slots[i].wait(Delta::ZERO) {
+                    return Ok(false);
+                }
+                // `wait_for_completion_timeout()` consumes the completion signal. Reap the URB
+                // now rather than leaving `send()` to wait for the signal a second time.
+                let (status, _) = self.slots[i].finish()?;
+                if status != 0 {
+                    return Err(Error::from_errno(status));
+                }
+            }
+        }
+        Ok(true)
+    }
+
     /// Submits `data` as a bulk OUT transfer without waiting for it to complete.
     ///
     /// If the slot about to be reused still has a transfer outstanding, this blocks up to
@@ -2626,6 +2656,72 @@ fn inner(&self) -> &bindings::usb_device {
     fn devnum(&self) -> u32 {
         self.inner().devnum as u32
     }
+
+    /// Returns the `idVendor` of the device descriptor.
+    pub fn vendor_id(&self) -> u16 {
+        self.inner().descriptor.idVendor
+    }
+
+    /// Returns the `idProduct` of the device descriptor.
+    pub fn product_id(&self) -> u16 {
+        self.inner().descriptor.idProduct
+    }
+
+    /// Returns the `bcdDevice` of the device descriptor.
+    ///
+    /// Vendors conventionally use this as the device revision, and it is the only version a driver
+    /// can read without speaking the device's own protocol.
+    pub fn bcd_device(&self) -> u16 {
+        self.inner().descriptor.bcdDevice
+    }
+
+    /// Returns the `bcdUSB` of the device descriptor.
+    pub fn bcd_usb(&self) -> u16 {
+        self.inner().descriptor.bcdUSB
+    }
+
+    /// Returns the enumerated bus speed as a human-readable string.
+    pub fn speed_str(&self) -> &'static str {
+        match self.inner().speed {
+            bindings::usb_device_speed_USB_SPEED_LOW => "low (1.5 Mbps)",
+            bindings::usb_device_speed_USB_SPEED_FULL => "full (12 Mbps)",
+            bindings::usb_device_speed_USB_SPEED_HIGH => "high (480 Mbps)",
+            bindings::usb_device_speed_USB_SPEED_WIRELESS => "wireless",
+            bindings::usb_device_speed_USB_SPEED_SUPER => "super (5 Gbps)",
+            bindings::usb_device_speed_USB_SPEED_SUPER_PLUS => "super-plus (10+ Gbps)",
+            _ => "unknown",
+        }
+    }
+
+    /// Returns the device's `iManufacturer` string, if the core cached one.
+    pub fn manufacturer(&self) -> Option<&CStr> {
+        // SAFETY: `manufacturer` is either null or a NUL-terminated string owned by the USB core
+        // for as long as the device exists, which outlives the borrow of `self`.
+        unsafe { Self::opt_cstr(self.inner().manufacturer) }
+    }
+
+    /// Returns the device's `iProduct` string, if the core cached one.
+    pub fn product(&self) -> Option<&CStr> {
+        // SAFETY: As for `manufacturer`.
+        unsafe { Self::opt_cstr(self.inner().product) }
+    }
+
+    /// Returns the device's `iSerialNumber` string, if the core cached one.
+    pub fn serial(&self) -> Option<&CStr> {
+        // SAFETY: As for `manufacturer`.
+        unsafe { Self::opt_cstr(self.inner().serial) }
+    }
+
+    /// # Safety
+    ///
+    /// `p` must be null or point to a NUL-terminated string that outlives `'a`.
+    unsafe fn opt_cstr<'a>(p: *mut crate::ffi::c_char) -> Option<&'a CStr> {
+        if p.is_null() {
+            return None;
+        }
+        // SAFETY: The caller guarantees `p` is a NUL-terminated string valid for `'a`.
+        Some(unsafe { CStr::from_char_ptr(p) })
+    }
 }
 
 impl Device<device::Bound> {
