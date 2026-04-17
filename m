Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E076255E43;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776388291; cv=none; b=U/qc8PXZnnFKCztyJ/xYAe1uKN9xJF5cgUShjWhUIfsQrjx6f0rTASOckunMEi85F5FXucNIN5YAIXco4VnstxQncdhUhf3ZGFmhsknIUnToEADT1nY2/z2jzI8zqrkGjnZACEZFxZl60ZuaAdDV4cfLM0SCSyW/Kri+grtaHW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776388291; c=relaxed/simple;
	bh=/Cf9gBkTGs0FZ5AznLGhdvS5YDnnQwX3P349kNzrw9s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OPeiAX3biNhkASeB/XWZ1wp1K5AHAjmRZBPfbx8lSNJ51iAVPOe+GtCAAOrc5yxm6O1K1nnq9rrnEhrmKqFwLvDT9X2QisUW3V52dXR4X5p2btJooFm/Yc7IwBTo5zBurc19W0hFDyrurPH6mX2XT2Vq+GWTM1rH0tRBeZO0/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xIkx54yG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xIkx54yG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADFDAC2BCAF;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1776388290; bh=/Cf9gBkTGs0FZ5AznLGhdvS5YDnnQwX3P349kNzrw9s=;
	h=From:Subject:Date:To:Cc:From;
	b=xIkx54yG+l+fsrJO6vtLWeAtvaTYtSLjJiTh4SaFFREUkQgviAL7LUatHnVMRG7RZ
	 xfFqSStQ1F+zlOtOFmBhQHo8mDu0Nm09l3hfvDoWH6QwTyaXr0rUuIwIJ3o1bubtGk
	 zxZAApKznDWOfRu9ft97JD4F7ZboQqARVpSQcwto=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF62F8E49C;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Subject: [PATCH 0/4] rust: Add helper functions and constants for Tyr
 driver
Date: Fri, 17 Apr 2026 09:05:50 +0800
Message-Id: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6H4WkC/yXMSw6DIBSF4a0Yxr0GUNSYpuk+GgcUri2xggW1D
 +PeS3X4n+R8CwnoDQZSJwvxOJtgnI3BDglRd2lvCEbHJpzyguasgPHjwTg1PgJoHAJwUVGBqNs
 s4yS+Bo+teW/ipdnb43OK8LiPpMcQ5AbXyTG6glFasCKjPE9ZlZcZMHg5352dnbz7dtKmGufTH
 7/KgKBc35uxTuYypeCVIM26/gC2CSe8yAAAAA==
X-Change-ID: 20260416-tyr-ioctls-deps-25805eedf332
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776388289; l=1591;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=/Cf9gBkTGs0FZ5AznLGhdvS5YDnnQwX3P349kNzrw9s=;
 b=i4mDcseJKhSLM3Wmo9o5QqvFYc2hmQPNSFKc/Hhd8iVYttVa+fm9NC9L6xLaF8ihLeg6DcVOi
 +KGN4DjLo8ZDsRxgNHYvGPC4gGPODD9s7OEi1gcNG4F/w2qfUi/eLj+
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

This patchset provides helper functions and constants that will be used
by the Tyr driver's VM and BO related ioctl implementations.

These patches add:
- SZ_4G constant for VA layout calculations
- A task_size() method to Mm for determining process VA space size
- Updated StoreError comments for alloc() usage
- Guard::find() helper for finding the first present entry in XArray

This patchset depends on Onur's xa_alloc implementation [1].

The complete patchset, including the Tyr driver ioctl implementations
can be found at [2].

Link: https://lore.kernel.org/rust-for-linux/20251006163024.18473-1-work@onurozkan.dev/ [1]
Link: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/64 [2]
Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
Alvin Sun (4):
      rust: sizes: add SZ_4G constant
      rust: mm: Add task_size() method to Mm
      rust: xarray: Update StoreError comments for alloc()
      rust: xarray: Add Guard::find() helper

 rust/kernel/mm.rs     |  7 +++++++
 rust/kernel/sizes.rs  |  2 ++
 rust/kernel/xarray.rs | 28 +++++++++++++++++++++++++---
 3 files changed, 34 insertions(+), 3 deletions(-)
---
base-commit: d1d81e9d1a4dd846aee9ae77ff9ecc2800d72148
change-id: 20260416-tyr-ioctls-deps-25805eedf332
prerequisite-message-id: <20251006163024.18473-1-work@onurozkan.dev>
prerequisite-patch-id: c472a9548969ac774d36fead73378961a0d0489c
prerequisite-patch-id: 63890b91e911cf96cb42308c056d639580ac0fa0
prerequisite-patch-id: 337eb93db35359c611abe9cba299e6ab0525a2b5

Best regards,
-- 
Alvin Sun <alvin.sun@linux.dev>


