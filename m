Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C005F26A1AF;
	Fri, 23 Jan 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191160; cv=none; b=dBbhV0IRNol7KdrLDG9Gtxvmtn1lyPTAwh67AF4KBWePXoTdXU2ecn8JZhYgj/kUapsBAMaMV1UfS9/iCqWHn7nJf6VwURKS0/kmaF3EMjJ8NPJixH4aGYGOwrlKD3RE3V/XeUz2DldrsRUrXZdh9m6CdjTlf4LsKqdIiFWHhtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191160; c=relaxed/simple;
	bh=7ljj0hImvKFzPEaYEolmDg5S97ICXLOJaiPRjgx4OTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovrOZIfq7hrMDK7hvplaAry4m+/EiWmSy79vNj2gCp3JXzA0LEC7kPclr4A5WnqTVcG5sbEEm9VC2vaEYtPvgoCgLvy6ViK796teM56E7phmFFde6lagXFK0EaZhEOsV70FmpwqCrVRu3m6vXFz41mBqEPfUUFcZTJeOj8zJcmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lu/doDc2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu/doDc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884EDC4CEF1;
	Fri, 23 Jan 2026 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191160;
	bh=7ljj0hImvKFzPEaYEolmDg5S97ICXLOJaiPRjgx4OTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=lu/doDc2uYgMCuJUPr+ptveITpY0um7mKoEoH5VJ9Pp+izT/jDZNsya0NCQXiYZaE
	 ibXWvU2ei15m9j4KCOhRVS9mg3/+NVAo4yhrmMJxymDJ3jjD40WEQfjz5AVO2vTqOm
	 t/BvtzJuzuSjJQipFkgB0DC1mocHxMveQ0W/nnRx2heS4ztQLvMDOCd4dfw+f1DJl3
	 lF5Wer6ZngKx6uwd71zUZZ9zvbux9Z/LfGqBzzQLWO5w3SLGtKjbX44WuinA7tqKec
	 yJEpaYUMazH9M4Fq6QpQjQkhBOLzG6o3mi1spZdoUc7+NFp5el8K9nw7F1VrrUabEd
	 2en4kqb19QrNQ==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] rust: samples: dma: remove redundant `.as_ref()` for `dev_*` print
Date: Fri, 23 Jan 2026 17:58:41 +0000
Message-ID: <20260123175854.176735-4-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This is now handled by the macro itself.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 samples/rust/rust_dma.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index f53bce2a73e3..94effeb4eca4 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -57,7 +57,7 @@ impl pci::Driver for DmaSampleDriver {
 
     fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         pin_init::pin_init_scope(move || {
-            dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");
+            dev_info!(pdev, "Probe DMA test driver.\n");
 
             let mask = DmaMask::new::<64>();
 
@@ -88,9 +88,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
 #[pinned_drop]
 impl PinnedDrop for DmaSampleDriver {
     fn drop(self: Pin<&mut Self>) {
-        let dev = self.pdev.as_ref();
-
-        dev_info!(dev, "Unload DMA test driver.\n");
+        dev_info!(self.pdev, "Unload DMA test driver.\n");
 
         for (i, value) in TEST_VALUES.into_iter().enumerate() {
             let val0 = kernel::dma_read!(self.ca[i].h);
@@ -107,7 +105,7 @@ fn drop(self: Pin<&mut Self>) {
         }
 
         for (i, entry) in self.sgt.iter().enumerate() {
-            dev_info!(dev, "Entry[{}]: DMA address: {:#x}", i, entry.dma_address());
+            dev_info!(self.pdev, "Entry[{}]: DMA address: {:#x}", i, entry.dma_address());
         }
     }
 }
-- 
2.51.2

