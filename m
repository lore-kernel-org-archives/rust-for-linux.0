Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523488;
	b=XEwsYmgIWdH5uVEI3hWRPwc+Wl+WzbksHOgA6xHM5mgFGZMDsbQSdYwpNsRkjeXOn77d
	 FBfdDTUD2SWZC8oCjq/WAG6PJrfPHru/h4jzGpzgpdRcuxMezBvUGswNG1bZPEWAYUAMa
	 gbHNEQBHlVXFgVYxA1LBpdFzDmQezP8wvdPhScc9EgquFE4M8gEJdYBzWBKqfR80BsnPq
	 B+8FRSH4wCbyG8CqW88TeK3O80lH3Rd8e5YHHVFB38HRn06cJlXnb3FwFpW6uPfvjp8kz
	 Jq2LUQuX9Vdehu+7u3hfrBsJN3kX67ITnZ6PXq9lG0v7pLThcTQ1bs2wk6X9l1nf5Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523488;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7qoeOCwcbAlvTBPcx9yQQNBwlzgqLb6BVjDnL4j1bZo=;
	b=hYdmVWvsRei0fTt355ft8goJZu2CILL1xjC89ko3HCntzQdM+zOAbv2histwIC/mb+sy
	 vV8BYVzPow6CzHNG2oKFTqa/j+zqXdJC31hHa0UUuFlgYVR61yS5RbsWSA8Fcph9wnQ0o
	 Hz6rOR6al4IhVfk/0XjmTfaq0E7uFIxdbBmMO76EX4CZ9Wa92Zq+AiP6FF2sGnpSAlq2K
	 dhVkVZFZ3y06oRRiYXWRrbX/Mr4Htclduygj8sqQqlJOjgqhcY+1wVFPyR9d1gESWcijo
	 iU7fdScmVwaqc1g2ITHuBtiApoe/q5/RJhE4tnTgxdvA8S0ZSDzB4EseX/1vDkTkhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFpnjcIQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D86606A330;
	Tue, 24 Nov 2026 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFpnjcIQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F34D1F000E6;
	Tue, 24 Nov 2026 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523488;
	bh=7qoeOCwcbAlvTBPcx9yQQNBwlzgqLb6BVjDnL4j1bZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lFpnjcIQ+7hHcABW6mbadFfa+58sYuJtLQeePQ4d83H6JlkKW+VCZOYSDliR9NaDb
	 5GnBUe84MCOUZwBvLSDQUDAfGOP3a1xG6QI5LWRyxF3CFSegDwDNMBmlMPGUOW0jmn
	 SUVwAMaoUCkobX8pjMi4d01cjSThhc3ubVtxEwAa1eQw1zbIr1Y5BI3BfnPajH/183
	 8Jjq4TW9/PR7x1H8yEm/uhP1fcXyxlfvmLQa9MhDsjtYZt3OhXYnLS1G9afRRZwUls
	 qixxL8PM6M7ImhOunKZlKIyraCmeLUcgLFm45kJzZDAXCk7q7BW8jhagQ24aqtKhtH
	 W/WvbEadcKKbw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 10/10] MAINTAINERS: Add drm::JobQueue to drm_sched's entry
Date: Tue, 24 Nov 2026 13:29:52 +0100
Message-ID: <20261124122951.878199-12-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124122951.878199-2-phasta@kernel.org>
References: <20261124122951.878199-2-phasta@kernel.org>
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

