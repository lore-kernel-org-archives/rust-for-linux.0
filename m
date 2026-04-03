Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C4346A0A
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775251750; cv=none; b=ucLvXAEJS3QF+CVwIcpWppaLem83qDL5ftWpp2UzvrZvJ4hZPyEpTRNbjKxq9ZI/kPInc0EnznS6h2OMMhaD8cN9ZnSIMdEn+n8M/Cyb3xrHTgbjjD+2YDc84mpbWfW9lp3yJ8UTj1ZPsOPSMyOowcA9ZS/cN+gcD007v205SUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775251750; c=relaxed/simple;
	bh=Ox3UuQdkMKEHg6JNiBb7kjGglPmNTah85JmC94qLAOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfrJsyyYKyP96BkBi1Uvo32nIOMrppCdtlTkVak6kWtX1ePDpfm5YGPG91t0/8rSyeYRfytpMc3fquLWjfIYXqUXeVPq1hWTs/otuum90rV7qWCQH6t/vOokKTtGdtlr9fHL6+FZbLkYIMA1TFWhx35YijgfFKdlmFc54RrI1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTYIt6sf; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTYIt6sf"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1274204434bso2710514c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775251749; x=1775856549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViRMffOfOvJYtVVzDZMmnf1RPEi0BVW89hSG6CnDeTI=;
        b=mTYIt6sf07q7oUjVgRD/TxaPLY974m67Y5Y3UWkzJUrG6rN7r60LGZ4NTeWzTXGHOp
         X13/m5gviRf/S62kv06ZePy80KWRVpqFB4vnYaokwchgI9EKsIplG0Jp3rVfhynQEbhs
         TQ40ikTAHC6HxoWLQSjJ/eZdSS6RZnewQZ9PGh2ovhcqPQ2psOZirM5VxljLZMP03nc+
         2Ert+gu5dH1mJeBvk3Fqupv803K5Zk9rV034Gv3RCiowpWHIEJd8INKCFEjW5SF5Atic
         H3QlCBrtbbS93GPnGmdvEwG5ylV6hrPlRfjYgcM3E5E5Tm7044o0ms6qy3tJggUVo1yi
         y8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251749; x=1775856549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViRMffOfOvJYtVVzDZMmnf1RPEi0BVW89hSG6CnDeTI=;
        b=BeyduJmkb7uPKMFWo8UkBL+dbF9pc0Y9/dOqKnhOy3q3mzoJRc0K7pCVlIZmPA/riE
         yv8EiovI4XeRjNRPMwRqXuiabxJ9S6vkRulVknY8U4qvyjs9YEizTp/OHymPWUiqGB7m
         jfx0TQEPciCGV0KqLhI+oCfYHRt2M3TPcsapXnMFsj5cRvpYDwuGTzJnWtMYMY0mBwoT
         6JipvUNiqI/UdY2vmLnWYNrR+Bh28kggpiwsPiGsK+AvXdgN0A8IMq/kfsRVCs8Vr0fS
         Nx+LS/bMXR3RwSncXpZmSsC20hk1GqtuZx0qW8ncEnFCEvsjrGhnXvWzrGR77CKbQidq
         ci6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXC8qwzr+jTYYb1fS/MD9k8ySAcw84tNMPU3dDL55KDTGeFrDvsSNhM45V0limVj1v3qjNi98Hx+mDroqoVQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUAvPJqOcVcUsHBUzJfoxFEnq+uoSFDIcEUqk1BKlYRchx0X3
	q5obduQ3HWUJU4h86gqpsPoVpWqx15Gzko8djyGR/APvau5n1zgKpAyX
X-Gm-Gg: ATEYQzxjGT2u99/BRLf3bvepGzrNA9m73pprXietTAwpr4Ripjl/ZF2Cbeg76iQcNpo
	2Foch/hYZ/knxK9n/Xkie/iaX2Rbtr2U4lEp6dpulrgPedvdOcN51n+9MiDcUr43If6R9gF4ASK
	iQPDvQK7FhdbADoesuUyaGWURtqtHn2CWauplGt0uuoG9mX+8fghoxS0bymaWTKBzip43rRDkRe
	h1pkiU8K4rHImq2eF4rF67t5BBoPOF0Jgz94JjwHnMExvwpy/rAIxH0c7Om+FoaK/9JAdJgPnLT
	0v9Q/f2wRzJcuYmIo54K1s8JNWh+BRzFDXXEWuqaoXgCAvMeaEZBK3xF2ihwJ2ol5C9C+erP0M1
	Up/n2t16UIUe+Ifxbqi+AW9vSyZJoExe1eC/JFgkGPdbPhjEaAXodyY+f6zF9FWrc+AWqabO8gI
	aZFEISHGRMx+ByRqBYZjA2HyWjk50xlLFd7VHrMyXM9zpRMxMvnLHX9YFVgJ87hpS9AMeckuL5
X-Received: by 2002:a05:7022:927:b0:12a:6d05:3941 with SMTP id a92af1059eb24-12bf0599936mr3116316c88.2.1775251748584;
        Fri, 03 Apr 2026 14:29:08 -0700 (PDT)
Received: from ar-pc.lan ([2603:8000:bb00:9b3f:5094:4d4:5bc0:f9f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f542sm5462263c88.14.2026.04.03.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:29:08 -0700 (PDT)
From: Aditya Rajan <adi.dev.github@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Rajan <adi.dev.github@gmail.com>
Subject: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size overflow
Date: Fri,  3 Apr 2026 14:28:22 -0700
Message-ID: <20260403212822.294288-1-adi.dev.github@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In alloc_slice_with_attrs(), the checked_mul() guards against
arithmetic overflow when computing the total byte size
(size_of::<T>() * len). If this overflows, the current code returns
ENOMEM, which is misleading -- the system is not out of memory, the
requested size simply cannot be represented in a usize.

Return EOVERFLOW instead, which accurately describes the failure. This
also distinguishes it from the actual allocation failure two lines
below, which correctly returns ENOMEM when dma_alloc_attrs() yields a
null pointer.

Fixes: d9aee73c56ee ("rust: dma: add generalized container for types other than slices")
Link: https://lore.kernel.org/all/20260320194626.36263-3-dakr@kernel.org/

Signed-off-by: Aditya Rajan <adi.dev.github@gmail.com>
---
 rust/kernel/dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 4995ee5dc689..179bc8832947 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -832,7 +832,7 @@ fn alloc_slice_with_attrs(
             Err(EINVAL)?;
         }
 
-        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(ENOMEM)?;
+        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(EOVERFLOW)?;
         let mut dma_handle = 0;
         // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
         let addr = unsafe {
-- 
2.53.0

