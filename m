Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F285D47DFB8
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708459; cv=none; b=KlBWNVNsKRc6GgD6zTkEtYFmJruPoBJHOweR3kYbNCBjN4FI1mfH7Sr+Faxjil7xYFbyLBuj/9Lp0zSw/w8w3TOhML0eEN1v3vCwOyRv7TI3oMtATB8BVEalTTxgrGgqBUcKnXwTcYxNcsbtbu73FjnDyaXWqIXsa4bu6SsPBcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708459; c=relaxed/simple;
	bh=4IhZ08h7z/xPnSqpnLyxNEXGOyRbYKT3LMedvYnkRm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckcPdGIbfDyFz0MnK4fPmAeSXBa3RRsETU8iaLdqyA4Or2ZHnkWJz/eX+lsgAizpGvJJl1gHZzEqYv2wgELkzZ5r1+r8XkwxbaGeaaQgtDLgvOzMWuE2H+X36iDL6mhIPBbYQXfByqRV7xQYhJolN8WJC/Ebwv5ComGsd+ctiqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=WOerwx5V; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="WOerwx5V"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso10725085e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708452; x=1782313252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2SJQxACHm/GNcPNTeL072YIQlNS0J9ulJCoZ8ksnqY=;
        b=WOerwx5VZLPjwepSx2TW/AYIKWPw4YV/7JFEkxv8txgP2ww4U1yT8Ratv5LOmyKMHI
         1YAK+Cl6wnd3z0om+yUntXkQsh0D0gosZ2eqkO04nRP5KDtMGiWamhKGWgMd/gatVCeU
         dPi42XQ6g18sSFdTkPLgKpWSDBpXW/0h3WRMgG3e46aXQX3z7vnSVuh7Xx0egg9L8f7n
         Q9LUGhou70pzDT2ePCCTy8TkIpfMiDpybcyqQ2mTmfaDSo49PXSGzacoW2JjzOEyi26X
         CbQXSrqfNadBePRNHPlhzdGiz4wqMivSoy+eMNnSVphbxGT5L2oVcJq4YIE1c26hEWS7
         aZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708452; x=1782313252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2SJQxACHm/GNcPNTeL072YIQlNS0J9ulJCoZ8ksnqY=;
        b=CPKW0CH5I1KNYaEbbxQhydYZdYRcsdflVjijT1UTNBFsYBa0WC54d+aT5gZVFBzXlz
         Ia2OG1lsgreJzhn8enoyDdskCT7ltukuoMoWzNvAJe0vdolynPPsmMYj3KthCV7adCRA
         fr3ggButtoVHMp5+DqM89oH9uyj/KzIvELUN7obECidGK1a79YY9IkMKVs4U06RyBl9P
         an5UKJYz5Grev1B73qA+71kiOvTU3+KHuHRA1/kkERr4fNNu/+zhlVH+icAdKiS6A/Uq
         6ml8qvMUN3VnHpUfPdL7IPv3oenbdaCDpvgK7zfZdWwr7M2oMumdsXkGeDfAYR9Yx/MX
         eyGQ==
X-Gm-Message-State: AOJu0YxwdLPwlNLf2Gx3EkaBBMYrozDoBO4Yoq60QAOxtm8qK5JUoOgZ
	yKOEjJ8KnZmvFTgVQJIPGZGtdvW88ZUg2LScdI8Vemabmy4WLtvJZSCBaKj5M6MhV8rxl1Vdpir
	uaAUor/CY
X-Gm-Gg: Acq92OGgAa7c3v3AbYKdbcNvIvsZ/6+khG/TSVg+/Z3EgOA+65y1ZeOeCrHWuFyO+H0
	sovFsqR0LZu2dIqpj5yr4K0tnwtrEMR1kbCem3E0eNLMWy5k9+X76WAaUK+eRKX7Yka3hk9iKnb
	eDuSm1RFZjecMBAUlR9pAspVAoMJjgDOjgSV7sDmUgY/b6iySqjQd2Xv/+FPYjyuupCkmraPo2x
	vCx8SU+yGormqYA4tPaSYbYd+e3A51cQLzl5A8NpqmQENunyf3g8vAIz53f/V9qcG24LkgIfRvc
	0RwzQykxJGxpQ1AgKyGd7yzsN40WZbUiCWeSJ8/A/Y9dGsM2KUoYrguxTnCE9HNDez+YBz5JpT0
	nMIPPS1GfiXI/tL0oVelwd8gBXLpvbakljvtGLW4UxIUcGHFxgcV1vNOE6Yp7+kkuhprL4R5veD
	OXZ3IHJV7DXLRth7fKMZRA4LbWWwbuyCnUFuOIA7kGOBXxWiB6Iyft7gu5jky2/y8IleU=
X-Received: by 2002:a05:600c:608c:b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-492340bc7fbmr57138755e9.3.1781708452203;
        Wed, 17 Jun 2026 08:00:52 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:51 -0700 (PDT)
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
Subject: [RFC PATCH 6/9] rust: usb: add usb::Device::interrupt_recv()
Date: Wed, 17 Jun 2026 15:59:18 +0100
Message-ID: <20260617145946.1894-7-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617145946.1894-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a safe wrapper for synchronous interrupt IN transfers, mirroring
bulk_recv() but using usb_interrupt_msg() over an interrupt pipe so the
URB's transfer type matches the endpoint. This is the correctly-typed API
for reading a device's interrupt-IN status endpoints; usb_bulk_msg() would
also work (it detects an interrupt endpoint and rewrites the pipe to
PIPE_INTERRUPT), but interrupt_recv() exists precisely so callers do not
have to rely on that legacy fixup.

The interrupt pipe is built with a new rust_helper_usb_rcvintpipe() shim,
matching the existing bulk-pipe helpers (usb_rcvintpipe() is a
function-like macro). It sleeps, so it must be called from process
context, and like bulk_recv() the buffer must be DMA-capable.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/helpers/usb.c |  6 ++++++
 rust/kernel/usb.rs | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index d398eb2f6669..ac7b30334882 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -19,3 +19,9 @@ rust_helper_usb_rcvbulkpipe(struct usb_device *dev, unsigned int endpoint)
 {
 	return usb_rcvbulkpipe(dev, endpoint);
 }
+
+__rust_helper unsigned int
+rust_helper_usb_rcvintpipe(struct usb_device *dev, unsigned int endpoint)
+{
+	return usb_rcvintpipe(dev, endpoint);
+}
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index a151a120e82e..c7bf4637ee90 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -566,6 +566,50 @@ pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result
         Ok(n)
     }
 
+    /// Issues a synchronous interrupt IN transfer on `endpoint`, returning the number of bytes
+    /// received. Uses `usb_interrupt_msg()` over an interrupt pipe (built with `usb_rcvintpipe()`)
+    /// so the URB's transfer type matches the endpoint — the correctly-typed counterpart to
+    /// [`bulk_recv`] for interrupt-IN status endpoints.
+    ///
+    /// This is a blocking, sleeping call and must only be invoked from process context. `endpoint`
+    /// is the endpoint's `bEndpointAddress` (e.g. `0x83`); only its low four bits — the endpoint
+    /// number — are used and the direction is fixed by the method (IN). As for [`bulk_recv`], the
+    /// data is received into a kmalloc'd bounce buffer internally and copied into `data`, so `data`
+    /// need not be DMA-capable. `timeout` is the maximum time to wait, rounded down to whole
+    /// milliseconds; a [`Delta`] of zero, or any non-zero value below 1 ms, waits indefinitely.
+    ///
+    /// [`bulk_recv`]: Self::bulk_recv
+    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+        let mut actual: kernel::ffi::c_int = 0;
+
+        // `usb_interrupt_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
+        // bounce buffer and copy out, so `data` need not be DMA-capable itself.
+        let mut buf = KVec::from_elem(0u8, data.len(), GFP_KERNEL)?;
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
+        let pipe = unsafe { bindings::usb_rcvintpipe(self.as_raw(), endpoint.into()) };
+
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `buf` is a kmalloc'd buffer
+        // valid for writes of `buf.len()` bytes; `actual` is a valid out-pointer.
+        // `usb_interrupt_msg()` fills an interrupt URB for `pipe` and blocks until it completes
+        // or `timeout` elapses.
+        to_result(unsafe {
+            bindings::usb_interrupt_msg(
+                self.as_raw(),
+                pipe,
+                buf.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                buf.len().try_into()?,
+                &mut actual,
+                timeout.as_millis().try_into()?,
+            )
+        })?;
+
+        // `usb_interrupt_msg()` never reports more than the requested length.
+        let n = (actual as usize).min(data.len());
+        data[..n].copy_from_slice(&buf[..n]);
+        Ok(n)
+    }
+
     /// Issues a synchronous control OUT transfer on the default control endpoint.
     ///
     /// Wraps [`usb_control_msg_send()`]; `request`, `request_type`, `value` and
-- 
2.54.0

