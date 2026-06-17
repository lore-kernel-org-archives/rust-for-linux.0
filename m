Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE3480DDA
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708469; cv=none; b=Wp3PPwD+WK1UGEo272YDdP/Rf7KygMxE8rk1n+FFG5uGkH4cEDkixuUFY8VhEYdror579E9MHjXoaXMJcwflSh08Mtqla6BYYkj6vf5IJSJLSN/28UYCxSWHEo0gN2cYoIviWTQu/D9W7lVbruANrobfOJHrTNmLpvFLUIwjEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708469; c=relaxed/simple;
	bh=bt6zDaJ0vnaMQLoNWupzf/a3UM+UiIsrWDMomBp40HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miF5RXhRY+mBsrWALRCzV+0jN1nWGp9sBYTM/R3vgHqz3Tof/hGKn5+VY6R6FnpRX852QI4tubDEwfAX3Vqb9OeJHnel8OuKA1WLNHQrbMHyh3pJsOVT9ll0h4Ly5zAdVQilxqMAZh0VMRa1y0q4FLfy3L+Y5YE2XSIzjt9U9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=x7FnnYAe; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="x7FnnYAe"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46255b269c2so833400f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708462; x=1782313262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPoNdpy8AP15AC8CXF5QBgukG+bCqakvIlPx8NzDbIM=;
        b=x7FnnYAeua8ZXl0g+lSVpHQsqLe7Yfo2//bOR4mNrOEbKsTO3ms5CEt1ndeEYCJkPo
         1NKCwL1DKLy8qDbK+t6OpMwZmXCbbyxcD3cf5UA8nKWI92+hWpDtWQTufxxhzXKhRl/m
         9CW4TUhaew48vezcy1PEi1fYYdI+gxK+OLFaCzAA1RKJ/XEhOeC0G+CTbnX0w+KQpYD6
         khuW0Ed5xcwGsV677GhzvtpfsuBU7XVGAicNKN/klBSq1GLQRlaobeC6YclQzFSyP0nn
         pA8KaYPPuwcNnPsnp7CxURjWhj0ZGIkSwK4DugNE+Ft7U74Ru8gIO2V/iLtnWPWp3sqU
         v4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708462; x=1782313262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KPoNdpy8AP15AC8CXF5QBgukG+bCqakvIlPx8NzDbIM=;
        b=cG/vh2vN5RL648y/JJ5Y2bwsUCSSgh7Drmub23SQZuZUcaP2mixFHn+Z7UOlirwHG4
         0vMPyQ8+kH/JhXLYXoa73d/sg/uQypxZjdZXOJw4ZHhJsst58icDM+7tR4qt8m7A765S
         93X3+XS0MhFcUFYUCrPRnAYK4hCLY+xEgKECS31O8uMRemf/iSq9w2JSuIcqaKRj8O2n
         8qY3uKxeBgW7AfRlOebH8BxwuteEvv+i0rrAnT5/3tfgDxE+/QEyPSWxYPhFBtfKieeB
         WIFWDcIBHk+dQGm4wsS/xDi5jf+PkvIpF84949CpPODgIhgSaUN395sCBekATj3MuY4C
         p63w==
X-Gm-Message-State: AOJu0YxwJnDYMSWid/yS1QMqG8IFztjo+mCMlI3YPZJ9D9c0WWTtjWYJ
	FmJVZRRMh4eVudLRcg3TzBBUmmS+kAkGzL/ZyrDg9GQFcLzy6v8dflilr28nnS6AH3mjBOz62qJ
	TFGALwFdj
X-Gm-Gg: Acq92OEOSOgq7BNYDgFJ8ohFvN/uUTRKWKHjLvAYBKWCKgIJcNXnGWGEXj+47Hwou9s
	sy0MKuVO++esGj7z0fwwmqsvm3SSS86qyh6WDqQV4o48OTU8y0rIeHKPOR8y2bzyGkPW4/j1kBm
	16Hs6jAS2YOURXj4CPbMPbq5lkU160whKmO2c0boUT/IbYTv0tIiBuFF7++t1WPVywWdTwgwIHH
	adLdxpu7X2ms9SS3jgyREPSqiZ4o4EIfga7soAL0RJavCYJdjw6E9hzGveRMzx+jcrLsvucEH+o
	JVEV32KezpZoyH1Aq2TeRuM/9KNmT2dbVxlBrkRt2VGs8SZ1fKh3tcEEvKNuGw8y7Y3p55AlKFy
	zZfOl8DqhDIkZSJHIEXKsE/7RduVKqTOZfTjTEV/hLtBs0Y4MXHlwoipxJkNp+dr8bv2DZgeHUd
	ntyAxjgZ0dFerYMojhSONrPXOEVpjydsMVAw/1ObSeehtHMKvYwCrcajKy
X-Received: by 2002:a05:600c:6089:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-492333ba29dmr75144445e9.6.1781708453371;
        Wed, 17 Jun 2026 08:00:53 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:52 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	linux-usb@vger.kernel.org,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/9] rust: usb: add usb::Device::reset_configuration()
Date: Wed, 17 Jun 2026 15:59:19 +0100
Message-ID: <20260617145946.1894-8-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617145946.1894-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a safe wrapper over usb_reset_configuration() so a Rust driver can
re-issue SET_CONFIGURATION for the device's current configuration,
resetting every endpoint's data toggle and returning each interface to
alternate setting 0 (clearing stalls) without re-enumerating the device.
It sleeps, so it must be called from process context.

This is the in-kernel-coordinated way to recover a device whose endpoint
toggles or stall state have become inconsistent with the host -- e.g.
after another driver was forcibly unbound, after error recovery, or to
return a multi-function device to a known state before re-driving it.
Drivers must not open-code it by sending a raw SET_CONFIGURATION control
request: usb_reset_configuration() also re-installs the host-side
endpoint state and is serialised against the USB core, whereas a bare
control transfer is not and is unsafe on a composite device.

Because it re-issues SET_CONFIGURATION it resets the toggles of all the
device's endpoints, so on a composite device it disturbs sibling
functions; callers should treat it as a heavy reset, not a per-endpoint
operation (for a single stalled endpoint, prefer clear_halt()).

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index c7bf4637ee90..5dc5b496b970 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -697,6 +697,23 @@ pub fn set_interface(&self, interface: u8, alternate: u8) -> Result {
             bindings::usb_set_interface(self.as_raw(), interface.into(), alternate.into())
         })
     }
+
+    /// Re-issues `SET_CONFIGURATION` for the device's current configuration, resetting
+    /// per-endpoint data toggles and returning every interface to alternate setting 0
+    /// (clearing any stalls) WITHOUT re-enumerating the device.
+    ///
+    /// Wraps [`usb_reset_configuration()`]. This is a blocking, sleeping call and must
+    /// only be invoked from process context. Note: it resets the toggles of ALL of the
+    /// device's endpoints, so on a composite device it can disturb sibling-interface
+    /// drivers that are mid-transfer.
+    ///
+    /// [`usb_reset_configuration()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_reset_configuration
+    pub fn reset_configuration(&self) -> Result {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant;
+        // `usb_reset_configuration()` only re-issues SET_CONFIGURATION and updates the
+        // host-side endpoint state for this device.
+        to_result(unsafe { bindings::usb_reset_configuration(self.as_raw()) })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.54.0

