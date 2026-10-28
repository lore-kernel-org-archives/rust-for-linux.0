Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152885;
	b=Q5oLU3Y7DL7V8A7Z80FySuvPHsoPRuAJqyV6+/VFIyz68QsXv1/UWNR/OTf3kCrKdiHc
	 WyY9RqxdrEQi1KuPwmoid6ok7VJmF+katTlK64Rt3UFn31Mqhtxpi/ZaxwfpRE6BCVewg
	 7H0BYGx14P/MM0QE1TCngmOEEfr04DciLP0NUTnG9cPZL4ExrM36v9kg1jFBKHqOdXcRL
	 wC1cyp6re7q4rYIca7+JeiMXfbKScuZyEBVLnYkKDcn36LKdQO4XOJ+vdfXVPRjcbKXIl
	 GjExunzqUdcJNYqGop0pwOkPcRceBVznB2+6zh7cPiPf7zMJN59UMHBTtBaJoQ5u51g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
	b=q1clPXNaoTk1G/mIVZyPdxX3zNrUY1B6OIDPwrGDLPRlpKuTog05Zty+5wgnXPWAY9sD
	 iWWEl8UL6P2wJNdKtu9YhLpKmZDnWbDQreXyfkHrK1kNMEoK8aeVoQoqGXQwhUL3GNgGy
	 UDEIafMoGYRFMHokTRWjXeviKhdqqrb6faVvpuiM0UfHaL/Uf921DGn3aXNkR2+AoO+aN
	 R7FchTe+j4K9jExYsiugo9TTokcIqzEUG50a4P2Os+LiznIOworRPkgN9jXKoJB3ErWAd
	 dq384oiffP9M9/nS++DBYViCjVGOuHrFnxbnFNl59MED2f8mclGtbKcEHrgVs4ujKqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCIFldmf;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC332606A31A
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 02:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC332606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCIFldmf
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso358238a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 19:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793152884; x=1793757684; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
        b=lCIFldmfP54RPVAjjtNc9qiWIwAu96Ler5NV3AdyWKulpIjTPxzytOZEb8rGpsMO/y
         ron+8M/MtQ1TRSJNpf9BC3HGCjebHu5rf/O6Q8pmDiZgJ71/Bryi9rW9gg14yYEXBzrQ
         Fsx7IXsJpIY1Fe2WxM+PCgfBR5ksQVVA2vz2TmGCb1hOrB6fPDJ9bEkdxW8RuUz7bhyF
         0fjymOQPJ72FD/EphsmdofcfiJlgiHbrxOBoeEqLYHinlzeiB8CkXWZ5NGvDz8DjliWm
         RV82mrK/0O3I1geD36XwqCdU0MWFH8YJKyiYT7qV87inCrZMbY5XttjnettMDtOEPaP2
         tsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793152884; x=1793757684;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
        b=IXnfFe3N9uAWvplMGuIlSXvGNZIN+9p0bR90jbxMNEHLnFn7IB3o1TF/BOEAg5ErV1
         cy3mJ9X0gBMDalKsCsVVgfp4VP+uxtHmuR4JHYq9CK8Y0DzGemWKjO1bJMKtZMiB/MXm
         98ZfbY8+KSyljuLlDfkpWzcvmaRtWyWjVZthFT77vaCZvlnwvpXdKGbwP7LFS+QCiFZ3
         ogfpLg+MSudroy4xkDCrDguDghi1RWz9/n+oIil7UM4dFRbJ1Ploy6rgBMcwbRPDgBbe
         QmFB/PykmYZSheORKtsqccJICFDsXkgYJfV2//uvzN/t4TATsydojR4mhi0LuZZqoEUC
         lNag==
X-Forwarded-Encrypted: i=1; AKwUvBwSycsT34DhT1/jUE2GM3xDDd3RuRWYSiG/FZrfC/Hm993vP1imy/vNj1xt9HoHaQZGD3bcVdVWXiIQ0xnzGA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7cmLLtoQ8I592dhJyYMVwzxMx8CpXSd3ANHkRmwByir/FIUsd
	8plmpewjOb/hjezFc/XptnM2QtCm7tH60AIG8DfwrNxcffrGKPv4l57E
X-Gm-Gg: AYBFou1eQTlbcfL//vbZNQ5OgURQLpc4t9ExYg1qF9gTGFJ/6dnD3aRDlSmsIQ236tK
	WvvdGOPjBYRubnJH3zFngca3aOEJDjLQPTTa5hvFCk5xLilUNwAZuUHucG44kgdq5s/55xE+nR8
	k6L7eoxb4MqMhsst++rkuN1cJJzSgr+25oaUi9lmIpOhFYj8vlDIqQ1g+Qm07uXBiPUhicXgcMd
	/1ESEeEUWLCJYWsbZMESnTrTGpCoVRu1KrUJ45U9lTUxm0dRpPD/PYxgh/BTB1TDAJ+0iqpcI0y
	9Zo0ptdaO85fkTExO5YDrq9RBGWfSwdvFEu2YnW+T9msuFP8zxQ+4U1oTLkzV1v+AesFLvEp256
	bNdXhBmTslwLFGuj0CrA+GxPotJ9jjN/Wccy452tNBkJyoRUYRwrBQIQczde4zTQTCuIgtnxqpd
	Mfh6e/ywAcWY8Ef7wWbDCOXTf1Np4shOEDune3J1+e1NqQw3qa865BKrNDb+EhsyBzS58FUmZ62
	geyQ5pX6h4zUXzWQ8+G3XBgsrvvu7H2Q+tq0zsSgyL0s2qvHKzdYM4=
X-Received: by 2002:a17:90a:d603:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae5823f4eemr499438a91.63.1793152883883;
        Tue, 27 Oct 2026 19:01:23 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d5efe2sm659155a91.1.2026.10.27.19.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:01:22 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Tue, 27 Oct 2026 22:00:48 -0400
Subject: [PATCH] rust: io: mem: Fix exclusive MMIO region requests
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
Message-Id: <20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE9X4WoC/x2NuwrDMAwAfyVorsA2zoP8SungpLKjwXaR0hII+
 feYjnfD3QlKwqQwdycI/Vi5lgb20cG6hZII+d0YnHGDNW7ExaN8dUeumTJW4cQFc9CdBCMfOE1
 9tBSc93GBVvkINf0/PF/XdQNf69Q/cQAAAA==
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
and bind fails with EBUSY. With the fix, 100 cycles pass. This was
repeated in three fresh guests for each kernel.
---
 rust/kernel/io/mem.rs      | 2 +-
 rust/kernel/io/resource.rs | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index 758ce62b3cce33c14e1e4c56a793af0e00657aa6..c99a2530186fc56bdc3405adc15d0801b98eae08 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -79,6 +79,12 @@ unsafe impl Sync for Region {}
 pub struct Resource(Opaque<bindings::resource>);
 
 impl Resource {
+    /// Returns the global I/O memory resource root.
+    pub(crate) fn iomem() -> &'static Self {
+        // SAFETY: iomem_resource is permanent; C serializes resource-tree updates.
+        unsafe { Self::from_raw(&raw mut bindings::iomem_resource) }
+    }
+
     /// Creates a reference to a [`Resource`] from a valid pointer.
     ///
     /// # Safety

---
base-commit: 8a36f53fd5ec3eff01f1b637d42cbdc3821d0493
change-id: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb

Best regards,
-- 
Kwanghoon Son <asdfkwang@gmail.com>

