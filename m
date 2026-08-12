Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CDF377023
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 02:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502109; cv=none; b=RpnxfSWw2h+OANO5KBZSdsG0xd0cGPmRuy7sdxLg5FVbDzPTYt1UVpv5QGAw3qeZZF+mPA1frr5LkSu0uxpRA4zrO7QZOHujkM+ZRGP5F4NqLx8jsyYfzg/BMlw5yBZN7cbVdkCEF7PECEeqY8eEFlPf2UnQlDyiPL/ZLqTW6vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502109; c=relaxed/simple;
	bh=98bvqSNSIcBJrgtg+0GT628OK+aX9aegU32yNSpk2Uk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OG6I/GN2apdH8dKrAp6wblLKYHCn7pyshxLzkgZAsBzBpBM4PGMIGa7hCtMpZc/Wz3dxUtEivtbSE964F2D4Zuc9QJmvHpM7qiE0/NlQL375m254jNdkkNhz756w6cFnjWuANqFK5Ku8Hrzr4d8p7T6OkiJoIvgBy85XyJp+sCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=c0t/TJ1U; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="c0t/TJ1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=aT
	A7HpBAnfT2U8agQ3rgXZlL7nqNP8MehXKAw5gCRPQ=; b=c0t/TJ1UayPGtfsB7Z
	H9lZCcJAD9Z1MOMR5Xq03H8NyMow1an6KC/rRDNPh0Im03REsP/xvPXYYqvWkGb9
	nvWbqJ1J4mM2SplJHfz9Id9G/RoqLdZyVCLpBgA3vXPqOsZ7xjHtQvVOSILAY//V
	xJq3weVS7c1K1fPSQJPq/16hU=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAXVjrC23tqAVNqBA--.51579S2;
	Wed, 12 Aug 2026 10:34:43 +0800 (CST)
From: liujinlong <liujinlong176@163.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	liujinlong <liujinlong@kylinos.cn>
Subject: [PATCH v2 1/2] rust: mm: add VmaRef range query helpers
Date: Wed, 12 Aug 2026 10:34:34 +0800
Message-Id: <20260812023435.3142534-1-liujinlong176@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXVjrC23tqAVNqBA--.51579S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1fJFy8GF1ftw18trW5KFg_yoW5JFW3pr
	WUGw1YqrsxZ34fAa1S9r9xA345u3s3XF48XFW7JwsY9F13JF1jkFy8Kry5uayvyr4DX3y3
	tF42vF4rC34UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnAwxUUUUU=
X-CM-SenderInfo: xolxyxxqor0wqrxwqiywtou0bp/xtbC6AOgs2p728OOBwAA34

From: liujinlong <liujinlong@kylinos.cn>

Add helpers on VmaRef to query the virtual address span and test
address membership:

  range()               - returns core::ops::Range<usize> covering
                          [vm_start, vm_end), giving callers access
                          to all standard Range methods (len(),
                          contains(), iteration, etc.)
  contains_range()      - sub-range membership, returns false
                          on overflow
  is_page_aligned()     - PAGE_SIZE alignment for one address
  is_page_aligned_range() - PAGE_SIZE alignment for addr and size

is_page_aligned() and is_page_aligned_range() are associated
functions rather than methods, since they do not reference any VMA
state.  They live here instead of a separate utility module to
keep the page-alignment helpers close to the range-checking code
that often uses them.

Signed-off-by: liujinlong <liujinlong@kylinos.cn>
---
 rust/kernel/mm/virt.rs | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 63eb730b0b05..c11fb4c089bd 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -18,7 +18,7 @@
     bindings,
     error::{code::EINVAL, to_result, Result},
     mm::MmWithUser,
-    page::Page,
+    page::{Page, PAGE_SIZE},
     types::Opaque,
 };
 
@@ -92,6 +92,36 @@ pub fn end(&self) -> usize {
         unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_end }
     }
 
+    /// Return the virtual address range `[vm_start, vm_end)` of this
+    /// VMA as a [`Range<usize>`], giving callers access to all the
+    /// standard range methods (`len()`, `contains()`, iteration, etc.).
+    #[inline]
+    pub fn range(&self) -> core::ops::Range<usize> {
+        self.start()..self.end()
+    }
+
+    /// True if `[addr, addr + size)` lies in `[vm_start, vm_end)`;
+    /// returns false on overflow.
+    #[inline]
+    pub fn contains_range(&self, addr: usize, size: usize) -> bool {
+        let Some(end) = addr.checked_add(size) else {
+            return false;
+        };
+        self.start() <= addr && end <= self.end()
+    }
+
+    /// True if `addr` is `PAGE_SIZE`-aligned.
+    #[inline]
+    pub fn is_page_aligned(addr: usize) -> bool {
+        addr % PAGE_SIZE == 0
+    }
+
+    /// True if `addr` and `size` are both page-aligned.
+    #[inline]
+    pub fn is_page_aligned_range(addr: usize, size: usize) -> bool {
+        Self::is_page_aligned(addr) && Self::is_page_aligned(size)
+    }
+
     /// Zap pages in the given page range.
     ///
     /// This clears page table mappings for the range at the leaf level, leaving all other page
-- 
2.25.1

