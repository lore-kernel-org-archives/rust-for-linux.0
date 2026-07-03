Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEB520ADF8
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047632; cv=none; b=pNDNwvkS0F+tFuh/m+gvabhkUi+2vt9Yj01AP9EkqqYojCzYHaGJyunyrjWCu4EUuvQg714fsUTty7aDYDiKOwOinLoWg7hdl7i96lpsfsl1PXxqR97oZpwH1Rt8CXol21UmkE7fDDfeRnxwZ9YbrrCUCDub9a2YvuktvknvkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047632; c=relaxed/simple;
	bh=YbefWu8Ry1o3My54IHLiyN6HrpYSH3usHhH401cToDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TARKZ2ysDVFiGu7W9yTzXEPY30uWcOyfbMRV1/NC2n2TQeY0kHD1xc2O+VOg1+XC7Xn6G0Es31IKhKZToUOdNj7OVi/dKJmTc8YdzEaM/8Jx1t15LNXyMH3yZHZIt352CVsed2AKH0FiMSrzRREREsFHBSdRlQE0I2gl/SLnzr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=pAW4G7Um; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="pAW4G7Um"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so51440f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047629; x=1783652429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Idvq8z1PjIJi27rMuy55USC2VdX6WAO3FloueAZbU+Q=;
        b=pAW4G7Um2uDJiBuybAW8IwgmOiFoagpeI3WfIBm2TebQmch1YU3aOH9WzLfnSAKH7w
         XAKs40bhCrarB/iZ8vy98JxRh9xUkmHFhEClkUrYyEzBd6vvPw4Nun8rjlAFhE1ZFWoK
         6Jxr4b9HtKV8gZT22L5qjI4KdMJiCyqRq2+kHbipJJBac4Wj1MoZ4V48teWaFmw89jiI
         Gjw0affWRM/niM3UZXU97KjndAexh/ao6b7efz2ldCcVPS1htGYzV9Mp5lSmsKXeDGcP
         jr3+G5HVUSFnG94nTh9PT/nkE2Qn2URgnPNj2ISsE0WxLDpneQOWMFYrdltL/k2KqcqD
         lraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047629; x=1783652429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Idvq8z1PjIJi27rMuy55USC2VdX6WAO3FloueAZbU+Q=;
        b=J9A4AY4/HAdw/gIDGsfYag/6Wsm3oT5eBiQS1KY14RRbE6ve8YcU/oEQZ2/gtiP23N
         +QBp4+wigloPEy4pxvwMWpwNo7+Vcx8fyl/NBO0t2jtWbdSu8xSQWVeQwq3FpyyZpZ4l
         QhYD892yIt0gzrFJm9GU6mvSdKQsBr/712ZzYQvXxszNMWThO7fftUjieQSNSrYzCmaY
         qQCV9ljzYmHldJfLsFCtLfTk4cCy9genQiv342vuXIKlE60Y6xggjCRSN5YNY8OAVoNu
         7G2rTDqHFzMMsZ9XVnO2SE82b6HYz6QrMhq4x9hiVSpCSfxAv+mD/gVoLY6TpX5QsxEu
         BkaA==
X-Gm-Message-State: AOJu0YwLLYo9Swo5EsmpIJs8i0YrBlpZYFt6TCsPMYMaVueRSwQZ7vSX
	OlYE8U8K+UEmU7DputIHlI1OoD25wR1dnyjs9ke/UeHR6P6sLlAk2uoOKVNdnurep3+2fu86XnI
	LfvQK6NZ6
X-Gm-Gg: AfdE7ckzeapphaJQIcE35bEv7drni/kmXz/9ZO2uSlvjn1TRDglYWT3mDdf0rF11Ypk
	Je1msPUhZDfDICjGE1FkOfO42jXyP6bR84TCe3f2I9nS5fcSvB6HIMpZshLzpW1Kn3xanJO5Unk
	vTxuYCc94Ri+mvzg0+4pfiaGOAVzX0Bhgu/Gm1CnKED2cncAqWmBjZSy+0pYPVeOdmBugVmM4qI
	XmFW6Bx3Kh2RnMXWd/+H63u6ADlbxd54/LseVhkriJcP3B3aL0IjR4QXhGUctLDU6ZMQgYlU0re
	keSgNlXuB4jcUSIeOjuxAR0UfFCpECdmfnf0k1654Jw08hsNzjbcQDspYZEUyqdB8RZD2x2ewUf
	P/pnQKJ1TsYD1GOQQpnYp99GTYCJUjHmuPFOWMjX89c8isXlEmMz/oN9lcyO7JrxyoqvIjB/+sO
	wkiXr/HaFgT66emqmuA8mzIJbpMyhcwbaUA8UHC6n7O3LG6iOXpZ0KCZbpJGXUw7/0s60=
X-Received: by 2002:a05:6000:1846:b0:478:2698:72f4 with SMTP id ffacd0b85a97d-478269873f5mr8171349f8f.45.1783047629209;
        Thu, 02 Jul 2026 20:00:29 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:28 -0700 (PDT)
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
Subject: [RFC PATCH v2 00/11] rust: usb: synchronous + asynchronous bulk/control transfers + helpers
Date: Fri,  3 Jul 2026 04:00:04 +0100
Message-ID: <20260703030020.2694-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260617145946.1894-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the USB transfer bindings, rebased onto current drm-next
(no functional change from the version prepared but never sent after
v1's review -- see "Changes since v1" below for what that review fixed).
It adds the synchronous transfer primitives a driver needs at bring-up
to the Rust USB abstraction (rust/kernel/usb.rs), which currently lets
a driver bind a device (probe/disconnect) but provides no way to move
data, so any real driver still has to drop to C:

  1/11  bulk_send() / bulk_recv()        over usb_bulk_msg()
  2/11  control_send() / control_recv()  over usb_control_msg_send()/_recv()
  3/11  set_interface()                  over usb_set_interface()
  4/11  Interface::number()              bInterfaceNumber accessor
  5/11  clear_halt()                     over usb_clear_halt()
  6/11  interrupt_recv()                 over usb_interrupt_msg()
  7/11  reset_configuration()            over usb_reset_configuration()
  8/11  bulk_in_queue() / BulkInQueue    persistently-queued async bulk IN
  9/11  bulk_out_queue() / BulkOutQueue  pipelined async bulk OUT
 10/11  Device private + transfers gated on Interface<Bound>
 11/11  let drivers choose the transfer allocation flags

usb::Device is kept private; the transfer methods are exposed on
usb::Interface<Bound> so a transfer cannot be issued before the
interface's device is bound to the driver. Each method documents its
blocking/sleeping context, timeouts are taken as a Delta, transfer
lengths are range-checked into the C int types, and every FFI call
carries a SAFETY comment. All the transfer methods take the endpoint's
bEndpointAddress as it appears in the descriptor (e.g. 0x84) and use
its low four bits as the endpoint number, so the convention is uniform
across bulk_send/bulk_recv, interrupt_recv and clear_halt.

DMA-buffer handling: bulk_send/bulk_recv/interrupt_recv copy through an
internally-allocated bounce buffer, so any &[u8]/&mut [u8] is accepted
rather than pushing an unenforced DMA-capable-memory precondition onto
callers. Patch 11 lets the caller choose the allocation flags for that
bounce (GFP_KERNEL normally, GFP_NOIO/GFP_NOFS from a reset/resume or
error-handling path) instead of hardcoding GFP_KERNEL, per Oliver
Neukum's v1 review.

Patches 8 and 9 add the asynchronous URB path (usb_submit_urb) for
endpoints where the per-transfer device-ACK round-trip of the
synchronous calls is too costly. bulk_in_queue() keeps depth IN URBs
perpetually posted and hands each completion to BulkInQueue::recv();
bulk_out_queue() pipelines OUT URBs submit-and-reap so a back-to-back
burst is not serialised.

The additions were developed for an out-of-tree in-kernel Rust
DisplayLink DL3 dock driver, but are generic and not driver-specific.
Each patch builds on its own, so the tree stays bisectable; the full
series builds in-tree on drm-next (LLVM/Rust) with no new warnings.

The consumer is the in-kernel Rust DisplayLink DL3 dock driver, posted
alongside as drm/vino ("[RFC PATCH v2 00/6] drm/vino: DisplayLink DL3
dock driver"). Source:
  https://github.com/FireBurn/vino-scripts
  https://github.com/FireBurn/linux/tree/vino
  https://gitlab.freedesktop.org/FireBurn/linux/-/tree/vino

Changes since v1:
 - Keep usb::Device private (it was made public in v1); expose the
   transfer methods on usb::Interface<Bound> instead, so they cannot be
   called before the device is bound. New patch 10. (Danilo Krummrich)
 - Interface::as_bound() lets a driver that defers transfers to a work
   item reach the bound transfer surface, with a flush-before-unbind
   contract.
 - Drivers now choose the transfer allocation flags instead of a
   hardcoded GFP_KERNEL. New patch 11. (Oliver Neukum)
 - Rebased onto current drm-next; no other functional change.

Mike Lothian (11):
  rust: usb: add synchronous bulk transfer support
  rust: usb: add synchronous control transfer support
  rust: usb: add usb::Device::set_interface()
  rust: usb: add usb::Interface::number()
  rust: usb: add usb::Device::clear_halt()
  rust: usb: add usb::Device::interrupt_recv()
  rust: usb: add usb::Device::reset_configuration()
  rust: usb: add an asynchronous persistently-queued bulk IN reader
  rust: usb: add an asynchronous pipelined bulk OUT queue
  rust: usb: keep usb::Device private and gate transfers on
    Interface<Bound>
  rust: usb: let drivers choose the transfer allocation flags

 rust/helpers/usb.c |  35 ++
 rust/kernel/usb.rs | 845 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 869 insertions(+), 11 deletions(-)

--
2.55.0
