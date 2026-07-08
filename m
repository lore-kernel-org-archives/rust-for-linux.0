Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF81434E2D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511062; cv=none; b=Ic9OEC5x9Rs6JulyxkivJ5J6xuVkrawHUfuKrheevfFlukkPEu0l3XfBhryxQA/HgTf7FIU/PDz4hojJDBLvQTQ4YVO8WoGnAc4VAsD04yITmHxtdPuC+DNnMWM35a3zCBc+vXfJc+XbnVIpN9NCkkMcL6XnbURhItpBoq8gHbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511062; c=relaxed/simple;
	bh=cKYCnZApM2IMZ9cjOn8VxeqOtJ/PUODUz3wEtlKvi2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rqyzRHkIu3n6XJsjDc2qecDqcAKHx6/hAey9FeZLg830ZyF2Hj5lku3iQukE4KNwcfF5dmZE2xFx/T1JhwV9rvsG1hN73umnjK3Ed7z1NbIrzApRL9DtEGe9GCvt+CvNJfNPP7M+UyabbmZlt/m6NrhhAqeCz3kIrvdkXGUgUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=LNkoyTwG; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="LNkoyTwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1783511050; x=1783770250;
	bh=o0KSKorGUygUV91TUOM/j3mZ88JSJ4I1wM0EFRoJHvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LNkoyTwGQQq0sLfQ5OUUl4M5q/eQdmaWTEZ3JVDOXPwrB1Us8EfJqwKxZLBmw5pEF
	 5iWr/yaltbHEEk86VxYcjZZuS9BB02iawhDP1kjTmXYDunl5U8bzJP56Z+tI3YvcH4
	 eR5XGvQUoTtAKxNjSbkj+46E3BPzCp3ACvfLpoYa/0Hf4IkJqE3zuMEvIUKiSgYO12
	 hRwj8NQOvPejEbzsJh4HOBxyPvp9jBLr4DkElBCqhPsJoz3FOftsBymPZwQn+Lqf+i
	 zdGik6ZRImA6Tf8gwADE2Hg1SO1YBRwYQLQCeHiJ3iU+v6BuGRTdk3FWWaTzZbbJd2
	 +G29obmcGXYiw==
X-Pm-Submission-Id: 4gwGTK2wmTz1DDLD
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v3 1/3] rust: workqueue: impl Send and Sync for OwnedQueue
Date: Wed,  8 Jul 2026 14:43:16 +0300
Message-ID: <20260708114358.957305-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260708114358.957305-1-work@onurozkan.dev>
References: <20260708114358.957305-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allows OwnedQueue to be used across thread boundaries which is needed
from the tyr reset implementation.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue/mod.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 933032fc4a85..d766cd9b9175 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -383,6 +383,14 @@ pub struct OwnedQueue {
     queue: NonNull<Queue>,
 }
 
+// SAFETY: `OwnedQueue` has exclusive ownership of the workqueue and accesses to workqueues
+// are thread safe as documented by the `Send` implementation for `Queue`.
+unsafe impl Send for OwnedQueue {}
+
+// SAFETY: Shared access to an `OwnedQueue` only provides shared access to its `Queue` which
+// is thread safe as documented by the `Sync` implementation for `Queue`.
+unsafe impl Sync for OwnedQueue {}
+
 impl Deref for OwnedQueue {
     type Target = Queue;
     fn deref(&self) -> &Queue {
-- 
2.51.2

