Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FF382F0F
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572536; cv=none; b=Nt20184vx0hBnRKn5sHyQxIn7nbe7qI7lec7tha/C69smykWhEMa6GvUPcnEMOy1eoHjbHcnS3RWvg8wOfl3lNVYrFKxp1+unX3fp3C1G4VYZej9+vck8T4SQsPZwYB3VBN9q9uR7nrH0hLWh6vctpXVM3+uUWHjGiCk/MNswT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572536; c=relaxed/simple;
	bh=S/uQnRBX7EM2s7NdwB1h0Zvrd47E5NDlePG8Fysu8x8=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=rkT+40KYElf6fdcsDefmKXtw2HEyafUHmpUwLhGWhMXA/pluoN8ttLA4yGF/PGSA5NBkzAfk6SUpxJ/X8pOHodeikqr3wTne7Xj92J91N73qIglPMTvU6wsJYIZxFrKePFC5iId1NtQWMx2gV0nkBr+te97XgOqJWRBa9BSk9D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGkVIflW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGkVIflW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wrmpWbz/D0LbSjhwAo9Mxe/RiGjDGWcxtMIqyIp8KYQ=;
	b=iGkVIflW/q203O//UxT3xpDOHkD/nUl7boXfrz/w+3PDbWQIAILlJU1Qa6DGysR6mfLOMW
	Gp3i6LZpxgi8RBwTazB95oC1Vw7FG+qTlRoDq1Iilron7wSZTQ96BBa8ZVbEm3yddp+9b2
	7mAMiBlqhxcDxBHHWbN26vMJAWZgRJE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-ZdNzXKYcMmSbskODcmvoJw-1; Tue, 03 Mar 2026 16:15:33 -0500
X-MC-Unique: ZdNzXKYcMmSbskODcmvoJw-1
X-Mimecast-MFC-AGG-ID: ZdNzXKYcMmSbskODcmvoJw_1772572532
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506c0da79c5so529575601cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 13:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572532; x=1773177332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrmpWbz/D0LbSjhwAo9Mxe/RiGjDGWcxtMIqyIp8KYQ=;
        b=O51lI6SjSijsdVvJEeKRWb7xXBzwWO6l5/sTKRU9m7cuWWSgPkcToYfUbfIVz60YL9
         ztDEy1LTGxyOiyzUxxJ/9cTXrdjhWrOfuzVOxthcVzmNbruAz1+jWo8VPTEHwZxf/7Yh
         DuF8VtEWS/DGfn1SKZxJPFxOIM0LuMN6STNwuJFgYzzWVnukLeHbJ7yOB8SeCdCGMmvc
         U+V9A0npHG9h4NXZ0HY+XkGvkZ9F7ziVIaEVTw6WQcoAgrBqyC1q2/8C2HCAoxZc2P6t
         pa2+j78N2GH4/250eplrMRADdkzrlCKaxaDd7K8df18L50JJwd8kMFWH1iR6YMyWKhak
         WB1A==
X-Forwarded-Encrypted: i=1; AJvYcCUFcDuestqUVf3DNxSJE2kPt9FDbfb9CoWLr6bmaRJD08baR76C68UyhPmVXQlhISn1aI1rmcOwSB8LyC+BKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoLGrnVV0RqKLk/aj+nhKtj1ocpWjwl/htARvYn5406oD1IWSu
	TQ1ogyDCiaY4JOQ2KdrelqdZrpZtF5QP/WMV388FYkDi4IxNwBjZLqrx0PgsLj9i+EhXbDqGda8
	Fr+wLX68N050wkoL12vvMOKUjagC1SpVyL8VwZqNJtOxU1hifYBHbaA8TI0Wk2YP9MmXw
X-Gm-Gg: ATEYQzzAgo0t9HtAdF0qchrK/RcV9SFzdODyezcgYCryPxGry1KcyHX8ygmD6+5y0Tp
	mXTl5JDIIAlVTwiwXjQRkp3ZBJoEj2wFxsJxrzs2+8jcuKBjut8/JVtOiACICTBAXTrgorP6KHn
	7OyGjXM5OUy/PEHsCo0lFdKU1z+ambcebGl7KvFbYdwAnJL3Om0rvu5fgw+ImFQ3PmGD1I+F6zW
	B6HCEfhfVwOLR8Lg5S4neJodQwX368eLzzpvmjc4OyzRXtYoYoKMz0iQZm1ytD1TC4o4jvXmwkv
	zTD0yoNeA5RsUH5xiB0wn8t4NjxDvU+gwCQMe80bWP8FDKjdiWIggInGilR91nd+m20onQfXJHq
	q3SHeNjPkwCUXv6bUzua3dGS2qg==
X-Received: by 2002:a05:622a:214:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-5075273cf0dmr220407371cf.16.1772572532214;
        Tue, 03 Mar 2026 13:15:32 -0800 (PST)
X-Received: by 2002:a05:622a:214:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-5075273cf0dmr220406951cf.16.1772572531594;
        Tue, 03 Mar 2026 13:15:31 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:31 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV capability
Date: Tue, 03 Mar 2026 16:15:20 -0500
Message-Id: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMQQ6CMBCF4auQrh0zLZRSV97DuChlkFlITYtND
 OHuNhoX6urlX3xvFYkiUxKHahWRMicOc4l6Vwk/uflCwENpoVBpiaqFeE8L3DxDihwyeNeNGmW
 vHNWioInTEuLj9ZdlmdObSml/aZaA0HW1s4221llzjDRMbtn7cBXn8pXVx7eoUP95VTyNtkH0x
 rSm//Lbtj0BNUVq1N0AAAA=
X-Change-ID: 20251026-rust-pci-sriov-ca8f501b2ae3
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
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
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
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
X-Mimecast-MFC-PROC-ID: VgaRQYMT_86tqgPRjAtw8cJZcN3vA7asX8J9sOhZpwg_1772572532
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
capability of a PCI device. Provide a minimal set of wrappers for the
SR-IOV C API to enable and disable SR-IOV for a device, and query if
a PCI device is a Physical Function (PF) or Virtual Function (VF).

Using the #[vtable] attribute, extend the pci::Driver trait with an
optional bus callback sriov_configure() that is invoked when a
user-space application writes the number of VFs to the sysfs file
`sriov_numvfs` to enable SR-IOV, or zero to disable SR-IOV [1].

Add a method physfn() to return the Physical Function (PF) device for a
Virtual Function (VF) device in the bound device context. Unlike for a
PCI driver written in C, guarantee that when a VF device is bound to a
driver, the underlying PF device is bound to a driver, too.

When a device with enabled VFs is unbound from a driver, invoke the
sriov_configure() callback to disable SR-IOV before the remove()
callback. To ensure the guarantee is upheld, call disable_sriov()
to remove all VF devices if the driver has not done so already.

For PF drivers written in C, disabling SR-IOV on remove() may be opted
into by setting the flag managed_sriov in the pci_driver structure. For
PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.

This series is based on Danilo Krummrich's series "Device::drvdata() and
driver/driver interaction (auxiliary)" applied to driver-core-next,
which similarly guarantees that when an auxiliary bus device is bound to
a driver, the underlying parent device is bound to a driver, too [2, 3].

Add an SR-IOV driver sample that exercises the SR-IOV capability using
QEMU's 82576 (igb) emulation and was used to test the abstractions [4].

[1] https://docs.kernel.org/PCI/pci-iov-howto.html
[2] https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20260107103511.570525-7-dakr@kernel.org/
[4] https://www.qemu.org/docs/master/system/devices/igb.html

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v3:
- Replace SR_IOV -> SR-IOV in description.
- Drop redundant `.as_ref()` for `dev_*` prints.
- Link to v2: https://lore.kernel.org/r/20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com

Changes in v2:
- Move logic to disable SR-IOV on remove() from Rust to C.
- Add driver flag managed_sriov to opt into disabling SR-IOV on remove().
- Demonstrate flag managed_sriov for dfl-pci driver.
- Uphold safety guarantee for physfn() when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
- Use "kernel vertical" style on imports.
- Use to_result() to handle error in enable_sriov().
- Note Bound device context in SAFETY comments for {enable,disable}_sriov().
- Demonstrate how to reach driver data of PF device from VF device.
- Add missing #[vtable] attribute in PCI driver trait example.
- Add missing #[vtable] attribute in nova-core driver.
- Define struct MyDriver such that physfn() example compiles.
- Replace VF -> PF in doc comment of is_physfn().
- Add #[inline] to is_physfn() and is_virtfn().
- Link to v1: https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com

---
John Hubbard (1):
      rust: pci: add is_virtfn(), to check for VFs

Peter Colberg (9):
      PCI: add driver flag to opt into disabling SR-IOV on remove()
      fpga: dfl-pci: set driver flag to disable SR-IOV on remove()
      rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
      rust: pci: add vtable attribute to pci::Driver trait
      rust: pci: add bus callback sriov_configure(), to control SR-IOV from sysfs
      rust: pci: add is_physfn(), to check for PFs
      rust: pci: add num_vf(), to return number of VFs
      rust: pci: add physfn(), to return PF device for VF device
      samples: rust: add SR-IOV driver sample

 MAINTAINERS                           |   1 +
 drivers/fpga/dfl-pci.c                |  17 ++--
 drivers/gpu/nova-core/driver.rs       |   1 +
 drivers/pci/iov.c                     |  41 ++++++++-
 drivers/pci/pci-driver.c              |   3 +-
 drivers/pci/pci.h                     |   2 +
 include/linux/pci.h                   |   8 ++
 rust/kernel/pci.rs                    | 165 ++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig                  |  11 +++
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_dma.rs              |   1 +
 samples/rust/rust_driver_auxiliary.rs |   1 +
 samples/rust/rust_driver_pci.rs       |   1 +
 samples/rust/rust_driver_sriov.rs     | 127 ++++++++++++++++++++++++++
 14 files changed, 366 insertions(+), 14 deletions(-)
---
base-commit: 1b9a5bc8513d081c1bfe2c096b6dc502a4660f47
change-id: 20251026-rust-pci-sriov-ca8f501b2ae3

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

