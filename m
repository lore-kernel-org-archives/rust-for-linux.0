Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4747DD5D
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708566; cv=none; b=Mp2cxzqPV3AL1/JBA6u/ERZi0Xf9sLL/g0kXfp9W6DT91ETWdunRnybOZf1IkuIlnAENUQR/t9TgEFSbaQrzJySQfkSH3Vp5oDH51O9pvdEHU1yt8kvEa8345gy6FUiY4AVsJF/EkAlN/7iVKdMvUu87XaaCFi9OUfn7ZUHAUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708566; c=relaxed/simple;
	bh=UOoq7WuK2vbwwp69eAKcDwyrIb9HS49cy3U+9QHjj1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCdHRMTc3rKkboCzW+zMqw51iPG78i/UpMQhP1x2l/wdWp0ptwwzpWEBnyCB5f2E3YNZPR1LaOtyan4bx6Mx76ohMfX6aMlgaLWpP53QF+mjHeKeeOvdcol8A/3xHQcr1p2L/1IT2YjN9Nfn3VBBivJbaxsX5uyNASJ6r2q/Vgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Z6DKWsoj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Z6DKWsoj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eeba68948so4375254f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708563; x=1782313363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+7QC6LAPQa8dQnEwdpFa6EKhfpyuQLPCL3jRYAOfa4=;
        b=Z6DKWsojwTbQ/C7278kq89emWqz4nC1qYVr++tUe5Gasw1G5pZGlWOhdk/qW4ImTpU
         /N5PVDRMYyjdQwyI7xVW/rFuquHTkp9J+Ss0A+eQgKS25zBzO9HTTGIQZbPUCpa3RaBH
         ng67Tyt0RmMmYAFVaUdbsYkLvmoSncUPrsAJzCJoCHu4JnuYork6WQYq22Ke6x7Lw5pN
         lEuxxgc9Vgu17Ymq2bIJYY//don6gCj+9ktHYKbAPlC8cng6RZmlkJgyUunRY5BOVJeO
         QCU0DvHDO91Snt1A34TBhyY0IkNqnZAOKkySDnBd6ZSuEZDypXEmX46sEulaZjKH615f
         P4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708563; x=1782313363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K+7QC6LAPQa8dQnEwdpFa6EKhfpyuQLPCL3jRYAOfa4=;
        b=KSGYsrWKWbCLctgNrUeFOSXfrNsudIwdxyO8ADwSAvjkIwC+yGRSJuQlnQqpEiTbaq
         WOCBfpzbTy5jwwz8TPpqQQgz0xWJhwHuccjPWd0e518KAGoTekpP0C5rXQrSdW9szhYJ
         oMN2p5tvQXqAqf00HSOUDyE60/Vg3uBh4pQZMPurHjpJov3L1Zvpu8vl81tIinwDbxTw
         FX4UR1SrXQKEU70vSd+h8S9wtVFoRgod5/wGV5QM+ZczikXoWuKpaUzeGnCTGA717+S4
         Ul6o+0X5F9SIoGFYpiHt1KAHPK8LIfJtVxVhwjKhGssoWmC71wBtoiBa7fyMVBDpTX/t
         Gdzg==
X-Forwarded-Encrypted: i=1; AFNElJ+YernKVNW10rxkqitaJTwGyIfLdeCFxyx/zPpuaHNOCcYRpc/0w6CktazjS4EzaAO96gAahWnqujIq0aLOIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRafg/MLAg7sIe2qxaEjzuwuXAY2uebF56c17zTdtAvQfMPkD
	pyZz2m60wfq7tjFAXAE5mFmP6HuFOx9I5lyNVPLqOJ0dDLWbzmOUubY8bWBg0L7FZA==
X-Gm-Gg: AfdE7ck1KLC7ZhAQ3RcpUkLcWZDvD5r13XySHR7w+Y1A1rb2k1ZfRJa9qT3V8a8beXy
	tF327wDu6/bDQhj74FTb99D/77oZSiyr2FJ0c+sx0GG8JbhB/Y2B33fCgYDvt7WCai68Zz96hZm
	l1Lc9UBaB6BJcg24Hs6j3Hdnh3yMnfXBErkUsa+b2UpL+aDjEbNs0fQUAWDO8JARO7sFsvrjkzA
	mp1HHl3Ik9slYRYUZ/JHY/cvbwW0LZCTXq9Dx444Wv1hVAnfBbITRqTYApwDLxntzXRR+rVhbfW
	CHCRk58odQos3FHF0AHJcosCL13xko1vYbpp9QyQ7PDwBVbSITBZDICBd8sGyMGd5pOQIu8p8B5
	sFEMKngxDi6suzWVr/DdDEvgqMFxbkLqf6VAKFkqWEwdR7NN2kong3NfraAKoYuq1QBll0wvhxF
	YAg6IwwofQcChxZ0kqLlaa2VpnPVkzKmEahsHtxSSCwXzPL8AtphYQUmd+
X-Received: by 2002:adf:ef8d:0:b0:460:1f32:628d with SMTP id ffacd0b85a97d-4623683a4bdmr5928828f8f.11.1781708562488;
        Wed, 17 Jun 2026 08:02:42 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm57264311f8f.11.2026.06.17.08.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:02:41 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/4] rust: drm: expose drm::Device::as_raw()
Date: Wed, 17 Jun 2026 16:02:25 +0100
Message-ID: <20260617150232.2210-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150232.2210-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A KMS driver built on the minimal bindings added earlier in this series
needs the raw `struct drm_device` pointer to hand to the C KMS helpers
(drm_simple_display_pipe_init, drm_connector_init, the drm_atomic_helper_*
family, …) until safe Rust KMS abstractions cover them.

Make drm::Device::as_raw() pub, documented as a temporary escape hatch
with the caller's locking/lifetime obligations spelled out. This is the
part of the KMS work most likely to draw objections, so it is split into
its own patch: it can be dropped or reworked (e.g. replaced by narrow safe
wrappers, or kept pub(crate) behind per-helper methods) without disturbing
the feature flags and header bindings, which are useful on their own.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/drm/device.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 1d3319b713e2..c89c947b399a 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -296,7 +296,15 @@ pub struct Device<T: drm::Driver, C: DeviceContext = Registered> {
 }
 
 impl<T: drm::Driver, C: DeviceContext> Device<T, C> {
-    pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
+    /// Returns a raw pointer to the underlying `struct drm_device`.
+    ///
+    /// This is a temporary escape hatch for drivers that need to call C KMS helpers
+    /// not yet covered by safe Rust abstractions; it is expected to be removed (or
+    /// narrowed to `pub(crate)`) once the in-progress safe KMS layer can express
+    /// those operations. The returned pointer is valid for as long as `self` is
+    /// borrowed; the caller must uphold the locking and lifetime rules of every C
+    /// function it is passed to.
+    pub fn as_raw(&self) -> *mut bindings::drm_device {
         self.dev.get()
     }
 
-- 
2.54.0

