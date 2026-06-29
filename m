Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890234041F
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 20:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763889; cv=none; b=pKXXOUzuBxk+av2RX2FKkxC0cdjjRr3eBvt3iHHiECxm9GEVkS9m5DXMAwP5/SXvl6gLQUIe4NjFmS8QeMWzu7uaDTweMX3y3AiiPpyC/zzS+Fu0LsfL8wchz3s0y1/2WRlp81OK2yPvgodcl3RF9z4LGX5qZt0RDgVrZrptnno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763889; c=relaxed/simple;
	bh=eFgUeCGEO+qOSTEKY7myebbnHBLHZB0M4el90BZqF+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Em3xI23vUBm9WzaWgH1FAwnpzKHzHMg9v2IrXrpVyCO730y+y5cLNLulukMTfp/oNrWx7VQQtPCVDexBuhru3+jkEv3vQ2Zz9zlaRLaIXqCPJmaAIl9e2Ij/XcaiJcyEq6j8aK1HX4wWAoklJZggh1gFrtA4ad3Hb7U6cS92SYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAVkswZ3; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAVkswZ3"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13809223fd4so4567731c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782763887; x=1783368687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juwApRqdf9ZN9ohtGGzCpOWWFQJmTGs8EU4cohU1bSY=;
        b=PAVkswZ3lR9ia+URyVqGo8zy7n73TrR4fxdZZPbTpHDPuvyINCy8gdHt+YWFyCG91o
         olwBSjOsaP9LOrsAeciQSEoE2uRfApRJNZCnIjA+XcgHLTNrxAmcjeYjeHO+J97rn76N
         TEBzD7wwnzhSM8A01fwe5nkNDXSAm1ei2rhpy4nBSl+kGogra0pwN32UrRrO0M+dkFec
         DZQS1QtWDPNB/Lx5VI6dM40fqD8WU320AqqfJVbb6+R3LAVQ0nbBfu3goK+ZTpBBWfMA
         yXSBOxQhyd0tYn6omOywzDTmmq/fe+imqBDEhsnpw6vX+WyBNotYuns4GEKp2MjNg8Bn
         dwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782763887; x=1783368687;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juwApRqdf9ZN9ohtGGzCpOWWFQJmTGs8EU4cohU1bSY=;
        b=SJoIZpQAItRAMpaKE8c7GfWH9rjVu/jPu6J1fd/347fRgX1mDBVelYZvj3TwsgTamL
         WsGt+rneEpZfcUJqCtOvP+QyYlo7z4/Df0gCMNcK4qKb8QkD8Cw99Uw0b6deIbLL2+8r
         H/RmH5sgqr2ccu3IVmDoznI33jwLhxP3XXkUrPK9vTiocN3h88djeQgpEejABYOHvB1e
         7Z6JQoNvg/pDgIBr49aDTpqUf7cxlHPOTEk59n60AJ1HdJq6kZEo0j4S+dgFqRsobIud
         qUuPkJa0B44qo3bl0A8p9pP/ldkPcapAW6LfUCCz4RHVh1I2AAt2zkmYhEggJGwau6dq
         qiPA==
X-Forwarded-Encrypted: i=1; AFNElJ8+o7+Sc51dHyzo7mfNTXSpFBmbY03AAY0BuLyCMbpJfqpAektYO3M9K4MPOR+DzCwXsXjehi2ERc5AWYzFRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQT7top5dxeNgfV5r3M+mjnnbTE5AIBYvFOUz2NIEdTYglWqfa
	36Mtel5sb+4Rbbqbg8ATolEAA+gRdrAuKqFsgIi6q4JzPpjPEKMsHFg=
X-Gm-Gg: AfdE7ck11hpA3Y9Bnpi2akyKLsUA56e5O8N+1AU08wWCq0/J1ti+Y+JgZQESorRIRFs
	alr/qTC5G8KvmgEgQHVX3t1fQdWRTeTojd10AHDU9hbVkoO0J2oVAAOsquh7k2bO41+P2yPA9+m
	CsktkhIdajDluz0ebu7ZLRg0LSget+ho6bv0MxbR1YQgR5kerIbi9iJWfqZiqdOmuX8QOGn519t
	vLkXib5hbuU67txHNaM6GFzeJTEACH7B8jYoigA05uw79RhjfQPpKCI4pwyvWL14nN4xbvD5cpa
	WouIdrHsg4tMOVCGhskmD8RS2P5lhmRsYHusKAGV81lsn3kAgR6RipMExRtoelA7K1nDHgo9Wxm
	/tO0gHxUCONgzmb5WVXoOCpjh/BWHoIk9g0wIW5cZ3RPk4Xmjh2LNOGcT+uKOpwpBORZkK+6EvR
	eV8qdFugWPjgaZWav6w3rzRm0zlFzjorbv+ARSw63fY6BXU2SfovvX/iTGO39NNgrD
X-Received: by 2002:a05:7022:1603:b0:138:916:5179 with SMTP id a92af1059eb24-13b2a1605d5mr498783c88.14.1782763886832;
        Mon, 29 Jun 2026 13:11:26 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm1150598c88.0.2026.06.29.13.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:11:26 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] rust: iommu: replace core::mem::zeroed with Zeroable::zeroed
Date: Mon, 29 Jun 2026 17:10:41 -0300
Message-ID: <20260629201046.423464-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All types in `bindings` implement `Zeroable` if they can. This enables
using `Zeroable::zeroed` for `io_pgtable_cfg` initialization instead
of relying on `..unsafe { core::mem::zeroed() }`.

This change improves readability and removes an unnecessary unsafe
block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Changelog:
v2: replaced `..pin_init::zeroed()` with `..Zeroable::zeroed()` as
    discussed in v1 thread.
v1:
  https://lore.kernel.org/rust-for-linux/20260626203122.713317-1-nico.antinori.7@gmail.com/T/#u

 rust/kernel/iommu/pgtable.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/iommu/pgtable.rs b/rust/kernel/iommu/pgtable.rs
index c88e38fd938a..eddda8d9d62a 100644
--- a/rust/kernel/iommu/pgtable.rs
+++ b/rust/kernel/iommu/pgtable.rs
@@ -102,8 +102,7 @@ pub unsafe fn new_raw(dev: &Device<Bound>, config: Config) -> Result<IoPageTable
             coherent_walk: config.coherent_walk,
             tlb: &raw const NOOP_FLUSH_OPS,
             iommu_dev: dev.as_raw(),
-            // SAFETY: All zeroes is a valid value for `struct io_pgtable_cfg`.
-            ..unsafe { core::mem::zeroed() }
+            ..Zeroable::zeroed()
         };

         // SAFETY:
--
2.47.3

