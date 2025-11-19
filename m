Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9882830DEAE
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590764; cv=none; b=BMl4rg2P2LkpxeUb2cUNICb7tnSwTeNOg5iDGKquGq8q6NxYrMcasXxtk+aDHG9Ty/SoTeRLF0bEu+l2QmFRbViNJhUVI0+K9MzzOb7Qiwnfidt04U7s6KWzRLVqUGY50pqNkfD65s0oDl9JdC+DuAeJ1p3PwnMNN+PKKS9V7qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590764; c=relaxed/simple;
	bh=MeAH/L9J30qCwqNdMB87QZq7p2/nxJ5qIpUSuF+RrHo=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=nC0P0eu0gYrU3K5xd09PSVcHXTrk/Px8W9i1wZo4QlnlEh7hpKpnIh4I7j59cBV3HhLyzHPOXHlPnkE0RnoLufU2XFQyZ50/YceeYZ+D7DK26YaUd623fWB85r4Y4Hghg+nRx2R7BhBYrJ+EUALL8hLLpa+zWWPyV3ARyzQuWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V4rD3ziv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V4rD3ziv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0Vb/20jTWy28ubGj9MV+Ibuanb4TZxQpwWcQXJ663I=;
	b=V4rD3zivI53Cc729kHFiesJk0mAPDbZwUc22SqgV5iMKwBS9lZE8q115sPT4ICjbURkMP5
	qaURNKaNww3XA+h8ll0wyrS5uZvg05EwK7QhusPKCFesV3Ij4zxLCarnuRrx/t4l0u09dz
	nPmWn7zKfeeU+S11GxREBQYk84oI+Nc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-H5p7TpCGNzmUtMRMEffTfA-1; Wed, 19 Nov 2025 17:19:18 -0500
X-MC-Unique: H5p7TpCGNzmUtMRMEffTfA-1
X-Mimecast-MFC-AGG-ID: H5p7TpCGNzmUtMRMEffTfA_1763590758
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8846cb0b8afso10803416d6.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590757; x=1764195557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X0Vb/20jTWy28ubGj9MV+Ibuanb4TZxQpwWcQXJ663I=;
        b=lBvtQJ0y/neL4231O7Tk2FYvzCmTmwwbK8WqwV7iIHCeUeeZOiDAZ/gMaJR0bQYzqq
         CSyDuy/IgRYyeaWyq8pHvGhz5qjBRWw7HgN8B8eB6EJrlRfXmlPHA01pFM6pDB2o0DKu
         p8vhnqI1nA5vHAFkMiCIKyNGtwzVxemVcs3Dc6TKQoKSjGI0CL82/J11UgY/3kQOw6Xm
         PfK0J/XvcxV2fFtD3hVTMay/tjDhz9ajSInzkTPMCZT3QOeCLhLexo4EgYs2SAjH781i
         WY5dswpzoRIALR0sxTnhQCKyLLN5t+27i4IzIlEfRUGXaM5oOnRNvRTJOTvzVyWgX3AP
         WYfA==
X-Forwarded-Encrypted: i=1; AJvYcCXCRuQtUmU3W2GnOeSKzHLQz1gSpValTY3WrarTwxewsLLTMEUZl07HBpWqg4YQjFeGwurKNP4+kedb3kNGhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYmE9aJTJiwPyF/W+HYHePRVRQmehEpk2pGRjruQpp1bXUXDNq
	A8+IuApfe7iy9WOFzzzCUAoI0Z90ZSAbdtu4AzbLaOytT7jAsSd850ckJe0/DFbi+6+zU3p7Z7s
	aun1GyUrQVwza4kJRejdBovEO6U9QqiPZL9xqVvG5CSp0t7ieCeUNP73G+FhKlyeDZEG9
X-Gm-Gg: ASbGnctLDo1IJ30nPYfb+hC97nim7Rr1AsE/GCWfxrJtNw4mL/lMfkUZ+GrtKimUTYW
	70pObhZNaLZTTG13FWsuJf9ryk45nawVEydkWr0ImuK41ktUjDGJFdmU6bEWrq27dIafZVhq+jg
	DVXQnhCKA5KadmBDde1c3tmxKTo4PoHr2+uaXMSnqooR7nKVVz6e3QpgVpE4xquvboS7Rb1TOHX
	kNXGWEngL4+QbNRVCKRIq2K1T32Q7Xu2cO7fzeWMUujaYOvH1CD5xpOzOQxfwD2RGijCiJKR0No
	0OUFFHIs2QndvSRU+Ag9gMWvR1H460GEssPTh3t3KtglJT7dTgdSgds2WDnCbO5jkdo8dvyKJNb
	Qnl/YK9QhycFYcA==
X-Received: by 2002:a05:6214:768:b0:78e:6354:b258 with SMTP id 6a1803df08f44-8846e055f2bmr12533256d6.15.1763590757410;
        Wed, 19 Nov 2025 14:19:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT94Xj7OzL6w7dHQO8Ye/Fmage53na9GJygM3mxuQHkkniYgbaAhhdRnQnnHNNrHgeJgJp7Q==
X-Received: by 2002:a05:6214:768:b0:78e:6354:b258 with SMTP id 6a1803df08f44-8846e055f2bmr12532836d6.15.1763590756867;
        Wed, 19 Nov 2025 14:19:16 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:16 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Wed, 19 Nov 2025 17:19:05 -0500
Subject: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251119-rust-pci-sriov-v1-1-883a94599a97@redhat.com>
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
X-Mimecast-MFC-PROC-ID: umjH0ZDEhL6tuAYWDXHforUklPOtnxEReuenKPGYhME_1763590758
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: John Hubbard <jhubbard@nvidia.com>

Add a method to check if a PCI device is a Virtual Function (VF) created
through Single Root I/O Virtualization (SR-IOV).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
This patch was originally part of the series "rust: pci: expose
is_virtfn() and reject VFs in nova-core" and modified as follows:
- Replace true -> `true` in doc comment.
- Shorten description and omit justification specific to nova-core.

Link: https://lore.kernel.org/rust-for-linux/20250930220759.288528-2-jhubbard@nvidia.com/
---
 rust/kernel/pci.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 82e128431f080fde78a06dc5c284ab12739e747e..c20b8daeb7aadbef9f6ecfc48c972436efac9a08 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -409,6 +409,12 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Virtual Function (VF).
+    pub fn is_virtfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_virtfn() != 0 }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.51.1

