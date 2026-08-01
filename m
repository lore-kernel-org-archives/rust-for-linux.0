Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3522472AA
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Aug 2026 00:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542491; cv=none; b=G1u5ZYekr2TnkIpKEuwuq4y6rRcetuXFRG/eF89wQ6IAQ50Y10NLm8KxI2InmRJTy8gcUFMdNm16f59L8g69ju6O7x3KjYqQeLUEcchZ9KOZtmFu537ANnEWsZJHOLI0fGVRd1erA1Qx0/8cWMV9c1dHCkmyXODJqsfXd4kGbZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542491; c=relaxed/simple;
	bh=3T6QpkPI//WGbA+RmHlvgDJPZcPLkgFPEUBMEoDHZGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/NPO7GLPK5Qj75AqSNKrIMVZlTxXkz9qYrlAtDi+lZNpGbx+9LcW4/Es11UHSEf4zDeC1Cgav6XAkBbTMPTSqx96bOibUNg0S0kviUl1PaaE/94ljp2u1FBpHOtbWTuUmEqFcpJRbWAmXfM6HF1QbWb9QlYiOcP30AyjxlOrdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=h+lIeGFq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="h+lIeGFq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so3040095e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 17:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785542487; x=1786147287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxjeR4PCY58BhrAQyXpzwzfVgEnX583XUlxdGj566C0=;
        b=h+lIeGFqsH+yCRgylqutJgrlEN7AA6IJhx0FZR6IfL3vVDS8f5Qy54hRDdu9cThCxQ
         QRPiDdfKXz4GwsaU16D1sQlnKEXXTHMQV17uv3vTikyyg8Vvh9aE4swdm6Au/8PSYCha
         Q6zm02R8KaaCYbWrku3UDIC81x69+HxG0Fqq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785542487; x=1786147287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxjeR4PCY58BhrAQyXpzwzfVgEnX583XUlxdGj566C0=;
        b=ha9IGOV7bQsRGLWtZsoyzwqGJ8OdJvvxqctIYVwK7gzIJrdfw9NdWTKFTEhKM1eCQ4
         V7uzle0nBUL/ntLqwcMlR3VZE7QWFtfFuQIEMPCw5WAqmhujKNJf9RHd2FKuNM3WPp72
         O9pI61/ASPDJzeOl0VfFMPdVNNJq1CHk5pqvRNLu7AaLhlDQYiraUMaTCDoPoE7hKVeO
         2kId/pHAt8q4jFKtI6TbjTWb7QLOO+ACTPfOieLkW5HP9r4m33ju6GvIIrpCHI54Lc2t
         jzdiFTCg1DE/09Ebo0nkI0non91pVHBjXFEMXI8XptTv9hn+HgCA7TNJD44YvRqA+j6b
         gzYA==
X-Forwarded-Encrypted: i=1; AHgh+Rqji2lun5mhBpaK8QC998aiqbJS6ECXMmLsB0W/BG1y7a565idAh9E/0PDuySRqpQSVt4cz+pftW5qNzk3+LA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsv5Z1pfBPby3UYV2luJDMhb8gTD3ypD7NkNDEb5UG+9Q5UGFS
	wxPkyFPvti7Ryj7r2Rq64IcZ9h7URq3Zl+XwfdTsPlecslxwQ7jsKMFjevCOp+wwmgA=
X-Gm-Gg: AR+sD13dAbKaKPOF2RfZpxygbFNhA6i3RDiEqfDTugNhdznu1QgbF2fK1q9UDQi1xix
	9GexHyBOxzUP5V3a4fELtd2GCS3vre0Kn7fBCKIkKqU3pU2ZtmuFNjOnU3sI2YXF/rOxcVe93AS
	waubmJpej62p8otFJd9HdmfLu9hTecCjAsBvHR782ZFHnVWh9F6yYiKuv8tvFA5tXr7KHYGwa/G
	gHHLhwvhlwyNMFd2LL+bouoRJfPWubJ2cOnqmIDxLSWcXsv5Yky0AqWy7/+j/+Wiv3USO3Fq7p2
	nxnnpG88bFSA41QYdZtvOS8dcQOzsOMbhM4vDMu71SnzNjk9K/KSYKWBknFko+b/wwEbRw2bhCo
	w3N3lvcwyli9fuZupE//39+JjdHUFS0PUqMBQ3A0XZtZI4skafm9DaxiXfDDR6muz6jtnZftMpy
	1J3eVhxPwxVrTzIHhr6Ax72mTrXDwcmZUeTlhc1TsyGhBAHyBSXJFtWXy8JjiSWjXtq/Goo0gX0
	sAQ8lRrJMpqNajA+9o4Wt8Q9dpl9vR663sanmOnOw==
X-Received: by 2002:a05:600c:a01:b0:495:63f5:7a4f with SMTP id 5b1f17b1804b1-4980c6a3cd3mr3509945e9.33.1785542487018;
        Fri, 31 Jul 2026 17:01:27 -0700 (PDT)
Received: from [192.168.2.138] ([86.122.199.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm6568935e9.3.2026.07.31.17.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 17:01:26 -0700 (PDT)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Date: Sat, 01 Aug 2026 03:01:08 +0300
Subject: [PATCH RFC 2/2] rust: usb: add control message send and receive
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-rust-usb_control_msg-v1-2-655bb444b52c@wyliodrin.com>
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
In-Reply-To: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: b4 0.14.3

Add `Device::send_control_message()` and
`Device::receive_control_message()`, wrapping usb_control_msg_send()
and usb_control_msg_recv(), plus a `Request` type describing the
bmRequestType, bRequest, wValue and wIndex fields of a setup packet.

`Request` deliberately omits the two setup packet fields that are
properties of a submission rather than of the request itself: the
direction bit of bmRequestType and wLength. Both are derived from the
method called and the buffer passed, so a caller cannot describe an
inbound transfer while handing over a read-only buffer, nor set a
length that disagrees with one.

Both methods take a `&HostEndpoint<Bidirectional, Control>`, so a
non-control endpoint cannot be passed by construction.

Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
 rust/kernel/usb.rs         |   3 +-
 rust/kernel/usb/control.rs | 353 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 355 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 55c627be1658..7d23186630ce 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -33,6 +33,7 @@
     slice,
 };
 
+pub mod control;
 pub mod endpoint;
 
 /// An adapter for the registration of USB drivers.
@@ -550,7 +551,7 @@ unsafe impl Sync for Interface {}
 ///
 /// [`struct usb_device`]: https://www.kernel.org/doc/html/latest/driver-api/usb/usb.html#c.usb_device
 #[repr(transparent)]
-struct Device<Ctx: device::DeviceContext = device::Normal>(
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
     Opaque<bindings::usb_device>,
     PhantomData<Ctx>,
 );
diff --git a/rust/kernel/usb/control.rs b/rust/kernel/usb/control.rs
new file mode 100644
index 000000000000..32edd17ab90d
--- /dev/null
+++ b/rust/kernel/usb/control.rs
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (C) 2026 Wyliodrin SRL.
+
+//! USB control transfers.
+//!
+//! Control transfers are the request/response mechanism every USB device must support. A transfer
+//! consists of an 8-byte setup packet, an optional data stage, and a status stage;
+//! the setup packet is described by [`Request`], and the direction of the data stage is chosen by
+//! calling either [`Device::send_control_message()`] or [`Device::receive_control_message()`].
+//!
+//! Both travel over a control endpoint - usually the device's default one, from
+//! [`Device::control_endpoint()`]. Because control endpoints are bidirectional, the endpoint does
+//! not determine the direction: the `Direction` bit of `bmRequestType` does, and these two methods
+//! set it so it cannot disagree with the buffer you passed.
+
+use core::ptr;
+
+use ffi::c_void;
+
+use crate::{
+    alloc::Flags,
+    bindings,
+    error::{code::EOVERFLOW, Error, Result},
+    num::Bounded,
+    usb::{
+        endpoint::{Bidirectional, Control, Direction, HostEndpoint},
+        Device,
+    },
+};
+
+/// Position of the `Type` field within `bmRequestType` (bits 6:5).
+const REQUEST_TYPE_SHIFT: u32 = 5;
+
+/// Which part of the USB specification defines the meaning of a [`Request`].
+///
+/// This is the `Type` field of `bmRequestType`, occupying bits 6:5 of the setup packet's first
+/// byte. It selects the namespace that [`Request::request`] is interpreted in, so the same request
+/// code means different things under different types.
+#[derive(Copy, Clone, PartialEq, PartialOrd)]
+#[repr(u8)]
+pub enum RequestType {
+    /// Request is a USB standard request, defined by the specification itself and interpreted the
+    /// same way by every device. Usually handled by the USB core rather than by a driver; see
+    /// [`Device`].
+    Standard = 0,
+    /// Request is intended for a USB class.
+    Class = 1,
+    /// Request is vendor-specific.
+    Vendor = 2,
+    /// Reserved.
+    Reserved = 3,
+}
+
+/// The target a [`Request`] is addressed to.
+///
+/// This is the `Recipient` field of `bmRequestType`, occupying bits 4:0 of the setup
+/// packet's first byte. For [`INTERFACE`](Self::INTERFACE) and [`ENDPOINT`](Self::ENDPOINT)
+/// the specific interface or endpoint is named by [`Request::index`]; the other recipients
+/// ignore it or give it a request-specific meaning.
+///
+/// Although the field is five bits wide, only the values below are defined - hence
+/// the bound on the wrapped [`Bounded`].
+#[derive(Copy, Clone, PartialEq, PartialOrd)]
+#[repr(transparent)]
+pub struct Recipient(Bounded<u8, 5>);
+
+impl Recipient {
+    /// The device as a whole.
+    pub const DEVICE: Self = Self(Bounded::<u8, 5>::new::<0u8>());
+    /// A specific interface, named by [`Request::index`].
+    pub const INTERFACE: Self = Self(Bounded::<u8, 5>::new::<1u8>());
+    /// A specific endpoint, named by [`Request::index`].
+    pub const ENDPOINT: Self = Self(Bounded::<u8, 5>::new::<2u8>());
+    /// Some other target, defined by the request itself.
+    pub const OTHER: Self = Self(Bounded::<u8, 5>::new::<3u8>());
+    /// A port. Wireless USB only.
+    pub const PORT: Self = Self(Bounded::<u8, 5>::new::<4u8>());
+    /// An RPipe. Wireless USB only.
+    pub const RPIPE: Self = Self(Bounded::<u8, 5>::new::<5u8>());
+
+    /// Builds a recipient from a raw field value.
+    ///
+    /// Prefer the associated constants; this exists for values a future specification revision may
+    /// define. The [`Bounded`] parameter rules out values the field cannot hold, but does not
+    /// guarantee the device understands the one you pass.
+    pub fn new(val: Bounded<u8, 5>) -> Recipient {
+        Recipient(val)
+    }
+}
+
+/// The setup packet of a control transfer, minus the direction and length.
+///
+/// These fields map onto the setup packet as `bmRequestType` (from
+/// [`request_type`](Self::request_type) and [`recipient`](Self::recipient)), `bRequest`, `wValue`
+/// and `wIndex`. The remaining two - the `Direction` bit of `bmRequestType` and `wLength` - are
+/// filled in by [`Device::send_control_message()`] and [`Device::receive_control_message()`] from
+/// the method you call and the buffer you hand it, which is what keeps them consistent with each
+/// other.
+pub struct Request {
+    /// Type of the request.
+    pub request_type: RequestType,
+    /// Recipient of the request.
+    pub recipient: Recipient,
+    /// Request code. The meaning of the value depends on the previous fields.
+    pub request: u8,
+    /// Request value. The meaning of the value depends on the previous fields.
+    pub value: u16,
+    /// Request index. The meaning of the value depends on the previous fields.
+    pub index: u16,
+}
+
+impl Request {
+    /// Encodes this request into a `bmRequestType` byte for a data stage flowing in `direction`.
+    ///
+    /// `direction` here is a property of the transfer, not of the endpoint it runs over: bit 7 of
+    /// `bmRequestType` is what the host controller obeys for a control transfer, and bit 7 of the
+    /// endpoint address is defined to be ignored.
+    fn bm_request_type(&self, direction: Direction) -> u8 {
+        let dir = match direction {
+            // `USB_DIR_IN` is `0x80`; `USB_DIR_OUT` is zero.
+            Direction::In => bindings::USB_DIR_IN as u8,
+            Direction::Out => 0,
+        };
+
+        dir | ((self.request_type as u8) << REQUEST_TYPE_SHIFT) | self.recipient.0.get()
+    }
+}
+
+/// Converts a buffer length into a `wLength` value.
+///
+/// The field is 16 bits, so anything larger cannot be expressed in a single control transfer.
+fn transfer_length(len: usize) -> Result<u16> {
+    u16::try_from(len).map_err(|_| EOVERFLOW)
+}
+
+impl Device {
+    /// Performs a control transfer with an outbound data stage, i.e. host to device.
+    ///
+    /// The `Direction` bit of `bmRequestType` is set to `USB_DIR_OUT` for you. Pass [`None`] as
+    /// `data` for a request with no data stage at all, which sets `wLength` to zero.
+    ///
+    /// `endpoint` selects the control endpoint to use; it must belong to this device, since only
+    /// its [`number()`](Endpoint::number) is taken from it. For the default control endpoint -
+    /// almost always the right choice - pass [`control_endpoint()`](Device::control_endpoint).
+    ///
+    /// `timeout` is in milliseconds, with zero meaning "wait forever". `memflags` are used for an
+    /// internal copy of `data`, so `data` itself need not be DMA-capable.
+    ///
+    /// Returns `Ok(())` only if the whole request completed; unlike `usb_control_msg()` there
+    /// is no partial-success case to inspect.
+    ///
+    /// This sleeps, so it must not be called from atomic context.
+    ///
+    /// # Examples
+    ///
+    /// A vendor-specific request with no data stage:
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::flags::GFP_KERNEL,
+    ///     error::Result,
+    ///     usb::{
+    ///         transfer::{Recipient, Request, RequestType},
+    ///         Device,
+    ///     },
+    /// };
+    ///
+    /// fn set_led(dev: &Device, on: bool) -> Result {
+    ///     dev.send_control_message(
+    ///         dev.control_endpoint(),
+    ///         Request {
+    ///             request_type: RequestType::Vendor,
+    ///             recipient: Recipient::DEVICE,
+    ///             request: 0x01,
+    ///             value: on as u16,
+    ///             index: 0,
+    ///         },
+    ///         None,
+    ///         1000,
+    ///         GFP_KERNEL,
+    ///     )
+    /// }
+    /// ```
+    ///
+    /// A class request that carries a payload:
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::flags::GFP_KERNEL,
+    ///     error::Result,
+    ///     usb::{
+    ///         transfer::{Recipient, Request, RequestType},
+    ///         Device,
+    ///     },
+    /// };
+    ///
+    /// fn set_line_coding(dev: &Device, interface: u8, coding: &[u8; 7]) -> Result {
+    ///     dev.send_control_message(
+    ///         dev.control_endpoint(),
+    ///         Request {
+    ///             request_type: RequestType::Class,
+    ///             recipient: Recipient::INTERFACE,
+    ///             request: 0x20,
+    ///             value: 0,
+    ///             index: interface as u16,
+    ///         },
+    ///         Some(coding),
+    ///         1000,
+    ///         GFP_KERNEL,
+    ///     )
+    /// }
+    /// ```
+    pub fn send_control_message(
+        &self,
+        endpoint: &HostEndpoint<Bidirectional, Control>,
+        request: Request,
+        data: Option<&[u8]>,
+        timeout: i32,
+        memflags: Flags,
+    ) -> Result {
+        let (data, size) = match data {
+            Some(bytes) => (
+                bytes.as_ptr().cast::<c_void>(),
+                transfer_length(bytes.len())?,
+            ),
+            None => (ptr::null(), 0),
+        };
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariants of
+        // [`Device`], and `endpoint` belongs to it, so its number names a control endpoint of this
+        // device. `data` is either null with `size` zero, or points at `size` initialised bytes
+        // that outlive the call - the callee only reads from it, and copies before submitting, so
+        // no DMA is performed on the caller's buffer.
+        let ret = unsafe {
+            bindings::usb_control_msg_send(
+                self.as_raw(),
+                endpoint.number(),
+                request.request,
+                request.bm_request_type(Direction::Out),
+                request.value,
+                request.index,
+                data,
+                size,
+                timeout,
+                memflags.as_raw(),
+            )
+        };
+
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Performs a control transfer with an inbound data stage, i.e. device to host.
+    ///
+    /// The `Direction` bit of `bmRequestType` is set to `USB_DIR_IN` for you. Pass [`None`] as
+    /// `data` for a request with no data stage at all, which sets `wLength` to zero - note that
+    /// this makes the direction bit meaningless, so such a request is indistinguishable from the
+    /// [`send_control_message()`](Device::send_control_message) equivalent.
+    ///
+    /// `endpoint` selects the control endpoint to use; it must belong to this device, since only
+    /// its [`number()`](Endpoint::number) is taken from it. For the default control endpoint -
+    /// almost always the right choice - pass [`control_endpoint()`](Device::control_endpoint).
+    ///
+    /// `timeout` is in milliseconds, with zero meaning "wait forever". `memflags` are used for an
+    /// internal DMA-capable buffer that is copied into `data` on success, so `data`
+    /// itself need not be DMA-capable.
+    ///
+    /// The transfer must fill `data` exactly. A device that returns fewer bytes than requested
+    /// fails with `EREMOTEIO` and leaves `data` untouched, so this is not the right method for
+    /// requests of variable-length descriptors - size the buffer from the device's own length
+    /// field, or use a lower-level transfer.
+    ///
+    /// This sleeps, so it must not be called from atomic context.
+    ///
+    /// # Examples
+    ///
+    /// Reading a fixed-size vendor-specific register:
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::flags::GFP_KERNEL,
+    ///     error::Result,
+    ///     usb::{
+    ///         transfer::{Recipient, Request, RequestType},
+    ///         Device,
+    ///     },
+    /// };
+    ///
+    /// fn firmware_version(dev: &Device) -> Result<u16> {
+    ///     let mut buf = [0u8; 2];
+    ///
+    ///     dev.receive_control_message(
+    ///         dev.control_endpoint(),
+    ///         Request {
+    ///             request_type: RequestType::Vendor,
+    ///             recipient: Recipient::DEVICE,
+    ///             request: 0x02,
+    ///             value: 0,
+    ///             index: 0,
+    ///         },
+    ///         Some(&mut buf),
+    ///         1000,
+    ///         GFP_KERNEL,
+    ///     )?;
+    ///
+    ///     Ok(u16::from_le_bytes(buf))
+    /// }
+    /// ```
+    pub fn receive_control_message(
+        &self,
+        endpoint: &HostEndpoint<Bidirectional, Control>,
+        request: Request,
+        data: Option<&mut [u8]>,
+        timeout: i32,
+        memflags: Flags,
+    ) -> Result {
+        let (data, size) = match data {
+            Some(bytes) => {
+                let size = transfer_length(bytes.len())?;
+                (bytes.as_mut_ptr().cast::<c_void>(), size)
+            }
+            None => (ptr::null_mut(), 0),
+        };
+
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariants of
+        // [`Device`], and `endpoint` belongs to it, so its number names a control endpoint of this
+        // device. `data` is either null with `size` zero, or points at `size` bytes of a buffer
+        // uniquely borrowed for the duration of the call, which the callee may only write to.
+        let ret = unsafe {
+            bindings::usb_control_msg_recv(
+                self.as_raw(),
+                endpoint.number(),
+                request.request,
+                request.bm_request_type(Direction::In),
+                request.value,
+                request.index,
+                data,
+                size,
+                timeout,
+                memflags.as_raw(),
+            )
+        };
+
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
+    }
+}

-- 
2.55.0

