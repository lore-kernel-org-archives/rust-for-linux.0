Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC5F335063
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325241; cv=none; b=bFi2AD9KJ3Nm409RNYNCznM2B9TYRQkus7dM/C5qJkFaTNvFSmVragXVcP0tXuf+zNXa1t/IigeTELbk4Z+YOhnkJ7g5/UvUXNjZkUNK+XnYTuT8QF+o1+OpYI8lblKhuHLbs9ZcnR1b8WEDHfplIkYO0qDUc5D5oytCSzFyRxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325241; c=relaxed/simple;
	bh=zYEg72eTegIm4aBsUkMl8q2KG4rMnFZIPR9seQA5Ej8=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=OAJuHCQ7+UXHZvFt1bKFy4jPbywQfsKgl+y1MvdGFFzTzQQ8caeVqzPiWhY/7+p8XyBvg10DFLHK98otpKmxF4O7rBhboAwdkPPypqMy09L3b8gqWKYKw4Wngh3VWPN4gkfShQ+qbEQ4+x2+37CC6XdIE0BnD2cokf0LdD/Su0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gfvdjlNX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gfvdjlNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
	b=gfvdjlNXLyYqwvQ1GxBILsJ26obKSZldv+dBuFw6geYhbv6zplUKvhNNEpliTsKM4RpOch
	1m0BiK0GIvbod7GMQ6VjW4ckC1joBtoI8ask6nH0ZCUm3VqPm00jkWKxNlxcCgsWomAnrB
	rgImUSTvSnEqPlIahgl6UzncAZ7G9Js=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-aiBD_23XM9qwE-CbcNRiXw-1; Thu, 05 Feb 2026 16:00:38 -0500
X-MC-Unique: aiBD_23XM9qwE-CbcNRiXw-1
X-Mimecast-MFC-AGG-ID: aiBD_23XM9qwE-CbcNRiXw_1770325238
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ae763d03so172540185a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325238; x=1770930038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
        b=lbzAtcgqJrtliJ/HhPhM6YTrMzZMDzt/DBk9sItOdn/hmfBmVY5g4gH5GQJw1cz/lX
         x/YgiUoaRq6olF510CTPXTQfnW6S16xtJeXCogmkTWzfAz2rUO8LaV94ZZttvCQA/B3A
         Zz+5TwX17VVNtdZ7WQmSdqOEu3w6DyeIEbQ0kgLej5S66WY29OtBmkvW7Flg+LBrWmuj
         vbxHTCca38yWtwwBQ6ujsvMZpNiOipA1pDiH8XdDwEw8UX/mN6TVG4bfssRGm8k9lTmg
         1TEF+t7eQ4jevZuxArJYkkVsoKb+BcbfLj6jyTQ4UpK39HJ0YRt6YIdWGKz0UlDtEL6O
         X/YA==
X-Forwarded-Encrypted: i=1; AJvYcCXkPiPYFlFd3kwiaxN5bqfUzTrnP4CBUqOc9TvXWtannWsF0HTn78iajBLaYX3ofDFqq3FXy5pjPS58S8DELA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2sek5QqJL98vFadYwPHKtKAPkojauNnbx2z/BoXnwPMPI+At2
	sRTcryHDml73VFryLnRLCMGMnZF99ExEIX8j67WgR9+7qha67aOa769XTDuss3feKbWqJ3mjU7n
	30LrGDpSHKhtQ+AkRCgzzdpZbFQ/DmpQX9NvjiB/Ee3aUDlG/QrIugOuxwi0YKeYCzFBI
X-Gm-Gg: AZuq6aI4egq9sbMej1j0gaAA5GKLQpOir/kze3buyX5iau7CmQClHboGWdBgMu1+rMj
	on1tb9ybBPDe8EEikyVTGtOeFqFW43lojNFgKcieHcUX7VimwyfJu4KeaoyoWcjE4RVc1L1AN8r
	taguy9JYDGppm3843VGppTbAPVfqB+1AWBzxrkP1WAINWba4Ayh3yUot1gqLeXWthI6kst55mIE
	RNot5TT60wzhEk+y4LRdkJ/n30wEZp86qNuXoKKr+6bzagSNYiGF1a3ATmEH5jdEVcbEUu606l9
	rfm1ewWWro9jXqSKK+vSm/jCn7MCSIRI78wQthqVthrdB2tjaMh97sLnjG+y09ARbQ2jYUWFmKV
	TufVqbWMhhCkJYlQ=
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id af79cd13be357-8caeeb50f3emr72339285a.11.1770325237576;
        Thu, 05 Feb 2026 13:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id af79cd13be357-8caeeb50f3emr72328985a.11.1770325236916;
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:55 -0500
Subject: [PATCH v2 08/10] rust: pci: add num_vf(), to return number of VFs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-8-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -xH4-yw7QpCNTN1uwS6wCg8NEdRFu9BUHXvNDa_ScbM_1770325238
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
index df39ad3f0d5fd898b034609efb03368f83c2a2e9..581930d0afe98ccc29d729e4d9aab75b4144e46c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -498,6 +498,13 @@ pub fn is_virtfn(&self) -> bool {
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
2.52.0

