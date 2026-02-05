Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA531335540
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325244; cv=none; b=Pl6/Sm/Gz6XX/qAX1iXvqJBJirxoP0MUsqmAhkHoZ0ZsgfCsxBwS6/u+DthcwAHyTjYYeJ/SAHcbZ4zTr4ju14ID/ESHADX/xlb4zykS3QxplTBRD6a2Ht3n4BWsG6+tHaLrES8gu1N3vjF0JU8xvGJzd2tkpdkGguv4ypAVFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325244; c=relaxed/simple;
	bh=DsoH5kljF8z69G5m/2pqjtsvxAd0CBzUg2OXfZWFlWQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=R02ZC/xNhwS5tSwpjNQyK3u61DzuGb84EOiaFmk+dGqruNWk8f8h46RW0xtdy0wC/3djGpeGHA2APUOrILYbtuDbCbP2QXbd0VREy2c4PCmoJqs4dWZqEfS+fprkH9QbISGzmNDQpJ8SPqzZIAA5gDQGdAw7jOIv8wJVChxdLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FPMn4KQw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FPMn4KQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
	b=FPMn4KQwmZNXeuAr8sNW6WPxBDpRpriID8WzbvdMYaxY0NX0l6kzkYcm6LvAIxlEZn2Cac
	SGl4ptaD5jgKBvN5RUtuSUWO8v+CgqVrU7fV7CaVglrt9/SdpMP1WI7I7b5AYrtNhpvGpP
	Jg0CvBm+5xr6fWqiWCBO2ZIk7vZVnJY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-3rQtjlmnO3-r_vWA_xuHww-1; Thu, 05 Feb 2026 16:00:42 -0500
X-MC-Unique: 3rQtjlmnO3-r_vWA_xuHww-1
X-Mimecast-MFC-AGG-ID: 3rQtjlmnO3-r_vWA_xuHww_1770325242
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso375466685a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325241; x=1770930041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
        b=gFv8sS+94LDAM2nag2kb7CGlmU0dBMZCm9RwgaJ2M7Qs2chsqYo9IqWomQaDvf4uS3
         R6Ipcx9Ipz/BjbgqtbsqH/OX+Tgg6Ef6bvykafBFk+vwNhvNslmDfoC+UF0WCu/lRvSP
         laSSk63bbFcOXJ8PNvRdgx6MEB2p0G5OUS7wrDjpcWb+folL6CCYutXhaA5RHEnouS+k
         Xvb85YL/hpFIrRw+/ff/P6Lb/AJT2STNAP+0JIvN+i9YR0EXQGlL+XnTpKgb1nbdspt7
         HaXFi1KO2wV4InkoJztFKJtLHslxEUVdbZQlFkGCpVWUdRvOIx+kQX66OM9uVcy792OH
         lbag==
X-Forwarded-Encrypted: i=1; AJvYcCUV0FbRaYwe3gu2JrfXEZzSpZ9w8tqP05xVDFMvWCP6Rqm58akP1RmzKdYxynSLjInH5zwwNvcAp0XJn8r1Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjmGfpVU+ikAoBCr6m7sfeGtghpAcEK2BYXxbLX03YTgatOUhZ
	PLrpso24augv5UGCPGMK4JjqXrAbabHzwBMHzEVjGE+xLjz3GVz4S2Yr+DzmC6VFMilTs38XDKg
	jcykmXbS4LSDJQr/ZQaOkCDKFfwhFcKqyUCjLmdlAwwd1pKG28aTfgaZd9XrKrX1PmvuK
X-Gm-Gg: AZuq6aIzKpqhOnByUUfnFaajr2/YykBgXcS3wNo65WRiRugKryHUDCto6wM3SRXpirm
	rShSWevatvogaVibOJSLHH6e8JmT3xfFu7Z/yT+Sj/o87J503eFDZss7ijcDs5e9/LYqUW7yMeN
	xZEJiD1PLtUVL011xolDtCzCBpu7c4/r21ZkCBNra9WFIC6Ij0crckk3Xekxp8JqcYMvSHhLpVv
	LdOjpHOYCTVJPow9lj4a6k9bt7IYQJRh3P/TzDwmmctrDCcHo01RqknWaW+bDqbGfyBt9F+X37j
	RJztzKOBQSgAnwtiHonMaKjGnzbZccGiEl37WEp9fsgAyRpZr2Rw0jYdIXcCxh7M+0QAtkdqy2E
	ev68amgPenBfQFJE=
X-Received: by 2002:a05:620a:28c5:b0:8ca:3854:8110 with SMTP id af79cd13be357-8caf130789cmr57432085a.72.1770325241394;
        Thu, 05 Feb 2026 13:00:41 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8ca:3854:8110 with SMTP id af79cd13be357-8caf130789cmr57425985a.72.1770325240837;
        Thu, 05 Feb 2026 13:00:40 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:40 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:57 -0500
Subject: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: r6H5zpQFISTAss1oQLr4ytf82ZhJ8A9aATwmBxnxxTc_1770325242
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add a new SR-IOV driver sample that demonstrates how to enable and
disable the Single Root I/O Virtualization capability for a PCI device.

The sample may be exercised using QEMU's 82576 (igb) emulation.

Link: https://www.qemu.org/docs/master/system/devices/igb.html
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Use "kernel vertical" style on imports.
- Demonstrate how to reach driver data of PF device from VF device.
---
 MAINTAINERS                       |   1 +
 samples/rust/Kconfig              |  11 ++++
 samples/rust/Makefile             |   1 +
 samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b277baee5eb6725b3a5126cefb6eef6190b02413..96dffd777c24473063baaeda017f64b15e8c0ab9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20242,6 +20242,7 @@ F:	rust/helpers/pci.c
 F:	rust/kernel/pci.rs
 F:	rust/kernel/pci/
 F:	samples/rust/rust_driver_pci.rs
+F:	samples/rust/rust_driver_sriov.rs
 
 PCIE BANDWIDTH CONTROLLER
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab910634596aea4a1a73dac87585e084f420a..f244df89c4fc9d741915f581de76107e8eb0121b 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -128,6 +128,17 @@ config SAMPLE_RUST_DRIVER_PLATFORM
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_SRIOV
+	tristate "SR-IOV Driver"
+	depends on PCI_IOV
+	help
+	  This option builds the Rust SR-IOV driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_sriov.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_USB
 	tristate "USB Driver"
 	depends on USB = y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58ccccfd12ef019f68ca784f6d977bc668..19d700f8210151e298cc049dacc249a121d0f2c4 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_SRIOV)		+= rust_driver_sriov.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
new file mode 100644
index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
--- /dev/null
+++ b/samples/rust/rust_driver_sriov.rs
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
+//!
+//! To make this driver probe, QEMU must be run with `-device igb`.
+//!
+//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
+//!
+//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
+//!
+//! and append `intel_iommu=on` to the guest kernel arguments.
+//!
+//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
+//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
+
+use kernel::{
+    device::Core,
+    pci,
+    prelude::*,
+    sync::aref::ARef, //
+};
+
+use core::any::TypeId;
+
+#[pin_data(PinnedDrop)]
+struct SampleDriver {
+    pdev: ARef<pci::Device>,
+    private: TypeId,
+}
+
+kernel::pci_device_table!(
+    PCI_TABLE,
+    MODULE_PCI_TABLE,
+    <SampleDriver as pci::Driver>::IdInfo,
+    [
+        // E1000_DEV_ID_82576
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
+        // E1000_DEV_ID_82576_VF
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
+    ]
+);
+
+#[vtable]
+impl pci::Driver for SampleDriver {
+    type IdInfo = ();
+
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
+
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            dev_info!(
+                pdev.as_ref(),
+                "Probe Rust SR-IOV driver sample (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+
+            if pdev.is_virtfn() {
+                let physfn = pdev.physfn()?;
+                let drvdata = physfn.as_ref().drvdata::<Self>()?;
+
+                assert!(physfn.is_physfn());
+
+                dev_info!(
+                    pdev.as_ref(),
+                    "Parent device is PF (PCI ID: {}, 0x{:x}).\n",
+                    physfn.vendor_id(),
+                    physfn.device_id()
+                );
+
+                dev_info!(
+                    pdev.as_ref(),
+                    "We have access to the private data of {:?}.\n",
+                    drvdata.private
+                );
+            }
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            Ok(try_pin_init!(Self {
+                pdev: pdev.into(),
+                private: TypeId::of::<Self>()
+            }))
+        })
+    }
+
+    fn sriov_configure(pdev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+        assert!(pdev.is_physfn());
+
+        if nr_virtfn == 0 {
+            dev_info!(
+                pdev.as_ref(),
+                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.disable_sriov();
+        } else {
+            dev_info!(
+                pdev.as_ref(),
+                "Enable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.enable_sriov(nr_virtfn)?;
+        }
+
+        assert_eq!(pdev.num_vf(), nr_virtfn);
+        Ok(nr_virtfn)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for SampleDriver {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(self.pdev.as_ref(), "Remove Rust SR-IOV driver sample.\n");
+    }
+}
+
+kernel::module_pci_driver! {
+    type: SampleDriver,
+    name: "rust_driver_sriov",
+    authors: ["Peter Colberg"],
+    description: "Rust SR-IOV driver",
+    license: "GPL v2",
+}

-- 
2.52.0

