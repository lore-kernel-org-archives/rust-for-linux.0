Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B54C314B6C
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590772; cv=none; b=fEfVnd/Fadvb2D8qjXSgvMinvDyKQi9t5K7zi5C2wgWuE90YUJy91VJafM+khyzTgDT0E7cgQhdZYP5EMDGkUQYwTXNqJm+zIsF06b4nkUqskWln/HQN+L7IKoTxcR2Q1D9MUxnPE+Kw4QLIvENkiD29XoJdSSzJXbb1qUXjBUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590772; c=relaxed/simple;
	bh=isBVQ57+Brz1VfxrUYneQSmfzbDfRyfWhKEYUrQf6Oc=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=rRaA9IvM36AQgRU96nRPFI33P1dtsPp+5gKx3njS0j8hHC3afejza8sE9pYElb3VmtwX8RoE5CjV+vNRJEpFoKbfw791Bxet0O3xnV10Ozhty8QJIkWsF9KoIC23kwx1DnHpqs7V/V21ritk5OxZvdDx4+4FrMQ2x4rKLwHkbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=biHbBs4W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="biHbBs4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TaHEw4qfrN2YhxZsjXLb3t5RR9TWTSPbbKUt1wn06E=;
	b=biHbBs4W6MA3mA8w/xXf1ZKoJJHwHClsy2OrVNo6i82F4BPct8cAB1ARoB5UJ3nHX2LDZW
	JJ59LTfWzz8jcEcLJ2JIWSS1qRK3RF3V7911wc0oTS2RMEJ4EGatk/iXpSxMGM16kbR3PF
	91KzGrewdjKgEe5bMlcWcNkuZb7g7LU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-fessETfaMU2f0AtVtx9KGQ-1; Wed, 19 Nov 2025 17:19:27 -0500
X-MC-Unique: fessETfaMU2f0AtVtx9KGQ-1
X-Mimecast-MFC-AGG-ID: fessETfaMU2f0AtVtx9KGQ_1763590767
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88234e4a694so11049656d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590766; x=1764195566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TaHEw4qfrN2YhxZsjXLb3t5RR9TWTSPbbKUt1wn06E=;
        b=w0s4iMlb8sVmlBmaYPyhe5JCJzZD/+Lz/rIvzhxgRmhKdVM1ILbvN6p7/cywPBKxwP
         J6Ik81cpxJIq4odwXn94a1U7YP0Xm3QNdow2XklhgZFZfpMqiGWa+an1yDizzuF++Try
         tlxTKtjgKDLtFIYhUPrwhaduZN7nZtgCMpKDu8yyn2hDME2TYJE+Rmx7aWL3bun9J+3c
         NAYJB4VOuq9jc1whG2NnzsJovCuz3k2N5Zge1qVtVoblYLWz90K5bT0L9y1/ZYi+Jmwc
         gFpDv+NCkiZw7VevEjMARJTy4OxZj/nzjIxz2xvha5TJQDykNHUrTmQAa02lruMokVZB
         OWNw==
X-Forwarded-Encrypted: i=1; AJvYcCUCzcoa8UN3Hfoh1Y/RxkQGw4+c81ocWp1RLankCJsq3qaUDcGwqtoiCZRZ/tKYflnsoEGmYcs5itxhD8iwLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygFkoKDfcma71oy0BtiDcpbzFM5sm2Y9Vo2cxlO7122DGwf0zn
	sOeHBnBxb8KqTWOH94nS+Zv8oEq4T7yuddOrLf6fv6su+jyHWdK5t1FRfk7jxl3wKYG5Xc7nd/k
	aWwse3FuAlGViD9Ph6Gc3JkrclyxiBrTyCtgXrpRM+/0ipJ//f0LRofJrQ/M3pkZDXR/5
X-Gm-Gg: ASbGncuVKsSfcqJFZKHkwBkAf7E60KheY8UD1XpeXyVvzhks18R5IAMKeFknVH2QmOb
	7nnx8hZFP3xuXSh5kY1XBL/uffjrfduTH0wyHGy/i2o/Xw+NK/uIhRcuh6jnYWcRe9OSKBe6Vvp
	JnhFvykdqGXclBH/VeXEPHAOsxAeyOfkB3Vcqr8iyKqnpxqZytymIGJn1JMKL4JN2SSlhxIh0vp
	f/g5eI4meV9H7WrGChvepmQhb2amZsC7O4xsNDPF53lS9Dw2MZ2C5eeWp4aCWzjz2Fqkc6ERURa
	qXTL5eFMVuIp9mfrOLou7YcQXKJYMMnxqk4D8NXzWhpe37cRdArP3RWSZShjnqbywelxQH4/k1Q
	UVD5o1T6t7XzalQ==
X-Received: by 2002:a05:6214:33c4:b0:880:5bff:74d6 with SMTP id 6a1803df08f44-8846e16c331mr12082796d6.51.1763590766620;
        Wed, 19 Nov 2025 14:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG56WlPFxLZ+xUxoXWMrJpIJfnEVBJYcG8NscQK+qr9mchmkFNoMy2xH4aNIky2oxUFrfMmpw==
X-Received: by 2002:a05:6214:33c4:b0:880:5bff:74d6 with SMTP id 6a1803df08f44-8846e16c331mr12082416d6.51.1763590766172;
        Wed, 19 Nov 2025 14:19:26 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:25 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Wed, 19 Nov 2025 17:19:11 -0500
Subject: [PATCH 7/8] rust: pci: add physfn(), to return PF device for VF
 device
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251119-rust-pci-sriov-v1-7-883a94599a97@redhat.com>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
In-Reply-To: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
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
 Leon Romanovsky <leon@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Peter Colberg <pcolberg@redhat.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FAQcIbFAh0Z5-vvYQDxpYiJkUsqO6I1KrHW0WxjNqbY_1763590767
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a method to return the Physical Function (PF) device for a Virtual
Function (VF) device in the bound device context.

Unlike for a PCI driver written in C, guarantee that when a VF device is
bound to a driver, the underlying PF device is bound to a driver, too.

When a device with enabled VFs is unbound from a driver, invoke the
sriov_configure() callback to disable SR-IOV before the unbind()
callback. To ensure the guarantee is upheld, call disable_sriov()
to remove all VF devices if the driver has not done so already.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index f9054c52a3bdff2c42273366a4058d943ee5fd76..d6cc5d7e7cd7a3b6e451c0ff5aea044b89c6774a 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -120,6 +120,19 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
         // and stored a `Pin<KBox<T>>`.
         let data = unsafe { pdev.as_ref().drvdata_obtain::<T>() };
 
+        // Always disable SR-IOV before `unbind()` to guarantee that when a VF device is bound
+        // to a driver, the underlying PF device is bound to a driver, too.
+        #[cfg(CONFIG_PCI_IOV)]
+        {
+            // First, allow the driver to gracefully disable SR-IOV by itself.
+            if T::HAS_SRIOV_CONFIGURE && pdev.num_vf() != 0 {
+                let _ = T::sriov_configure(pdev, 0);
+            }
+            // Then, forcibly disable SR-IOV if the driver has not done so already,
+            // to uphold the guarantee with regard to driver binding described above.
+            pdev.disable_sriov();
+        }
+
         T::unbind(pdev, data.as_ref());
     }
 
@@ -332,6 +345,11 @@ fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
     /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
     /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
     ///
+    /// Further, and unlike for a PCI driver written in C, when a PF device with enabled VFs is
+    /// unbound from its bound [`Driver`], the `sriov_configure()` callback is invoked to disable
+    /// SR-IOV before the `unbind()` callback. This guarantees that when a VF device is bound to a
+    /// driver, the underlying PF device is bound to a driver, too.
+    ///
     /// Upon success, this callback must return the number of VFs that were enabled, or zero if
     /// SR-IOV was disabled.
     ///
@@ -500,6 +518,35 @@ pub fn pci_class(&self) -> Class {
     }
 }
 
+impl Device<device::Bound> {
+    /// Returns the Physical Function (PF) device for a Virtual Function (VF) device.
+    ///
+    /// # Examples
+    ///
+    /// The following example illustrates how to obtain the private driver data of the PF device,
+    /// where `vf_pdev` is the VF device of reference type `&Device<Core>` or `&Device<Bound>`.
+    ///
+    /// ```
+    /// let pf_pdev = vf_pdev.physfn()?;
+    /// let pf_drvdata = pf_pdev.as_ref().drvdata::<MyDriver>()?;
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn physfn(&self) -> Result<&Device<device::Bound>> {
+        if !self.is_virtfn() {
+            return Err(EINVAL);
+        }
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `physfn` is a valid pointer to a `struct pci_dev` since self.is_virtfn() is `true`.
+        //
+        // `physfn` may be cast to a `Device<device::Bound>` since `pci::Driver::remove()` calls
+        // `disable_sriov()` to remove all VF devices, which guarantees that the underlying
+        // PF device is always bound to a driver when the VF device is bound to a driver.
+        Ok(unsafe { &*(*self.as_raw()).__bindgen_anon_1.physfn.cast() })
+    }
+}
+
 impl Device<device::Core> {
     /// Enable memory resources for this device.
     pub fn enable_device_mem(&self) -> Result {

-- 
2.51.1

