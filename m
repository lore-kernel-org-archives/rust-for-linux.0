Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A581A6807;
	Sun, 12 Jul 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863605; cv=none; b=AnHjbcyF9v2B/B9IMsiQeWgZLUm+MZT55xsOtfjvp4c/AxbbnJUvfXc/ffhZEUajhw6uhgBo5/xZmAArLbZOmMFxpLIce2G7RhPUmcF6EJHG/mpn1Y0o9TkiR7dIYG7UlC8oICjejqpqaLCLfPpOmW4ln4z24Vi29p524pfkpe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863605; c=relaxed/simple;
	bh=VF4oES448GeKOYooFFIccE4cclg+MSX91v4GScUJ3jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oi+awbbxSg3lJjZUhBltSN6jfLj4o2RT+J3gwctF9DkEZaFX7jpE6jRpw6pYByTMcsZUFvIJ7SVU0Y1v1BTIANyjKkxnx8ds8lPUSuL7SPXoJfUTo7fbgDB8WjoBwVeSYkiIlIlxJbPbpJAB310IjMgGIcFjrnlc/H9fqs+kT80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB3aDO17; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB3aDO17"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D784C2BCB9;
	Sun, 12 Jul 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783863605;
	bh=VF4oES448GeKOYooFFIccE4cclg+MSX91v4GScUJ3jk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VB3aDO17PDh6OHUWcr4qNaKci/4zvYJdyFfCEJCrPTS6Qq98tuKwF529edw2SJBhk
	 ejHYT43cJ9+wl4RAf9+nIHWk9oypwgKQPr4ONfcXGPlKxvHQRpV/tRoMVJ9otm6XXF
	 4GAun65yMsT7ZwzawdLzfrBcK+Yk8v2Z5hZqlwpYXxd8edKyK0wW+NngW7gaU6IDVI
	 WKKbdt1BSkJrzql/RRQhVO7Ip7c70+qzcROYQCaOyziCDlGwWlTvgOJR7YNSUQPDP+
	 jzzpaEWB9kbojTsnDf9OrJZ4bc82CrhWeVUcNB2U7N6bGhaYmxdUDtgnYS1eTFUw1g
	 rxfwIKoxPKEcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A66BC43458;
	Sun, 12 Jul 2026 13:40:05 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Sun, 12 Jul 2026 15:39:46 +0200
Subject: [PATCH] rust: drm: Fix typo in FEAT_RENDER documentation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-docs-drm-feat-render-rustdoc-typo-v1-1-c9df1cbbce4b@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wrCMBBEf6XsswttqQb8FfEhl6mNYFp2U6mU/
 ruJPi1nZji7k0IilK7NToJ31DinAt2pIT/Z9ADHUJj6tr+0pus5zF45yItH2MyCFCAsq+ZScP4
 sM8OYwdnhPJZLxbMIxrj9ftzuf9bVPeFzFdeFswp2YpOfalRtnLBlOo4vWD1XTaEAAAA=
X-Change-ID: 20260712-docs-drm-feat-render-rustdoc-typo-e774ba45f774
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783863604; l=1163;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=nFTIjsRD4bAT2kAKAWEo3ns3uC/V61sCbGPMbgYLnGE=;
 b=mJDT9j37Cs4ako4ZtN9x7e2ECNdlWeueLgwKLlhevca2zuiuJ861CYUDa37FTGv3U8yA3AtLM
 +tGJLO4D6O/AQOqrADyKe9FAKoYweLjol7FDYAkRMMUR1nfF0iAS3vy
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

Correct the spelling of "privilege" in the DRIVER_RENDER Rustdoc.

Signed-off-by: Younes Akhouayri <git@younes.io>
---
 rust/kernel/drm/driver.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 25f7e233884d..1dff81442b61 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -125,7 +125,7 @@ pub trait Driver {
     /// Sets the `DRIVER_RENDER` feature for this driver.
     ///
     /// When enabled, the driver exposes `/dev/dri/renderDXX` render nodes to
-    /// userspace. The render node is an alternate low-priviledge way to access
+    /// userspace. The render node is an alternate low-privilege way to access
     /// the driver, which is enforced on a per-ioctl level. Userspace processes
     /// that open the render node can only invoke ioctls explicitly listed as
     /// usable from the render node (i.e. marked DRM_RENDER_ALLOW), whereas

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260712-docs-drm-feat-render-rustdoc-typo-e774ba45f774

Best regards,
--  
Younes Akhouayri <git@younes.io>


