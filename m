Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2258E32FA17
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325238; cv=none; b=q2csQzBd521swdeVfJRlSqGcwDGuXgEru4+MpsZb2Xv+qX9OjKRGNWF9YfOabUz2ekBFFYIv85DXdf4GAFeF2Ai+UOrsr3LG31pNyZEipYed4tzRfplPdtHK2DEQNcgaFSCxOetxEFcp3cRF9/LA5OCE+q/dByioyO92Ha8kL2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325238; c=relaxed/simple;
	bh=0n3HUB5a0dbq5Vp3zcn3fKughLCja0FW1cbYz+y6V0c=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=rE5v6FD6UnRWCexdWwh5slQJ9H6rzrE6gksQmGCNbZy7y+5Cw2fiQVidDoSqf8lH6KdoLBMi2xGWJm5+WxQboclsGQ0ivuZZKFx0yB16G2gjjtGT6WX84nNYckFI/acstlTeCW+XY9IWnPtVLkGwKuSd0NCtvFG6vvnj9ixMjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5Bnq9Zw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5Bnq9Zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gGPFCPOPX/fBbf5qQfZiwEzewT+3Ulk7LVkRWF8dEo=;
	b=S5Bnq9ZwrCaHAWjhsveZG8+FeBF8WPKG05djIc2YY5sjWU6PJ0DHkEWWaVjkacvJCpynza
	colUDhZgNV1Sk5epkD4tZQYrlGbgMatF1pFQHGAiwfNxm3ZFpsGLxkHFkuj/Bnsg5vyW12
	s01Crg7fOXDOmkXzS14aVhhxR3PUFtM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-hBHPqXMsO-6W121YNHkkVg-1; Thu, 05 Feb 2026 16:00:36 -0500
X-MC-Unique: hBHPqXMsO-6W121YNHkkVg-1
X-Mimecast-MFC-AGG-ID: hBHPqXMsO-6W121YNHkkVg_1770325236
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so399889685a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325236; x=1770930036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2gGPFCPOPX/fBbf5qQfZiwEzewT+3Ulk7LVkRWF8dEo=;
        b=r/odKlcmADe0osTzVgyDDlbVjgQEVnlN5zwjkcD5fbIRYxaQTkHE4f4tYm6p5YY/bx
         9qKRcac21heTF5M261/Tq7AgGIsEC5VCrwd8+ZxOehK/zaOvZtGXKkQK+MVzxDiPqi/5
         PFQAcLg4rxUHyqf9b1MXaiL36kWqSH9lxPumSiJwsZGZBzDET7VVDifOhRt2tnbY0VVM
         a8k3qBr9F1M1LIiq4xpiIiAhRKHRmESyqsg3i7ORSz+iKajuAZichlX6ias+eE/uupiF
         neS69AFjYy83nvw1vDzb4nVXfJIjp1JN38T0arJvVuoqicD2+Djc715x05uCQurGx5bi
         Nc7g==
X-Forwarded-Encrypted: i=1; AJvYcCXvi9OvNBHZyTrL98SaWFuvMwOKphc+IUHBTvvtq76LzVbIAwvs1fIapiDTLDnUdtPGFNp1GrnnH8DGxmFmoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzbQwv0kIpW3W3czMj64SqnierVrAmcJ03ZRAkPErBIizVrcHA
	GfGG5AezDJGldVPrVQxsVdVWoqCfG9XjUzz3Y24EGFfATJbJ68RfI80a4LS34FNbt2rXD2IFhrP
	6xPYN106OuD4oSivt7LVTXRI/QCC8cV+3lWhtPG5jKTujoHK0Ld7dE4UxGLwu5taZNPhQ
X-Gm-Gg: AZuq6aJrX7UqyIca+Hg/SXrskCE2DuxLm8Ah1mP97Tk/4ZMqgN6CEsMaWU5BME8d/Ck
	CmKp3sBVYZfAlMTWsp/k4B9TrE8XQooBPH7t4CFNZlZfnVH3V2ZmsIT9EcWBCaMaJ+UTO5aGZEJ
	R9VHdUECTjyGsi0zFrAKFM0XqSTFuIrWgXvSyAprE5Asv9QiVBMEPPh9yJKd1z9E9lh0zunGaUL
	acc9DPpIdPqf+x9E6yf5hZB8Zo+slcl4yyE2UAq/GuLHjXTydgxfUZtDfhov8uZpkMcekNSW06W
	S8j/dpTEz0uguV+dunIgAL7GJC6DavQ4NTozjkbjjCHCnVEGkMRgvXCzx17uUxQD/B/qHszI5in
	C6vdIN2Qbs7ykthM=
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr61791285a.67.1770325235658;
        Thu, 05 Feb 2026 13:00:35 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr61780085a.67.1770325234922;
        Thu, 05 Feb 2026 13:00:34 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:34 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:54 -0500
Subject: [PATCH v2 07/10] rust: pci: add is_physfn(), to check for PFs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-7-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: WzSYf876p6Ulcp6kVVMq7pbOax-ov9Le_KmEA_PCBac_1770325236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a method to check if a PCI device is a Physical Function (PF).

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Replace VF -> PF in doc comment of is_physfn().
- Add #[inline] to is_physfn().
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index db05641186c3a42922e2b6a463de9c1b099a4673..df39ad3f0d5fd898b034609efb03368f83c2a2e9 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -484,6 +484,13 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Physical Function (PF).
+    #[inline]
+    pub fn is_physfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_physfn() != 0 }
+    }
+
     /// Returns `true` if this device is a Virtual Function (VF).
     #[inline]
     pub fn is_virtfn(&self) -> bool {

-- 
2.52.0

