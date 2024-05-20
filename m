Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2580B11184
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716226018; cv=none; b=cMI1SzjZrcCZuJ1LkWHEIwHQfXjRsWReDY2oOx7vNSthWjDOutKrYVA24GOYkQvDr72/8MQ2eGfjSLkfjUsYGG7RPIyx4z782RDvZMp+rhdZE4xHgiTPvULWNXX+InivsxqtGBfIKliNqgKOCh81xSLiWgT6YFETARlPj9mnXcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716226018; c=relaxed/simple;
	bh=kxfAh9lS7Mn3sjXjn7qlnE4XYCDSGyNPjC+wTb+HBwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dT2F0L9wRTwq/Dsz1NVpU4S6FtZKNiIfipgpUsEMwLgxc8wm8fSHf7WnUZbFvofpeF1UyYbnWp5L1/ylw3r3SRk7M/8UEPWNIcjErsw2soDs1pB05Oo1jNUjWF1BHzk0kNdOLbL18lMqQUlYzowWgVNr8bOgHta/4lqfFsDiajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O1H9RVRV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1H9RVRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716226016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gx3u0JEgfsEhAPjA6GAC4pQYVsboBrU6ONnJXfcQWCM=;
	b=O1H9RVRVKMjA15AK1o46rw/kxCuRxm64NW9ArhxraQMoQjrx3Kfrh5LnSrWsxSDkCb3irO
	nezLTGMELNCMZPRgZmRiTtq/b6WmmbBpztspoRgiR6hi7nfd08KqAHDqJQRJwLe2oTKY4D
	HGYKxl5GwSfMvYg+STN2MaM3DSiZ0kg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-7HtZa3btPUqmuFYd_BqjFA-1; Mon, 20 May 2024 13:26:54 -0400
X-MC-Unique: 7HtZa3btPUqmuFYd_BqjFA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4201248bcd4so42711875e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716226013; x=1716830813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx3u0JEgfsEhAPjA6GAC4pQYVsboBrU6ONnJXfcQWCM=;
        b=EJJfPOKaSXbMBpflYduAwP7v7gHk+F+LgWUvoVig+OhditNlxyvfnDlVuYRZMBergZ
         ihgdMcVr2W61PH3SmBhFlc3ST4Y9XHfCV5kPJc7D3e+S4WpBCKvZNlUBiuRNoFUbn78V
         n6tpnXgwnTAqLUtKD1zTh7KVPe70ckNqqltYEr0YQNk1XIGhcMgkhC7uhv7qWgyHXksE
         RfFiCQ3/FKLJhK0SSxdZvlhfGQBM7DEwwIiFYVCaH6Fa5W3Sok2hB9+pSuIdor23otKW
         bHrxWEO1Sf2r4pz/Y8zahlYB2co5z8nNx6YfW4UY4UnTDXYNwL29fRWmFn4oZ6tcK1Zq
         v7ow==
X-Gm-Message-State: AOJu0YwEcH4kX7ZkfBFJ3WUTJWJ4pwjaR7TGle8AWdME/mUN4gLP7PR1
	Z388pL6Z/wzjL0en1aelQVmCVBPy6t2Tlvw9QwfhGJ8110S2gb8SOEsXceoG9yQO+idSccwirk1
	8JaUhsWMa6+MSeurGyUgPLRjse3paW8eF5nnIQmmuEgW9LmXD4D6UfWzQz9XVj7Wx
X-Received: by 2002:a05:600c:5008:b0:41b:dca6:a3fa with SMTP id 5b1f17b1804b1-41fead6dc7amr216719315e9.39.1716226013255;
        Mon, 20 May 2024 10:26:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbmLLTMe3CGThrlx2vgSOJ73LtYD3RAzGHWt9c3xNEvxKcy9SyuzQjhuQVYI306IjBPps6SA==
X-Received: by 2002:a05:600c:5008:b0:41b:dca6:a3fa with SMTP id 5b1f17b1804b1-41fead6dc7amr216719145e9.39.1716226012470;
        Mon, 20 May 2024 10:26:52 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9348sm421295005e9.24.2024.05.20.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:26:51 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	bhelgaas@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	fujita.tomonori@gmail.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 00/11] [RFC] Device / Driver and PCI Rust abstractions
Date: Mon, 20 May 2024 19:25:37 +0200
Message-ID: <20240520172554.182094-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch sereis implements basic generic device / driver Rust abstractions,
as well as some basic PCI abstractions.

This patch series is sent in the context of [1], and the corresponding patch
series [2], which contains some basic DRM Rust abstractions and a stub
implementation of the Nova GPU driver.

Nova is intended to be developed upstream, starting out with just a stub driver
to lift some initial required infrastructure upstream. A more detailed
explanation can be found in [1].

Some patches, which implement the generic device / driver Rust abstractions have
been sent a couple of weeks ago already [3]. For those patches the following
changes have been made since then:

- remove RawDevice::name()
- remove rust helper for dev_name() and dev_get_drvdata()
- use AlwaysRefCounted for struct Device
- drop trait RawDevice entirely in favor of AsRef and provide
  Device::from_raw(), Device::as_raw() and Device::as_ref() instead
- implement RevocableGuard
- device::Data, remove resources and replace it with a Devres abstraction
- implement Devres abstraction for resources

As mentioned above, a driver serving as example on how these abstractions are
used within a (DRM) driver can be found in [2].

Additionally, the device / driver bits can also be found in [3], all
abstractions required for Nova in [4] and Nova in [5].

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] https://lore.kernel.org/dri-devel/20240520172059.181256-1-dakr@redhat.com/
[3] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
[4] https://github.com/Rust-for-Linux/linux/tree/staging/dev
[5] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Danilo Krummrich (2):
  rust: add abstraction for struct device
  rust: add devres abstraction

FUJITA Tomonori (1):
  rust: add basic PCI driver abstractions

Philipp Stanner (2):
  rust: add basic abstractions for iomem operations
  rust: PCI: add BAR request and ioremap

Wedson Almeida Filho (6):
  rust: add driver abstraction
  rust: add rcu abstraction
  rust: add revocable mutex
  rust: add revocable objects
  rust: add device::Data
  rust: add `dev_*` print macros.

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  | 145 ++++++++++
 rust/kernel/device.rs           | 498 ++++++++++++++++++++++++++++++++
 rust/kernel/devres.rs           | 151 ++++++++++
 rust/kernel/driver.rs           | 492 +++++++++++++++++++++++++++++++
 rust/kernel/iomem.rs            | 135 +++++++++
 rust/kernel/lib.rs              |  10 +-
 rust/kernel/pci.rs              | 449 ++++++++++++++++++++++++++++
 rust/kernel/prelude.rs          |   2 +
 rust/kernel/revocable.rs        | 441 ++++++++++++++++++++++++++++
 rust/kernel/sync.rs             |   3 +
 rust/kernel/sync/rcu.rs         |  52 ++++
 rust/kernel/sync/revocable.rs   | 148 ++++++++++
 rust/macros/module.rs           |   2 +-
 samples/rust/rust_minimal.rs    |   2 +-
 samples/rust/rust_print.rs      |   2 +-
 16 files changed, 2529 insertions(+), 4 deletions(-)
 create mode 100644 rust/kernel/device.rs
 create mode 100644 rust/kernel/devres.rs
 create mode 100644 rust/kernel/driver.rs
 create mode 100644 rust/kernel/iomem.rs
 create mode 100644 rust/kernel/pci.rs
 create mode 100644 rust/kernel/revocable.rs
 create mode 100644 rust/kernel/sync/rcu.rs
 create mode 100644 rust/kernel/sync/revocable.rs


base-commit: 97ab3e8eec0ce79d9e265e6c9e4c480492180409
-- 
2.45.1

