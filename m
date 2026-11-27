Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804318;
	b=XeVmair5A62Ozc59lUAhhxPLMvmbT+6fJSJ5bP/Q/AU84Wcu42Em2Zgn+DHluJD6MPiW
	 wiAD9slbJ2oKiWYAKqBJf9rgeaagEA+zIp1OKnrdNoi9hWh5pkXtQHCNWuS1ThQvcvlFK
	 nHWSga9YpQX+uIQGB43exIT1E3kSWgYfz1rrovAOoU++/xff+EM5Br0OcBoaf/hv+S+XZ
	 aIE++DK1xwShHKeG8euBrCKt2uiUcefWJ12awNxHa4X5AQgRNNPZhrYCmX2oiYxKimpsZ
	 M9gKDHV72fwePrrO094zM5vbZnUdaY2yWPrykF+1JYOyFiZP24/wdwoLirE2axlUGxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804318;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=bhmBavxBDu7oBvEaPUxGwfDqUyaXtuf03Km8pH8uDSA=;
	b=DJiBHq7ESJu6uc7UEAio0frF/j9JVWNatbv+9+QwheAglMPrErPDSVfBpE7KIfRt1eB9
	 cS3P2eJCJID9ScabKsKP2MdDLmhI4YX1r9zVZeVgztIrcnyjogKbt0uCE98DQyLEiPxbr
	 Sb60jXU9tlF+vSnIQN4r79N8elCzMyGxP/akhCh1SUIvZCoIZuCwAQpRLvpbHJoLBn3LN
	 6vJzpTW463disMRLNzEQTHZYJ7KdX56mDG7voF2UvPxtpJCzsWnxBcQwQNPbr/1U5fj/Y
	 o2w3KL3wdjmNuFLBNL0fLSnGfbOohsMU/Yzrp+MVrURAwFINv+BRKfLmvyhHBtNNBNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=A44NmbwD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF8606A31F;
	Fri, 27 Nov 2026 18:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BF8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=A44NmbwD
ARC-Seal: i=1; a=rsa-sha256; t=1795804259; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cwpj7eAt1TcEP6Cl9neCjZiFf+UfUtb61w3x/XCZMvKdaPnrQ2paKX3rgy1ZiNe2aSE3wJ9l08SuwD7LBNZ03st39RNr1kwR7p4R+XK56pV6mEmRsjjHcjdHCYdp0YlwfecehSPZ+q/k0y632Ce4l6vzuDms/e52J/tjNv5XxQU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795804259; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bhmBavxBDu7oBvEaPUxGwfDqUyaXtuf03Km8pH8uDSA=; 
	b=Ga+BVaHevH5wXtQpJ2u79J7dTjqYZ6Q0ZSczLEy+3QphgzCEyuv/pZ7/Vb5s1uRdoA7gAVC/ITj3YUAUiSDx749es/dr0GKh7m1lmJo9g9HJUOHnXb0yuLZhqJObM0zQfU9nCm9cYParE7xv5Hxz/b88+0/y3ETw3KCy/XhWUnY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=A44NmbwDn61EUeS8XE/ZYmrckPVuocb3GpD8pCXQMgRO0p9xddP0Gfk+v4z2+RNZEk5iFBtbAB249fJdZLZWJli5nkutGWg/BcByzeO1WfdM9UVuFgjrRyJHn5CFZ/L2X5eMwBcCWy2f/eAvE5tdgQGxHhPLgE8H6hMdTRFqj78=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=bhmBavxBDu7oBvEaPUxGwfDqUyaXtuf03Km8pH8uDSA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795804258302402.81084280671587;
	Fri, 27 Nov 2026 10:30:58 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 15:30:38 -0300
Subject: [PATCH 2/2] rust: dma_buf: dma_fence: require a SignallingSection
 in signal()
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dma-fence-signalling-v1-2-c44e8f4910ca@collabora.com>
References: <20261127-dma-fence-signalling-v1-0-c44e8f4910ca@collabora.com>
In-Reply-To: <20261127-dma-fence-signalling-v1-0-c44e8f4910ca@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

DriverFence::signal() is where a fence's signalling path ends. The
dma-fence rules require the whole path, from the point where the fence
becomes visible to other threads up to the signal, to run in a
signalling section. A caller of signal() has most likely been running
on that path before the call.

Make DriverFence::signal() take a &SignallingSection, so that callers
have to open a section. This does not ensure that the section covers
the whole signalling path, as drivers can simply do:

    fence.signal(res, &SignallingSection::begin());

But at least it nudges drivers in the right direction and forces them
to consider signalling sections instead of ignoring them.

Update the DriverFence example accordingly.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/dma_buf/dma_fence.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 7ee87935d3be..39f9bb9d1be3 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -773,7 +773,7 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
 ///
 /// let section = SignallingSection::begin();
 /// assert_eq!(waiting_fence.is_signaled(), false);
-/// fence.signal(Ok(()));
+/// fence.signal(Ok(()), &section);
 /// drop(section);
 /// assert_eq!(waiting_fence.is_signaled(), true);
 ///
@@ -873,7 +873,10 @@ pub fn as_fence(&self) -> &Fence {
     }
 
     /// Signal the fence. This will invoke all registered callbacks.
-    pub fn signal(self, res: Result) {
+    ///
+    /// Takes a [`SignallingSection`] because all code needed to signal the
+    /// fence must run in one.
+    pub fn signal(self, res: Result, _section: &SignallingSection) {
         let fence = self.as_fence().lock();
 
         // SAFETY: `fence` is valid because `self` is valid. The lock must be

-- 
2.56.0

