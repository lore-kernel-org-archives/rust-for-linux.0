Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63668274658
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047643; cv=none; b=nhKiN93n9cBey5XeDPd9TQ58jTb5hwwo+rOzphdFUTj09ohPWEmnt2wIadG44rVP9NllPaPR/pW+JHr/Kf9qOdOEO3Yv0WICPBMXmpjsHbot8bdTJEAT5QMEuWPcqJ3GKdcyhKqDArtplFKm8rREU8qtSGIp7bQHOY2raiScPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047643; c=relaxed/simple;
	bh=CbejremmPo0pnguKBAoyXlGitUMfH5QKor9Zlh/0leo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bt0maU/dT2y5Oi2QuVvo9GYGjz0O5hpki/7fj5Gw9jnnjlyF4qt3aZxmEZvoIJO2uP+ebuMF+VxRPTULXttrOwsZm/TP6YSikSF9eZXCDaQi48QlkmqSvj5tArALZ53cS93iz7/wKBXtynrlQ3/QoAv3hmR3w+VlxrQZez1iRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ySq1j0/1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ySq1j0/1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso98650f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047640; x=1783652440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khpKEhGRmyguep2Bpl1rZ96Eocun7C/iOH0/0gnncdc=;
        b=ySq1j0/1y28ysZYnqE7qhHAUmcNAPons1tS7lGKAd2hzUnkc2Bf7sMl1Bj5BNoZlpx
         t4kRicloo8hUHvlzUnWWd+7XmdsBldHckdDHyi0twzsIwJc9sQ6MBq5FBq3r5YO01XQa
         0zgo1nfSvP66rAQkwYWnD1Y2JN1HGBKsiRE+iKX6jUYUwgYE/bTFSxJ6Ic/zaYEqcn92
         TUI4Jm3BI7GrJYf6gqbJeaN01pMxfw665exWeXVztqoVVQhI0fnt+YRBKsncFgkqPzXz
         CPO/feIe+0CKUeVEYLm8n4511ISv1PQg7bPQTq6caW/9Ugc2YL3Y1JfcLxObXuWCdj7N
         ZvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047640; x=1783652440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khpKEhGRmyguep2Bpl1rZ96Eocun7C/iOH0/0gnncdc=;
        b=C7aInlaOo+jLenEcDJ25/aiLlh+vOGZwhZrj9Zmhgwcuq5j1n3bRuerU2K1EHBYyul
         wSJpE3DaUVr1X+hKQxHWvbv5UYJoRqGuMVsctXHcaiR6jwJhwdufTN1z5OKeoOs2bH+T
         syGTayips1FUx59dyxUCJA1r2UsXeeDfKts13Rm/WFmi/SuShTvlt1PRY1qpopy74BoS
         Q+Hx4wP3p0KRn+KTsd0xq6EDoI6JoQZKpIxGJ79lk7bKDFXwNsr+vbdIEbkN+q/AGKR7
         vLKHRb2ghVurhR1CbX/Xb0C1JT0snW4eedSJaP6RLyFXgHq3GQLgKId06nWbwJ5zmVdn
         HhkQ==
X-Gm-Message-State: AOJu0YwcOvWqY2C1tvpM5vwLHzvtuO/FitgnQrcKZlWAGhdsdXRSJsHm
	qLe6D8Nm+q3GqdhdwPSzuhFYH5VPRdSLTURGET5I7wfGLw4+GE8UJvdqLWyFyVbjwLrFWAwVZF+
	39uixjFpP
X-Gm-Gg: AfdE7clYdukJ4uD7IBAL7qSx2VerHpmK4Jo0DKU5t9gmbWsr+M0EW58WAgrXLlkZk/f
	ZAvlfTKqbh3gPMCxAhAim6F+QLLkYfoCvEQOLDQhX/83pE68yL5r515mkS0tsl+KQVF8CJU/QD5
	H9Ew/cJ4ebX5AxpB/vdDNlsc9n8FG4tW93oUnSnBxtPpQC42oIknoZC4twnFbVWUuslxCzg38sL
	n6nnQ0KWgwc+RBXkiZQDDxK7+W7DvuU8yWWJMbuBtgcFX1l73i3XVsLXC3geBzljuk85uzIO0zM
	HK4FmHjLWuTnHkUIfa6uaD97Hb1NnzW+rsb0BqP2X5uyaqoBkrUYG+6nsLkrF4A752i1Zsiskw2
	7iAwiMSAg2peCdikunvYMjsEXQMq97NbhmO6LhQugAY+m/N6MWvuHOiB9pTGEYyDjhBvr1i8xoC
	+xuI448JEvDSlwA9nE/nDfsi+3v2qqiqRi6Nh4iWfjgZRY7vQboB1PvErnpzD9BLLs/4U=
X-Received: by 2002:a05:6000:2907:b0:475:f0c2:75a1 with SMTP id ffacd0b85a97d-4775ac9f442mr12773554f8f.50.1783047639890;
        Thu, 02 Jul 2026 20:00:39 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:38 -0700 (PDT)
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
Subject: [RFC PATCH v2 05/11] rust: usb: add usb::Device::clear_halt()
Date: Fri,  3 Jul 2026 04:00:09 +0100
Message-ID: <20260703030020.2694-6-mike@fireburn.co.uk>
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
2.55.0

