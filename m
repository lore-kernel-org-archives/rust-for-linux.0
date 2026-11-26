Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704793;
	b=iCV/+TPIodypUaYO4jwYYndsWORj/ERAYCjmNYHIusRkgFqdjztprUptdTYe2nHi/1uK
	 drqXq9QxpD50Tgh6rY/NRL/V3VJYTWTeuZFnkYTdysw3gEhTzYNdV2BfqNRvZqgluiZg8
	 GKsv45yDYePXe2p3w2ryixRhKObWiOrawbB+R55fOOb9vxQtcxQoq15uxeSfdPDViLgDm
	 G3H629+QNS5k9gYMsAUPXe6qTkUPebXidPk+bE4ebERShwX75qVhHSD8E5s4gieGPRU2a
	 /FNluzR8zso1EsGap0nIetKHB86VaE7lGQwZFHO56z1z7sx7F3ikvd/4EJQPU5YtIRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YeDEQjq1QHnb/SlOHmlULyGohnJ9XGys0KZ0/DkEdK4=;
	b=VKGTDl8OJGqwJaVfr0rp8R19VdoZqd2C+ImVxulyMBG/prsIzv1Ph34qCDEcpxTRrsOX
	 EwLYoD7nmiGWjQg4F8nqV2OeA0MPiGVEch/B8M+tqremnI7vwi8PG3RaenLO1qPDVnA3/
	 EhKKrKuL+HRAhBFfar4IZrzmsaCVk9Y8gxWgjr4dUf+mczlKYySUEOA2KyY0Ycv2pRHA5
	 XPQ35H7ZehT99W9JO1YnN07FeTZcQauAdKEqXP76XQQ5cToti/xysyubRkaKPbj0RH8e0
	 2rQNyIG/e6HFU5fIskx3pF98l+FpMKU2xleB1NIklJa2z25siBBpAEg+yufz7qz9IWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhCvvcgp;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B960A3813
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 14:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C1B960A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhCvvcgp
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso55929051fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795704791; x=1796309591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeDEQjq1QHnb/SlOHmlULyGohnJ9XGys0KZ0/DkEdK4=;
        b=QhCvvcgpRVYNNqkcHwYbEwL/yAqrTZqsI3I9uPu/PZpi2+A+wgDWag6leOdVgfiZuz
         tNcv93jZ7GItO8TQMp5H9GOewZ4zKkwugFzh/pN/KDUXC89haV5JmoWLwAolPvMgJ+0Q
         V1j3SjK0CDSioRmFdY1B4A5akWbG5WmNKsLM4plZJmMMgQV0PKWnzzHSii81RzjuqEEe
         CK85l4gN3o0fLGN64FNFhkkFoPR9Whrbq8FBBCGRkhh74OzbiK7CaFtQiIkV5nw3CyMJ
         fDD0r8eY8ilqlZJsPIIFSpaa3xV5KcsJHfHHrzAB4gS/dBxE9G93gCj+6yjSXFlWPWvw
         UY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704791; x=1796309591;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YeDEQjq1QHnb/SlOHmlULyGohnJ9XGys0KZ0/DkEdK4=;
        b=K2t1RD/cPrNJp3ZkQuN4eq5SUYF3Mxgk85jBXx9nTwIiolYsaWmxd+TRnU6QyoG/pH
         s8ymIq/FLsks1TC2cE+r4Ea1VKP2wi8+IZ/hDg74UrFEij7hY5xJow4VVDl1ZUoOCdE/
         kUBNSdinIR+KenCI9E4NzyJKd5Z0k3SjcjGmJAOubf7X7ODrGR1vV0Ny4xOBpAqLx6ew
         mYNQkKH5ynkttvTWaJaxxcPCwM6W8KQ3vN9aDvoV7EwCWthU3Ef8qB+BAsOcOeQ5u0cO
         03Ug69xRPU6e7zXDCoKphP8MWPekQlik+naZVD4pr6OpZOIcPNjWgMll7Ad+us2Kg/cY
         qL2A==
X-Forwarded-Encrypted: i=1; AL+hErFwpcVpFg7693Copu20JpYUZ914n/n55B0hZBZEHKofTlqvodKHt2nb6qtHQvZ6wcjXO25m86rUmsj/5EylFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qzlmQIcGrZT0lMC4xtwigJ6GgE+MajIckSH+T6GeCdq0YsTul
	n1Y5Dg+FHkNK1/9KChWtKQb1tdfMrsbpDQQOhlxpVLY800aBREqybbKt
X-Gm-Gg: AZFdTZdt8dkaJOOpdB/LmMJ0EKnd6fXK0Y07qqxgkSCkavWWwOVJ5Y3tGOIYmpbUVT+
	a6cKeoEqppldwkKNzw12e/98/CtbRWk02vlvMhJomJzeKoLJ478hsHPO0IHIQgQROiiziM0zPCx
	o9Hc0rGq4VSLK0S85SZeWvDcYicWZC5R3fqMDX6o3de4lJqlWN1QFHE4CM5eovwemFq8EzLhBE/
	QRrVFO+q1SKnUAuwbECgGxcbfDVmCCTuZRvKAzD1JfUkI26rM5WZWRccQXKX1CyOJMzzBBmEz/w
	qaeRUk1EG7EODKpVIgLhnB0F4RSryBbEESmiX6Ea3UkDG5x44qBHzO1s1M7s/XUuBZA3UL4DWZ/
	JSZB2+vhJzNC0lHlcEdpDHGaIPgv4toNyGJRLGICUUj33h7OaqsZ7DSAbJnVmWCZZYTuZKLSVOC
	rPD9o6/+WUByyaM3buG1u/37JwJMsNB1HSq4U4cZsXbRcvS+LgVgx5XQhfI3N90hJ+31bxA1icY
	99TSsZkJ31fPGFga86+hBLpnQ3ITOVib+pT+uY9CN0KSAzW+GbT+M87k9FAHWMyxSv7IqOy/fyj
	svIKS9wL7fZLfPWcy1BTr1z5/pEMIGa9YwHY
X-Received: by 2002:ac2:4e07:0:b0:5c1:a828:499b with SMTP id 2adb3069b0e04-5c1bc682145mr6200113e87.2.1795704790902;
        Thu, 26 Nov 2026 06:53:10 -0800 (PST)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd06d1efsm5493328e87.72.2026.11.26.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:09 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	=?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nicolas.antinori.7@gmail.com>,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org,
	Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH v3] rust: mm: warn once on invalid VMA range
Date: Thu, 26 Nov 2026 16:52:57 +0200
Message-ID: <20261126145257.192636-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use `debug_assert!()` and `pr_warn_once!()` in
`Vma::zap_vma_range()` to report invalid ranges.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
Changes in v2:
- Drop the `warn_once!()` macro and its KUnit test.
- Use `debug_assert!()` and `pr_warn_once!()` in `Vma::zap_vma_range()` as suggested by Miguel.

Changes in v3:
- Add `#[cfg(CONFIG_DEBUG_VM)]` in 'pr_warn_once!()' as suggested by Nicolás.
 rust/kernel/mm/virt.rs | 4 +++-

 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 63eb730b0..289511dc1 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -115,8 +115,10 @@ pub fn end(&self) -> usize {
     #[inline]
     pub fn zap_vma_range(&self, address: usize, size: usize) {
         let (end, did_overflow) = address.overflowing_add(size);
+        debug_assert!(!did_overflow && address >= self.start() && self.end() >= end);
         if did_overflow || address < self.start() || self.end() < end {
-            // TODO: call WARN_ONCE once Rust version of it is added
+            #[cfg(CONFIG_DEBUG_VM)]
+            crate::pr_warn_once!("Attempt to zap invalid VMA range\n");
             return;
         }
 
-- 
2.56.1
