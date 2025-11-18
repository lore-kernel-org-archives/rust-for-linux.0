Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA7327798;
	Tue, 18 Nov 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472444; cv=none; b=CXz4kio8JhHyT7jqOQ1WVBd3qAHN7nJ+cSjlBahKZjD5kDVbh5n+l5dRujBXWNv7xy3pzahstSRRadYEM8rTBIgMVTsgbewXXQArJByF779oVi84zWR2lQ2g/KP5c7vDQdNnqAicWYOiJ3fdX+5u6eS2PQGQQ1YF+N9WBR+vPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472444; c=relaxed/simple;
	bh=cLyzySKe2fbwJP0Kdb6OVHJv736G4eXM6dkSIHtsRew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VZ2yZdSPakpMYfCFO18QSi2gmpMVbP/M3/4SBNpVxKdlMzJ1cNZ4V8WQA66HQlrSqNr9DZSSiVQELBfujuWnfEEoHyIhn3OoVKivlRUkPBzABTrMuaXUTbQRIoxpRqxVd3zUc50s1wLoNCdmWhiW58MNC+/TFsWxO+X6sLmQShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTzs4WP6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTzs4WP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A1DC2BCAF;
	Tue, 18 Nov 2025 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763472443;
	bh=cLyzySKe2fbwJP0Kdb6OVHJv736G4eXM6dkSIHtsRew=;
	h=From:To:Cc:Subject:Date:From;
	b=CTzs4WP6ycKSkepLSxFmmf+39XxralmC871AkO8bfN8gpWGLJx83cwIfFHKInzkGk
	 RAYHcZkzakFTtqerDmai1LeqzI+mi9F0g8xB1O2qIMCf+xN0SDm0avo9NSoCu3fGLa
	 RfePmBXb8v0ETRiZBKeV857/2juDu5bel/RlifBuMWFxavaZTYT/5I98mEpch2wa18
	 blo13f4OxUn9b7YxG3xcUwCznQgJob/QgkhVBgu3P9o/PdIObeSjHuOVPCq1aodxrH
	 3N1wks5w6yBNTwke6MdSdLhTBJZSE4gY4agLV5NuxNZPAHWjCkElIf7CHdpQVzwVGt
	 kE8QPLl6HE2pA==
From: Philipp Stanner <phasta@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Dave Airlie <airlied@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Peter Colberg <pcolberg@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [RFC WIP 0/3] DRM Jobqueue
Date: Tue, 18 Nov 2025 14:25:16 +0100
Message-ID: <20251118132520.266179-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is time to share a sneek peek into the DRM JQ design. It's all highly
WIP, but I hope that it transfers the general design idea.

I can compile this code, but it cannot actually submit anything yet.

Patch 1 of this series can be ignored. It solves a blocker in the Rust
infrastructure and is included so that interested factions can build the
code.

Patch 2 contains a slightly modified version of the already published
DMA fence RFC [1]. This version removes the DmaFenceNames trait callbacks and
replaces the name strings with dummies. Reason being that these strings
are only ever accessed through certain accessor functions which the Rust
DmaFence currently does not expose anyways, and the only user in C is
i915 [2].
The trait caused some trouble while compiling because for JQ's hw_fence
we don't need to pass fence data, but it was mandatory since that
data hosted said trait, but also needs to be pinned etc.

Patch 3 is the actual JQ code as it exists so far. Please see that
patch's commit message for the current state.

I'll revisit my DmaFence RFC soon and try to get it in line with
Christian's life time rework [3] and fix some other issues and implement the
feedback which the RFC received so far.

Feedback for JQ is obviously welcome; the most notable problem I'm
currently having is with the list implementation. I don't know yet how I
can get job_lists to work with jobs containing the driver's generic data
`T` – data which the JQ by the way doesn't need to access, it just wants
to pass it back to the driver later in run_job().


Greetings,
Philipp

[1] https://lore.kernel.org/dri-devel/20250918123100.124738-2-phasta@kernel.org/
[2] https://elixir.bootlin.com/linux/v6.18-rc4/A/ident/dma_fence_timeline_name
[3] https://lore.kernel.org/dri-devel/20251113145332.16805-1-christian.koenig@amd.com/

Philipp Stanner (3):
  rust: list: Add unsafe for container_of
  rust: sync: Add dma_fence abstractions
  rust/drm: Add initial jobqueue sceleton

 rust/bindings/bindings_helper.h        |   1 +
 rust/helpers/dma_fence.c               |  23 ++
 rust/helpers/helpers.c                 |   1 +
 rust/helpers/spinlock.c                |   5 +
 rust/kernel/drm/jq.rs                  | 398 +++++++++++++++++++++++++
 rust/kernel/drm/mod.rs                 |   2 +
 rust/kernel/list/impl_list_item_mod.rs |  12 +-
 rust/kernel/sync.rs                    |   2 +
 rust/kernel/sync/dma_fence.rs          | 380 +++++++++++++++++++++++
 9 files changed, 818 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/drm/jq.rs
 create mode 100644 rust/kernel/sync/dma_fence.rs

-- 
2.49.0

