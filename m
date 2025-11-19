Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ECD2DA753
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590762; cv=none; b=HMmBro81Y12NrMBU9CN1uggVaptVKxkkxEIJ7AzrlVFUBKGjJ/oxD0QHWU7faaayCN2cSOwI49F7Q1JM6FJtTDBzWJ9LQNwmZmmMoFMdIGDpW/PtNVfbKvjyhqqWWaDNted1ohFyuxR6tihMD6J5d8GZJ/TG5H6HXdlpKVnvPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590762; c=relaxed/simple;
	bh=+Ew1MxHcxbH+jlKqEW6JTrhgP/QMWnhNx7X3j0QN/oo=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=MV287YMBKZiZQtEQXFAhiyc6wfKebKOSwl6cFkCme86aBYI9om6rDu3ZR1ZvgmkUNOoTAAmdMc0SVI6dq01JBgR5P3ox+N0iPtDcpeGxINjIsV+Z53ZMkBjYBCGKYFlFiWbWC9LOS3K7SyvkqJcN7klsQR1lk2yxinFz4Jj7Yjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUf/b2k5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUf/b2k5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=InbEGXlkbC7aIxo6RxR3oAJ6BzaAFqST5Ccg6MsT3TY=;
	b=JUf/b2k5qrGiw1nca+4xugzcG5VKJDXWkuDilnZZek/JM7mlDovmovTUdCH1bTkoOhCEYA
	BvK6AkZKXDb0jRElBg9BXVUATXs3dJo4jEWzsiE+iKeE7hETt8XPFOWax1loBlpUTPIKaB
	9Vain/jNR4YouF55JeMBxj/diyRoSJk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-GFmZRNnYOhu4CikclCrRNg-1; Wed, 19 Nov 2025 17:19:16 -0500
X-MC-Unique: GFmZRNnYOhu4CikclCrRNg-1
X-Mimecast-MFC-AGG-ID: GFmZRNnYOhu4CikclCrRNg_1763590756
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88041f9e686so7515376d6.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590756; x=1764195556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InbEGXlkbC7aIxo6RxR3oAJ6BzaAFqST5Ccg6MsT3TY=;
        b=U0J3g5mjJw5RO2CZzPTfnynTPzqHhqGlx/sdVrd58BLO6HLVaYDJmsuVuFs9gonHPs
         OSrkQnmP24HNx6ClkJLJKBNNLIut7jhMr5BDCkFhbapAEfFJqvVplS7HN+jBqec09YoZ
         WPXWuXgYYxQG2wlW4CfhVTYv1hDdCj3VUgVPtW2Ummm+NWa8+0x8YF/gFZir8YR3VKhT
         c9w+ySfzJGsdOrwmT8DD0l1TK30Kw7zvahrOrnoJJMDbAFOxZ/QSwaP2Yss1XTu7Phbd
         J1s5ckf8N8cozXZJG9F55QLipkZuENNRAMOhG7pwcoaIunwl21zow/wYoT2ucKNA7gNJ
         iNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1PjrvTC3KP/G9KLBMYs4VUZ9+O4FQvxqkvw1Ei3wNeoRRZ0K5pxbB8BDF1ZZGm44eXPjGJDI3KuidyGBj9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZBj+rFIY8JGm6CW47kgpjk+EoQGZlPXdHS06jU3MDcL1/f9F
	4S5tUPO0iV/Lp73edSHwyLmMdn3RSXCWMQkr83RCm2shGGdQ/Xy1851ctnOEDfROUHru/YlX44g
	zgm2AvjRUo4G3klzwaOU/n7YjdihSo6O2tABk5qmiGBpJAdqaJV3mndj1P+6EndCFAZbd
X-Gm-Gg: ASbGnct81vtnFQ8rzAaIMQjmZ0vEkBGZ2eMUacxEObNH3IjBH71PiAxe15NQpf94ZqW
	lNZWL/Kut5qoYgXhOMl2q1Q9qxk1XguXuTnZZbkVKzFJQCwXhUc76ziP2V3UlE/RUYvMcvKkMlN
	EDR/pnaO75r0D1VJy7O4JtfL/xgClHHCZqGhJQsfCGkPjYv2zLL5zu8jCiUV7IllCmTfMMaSz6l
	UO505SMLNNvPuLekqmwNUoC4bxvEcm0ghaNfU6y4FmQXHKU+k7Bjdn9rH9EDPFtEWFayTuDEYxl
	lYIE35j8FB+kvoRxI6s1v8kKcE4n36FGB/1SwEnNZS87BvpzS7jFDHerYZHoeGvyX3iur9qrYlC
	tAirNH60qcvu7yA==
X-Received: by 2002:a05:6214:5d05:b0:882:5078:8da1 with SMTP id 6a1803df08f44-8846e1a66abmr9937426d6.64.1763590755824;
        Wed, 19 Nov 2025 14:19:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAuyNCjGboSddd6tU49f/lePK3CChtTK/F5SRNahw3YOsS3sJ5DgJj+6nNXHdp9XkGb8cTBw==
X-Received: by 2002:a05:6214:5d05:b0:882:5078:8da1 with SMTP id 6a1803df08f44-8846e1a66abmr9937156d6.64.1763590755371;
        Wed, 19 Nov 2025 14:19:15 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:14 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH 0/8] rust: pci: add abstractions for SR-IOV capability
Date: Wed, 19 Nov 2025 17:19:04 -0500
Message-Id: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/w3HMQ6AIAwAwK+QzjaBGozxN4hVu4ChykL4u9x2D
 ZSLsMJmGhSuopLTiJsMxDuki1GOcSBL3llasHz64hMFtUiuGMN6eut2CjxD7z8wDNMLUAAAAA=
 =
X-Change-ID: 20251026-rust-pci-sriov-ca8f501b2ae3
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
X-Mimecast-MFC-PROC-ID: u-UEQEmo9WtCafWP3bJZgmsZEzJ0N3P6TeOYvGDrs1c_1763590756
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
sriov_configure() callback to disable SR-IOV before the unbind()
callback. To ensure the guarantee is upheld, call disable_sriov()
to remove all VF devices if the driver has not done so already.

This series is based on Danilo Krummrich's series "Device::drvdata() and
driver/driver interaction (auxiliary)" applied to driver-core-next,
which similarly guarantees that when an auxiliary bus device is bound to
a driver, the underlying parent device is bound to a driver, too [2].

Add an SR-IOV driver sample that exercises the SR-IOV capability using
QEMU's 82576 (igb) emulation and was used to test the abstractions [3].

[1] https://docs.kernel.org/PCI/pci-iov-howto.html
[2] https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
[3] https://www.qemu.org/docs/master/system/devices/igb.html

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
John Hubbard (1):
      rust: pci: add is_virtfn(), to check for VFs

Peter Colberg (7):
      rust: pci: add is_physfn(), to check for PFs
      rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
      rust: pci: add num_vf(), to return number of VFs
      rust: pci: add vtable attribute to pci::Driver trait
      rust: pci: add bus callback sriov_configure(), to control SR-IOV from sysfs
      rust: pci: add physfn(), to return PF device for VF device
      samples: rust: add SR-IOV driver sample

 MAINTAINERS                           |   1 +
 rust/kernel/pci.rs                    | 148 ++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig                  |  11 +++
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_dma.rs              |   1 +
 samples/rust/rust_driver_auxiliary.rs |   1 +
 samples/rust/rust_driver_pci.rs       |   1 +
 samples/rust/rust_driver_sriov.rs     | 107 ++++++++++++++++++++++++
 8 files changed, 271 insertions(+)
---
base-commit: e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559
change-id: 20251026-rust-pci-sriov-ca8f501b2ae3

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

