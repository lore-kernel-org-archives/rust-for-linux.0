Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234301F63F9
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252723; cv=none; b=C9/OIZaz1mCN71/SRIUTT8FHxdV/G4EniNdh9Zf4vf3P8UBa9fAEOvPRzXB1RAJ53Vn3mYy60ZlgEzWEKPCUaVw9NQD4tm5imO0ZbmYKiHzQGq++MGaU5PgcC3sNuPPzB7+3YTaIq6r7NYGCoRyI1VNO6mYXIEXLbfQv2qqeUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252723; c=relaxed/simple;
	bh=DbEVDp/1daO+lIxwr/wlCt81cejMYnz/EAuVZ6biFZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+3cevWw1UCLndRqYP/JZgRsVgFL+u1S2kVubW8Xgk03OildwDxQr9fkfosudk0RIlk1GE3baYGWUBUhy0X+iFB7mVZQ1rtVKW7zmKlkv7EJFlHx5/6nko6n5JMl8/cCOR3ArTr3Rleb+s6TQF9cfVw1eUFO12PKTmXca6YmxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItMuDfsE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItMuDfsE"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso2579900a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761252716; x=1761857516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UlHNTGv7yFHhaTac79ENYscEry1rz6cX/llqQj2Xi4=;
        b=ItMuDfsE40bhK4d0C1KnUxRcaqHSxB66UXgLtYAMWZs4GHdHYnss1q+ghF62UTzYg7
         UGn5teQvECvyJrXN/4oCZqO4wx1gQ5FJwjlrdDYNO9tkzYZ3qon4QkAgECxwtTx7EbwH
         hLcH7Vh+9jhLTxuLdL7p6hR71q3hGBRKvSeOebudrMl6EaOZUlY2SE1rEiLWlccLiVGo
         VTK/NMyoWEL44vqAoRBvFaxIrEWQlLWCu8HJBAMlRV9j1SEZzKFpCF2jxxmrIfDk48fM
         3GnRxe1zvy+kq7XdB4leG5QjkYD4G3+mlOYN60ckuTd6gM1L1PVH6ZKrC/g6NTVjdQUC
         aKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252716; x=1761857516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UlHNTGv7yFHhaTac79ENYscEry1rz6cX/llqQj2Xi4=;
        b=aeXLhPt9T9eO414cEkMT6Vxw3R3v4nsS0qoocRj3NyWScmgX0oAfCAqFwQ/PxpB64u
         pPoJ/nTjntxaI6yFDb2defBEeYf07BSi00HnrQkl7zNbMv4O0GGIMZXISCieF8yl0eCP
         9zxnpSCSYywXhROZ0xpe0ccW54HfC7Qxx/4v2h9h35iiUr8V7GpEqHvpB8xnPqi1oLFu
         lM3WbypDlJzTOUQL6dmcMxiMlvMqz2CbNjjt+0ENVIlzGrBeqDTjMpnOmRu0t/Qif1EO
         a7bh9sulz4v4x4OrwaNjSfhOlr6zVCHVZ1g0+Ypw73APEw1VZgdNZZJCaTljYQ4FpzPQ
         CKsA==
X-Forwarded-Encrypted: i=1; AJvYcCXTfZvwX6C9Z+VTV2dQFCbH7J9iKAS/nPksgJ7kf1pQtxYOgqdDYwcQHP/9wcO5+WJtTpaE7zLihut2uoeFxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQZZim8G0kjpgwoCqJxRPF0v9+nZ/VX8hOpUV1jf8W006Sjd0
	fc6sHrIp7o6pJOOTI6PlYOQ2ctFRq/VAaqbSAKzFq+Wycc9uq31wNsK7
X-Gm-Gg: ASbGncvbrG5UePyBe3f2dLDyPQCZpLzBuSETT/fRXHEyYSVwmkYDUhLX2vU8BvH1FOI
	idaNz/grqkN0x22tr3AfTVyJvI6XKiPR4sEySVdywLHOOfg4hRFUU34D2JBGszxdw8GkBFvOImy
	om5uhi0Gy+kxA2InuxrTbXr6QV+QXRRCpImhZbLP0yg7zqHImr26+0pLWqoD6fEupNrzB8p7lz5
	fWLFhougEd2GNtQPZ2WCMS6MVguCW1sKrffPzT+1elywDljm0YG+D4nt0K4LPDtMyj8ijoEZD0+
	PDgUFBwQgDDi5YGFMfy27UFa5AhGTRF0eDQlY5mJhJdk4CHzOmPjsgNLbvs0FomWTKTpyp9addK
	5rnEx7B0D2k9DVjGpOPhBwsKUhMFbjwlM4idSF/MQm3nIuFqUmpbh66xzC0vRieoCbn62KkFitM
	2JonecgtHX3r1xI53+ug==
X-Google-Smtp-Source: AGHT+IFX0S8naZatH+IeZ+gFwMfUpBUu0mzJ5xLs/IvrcDwpmdXZobGQxw0XYiP34F1iyLjV8n51aQ==
X-Received: by 2002:a05:6402:50cb:b0:63b:ef0e:dfa7 with SMTP id 4fb4d7f45d1cf-63c1f62ccccmr27493360a12.6.1761252716410;
        Thu, 23 Oct 2025 13:51:56 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb3299sm2564120a12.2.2025.10.23.13.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:51:56 -0700 (PDT)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v2 2/3] nova-core: Simplify `DmaObject::from_data` in nova-core/dma.rs
Date: Thu, 23 Oct 2025 22:51:36 +0200
Message-ID: <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch solves one of the existing mentions of COHA, a task
in the Nova task list about improving the `CoherentAllocation` API.
It uses the `write` method from `CoherentAllocation`.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>

---

V1 -> V2: Split previous patch into two. One per reference to COHA.
          Added more details in Safety comment. Let me know your thoughts
          Kept the original map to avoid a temporary variable
---
 drivers/gpu/nova-core/dma.rs | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..620d31078858 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -26,18 +26,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
         Self::new(dev, data.len()).map(|mut dma_obj| {
-            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
-            // SAFETY:
-            // - `dma_obj`'s size is at least `data.len()`.
-            // - We have just created this object and there is no other user at this stage.
-            unsafe {
-                core::ptr::copy_nonoverlapping(
-                    data.as_ptr(),
-                    dma_obj.dma.start_ptr_mut(),
-                    data.len(),
-                );
-            }
-
+            // SAFETY: We have just allocated the DMA memory, we are the only users and
+            // we haven't made the device aware of the handle yet.
+            unsafe { dma_obj.write(data, 0)? }
             dma_obj
         })
     }
-- 
2.51.1

