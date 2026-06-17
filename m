Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BFE47D93B
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708566; cv=none; b=gAHlYbN2yHcNbRekvX70ja1fMqg3fU3+e8TVTPya6UKwNIAOrSO+gPTrTKjUqef/J9QM2Tjnmq1SvDzrizPi19fkWk7xRIJUTSQOcXTm9W2NOoem2+OlkUa2wz3TF9pzHZ/BjmSzM3BES7vX4aDKxzR0f5lmwWmsGu+9WVjSZ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708566; c=relaxed/simple;
	bh=DNdKDgHLt7eV5CPwMxr0aJwKqQGASqB5sKINx5OsMF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mtpFQgHDSLptVv8C0q8qyve/ReBwGaEBMdWRiRGjVNkmNNErwWTuEwBgFE1THumlA3wIDW1XJgYtyKAwfqjh+F1bUG/HkzBLbNtT/nWYdJZ4dw4b/gRl1HmcKOtyKS6PC1PszAu0DBy5UyKKsyugy6pAcTS6xO9rF1CdItBDx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=DL35pcnp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="DL35pcnp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4629d80fa08so848667f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708564; x=1782313364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok+RjE4+w5Tv/U34IMQhdlbVd3kP3wRLvfnVhKYPL2M=;
        b=DL35pcnp2gj5xGKPDNBJh1OHfu7UBp0+A4FMNFhEzfjkbi3u2zQlANjF+Wy8FA/sAT
         lJLQLFDKGaAlwBLJk4uoSKr+mrahX7tfuVd3O7v3o8g2lCrV2HYEQukgrFHn9rnc/lNa
         3oXiO20yRB8m7eRLnHnnypkLgElAfAqBcrGvayYxwDxDfWhk+bld5Ztl4WOJtuGmIeBX
         0gg00zTi+HBQu4mHQUEOII92zQUQ9hN7O/api5hH8ZhUPonR55opBnUAkEx/I8REWbKP
         inu1AleEFXg2xkMvI43JoiQjdWA95IhPr/yK47sUhkTdGl1zHp60SFItEI6Vd8XwGNRB
         LW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708564; x=1782313364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ok+RjE4+w5Tv/U34IMQhdlbVd3kP3wRLvfnVhKYPL2M=;
        b=SrkP6MF8Y2ufIkfk7vRuoRC305widr49mG4d1vwS1/KEfXORJrJYc9GA7QXrt+xflH
         D6OGk8NN01Nu3SKeI+knfFZ1rme4QUE3BQVqQ5//8lfgXkMcpqsgRrNbAZYg/tGMei4O
         lFTYp0UH85uaCmlNVbJMVf8qkeoXiso1QPJ9ht9TKsdrKIluzbz2zBAEpNzzP8h5JjTc
         9LijYY8+WL+8MQJul2I9T8dukxp3Zz827r3z6hDUzHc7TVbtwlRRyi1/AOfEzPbHiQia
         xX97K+TrfhrPP4CuKL9mpNVoNXIV9ioS90yIlnolIbIpxlfr9X58DGBUHDfhvrR7kZks
         nH5A==
X-Forwarded-Encrypted: i=1; AFNElJ8c3uYkaoha67ordvSWO67iYyxB5zQJzG30YuFx0OKn4EKGLDXhQzepY/3YUijtaKnAoJnHyfbTXzgb157kUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+7jxFerGoW0n7DFYveeyy3tHoxffZRZhir14PIH9Zs6gkp1Y2
	zHfelkfwon8EO1n1qhnmkxFYGbbWgA2HveMXDdPYGk6UvP+W4T1yO2erBao3q4Q+ZQ==
X-Gm-Gg: Acq92OHVDNmNyec7SUOLpBXYkr7Mk5eK/0YBFdbA5udpGZ57caQVzCPbacsYV1b7pqV
	uTC6/UXhJzzku99hU4engmEVwC0CDsgQ53i1GjAn939Gne7hBw6KH0vDMe+Rr+U+gGOUTxD9pCL
	sk/K95Dzj+Pts3ojQy7bLVaxcmRHnn0rjLsLirn68ATPIFm6LdDLgxKnsCc4dIC2pdBX3eAzpz/
	bLIgwCOxtjAJ8wnlQCGICzt/jPznrPQ8fuToePr7Midvqp9BbIt04Sd+rEzXF2Lpy7jlZj0d88n
	VmJDeW5mwzUpGnofGrHFojbyNuhMUUDDx4r52X+ZhX7gouqUTvSMaSCAliNPd9wvdRuulfEvawA
	5CHu6yHdm7u71d0+izU64wn0ZAtHuuhtki9WWFZ9foGPsqyflRMiO6VGFxM6biV1pzJjBEUnJWB
	vbEQEvgVTuRzYswY9u8luQfEY+w5VA5uSyT8CO9LRumHW1p0/USreZSd4R
X-Received: by 2002:a05:600c:8189:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-492333aaa9emr69289915e9.11.1781708563939;
        Wed, 17 Jun 2026 08:02:43 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm57264311f8f.11.2026.06.17.08.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:02:43 -0700 (PDT)
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
Subject: [RFC PATCH 4/4] rust: drm: expose drm_blend.h and the atomic new-CRTC-state accessor
Date: Wed, 17 Jun 2026 16:02:26 +0100
Message-ID: <20260617150232.2210-5-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150232.2210-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two further KMS binding prerequisites used by the in-tree DisplayLink
DL3 (vino) driver, beyond the simple-display-pipe header set:

- drm_blend.h, for drm_plane_create_rotation_property() and the
  DRM_MODE_ROTATE_* / DRM_MODE_REFLECT_* constants, so a driver can
  attach the standard atomic plane rotation property.

- a rust_helper for drm_atomic_get_new_crtc_state(): it is static
  inline in <drm/drm_atomic.h> and so is not callable from Rust
  directly. It returns a CRTC's new state within an atomic commit
  (NULL when the CRTC is not part of the commit), letting a driver
  inspect the proposed configuration from its mode_config
  atomic_check(). vino uses it to sum the pixel clocks of all heads
  and reject a modeset that would exceed the dock's USB bandwidth.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/drm.c              | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 5b311944cc14..5ff21c33385e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -31,6 +31,7 @@
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
index 65f3f22b0e1d..5087daa23ed8 100644
--- a/rust/helpers/drm.c
+++ b/rust/helpers/drm.c
@@ -1,11 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vma_manager.h>
 
 #ifdef CONFIG_DRM
 
+/* Read-only accessor for a CRTC's *new* state within an atomic commit (returns NULL if the CRTC
+ * is not part of the commit). It is static-inline in <drm/drm_atomic.h>, so Rust cannot call it
+ * directly; the vino driver uses it in its combined-bandwidth atomic_check.
+ */
+__rust_helper struct drm_crtc_state *
+rust_helper_drm_atomic_get_new_crtc_state(const struct drm_atomic_commit *state,
+					  struct drm_crtc *crtc)
+{
+	return drm_atomic_get_new_crtc_state(state, crtc);
+}
+
 __rust_helper void rust_helper_drm_gem_object_get(struct drm_gem_object *obj)
 {
 	drm_gem_object_get(obj);
-- 
2.54.0

