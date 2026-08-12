Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED4377023
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 02:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502116; cv=none; b=HmGE5wHu8miGO8T0WC7kdO5/SxvfcPIA1bTDrV0SqM/K1goSlZ8cRbXM+DDIrpwuB496KxyUgy72CpJVaOSuZGkJ4t8KzJC6JpIRxk0Op9c/JMH/ZMUwqKJvH4mrpCewjUH8RVBSIgjeKlXzUwkADIFjPUGacsXobutptK6U4cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502116; c=relaxed/simple;
	bh=qP9fUHMHprfKavE0WxsHFZb0+ZTyzv3abF8/xR1TEtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sPG8tF9cI1ZgWz35tcrwdXgDkw13mgFM+mkt1gqJnlTKbLKHqzSXtDxSej7vcS1XVbSildR9QKZ4mdwfHV5qX9P79JBDMR0b67cD23lmcJ12NKBzYUtWhh3CceoNjvULGVhpCEYC7NfOIKNqtAG3geQf3UEMlKJlFY1toDqB8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q9emJkb6; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q9emJkb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=W1
	MPpDqPYQiiC/J+nl1y3BU1hMQYg1mrznvFWAMelsk=; b=Q9emJkb6k4xssc9Fjf
	oP+IjT7y2NZUJDwhDs6u84nr+yuPATwJglXMI/VeWMdzz6kC6lIq8s8Ca6Co8AFa
	s+VG3sk80KkVjtmIhtOrZD25Umj4cHX2hewq0nX8OQHlFC4ljGzzo0mv3EsY0U0Z
	M5TL87kDjPN8SiuOYg8lkwUV0=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAXVjrC23tqAVNqBA--.51579S3;
	Wed, 12 Aug 2026 10:34:47 +0800 (CST)
From: liujinlong <liujinlong176@163.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	liujinlong <liujinlong@kylinos.cn>
Subject: [PATCH v2 2/2] rust: mm: refactor zap_vma_range() to use contains_range()
Date: Wed, 12 Aug 2026 10:34:35 +0800
Message-Id: <20260812023435.3142534-2-liujinlong176@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260812023435.3142534-1-liujinlong176@163.com>
References: <20260812023435.3142534-1-liujinlong176@163.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXVjrC23tqAVNqBA--.51579S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1xWF4rKFy3CFyxArWfAFb_yoW8Gw1Dpr
	WDGa15Krs8uF1DCwsFvF18Xa45Cws8XF4rJF4DAw45CF15Ar17urWDKF1F9r1vvr4Iq3ya
	9FyDZw4ayw18uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_gA7UUUUU=
X-CM-SenderInfo: xolxyxxqor0wqrxwqiywtou0bp/xtbCvwehtGp728dtzAAA3B

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
index c11fb4c089bd..32749039f7c4 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -144,15 +144,14 @@ pub fn is_page_aligned_range(addr: usize, size: usize) -> bool {
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

