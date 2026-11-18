Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008763;
	b=UnBf/oJCqfycjQXPDHhysXee9P9TabImnL9bsSrJV9gQkSQ6WY7Ruo/SH1hYoG7ouD/a
	 EKKRa1Rc3HRuU0qlLoVsO2L04iq1+RTdUnha4QFw+amarSXzMwhC6S7AnE6AQNC6YWGPZ
	 KaH/ur2L9Xs6O+EsrrUc1CW29QattwrOW3SroRdVKUc464gfgT772ZcigdsYgsoOwjDdw
	 7Jxcr7LqbpCkZOJLPJtL7K75HHfNliUdALWt5i9Li9Gt0EJPyW+OZvnqtywCBRJrLeCAh
	 1KExUv+uKOiSlY897gFTt3LwWV1fT2FgE4zDocrAYqfLreNNG1vXrmXntkUA2EkXIkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vARgZ4ae1GlRG7TFzkKePX/f+At6TdRa5dq48dnLYwg=;
	b=lJI3wGXOCYTlAE7qWHdbtsK5zq9RCbn3u80vItij6+fLam0YS2af7B0wZrSjlzC1uxTx
	 1/u0mIpgF4MYxIgvc9Vh9fuJVynf/3+2VpM2FzLNH/D2r7vHFsYEA9MYUiquzddsNF+gk
	 I2F8TkpO/EeLPiB0xxuOilqYEfIIcTvYgn11eLQ233kzhgSv4/4Tt+oPnMKKFHXtzT5/d
	 lDKDe1Cozmvo1+KO+vkFAWmFBzrHabTyoiKpg+xPExFpsckAXc1HDjpwHHd++7GQIFyjc
	 8ERmW1A92ivd7d3yTcGT9dXJuTAwnVB6FH5+lXWJH7drQicV9LwQsYoRlBeZhJ96NzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0HGTCba;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74844606A32F
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 13:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74844606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0HGTCba
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1135320e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008761; x=1795613561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vARgZ4ae1GlRG7TFzkKePX/f+At6TdRa5dq48dnLYwg=;
        b=R0HGTCbaAt0zBaWeiU03QdsUJ5zB3b5nl2+hCxiIpFJveWiSYRqck2FLSpimAl71oi
         RPVTb1zX7Td6eSZXvcqJ5GQakK8jQFlR/hqbdtNjmr6W14RYBqQp9Qf7VTht+2cX5Pya
         cIXOgxwaW8F/ZHlUlVj/L+S0rgjxMnPEHWVLxJQ5tqfP/tGgMBjUvpOptED3DDL7U4lW
         3EXzCsPngS2WxozP+/fuyI2WGhmTC5XbIq8jxRuPnQD/BPQhwA0Dw8UiG7aEeYmlumDl
         +viPvvBHNaO/ZrO/ivZlU9u+nT3uke3BXcq59CvvMq1j916Cef3BNDanSzP3gMtDoEYI
         I6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008761; x=1795613561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vARgZ4ae1GlRG7TFzkKePX/f+At6TdRa5dq48dnLYwg=;
        b=dvS+GxVjLN2eMcM4vnZystj2zicYCW2yjZEL/ylopOmaNC4JdWuXARzadCHeUTDTyp
         fWIu+yf+wX4vt8+2s84+eLovYIFsO/UAMEUw8drdKuK4TV1EwheZ6Y6clY6KWh+7UA7h
         h8hjbnxj+uSNFPQFyFOSVN+uFzVoM5m7lXFo+D5qCyDwkCZ0NGeSodr+lC72J/qJBOSl
         EAUFcE38/Sr2wwSm8kwO3wGjI2/w1DKYmFDJrKOmtGORpD8mc1/Sgp/j7Nl0bS2vh4be
         YBBLxOG7s8RcTw56Y4NjTIoo8mBTfubtf9vsbJ2i2FsUYBaf+4nY1Wj6VElV0QW7AGxw
         bwOg==
X-Forwarded-Encrypted: i=1; AL+hErF402JDcyZ9rBEpNCtdbeOrQ11GWa6RreMAXHkHRoUD0GS/kNR2iU2r62K+IUu3PIKUerPAVh2/0mSWTSQQYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+m/iJnarFPfI9NXCPQs/Q8klZNAiTHKNMTGh/MwEVHZgjnmBbC
	R7z+P2Hfviye0oVI6J4BggRKrIx9dwb+SIkE/KQYnc8vtkLrsZSXl1W5
X-Gm-Gg: AYBFou0zDdZS4JO9gpVP2jG9gQW4Ybg79uq2WCDA5jNuuyWgB3K8AU75A78VvReA4/S
	9i9WaI8IdDZDZfJqWaEHtk9kMNye7a6FXyQjSp2S+YfXa3v9GAgkCVKnRgoFjuQYKf0u5a9nzFY
	0nNP/KQzhe/nqZqvRzqmIOT+Tmq0klSma18pcWEPGDw6dyZ9qeDstQ3nNxL6B4ltxzXaO8ZEcrS
	0q1Zc5t6kB9gveUdJADVeEt+lo97UC8ubSQLwXnYZLWJv+Ovm3E+953hPFs0mPNIBBDAJJ3LE0r
	+JjxhpHvJ59TE5IA7MOG8xQ5IAHLPEYrf9t9Sq6+nJ03/shbVijNSLiIDv4Td0HQpfECdIdy5ZZ
	ekgfcdf8+R/xzjcoOrCVWS6EcetN4t7iPglhzqE1ENvLfGkMSBZlU5JO15wBSKmiA//J/KAIIxc
	tlSiv5t0aVy/0vSoqPC1gRjiN+uucS6wCDf6zB907N+5izeFonr0Js8bmsjoQArmiYZwJWoVtib
	gGk9SauY7e2ozAzOXOy1wLGTVaVA/6l9P6tn57nAbhl8mpE7tNuUgf5qncuJ553XVrX6iVSx3Bm
	vaw1qtDv/YylSylBoIIo9KKAQLLXasTLKEoPjGCv8ZhBsZGPVO1jwETy/VyUZrBd933OcrQj5+2
	OJM92AXXfBaZZ7nvOJE1wwqNDr1cD+mXpmAKr88w6Yn68tagsl1gxqrFCNzD4put53ccFmZqV87
	iq
X-Received: by 2002:a05:6512:104c:b0:5c0:a7f:3ee8 with SMTP id 2adb3069b0e04-5c1a9d25ab8mr1067457e87.8.1795008761239;
        Wed, 18 Nov 2026 05:32:41 -0800 (PST)
Received: from C422HJQPQG-Fractile (cmbg-18-b2-v4wan-168328-cust3701.vm17.cable.virginm.net. [80.5.206.118])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm4798809f8f.4.2026.11.18.05.32.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 05:32:40 -0800 (PST)
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
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
	Asahi Lina <lina+kernel@asahilina.net>,
	Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Vishal Moola (Fractile)" <vishal.moola@gmail.com>
Subject: [PATCH] rust: drm: ioctl: fix call to unsafe function
Date: Wed, 18 Nov 2026 13:32:32 +0000
Message-ID: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
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

dev is created via an unsafe pointer dereference. Following the
convention, it should be wrapped in an unsafe block, but it is not.

The compiler only properly lints declare_drm_ioctls! when its defined
in the same crate as it expands in. Since upstream drivers are all
separate crates, this is silently ignored.

This has been present since commit 9a69570682b1 ("rust: drm: ioctl:
Add DRM ioctl abstraction").

Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>

--------------------
Based on drm-rust-next.

I encountered this while trying to build a rust driver out of tree. I
copied the macro to an out-of-tree crate so that our uapi can see the
same generated values without needing the generated bindings.

Ai has told me that this is because the macro expands from the same
crate its defined in, which sounds sensible.

I see:

error[E0133]: call to unsafe function `kernel::drm::Device::<T, C>::from_raw` is unsafe and requires unsafe block
  --> driver/drm_ioctl.rs:77:33
   |
77 |   ...                   ::kernel::drm::device::Device::from_raw(raw_dev);
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsafe function
   |

Plus a number of warnings. But warnings are warnings so those are
whatever... Its all silently ignored upstream anyways, so doesn't
need a cc-stable either.
---
 rust/kernel/drm/ioctl.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 64af9eacc306..5a2e2f4f0e91 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -152,7 +152,7 @@ macro_rules! declare_drm_ioctls {
                             // dev/file match the current driver these ioctls are being declared
                             // for, and it's not clear how to enforce this within the type system.
                             let dev: &$crate::drm::device::Device<_, $crate::drm::Ioctl> =
-                                $crate::drm::device::Device::from_raw(raw_dev);
+                                unsafe { $crate::drm::device::Device::from_raw(raw_dev) };
 
                             // Type-inference anchor: the closure is never called but ties `dev`'s
                             // type to `$func`'s first parameter, which the compiler cannot infer
-- 
2.55.0

