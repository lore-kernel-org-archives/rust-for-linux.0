Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDF2EF667
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704290; cv=none; b=EdlcWUTDkOcCYI/Fn/99n6QUtfdMiu6MSyy607qcRKY0AZcpMDMo4dzIc6WFu11Q2SPeN0H64UUcfco6Oy9euw5X6cy7pW6RMI5HcnBSgcb4f0eJHHL11yvzHPpNAg1iWCHEUxXLvxerF3ygv/NoIgXtPaeoVR0SuRZkDCi8rcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704290; c=relaxed/simple;
	bh=+SfSvQ9a3Gi5EHmtxkYRqPc23ohpJeYUKHNRZolLHsY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RMzHcW7OKDe7bxhj0m2L+aGVHELiHj9FhUX5/bdBxunyyTXlMTq8QuytXP+tqfFc9Q0pIQVLbFd2dByJG6POKaSVIoicSbiCFaK1seBbilYDE2vrafydtvtcJC8KHYefFCc0sks6tU+y+AygVgHPlyAWgsGrlvC7LGnUtOG2pXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VPHIx0gz; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VPHIx0gz"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2ad2a58cso2773086f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704287; x=1765309087; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7DBbBwSHYJvs4uN8+pltwzqNRUvBGXX7QeOpCF5FEA=;
        b=VPHIx0gzMPa6ZmUbQsgux8Q1tY6uWRJLgRt1leSXcPiyZJCi23GCRalkuYf0oAOCjl
         HPmbUVPk9XZKKfzzzWUXY/lXtVpLiI4R64iOZPx0Dm/w2u0kdKE4+uP0KXr7vX+6pHrb
         7M66nsu/cHoAoaxrlcWsDODXctVGtQIKoQ4HB5RhDOEGPbST27kFWODbxepRnn/HQ/LN
         nmelB7yhM8B7rqY6F5e5yFWkp13TrF3WvYsnqSNN7etA8DhWDscpVkc4FMLG1Lv2ERWE
         uj6AX1Oq+93x3fc3Z6HD+J0q7CK1rJFkQvgjU4u4aLS6fcx/2O+O3iZ8FIyY7H4uXcKS
         UjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704287; x=1765309087;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7DBbBwSHYJvs4uN8+pltwzqNRUvBGXX7QeOpCF5FEA=;
        b=SCHPljpEfEVp7IMWgU4gYShwLjbChXOBD6BAHlCz/Fwl8FPTQMOooG+V2BiUeTPqxB
         blVQcaMXCPWYXO7GcllYp/7yIRJ3HcDZZK1g0ek2sRniHsM8tRvgzF4zzpLh7fsPrDhn
         G8/vM2ojiy/w/khF60vnpfZUt0SF8vOLgSz/XPL8oYkyCzBTNdiVCuRq+dUZLBb/PxYf
         vg2A9i9amMPaFMdSvH2PgzcrpfJdXQpJLxlQW2lYovIEvIrlazyiLT0dPjbTmOrQ0RSr
         icsmpdAKXdtzM5pBlcK9oQkt5EzbHCfBzdfMT/fGOa1QjjiNWXVeVEDPtnh8EFldUNzR
         5NWQ==
X-Gm-Message-State: AOJu0Yw5M2DKj3yDXP1KmdQXmi4KDwY+VCHxh4xMShdI0I77jNc2oKNP
	NoDWERby6tTA2j1zxxH/dLbp668I7khNQr7v3hvlfpesCB3187zqwAm2glbfHk13iggfK4rMR1Y
	vPtm9Xw1PsHOqIxDHH/xA9hP1zd4FGV7K3tnE7Ktd1Mkbl6j4KMUfVW/Mqfyl9xB1qX6FxoerPe
	DfmnISbW/UfhWG3neg2nsM6TPPpchmgOxuj2NR7Jz4+TG0hh980/lJvbMpmDPR2bk=
X-Google-Smtp-Source: AGHT+IEjaHpsFZDrlVbXI5sJtXIxbhUYn2waQH/CPwvFsgbb1WKNxDpythH6IMJdXZYkDRIN2sXGCSOjCIJ0XeA=
X-Received: from wrrc4.prod.google.com ([2002:adf:fb04:0:b0:42c:a418:b2a0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c5:0:b0:429:dde3:659d with SMTP id ffacd0b85a97d-42f72245bc4mr363105f8f.47.1764704287370;
 Tue, 02 Dec 2025 11:38:07 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:39 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+SfSvQ9a3Gi5EHmtxkYRqPc23ohpJeYUKHNRZolLHsY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AIe2RZqlnuFajzOCQAhWFK/hXXG78SFuN5E
 Qjn2q7/C26JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACAAKCRAEWL7uWMY5
 RnDrD/99yl4liYwfGYqLBcR87C08EYFgHLM33xMyV0pxRZmFWUu+GboMaZmwDyi/7A6A9RA/2ZH
 WPjdVD4L9k79NSfLicyHhG6QSr25wmvSGeFx0ga/OSaOHWRwRZsuYC1O7hHnzeTBN0gfjLsLW1I
 Da6tQfxQ/SYf0r3UiMIP+sGb44EOBG3wuLrXpkkACZas6jvxPz9rPD7WspzfTArmlZbJNtlxaD3
 OFnCZyNzNGu5rM5jr6ANVD+fUpPZGAu2TviEz8095ALx/ZnSmD1FqBp4m6n/xEfWkj22XZr+z2s
 mbVd4WVpXzeyGqaCNvgoNdh3ujW0aXcHZLrwGJs7pfa6sDbwOoNnhynJHjatXY4LuVOOuuotb7v
 zFRKWD9JyGDx7btSsRD3/iXO4dnywlL7eLhTLbz2CmaUhWm3dfoMvQdh4zFAY10jN/042LmwR/C
 363ePx4hYEiw4NgyVqfTSrUGmLslUDx5ix2UT9k4dRD40aJjlZCVqE3AFahtx0xvyXhMX8SJ8VN
 AC669OZ+6eX/65PzCHOD/Purv2D4PDJ+a1YUrrGrdOu57ECKYDeZl0uHO0/0N90GrQgJ2RbQeHx
 4573EmnD15wAnAJ6s1I+oBY5nLOUGFIgLxTZj0FHD5MKXYcs356gGWZ0+k6R1VimSlXS5ctHtt4 6CMO8bf9sQ+L0eA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-15-a2e13cbc17a6@google.com>
Subject: [PATCH 15/46] rust: dma: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/dma.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
index 6e741c197242572844fe550de4ddcd93520cbb42..8c7e8d7b888e3fe456b50cbb2a75306cc2a6cc2a 100644
--- a/rust/helpers/dma.c
+++ b/rust/helpers/dma.c
@@ -2,20 +2,23 @@
 
 #include <linux/dma-mapping.h>
 
-void *rust_helper_dma_alloc_attrs(struct device *dev, size_t size,
-				  dma_addr_t *dma_handle, gfp_t flag,
-				  unsigned long attrs)
+__rust_helper void *rust_helper_dma_alloc_attrs(struct device *dev, size_t size,
+						dma_addr_t *dma_handle,
+						gfp_t flag, unsigned long attrs)
 {
 	return dma_alloc_attrs(dev, size, dma_handle, flag, attrs);
 }
 
-void rust_helper_dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
-				dma_addr_t dma_handle, unsigned long attrs)
+__rust_helper void rust_helper_dma_free_attrs(struct device *dev, size_t size,
+					      void *cpu_addr,
+					      dma_addr_t dma_handle,
+					      unsigned long attrs)
 {
 	dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
 }
 
-int rust_helper_dma_set_mask_and_coherent(struct device *dev, u64 mask)
+__rust_helper int rust_helper_dma_set_mask_and_coherent(struct device *dev,
+							u64 mask)
 {
 	return dma_set_mask_and_coherent(dev, mask);
 }

-- 
2.52.0.158.g65b55ccf14-goog

