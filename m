Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795832215;
	b=TKM/a1hARBle+SX3ODk1+t/j+tEenFkPUxhqVCdwUgHR58ldZK3/9fKdYmXSIFqrcbGj
	 p8ufEZ94G9a1phspG1hQM2E/e5pY+2/Thl+yjp9aVIdkKSIX39ttsnq8d0hPkwYeNuL+W
	 qhJVeqM5DHSQXDcwE8OaHYeovRDs40iBZxIQDTvMKAgpvH6FcG/iAp9XcXZf0RCB0H7dG
	 WLctIdXrLOg23cHN3p6oJTHz9gCcxWrpgCboYz1LKms66RRvNXf0oycHrY4TR0jlxftoX
	 ypkPv1oGkwzPLzlelLsegqkNGMGFzjK+Ni7QzSV+PWyL0KFwUDfa3E7LzcAFO+jTN+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832215;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=noX1O5wIhIXkaFPpFQLL1PDoUo+1OgKAJgfMh+rsgoM=;
	b=pCk+i81ocoMJSaKu2OAFJ7M5lLI6PMbQrBiMGVE0G9KO4nu6v7Kj1H0wQZuhnr50OTWq
	 C+0nKBVjXybtmrqdRInIbkeusr2ZcnJqAQqRve9l0JiaezQLMgG4fBP7yR0GVU3AMjCFO
	 1JgWLpXbaQWzNvWE5f2yi5RAnWNRfCFf1UVibn2SssJBbFFlGhkBZGajvqI8o8XM0XI9i
	 DcM3YFq2q11sWDz8tA3vR7pLrzrVqtIJWUPyw+D4xY71XklEM9yWJ2/JzljweAPQWqkj5
	 3uCYlOvBZpmw+50XrSPSriUW6u4UqRHednCEgsy4l+weHseQHZNbHdxcIpJg9pTYuRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b="HQ2i6/PN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7E606A6A5;
	Sat, 28 Nov 2026 02:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D7E606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HQ2i6/PN
ARC-Seal: i=1; a=rsa-sha256; t=1795832178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z5Wgo/oeJ4X+pYDP3K++zUQiShYJkAy46eNSW8Te82/eIZ6t2lgjn8jc2qhLb8zjKOjzqs4o/8p4B29d0RnFKWyqomj46yoy+Us+pAkMYdYi5BhsdWs7cZlLVmHZLy45fdXfc4/O3aXncwHYkkS6kNE1tWpK7ho1Kp8OA3SoMGU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795832178; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=noX1O5wIhIXkaFPpFQLL1PDoUo+1OgKAJgfMh+rsgoM=; 
	b=E6VqmqjlKxnTN/Od29HRE627iEQyLJrxFfkU11hCidoL6M/p1X5Jlg7QgeWzPqf5H4Lt6NjBL25bQy9y6bKQRgLDh0BcObHzTqBPKIW4nOCmBqTfSGso43nKymbnMnuGNq/CMlaLa5I637k7CKrbf4b0Kra+bcXuo36W6F2fJwk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=HQ2i6/PNSQUg7Eji132/GXcP9bzphhqBULBHj81KauNRqtbIV/LPBInHhpJzQ+v9Uj7KeQKXGofSlVoc3uYimaZD7EOHI7ZpDr4ExxSobmSwufrvuo3p4RuKqRWUXRcyCaDOolOGDpA5bfB4Rma9iRaXmf9QcBx2CMCUAyI4z4s=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=noX1O5wIhIXkaFPpFQLL1PDoUo+1OgKAJgfMh+rsgoM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795832175431426.15764727825297;
	Fri, 27 Nov 2026 18:16:15 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 23:15:44 -0300
Subject: [PATCH 7/9] drm/tyr: use FLUSH_CACHES when disabling an address
 space
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
Message-Id: <20261127-tyr-mmu-irq-v1-7-2fcb9f9465cd@collabora.com>
References: <20261127-tyr-mmu-irq-v1-0-2fcb9f9465cd@collabora.com>
In-Reply-To: <20261127-tyr-mmu-irq-v1-0-2fcb9f9465cd@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

as_disable() sends FLUSH_MEM, which cleans and invalidates the L2 and
load/store caches and then unlocks the address space. FLUSH_MEM is
deprecated from Mali-Gx20 onwards.

Do the same with GPU_COMMAND FLUSH_CACHES followed by UNLOCK, as
as_flush() and as_end_update() now do.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/mmu/address_space.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs b/drivers/gpu/drm/tyr/mmu/address_space.rs
index fc617f282cbe..dddf5d41f3cc 100644
--- a/drivers/gpu/drm/tyr/mmu/address_space.rs
+++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
@@ -306,14 +306,17 @@ fn as_enable(
         Ok(())
     }
 
-    /// Disables an AS slot and clears its configuration.
+    /// Disables an AS slot, clears its configuration and flushes the L2 and load/store caches.
     ///
     /// Returns an error if the slot is invalid or if register writes/commands fail.
     fn as_disable(&mut self, io: &IoMem<'_>, as_nr: usize) -> Result {
         self.validate_as_slot(as_nr)?;
 
         // Flush AS before disabling
-        self.as_send_cmd_and_wait(io, as_nr, MmuCommand::FlushMem)?;
+        self.flush_caches(io)?;
+
+        // Release any pending LOCK before disabling the address space.
+        self.as_send_cmd_and_wait(io, as_nr, MmuCommand::Unlock)?;
 
         io.write(
             TRANSTAB_LO::try_at(as_nr).ok_or(EINVAL)?,

-- 
2.56.0

