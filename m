Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D621257F
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 05:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760850013; cv=none; b=mJqC0Qrkzcz62KaZQxjje5qrLA3BywlDeS0vMVt3oR+znFswNkkD4Q/do6Zjmxg7vvA01acqdvYKubOarvGQ/KKt68xzm3ASRxRBAiy65dmYm1Tup7kuM0y+IxPMKfApHFNUh7nlf2tilWmJq3jCjOPS0VNQiDnO3QzvgaCqKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760850013; c=relaxed/simple;
	bh=YUyYgzYm9tbG09HLL/WAwoU4M99Mv0yjyKmgERRoNjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Jcmrzax+SUGwVPrki1VPrypgoPbt/pKx+CZau0vwPV4dwXMjk4zE3uZcjOMqIQfzSDDPo8LbjOiL4xRDU6kkP5FaHZ7mkU7PVvKc0KPuPLjVwyBb6Blb9YFunxM1rTG1vyTvdvJ9pfRg1KCCCm+wNjdsIjSFpxMEmDlY0P2hM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YOcRE99E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YOcRE99E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760850010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQXW79VD1VDqu9OOdSqXUG39KL0/s9L9/QkyIlNgoV0=;
	b=YOcRE99E1jCdu37Kc9l38d3LJFx5GjKYK2CiQa1ruQYxgM4Hc4lIHXW3WCM2LIMRiixE7J
	YCko5Ds4MMG2ocOlRsBEfcMsfU/zCkrIY1BAWtVjxg1rvLLSvCIEhQaJp+kH1ZOeJlbcxs
	Dzz9GwAUS92GwLeoLCLtGfMRqlPiz40=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-I33TwbypONSt7GhGY7qWPg-1; Sun, 19 Oct 2025 01:00:09 -0400
X-MC-Unique: I33TwbypONSt7GhGY7qWPg-1
X-Mimecast-MFC-AGG-ID: I33TwbypONSt7GhGY7qWPg_1760850008
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-797ab35807eso148541846d6.1
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Oct 2025 22:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760850008; x=1761454808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQXW79VD1VDqu9OOdSqXUG39KL0/s9L9/QkyIlNgoV0=;
        b=cQRYLqwJzJvvc4+oxwCbF0xecHO+iauQHp1AQuQF4ikUnUBleIl/myrL3MBH9GWctT
         nYzJJVLOuVWEQDP1UTNOPwd4sedCc7fDG/SxzFQBWPLEfYUNUhXFZarWQVnHTrKeMXYV
         WxS1AGuVFUn8QW5RQpztj3zjy4r1l1iJiZuFpatyq2U8ufZa/BvOvjE4ZM6DrCTWunvW
         OStYW1bqaixFhC8mfTDSVOAdfH2WCQbJLUVym065ozR+8q0sTxJjBsSMJXTAOPFR0UC9
         m+gQlewmUZuIPQlqpjxASD4eLyF3MDDc98F2EDEvmMS/Y97xFDkJ14l3tmakANdcC6uE
         B54w==
X-Forwarded-Encrypted: i=1; AJvYcCV6ungF4udTSLQdELu4//0YxZI5yVzYQ2xG07mZ0pUUCu3nPVn8mophgZjN8FFOP7ehiqnWpT6cMmbVMzDSfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCUVXCPNSmG928jG3M81SdF8B55UUjj9ylYFsE9TuIEOY2yHzs
	b9RUATKrP8t8I0ACIq33be5waMejjkirpQJKRtRPhUSTNddhV8IjCC/sVVJLLJoDIWfDp+3gp0f
	X4jP6XE9YiPVtIjIQEBHkHve/QZLW5MdD9vgeJqo1pVX3f3Ps6qhYZASF4RdcPawyf3GO
X-Gm-Gg: ASbGncuL9noFsn/tC0u2iu2F9Y9MOEJvYHSqoFYPz0z9aGNus6CEskAZeausnUZI/+G
	fllVkx0PikKIaTbc/Kb4ti1Q2kX7/PQFGG+e8vlko6bff7SRLYjWG7yYdSUpnZluOmZASDyiYQ1
	Z9SIW5HwG56OxHrxe2CR+H6fwFTbr0FgeneNziDRX6kuLHNYpdUyX+872Apu0EubQCn1UMUvYBW
	2kN0drAO+SgQhTny9HLBYvMlfQgd4MvjjnaoLR4ufDRy+6YsyvIUJL4/fLPzg5o2n933IcP9CN1
	oqFccIxPH2vEJhnKRfknWbP30vWNivzfxkX2396N+TX8FvFjsLMZ012XHTbaYX81Dm3qU/6OXcS
	0mFI+RaoDiCcA
X-Received: by 2002:ac8:5ad0:0:b0:4e8:aee7:c559 with SMTP id d75a77b69052e-4e8aee7c85cmr47240251cf.31.1760850008582;
        Sat, 18 Oct 2025 22:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2GCOUQgg388o06Q5JSqBle/dvEc3Un/4442RGMFaboTta85NJv6+LnGnnuvBC07NDv3meCA==
X-Received: by 2002:ac8:5ad0:0:b0:4e8:aee7:c559 with SMTP id d75a77b69052e-4e8aee7c85cmr47240031cf.31.1760850008184;
        Sat, 18 Oct 2025 22:00:08 -0700 (PDT)
Received: from mira.orion.internal ([2607:f2c0:b0fc:be00:3640:bdf5:7a8:2136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028ad781sm27154396d6.49.2025.10.18.22.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 22:00:07 -0700 (PDT)
From: Peter Colberg <pcolberg@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Colberg <pcolberg@redhat.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 2/2] rust: pci: normalise spelling of PCI BAR
Date: Sun, 19 Oct 2025 04:56:20 +0000
Message-ID: <20251019045620.2080-3-pcolberg@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019045620.2080-1-pcolberg@redhat.com>
References: <20251019045620.2080-1-pcolberg@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hEihBYdM-F3F8Zcy1D2vJtjsEGYilScvXfcSfKoWCZY_1760850008
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Consistently refer to PCI base address register as PCI BAR.
Fix spelling mistake "Mapps" -> "Maps".

Link: https://lore.kernel.org/rust-for-linux/20251015225827.GA960157@bhelgaas/
Link: https://github.com/Rust-for-Linux/linux/issues/1196
Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 18f9b92a745e..747a0487d1e5 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -363,7 +363,7 @@ pub struct Device<Ctx: device::DeviceContext = device::Normal>(
 /// # Invariants
 ///
 /// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
-/// memory mapped PCI bar and its size.
+/// memory mapped PCI BAR and its size.
 pub struct Bar<const SIZE: usize = 0> {
     pdev: ARef<Device>,
     io: IoRaw<SIZE>,
@@ -423,7 +423,7 @@ fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
 
     /// # Safety
     ///
-    /// `ioptr` must be a valid pointer to the memory mapped PCI bar number `num`.
+    /// `ioptr` must be a valid pointer to the memory mapped PCI BAR number `num`.
     unsafe fn do_release(pdev: &Device, ioptr: usize, num: i32) {
         // SAFETY:
         // `pdev` is valid by the invariants of `Device`.
@@ -537,7 +537,7 @@ pub fn subsystem_device_id(&self) -> u16 {
         unsafe { (*self.as_raw()).subsystem_device }
     }
 
-    /// Returns the start of the given PCI bar resource.
+    /// Returns the start of the given PCI BAR resource.
     pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {
             return Err(EINVAL);
@@ -549,7 +549,7 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
-    /// Returns the size of the given PCI bar resource.
+    /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {
             return Err(EINVAL);
@@ -656,7 +656,7 @@ fn drop(&mut self) {
 }
 
 impl Device<device::Bound> {
-    /// Mapps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
+    /// Maps an entire PCI BAR after performing a region-request on it. I/O operation bound checks
     /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
     pub fn iomap_region_sized<'a, const SIZE: usize>(
         &'a self,
@@ -666,7 +666,7 @@ pub fn iomap_region_sized<'a, const SIZE: usize>(
         Devres::new(self.as_ref(), Bar::<SIZE>::new(self, bar, name))
     }
 
-    /// Mapps an entire PCI-BAR after performing a region-request on it.
+    /// Maps an entire PCI BAR after performing a region-request on it.
     pub fn iomap_region<'a>(
         &'a self,
         bar: u32,
-- 
2.51.0

