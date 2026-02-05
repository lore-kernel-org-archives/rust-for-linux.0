Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF7E332EA9
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325236; cv=none; b=D1MncMyYyCmME5p3P3PqzUM1OniaCCvnZVApw54u6idbATvXjgIWFRMTMDJ2UQqpn1DblvuqYK0EefPFL/g7LxwshF74O8KtWw+nIz66dIWleBJwjTSDn/JysuLYMK9BP2fYn+pkW47HwTqQFJTav46OwLUiKP8C1XJKYlJeOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325236; c=relaxed/simple;
	bh=mGjHnViOpaBiawwKiFLL50tHLKnItFMnpZghT+ZkbZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=IUCpSnajFvnEhyZW/bxIfc2mUctnqmpihVsqL45ZnoH2v6zFDIsL2ItAYsrmWJ0DBYfNoRzT+HPZQm+vh3YEkgh/hI2skxX74YrwuVoJVznCurfRP47TMqumjELjVMTJxZl5XlSL+C9jMkVA3vWq1X8KJfDiV8IHw5BeBcCRxbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BkR6J3qx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BkR6J3qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uO9Iu/KQjA0pe5Uf917htRnrSxjGLQG0IESxKRcUlqo=;
	b=BkR6J3qxMh/xW/fYGRiRqIKN6RxaOCkv+xwYzN2Z1uTge58PmFwQHOR6Gv8v6Eym1mGTB2
	DwKN2yI8T+wj9Du0l8KIWMGNA8v8u6UAbLXPnFsBAr4Oet/zrpDofqQ+zM+TsjfBVTLqHL
	okDU7i0MmY43yoCJ93N2ENZcqs4NsTc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-mOA5QTH5MGuMz9QInD19uQ-1; Thu, 05 Feb 2026 16:00:34 -0500
X-MC-Unique: mOA5QTH5MGuMz9QInD19uQ-1
X-Mimecast-MFC-AGG-ID: mOA5QTH5MGuMz9QInD19uQ_1770325233
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so469322785a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325233; x=1770930033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uO9Iu/KQjA0pe5Uf917htRnrSxjGLQG0IESxKRcUlqo=;
        b=nQzrY7Q/bDmrc/47O7W/7C0nBAgAVQae8Po56QaWTiNZp/rUcQ6D5whv7w73Js5WAN
         OZHgWoIyqI9hdS68YOXlTSGX6k7XAGHblWa43JqbWjODwi81lQQNYlhI3mU/82arm3ET
         wP7K2ABAT/04xnd+w4ArVuRoAF8YWxl7YmsDjwUHvgYYoy9T/kR2DB+/06c6SvrxYz+B
         pyb+ZrPDK8CxL0jFYMExv4L9R6WK7LQUkGXCkMKXIrYetZhMbcJlL8QT8HLzIXO+dWce
         K95LlEt+337HC01dHL88fi73dCW8+QUgdfeJb0QBN2ofYFEap/dIwyUNczVWSSVn0Mj1
         uaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHnwPoW8qYdjlNMDr2jPOFSsghdtBMlcC5InzBHGaOmhXmAUX7yjaaPNvCBf6x4OCinST7zm5+hk7f2cdDNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70QHKDy1wS39D8hQ0Yxf/la0pD/tXnfTqaEuIB1YbGdFgya35
	8xajyFAFynmt88Osk+OGKIvPonhKg4Mec7QPtHcfdTQaIQCwrTtAoCZBRkSt1K1i6e1RYSGjd4k
	k0c1mu9/0RPME5uCT7ZE+oaJgVSlnXPftYKXEkQzcmMeHJWztVpjH1yvzUr9Ie//bXPNp
X-Gm-Gg: AZuq6aJY6jrZlCV80NPf1csX41vDJaN03JX98zVmISaC9PePWn+hXKjSl9RpgLIfi2Z
	oYRFlLh8AB5hTc9wEE9qLeyU2FEjvK9ZAoBwxDsMSwRp5knRAUwiJbFtVBfmzmxeXD/ubnvYQxg
	r0z8MnkawKveE8wFjlls4qBIjaCceCKKXOHVyhtxXBEc4r13w00EcnEmHptvATUxr+NqAzCKBwx
	r9Y+e4UnIXAiJuTIIopnw/JtnYoK7zxMJU6y1N6T63Qau0iHLvw9uxMue56hVXkSAFvNv+Ja7WI
	0DWdluMWDGIVjOL6UiPcaEKJYA7CSH6+0w4n2YwqUh9OGgJcll/rzHhW8iDLzMZiZtraDckPdyG
	1NjvNB7Oc0PASMfM=
X-Received: by 2002:a05:620a:bc9:b0:8b2:f35c:16df with SMTP id af79cd13be357-8caf1bc2af6mr57818885a.79.1770325232365;
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
X-Received: by 2002:a05:620a:bc9:b0:8b2:f35c:16df with SMTP id af79cd13be357-8caf1bc2af6mr57795985a.79.1770325230865;
        Thu, 05 Feb 2026 13:00:30 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:30 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:52 -0500
Subject: [PATCH v2 05/10] rust: pci: add bus callback sriov_configure(), to
 control SR-IOV from sysfs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-5-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u8Ww9MaEhDp4wNchbI7j-Wut5z263veY7YRqEFKnGxM_1770325233
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add an optional bus callback sriov_configure() to pci::Driver trait,
using the vtable attribute to query if the driver implements the
callback. The callback is invoked when a user-space application
writes the number of VFs to the sysfs file `sriov_numvfs` to
enable SR-IOV, or zero to disable SR-IOV for a PCI device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index a4c27c674bd8bdf5e3316789d38d566e90b93fe2..88bd114970431bf8c3edef94c1d48567d895eaf6 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -83,6 +83,10 @@ unsafe fn register(
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
             (*pdrv.get()).managed_sriov = true;
+            #[cfg(CONFIG_PCI_IOV)]
+            if T::HAS_SRIOV_CONFIGURE {
+                (*pdrv.get()).sriov_configure = Some(Self::sriov_configure_callback);
+            }
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -135,6 +139,20 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
 
         T::unbind(pdev, data);
     }
+
+    #[cfg(CONFIG_PCI_IOV)]
+    extern "C" fn sriov_configure_callback(
+        pdev: *mut bindings::pci_dev,
+        nr_virtfn: c_int,
+    ) -> c_int {
+        // SAFETY: The PCI bus only ever calls the sriov_configure callback with a valid pointer to
+        // a `struct pci_dev`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `sriov_configure_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
+
+        from_result(|| T::sriov_configure(pdev, nr_virtfn))
+    }
 }
 
 /// Declares a kernel module that exposes a single PCI driver.
@@ -325,6 +343,44 @@ pub trait Driver: Send {
     fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
         let _ = (dev, this);
     }
+
+    /// Single Root I/O Virtualization (SR-IOV) configure.
+    ///
+    /// Called when a user-space application enables or disables the SR-IOV capability for a
+    /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
+    /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
+    ///
+    /// Further, and unlike for a PCI driver written in C, when a PF device with enabled VFs is
+    /// unbound from its bound [`Driver`], the `sriov_configure()` callback is invoked to disable
+    /// SR-IOV before the `unbind()` callback. This guarantees that when a VF device is bound to a
+    /// driver, the underlying PF device is bound to a driver, too.
+    ///
+    /// Upon success, this callback must return the number of VFs that were enabled, or zero if
+    /// SR-IOV was disabled.
+    ///
+    /// See [PCI Express I/O Virtualization].
+    ///
+    /// [PCI Express I/O Virtualization]: https://docs.kernel.org/PCI/pci-iov-howto.html
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci, prelude::*};
+    /// #[cfg(CONFIG_PCI_IOV)]
+    /// fn sriov_configure(dev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+    ///     if nr_virtfn == 0 {
+    ///         dev.disable_sriov();
+    ///     } else {
+    ///         dev.enable_sriov(nr_virtfn)?;
+    ///     }
+    ///     Ok(nr_virtfn)
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    fn sriov_configure(dev: &Device<device::Core>, nr_virtfn: i32) -> Result<i32> {
+        let _ = (dev, nr_virtfn);
+        build_error!(crate::error::VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// The PCI device representation.

-- 
2.52.0

