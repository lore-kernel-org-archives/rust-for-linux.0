Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2979247DD5A
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708455; cv=none; b=c1yfvHMsvDQgarkNEGRbmlPtfCM740pa7hYkEilpE75SAQ0xEVVc8Wimll/iZpPWf0eneTsjRNBoIWA2ga7bm7uENq3ExOPPKiu120ovsxwZ1ypmz7SMhmo2PHsQUqbIoRgoM+uZ5fHUI1F6qiAb3YrWEbehrMTO4GLDXo0F1Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708455; c=relaxed/simple;
	bh=Sx5Fn19j2z0pkqOANFqj0z9oNBjZUOWGNEOIW47xNmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psLIsA95D65N9oQ40T18QZ8RUtQKes/NopPXcdNg+pv7e1KWo8qxVSqwEdZ1C1qs39hZ964YPVAylgt8XD1EDo6w0KmQrqhalf8jQpbzPDmSIRH7d4A5m36avvfbPb1QAXps4F7HJ0M6Pln6HfF9/xMxfSAbQgrrMm8z//aszbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=KiKX2y0T; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="KiKX2y0T"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so61982545e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708444; x=1782313244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JvjBf1n8d/1Jhx2K3qLXfFlQhZKNQV8M/eqwV1hrwe0=;
        b=KiKX2y0TkLJ0mlpDGJ9Uz1MPOH3ozBevCc8zmymYwRhw86Duz/ZflQRXicUbmdyEe6
         /K7tZe5F5B4QHNye0OV8UaQYO5TBKxs/S50Nkq0q8Yut+tUjVOFCoRxaH1br4Pm/l7/f
         MVypmHnUK3F9o2/YydNMIJXQzkyuGWYuVveZ57YyjwB3V0w476ewYmtAK1ERGcjyu+Q2
         KOBvbN1lQ9Hqti/xjT328vtaWOwmD9u5v37RELjKYOgwHk2nxtYDMkEwpKutWNULbMVk
         g8sAGFU/sRHLFSQLNW4q7HtrwvKbitj23BbPBf18PKfaTxOIw35OYvqJLZh5XsHEk/As
         cszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708444; x=1782313244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvjBf1n8d/1Jhx2K3qLXfFlQhZKNQV8M/eqwV1hrwe0=;
        b=QVSkadjglEGBvN61N2br1PmBKx0XCET68ZEmeC6VJMPCgNV9X9kCyVLdIyIzTDKD/M
         Sf6mRS4FgLtmbtnBarKyAAXZFnLRRPZ8aR7yeZQchQ6MQNA8T9GwH54j8i1NcrsPZgT8
         IDJvIxtqq04Rzco3hAdYmnLBg22xh+NhMb5st2yVcWmwfBE71wqbOqU3cr4BRlWaQdPS
         O8De3u6YCfHvBtfNjDmfDuRxViPLQE3MJF+M/uYE7rjBYeksFXSqcQ/UzA9w1YYclO1Q
         bRk9vbWPjDN0e3977EJ588nTk6f8Q9q16MZrK4XaTAxpDOo6/L3+Irp1a6JwdK9zlXwF
         ETsw==
X-Gm-Message-State: AOJu0Ywb0RHHQlHMbms/H66R29mbCFiegFXTdOa1JhJzhuVYaSfiwh4N
	SqPhAbdlr1UD/JCRS43LR0EWant1SLTqAHbQ5G0nklGEgAzUlvIZKC3uYncVHE8KmGFcgJY+wUy
	hYtTTSkiv
X-Gm-Gg: Acq92OHj3sO+PlFv8Ca35JtipaD7YtCge5GYhtEgVZpERyVrg0nPtdm9sBQxJBp9me4
	S5AzHDNqT9RTeKE4kCAR+tkGGy1Yw8bxb39lFrluoigaQpuLNgueaLOuVeOwZysbE0z60ofjiJQ
	Gs21rFJOKF8EOyaUriBta4duLR4RtbX9D/0We4vQwz0X3u220dt8zAsBDgyBh+MoZ3nnBY9aw2w
	nvVJfZeTbXkdMvR0Zazun+cqvGnCS8XJ92QfvC+P4LXVeLByFizJmNAR/NfGn2ME8ka0szBSmR+
	N2bJhIH6djEN0e/ePXGFHbq6+bkNrhNYlyTJ7JtLfjiolDDhTq7fHHlvPIiABMKDUEFZoukf4qC
	CDoWRo2BX3QnYOXZ0ONajuTL5XXdRCQAQ+xE4v3nKA9XP9hr8EvaHq9fgS3Hss9P4lIz4AkRjGI
	hSHZwF52EbMLXpgTADC3dCtFvUB8/oQu+7G2SkF+jFveIjJH2U7ADjXUlO
X-Received: by 2002:a05:600c:c08b:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-492333c019cmr62358285e9.16.1781708443891;
        Wed, 17 Jun 2026 08:00:43 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm203011965e9.15.2026.06.17.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:43 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	linux-usb@vger.kernel.org,
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
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/9] rust: usb: synchronous bulk/control transfers + helpers
Date: Wed, 17 Jun 2026 15:59:12 +0100
Message-ID: <20260617145946.1894-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC series adds the synchronous USB transfer primitives a driver
needs at bring-up to the Rust USB abstraction (rust/kernel/usb.rs), which
currently lets a driver bind a device (probe/disconnect) but provides no
way to move data, so any real driver still has to drop to C:

  1/9  bulk_send() / bulk_recv()        over usb_bulk_msg()
  2/9  control_send() / control_recv()  over usb_control_msg_send()/_recv()
  3/9  set_interface()                  over usb_set_interface()
  4/9  Interface::number()              bInterfaceNumber accessor
  5/9  clear_halt()                     over usb_clear_halt()
  6/9  interrupt_recv()                 over usb_interrupt_msg()
  7/9  reset_configuration()            over usb_reset_configuration()
  8/9  bulk_in_queue() / BulkInQueue    persistently-queued async bulk IN
  9/9  bulk_out_queue() / BulkOutQueue  pipelined async bulk OUT

usb::Device is made public; each method documents its blocking/sleeping
context, timeouts are taken as a Delta, transfer lengths are
range-checked into the C int types, and every FFI call carries a SAFETY
comment. All the transfer methods take the endpoint's bEndpointAddress as
it appears in the descriptor (e.g. 0x84) and use its low four bits as the
endpoint number, so the convention is uniform across bulk_send/bulk_recv,
interrupt_recv and clear_halt. The function-like pipe macros
(usb_sndbulkpipe(), usb_rcvbulkpipe(), usb_rcvintpipe()) are exposed via
rust_helper_* shims, matching the existing
rust_helper_interface_to_usbdev() in the same file.

clear_halt() selects an IN or OUT pipe from the USB_DIR_IN bit of the
endpoint address so it can clear a stall on either direction;
interrupt_recv() uses usb_interrupt_msg() over an interrupt pipe (built
with the new rust_helper_usb_rcvintpipe() shim) so the URB's transfer
type matches the endpoint, rather than a bulk pipe with the type bits
patched.

DMA-buffer handling: usb_bulk_msg()/usb_interrupt_msg() DMA directly
to/from the transfer buffer, which must therefore be kmalloc'd
(DMA-capable) memory. Rather than expose that as an unenforced
precondition on a safe method taking &[u8] (which would be unsound for an
arbitrary stack or .rodata slice), bulk_send/bulk_recv/interrupt_recv
copy through an internally-allocated kmalloc'd bounce buffer, so any
slice is accepted; the control path already bounces inside
usb_control_msg_send()/_recv(). This keeps the methods honestly safe at
the cost of one copy. The open question for reviewers is whether that
bounce is the right default or whether a dedicated DMA-buffer type should
be taken for a zero-copy fast path; feedback on that API shape is a main
reason this is posted as an RFC.

Patches 8 and 9 add the asynchronous URB path (usb_submit_urb) for
endpoints where the per-transfer device-ACK round-trip of the synchronous
calls is too costly. bulk_in_queue() keeps depth IN URBs perpetually
posted (the always-pending-IN behaviour of a libusb event loop) and hands
each completion to BulkInQueue::recv(); bulk_out_queue() pipelines OUT
URBs submit-and-reap so a back-to-back burst is not serialised. The URBs
are filled with usb_fill_bulk_urb() and re-armed with reinit_completion()
(both static-inline, reached through rust_helper_ shims), the completion
callback only signals a struct completion, and each queue owns its URBs in
a fixed slot pool for its whole lifetime, killing them directly on Drop.

The additions were developed for an out-of-tree in-kernel Rust
DisplayLink DL3 dock driver, but are generic and not driver-specific.
Each patch builds on its own, so the tree stays bisectable; the full
series builds in-tree on drm-next (LLVM/Rust) with no new warnings.

Mike Lothian (9):
  rust: usb: add synchronous bulk transfer support
  rust: usb: add synchronous control transfer support
  rust: usb: add usb::Device::set_interface()
  rust: usb: add usb::Interface::number()
  rust: usb: add usb::Device::clear_halt()
  rust: usb: add usb::Device::interrupt_recv()
  rust: usb: add usb::Device::reset_configuration()
  rust: usb: add an asynchronous persistently-queued bulk IN reader
  rust: usb: add an asynchronous pipelined bulk OUT queue

 rust/helpers/usb.c |  35 +++
 rust/kernel/usb.rs | 682 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 716 insertions(+), 1 deletion(-)

--
2.54.0
