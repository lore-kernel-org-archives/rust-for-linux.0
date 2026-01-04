Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF6C2D3ECF;
	Sun,  4 Jan 2026 20:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767557289; cv=none; b=pjPSMjFWadAqXkYX5TJCDWgHJnyfY3Irx7n8t8FTIR3Eml+4kqgCBbncV3Q26Lze5ftjmRUitSJWNyZgRInXteDYmLLRC9dQWt+KlUiNfI4EeMCnAtAKkFmmVNOzX4HlIGdFl/f3GeIOuP0wWkqFv1Fa0jSHY/PSve5UA2jwQds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767557289; c=relaxed/simple;
	bh=zx+SwXeUY/mRzsEeW+qHs5tewQiDWfZM5/tDt+5m3wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KR6ANxZfuciSukZ71VcD2JPcAexzo+eTMomp7zs/jlpiKVG3sBmQrzYP7+q0LJwKxXZLnttP+8DUXE0sjU0CNayQKej8eVmzveCzu+GtbEWL7p2FGN8U7XKxQmBU6HQT+nhTOssm/f9tTPd9kpLKG7HaQ9T1wMpYt1C1wJC61B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iBRImHm3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UFXy0n8Z; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iBRImHm3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UFXy0n8Z"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dkpQ834tVz9snJ;
	Sun,  4 Jan 2026 21:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767557280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1bFVgbKd2bGX2uopKiOokyPDAQ+3U4m878ja6n9ICc=;
	b=iBRImHm3YZKOSDLxCmKXIMmJGvBjZ1NNNHjSd7boqJT4IDXal4nqsANtNJTS5Hl0JqeDdE
	QC0FZTq79Lpta5jXrGtNSsSSd1vjgvsItpONmp8OTXRZFnNovolff/NVkbU1DUlVOWw7pu
	vMZos0A+hURWe+ghPEtHCMG1Ftm2TAKNDF3mmxpyfmVv9+/frcr+ky2d8pNMLsDa2GS4TO
	5VGNWJgay5ioIx8M7UXMO54rZpfrWaYAot5TSDK0GITk63LfhWQNo38kLrx1qglJyHw6mg
	5C6VHlMg8R6EKL2n2IiBazQfvvTmGd+eSSi7jQkKsPDD4vFj1yfGU+eshVcQBw==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767557278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1bFVgbKd2bGX2uopKiOokyPDAQ+3U4m878ja6n9ICc=;
	b=UFXy0n8ZUlf+8CebJcoSFv4UsJbeRaURhXYI1Q7cFe4UBaVBx2sivR3wShdYcj2OKf9KmX
	VFuhG0WyQDkP223RgNDC02xuV7EqsPry3+mfXEsh5mNhmR9IfUu9JzJmY/KCUooWBHxqKv
	dxYdC43A6EYzWZ+XWDSr6YNhuVeiCbPx58c5sF0fG07JlJyq2wNI8fiyDkF15X4sbjrveM
	ac6WlqvWYXwJxDyS88X498SzQ0aBqu1COaj6AbGHou73hb0+dOMTyvrWQmyEnlUdHk9WI7
	cYadxzFM0Zv69BcRfzx/hzXeLc0ZSgj1szu0+Yb0yEasqxPFjVFBMKZETWzWaw==
To: dakr@kernel.org
Cc: aliceryhl@google.com,
	acourbot@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	mhi@mailbox.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/2] gpu: nova-core: Use derive Display for Chipset enum
Date: Sun,  4 Jan 2026 21:07:32 +0100
Message-ID: <20260104200733.190494-3-mhi@mailbox.org>
In-Reply-To: <20260104200733.190494-1-mhi@mailbox.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d7f6dc98ca0715cbf2a
X-MBO-RS-META: 41iyczy5oti6zqpyf4g16pc5jha3nowi

Use the derive macro for implementing fmt::Display on the Chipset enum
instead of relying on the compiler-generated Display output. This ensures
stable display strings that won't change unexpectedly.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/gpu/nova-core/gpu.rs | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..db2e913f85bf 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
     device,
     devres::Devres,
     fmt,
+    macros,
     pci,
     prelude::*,
     sync::Arc, //
@@ -26,7 +27,7 @@ macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
         /// Enum representation of the GPU chipset.
-        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
+        #[derive(macros::Display, fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
         pub(crate) enum Chipset {
             $($variant = $value),*,
         }
@@ -107,20 +108,6 @@ pub(crate) fn arch(&self) -> Architecture {
     }
 }
 
-// TODO
-//
-// The resulting strings are used to generate firmware paths, hence the
-// generated strings have to be stable.
-//
-// Hence, replace with something like strum_macros derive(Display).
-//
-// For now, redirect to fmt::Debug for convenience.
-impl fmt::Display for Chipset {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(f, "{self:?}")
-    }
-}
-
 /// Enum representation of the GPU generation.
 ///
 /// TODO: remove the `Default` trait implementation, and the `#[default]`
-- 
2.51.2

