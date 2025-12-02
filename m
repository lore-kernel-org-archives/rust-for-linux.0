Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746BB2FF662
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704317; cv=none; b=J6UITFq1rAvm9kgKYG8k4wSlxhhlbd2YSTmwpuXuBjst8Gcyq2bL0SpXlLHM4aC22FbcVbZfIM3ArZYRQUcNJZvcHAP/7nv8AAY0D1I5Uq4nX8nb4WU7ON8IjDxvc6fYVE674NMaeBL1jOKvZdCr0jVhDqqan7sEQSCBpjnYnmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704317; c=relaxed/simple;
	bh=hacth0a4406OsghefqrhaXrbvUZUuOkCCOw+ddGJ0s0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tp0I0jj1AxxBdiv75Tc3B/1W13bc4TtAIaY2bbZDYPdw0DgJEfddJLZE+FPPWxuPs0O6Fs3g2v2Y9Pe6JjNjwu/gqcEzgqEwuNqngBqcxgVQuuuPUnq5mQnYaNT6p+kgdu9dByOYSYGhHCCOOSlvu7RwpOH0idzezTjp+ATRuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t26h38Zj; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t26h38Zj"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47799717212so44389805e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704314; x=1765309114; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0d/eB1fQs7rmZ4HCfQGDjpM9sRegrHBa4mXJBpgTeY=;
        b=t26h38Zjgs0Q84gtp5umcfdQuqQmaOXmjq4vnpkSbxkIJ8jsP4AU0FilCkZAbqFMNL
         w2wdXFJVYugBBRt42rTMxMBfJCGLPe487Zood1l8M+4bFLNPfbfZ8HF3aZv4hBtKblk7
         VcL+C7uleYV/sQzF373Xkixo+LoR1GgmLorJin6oFDjeD9ocoM/NhBnIIOYw8w0txQs7
         hsUG81ofDqcboi7kh7TODzoKVr7enkKfyuYcM2VHTpDe0Z55wSbCk+kXSuBqI2ictXQe
         ZIbxI5L86Kno4m3t+cBZ+C5d9WmfmRzEMrU7YMYp/Bks6eie1dqcbd7mj4LRzJIrRMH2
         mTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704314; x=1765309114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0d/eB1fQs7rmZ4HCfQGDjpM9sRegrHBa4mXJBpgTeY=;
        b=YBIMKQ7NW7JDAuXh0+HvxQi3hhYMUmbzVC91xBpmwyh8fVItKyopvgfl1NxHuKZlHu
         OGZDhIilX9mqich8zIO8l67xKZxyHNlx12aYcfKCR7AvwV4rm5s2lmobN9XBcdm8UNEe
         Ko+OzzDZG9nDp3p0DJT+1mIb7sRcPp5SXECE7DFxj5JEqPULS5uC9mTLcGDIVidvMylN
         5nqnCbou26Da+c/Dh30txE1INvs7bX4h18e1oUHANecvfxNzFxa0C8mppy8l1Dsa3hsl
         j6Gio4rf4VNS1b7yy1mW+WmQFf9rW0bWlg8TkHfA9s1UNQ2G1DtxNZEwGi2VAjCHMBv8
         epaA==
X-Gm-Message-State: AOJu0Yywk5UwEfg4uS4wzG9vrL5vDjzjq/i5QAd5glNxlFLsTX5FG1v2
	buQ5VRsmDq3Czfvoo4ATU0jmop4othDxKYKsU5LW7Lj4+s3aTbWw1LaMEhefbTYA+pR5CdGvzz+
	tJN7IOq42qhF3fvS17/Ag/vuqeBkWfz3qXThL+mIzrtw1bkmaZHNk2N138VVROfxMS3MOA4Y9Cf
	PqvN3kHzOr5fuUSdEjnMlrUDtu6bymc9OmOCpUxJYdSSPT+1/IDz6QcQw3c49zq40=
X-Google-Smtp-Source: AGHT+IEUt0FSoBzuBFrcasSDgVBUsrlmIcOrWYcQeE4TNGcpmEOOlvRtAB+gaMtJN+SzZyh0n+Z+Nn06zAVJwGQ=
X-Received: from wmjl7.prod.google.com ([2002:a7b:c347:0:b0:477:74f4:31c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1546:b0:475:e007:baf1 with SMTP id 5b1f17b1804b1-4792a61e69amr7187575e9.34.1764704313881;
 Tue, 02 Dec 2025 11:38:33 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:00 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=hacth0a4406OsghefqrhaXrbvUZUuOkCCOw+ddGJ0s0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AKs2O+Z4UTuTs8BwpKb9vwCtZhVAMeOrr9M
 CRguvvPpiiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACgAKCRAEWL7uWMY5
 RkhUD/0YPrHvYLxp+ig26Uz0JITkGZEKUa0QxyZk7J7ebLa46zmWKFH9l8Tr8UMTuukfGZz1iq8
 p0upCEC2TAT1aPpsyiWJXBjhicuHi2EvPRMuHlbeXLH9nfywdD/NPSjGM5NU1PfnxALcFZfhmQy
 VuJqD66Mug2+jJD24nofxC23zdzx+PxBiiQHkpZh9vuorBe8sXa+culjq8DaMo9sleG33RUiaAK
 rus234m6bmV1PBcC+q6GZmUhCk40u1BOLqOe1LJvTAkVNl2ddTbwlnC+BA9Hu2Q/mksFXl2Mq7+
 8IGiftKg/Y2G+hae9Ho35BUmBcvuXkqsi1lVbZYtjqPNe2oEvt0UqAIrBGnpH482vdUqs8k6nQ5
 e1nc9AP3jHbWgc+j1ThG160kwkH6kOgwtKVNtihnpB99OIdYg2iddI/RtboyYzp+mYR6+i1PXpf
 jXfJX7XI3BGx1nVUUHCdgSGqOKQFSIS4CXmiJj5txt/KG5XG1HzVr4xvZ6hUDWPh0aQ/09QrkCb
 eRKk4iibMK1EssPCW7LMN0+suuaVarLylmA5VFna9EXP7DFRv+Wzcv1WLECHaul4LIOblcLXvKe
 LUxrh+0LBKfcychaFbwstC9R/LHW+FHru7dxXkGf8Mq919wnBhVmPLh7vvbaxct/lBwc5Us40D0 9rVPqtKhsX8KdCQ==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-36-a2e13cbc17a6@google.com>
Subject: [PATCH 36/46] rust: scatterlist: add __rust_helper to helpers
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
 rust/helpers/scatterlist.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/rust/helpers/scatterlist.c b/rust/helpers/scatterlist.c
index 80c956ee09ab4119a0951709c6f339a2a2c23894..f3c41ea5e20162d670d37557165de71325356351 100644
--- a/rust/helpers/scatterlist.c
+++ b/rust/helpers/scatterlist.c
@@ -2,23 +2,25 @@
 
 #include <linux/dma-direction.h>
 
-dma_addr_t rust_helper_sg_dma_address(struct scatterlist *sg)
+__rust_helper dma_addr_t rust_helper_sg_dma_address(struct scatterlist *sg)
 {
 	return sg_dma_address(sg);
 }
 
-unsigned int rust_helper_sg_dma_len(struct scatterlist *sg)
+__rust_helper unsigned int rust_helper_sg_dma_len(struct scatterlist *sg)
 {
 	return sg_dma_len(sg);
 }
 
-struct scatterlist *rust_helper_sg_next(struct scatterlist *sg)
+__rust_helper struct scatterlist *rust_helper_sg_next(struct scatterlist *sg)
 {
 	return sg_next(sg);
 }
 
-void rust_helper_dma_unmap_sgtable(struct device *dev, struct sg_table *sgt,
-				   enum dma_data_direction dir, unsigned long attrs)
+__rust_helper void rust_helper_dma_unmap_sgtable(struct device *dev,
+						 struct sg_table *sgt,
+						 enum dma_data_direction dir,
+						 unsigned long attrs)
 {
 	return dma_unmap_sgtable(dev, sgt, dir, attrs);
 }

-- 
2.52.0.158.g65b55ccf14-goog

