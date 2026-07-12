Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7137754D
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890553; cv=none; b=DrV0Em121pyqyfWqtgJSOMFcZjJEnBvOEnis53xlBOOtyTuBi2wASEar9cRxWCzpg+9L3W7fKxeHJNcJmyOWB/MxYJmBs15HbhqVf0lnLvIuRKM1EzSsDQtApALy+vOHJnmamrf6rcpBKDyoFkPEl13lfRTObDpG9fObFi4iwss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890553; c=relaxed/simple;
	bh=433A1TS43hWR1H7iwXEPSuG1bD/g08svGDVfoZJ6NgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ie3hrOKCpuIX/Uw5uRuAOVAgNEjAEDV7+gJklxQwecH2zmLLoiroWlKclh8egAqoq9ezVMGVWWjeUv0mdlhKg+HKpjLQ0pE6YdGWsX8XD2+Owvh6FF4whdkk4vB/OwDcJO5YNoGmoB0IhB/tbRlkz3Mq2k+CCZ0c0reZVRj1SdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGU+sk3i; arc=none smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGU+sk3i"
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-7fc7dc7bebcso26604857b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890551; x=1784495351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuLQmTHp2PWYFgz4XTneHKxNTQUROfu+lDrq700PFaQ=;
        b=iGU+sk3iFfdYU/oq0wtIh41DFVL0+3aFoPjZFZmL1GWmVyyS4TPLUxtABr5ZA8PUgn
         4TFBUwqlr2hHJPxb5zk/JJKsWoOYgc3halDL3RV+nh5Q3L+w3277Z67Xoq3Np3/XlbzT
         u5yi4LzizLCKq/9VybB3ivSjmxBKJTQsexXrvlayIC/eRN6+kRD0C6hYSwIcSw7KZJin
         /JoQUIu9WNDnOcGxhTc4VGDWfrqQvKJpTZi2TGiiy1E9EYqLHpGfJSTbmuSc0s/+Fble
         LxZJrEv5tRbN8m+ayyLpHnGAjWoHaSDV9yxnXSotScJ2BKoZfLpl8NNIWb18ltL1e0x5
         Vxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890551; x=1784495351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GuLQmTHp2PWYFgz4XTneHKxNTQUROfu+lDrq700PFaQ=;
        b=CWiqzfcFtJBCZIa/ZzLwPUW0HIg2EvvQ7WzXz97Dew2KrWEWJ2mF/j/UAWVV3yJJ+U
         ze2wTCrumZY3REa2+26jJ09BIexAJ2IR5DVdZg0th4o8A0QexQfmI8tRsKqUolfzxBGm
         TH3ONczCJ169qwNirxqwUq7U4DNTZ+KtvOXiFmgraIK84oBrPycWdKDXdSfCC6koXHjv
         wOmAl72elAHTXTe4LZyAI+eD4+tT6ZhKhYgxXfcQCcCeYZLBCOmJ48fnP/57eC1Nhotq
         8WGdweIDvaFVuHZ24BVXHa3hU4DFTuNY5yPnf02b700HSn5c+Y697OcAvtq1i0BjFZMX
         9W3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpsnYbq3K6QUDaeDZxfX392mhYu9NzFRH2lUiFMJtDF0XySc2XqGEoSqe7deoVTUszD4DXGSEGzl3n2z4TwfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0PYRTWgLusFXkUoWaDcwUwyMLK7jVnBC0yFgpCtYJwx2pw2g
	7GWt1BfC2Ca7A9sMPHJxSAVkVQNy3xtQC3Mah2ncwKNQ8p1dAlKjNorP
X-Gm-Gg: AfdE7cnSpG0w/y2SLxL5FJTyH2gxQYaAV/vJ2CKepwgN+Rkdqr4IW311POgXASTj3QK
	e8j6rOtSieEbef44KkVXRWNlGOk1mwhqNZkjK1g4BNmr3WlDxjDPGW2rO9yQqs4EkGZCwcMZZ6a
	eXyFptywHNIfSLpSyRND5IBIqTMrnI44W6mLuBG1M5Q6eXej+vbqpUWbpOXQj7Pe0BjXdiljLfJ
	L8TofNiSFatjUL4dyvabinCTzmVKQFZ+vOdfupSkb168RHBfjrW1kSu5KSrIUz6Ft/NEyeLjWcT
	+hjerBZ+0PPXkvLMinx1uBNir6nXAdofQcaG+1WROOkSpY7xShUXm3A0Ns/pAtY6xNin3DMeAUb
	r1/47ZqH5N2fcUE6hwtUHu6EOGwQNcfyGeJFPS006PSjauxCfIbvL/VXTRDV67svhDd7p2v224V
	AB+D5192h369bERmniMoR2bgn1tDwpd93O53teYY1rfE+E0yQDgPnJJW0DlMHsVUrffkREywV4I
	AlxTzd5
X-Received: by 2002:a05:690c:6204:b0:81e:ae6f:ac0a with SMTP id 00721157ae682-81eae6fad86mr1460677b3.24.1783890551014;
        Sun, 12 Jul 2026 14:09:11 -0700 (PDT)
Received: from [127.0.0.2] (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm99737387b3.9.2026.07.12.14.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:09:10 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <colin.braun.cl@gmail.com>
Date: Sun, 12 Jul 2026 16:07:59 -0500
Subject: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
 Colin Braun <colin.braun.cl@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783890545; l=9945;
 i=colin.braun.cl@gmail.com; s=20260630; h=from:subject:message-id;
 bh=433A1TS43hWR1H7iwXEPSuG1bD/g08svGDVfoZJ6NgI=;
 b=WweGzKtieH6aF7Jm/YkoDuks/UEPttylLJ4vxf3+OmeW7kCXqbsfMrjyuVxXpABIehw5bDsOB
 Eq5HcWRBcysD6DhIAODcSTi9AtwTpUN5ISASMymLKhTYfaO2VMTmG5i
X-Developer-Key: i=colin.braun.cl@gmail.com; a=ed25519;
 pk=DJ5DDAbTXtW6OgSgetK6R1PUfhtCNSvSayX3Je17ZAY=

The goal of this patch is to create safe USB host interface and endpoint
descriptors necessary for USB driver development. Specifically, this
safely wraps the C side `struct usb_host_interface` and
`struct usb_host_endpoint` types.

Additionally, support for querying and configuring USB interface
altsettings is added to the existing Rust `Interface` and `Device`
types.

The `Device` struct is made public for two reasons:
- Sending control URBs in a way that makes it clear that endpoint 0 is a
  shared device endpoint, not specific to an interface.
- Allows for the possiblity of a future driver that binds to the USB
  device rather than an interface.

Signed-off-by: Colin Braun <colin.braun.cl@gmail.com>
---
 rust/kernel/usb.rs | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 191 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 3ae9c05cd32a..21dddc735bdf 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -20,6 +20,12 @@
     prelude::*,
     sync::aref::AlwaysRefCounted,
     types::Opaque,
+    usb::ch9::{
+        Direction,
+        EndpointDescriptor,
+        InterfaceClass,
+        InterfaceDescriptor, //
+    },
     ThisModule, //
 };
 use core::{
@@ -29,6 +35,7 @@
         MaybeUninit, //
     },
     ptr::NonNull,
+    slice, //
 };
 
 pub mod ch9;
@@ -358,6 +365,173 @@ impl<Ctx: device::DeviceContext> Interface<Ctx> {
     fn as_raw(&self) -> *mut bindings::usb_interface {
         self.0.get()
     }
+
+    fn inner(&self) -> &bindings::usb_interface {
+        // SAFETY: The type invariants guarantee that `self.0` wraps a valid
+        // `struct usb_interface`.
+        unsafe { &*self.as_raw() }
+    }
+
+    /// Returns the current alternate setting for this interface.
+    pub fn cur_altsetting(&self) -> &HostInterface {
+        // SAFETY: `cur_altsetting` is a valid `struct usb_host_interface`
+        // pointer provided by the USB core. `HostInterface` is
+        // `#[repr(transparent)]` over it.
+        unsafe { &*(self.inner().cur_altsetting as *const HostInterface) }
+    }
+
+    /// Returns all alternate settings for this interface.
+    pub fn altsettings(&self) -> &[HostInterface] {
+        // SAFETY: `altsetting` is a valid array of `num_altsetting`
+        // entries provided by the USB core. `HostInterface` is
+        // `#[repr(transparent)]` over `usb_host_interface`.
+        unsafe {
+            slice::from_raw_parts(
+                self.inner().altsetting as *const HostInterface,
+                self.inner().num_altsetting as usize,
+            )
+        }
+    }
+}
+
+impl Interface<device::Bound> {
+    /// Select an alternate setting for this interface.
+    ///
+    /// On success the device switches to the given alternate setting,
+    /// which may change the set of active endpoints. This is a convenience
+    /// wrapper around [`Device<Bound>::set_interface`].
+    pub fn set_interface(&self, altsetting: u8) -> Result {
+        let dev: &Device<device::Bound> = self.as_ref();
+        dev.set_interface(self.cur_altsetting().number(), altsetting)
+    }
+}
+
+/// Abstraction for the USB Host Interface structure, i.e. `struct usb_host_interface`.
+#[repr(transparent)]
+pub struct HostInterface(Opaque<bindings::usb_host_interface>);
+
+impl HostInterface {
+    fn inner(&self) -> &bindings::usb_host_interface {
+        // SAFETY: The type invariants guarantee that `self.0` wraps a valid
+        // `struct usb_host_interface`.
+        unsafe { &*self.0.get() }
+    }
+
+    /// Returns the interface descriptor.
+    fn desc(&self) -> &InterfaceDescriptor {
+        // SAFETY: `desc` is a valid `struct usb_interface_descriptor`
+        // embedded in `usb_host_interface`. `InterfaceDescriptor` is
+        // `#[repr(transparent)]` over it.
+        unsafe { &*((core::ptr::from_ref(&self.inner().desc)).cast()) }
+    }
+
+    /// Returns the list of endpoints in this alternate setting.
+    pub fn endpoints(&self) -> &[HostEndpoint] {
+        // SAFETY: `endpoint` is a valid array of `bNumEndpoints` entries.
+        // `HostEndpoint` is `#[repr(transparent)]` over
+        // `usb_host_endpoint`.
+        unsafe {
+            core::ptr::slice_from_raw_parts(
+                self.inner().endpoint as *const HostEndpoint,
+                self.desc().bNumEndpoints() as usize,
+            )
+            .as_ref()
+            .unwrap_or(&[])
+        }
+    }
+
+    /// Returns the interface number (`bInterfaceNumber`).
+    pub fn number(&self) -> u8 {
+        self.desc().bInterfaceNumber()
+    }
+
+    /// Returns the alternate setting number (`bAlternateSetting`).
+    pub fn alternate_setting(&self) -> u8 {
+        self.desc().bAlternateSetting()
+    }
+
+    /// Returns the interface class (`bInterfaceClass`).
+    pub fn class(&self) -> InterfaceClass {
+        self.desc().bInterfaceClass()
+    }
+}
+
+/// USB endpoint transfer type.
+///
+/// Maps to the `bmAttributes` field of the endpoint descriptor
+/// (`USB_ENDPOINT_XFER_*` constants).
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+pub enum EndpointType {
+    /// Control endpoint.
+    Control = bindings::USB_ENDPOINT_XFER_CONTROL as u8,
+    /// Isochronous endpoint.
+    Isoc = bindings::USB_ENDPOINT_XFER_ISOC as u8,
+    /// Bulk endpoint.
+    Bulk = bindings::USB_ENDPOINT_XFER_BULK as u8,
+    /// Interrupt endpoint.
+    Int = bindings::USB_ENDPOINT_XFER_INT as u8,
+}
+
+/// Abstraction for the USB Host Endpoint structure, i.e. [`struct usb_host_endpoint`].
+///
+/// [`struct usb_host_endpoint`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_host_endpoint
+#[repr(transparent)]
+pub struct HostEndpoint(Opaque<bindings::usb_host_endpoint>);
+
+impl HostEndpoint {
+    fn inner(&self) -> &bindings::usb_host_endpoint {
+        // SAFETY: The type invariants guarantee that `self.0` wraps a valid
+        // `struct usb_host_endpoint`.
+        unsafe { &*self.0.get() }
+    }
+
+    /// Returns the endpoint descriptor.
+    fn desc(&self) -> &EndpointDescriptor {
+        // SAFETY: `desc` is a valid `struct usb_endpoint_descriptor`
+        // embedded in `usb_host_endpoint`. `EndpointDescriptor` is
+        // `#[repr(transparent)]` over it.
+        unsafe { &*(core::ptr::from_ref(&self.inner().desc).cast()) }
+    }
+
+    /// Returns the direction of this endpoint (IN or OUT).
+    pub fn endpoint_dir(&self) -> Direction {
+        if self.desc().bEndpointAddress() & Direction::In as u8 == 0 {
+            Direction::Out
+        } else {
+            Direction::In
+        }
+    }
+
+    /// Returns the endpoint number (0-15).
+    pub fn endpoint_number(&self) -> u8 {
+        self.desc().bEndpointAddress() & bindings::USB_ENDPOINT_NUMBER_MASK as u8
+    }
+
+    /// Returns the transfer type of this endpoint.
+    pub fn endpoint_type(&self) -> EndpointType {
+        let val = self.desc().bmAttributes() & bindings::USB_ENDPOINT_XFERTYPE_MASK as u8;
+        // SAFETY: `bmAttributes` masked with `USB_ENDPOINT_XFERTYPE_MASK`
+        // is guaranteed to be 0-3, which maps exactly to the four
+        // `EndpointType` variants.
+        unsafe { core::mem::transmute::<u8, EndpointType>(val) }
+    }
+
+    /// Returns the interval for interrupt and isochronous endpoints.
+    pub fn interval(&self) -> u8 {
+        self.desc().bInterval()
+    }
+
+    /// Returns the maximum packet size for this endpoint.
+    pub fn maxp(&self) -> u16 {
+        u16::from_le(self.desc().wMaxPacketSize()) & bindings::USB_ENDPOINT_MAXP_MASK as u16
+    }
+
+    /// Returns the high-speed multiplier for isochronous endpoints.
+    pub fn maxp_mult(&self) -> u16 {
+        (u16::from_le(self.desc().wMaxPacketSize()) & bindings::USB_EP_MAXP_MULT_MASK as u16)
+            >> bindings::USB_EP_MAXP_MULT_SHIFT
+    }
 }
 
 // SAFETY: `usb::Interface` is a transparent wrapper of `struct usb_interface`.
@@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }
 
-impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
-    fn as_ref(&self) -> &Device {
+impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx> {
+    fn as_ref(&self) -> &Device<Ctx> {
         // SAFETY: `self.as_raw()` is valid by the type invariants.
         let usb_dev = unsafe { bindings::interface_to_usbdev(self.as_raw()) };
 
@@ -428,7 +602,7 @@ unsafe impl Sync for Interface {}
 ///
 /// [`struct usb_device`]: https://www.kernel.org/doc/html/latest/driver-api/usb/usb.html#c.usb_device
 #[repr(transparent)]
-struct Device<Ctx: device::DeviceContext = device::Normal>(
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
     Opaque<bindings::usb_device>,
     PhantomData<Ctx>,
 );
@@ -439,6 +613,20 @@ fn as_raw(&self) -> *mut bindings::usb_device {
     }
 }
 
+impl Device<device::Bound> {
+    /// Select an alternate setting for the given interface.
+    ///
+    /// On success the device switches the given interface to the given alternate setting,
+    /// which may change the set of active endpoints.
+    pub fn set_interface(&self, interface: u8, altsetting: u8) -> Result {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_device` pointer by the type
+        // invariants. `usb_set_interface` is safe to call on a bound device.
+        to_result(unsafe {
+            bindings::usb_set_interface(self.as_raw(), i32::from(interface), i32::from(altsetting))
+        })
+    }
+}
+
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
 // argument.
 kernel::impl_device_context_deref!(unsafe { Device });

-- 
2.54.0

