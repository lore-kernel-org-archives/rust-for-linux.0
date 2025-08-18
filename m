Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C020322
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 01:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755479791; cv=none; b=hoVPGNVgl6IfSTI7R/R8wZZueOxQhbaf+tBcw3+p4YpGfgqhXsTVtVMfvFlfMD0y9tqwCI46p9itxEpBKuFhTNyvKjfIysRs4pjkIqgym/rRD4qGtR6ZXLyKl+Jgg1XLf7G2U1jYjot4vxIt1qg/RJbeB/OQUo8OwI5ySpDjwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755479791; c=relaxed/simple;
	bh=gMG8MJrWuk/qUqRkiJQCye5ZQGoAL+OWsy+X2CGo3U4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RnqQ4owEuYFSKx38W0kS/W+fn8rjyhyTGCVI0NCUiEsuFuUXoh89dsVcrWa1ZLnmoaWqVF5Cqtz3tqLF752nrmYIu7IvaQqmVsB4Roh87XfWHCbSIuPIQWq5TTdLbHup0saJgtz/IS7d3Cpi7EjFKyFVoMdbNRWD5z2JFYdXNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=VER+fHUC; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="VER+fHUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4Q
	SZcLqtO/Xp+X7K7U2xBjh39ylCBB34t0ZX+reOtO4=; b=VER+fHUCvOwatYkRUq
	e5/IrO0h1dcQyJfQssysPWbAlKNZ/j3iPi/H66cnVKFU2tuEgDIez7IdczjuQQrT
	65vQWmJGUocqG8x3hUDXTnZ9GNyfp+EN12BJgvR/pFE+2ldBQaF6Ef77U0w9K8jP
	aRq4JovbPkg8+HooEmWG9QMYw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgCXP2vffqJoivKvBQ--.57607S2;
	Mon, 18 Aug 2025 09:16:15 +0800 (CST)
From: lingfuyi@126.com
To: rust-for-linux@vger.kernel.org
Cc: lingfuyi <lingfuyi@kylinos.cn>
Subject: [PATCH] rust: xarray: optimize lock functions with inline attribute
Date: Mon, 18 Aug 2025 01:16:12 +0000
Message-Id: <20250818011612.1839789-1-lingfuyi@126.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCkvCgCXP2vffqJoivKvBQ--.57607S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw48AF1xJFykXrWfJF1rXrb_yoW8XF17pr
	4DGr17CrW5XF40vw17X395Ga4rW3ySqr45Cr4rKw1Iv39xJF1qkr1Fqr1SvryqyanxAasI
	vFyUuFn0vw4fuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07USeHkUUUUU=
X-CM-SenderInfo: polqwwxx1lqiyswou0bp/1tbiYA+tR2iiepRf+gAAsE

From: lingfuyi <lingfuyi@kylinos.cn>

The XArray lock and try_lock functions are simple wrappers around
the C functions xa_lock and xa_trylock. These Rust functions don't
add significant logic beyond the unsafe FFI calls and safety guarantees.

Mark them as inline to avoid unnecessary function call overhead in
hot paths where XArray locking is frequent, such as in page cache
operations and other kernel data structure management.

This follows the same optimization pattern as other Rust kernel
modules where simple C function wrappers are marked inline to
improve performance.

Signed-off-by: lingfuyi <lingfuyi@kylinos.cn>
---
 rust/kernel/xarray.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a49d6db28845..c96589f92927 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -119,6 +119,7 @@ fn iter(&self) -> impl Iterator<Item = NonNull<c_void>> + '_ {
     }
 
     /// Attempts to lock the [`XArray`] for exclusive access.
+    #[inline]
     pub fn try_lock(&self) -> Option<Guard<'_, T>> {
         // SAFETY: `self.xa` is always valid by the type invariant.
         if (unsafe { bindings::xa_trylock(self.xa.get()) } != 0) {
@@ -132,6 +133,7 @@ pub fn try_lock(&self) -> Option<Guard<'_, T>> {
     }
 
     /// Locks the [`XArray`] for exclusive access.
+    #[inline]
     pub fn lock(&self) -> Guard<'_, T> {
         // SAFETY: `self.xa` is always valid by the type invariant.
         unsafe { bindings::xa_lock(self.xa.get()) };
-- 
2.34.1

