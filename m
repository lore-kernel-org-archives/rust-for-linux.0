Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721A32F6939
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590765; cv=none; b=sU6tHAI1vic5LzYqJTEcOBIBGkXjjDrONLvD96JQUvPhOooIJGebDJC3DmbylESXxRUayE4/FX/h5C2OGjQF/RNbeFL5qOzQiughp8ggQQcFAUfh7bF7IrzigX53DXn1JpEwOh81XLEnWw+7YazkD3Uzje9g1penR0cC83BvNnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590765; c=relaxed/simple;
	bh=gUctwyZu30sn6ERuNz9kxhzBQ/dbl4j0za7C8gd+O2k=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=QCRLqXJG44mhIUI1f2Pf3vu1HTfCsW/EdHiUoKh3dJeATPS5NufnvXAgixx0KrBMKU2TN3Z+9RV3TCEPy1NGkvybkV7jp113M2qZYJIC/e3ULsqAurlyzcgDRZSnIylduf6pq5aUadmYsdUor3MvWWDzgcyoWBCF0G+aIrp9bNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fYz1oigS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fYz1oigS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlM8hkUz32RUJhAJoZInUpHPPnxIuanN0JL39L4XpyI=;
	b=fYz1oigSHasGpXc/Th3+y2gLZY8r64IveYiT4105RWD42ktwKu9MLKZt1CrzyCHO45thmG
	2eNHTkuCICmg5aCuN9g2zDEABCXU6hvJE7Y8T5L94RGqD960aiXrS+miJ4f/4dOSMliT2A
	zn6ThSFk80GiyZgxhjQVqpxYRA5ym/0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-P73mIVGQPUGrSGXBABDy4Q-1; Wed, 19 Nov 2025 17:19:21 -0500
X-MC-Unique: P73mIVGQPUGrSGXBABDy4Q-1
X-Mimecast-MFC-AGG-ID: P73mIVGQPUGrSGXBABDy4Q_1763590761
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88239fa9ec9so6976576d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590760; x=1764195560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlM8hkUz32RUJhAJoZInUpHPPnxIuanN0JL39L4XpyI=;
        b=vuGJuUzockDlDEm/JkQ1g+/2vx02sZxCFHyAYdMTRSO+Y9ACuAe1F3MIst0FGIDys+
         KpeIXIweI32CH4mmIvaXxwEONBEsjaxw5jotfHG7NFWAMldGB75In9+3sBSqXgLCcEPv
         zYBnpqhN2/9Fd7WWmoJfcLYV/2yyb1rS2uNuQTXHpBFr4ddm9MF+jZk1n9sR+nX80HqP
         XpfCgwmeQgnVShhCekAfiYhI3dvxlG/hRvjcVC6nW2zpHsBuOORPN5n5WQXAaViYKz3A
         ty/+9Pfdp2TNVDYMYM62m9jd1YomaTR1U8RjOP7X3GsAxBvV9RKRGSgtC7NZ7GfiFXF+
         yiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4uY/IgLVDHnuw95iJ51bZzDztDSkkEL9xwebZljPGWUe9LW8O2H2B6E5L9K72exzgExqxcv/F9idkyLoQ4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbfVr2rt1cnBTRASwt80nA9aJTtO8gLjhbRwazpCEA8I0Ny8WX
	5VIK1ljvlCI065CacPzKviUvTN4bFM2B9eJQZlljYw5M6CxAFpMdrf3H04dHUZwowvw7FQtSr6u
	F4Lu1QpwidQsTWDf7p2RiVfGC1d+6AX5H31kpaflXATwdKKR3OzGB7nC1lCyNV4Zcf8Jr
X-Gm-Gg: ASbGnctgXIZ0Esn69nGaRG2I0esaqvco2atBajMBiwLChTBAdifYWLSfjtSIYB0CqP0
	4IWAETJutwF9u3kbJfTUT4zGvKMVl0sdHx80j3hyInuT0YrRnf4FvCeI7GMUi3MujrkAD0o/Bu8
	OhxuDKErb1hLRt6B2UoyydjtbQKXpRVmnp+i0OPf34bMcwsC5dlTrsGTML9/s6e3YRSnNVbfBoC
	bDJcbaaoGsmXhPlfClihp+9/9iffLrgfn50+xHqzaPkTV9cG6sUmxjDb9UUw6nAH+RW29+zImzu
	rNg6jGm+7zZHscNufgj/ZYpccsGBoqo7HV12VvgrtIkwiut+LCFzYkFZRwBpW6fbaSn6kA9cKLM
	zSlnFkM+MPKyzcA==
X-Received: by 2002:ad4:5b83:0:b0:882:3ca2:f11f with SMTP id 6a1803df08f44-8846e03443fmr11097106d6.25.1763590760476;
        Wed, 19 Nov 2025 14:19:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQRDKmD0+59L+zDoLtDgwZTS1tpvNC87WX1cJ9AhOArAPTwORVd3gh8lQT/iBQwh8Q6EZBug==
X-Received: by 2002:ad4:5b83:0:b0:882:3ca2:f11f with SMTP id 6a1803df08f44-8846e03443fmr11096766d6.25.1763590760029;
        Wed, 19 Nov 2025 14:19:20 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:19 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Wed, 19 Nov 2025 17:19:07 -0500
Subject: [PATCH 3/8] rust: pci: add {enable,disable}_sriov(), to control
 SR-IOV capability
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251119-rust-pci-sriov-v1-3-883a94599a97@redhat.com>
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
X-Mimecast-MFC-PROC-ID: h9o468Ez64Gn-QW6cmRzPnIF8Pyxcy8mMp0uoLdo5IE_1763590761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add methods to enable and disable the Single Root I/O Virtualization
(SR-IOV) capability for a PCI device. The wrapped C methods take care
of validating whether the device is a Physical Function (PF), whether
SR-IOV is currently disabled (or enabled), and whether the number of
requested VFs does not exceed the total number of supported VFs.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 814990d386708fe2ac652ccaa674c10a6cf390cb..556a01ed9bc3b1300a3340a3d2383e08ceacbfe5 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -454,6 +454,36 @@ pub fn set_master(&self) {
         // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
         unsafe { bindings::pci_set_master(self.as_raw()) };
     }
+
+    /// Enable the Single Root I/O Virtualization (SR-IOV) capability for this device,
+    /// where `nr_virtfn` is number of Virtual Functions (VF) to enable.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_enable_sriov()` checks that the enable operation is valid:
+        // - the device is a Physical Function (PF),
+        // - SR-IOV is currently disabled, and
+        // - `nr_virtfn` does not exceed the total number of supported VFs.
+        let ret = unsafe { bindings::pci_enable_sriov(self.as_raw(), nr_virtfn) };
+        if ret != 0 {
+            return Err(crate::error::Error::from_errno(ret));
+        }
+        Ok(())
+    }
+
+    /// Disable the Single Root I/O Virtualization (SR-IOV) capability for this device.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn disable_sriov(&self) {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_disable_sriov()` checks that the disable operation is valid:
+        // - the device is a Physical Function (PF), and
+        // - SR-IOV is currently enabled.
+        unsafe { bindings::pci_disable_sriov(self.as_raw()) };
+    }
 }
 
 // SAFETY: `pci::Device` is a transparent wrapper of `struct pci_dev`.

-- 
2.51.1

