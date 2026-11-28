Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795832213;
	b=EpiU63KAEKTZGLfreG3Mq23dsk2IALXA2ERAY427pOgunY6CMX++onz7nZPzrAy8Ltcd
	 4/vmcA1iion2N+A/iY5TT002s1UersK5HmusTwa96KcFRhDZQvXXfSQrIqdFI+xnwrzZs
	 SOoWZ78uB7eZU7uZvtqeXjCYoYJ6k0enncPbW1lM5T7byqXicaszK4D/FtJUDksJzYji5
	 +Nc3uDXf1bonQ/FbX0D98bAOSOT5zPNUpnxlag6xvIVASdTA3zIQWXp0IM/TJM5FWnpNq
	 1MGb4KWyqzUWuTn/bciIhDr/arjCQkNSzm/4ZPx2htlZe3Nz7gQmE23QXYBNlT7TeDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832213;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=LpWGezFlxywpiQGUby293UqJ0D4grej8p24s7DenqI0=;
	b=IYINPNV8cRHuWLFZp8+zarmUIOoWO1AEWO2jgRARVZxs8To3PopIx2Zh8a/jsndUaN7C
	 WYZ0Upd5jgFUqnBN+pqVpIjAxfT6m59zCTgJGBXT9zwiA46uZb+xWfS+Pw3fs1MKpjVTG
	 IMFhHY01mjA0ST2E7vxRrMBi3eDEP0GISnD4LJEHkx5rfOq+zhFlnp/Fz5mg9lBJSTII2
	 UoHhwl0LqQM+72VxlX1/E8teY3MfaAKiW5NoVza1REhWSPqiSZiQWeuWuDQI59OZCL93g
	 l59WeEFjszvO7QwfatPPCKT2QTK123dmDa7mfAo6piKOKEU+6E/k+EP3tZkirvR5V8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=eFqF34Ia;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE39B606A32D;
	Sat, 28 Nov 2026 02:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE39B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=eFqF34Ia
ARC-Seal: i=1; a=rsa-sha256; t=1795832180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NaSJ2TviINSri/J4g5Oddmz0oKFgqxdVj7QY/ICEo8zYmgfVzkDDTwum1sxycYPVS7Id43fVHP18RNa5hcWfs0Yf8X6OikqazGHOr3zPln9huHxuElLwTnRh0Djv7TJy4Q5JRKZ0aGy7WnCx1yCvl4rZqQceye4RZX24rcjzoAE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795832180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LpWGezFlxywpiQGUby293UqJ0D4grej8p24s7DenqI0=; 
	b=MCxo01s3tSM65yG6L8xtI9AaKtWmYYC+acUUOnCOFszNChAm4VSLPX+NQw4wilibVyn6vhALvR1VSHEH2WOvIagW5fc2ejY2fDuv6qoDC+uyilXflxTcPK49JJRlEW9Gp6Ok8rP7f4kUp+XyMnZYYPgt9JBw11qVpXG7eB1lwEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=eFqF34IaB2Pnlvt430hit6LR+Xaj1jWg57MGle/XjAcKvxs9C5qPyEYBqZTSilfmipnxe8wXhT8cwZUMPQnoxQmBW75oq75VomnBusEqi/G6Le36oJtG0sRK1E2muixkQVN7C4ZyTUb3e01iuZalNkuViODWKUDzpcZJp9TI8Us=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=LpWGezFlxywpiQGUby293UqJ0D4grej8p24s7DenqI0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795832178280496.02796124222414;
	Fri, 27 Nov 2026 18:16:18 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 23:15:45 -0300
Subject: [PATCH 8/9] drm/tyr: flush the caches after disabling an address
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
Message-Id: <20261127-tyr-mmu-irq-v1-8-2fcb9f9465cd@collabora.com>
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

as_disable() flushes the caches and only then switches the address
space to UNMAPPED with UPDATE. Between the two, accesses through the
address space can bring its data back into the L2 and load/store caches
that the flush has just cleaned.

Flush only once UPDATE(UNMAPPED) has completed, like panthor does since
commit 9a96e169c926 ("drm/panthor: Move cache-flush after
UPDATE(UNMAPPED)").

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/mmu/address_space.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs b/drivers/gpu/drm/tyr/mmu/address_space.rs
index dddf5d41f3cc..fa4c26a6eb12 100644
--- a/drivers/gpu/drm/tyr/mmu/address_space.rs
+++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
@@ -312,9 +312,6 @@ fn as_enable(
     fn as_disable(&mut self, io: &IoMem<'_>, as_nr: usize) -> Result {
         self.validate_as_slot(as_nr)?;
 
-        // Flush AS before disabling
-        self.flush_caches(io)?;
-
         // Release any pending LOCK before disabling the address space.
         self.as_send_cmd_and_wait(io, as_nr, MmuCommand::Unlock)?;
 
@@ -351,6 +348,10 @@ fn as_disable(&mut self, io: &IoMem<'_>, as_nr: usize) -> Result {
 
         self.as_send_cmd_and_wait(io, as_nr, MmuCommand::Update)?;
 
+        // Flush only after UPDATE(UNMAPPED) has completed, so this address space
+        // can no longer bring data into the caches.
+        self.flush_caches(io)?;
+
         Ok(())
     }
 

-- 
2.56.0

