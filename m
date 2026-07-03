Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1912798F8
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047650; cv=none; b=XY93MnCPXXYkz0yp82aUeSF/WmA145CYaFY+Vik5Ip93h8eKY6hey5oXJIpCo7iE9wlE6eqVZdYJERS8zUE95yMFZ8kqnTMKtD6eQwGNwYBPy2aTXNVR08vKV06GwnJOTKGeVmmywCCQmw5XS3Y6Ah7h8t5MBI/zL04TFjzk1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047650; c=relaxed/simple;
	bh=R7pafxZtnTB8RiZsr6l9LlVOWfwg9mjNnd8zIeHZrQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gwj6HJB/aJB+t/XMVkyGzUE/ur2bpfE+kjisWQ4E7MCR5q5FeW1BSv5T11tGkSVOad/hK2b+tMx1UrLOMNJRJsykyhCCXOCPo02SPwivmCsGkuUN7nJ9yJ7xqvw2OAbOKYY9HRQxWvITiqEQznsdletb5gJqDhg/2C109gFCtNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=L5tN/Keg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="L5tN/Keg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47488efcf30so48508f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047641; x=1783652441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/qWpxOilsLHMxCkcCuMt5GG4koplq4ju+XxBWFGFBc=;
        b=L5tN/KegKRehpnJZ1URWRmt+VZfKjLCNp8l7LivPG4DZ958aR+cdW6EviMG4ueWouT
         FT1NWfLPrpFDEmUQNpIKvxbX8opteLhLQggmQdyLi0JaQV44D9x5MIG0gW1BupOh8EBG
         pdZ6hRuu4SeFrRu+GT9Hy8llPiY7so39yo72nTIpieqo+rha6vWYGRmcBSqJlxy/ed8N
         wlGvc3yXjD6V31WRyqzc/oPoHvisvfKoFomMsqLjDJk+5sIxE4Xg8ZRCfDyhd7P3OFdd
         FnnhWjAfqLf2JjzrReLawNWaAqgWcUns5WVM3KowJuZMI/0KtC0hCptTdA2ARRWg4BlL
         nZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047641; x=1783652441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/qWpxOilsLHMxCkcCuMt5GG4koplq4ju+XxBWFGFBc=;
        b=n5M8Xzcp637akgc5qeJNU7X1J8LUCuw1KPZhMBoo+8QqG6Zm4PV/yDAaFxQSy/Tt4N
         HDD18SCFFFiA3QEz1CSq9xvLO9k8oF/HCd7Ci2TIaogXulPoexla7eUY/s5zpNpwLpYM
         BjNexwIMmh4XkLZzHXFTRpiE/iq9YRv1qzFLkETcpqsuVCw3yaSHSUYdZXA08hiMtG82
         //PbCEKdt+NvPLGGB265YVtNtLlkWlbanYFDxE6lMWpqana8hPk+enlUugoH9ZS4u01D
         nEQZawqx/Fck0/hWrMQGtJ3jY4PtRdLc7dGpOlnz/sNsNj2Wt5TEItPSWq9uH2B03cnH
         c3yw==
X-Gm-Message-State: AOJu0YzsDY8MBbpjtMl55wiJV5cyFaxDQXVLv/f6z76lQsOJn33k2HI1
	8f2Vy6WGTe3fQZEy2ubukPsgkpamCBIsPHVeTLEwzsNAuvvGWm9vQHG5dDrO0l+sgVaKfvsMHLi
	CKbv9OZ6M
X-Gm-Gg: AfdE7cnRkQQ1ljBN57j/rAHP8owbcIY5sQqvgJXCmK0QBTkf8whR5rXFsWADLLpgFmW
	hJ0wy5QkZKA6aqOlebw9SvLyPP9yJVFijtL6P8N/BpE8SXk75av0nI9EJTBbpWOp2rgyqR9tgMN
	ZfVCNrTy4AtK/STk3xDTlkYqSHgXUTIfWBFOJgHv9m4jbMx+aeEy66QonxhF229T/gOsLywaF2+
	OfBCg2B1Y7kx/GZ4nfZxvY5TmjZsZrtXgsqBYCkTMteBOWNm/nn9a5Uo6VxaqbFLyDtnSLkBWFU
	HlBIh6h5pb8FOIUYH9L57zboWFbAJwj7mfRbfmy5YDIbIHN1d9U5A7Po553cCHUjqyinGXgpqXl
	z/os+XqWdRhsr/pPFsk5Y9dYP7jDvrweY9zhcikpjM0GeLjMZdBxYB5IjmOExbcCOXdWbqxo9sl
	LWWu6CdGhvnLqyiPSJ5DL+IAYwkgbH3N0YrpgYf8a4nTcFcFbYLNOUq7uT
X-Received: by 2002:a05:6000:24ca:b0:475:f0f0:9eed with SMTP id ffacd0b85a97d-4775ac9f83emr13482965f8f.50.1783047641156;
        Thu, 02 Jul 2026 20:00:41 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:40 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/11] rust: usb: add usb::Device::interrupt_recv()
Date: Fri,  3 Jul 2026 04:00:10 +0100
Message-ID: <20260703030020.2694-7-mike@fireburn.co.uk>
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
context, and like bulk_recv() it copies through an internal kmalloc'd
bounce buffer, so the caller's buffer need not be DMA-capable.

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
2.55.0

