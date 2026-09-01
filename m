Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3443CE70;
	Tue,  1 Sep 2026 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278956; cv=none; b=SS4BHsRMJY1vvnv+wPuau3xjy91n6oGL/DQ8Flg8whYhzYvZcz//YDIAFWYdFFuBVdNonwDm/F0P7lIuy3YCENZHxJFX2uyl5mTbSN4vAonPiH9kLNTyoHNDg8kvww0gxMrKT7olMX1ORWEveSggnw5uH0EeU6P2v4EZprP9EIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278956; c=relaxed/simple;
	bh=lhvqr0YNmYNoIT3ggMS891E1w+CGEgfi2rFuaQKH4aU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o2lYDgWHR18bKJDeFjV9a2Lzojj3U1POmnuIyLsUoOYU12glbwiBusVbYV7RbNhrRpAGXDRbalSuOnC4Zm7EGMRKzEcfKmaXdyJNiV5YuzqrqUdKcn6N1NQktbVvWbkTXDdL9pRHGvTHZF9oT9Lpg1Rx7kPSuwQSJy1dHchNHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyPkn1JE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyPkn1JE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48A8BC2BCF4;
	Tue,  1 Sep 2026 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788278956;
	bh=lhvqr0YNmYNoIT3ggMS891E1w+CGEgfi2rFuaQKH4aU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gyPkn1JEXJo3QyH8+uUaNRC6R6dXTKXcIUspzLl0VHEW7YygleQ6UX0DGAB/bx61B
	 JLyzMV8V9w8dKES37a4+yxaasZLkzYFzbUvSou8aayMhGBqmKTKGRBnjyhjP+UAVdu
	 2dxy/2FYEBi7DPaP7oEVVkjRp3AFZxLI7A1Bw+Nh2D9jnNOuWZ0OTDfoJrxJe7hKme
	 ciL56OWimbUF3s+71pz/JIECOn5DXAeudMofPf6FMhldVPNZ02ySufe6G5OB2KWP7u
	 bsXEqlgYwtBCbkG9ud9q12ZqM/ytT5AfLJfQ8Tgfo+LSt6n3cze3uL9xztnY4xJ6JV
	 oerAI9G3/mvDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2281CC61DD3;
	Tue,  1 Sep 2026 16:09:16 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Subject: [PATCH 0/9] drm/tyr: add VM and BO ioctl support
Date: Wed, 02 Sep 2026 00:08:59 +0800
Message-Id: <20260902-tyr-ioctls-v1-0-e0fdbf8bd108@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJv4lmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwND3ZLKIt3M/OSSnGLdNEOD1DSDlOSktEQzJaCGgqLUtMwKsGHRsbW
 1AO+8sJJcAAAA
X-Change-ID: 20260901-tyr-ioctls-f10ef0dcbfa6
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788278954; l=1522;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=lhvqr0YNmYNoIT3ggMS891E1w+CGEgfi2rFuaQKH4aU=;
 b=GbkfXIDW39GboxU034l9GzN9Tiqr6XulAfvPJh7sfrXyDINKCLMkm70knCQ9US4+CJvXzLMtP
 0dBNuorJ9UVDYn9ZADuaLj9cY/ophtfF2gmKfXQBW1qNlmPyVMCSMp/
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

Add the VM and BO ioctls to the Tyr driver, aligning its userspace
interface with panthor. The series is based on Danilo's `drm-file`
series on `drm-rust-next`, and uses the existing IdPool and xarray
abstractions for per-file VM management.

The panthor IGT tests pass on an RK3588S device.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
Alvin Sun (9):
      rust: sizes: add SZ_4G constant
      rust: mm: add `task_size` helper
      rust: sync: arc: relax `ForeignOwnable` for `Arc<T>`
      drm/tyr: add per-file VM pool
      drm/tyr: add user and MCU VM specifications
      drm/tyr: add BO creation and lookup helpers
      drm/tyr: refactor new_dummy_object to use new_object
      drm/tyr: add VM-related ioctls
      drm/tyr: add BO-related ioctls

 drivers/gpu/drm/tyr/driver.rs   |  14 +-
 drivers/gpu/drm/tyr/file.rs     | 394 ++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/tyr/fw.rs       |   8 +-
 drivers/gpu/drm/tyr/gem.rs      |  41 ++++-
 drivers/gpu/drm/tyr/pool.rs     | 102 +++++++++++
 drivers/gpu/drm/tyr/tyr.rs      |   1 +
 drivers/gpu/drm/tyr/vm.rs       | 158 +++++++++++++++-
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/mm.rs               |   7 +
 rust/kernel/sizes.rs            |  12 ++
 rust/kernel/sync/arc.rs         |  12 +-
 11 files changed, 714 insertions(+), 36 deletions(-)
---
base-commit: 0b0aa9dcf17b6cffa9e325ff641e843b20d40c31
change-id: 20260901-tyr-ioctls-f10ef0dcbfa6

Best regards,
-- 
Ke Sun <sunke@kylinos.cn>


