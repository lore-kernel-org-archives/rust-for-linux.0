Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A73290AA
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418495; cv=none; b=hlctBd4T4m1V2SL4iFMsQCxNClgo67L1WmpMWWOv2cTFxqhvhgAxIH/IyG0r/KuWtNPptjCuf/TROo2wSpl/Om+xB5dbveeyiz31NkK18BCuBgdcjiBn7xwHY+FHOjEODh/YEA3CIITOcB9w4XXsRHwJ3iM6g+FNnDGDhthcKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418495; c=relaxed/simple;
	bh=ooPVdC6VCaFOK1dEmDqjc6HpnohCfqCt0HK/b6T0Y/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l2Pq94uuh9UDyprVoU3cygUOG43XJjxXVgg2bhC4GqMlmT4tzw4HYVusernhZ6FbgsHFB2WqjN+YvVxYdT5bbz0swNRMjpD7C4OOGLTDrHs/pWpR6PJLJX3WYViZzSpIKE0IlvxTHB1VVY9dw9FvnjxgYZluEz0b3fn2GD4hXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Txin1JoY; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Txin1JoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=L+
	rGpwUv4NEKpVpsJ6274BEOS/rkbRy3foul/recwYY=; b=Txin1JoYKtiWjspDPa
	4YcY4iM1+WjR4GSv6anTT6bczC2t4+Sm/JiSRwdCzf9HOQcayylFZeRzk3GngUEf
	RM8Li/K0orqcxa+rDIR+au6jWqRJRHgdN1Pad0NR99wHvWcxVdVj3lOrt9QlYvGl
	YNf5jY4q7xgHqMjCT3N0cxryM=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v5snlXpqPF6jOg--.28407S2;
	Tue, 11 Aug 2026 11:21:11 +0800 (CST)
From: liujinlong <liujinlong176@163.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	rust-for-linux@lists.linux.dev,
	liujinlong <liujinlong@kylinos.cn>
Subject: [PATCH 1/2] rust: mm: add VmaRef range query helpers
Date: Tue, 11 Aug 2026 11:20:23 +0800
Message-Id: <20260811032024.2649539-1-liujinlong176@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5snlXpqPF6jOg--.28407S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFyDAr17JF4UZw4xuF48Zwb_yoW5Jw4fpr
	W5G3W3Xr43ZF93Jw4S9F90y3s8u3s5XF4rG3y7tws5uF13Jr1UCF48Gry5ua4vyr1vq3y5
	trZF9F4F93y3ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnZ23UUUUU=
X-CM-SenderInfo: xolxyxxqor0wqrxwqiywtou0bp/xtbC5wenump6lSeQ7AAA3j

From: liujinlong <liujinlong@kylinos.cn>

Add helpers on VmaRef to query the virtual address span and test
address membership:

  len(), is_empty()       - byte span and zero-length check
  contains()              - single-address membership in
                           [vm_start, vm_end)
  contains_range()        - sub-range membership, returns false
                           on overflow
  is_page_aligned()       - PAGE_SIZE alignment for one address
  is_page_aligned_range() - PAGE_SIZE alignment for addr and size

is_page_aligned() and is_page_aligned_range() are associated
functions rather than methods, since they do not reference any VMA
state.  They live here instead of a separate utility module to
keep the page-alignment helpers close to the range-checking code
that often uses them.

Signed-off-by: liujinlong <liujinlong@kylinos.cn>
---
 rust/kernel/mm/virt.rs | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 63eb730b0b05..5fdc3c616ef3 100644
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
 
@@ -92,6 +92,45 @@ pub fn end(&self) -> usize {
         unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_end }
     }
 
+    /// Size in bytes (`vm_end - vm_start`).
+    #[inline]
+    pub fn len(&self) -> usize {
+        self.end() - self.start()
+    }
+
+    /// True if `vm_start == vm_end`.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.start() == self.end()
+    }
+
+    /// True if `addr` lies in `[vm_start, vm_end)`.
+    #[inline]
+    pub fn contains(&self, addr: usize) -> bool {
+        self.start() <= addr && addr < self.end()
+    }
+
+    /// True if `[addr, addr + size)` lies in `[vm_start, vm_end)`; false on overflow.
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

