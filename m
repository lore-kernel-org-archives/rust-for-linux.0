Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C2047DFA8
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708458; cv=none; b=IubYAbSXD8w+WNVB6yx/jQtD0jzegsP3pPyPPjtRbdaMRie+0HJK/VB07GIziiHTRrmN4M40Y8+qHJweWe3iu2HutRH7o7PiInGJmAQcmn1CPIPZABV+zzUMuTyYFPuz3skite0H4eZOu+5t93uz4vi1/hBfyRFGliHg8go7qRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708458; c=relaxed/simple;
	bh=Vjmn5zlVy3ENmtOOKrqNlnZSpEZa4C9kI2uXKZhxzvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WduWrtdQPIa40DIP40IXj6u2tCicS8Q1CvUS/7t8Bp33bMzpMvf/1x5X7ccZPCkbbwMXx9OmPDA7CG1ru8bkrKKpzv7582ogPH3Au3/N70Hya1ChAY1PFGVTVZ6qGTvj+cS68GNI/wxyLDzJTeF+LcaSjDWOYoM/QOGrlYM1ISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Dij7HezB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Dij7HezB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so8792075e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708451; x=1782313251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLsPxcuAzIdyY6rqQxjux8ncAYLryPIVQK2x1HXprbQ=;
        b=Dij7HezBvQwC3c6eZgkmfMyByl9UAHOhKW0fRXeOqCc+Sb1ZkmJhdDp9LKdrVdXU74
         ed7DOoX5AQP1fibx2+sGcBn9ZQ75LwrrpHpBrhuXSE6g2igSfGU+5QTEccE0S0SwGLly
         bZgXBqMrBw8y+bRok28S6tGVAz3RXYGnc3qf4IuSLhccB+IHniy/vFv49TC/pUmXTIFy
         BPBO89ybNecIdhHg5Uc+IILvFft80ahL0kWTBzsh4B5SZjTuNQlW5JTgGt5r6xvFP8wz
         0RRseGZv2hVcr71KEaVOy3venE5pOPF1sKErW4OZr9BCaIxcjYbYvb54ca2JxPPEVjxc
         G5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708451; x=1782313251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLsPxcuAzIdyY6rqQxjux8ncAYLryPIVQK2x1HXprbQ=;
        b=gxCW2GD9h5b+I2tAAAL/xOcjqMiAkTxnStb1HTg79QDSOEh3cm0vT+6MYoTSS0s+C9
         74ty9k47nzS9m0ERxFMKUbZbmiPtp01isT4gGx6JB4+qqbFetQ69V79qrWfwrtv1VjkX
         uremfTq4YPXIY+UFOBgvZ9NeiKOQC3Gz0rQcfdIJtNPOQ6HAax+AvOj26UEw85dFAkME
         +jUZxWLSqnpC9dXsQn0mmtUtIHVGCD+Pi+KyxgMM+P9mfpG5NPVRt9qXiZPiyX7BG8B/
         MJ6LjVmiX9pfrDnjuovU3MCUPxKiCyW8hJbXvL71ba4KRJC4tAQckwyCQwpIg8C6rFho
         WOIg==
X-Gm-Message-State: AOJu0Yxj/pgGQ759EWKnMVbM0TH0gleAlxtBt3WZCfLZsVecukCveHri
	YzYR6iS8Mb2ugDzDOSL+a3tZvMvib+fP0TUBS9sx16KrhGRs3TfWrpZMa+gMNGCfo19zxUcRYio
	aCYrGtlla
X-Gm-Gg: Acq92OHX3uz0UTP0Q2gHuMsjhcy0GSldOquYw2TYlwgQ4uBT3dZdlMmNipHPmXHJZn7
	advdjsfK6wBj48rkjMVWFmsv6oS+1FG5r1mp0xZg16FvuMceJhulM2EIQ5FgZ9N9xg3bZg2TSjs
	lDTc6VeJWd5RXsz+hfUnuUuVPMCjusGEl2vbcSh8AFv3brxBM3Iz1vHJ6izJFYfpXcDP+5B9giO
	6T6Zll6ZHZjmbFyabeer5/AvXxXtrY/e7rBtQb86+5vwI4/AKhQQkCuLlAW5scAkx+4uNpKmEKx
	qGZd2wgINpd+FjFyATQNF4WHRegHSwU6G4iI2HMKz79bIaHZF5DMmNmhd+XVkTdnMl7eHZukrnC
	3SdNpwQD4smS2Sd1cSSwU/eCw8J0eCm01nwJIEcON6KZzvESifAYPoJKo0iIuUKWVw4+D8dfCZh
	mWFmJp34RgegVqnltGp1jT5riI7yq7C7Llr1/CEUaSj8yND38Hhu0WO5H4abnN6T1LpP8=
X-Received: by 2002:a05:600c:34c9:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-492340bc986mr53143255e9.4.1781708450969;
        Wed, 17 Jun 2026 08:00:50 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:50 -0700 (PDT)
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
Subject: [RFC PATCH 5/9] rust: usb: add usb::Device::clear_halt()
Date: Wed, 17 Jun 2026 15:59:17 +0100
Message-ID: <20260617145946.1894-6-mike@fireburn.co.uk>
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

Add a safe wrapper over usb_clear_halt() so a Rust driver can recover
a bulk endpoint left in a halt/stall condition (for example a streaming
endpoint that a previous driver left stalled). It clears both the
device-side stall (CLEAR_FEATURE ENDPOINT_HALT) and the host-side data
toggle, and it sleeps, so it must be called from process context.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 683e8b52d6d1..a151a120e82e 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -448,6 +448,30 @@ fn as_raw(&self) -> *mut bindings::usb_device {
         self.0.get()
     }
 
+    /// Clears a halt/stall on bulk `endpoint`, resetting both the device-side stall
+    /// (CLEAR_FEATURE ENDPOINT_HALT) and the host-side data toggle via
+    /// `usb_clear_halt()`. The transfer direction is taken from bit 7 of the endpoint
+    /// address (`USB_DIR_IN`), so this works for both bulk IN and bulk OUT endpoints.
+    /// Must be called from process context (it sleeps). Needed e.g. when another
+    /// driver left a streaming endpoint stalled.
+    pub fn clear_halt(&self, endpoint: u8) -> Result {
+        // `usb_clear_halt()` must be given a pipe whose direction matches the endpoint:
+        // it issues CLEAR_FEATURE to that endpoint address and resets the matching data
+        // toggle. Build an IN or OUT pipe from the `USB_DIR_IN` bit of the address;
+        // using `usb_sndbulkpipe()` unconditionally would force OUT and silently fail
+        // to clear a stalled IN endpoint.
+        let pipe = if endpoint & (bindings::USB_DIR_IN as u8) != 0 {
+            // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+            unsafe { bindings::usb_rcvbulkpipe(self.as_raw(), endpoint.into()) }
+        } else {
+            // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+            unsafe { bindings::usb_sndbulkpipe(self.as_raw(), endpoint.into()) }
+        };
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `usb_clear_halt()`
+        // only issues a control request and updates host-side endpoint state.
+        to_result(unsafe { bindings::usb_clear_halt(self.as_raw(), pipe as kernel::ffi::c_int) })
+    }
+
     /// Issues a synchronous bulk OUT transfer of `data` to bulk endpoint
     /// `endpoint` and returns the number of bytes actually transferred.
     ///
-- 
2.54.0

