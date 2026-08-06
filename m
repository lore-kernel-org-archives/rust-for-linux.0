Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16568381EBA
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002415; cv=none; b=IKZcyq6odtP/1WeMGJBuQ0IqUJ6f0X9mMSL6MZQ9l2Ziw5DQMuhTDBqfg5y4bQ1xOrIs27SHL5eZinqWUFrV2A+SbseVJxHDT2n91tk/pco0D/7SGXZvwo+dZ+j/ccylRbXIy0oearo2Kye8rzauvnh0+JaM9yoRBMCKnO1ALP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002415; c=relaxed/simple;
	bh=6HAzSHpgsk4thzZV85s9gSOIZZSMVAZ44XXT3FDiRL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HlbSagEEARMi1vndI4jEg3K7g4rqBmWY5suJIj853UoGwA3PGp6WxYOtRq7x0RELCC5a10jPwsqxOGj/H8WZ+77C2EW2m7YL1XcYWo/r+wS5WIre/gikR5qwUlSDD3OS92bkGD7zCpflgZEDRzrxgioCGvbDOwmLixjClB0vJrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEyl3ef5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEyl3ef5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1116348f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786002411; x=1786607211; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lE6JyKTSI6vd0outqfFXmkTwfpKlomoTyCU2FFqTLwM=;
        b=UEyl3ef5rbDLJYrAICX0E0uiixppjrutdBuITK7AuXcsSNcJ4ImNiBQ42gtOw9dyKJ
         +TshzSJAwh9k6LxSADkUMa54PdFj/n3ZLN/ycHIUCbvO5UYOwUTm5Q2UdWu7K1dloGID
         gLpYRXn1G346rF6CVJN7Ljw6RjKOuKP5pt1I0UHcidKrOLANE0+HwspX+Zxhm5RxHk7b
         MplURHeWBBxxxLIPnaRAh5iABbIpCT0QOBdmrn81O+H7GSpbM8BC/ak/qNZOP7nkbBR2
         ZCTVFd/06eJHRe+fZWg/CXy/qWR5/A4ESyf/nHeeD/785sp8oMLck5/mror/B1FA83Q9
         Eakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002411; x=1786607211;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lE6JyKTSI6vd0outqfFXmkTwfpKlomoTyCU2FFqTLwM=;
        b=RHWFhq8offC01zZQ2pRjXNGlZWxBv9uezgsMABPteMyZDd/3cdr/onUo2uifUuesR/
         aaAmEdIBCUaWtKCkaC7XJld+6WCHAWe34bT/o4u4tAhI33tQxICr3dp1I3QP3IXcvtyX
         H64OCh7gf9IEnj7iRB4JXLiy+cUuiHrZ/cchmq6lOscEjHZ+KbKrFXrd/e/4jf3tWLUp
         f6bfRNMVKuOAa8R2sCDEVxwsGCJejwLLw05Wd3ZcB2L/0rRQBO3lmSHWxdBT74cLMCv+
         csJLubiruOJsRNpl/XqNSVFZpdTnzFuUnv9uL/oKivZceQlXbwD1GHtLbPsSBlKtaFv7
         wwAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUTR9gZEsTYNZ2yoM8BKJrXc3S9+Ui79AetVkcHpztIRvG3Rg/nOl3/+/mMzx1vbILaxuD0u3BRQL7iMRDpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoT0y65LoHROnDg2OLLgGYs6ZKuZRGPDudqrQhAv9vqrzJN+NS
	sQQ0TcaUrwPyFZ3l9gLdmj6/VMfD7KA4ihhm9qYLgA3u3LmlyeBkMAwB
X-Gm-Gg: AR+sD10QIspAbm/v9ZrL01t38/vLg2XBNtvPXz4J+h7eagAx/MU0GXFmZlkLWzIP73s
	U4Msyjnl0JTGU7hT4wJxKpHA29wlZ0nUOVASI9i5IuRefKeMU3rNNWl9yN3/FZvfOUA6g7Z2a9t
	MKIsVOOBBxUtuSDMG8YZ775AKWKv4CQLS/ji2y58J01XU0y3gMenM+qVgkRlZoCrUrKlnqPZxUB
	7JLqdhuQVeGnGUaPtbqAPAtqdzIh32yK5Eg+iOsyH8QNgSMDAw27tOwWZXJ8ojRRTWt3wfsEBAI
	sWhS82zLlIM6898fBewyFXLGfSb9spLvS/WCzGpAoSmKPrXunX+ZrjV3elA2DzgsnIlu3mEfVLT
	UrIIFilxQDtioNb+jqOJzA5XEDwukFvTSt4PUzRuJifPvnTh+ZawABpcTJOaDCLVq/Uvrzp8rZI
	qWVhn1nYOAWlOHFeDEnuCRgnVQEXHCwyAN02khyIyd1knN+AwS48jhvDWiHeJkh+9WVPGce4qOo
	cyxzoLoeWlmvbBJ7Prd0AkMPPkSrpmLI4iotq/SyvaTmHaq7/vt55HU
X-Received: by 2002:a05:6000:40c9:b0:47f:93b4:2def with SMTP id ffacd0b85a97d-47fec63ebcdmr20292429f8f.28.1786002411036;
        Thu, 06 Aug 2026 00:46:51 -0700 (PDT)
Received: from valmpani.valmpani (cgn-195-14-217-60.nc.de. [195.14.217.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a71a2sm3841321f8f.6.2026.08.06.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:46:50 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Thu, 06 Aug 2026 09:46:14 +0200
Subject: [PATCH] rust: dma: add `Range` type
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-dma-v1-1-e8a39327c7f5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMU7dGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNT3ZTcRF3zZFNjY4OkxMSUJDMloMqCotS0zAqwKdGxtbUAaipBpVU
 AAAA=
X-Change-ID: 20260805-dma-7c5330baadb6
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786002409; l=9021;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=6HAzSHpgsk4thzZV85s9gSOIZZSMVAZ44XXT3FDiRL4=;
 b=Ih/f4+tFcg6Fj+sGhKoKUu6yS0WPAKdTe7R5cAmOE5hru18JzsavPJX+POJvKb3f5fAMT38gH
 d0xC0C/tNcjBA+WXMXhDsuOrNpfyNdnL7nf+Zd0y8ZM+UUoExSS4KIP
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

The base dma address of `Coherent` and `CoherentHandle` is a bare
`DmaAddress` integer so any arithmetic, a driver does on it is unchecked
and can potentially go past the end of the allocation or overflow.

Add a `dma::Range` type that couples a base `DmaAddress` with a length
and only hands out addresses and sub-ranges within `[start, start + len)`
with all arithmetics checked against both the length and the overflow of
of the underlying `dma_addr_t`. Let `Coherent` and `CoherentHandle`
provide the `Range` covering their allocation.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1248
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
This is one of my first rust-for-linux patches, so any suggestions are
extremely welcome. Some words about the decisions taken:

- I chose lengths offsets to be `DmaAddress` instead of usize since the
  bus space can be 64-bit on 32-bit CPUS.

- The constructor returns EOVERFLOW for `dma_addr_t` overflow, while
  out-of-bounds requests return EINVAL; happy to use a single error
  code if preferred.

- `dma_range()` is added to both `Coherent` and `CoherentHandle` so the
  type has users from the start. I could split it into a follow-up if
  that is preferred.

Tested with `make rustdoc`, `make rustfmtcheck`, `CLIPPY=1`, and the
KUnit doctests `rust_doctests_kernel`.
---
 rust/kernel/dma.rs | 174 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 200def84fb69e006bca0b1c578bac9f1dc8da708..e65e99ae4d915ac2e385df8b72fc518c07e4c82d 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -41,6 +41,142 @@
 /// Note that this may be `u64` even on 32-bit architectures.
 pub type DmaAddress = bindings::dma_addr_t;
 
+/// A range of DMA addresses.
+///
+/// Couples a base [`DmaAddress`] with the length in bytes of the region it belongs to,
+/// representing the half-open range `[start, start + len)` of DMA addresses.
+///
+/// Unlike a bare [`DmaAddress`], a [`Range`] only hands out addresses and sub-ranges that are
+/// guaranteed to lie within `[start, start + len)`; all arithmetic is checked against both the
+/// length of the range and overflow of the underlying [`DmaAddress`].
+///
+/// # Invariants
+///
+/// `start + len` does not overflow [`DmaAddress`].
+#[derive(Clone, Copy, Debug, PartialEq, Eq)]
+pub struct Range {
+    start: DmaAddress,
+    len: DmaAddress,
+}
+
+impl Range {
+    /// Creates a new [`Range`] of `len` bytes, starting at `start`.
+    ///
+    /// Returns [`EOVERFLOW`] if `start + len` overflows [`DmaAddress`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::dma::{DmaAddress, Range};
+    ///
+    /// let range = Range::new(0x1000, 0x200)?;
+    /// assert_eq!(range.start(), 0x1000);
+    /// assert_eq!(range.end(), 0x1200);
+    /// assert_eq!(range.len(), 0x200);
+    ///
+    /// assert!(Range::new(DmaAddress::MAX, 1).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub const fn new(start: DmaAddress, len: DmaAddress) -> Result<Self> {
+        if start.checked_add(len).is_none() {
+            return Err(EOVERFLOW);
+        }
+
+        // INVARIANT: We just checked that `start + len` does not overflow `DmaAddress`.
+        Ok(Self { start, len })
+    }
+
+    /// Returns the first address of the range.
+    #[inline]
+    pub const fn start(&self) -> DmaAddress {
+        self.start
+    }
+
+    /// Returns the first address after the end of the range.
+    #[inline]
+    pub const fn end(&self) -> DmaAddress {
+        // By the type invariant, `start + len` does not overflow `DmaAddress`.
+        self.start + self.len
+    }
+
+    /// Returns the length of the range in bytes.
+    #[inline]
+    pub const fn len(&self) -> DmaAddress {
+        self.len
+    }
+
+    /// Returns `true` if the range is empty.
+    #[inline]
+    pub const fn is_empty(&self) -> bool {
+        self.len == 0
+    }
+
+    /// Returns the address at `offset` bytes into the range.
+    ///
+    /// The returned address is guaranteed to lie within the range; returns [`EINVAL`] if `offset`
+    /// is not smaller than the length of the range.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::dma::Range;
+    ///
+    /// let range = Range::new(0x1000, 0x200)?;
+    ///
+    /// assert_eq!(range.address(0)?, 0x1000);
+    /// assert_eq!(range.address(0x1ff)?, 0x11ff);
+    /// assert!(range.address(0x200).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub const fn address(&self, offset: DmaAddress) -> Result<DmaAddress> {
+        if offset >= self.len {
+            return Err(EINVAL);
+        }
+
+        // By the type invariant, `start + offset < start + len` does not overflow `DmaAddress`.
+        Ok(self.start + offset)
+    }
+
+    /// Returns the sub-range of `len` bytes, starting `offset` bytes into the range.
+    ///
+    /// The returned range is guaranteed to lie within the range; returns [`EINVAL`] if
+    /// `offset + len` overflows [`DmaAddress`] or exceeds the length of the range.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::dma::Range;
+    ///
+    /// let range = Range::new(0x1000, 0x200)?;
+    ///
+    /// let sub = range.subrange(0x100, 0x80)?;
+    /// assert_eq!(sub.start(), 0x1100);
+    /// assert_eq!(sub.end(), 0x1180);
+    ///
+    /// assert!(range.subrange(0x100, 0x101).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub const fn subrange(&self, offset: DmaAddress, len: DmaAddress) -> Result<Self> {
+        let Some(end) = offset.checked_add(len) else {
+            return Err(EINVAL);
+        };
+
+        if end > self.len {
+            return Err(EINVAL);
+        }
+
+        // INVARIANT: `start + offset + len <= start + self.len`, which by the type invariant of
+        // `self` does not overflow `DmaAddress`.
+        Ok(Self {
+            start: self.start + offset,
+            len,
+        })
+    }
+}
+
 /// Trait to be implemented by DMA capable bus devices.
 ///
 /// The [`dma::Device`](Device) trait should be implemented by bus specific device representations,
@@ -626,6 +762,25 @@ pub fn dma_handle(&self) -> DmaAddress {
         self.dma_handle
     }
 
+    /// Returns the [`Range`] of DMA addresses covering this allocation.
+    ///
+    /// Unlike [`Self::dma_handle`], which hands out the base address as a bare integer, the
+    /// returned [`Range`] couples the base address with the size of the allocation, such that
+    /// any offset arithmetic performed on it is checked.
+    #[inline]
+    pub fn dma_range(&self) -> Range {
+        // INVARIANT: By the type invariants of `Self`, `dma_handle` is the DMA address base of an
+        // allocated region of `self.size()` bytes; the DMA API guarantees that a mapped region
+        // never wraps the DMA address space, hence `dma_handle + size` does not overflow
+        // `DmaAddress`.
+        Range {
+            start: self.dma_handle,
+            // CAST: `usize` always fits in `DmaAddress`, which is at least 32 bits wide and
+            // always 64 bits wide on 64-bit architectures.
+            len: self.size() as DmaAddress,
+        }
+    }
+
     /// Returns a reference to the data in the region.
     ///
     /// # Safety
@@ -1101,6 +1256,25 @@ pub fn dma_handle(&self) -> DmaAddress {
         self.dma_handle
     }
 
+    /// Returns the [`Range`] of DMA addresses covering this allocation.
+    ///
+    /// Unlike [`Self::dma_handle`], which hands out the base address as a bare integer, the
+    /// returned [`Range`] couples the base address with the size of the allocation, such that
+    /// any offset arithmetic performed on it is checked.
+    #[inline]
+    pub fn dma_range(&self) -> Range {
+        // INVARIANT: By the type invariants of `Self`, `dma_handle` is the DMA address base of an
+        // allocated region of `self.size` bytes; the DMA API guarantees that a mapped region
+        // never wraps the DMA address space, hence `dma_handle + size` does not overflow
+        // `DmaAddress`.
+        Range {
+            start: self.dma_handle,
+            // CAST: `usize` always fits in `DmaAddress`, which is at least 32 bits wide and
+            // always 64 bits wide on 64-bit architectures.
+            len: self.size as DmaAddress,
+        }
+    }
+
     /// Returns the size in bytes of this allocation.
     #[inline]
     pub fn size(&self) -> usize {

---
base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
change-id: 20260805-dma-7c5330baadb6

Best regards,
-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>

