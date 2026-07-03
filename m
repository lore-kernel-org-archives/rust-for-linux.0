Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B113019AA
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047722; cv=none; b=V3fYzLUqR4kmaf6B+z9GgEIYZVVU65ve0SW6Whao/iCq+hp4DHEuWawUO+tMlWdRTa4rnS10/bnOcnHZHsW7njJk40SPq+zjxMUeoviMB7vavgYggrSYDbdgHEW1Qam8uEHOTNJ/FRU/d8ZI0wKY7T/Y2bHPl5avZYjTacIzHUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047722; c=relaxed/simple;
	bh=KO0FTjJOVLLsLn7UvcJmS/2HPJY87y5uWlvw2Ys58wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLea1aUVZOUgg1mojgqNmEOys098iY4u7fqRZRovkN9u3Z7luAbDb0a5PiEuE8h99O4ph4+nu/K9MiuSkQLapLxUetVomb9gnDJXaJR2iorzzFUtOfBKbRLAMm4+4/omxwz1/hM49RgOpLiu6x3QvLle5kDdfmD87WJQIPUw8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LJk3GBc3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LJk3GBc3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-473ba028d46so106451f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047719; x=1783652519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWYaWvLBgitKBD1DvypUSuQXP5THaJX3kX34tELc4Xg=;
        b=LJk3GBc3xlogoqE95lqrRD6Poz4dyONZJFeGI/ah/ugQogyRqB970woEjmQeoLqk+8
         Ywo+YvbxKpNuc8HCtsOcSeBAhb/hOvq8wYFs2UCiKMYHZLBkzY0Fde820Y3vZv5ubu1i
         zprkpJv07zkknfRuT03Xqa7rupWMb+9zlPCbAoQ+TnHDRR/ECJlNkYHon9bFiS9XQoQ1
         eU/VXc9p2BebO9HAoXsBYbuLdc9tiQocYnSrHT8r5CjZpi01WqQnXzNoVdKFRFpvBBe5
         wsIGajTSqbbspCPQi9P7t1EjPd3kkdNU3rJcGyk3/ExqxXpp+CtD+si+tXhCQkonTIXe
         6Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047719; x=1783652519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWYaWvLBgitKBD1DvypUSuQXP5THaJX3kX34tELc4Xg=;
        b=sG68jAmS/0eHTz8B5IudoCafPSbdQLg2vBlSun1QSU3jtXDjC91o0+I2d7tnxr11zA
         74CEGqW3xwDrHrb/cgrFIfWj48LiIuvcWPStrpc1Uksh5cRW2oLQ7jDeqoPWXZztR7sC
         Mc93n8jdQ1OCRC5+a79L7wqCYrp51r2fU4nQfidnwEJ7rH2/m5P1QkA6CTBtTfJPdO4/
         lL1YnUytIB/WVTX0koHMEqNiRrgxerqdXxEttH+hF9Q0yI7EfveZ1DHDPEG0IP+zeMrh
         g9SXNxEF0IjEdF4/JfOXDVrfIK8n81YcOGBqWVV4z5WGVCQbDVvKqAxp7llEh6gKCD8L
         Jgjg==
X-Gm-Message-State: AOJu0YwRPBHCCfUqqPKQ7bzddZB8qub5KofKg4m18MuLI2TnJs1x3Lfq
	tVUEy0nlQ0uA7kMuEKC36bR7sKOt01FXttNaxhvdDaoc30lb5YfJ5iSXfZo2WdwxxcF0YWa6zZ5
	/p+11O1wJ
X-Gm-Gg: AfdE7clCVZF4wdwH8FPD9dHLAJf3azwbNcdDfHoIaFi5558sCTIiTAH7cmuTRcLXhmG
	no5XC/FeWniMNT4ibtRQJlJ9x/u3sagHOck5WCvJVYxiw7bR+l/ngLeMCGu7xBLYkwcDXC/gd8/
	L/wdSM/CI4L5BHn48Y5iON10+Y3hOJLeZbKTjKMJFB8e1+AUyXS+QHc7YT9XOdxeK0M22U0iHP4
	dxChytoiwGs+iSLQQ+Hn2OATK/FBTFa6NJFi1l9QBC4hy1IIrx09j7AdlTsO6mj6EGdwED6J1TS
	2vKb6ps3/4GjYu/lCX98UiyOJbg7QfalQA4UHXJ4qpEKrA7YtU2haKcjeDcPr1spllxV9sjkgun
	+hjkFMZmijLIhpUF0qVGFv7fZAfGER/m6oEg8GMKv7pLbdj26RgcOWtFG/5QID94Jva6bk49xi7
	XN8W4ewOKcCEyLbjLh0cRJLBs+IBye+K+pS+2Cf4pfzcu0n6W8jckX+V9B
X-Received: by 2002:a05:6000:2407:b0:475:f0c2:75a3 with SMTP id ffacd0b85a97d-4775ac9f53dmr13275064f8f.52.1783047719231;
        Thu, 02 Jul 2026 20:01:59 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:57 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 11/18] rust: platform: add runtime platform device creation
Date: Fri,  3 Jul 2026 04:00:58 +0100
Message-ID: <20260703030123.2814-12-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030123.2814-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
 <20260703030123.2814-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform abstraction can register a driver (platform::Driver) but not create
a device for it to bind to. Virtual drivers that spawn their own devices -- for
instance DisplayLink's evdi, which creates one platform device per virtual
display card from a sysfs attribute or at module load -- need the provider side.

Add platform::RegisteredDevice, a thin owner around
platform_device_register_full() whose Drop calls platform_device_unregister()
(which unbinds any bound driver first), plus DEVID_AUTO/DEVID_NONE constants and
a name/id/parent/dma_mask constructor. The non-generic methods are #[inline] so
out-of-tree modules can use them without an exported symbol.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/platform.rs | 77 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 9b362e0495d3..4c2ded2e264f 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -571,3 +571,80 @@ unsafe impl Sync for Device {}
 // SAFETY: Same as `Device<Normal>` -- the underlying `struct platform_device` is the same;
 // `Bound` is a zero-sized type-state marker that does not affect thread safety.
 unsafe impl Sync for Device<device::Bound> {}
+
+/// Auto-assign a platform device instance id (`PLATFORM_DEVID_AUTO`).
+pub const DEVID_AUTO: i32 = bindings::PLATFORM_DEVID_AUTO;
+/// Create a platform device with no instance id (`PLATFORM_DEVID_NONE`).
+pub const DEVID_NONE: i32 = bindings::PLATFORM_DEVID_NONE;
+
+/// An owned platform device created and registered at runtime.
+///
+/// This is the *provider* side of the platform bus: whereas [`Driver`] binds to devices the bus
+/// hands it, [`RegisteredDevice`] *creates* a `struct platform_device` and adds it to the bus,
+/// which then binds any matching [`Driver`] (calling its `probe`). Virtual drivers such as
+/// DisplayLink's `evdi` use this to spawn their DRM card devices on demand (from a sysfs `add`
+/// attribute or at module init).
+///
+/// [`RegisteredDevice::new`] wraps `platform_device_register_full()`; dropping the handle calls
+/// `platform_device_unregister()`, which unbinds the bound driver and releases the device.
+pub struct RegisteredDevice {
+    pdev: NonNull<bindings::platform_device>,
+}
+
+// SAFETY: `platform_device_register_full()`/`platform_device_unregister()` are internally
+// synchronized by the driver core and safe to call from any thread; the handle only unregisters.
+unsafe impl Send for RegisteredDevice {}
+// SAFETY: See `Send`; `&RegisteredDevice` exposes only the thread-safe `Device<Normal>`.
+unsafe impl Sync for RegisteredDevice {}
+
+impl RegisteredDevice {
+    /// Create and register a new platform device.
+    ///
+    /// `name` is the platform device name, which the platform bus also uses to match a [`Driver`].
+    /// `id` is the instance id: [`DEVID_AUTO`] to auto-assign a unique one, [`DEVID_NONE`] for an
+    /// unnumbered device, or a fixed non-negative value. If `parent` is given, the new device is
+    /// created as its child. `dma_mask` requests a coherent DMA mask of that many bits (pass `0`
+    /// to leave the platform default).
+    #[inline]
+    pub fn new(
+        name: &CStr,
+        id: i32,
+        parent: Option<&device::Device>,
+        dma_mask: u64,
+    ) -> Result<Self> {
+        let info = bindings::platform_device_info {
+            parent: parent.map_or(core::ptr::null_mut(), |p| p.as_raw()),
+            name: name.as_char_ptr(),
+            id,
+            dma_mask,
+            ..Default::default()
+        };
+
+        // SAFETY: `info` is fully initialized (all remaining fields zeroed) and only borrowed for
+        // the duration of the call, which copies out the fields it needs.
+        let pdev = unsafe { bindings::platform_device_register_full(&info) };
+        let pdev = crate::error::from_err_ptr(pdev)?;
+
+        Ok(Self {
+            // A successful `platform_device_register_full()` returns a valid, non-null pointer.
+            pdev: NonNull::new(pdev).ok_or(ENOMEM)?,
+        })
+    }
+
+    /// Return a reference to the created platform [`Device`].
+    #[inline]
+    pub fn device(&self) -> &Device {
+        // SAFETY: `self.pdev` points to a valid, registered `struct platform_device` owned by
+        // `self`; `Device` is a transparent wrapper over `struct platform_device`.
+        unsafe { &*self.pdev.as_ptr().cast::<Device>() }
+    }
+}
+
+impl Drop for RegisteredDevice {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: `self.pdev` was returned by `platform_device_register_full()` and has not been
+        // unregistered yet; this consumes that registration exactly once.
+        unsafe { bindings::platform_device_unregister(self.pdev.as_ptr()) };
+    }
+}
-- 
2.55.0

