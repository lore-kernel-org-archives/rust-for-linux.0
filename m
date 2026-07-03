Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97075268690
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047636; cv=none; b=VwKI7RQpJmdIcOfDyCvqXV75T08CM8kgMKWRDhFE5/i5ciI42PjxlVgtcbs5ST/s0U7jbkkuBU5FajkfIq2fMIzIniw5gFWcXxz203wh5hI5TqmHDlOIEYtlcM9TJirzi0pcBSIbae5a7JAljp0rYBzb90+M/9QHf56Np1Enrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047636; c=relaxed/simple;
	bh=hMaccDZ5PDEOPlCNJEKZtNPTuhPH7brCBjKysP98eZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPhZ/l6Z1CTW2dvoiDgSmDn8lSoJdJRlm7Lr6a+LOG3mmTrFDdFkVhSe+TUpPsTdSnRHj3IgecMhbfImdLWGAgL1pXpSXmTMVWJO60bRM+iG6hA+iGSzF2cAYUmeMhnZEBfItxmrTB83dDcqL4kPA6FctmGv8FSoI8TcXlrogoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=JWL3EDyT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="JWL3EDyT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4745492ed3aso48731f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047633; x=1783652433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egKj4uT+V4gDIJo4dQH6sgJyRIpRRkWAoTv3WOeDq9c=;
        b=JWL3EDyT//x21Y97BlZR1XIBB5KYPHpgeNP7U3ZnvNtGw+HNh3/Ya/bwUnItI60Qy4
         70a2ZfqwbtIsX1dMHaP9Y0aFqLEpjUKdVOBY7LUUT3yFh8Fs54nDRLCM0eTVHTXsMub0
         4UL+uF9aCfXnqeMm71afCucbwHSbel6rAUMwpZ1neJCdv7J91ws5RENRnIpAyO+IH+bX
         Mz4fTokCTlB8aethknr3oJV5F2Yz/oN0nLNBzagtsMkPJS/Xu9t2V9BqsUxu16fp+3fn
         D59RCHLMXfCDasbNChgyqOmDSvJQ7kh4HtgRIyEOE3i+Lksu/3uwR6iLH7rzgefSaJFX
         Hoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047633; x=1783652433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egKj4uT+V4gDIJo4dQH6sgJyRIpRRkWAoTv3WOeDq9c=;
        b=X0x1OmE7mTVw5K8bus3LsLQPZ6LLp/j/dwFklJD0sdUtsSwZGRPpBJp/XNRGTRsQlK
         lzM/q4cNDyirD7Cm3LF4ue6eY/M1KT6VTP9+0+TOI4RL1h6CJk+fTZpJkdfoVmraheO1
         mIbanJf+rKE8zMaj18OIRTPy/GgcnMULETEIns9618PK/sX3NuREXmMgTMm4M3jh6Tjh
         ZOXA0e05Vaj8LF6h4FdJmvoMPNMsVrNrgepBDTia4gQE4jH75/szBnBeZtY0Vp0gHIFm
         uOf9hSbtgfSV2WQDT6CoHF6sZ24UR0Cl90cXUdxiz4/ROsHpRX2fH7JjLR+uhcTjxXx4
         cJsA==
X-Gm-Message-State: AOJu0YwtUOV4JWMJOvfNzh50sn7jqaWRzP5IpjWgZqYqn7hzzWdBzZ86
	ar/TzatIT0f/PoSbJJa/xg2GaqUJU03DPgnXPPukKyybkzSFsdcvZgA63VW1aFgo3F7rE1s37Zx
	pZvCJt/V0
X-Gm-Gg: AfdE7ckXgluEvLMMEyHFvVQfhM5VkqTaeXxoynfJ+mpkJAjPgzoMyMuvK95vQHC+wGz
	HSNOhPE7RQFc9s+3tYraKVQKJ2aDxTVMWZdH0oo36yoj9zZ9+p1bofIeEclsBohD8itIvFDr5+j
	itu9zZac9GwfbGeE2sK5CJe6fJemkmgEd2WoMRAG0QmBZdk1JlQ4j8M90S3JWcnlaKMVraecRTI
	qtTwxX9qJqxZoTCm3rslEgsxy8OvrdNRg1iz11H3pPbeEFSUNd2m5mww/DEf5ove+zb5gBj7yg5
	9TIQiJIZmpIejO3y4J9myISl2xtGIQeMo7DK2CgBpXpG1ybXtTP2bY/NnL/dwsQE38XAuYJruNp
	TkE04XFxyem7YYdrusJn00oTiACayWFN4DiiqAd5B1ju7n1rPuY5JGz17GGIS+OZcbthnbCAugP
	MUIvcNDdeL/mHFB24nK1/3GxKqmg/zKh/LYsPR2twU8x9gKuQ7WNs927Ea
X-Received: by 2002:a05:6000:230f:b0:474:57f0:49f8 with SMTP id ffacd0b85a97d-477573bbd26mr12113057f8f.4.1783047632906;
        Thu, 02 Jul 2026 20:00:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:32 -0700 (PDT)
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
Subject: [RFC PATCH v2 02/11] rust: usb: add synchronous control transfer support
Date: Fri,  3 Jul 2026 04:00:06 +0100
Message-ID: <20260703030020.2694-3-mike@fireburn.co.uk>
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

Building on the bulk transfer support, add synchronous control IN/OUT
transfers on the default control endpoint (pipe 0) as safe methods on
`usb::Device`.

`control_send()` and `control_recv()` wrap `usb_control_msg_send()` and
`usb_control_msg_recv()`. The `bRequest`, `bmRequestType`, `wValue` and
`wIndex` setup fields are taken as arguments; `wLength` is the buffer
length. Both copy the buffer internally, so unlike the bulk path the
caller's buffer need not be DMA-capable. They block and sleep, so must be
called from process context; the timeout is a `Delta` (zero waits
indefinitely).

This is what a driver needs for the standard control-request preamble at
device bring-up before bulk traffic begins.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 75 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index c9acadb2deaf..e1fb50fd6997 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -530,6 +530,81 @@ pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result
         data[..n].copy_from_slice(&buf[..n]);
         Ok(n)
     }
+
+    /// Issues a synchronous control OUT transfer on the default control endpoint.
+    ///
+    /// Wraps [`usb_control_msg_send()`]; `request`, `request_type`, `value` and
+    /// `index` are the `bRequest`, `bmRequestType`, `wValue` and `wIndex` setup
+    /// fields. `data` is the payload (`wLength` is its length).
+    ///
+    /// This is a blocking, sleeping call and must only be invoked from process
+    /// context. Unlike the bulk path, the buffer is copied internally, so `data`
+    /// need not reside in DMA-capable memory. `timeout` is the maximum time to
+    /// wait, rounded down to whole milliseconds; a [`Delta`] of zero — or any
+    /// non-zero value below 1 ms — waits indefinitely.
+    ///
+    /// [`usb_control_msg_send()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_control_msg_send
+    pub fn control_send(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &[u8],
+        timeout: Delta,
+    ) -> Result {
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
+        // reads of `data.len()` bytes; `usb_control_msg_send()` copies the buffer.
+        to_result(unsafe {
+            bindings::usb_control_msg_send(
+                self.as_raw(),
+                0,
+                request,
+                request_type,
+                value,
+                index,
+                data.as_ptr().cast::<kernel::ffi::c_void>(),
+                data.len().try_into()?,
+                timeout.as_millis().try_into()?,
+                bindings::GFP_KERNEL,
+            )
+        })
+    }
+
+    /// Issues a synchronous control IN transfer on the default control endpoint,
+    /// filling `data` with exactly `data.len()` bytes.
+    ///
+    /// Wraps [`usb_control_msg_recv()`], which fails the transfer if the device
+    /// returns fewer than `data.len()` bytes. The setup fields and context/buffer
+    /// rules are as for [`Device::control_send`].
+    ///
+    /// [`usb_control_msg_recv()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_control_msg_recv
+    pub fn control_recv(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &mut [u8],
+        timeout: Delta,
+    ) -> Result {
+        // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
+        // writes of `data.len()` bytes; `usb_control_msg_recv()` copies into the buffer.
+        to_result(unsafe {
+            bindings::usb_control_msg_recv(
+                self.as_raw(),
+                0,
+                request,
+                request_type,
+                value,
+                index,
+                data.as_mut_ptr().cast::<kernel::ffi::c_void>(),
+                data.len().try_into()?,
+                timeout.as_millis().try_into()?,
+                bindings::GFP_KERNEL,
+            )
+        })
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.55.0

