Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896028C2A1
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047651; cv=none; b=iktjoWzAbXqau+pv2WAkxDBKrXvzOsQy26I4rzXxJ/HL6j+SR4nQf6Zozwd4+dSzKByLpTgwdtsrO89XZXmFle8qntUXW22etof8j+vVzLn9dLrt+4PGlOS8TScEdujhV6HSMDfxmPReNe4GamEcG0QZy2Bo8EWpPjs0WZYIgAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047651; c=relaxed/simple;
	bh=uxuzeLnNgjflF3TybJRFCjQpg7K0eWk4556A9oU/6Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0MKS0XwTMrHLC2CKGVpXOCydpz5xX6mEXd8mxvX93hZkOrBv68GZuinYr+6BzycQQyZrw5yRo0/tXCPGmLMulWGHaJfc/fBJ+2zoNHE0HahH6JeDLqBMZGP4pzHkteOwfx9+pVtsy2L7/0CxjxFaEMSV1mjhBS58q5S0fmgxlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ifSckSiF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ifSckSiF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45fd464d51fso37919f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047643; x=1783652443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deICmiv9Ch/jTIv/OhIRyQpM4BjXGgxcInUpinxQbZM=;
        b=ifSckSiFFbY9SiuZZCejHf0GFd0JIweriH/LuZoCHr+lmZLb4rPR3612KSYE/US+u9
         S5ecWEnz6to5nhTdYDY9Pc2IyY893l8gpq/YD+S2V+9iEIlucmeLlqn7CVqmkkOIa+PR
         0BQgA/TzIylycy6SGTylgnl6ycCpq+o/w2isF7PTLCi4+3+mcXlTtgjqT+QGH5p8YqU8
         E9NYw9Edxse1VLHwjgwoIK4rKQPXWritz3EJUt38ofJWgi2qnff00BsZZbGoKLpeRhZj
         reX3RAytbgkKDvKfmjdo0waG/YDJKNQBbOMFqin6WvWzeSYO5WxEjneGcNVFkh5GT65i
         53Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047643; x=1783652443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=deICmiv9Ch/jTIv/OhIRyQpM4BjXGgxcInUpinxQbZM=;
        b=arVp9urs5OiNZM0rV6Qt9aHFR5JVvlUp0tJrR4VM3fZ1owjMwEcRUXjDlukiwfse/+
         LB/s0g3rNEstTRWNT4EOeZbzoWyl+2stNMprBgTTLcuYGcWAPUZYXXnIm3Fdr/VA3R4p
         eXlk8Bfj7nJEMVQ1H3mJDhQgtE40Cuo1eedd3IJD5K93FkPKi6XFGRK81Py36ZkyHOI5
         y7X4vbX3i+6/bZD7cdS0rPmzdw337n5X+gKfLqZMnKdOPOUcP6SaRZEr1CdfLxbKr8jC
         w5M11k9kB5JhoXRbhfB+gca+5KyzhVaxK/erOHs5k+YctpKBKGtgtsS+Y7aDpotimATu
         SnPg==
X-Gm-Message-State: AOJu0YzJSpm0idHoOdEfRCBEuDwWZ2QR/DKtIVe6plNbdCy5N7umjLRW
	e+XveOAEsGVM3fUDACBCobk4f1zFzv1nwIZcC8Agte6t3Hmlf+uFe8qMF9MwfmrYBybZ7wN8MyU
	aEKXx0Qav
X-Gm-Gg: AfdE7clAwQJcOdhkCv3dtt37SlTF74nRvcLtmrq6G5lIBysaR/Ts5NV/Dzq9XNaCJbg
	qFOBTldqj7BN/ny1b1sERG3yB//7pGNEHDAJuhG6OdyHZ+yYP83q6dWqLKUfo+fHXtjeGbDiZ9Z
	lHcO4Qv27IhEWhkAr0YwvwWJBKmQWbVvcK2uPtjz0qwszEHVuHtGbRj7XxA5bS5WPPDDMZKWwUs
	UvGS+DBjajCeZOx8ZczRAYupdlCC7BVHGzKJvDuMhXTpTxVygZILLgpSJ2nyAzzkeqJRH4t6lMX
	qQ+INHDUc86oOcAPGqdPBg7tEczFM4y5E+Ir2aeiR/hQ/QgSgw8DwqE95Vq6pOmJoHxVgDMVwJe
	r8kx3TMl0Er68lS8flbt+97wHOSBoB3sVf+LPT1DyxQwgLE92UV2iv7ywimIwN17N/JS7q/vO4R
	2WuX2aa9F57v85Wq4YFYjvxTKJO6iigQygC/XnKzZt/dBfmIFtzvHNXDpW
X-Received: by 2002:a05:6000:4687:b0:475:36a:8caa with SMTP id ffacd0b85a97d-47759c263e3mr8943322f8f.46.1783047643464;
        Thu, 02 Jul 2026 20:00:43 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:41 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 07/11] rust: usb: add usb::Device::reset_configuration()
Date: Fri,  3 Jul 2026 04:00:11 +0100
Message-ID: <20260703030020.2694-8-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030020.2694-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
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
2.55.0

