Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646940;
	b=RfEcGT6R5T6cQc54zYGLaA5FQlOf3alniDxYPCbxf+gxWzCjgLGAvZFjUxQ7mSWDnQBZ
	 x7MG8GwEKS1BkV47Cfqyn51Y9gC0J3I9FfMByiZTnq/sjFPGR/r5nt3XXDrnvmTa658ir
	 QT/OfRgD1Yt8G9pS5dvzrTXlXQmcWdOrtPxzhduZE8/KTh/hSHUtO6fn8QlgaMZqbfZMc
	 lTZkhYIGsboOneu+Fltw+SR9nxWuwjQFcsXrgioc5QW9p9mR2UdNuOdYaeU6j/27q9zOf
	 2XSGtA4KeETFUs7KLtJDvKU6jYtpRtydWWARpYt4nyLGUV8kEorMvhHZoH2SpvlH/rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646940;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=89a+DyuMeQJsG4Oq5bs30wnrcAo2VSWhNCr/+dnzrqA=;
	b=qc50uDsbTVkWyVYjFH2+6xRPwnN44gEKzoLo6ZCrQq5K/tnheapfEKL4RZNP9QoKt0++
	 uzXhaG11Dch6cASG2POe8BEMsTfUdf/1BFHeH4GSH4R4narSIFM3oD8tdx1vLogJ/VWUt
	 D7sLhzOTEF7Up1aWF4Yn8cQjsz238NiiVuxh87acSUv1YkApEjR4/FDxtkvCTcAERpCct
	 xvdDIMwJQz/vrdca5M571SUrNfPfUfHa7EsI/oVsWaAHO6vxzdomzsk9YuPlscursRQxB
	 4oIT9VcVX5jhXps3mF0IeRE1s9yxD7FeNnoRfIYGoEbQ7C/8q6+9Ds9pgTgALOrJ7HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IGWs9USx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510E606A686;
	Wed, 25 Nov 2026 22:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A510E606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IGWs9USx
ARC-Seal: i=1; a=rsa-sha256; t=1795646892; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EQgbQv5ge2ir6H8NNZrU9e+g/p+N5gabMcJ8MV4s5D3mcWSERzBjaYjDb3tS4ICH9gmvpCwO3dzAXdCJYZD8PLOYh3cmd5xAOJk/FuIk8AzsZVKUkz+EGGqLOxypTMWH0HlI4f7dpkGKUKBa6texTzeaomgp7X6f4X+1gc+YqNc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646892; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=89a+DyuMeQJsG4Oq5bs30wnrcAo2VSWhNCr/+dnzrqA=; 
	b=XqOZBMrO6mP4lYq/5sghitOR2VWKLvAFlF1gL+zjY45U8Z6AWbT/AQj7JwPgMEJQj15vbjnheIKYHkDZVT9otfN4InP5hWRpwpwIIADg5kexI2z0V/RkLZd1Ro+7g0+TlLkQRe0WcsLEYy6rNTU1g6+hTJKWZXsyHmaJyKSlmcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IGWs9USxhQMoUKhfIHpO2NunOsVRzaC9xMrHPZJOnBk0UP7Wvj1QfT8r9qAz1mEdr6dV57uPUbeIiIQDauJWRx1LeENMTjgicv06lbLDFrxFHjrsOsotSrGCLXUWKmRkXuYWjUkgaj0n2sbIyGISiKRHdYaSTamk5OwHTznpAdA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=89a+DyuMeQJsG4Oq5bs30wnrcAo2VSWhNCr/+dnzrqA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646890481658.6372610063196;
	Wed, 25 Nov 2026 14:48:10 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:47:04 -0300
Subject: [PATCH 13/13] drm/tyr: deny `clippy::as_conversions`
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-tyr-as-casts-v1-13-2b2f53164d86@collabora.com>
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, deny
`clippy::as_conversions` in the driver, so that Clippy rejects a new
cast unless it carries an `#[expect]`.

The casts that remain are all justified in a `// CAST:` comment and
marked that way.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/tyr.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index e7ec450bdc9c..ced937af4c53 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -5,6 +5,11 @@
 //! The name "Tyr" is inspired by Norse mythology, reflecting Arm's tradition of
 //! naming their GPUs after Nordic mythological figures and places.
 
+// `as` conversions can silently truncate, so they are denied by default in
+// this driver. A conversion that cannot be avoided is justified in a
+// `// CAST:` comment and marked with `#[expect(clippy::as_conversions)]`.
+#![deny(clippy::as_conversions)]
+
 use crate::driver::TyrPlatformDriver;
 
 mod driver;

-- 
2.56.0

