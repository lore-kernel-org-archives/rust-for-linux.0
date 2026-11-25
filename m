Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646938;
	b=xvGt4hBlDHdttJeUzShptz8HOaoJGg7xp8t5EeCew7hOXEmVLGUht6V46s4LehZ5ZgkR
	 I0UYHC42evrKMIsFs5XjzzOS6VEfe2XjIdHrVWPA1bWvL9KGFmZAF+ZwlP2yAResgSqJ/
	 gUfgCGOZiLnqqkJ9lA2Hn9bIEmOd9XWZo18V/N/qOyxTJ1HcE3+gm0so5ZZ1mqmWrTO3e
	 DJQJIOlS/ssVtNyLRwz0ZhcbscOkYC3PYGUvBQ0qnbd3CjOW/ReMtbWyg8OQNwbfdyIli
	 qW3qBbTcOJlqXMpThlQU9jJyJdyTOjCGGEx65ADTEG4RyM+TvG+oYLAi2DlMGjekaQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646938;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=2dKHKGT3XxjKwes7CxkzvU5EljIpE3zcFDKRCRkPWT8=;
	b=wgvBI+MuHN8/U4+GX+CHUSA/PFIlgJby71gua6r7DMUI8+7brMDKfpxW9ZpsvFE+axU6
	 jPXXg4xiaqsryyP304nzbNvv9K2RyzvwFM30z2Lx76+/J9DV0mFmAidsrONHhLI1TPuIT
	 l1IPELjYxeiDv5PFS1t1gR/JgP0AXx94w9GH7VfozpUfxUyGnl7Abq1f3vKu7/s9zcIdg
	 n3ykv7eIEEiVnk+VmYWPQORK/ImynRt2qBrVul1I1Qjpy0x5iVnm390TpBSEe5vJH48YJ
	 9g/xz8lEu04JxYOdG/dltdF5oF7dBC5BuZNVL4jxSt5CAl0d7RGfIJT4tKLu5mhATgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=cnPynOjz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AD606A6BC;
	Wed, 25 Nov 2026 22:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E08AD606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=cnPynOjz
ARC-Seal: i=1; a=rsa-sha256; t=1795646882; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b2bb7N6sSW2Mb52dg3QmwdVS4iQq3y0/WygTcHGbpQ5a3K/pQt78sD0dCBSU4t389HiFmMO3aKifUZ2TMCOlv8xUGEuhve2611OVqfTbqkIC23rvWsDy72mN8zIC3QSNoTVGaYkpT0pLUpp4jQZ655a0tOAOP/p8ZkwpFhh8tDg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646882; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2dKHKGT3XxjKwes7CxkzvU5EljIpE3zcFDKRCRkPWT8=; 
	b=b148siIbvoSG6Tm+HP4xsZbzXwk/Wn3n2ySlD4eynqQOtQpf/UDL5pbeO+1B8LNgGjLOnp6sK7Wntr+01ldJPlzQqOuheWh99RkDiRwHzMl8Klg9On9QGtAxx8lca5KCCNck769E2J77cWk9WzoMCAH/cVG9tgAeeThrjp3hyxQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=cnPynOjzxvIEwczRTiHJEH3iQzUPbeioccX87X8cbqrEZOZy4GXvVs5QSYWC5Sx+/LgB7kMOmVcd+vt7RC3ZuRwSVzWw/+cXNA1giiGeSYOUWtnqjUUqLdsLgzF4aPwIYPuddoywHjZGltfmLgn9q+huAdunSxPjEQ7emjn1i34=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=2dKHKGT3XxjKwes7CxkzvU5EljIpE3zcFDKRCRkPWT8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646880805415.89340071566994;
	Wed, 25 Nov 2026 14:48:00 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:47:02 -0300
Subject: [PATCH 11/13] drm/tyr: return usize from get_pgsize()
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
Message-Id: <20261125-b4-tyr-as-casts-v1-11-2b2f53164d86@collabora.com>
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, return the
page size and the page count from `get_pgsize()` as `usize`, the type
that `map_pages()` and `unmap_pages()` take. Its two callers cast both
values.

The page size now comes from the `usize` size constants. The page count
is computed from `u64` values, so it is still cast, now in
`get_pgsize()`, with a `// CAST:` comment that gives its bound.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/vm.rs | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index f06d5b02d8d7..673fc6819070 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -788,7 +788,7 @@ fn sm_step_remap<'op>(
 /// can be mapped before we hit the 2MB boundary. Or, if mapping 2MB pages,
 /// figure out how many pages can be mapped before hitting the 1GB boundary
 /// Returns the page size (4KB or 2MB) and the number of pages that can be mapped at that size.
-fn get_pgsize(addr: u64, size: u64) -> (u64, u64) {
+fn get_pgsize(addr: u64, size: u64) -> (usize, usize) {
     // Get the distance to the next boundary of 2MB block
     let blk_offset_2m = addr.wrapping_neg() % u64::SZ_2M;
 
@@ -799,7 +799,11 @@ fn get_pgsize(addr: u64, size: u64) -> (u64, u64) {
         } else {
             u64::min(blk_offset_2m, size) / u64::SZ_4K
         };
-        return (u64::SZ_4K, pgcount);
+        // CAST: This path covers less than one 2MB block, so `pgcount` is below 512.
+        #[expect(clippy::as_conversions)]
+        let pgcount = pgcount as usize;
+
+        return (usize::SZ_4K, pgcount);
     }
 
     let blk_offset_1g = addr.wrapping_neg() % u64::SZ_1G;
@@ -809,8 +813,11 @@ fn get_pgsize(addr: u64, size: u64) -> (u64, u64) {
         blk_offset_1g
     };
     let pgcount = u64::min(blk_offset, size) / u64::SZ_2M;
+    // CAST: `blk_offset` is at most 1GB, so `pgcount` is at most 512.
+    #[expect(clippy::as_conversions)]
+    let pgcount = pgcount as usize;
 
-    (u64::SZ_2M, pgcount)
+    (usize::SZ_2M, pgcount)
 }
 
 /// Maps a physical address range into the page table at the specified virtual address.
@@ -869,8 +876,8 @@ fn pt_map(
             pt.map_pages(
                 curr_iova,
                 curr_paddr as PhysAddr,
-                pgsize as usize,
-                pgcount as usize,
+                pgsize,
+                pgcount,
                 prot,
                 GFP_KERNEL,
             )
@@ -933,7 +940,7 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
         // We know that this page table has one or more consecutive mappings
         // starting at `iova` with the total size of `pgcount * pgsize` because
         // gpuvm callbacks provide exactly the range that was previously mapped.
-        let unmapped = unsafe { pt.unmap_pages(iova_usize, pgsize as usize, pgcount as usize) };
+        let unmapped = unsafe { pt.unmap_pages(iova_usize, pgsize, pgcount) };
 
         if unmapped == 0 {
             dev_err!(dev, "Failed to unmap any bytes at iova {:#x}", iova_usize);

-- 
2.56.0

