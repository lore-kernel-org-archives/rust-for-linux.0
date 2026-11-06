Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974210;
	b=4qIMtzcC9pKldxJ1K13sqD/wEWdWJun5Hcr7nDb+WO3hYTBHQpfVGTWL8X9DiYBHp4Dy
	 J+BKEVMbQi4e+HDkPr6uyd9MEjlebTvMcsArN3wjcfUSY6td1x5YuJqNLqzsil0gGaJ9k
	 oZwoR8b4kohVLR47Nfcdhkl0oecP0WrQ0xfCEBnTCGm8aVEdMD4raO6FUAE4Lfc8dKxEI
	 wqFqwJHi2bNwWy11Quach15qop49qoFw9U2CJabcKQnjcx5plOiwFRavs64JC2zoe+Qzz
	 qdwmwSkA1KMTY2t4s6dslHWPLGiWw+KQFY+Q4/rmhWu3/Gfaaxh2itcg1L5S6EfM0WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974210;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7qoeOCwcbAlvTBPcx9yQQNBwlzgqLb6BVjDnL4j1bZo=;
	b=VVcNbbmpzaoeT1wQHAk9NVhridqQSQeGrZHhH5HAi+1vUBKwJ8MddYaxkdPgVhXsB8Xf
	 o27Z/H6YnEHdZTIawfArJpBHagM2YguWfEWEohCQ8kacDln5oUUtfCgQsjYJoSPq48ukp
	 6uUj5SMtTtJBq7XNdeIqnGJv+urt6EX4VORP5Zq+be9x9MtXPWFQivHER9neVsEHQiu11
	 aCRVUypjtBZXJ526Ps7DCTvD8MJcFdOUVPFRTDKxkHfrGlqwbKD6EgDBMaap3Cyz2kSBC
	 YNAkjdsr/sxbASoNNYmQpS7dV8QvYPGfvHwXbsI0UgyUYgnSRwImtWw/2k9Ngal1s1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIJ9MBZz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81F606A332;
	Fri,  6 Nov 2026 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIJ9MBZz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B29A1F008A6;
	Fri,  6 Nov 2026 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974209;
	bh=7qoeOCwcbAlvTBPcx9yQQNBwlzgqLb6BVjDnL4j1bZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FIJ9MBZz8tgAkGuuOjwDJzH8xt1FNx7U6yxuD14Az4zgMnWlMATxtWeAzKBbnxPry
	 5/WKCqgzHzzj6tXdzujJa+gRuE/HehR5EPD7EQdkxH7nUCtGCaNfclJUX6bnfsG/Na
	 uXo7vE7yd1pl8gCjlEnt0Ghe8mNVqwUd/tEruZ2G9e0YOVKtvk24xKQOx6pWQ4jtk2
	 Hv527qXg3xPAQZEmHU0QHObEF+2/7VRmukLeBpZDocfUw21A4jSjWUlvIgwrk7bsI2
	 xrE/Rs9NTVU7VQ3egxi4c+8lfBx/VQYyOFjLnpxNgm/WDKewFEumlKdizEg2Fpas4L
	 oDKmQxqUG89mA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 8/8] MAINTAINERS: Add drm::JobQueue to drm_sched's entry
Date: Fri,  6 Nov 2026 15:07:53 +0100
Message-ID: <20261106140752.520386-10-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106140752.520386-2-phasta@kernel.org>
References: <20261106140752.520386-2-phasta@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRM subsystem now provides drm::JobQueue, a Rust dependency manager
and load balancer for GPUs with firmware scheduling. Since it resides in
the same problem space as drm_sched, it is reasonable to maintain it
through a common entry.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19818be10616..5cb896c4e0eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9267,6 +9267,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/scheduler/
 F:	include/drm/gpu_scheduler.h
 F:	include/drm/spsc_queue.h
+F:	rust/kernel/drm/job_queue.rs
 
 DRM GPUVM
 M:	Danilo Krummrich <dakr@kernel.org>
-- 
2.56.0

