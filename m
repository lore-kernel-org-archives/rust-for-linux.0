Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4431E0DD8
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 05:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760850012; cv=none; b=icBSsAJbRLp8tcGQoYZ9pN3V/bY2UeJBa+KWY14fV/KOm4DDI4SUZrDcAKhParCBATRLuPjIEREVyci+/I0lZqMzqioy4TszvTpGn6jW+cuNc0bIhJHwl3R6hyTE3AdNMacfQsMG4i6enzLlPovIlKgrOEhPPSPdSEGhX0bMxJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760850012; c=relaxed/simple;
	bh=o1PUC2wc1mAokO+mTBqq622zLzBZ0C7jG04WPD4ze+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=qBdGQBjtGRv0uEUqZIHcfpdFDGbOTgY1T5FsyP00EM6+64pyN2wvRzhUBGAo9uvRyP2A4LaVnaqd14hCMhGlBMTDQNmVBbaOoioFrJJq/GxXe6QmqYbYGySchV1+yRxzgyKS+nDbE4PAm99CG7XsW0a/K8rkN3hPrHMHoWaNlT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpyK48FQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpyK48FQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760850009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6j42bXIK7vhHm/hVQ0KPPWv9prcOGiEtMxLoqJlyhY=;
	b=YpyK48FQFqhG0qXsW2ByzFk0g22SgfnkqoIsbvuYuJHlgcbg3BpVW/1uu1wB8IYOGNJZl9
	u/11cezkUXbsbId11PddOOAGc9UCIzc14ogqnS/W00YoVOZIf7ZXy9roupG1T6l2cWY2Y9
	+rRM6FEGjmH5JBRJjx61X1Q+vEcauRA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-8kVvLqm3Pbumr4vzLlIqGw-1; Sun, 19 Oct 2025 01:00:06 -0400
X-MC-Unique: 8kVvLqm3Pbumr4vzLlIqGw-1
X-Mimecast-MFC-AGG-ID: 8kVvLqm3Pbumr4vzLlIqGw_1760850006
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c20035ad3so91638126d6.1
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Oct 2025 22:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760850006; x=1761454806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6j42bXIK7vhHm/hVQ0KPPWv9prcOGiEtMxLoqJlyhY=;
        b=E4IVqQzEk0e6VP2ICE46pNM+hwNXtDCmN+NQgE9ozgsnirUGGQ4Bp24WGLgWUna/Up
         vBF1m4Z0hSLw6ZAApR4n6C/fuvGmnKtG7LNpsY6s/Vr1DzCmqc/FrmizSxMrW1vkZg66
         hN1Q6SPcsKBdaqQRTs2UWRyGns+60msDL/g0TwveJ2ejxjJV3lmk/0JFowaBcqymVVka
         kAro6X+b6SH/gcNxQbNWTYrUx+orJT1wp2xqytYYNxv8jJBCm/Udes7zIT3UBLRgKIE5
         4s2NtJZn44lZHhDc3FrzRJx20+ka23kDAFEooNHXmxp/rVSMadj0oCogQyVBNL1K5nOQ
         h6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFe1F2MEsfU37EPmlAZ2y9WIyQzi4Hd6gLccnl22sUEcn4YfyBsZTOKn9oTjOutc1J2WgfLW54WLXfVYeJyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxykKXog88hN67+ejKAqfFDO5oXs9KCfJzwU2tZLjSr89IJ5bPa
	tLQqHdsR0EEhILgEHsJEPWTVcyOQjL6cZrHRQYPvl2uULeSs/LOpZutTq3E2U3PFnOr/q8si9m9
	Rl1yIdD074UsyR3xf3/m8rqpSAAAUCGZW+HdQ6c0tr6l17vCd09Yxf1GvvteG1tuxqPOF
X-Gm-Gg: ASbGncsNldAsmtunJjGWPFNjs3TnUcgtr9Wo0blDGpYPcWPgGyMlulahogxmDuyGC4u
	j+P++tA9lP+ofjCWQh20+D8mxBSZZryG0OOtfYWxdQ8hxzMOOyancsvc6jiYbEa59U2NOhFTI06
	IQL3PtnJ36k9we/eEH3JAKblbzAVp+82IwOagdp5wbrb6mhPJDCNnHoZvXT926hVdlB788VAe4m
	aMlnUty1UUYPMahUcFjQ0fy645ZFzWM4vwEaVoATqtiCnRs24AYuI/cAxsZimzw+QwQg2144+cj
	iqFJF31gaqR4z2VLaIkbn9Bvr1CN+b9OcesZAP695o93Q1BO3gQcTxxFTbvEMiyqzxfVB45X5B9
	1Yb+XsOhmNt4Y
X-Received: by 2002:a05:6214:1c4e:b0:70f:b03d:2e85 with SMTP id 6a1803df08f44-87c202ca12cmr129730656d6.24.1760850005648;
        Sat, 18 Oct 2025 22:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5wLeuxoiCHUZOMNbVk/R58So9DiHQPQPxCkQ0dtuezAPPgfbIhF/Hy0u9hiLd/d1yjKIlOQ==
X-Received: by 2002:a05:6214:1c4e:b0:70f:b03d:2e85 with SMTP id 6a1803df08f44-87c202ca12cmr129730306d6.24.1760850005241;
        Sat, 18 Oct 2025 22:00:05 -0700 (PDT)
Received: from mira.orion.internal ([2607:f2c0:b0fc:be00:3640:bdf5:7a8:2136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028ad781sm27154396d6.49.2025.10.18.22.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 22:00:04 -0700 (PDT)
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
Subject: [PATCH 1/2] rust: pci: refer to legacy as INTx interrupts
Date: Sun, 19 Oct 2025 04:56:19 +0000
Message-ID: <20251019045620.2080-2-pcolberg@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 2vksayJS3MctnLKc1fk0IL4hPPOT8AWWaTwA8fD-KXc_1760850006
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Consistently use INTx, as in the description of IrqType::Intx, to refer
to the four legacy PCI interrupts, INTA#, INTB#, INTC#, and INTD#.

Link: https://lore.kernel.org/rust-for-linux/20251015230209.GA960343@bhelgaas/
Link: https://github.com/Rust-for-Linux/linux/issues/1196
Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index d91ec9f008ae..18f9b92a745e 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -56,7 +56,7 @@ const fn as_raw(self) -> u32 {
 pub struct IrqTypes(u32);
 
 impl IrqTypes {
-    /// Create a set containing all IRQ types (MSI-X, MSI, and Legacy).
+    /// Create a set containing all IRQ types (MSI-X, MSI, and INTx).
     pub const fn all() -> Self {
         Self(bindings::PCI_IRQ_ALL_TYPES)
     }
@@ -66,7 +66,7 @@ pub const fn all() -> Self {
     /// # Examples
     ///
     /// ```ignore
-    /// // Create a set with only MSI and MSI-X (no legacy interrupts).
+    /// // Create a set with only MSI and MSI-X (no INTx interrupts).
     /// let msi_only = IrqTypes::default()
     ///     .with(IrqType::Msi)
     ///     .with(IrqType::MsiX);
@@ -722,9 +722,9 @@ pub fn request_threaded_irq<'a, T: crate::irq::ThreadedHandler + 'static>(
     /// Allocate IRQ vectors for this PCI device with automatic cleanup.
     ///
     /// Allocates between `min_vecs` and `max_vecs` interrupt vectors for the device.
-    /// The allocation will use MSI-X, MSI, or legacy interrupts based on the `irq_types`
+    /// The allocation will use MSI-X, MSI, or INTx interrupts based on the `irq_types`
     /// parameter and hardware capabilities. When multiple types are specified, the kernel
-    /// will try them in order of preference: MSI-X first, then MSI, then legacy interrupts.
+    /// will try them in order of preference: MSI-X first, then MSI, then INTx interrupts.
     ///
     /// The allocated vectors are automatically freed when the device is unbound, using the
     /// devres (device resource management) system.
@@ -748,7 +748,7 @@ pub fn request_threaded_irq<'a, T: crate::irq::ThreadedHandler + 'static>(
     /// // Allocate using any available interrupt type in the order mentioned above.
     /// let vectors = dev.alloc_irq_vectors(1, 32, pci::IrqTypes::all())?;
     ///
-    /// // Allocate MSI or MSI-X only (no legacy interrupts).
+    /// // Allocate MSI or MSI-X only (no INTx interrupts).
     /// let msi_only = pci::IrqTypes::default()
     ///     .with(pci::IrqType::Msi)
     ///     .with(pci::IrqType::MsiX);
-- 
2.51.0

