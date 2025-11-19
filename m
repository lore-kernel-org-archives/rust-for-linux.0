Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757CE302CDC
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590763; cv=none; b=AU1Lo9gM7T98uXiYU5FhxjEeXIlLmYxv5FJHnHp+fYidQx7eeLSvvSJzvUzxDhZT8HSLee2huP/adyjOYWFrQiNMfbjmNTN9M9o/13sATE4gdQt6nHJHoLP+/Bc9xLDw0ZeJPV9PLdNuv+T2B87ThAPTXkutEv582vrDR2/dc6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590763; c=relaxed/simple;
	bh=72adYgtsLfbICwRUf51p19hvB2OaCp/Vs8bJEvAgYio=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=ntVi+pCZoOYMyp0C3Aq9Tpqax9CO2MoXqJ9Yx+MQiSJJbAF7WaydwUoKurbOLBg4Miba7FqjsoW96kUlxwgzLuQe/s79kfuchVO3tLzQ5qjFQ0CBueRtkh74ZOKNgVK1S96zhY66S9bk6HxCMb2VqgfWarCoGtkSfLNngJw4bo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtelLWxE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtelLWxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763590760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LT0/HQ7KAbR9mGXfO5hTKJsXPBMjCx5esqT8LbWmcms=;
	b=dtelLWxEZ/K5Hl9zMKc+7mG41QcM3TDpulrAEcf4QXLXL7xZlKiFx4kd+e2sVIBaZxvySl
	ufqYBa2WObWqHRUj2uIQimKKEXmw4msov7NZEsvBVS+rQCNYHv1PlxsU+L4MvUkuWkPqLQ
	lNDNG6KB54l6SnrMigkco+j92S2VPj4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-t-sZB1rkN6u23mZIkETGlg-1; Wed, 19 Nov 2025 17:19:19 -0500
X-MC-Unique: t-sZB1rkN6u23mZIkETGlg-1
X-Mimecast-MFC-AGG-ID: t-sZB1rkN6u23mZIkETGlg_1763590759
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88236279bd9so6842816d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 14:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590759; x=1764195559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LT0/HQ7KAbR9mGXfO5hTKJsXPBMjCx5esqT8LbWmcms=;
        b=jtwynZytQ1rjaDGhvsmM5BvegFlUUs+MRbv9TDTIi3Sd57ynp7wEDNxvYGsfd/ARbq
         lojTIh3WOgQXy3m1UJ04XABy1e+SY1mpHrqjwg4k7gPgdgyX92MrZoacU6E8XTAd2Jr9
         +gT5vYNzJRP2F+PQijdCgJoH/putlaD8gYdCPP3418AcUAxpizMbI9QueP5mmg6ofZD4
         gGs3VnYgqz9UuLN3JPEVhDnJ8Wl9wNgVxP0LKBFFfCnAbAR58s5AQqLEBEe0jgZUf985
         pi7FFdcuGk492Bn0FmMiFsLdIY4A28ufpddatJMpkJ5itVYY8xq+2zaSXLy5fM0yDP/W
         U8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAiPeAX6g9IIHK+y59vAG7p11yivaaR71nZ9T6GvMrtuEsQmEbGt+JE14I18aWLDIOK0yfwF3UWQiwLAvBaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+KStvTZht/6xbXwhyZt3H6gnWFRqwFc+dI+1UqaXnxWZqr9+C
	lvk0q84JKWSgogYWGay/XvvVx0wt+ZCMzTiiYSZXeNPf4LV3fh2B3YD9OGShkh/4dX9syg2EEy/
	kRDE2DKwqZv4Ge+poweUukjnisu216KI5GOIHIK0349pz4h7kYckaQBLi9OEwVtN4lIvi
X-Gm-Gg: ASbGncvNNlNKNQ01x046rT2xpWUHedTm97k/rmlpix25ys2KuIJoVKb+sSfG3EMRvhu
	t5zxBXvc6qZQTG/mTaUYuYV4Iqgb+BuLnZGtGjes3FaAt9NyTYSxCStoMykX0mMgDbf7XwspB7m
	5rAVYtzqJhWIGm5zWBvUs3IcDCyhrsCXwoUOFkK5cilIF2alDzDOZRELKAsO9tMQtDDkgIWN5mN
	UG4eEaTNrk7jdrEPObNZN/9Ee8PN4tXwAIRgB2HO/zjIYe1PV3xuLTMyIphx1Lbo4BR53doloSK
	pOUFSKTHhcQUQljz9/zEPo2BYd2cdYaX4KCf97KVIIjiC8c0JjO60oIe4uIAKjg4mWIFwRfKnwL
	K6AeEJb9bb1zC2w==
X-Received: by 2002:a05:6214:c25:b0:882:4be6:9ad2 with SMTP id 6a1803df08f44-8847013f7c7mr2682466d6.33.1763590758951;
        Wed, 19 Nov 2025 14:19:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeuLwFeoT9/1jmiPiEb5rUv7hwbM9DKqLBAekr9VTFnVBnyYQBFN13GwWwKi9JFRBVUiJJoA==
X-Received: by 2002:a05:6214:c25:b0:882:4be6:9ad2 with SMTP id 6a1803df08f44-8847013f7c7mr2681876d6.33.1763590758460;
        Wed, 19 Nov 2025 14:19:18 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b141:ac00:ca1:dc8c:d6d0:7e87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e447304sm4426866d6.4.2025.11.19.14.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 14:19:18 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Wed, 19 Nov 2025 17:19:06 -0500
Subject: [PATCH 2/8] rust: pci: add is_physfn(), to check for PFs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20251119-rust-pci-sriov-v1-2-883a94599a97@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -oIKSGzAXo_iroErDrrWAvq6B_btNVT81AW9clKYo6c_1763590759
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a method to check if a PCI device is a Physical Function (PF).

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index c20b8daeb7aadbef9f6ecfc48c972436efac9a08..814990d386708fe2ac652ccaa674c10a6cf390cb 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -409,6 +409,12 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Physical Function (VF).
+    pub fn is_physfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_physfn() != 0 }
+    }
+
     /// Returns `true` if this device is a Virtual Function (VF).
     pub fn is_virtfn(&self) -> bool {
         // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.

-- 
2.51.1

