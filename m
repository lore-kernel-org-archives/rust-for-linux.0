Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D229328621
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590773; cv=none; b=ATtM9V9RQgccRthoKfzanOqP/L6xKgIR/TABTqN+ggM/u1ofPr8E5uosrEJX+XQ67r+Tb5wUnEjkcz8pI7GEoypIjiU5bpljTo6KwWCq32ZAoifuTRoeNIEaxVndXgdQnFelrWy1pYvmTBQfJDVfxyVXSOSfjnk5KpJfbBWjz6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590773; c=relaxed/simple;
	bh=96vzRx7vAI2mBmrVDn/9P0AmXFPaMNtBzGQHfEQkyQc=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=NfO2DrUmTQNc7z51ulvHPSrmr6idvpB6npsgB5XH58Z3FM92BSWuT8U9++HSHKBHO9Qsk/kazM2iaSu/x2taiHiHdEkPa2ubOk/1CmOVrUExzhpqFXLkd5z3Z7Qf+Fu1f7tZQJNy9mu1/mJtZKIBYQpdnVx0NS3TUcizsSYChnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=On928odw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="On928odw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8tI4EYN4JDf7RLWnoc2eVOO/7lGndZZgrSr2xQc/es=;
	b=On928odwtFbUckg9HDtC0HAK8qPOdXjKMnJDOdDZpOxx7ONJebSCSVYW9IC4N7kwDEgXVx
	dJuiZnZU2mtKhpATpjoBYKpNB+ICItxoH1OmxKz8zHFRcOcg+UHXZpOAVEJ4wRGxzQepZd
	ZKKZAfqMMIRYxwa98wiZV4zp+9NV6ys=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-yVQeYc8NO1WG5Q5xQ3o9eQ-1; Wed, 19 Nov 2025 17:19:24 -0500
X-MC-Unique: yVQeYc8NO1WG5Q5xQ3o9eQ-1
X-Mimecast-MFC-AGG-ID: yVQeYc8NO1WG5Q5xQ3o9eQ_1763590764
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88238449415so10676986d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590764; x=1764195564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8tI4EYN4JDf7RLWnoc2eVOO/7lGndZZgrSr2xQc/es=;
        b=SIviWf1I4fpEU8B69lly9JMwHjdLAgRGeI7U+4hbWJHTHFoHKU7ld75GbIa42hjknn
         AiQlrK2mggxu+d0rMKfmNaDLcKzJlP2wqlNujlz/8wTSxlwHJ9im8kJTuD8lI8/XHPIl
         OtghZrobqr9ioRCsZdrTt7Q42bTNv3MoSBjj120VZMz0ZAZvMjLO2kTYk5z8hK3hHMdy
         NPSsIl003IF9hVdDzqli0B5LoNUlb7U/SohX809AcqDTYEtThLtddTgDT3qTr5D8eWCt
         655f48m+wsITlRVFpMkcrY10NlZlG1P+b8bKfwCp54BZnRJlhKUiVld4czIdQRPM0XxQ
         pIdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXisAircjh4AmqyylVT+/2EZzTSD/jyv4wvWqMZj0S5pJA7XcSYRNunSSV4nAMdoABlkoKMUsiHtkRSPAXdRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4iDdq2jpk73CkNDMGYHhsWhGlonhHPXnBQ69fEFZXV0GbMouj
	8XEy0cShkvppHRDo7VVda8xBWi+j91HA2r2XdGJTQTRDJKusVNEpIwlz3hA2mmsqiD2QrWfiHok
	Ox0GpT3TpfK2qmPkVyzWdFz29abMx/OKyhxFPVlKOJmXruOa/2Ca6J05kkc9OUZV6IEk4
X-Gm-Gg: ASbGnctPPHBIovgb0EhfNkfPy9xPiXWyyHma5yn8scJ4G2Xag4F3jTzeNggsIC3UJ9/
	QsRKuSKNSxo2n7pkEs1KgsrSSinZ1kC9thJpDgERY3sZzJn/NkwxAhQkF7cMmnuqXqNbSCZn2Ol
	szK05EO26lTGU+SmFrx5dzUYG+0poVDm72I2n+EbbWxnYSGIoVw44zR31Ug3Suy9hWN0XVWgyL7
	A7fEmxy47qiVjx/gpBVI92owToDBI3C7QYqlNRj5uKbGuyYO/dusq3H24u1rd1dk/7guW9ZYJ3y
	gWpfJrMqTzb3t2UeNRzBMbkzvoSIo12hGNGCoGQD0tY8I/hb+g2JBMqhR3+T3rdgMOoPAXsO8Zd
	hBVb0DqJRivHmwA==
X-Received: by 2002:ad4:5aee:0:b0:880:4b32:a0fa with SMTP id 6a1803df08f44-8846e126e0fmr15483636d6.41.1763590763824;
        Wed, 19 Nov 2025 14:19:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBivjBhOPSe6mET8GARncZ+tJIO6qjaG8DWoG+YM0pRYYJOOFxIiTqJbhAXlSbK26RHnOI+A==
X-Received: by 2002:ad4:5aee:0:b0:880:4b32:a0fa with SMTP id 6a1803df08f44-8846e126e0fmr15483256d6.41.1763590763106;
        Wed, 19 Nov 2025 14:19:23 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:22 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Wed, 19 Nov 2025 17:19:09 -0500
Subject: [PATCH 5/8] rust: pci: add vtable attribute to pci::Driver trait
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251119-rust-pci-sriov-v1-5-883a94599a97@redhat.com>
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
X-Mimecast-MFC-PROC-ID: _RV4wE3OHEMaafi5HYLty-4xKAKv_v6_2aAXC3iFNKk_1763590764
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add the #[vtable] attribute to pci::Driver trait and implementations,
to prepare a subsequent patch that adds an optional bus callback
sriov_configure() to enable or disable the SR-IOV capability.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs                    | 1 +
 samples/rust/rust_dma.rs              | 1 +
 samples/rust/rust_driver_auxiliary.rs | 1 +
 samples/rust/rust_driver_pci.rs       | 1 +
 4 files changed, 4 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index edb2bd41c8a14c8cfc421b26cda4dc84f75b546d..24dda12f6402098a1a323f3b5aae884201b26d89 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -275,6 +275,7 @@ macro_rules! pci_device_table {
 ///```
 /// Drivers must implement this trait in order to get a PCI driver registered. Please refer to the
 /// `Adapter` documentation for an example.
+#[vtable]
 pub trait Driver: Send {
     /// The type holding information about each device id supported by the driver.
     // TODO: Use `associated_type_defaults` once stabilized:
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index f53bce2a73e3bb619372798c33bc3f13e580fdfc..96aa906984d8a40c5270bb2a7bcf9650a41b7c9e 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -51,6 +51,7 @@ unsafe impl kernel::transmute::FromBytes for MyStruct {}
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 5761ea314f447643b8023b05ab7e92b60e6a1e17..23488fa6179fcc8c7a44df949d5eeeb1b132bd2d 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -64,6 +64,7 @@ struct ParentDriver {
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for ParentDriver {
     type IdInfo = ();
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 5823787bea8ec3e9a38ab3e4941f6c88d70e00b4..400db907e061a6a782b1cfebe9e5744815cc2843 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -60,6 +60,7 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
     }
 }
 
+#[vtable]
 impl pci::Driver for SampleDriver {
     type IdInfo = TestIndex;
 

-- 
2.51.1

