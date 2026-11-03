Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668089;
	b=gxpp00eyN5DuPFQSGPdo+FPdHfro9Br/hTzvTZqtcUr8Eg6H8XSPBXrglM0WX2FyAu4c
	 kLf/LcV4XSWq8EUNyWKnR0un1s6yvGqKdeK3XTnfIBj04cPJwl+Qe+tUWoyVn2WMiwoys
	 WyJTjsXnW0NMli/PosN10V96AdFrDyrFFqKlgvBr6F7pqUQZ/YosxGZcg6SBpFbzF7gqj
	 wrHpwrkER7ONE8xfC7yIY9T1IW0J2+YdV+xkW4YmYlvHjzAybRWY50VaVeILRF00MeWja
	 +zXiWdm/7NVLU+fNJ313C36lVj55I5pINbIRzQBK9l0IWYB4g5nYM8+F0/bqyTUdrDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=sCXed0bTTCV8P2hA4MxIlPH5p5mePGAlnGMC3T5qO04=;
	b=R2SXQUTAxwIyP0ySMo8Kw2Bal9XRJD2mD1l5gDomFG9bnqeKYgs3iYquAlyQDsmNNYd7
	 bIfbPXVtgikGh/5RjDODiRR8X6lg5dbuQujs2/CLmNK62SDydGdYKwBqtVU70QDGXjto5
	 gy4CKUVhGMOChPbIdsPj+wiIzjtJbc5Asyn0B+IfIr1X3FlQ3MNp/fJ4R9mKNhWfkEQaU
	 fJ+oAVRxGxSDUYB/Z51BjYwTcnEliVn02wRYAZdWwe/oW8VhVCGbXeDuVXHH9injWZOhW
	 CSiwCm5l6/JFEyw0DqdcqgAC52Wq0u/m18XblKXJ7MmV8P3iG24yXng3mC2+3d17fRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwPjtRkC;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F5D606A327
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 01:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwPjtRkC
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso5917104c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 17:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668087; x=1794272887; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sCXed0bTTCV8P2hA4MxIlPH5p5mePGAlnGMC3T5qO04=;
        b=CwPjtRkCE6Ax6PVapAd5/LPmvl5NxKj4Trrc4w3aBkA8ZPVd4BDdhiy/Xqx/gGaC+a
         HeuEYxgQQR2MCzUdm8H/u3bhUPxfNlK/ryt2dqpO9+J8gkIM0PkWkW4yqX47ZqLcZhEm
         L20ve+bBytciCdp1nm2FVya8bGOAAhr/66cKOA3pqqwhmC+BWrc1PD5NHCPidXiSGJqv
         3Uzan+oIPkOCtJfSe5vNY2jvKYTEVOk034pZdOY6LQR5AgVUxOB+OwI2wKLNxXPYYAN5
         1n6LHG4SHNYUc5bCV+EF3wbMeUu59ot1+mj+bi5xyMewVOQLF/27kRYuFaKKZaFG9dkl
         JWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668087; x=1794272887;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sCXed0bTTCV8P2hA4MxIlPH5p5mePGAlnGMC3T5qO04=;
        b=BM9rVzmKmgpKKkzLjvJFGCmQhaIkbSulkqAs/VmUTT8GeLNJMBXgiidPwYj+5DXtqv
         Y0MTJx4I04PXPrN5M5Erum7j/dA/XSn1kF70vltFjTD8uN3mGCpltBOCHHgkQTfM29FZ
         D+E8kbhLQCnul+ucN24/niF7QZn8RxlPSA0/CA8NzsJw7kHEk/JMHJtgG+K1lHIQKD2h
         WRnBOV0LhqXFVcVhu2WI1uiCIuCdMxPdfh3beaayppy3UDvMVG6EPDzb8b4VCgMcg1to
         FjOWpTX6Iu8gQNr00fEE8UpbRZkHZSl41MgViYG7uSgwa5rg6I2cYaHGVx0PNTkN3aTP
         zKbw==
X-Forwarded-Encrypted: i=1; AKwUvBziNWLEDz6yifXlk5Y2nw0DaeHnVwtVJVBXIqiDO4CY+SQSZpoK13un6sg+F3VC0vfMqV5BYeS9qK+3pyGoBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbplfVIW2J9J6A+bC4KGw3FM2aLNOhWYrmTlpI03lTyENGDf0a
	dXlnEvttgOte7Zgrgf4kvPhSBC/yxscoj90ntMp4UX0kQzS6JLxY5zit
X-Gm-Gg: AYBFou0UCgRhuQw8hP+azK7mhcJ/jcNC7T6Ayi9DjGhjao3dzrQFszXE9Yv76Xf2ZWK
	pY2I1oks8DVrVu5wAO1bUYHvFIaj3aZWyed74ABrf7ZqpR6IUDFVh7xldiA+WnpfgYPOewppsJQ
	ljiPqagxJBLEZEhkqF4L529H7icDA5Ny3kYqUkb18nfq6YTSpa4j3ZxKvP9Q8OCeE8gm0sA0xug
	l3Kg0nn3+bYU338gXSDhAFe7Yld8nbO6FL1rVwilMnY2/W9I5s5Ua5uB3pTqZCO/j93czhzZnZo
	QlY25+b08rhIksvLtxz8I+cOT0p7LsMQ4z2G3+Q0dK5qecl6dMqic+20i7sFysPr1m7GHIuDpWy
	gkDmZLLLEL7iFNeMbqpblDOjAa+tYw9GAaa1XiMjZhWbEk2V878Ax9cWSnXA2TGc6QA3rs9OBHe
	sy7/7wujP+Y0X/BSK6HrIvYNxV7Z1IRS22MPPkxA9jt5Gltvkiro+5o6gLLlu4GHgdoltt5YlTC
	UtYDdpyb0yyHc71aNnq48TIlPMunhcHINEyetgaIBuypuk+sIzEPRJ1V8bo9LOWNzGDY1cTMLGG
	NxiwnAaga3kgrHxhc3zeBoDRBbRy
X-Received: by 2002:a05:7022:f116:b0:187:7514:47f4 with SMTP id a92af1059eb24-1ac5d1cec2amr15160722c88.46.1793668087325;
        Mon, 02 Nov 2026 17:08:07 -0800 (PST)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm36500389c88.20.2026.11.02.17.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:08:06 -0800 (PST)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Mon, 02 Nov 2026 20:07:43 -0500
Subject: [PATCH v2] rust: io: mem: Fix exclusive MMIO region requests
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
Message-Id: <20261102-b4-rust-iomem-origin-master-fix-v2-1-1428247a94d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN4z6WoC/42NTQ6CMBBGr0Jm7Rja8Kcr72FYFJyWSSwlUyQa0
 rtbOYH5Vu9bvLdDJGGKcC12ENo4cpgz6FMB42RmR8iPzKBL3ahStzhUKK+4IgdPHoOw4xm9iSs
 JWn5j19VWkdFVZQfIlkUo30fh3meeOK5BPkdwU7/3f/emMK/RqjakLq2xN+cNP89j8NCnlL6JN
 g7wzgAAAA==
X-Change-ID: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kwanghoon Son <asdfkwang@gmail.com>
X-Mailer: b4 0.14.2

C's request_mem_region() reserves MMIO in the global resource tree.
Rust's ExclusiveIoMem reserves it under the device's resource instead,
so the global tree may not see the reservation.

Request the region from iomem_resource, matching request_mem_region()
and the existing release_mem_region() call.

Fixes: 1d0d4b28513b ("rust: io: mem: add a generic iomem abstraction")

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
The bug can be reproduced with QEMU arm64 virt's existing DT node
(CONFIG_FW_CFG_SYSFS=n):

    fw-cfg@9020000 {
        compatible = "qemu,fw-cfg-mmio";
        reg = <0 0x09020000 0 0x18>;
    };

A small Rust platform driver matches this node. Its probe maps the
resource and returns the mapping as driver data (excerpt):

    let io = pdev.io_request_by_index(0).ok_or(ENODEV)?
        .iomap_exclusive()?
        .into_devres()?;

Unbind and bind that driver again:

    cd /sys/bus/platform/drivers/mmio_repro
    echo 9020000.fw-cfg > unbind
    echo 9020000.fw-cfg > bind

Before the fix, unbind prints "Trying to free nonexistent resource"
and bind fails with EBUSY.
---
Changes in v2:
- Guard Resource::iomem() with CONFIG_HAS_IOMEM to match its only
  caller and avoid a dead_code warning when I/O memory support is
  disabled.
- Rebase onto 6628e7d4c6b2.
- Link to v1: https://lore.kernel.org/r/20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com
---
 rust/kernel/io/mem.rs      | 2 +-
 rust/kernel/io/resource.rs | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 32a919099dcda79bc4b795a8a1c5f553c989b9b7..80da665821c036257900c6ea45b9419cb573c187 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -196,7 +196,7 @@ fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
         let size = resource.size();
         let name = resource.name().unwrap_or_default();
 
-        let region = resource
+        let region = Resource::iomem()
             .request_region(
                 start,
                 size,
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 758ce62b3cce33c14e1e4c56a793af0e00657aa6..d61ad63428679a87b26a79c5ce822c5976a8b82f 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -79,6 +79,13 @@ unsafe impl Sync for Region {}
 pub struct Resource(Opaque<bindings::resource>);
 
 impl Resource {
+    /// Returns the global I/O memory resource root.
+    #[cfg(CONFIG_HAS_IOMEM)]
+    pub(crate) fn iomem() -> &'static Self {
+        // SAFETY: iomem_resource is permanent; C serializes resource-tree updates.
+        unsafe { Self::from_raw(&raw mut bindings::iomem_resource) }
+    }
+
     /// Creates a reference to a [`Resource`] from a valid pointer.
     ///
     /// # Safety

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb

Best regards,
-- 
Kwanghoon Son <asdfkwang@gmail.com>

