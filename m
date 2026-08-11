Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8E239E9B
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418508; cv=none; b=koqIDuUBp8etwWr0qtj0HWJpzs8SfLmELbOi13p2sta7vo0GTxm40yRocaYj6bjc9LC6nQystRBJ0dCPQYX64DC32EOnUkEx2olNaAjatzRSQUKNS2QmAKhJ/xGpmstVU0LDCNCdH92GkQLx/ZddaGxIUNlzxGbKiFfO9hBh5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418508; c=relaxed/simple;
	bh=Y+PWjk99X/Q8DhiKWl56IUK9OZxUoA0htcBhWcd9p30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ppTcLdeEDDYXW2rizlI7trjfgoHBrvvw7EPiEDnJzNQ3fkXHkWZoY9O/f2BliCNRUbFKuKzz5DJiSx/B671cQMJ8hwVwNsmArCpi5rAjSVjtjXm2Sxh9NC34x+ipKUwA28/J8un1cocpL69dBltgqsgmWXlLbdlCGA5jwC7QRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ha1N/uvO; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ha1N/uvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WZ
	g59bZSdRh9eFnqGgrskG9MRTM/sTdIEaiqg9zL+Vs=; b=Ha1N/uvONACTIAgw2R
	SzBBPEPYfBn99PhsayvoblU9AtmgNWkr03g1xjWaZwBnZKrHE58kutpSeS/IXI8D
	bREjWxR7kRapTgrM2CI+u0j8rTcCtf2J4EMpzHX2AaftYHuF22+K4zW4TBoQOFO3
	ompq7C7gnUeppdKLNXQSMeS0U=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v5snlXpqPF6jOg--.28407S3;
	Tue, 11 Aug 2026 11:21:18 +0800 (CST)
From: liujinlong <liujinlong176@163.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	rust-for-linux@lists.linux.dev,
	liujinlong <liujinlong@kylinos.cn>
Subject: [PATCH 2/2] rust: mm: refactor zap_vma_range() to use contains_range()
Date: Tue, 11 Aug 2026 11:20:24 +0800
Message-Id: <20260811032024.2649539-2-liujinlong176@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260811032024.2649539-1-liujinlong176@163.com>
References: <20260811032024.2649539-1-liujinlong176@163.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5snlXpqPF6jOg--.28407S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1xWF4rKFy3CFyxArWfAFb_yoW8Gw1Dpr
	WDGa15Krs8uF1DCwsFvFykXa45Kw4DXFWrAF4DAw45CF15Zr17urWDKr1rur1vyrs2q3ya
	vFyDXw4Yyw15uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_gA7UUUUU=
X-CM-SenderInfo: xolxyxxqor0wqrxwqiywtou0bp/xtbCvw6pvGp6lS4pTQAA3r

From: liujinlong <liujinlong@kylinos.cn>

Open-code the overflow and range check in zap_vma_range() with the
contains_range() helper added in the previous patch.  Drop two local
variables and three lines of hand-rolled arithmetic in the process.

No functional change.

Signed-off-by: liujinlong <liujinlong@kylinos.cn>
---
 rust/kernel/mm/virt.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 5fdc3c616ef3..363c10f976f4 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -153,15 +153,14 @@ pub fn is_page_aligned_range(addr: usize, size: usize) -> bool {
     /// we must only assume that the leaf level is cleared.
     #[inline]
     pub fn zap_vma_range(&self, address: usize, size: usize) {
-        let (end, did_overflow) = address.overflowing_add(size);
-        if did_overflow || address < self.start() || self.end() < end {
+        if !self.contains_range(address, size) {
             // TODO: call WARN_ONCE once Rust version of it is added
             return;
         }
 
         // SAFETY: By the type invariants, the caller has read access to this VMA, which is
         // sufficient for this method call. This method has no requirements on the vma flags. The
-        // address range is checked to be within the vma.
+        // address range is checked to be within the vma via `contains_range`.
         unsafe { bindings::zap_vma_range(self.as_ptr(), address, size) };
     }
 
-- 
2.25.1

