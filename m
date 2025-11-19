Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080EB30B526
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590767; cv=none; b=dDO3UUXKhbNU30Wb4Mn/iKf9hwY/CWQ+2MRq3fc/7nCUTfh8EUjLB+oylmLjokPlYmMoCyCEm36mZW2ImZF2Ha5Q87fkd2I41y7pp5dp+Emba/eCnvqXD/VNWTfIgCgy5k0t4Pxq4xjb1MWzENH4l1+O0kSfjMg0mqY4GaSSKqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590767; c=relaxed/simple;
	bh=bzTncOXNg0kWII0nt+8w8axDxjNbZrgM9o9apzDdqZw=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=f9xOS+aPWcr9wl9k/VL3mrx9dnsJBzpsuHZEaeKyUKlGB2+kYKA/1K+LhoP/xV5K3X7Sj9O+etqJn5xAigkA2b7BgrncimCGErdFSv/jQMFtX39Vx2QE8dMKGqEgnTKCl5SGYtkmZNvZG8HTlb/jc0HGVo6cH8RbzGM5MUfjmEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bm6X10rS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bm6X10rS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Sa/28IBowGRnEwfZcsKNnT8Zyd6t02o7EkUf+OoZOM=;
	b=bm6X10rSRMcjyux2TYO3yhtWQH5fCA6JcANpU+ZKSXcLaq4EKmBokwh+eapj7A8o2pyIq/
	HLs5SypKhf9lucsNNtJOrQivNeMIt59RX3mGCIc5SKQOU0H5LbnBXhPNJU4sznsm+qWZkP
	4KpMe6iGOQdkcQdC2VPJkXtvG2RUcWY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-bNtPiyONOmSMQzalMU1QjA-1; Wed, 19 Nov 2025 17:19:22 -0500
X-MC-Unique: bNtPiyONOmSMQzalMU1QjA-1
X-Mimecast-MFC-AGG-ID: bNtPiyONOmSMQzalMU1QjA_1763590762
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed82af96faso6555641cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590762; x=1764195562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Sa/28IBowGRnEwfZcsKNnT8Zyd6t02o7EkUf+OoZOM=;
        b=De/uJf/4JNsMFwWcyWDk+yZhZZKQNEIpNlcbdw2DbY4if3eOQhbi7ChdsK2gj6tZ5X
         LvGhr7qz3AdeUEQEim8DVpmUFvHEDb0RCnTlXfMEsvwZQqum7z17KHxTEtDoZi/75y6C
         oMy0yQqh1y20X9c3zFuwcTHY7AmeGgCMcoUKm9Cymbn0taXP0d5dcTnBUpaTsT0Qtbmk
         yX9nrOhZUoQDNm0XTddHc4pUUkRj/xjp++8NOOOYNOhu0h26WStFV1ehqAj5X+7RXMoE
         37JQVk5iFfFyFO53inlHoRLtuEakRCeqoXJLeNE2GhNKyb2DGBhR0Im3tookNLA9m6GK
         2SQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA+IQqc+h3yQWZYWcgEaDxTzEg2em4IzvBX7TXul9hyhTFoo447Tf/bimp6Bfkog6DrBl5e0tNLNLHO4stuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbAoGXtcZSu+84eFZjBdpqdWAP6U1kI8WVn3Je18VACafiQs2D
	E2qkHLk2aq0QVjFzUz1L6AFG/3KDfrLOL8Env9yUksYfProDc1zHjZ/hG5HvwOd82XgqGfiWprz
	uZo1+bmA5SNQ63XxBuQuXXCW3txPAH/A0LDf13vGNYyUn3ldrvn6IOvC3Cvft1cyUpSDa
X-Gm-Gg: ASbGncsgXEilmw3QuIxrIqeDUuFqN28AsojvT3PuiLzcpYf2TCy1kWfWXQDbhN7ugYP
	XZqmwMkfjXl0+cwTKWZm5Od3j7LL+NrySvjya67gYtrAMF+lWlHivFfgNy15KnfNAR82igyUxT4
	JlxLtBhnl4/TACWA2Ot1P+B6s5YP0L5oirO8bfyX1HExlN01DyB+Vi9ex98lfFSpxFvfntazgZb
	uch7gGPOcs4IcVuqI331zWUjIYgRLPuQq/ZSY9BdazLlxaNFpmhwb7pEbPLsfLAl8n2k1A7aHlc
	9ydfuA/eXADyun/OWiYPyB4SGGrHiIo5ocA4A5L43LybRb7cnxMPRJLidT17Jy9b0uuSwiHGjTr
	kDKR+10bAFFt3zw==
X-Received: by 2002:ac8:5d4c:0:b0:4ee:1907:13ed with SMTP id d75a77b69052e-4ee49705856mr10977671cf.51.1763590762148;
        Wed, 19 Nov 2025 14:19:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvp/HJwXtKnotpgRtr6UAvyPlB/fAc4k6E1PSgQwkx0nIFctwGmjJxEpRk1C5rFdIJc7Go6w==
X-Received: by 2002:ac8:5d4c:0:b0:4ee:1907:13ed with SMTP id d75a77b69052e-4ee49705856mr10977141cf.51.1763590761534;
        Wed, 19 Nov 2025 14:19:21 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:21 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Wed, 19 Nov 2025 17:19:08 -0500
Subject: [PATCH 4/8] rust: pci: add num_vf(), to return number of VFs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251119-rust-pci-sriov-v1-4-883a94599a97@redhat.com>
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
X-Mimecast-MFC-PROC-ID: F5TuRcTz3PhcBC-fgdjZRj4G3kQTVVRNnSqySTQnRKk_1763590762
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a method to return the number of Virtual Functions (VF) enabled for
a Physical Function (PF).

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 556a01ed9bc3b1300a3340a3d2383e08ceacbfe5..edb2bd41c8a14c8cfc421b26cda4dc84f75b546d 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -421,6 +421,13 @@ pub fn is_virtfn(&self) -> bool {
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
+    /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn num_vf(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { bindings::pci_num_vf(self.as_raw()) }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.51.1

