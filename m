Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D12402B89
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538760; cv=none; b=mfJxKg4jkRout2T9yYcKWsc5crb/UxZndKY0GKuJ0IfinRBH1N+MF/HSspCmFiimjx0ccmwVPqzni8+kd2kRIPLvIFHPKIWYTM/zbUQ+4RBbxyf7mSUK3NkBFzGfsSH96MHDeiqfBhjVQqm3hlscSKWlIXi5ICRAQoLs2m1VJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538760; c=relaxed/simple;
	bh=Rb0d3fYWBYxwCsdL+j4AgDBDt8IDEmmK+PtAHQnzXpY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=akvXW2xtmtTN2jYE6mJTHc/wU2NrgsgkAEonkY69cyo2GjCFhV8j2mNEx4vD8HchjoyuNfhpUFexPx9HuB67Cgh9NCkA+9Hv8rSs3P7SimXmX7b7DZBt67PZ1ip5gab/9MhrOQMt5XgcaP2l6Vk3rg4iY508R3wlG3BSOTO6wIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vL0b2MlO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vL0b2MlO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486fb29a8b8so8510015e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774538758; x=1775143558; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TRXLr70RAXo8+FHVmEWs8dV7AbwQLcCfIvxFvJII8hM=;
        b=vL0b2MlO3C/8MPvZFIPQR3p+TeNqxhL4P4fH+RvVxHRGtaCGhMOTiVphf9z1U9QyVA
         jfdHiDPBP8cWPKmwvYJpKYyn1QdT96sGg9Qpymds5NCPsCQCdwtHKqG+aj3uD5xadDpu
         jR2jt6NgpX9wI5YHoxpD9D9aiAjRw0CIb3Wa1052s1Csy9OHQLQrsa1rVzOPYMA3tzXx
         n+W4FW1isV2hDfIEglp5c2MwRzhz6wtRFyoo2jErQU1p5aNVBnek0Dyq/brBrVNktLKA
         fe/K5ulKJu2w2tCIpTUM0ixuRGra1Xae3yT98D+QIaGfioTFYyiK+/rzZLHJMvkzC0sM
         1lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538758; x=1775143558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRXLr70RAXo8+FHVmEWs8dV7AbwQLcCfIvxFvJII8hM=;
        b=R4pebvkCTQuyHAtcck5pk5ZlHMqh9S9IxyZwhRmn24PmPWjKkDFbcINlnoH6svzL3w
         WdqdUUWklNkIRkqsRLK269Yt7ZgMdWcVa5Smv4CfuP605Ib8paXxptedXenDeNJf2JZd
         g91EX+RpGkIp+yTV0HyVJUuCWDISnhLycgqSK+HeY/up8PNttx4UJKHBHTBCrOsYHcA9
         T1l6Fgh2y/FedrvTCwdN+Gi3wVy9EZUTksRlfDis1otC+ka35evDBPqvHd/SS0X2alqd
         RMNk0Ynq5wqB6EZ3MO0BBTLRhgM/Z93RtUmABdx6Dex9eW445KhKLlPyFBTWoE1xKjIA
         YoDA==
X-Forwarded-Encrypted: i=1; AJvYcCUyuRB16fB8gflF5M1f783FgA8EXj5ffyrWjRRMTQVtw+nTxav8+5IGASas0ieLczUpFfamH1272j7VPy9PKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHNkINrFlb2HgUAK9sOKhBSWq0Ix5yr3tsm2mndr9/ZTcY9//w
	s02aEqLHum8nOnrylS6rGYjmM9W6H0A0frt698g+qKkZZgMlN9h+xV4JyGlOjwVgo0NDX8wpW8F
	hKSa/nTf7GyRiy043LQ==
X-Received: from wmsm1.prod.google.com ([2002:a05:600c:3b01:b0:485:3ddc:f26b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4447:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-48715fd4d49mr114709525e9.10.1774538757875;
 Thu, 26 Mar 2026 08:25:57 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:25:37 +0000
In-Reply-To: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Rb0d3fYWBYxwCsdL+j4AgDBDt8IDEmmK+PtAHQnzXpY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpxVABQ1MmnaCWpuFCvOkNuFq+qCh9E7lIwBmNP
 JarkZt90v6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacVQAQAKCRAEWL7uWMY5
 Rlt9D/9k9LaV5DFCqqiG4HkStm6j4twKZVLeDzd0bK4acQYAmPrWmkjqPZzPL3Z5Djiu5isTBbD
 bLdGtnQDTvjp/oN+Tw+dc3itubFtz+dNuKNok6PobPQ/mNP0em+nNiUDOa2cjKJJvhyMovZA7U3
 CBsYathr5yE97MOMGRFvabZQD+tNxz/Ti6OiIa2YHhQuS6iweHEMp7Kx8vRbA2Gc/A5kg4zpp8z
 mYVzfb40KzV8a9TJDltGS9dcx8G8ywyhEZ4tOlqLZTXCYhTZDpd0iBP3wcclxyBQfGNJcXUEpjQ
 pWZFbyC2uePK4pTunArp+Ic2Xylq4dryaOHDPjE/AelaSzI5a6AWChAigUcNPuQes8h224sC8LT
 +s/N2B2/ludIZY1o6SnHza+0+p9Q6cEM7ard3HRlKjqOI3U13eK1flleXp+P970GizRVGReIMDM
 cb1klOPijoKVkmyRlGK2H9k4OCcwYKtCp4Cb6ewmG9MrwpbJ/XFC4iZUYO7Gb2+A7DYyOwv4fOm
 xQMt2+i6KfSrdNSnv8yJvubredUIcNayNDug6t9FUa49OcZjCrp7BXdtlGhTW0xIhT4JXRXtxvD
 nWBAVuWc88w4XrBaChU3CoFC6YqUBnJEDZbYhbAUor9vn4F7VCJ51LjTXGswhRaYM6vMb7fKT7R 35WpQC3rhP3wxIQ==
X-Mailer: b4 0.14.3
Message-ID: <20260326-drm-rust-next-fix-aref-v1-2-7f6f58d2828a@google.com>
Subject: [PATCH drm-rust-next 2/2] rust: drm: use new sync::aref path for imports
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

ARef and AlwaysRefCounted are being moved to sync::aref, and the
re-exports under types are planned to be removed. Thus, update imports
to the new path.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gem/mod.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index ed974bfdc861..6cc441ee5b63 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -39,7 +39,7 @@ impl $( <$( $tparam_id:ident ),+> )? for $type:ty
         )?
     ) => {
         // SAFETY: All GEM objects are refcounted.
-        unsafe impl $( <$( $tparam_id ),+> )? $crate::types::AlwaysRefCounted for $type
+        unsafe impl $( <$( $tparam_id ),+> )? $crate::sync::aref::AlwaysRefCounted for $type
         where
             Self: IntoGEMObject,
             $( $( $bind_param : $bind_trait ),+ )?

-- 
2.53.0.1018.g2bb0e51243-goog

