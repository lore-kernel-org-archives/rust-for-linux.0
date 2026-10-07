Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC9541B8D6
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 21:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407931; cv=none; b=rZtUQZCo9wec1sCK1+t1tudPiKD0j1l/SGbUB1/ytwKIm1rnp7IheKCML+hA3xSbLBETdYsYgfIzCYXYUnZ9wDwkaJcKdK6Kg2muHKkcItEi3JzVsGm34y8e7E1HwCN/c+/gejn9V+5DGrU9IQw3I8AsBWnTaA3FQqKvWaeXbKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407931; c=relaxed/simple;
	bh=7XxVSODNvDqXDnLLzIpuDg4yDwUoGtWWkcGY+d7OGCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcvXdAdEpwbbKsRx0UWuCKm3yVLQi7AvYiIcdsQtYQEr3i1tlFdasPpY6l5Y5RJAjQK4offt8XBiiW+dZzVCrSuuO3TnOZT3YB3ngJHpE8Uf0rdamcCy2XEGk+JjEs3gIMSTJ0T9neLx/AKhaE61nz87qPmx9V7WaFQVKf7ihms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr8tuVmZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr8tuVmZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so23428045e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791407928; x=1792012728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCOgnzxgPsldEawW4qaR+rRqfBySYiXshFn8/j+fwrI=;
        b=Pr8tuVmZmyORH/lewgAjY+YVoK20fNehrHxHDBUpYjBz24eMvJ+KpFJaOnocCGP2K4
         4ekqBfE5qVsXlddUZYvg+7tyGdHKOivhFDF/y3JQP4QpMjcZzuwiizFIlTtgpIaj2gu2
         frjw2byVfH24Trvrnx5JD8SRyT+rVk+H3slrn+pLe+XbiUC3dk1eW1cwQwaYoAw3k7vN
         xQ5ERz1JRzgTCytmcr5zsKecqre5G6RgHrrni+pffFdpepwpPe3FbtDCwFJwRIFQn8bf
         ufeb2+le0mRtQsT8cvavnQHfk+tAR18BnuytwQk+Ymf1Ao27ie822AzXCm2wSYLJ13hX
         Ap+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791407928; x=1792012728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCOgnzxgPsldEawW4qaR+rRqfBySYiXshFn8/j+fwrI=;
        b=PxNQ8bdQ3HcNb92LeA+tOwJ/qBy+OX4nT2Ktl8TLaPQNTepgBn48vXOPGcnrlyTWll
         XEst+x+lmtdjUtpK56/C/zfaQo2jZTyMPtdjPQEium1qnFeraxQ5GwIckIqXyKGe+Zhl
         IQXBHQ6fO2aUufPg9ilku6uKkz++LBkXSfDDCIVwZbrJ99KoQcr7xligzzdmWG9J8uWX
         c/1550j+E9gYVJ7hkyRWALSkpYQfmudk/MqV4m+laX9i7NDv5HnvJtVl701RsMfaUeAy
         2YKUonemWrzJnR9sV4wVIpAS468eQieLCyEU2MJdisG30wMUht0QYixe51esFU6FXrYY
         nb9g==
X-Forwarded-Encrypted: i=1; AKwUvBztIUgnWmPbtYLz8XskhTpc84z+QM2Hte/Oz7mEmcfIlvfgAxv7k/wFRQcR7KSQPorhpe8bd98B92a7qib68Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n4VezVfoM30VO6iIFP7qdhSNKHjV9IhaEI8xU6L7hHyiFVNOSD
	Rt5JwTAs3U0jyfBL6OMR/CN1ysOnraUtyJe/ZzLPtnNrybTr+Shqe5Ki
X-Gm-Gg: AYBFou3DDnyOOi+4h2IperyoJQiuWNDH+YVYkqQwNf0AdU9z7tH8wpasIRFrMVBzNB7
	FAvgw+D9q/FTcPGU8iv7PCafl7Or5MCtDzsHVUs9q29YlpFwHyTVAtkhj+J2c/60VPdHBRUvLhK
	ad/3goynHZoXdFH1xG9eTjdGAoEkLDG9hMib/BrOe3ZfngN9LUwQnTT77LxeByQy72KyOSp4uel
	mbo8BAcR7YX8pI6irqYVqXBSfokoPsmatYslfwt2csIFPCJ3qCnAZaa6RFPthh0+QnjahShrdTB
	iyxl0IWZlimggQHZ5HOScE6gLU8ZX9vy+3qIbrpuoUIjo5f1pBIZWIdlr6Q95AF1esX3etFf/Zf
	oUTl0XGcAeOT6s5hpT27nOcvP5/5QCvMbSl8tsxppuh/9q49iWfM61UjjTsGWkknpqd/QSwCYE5
	W09vga8qy+JOU3Ou7192Ue5JpFWMAVb1CrFEtIIOZfGeD3ewfjOO3TEGzrIw9MnuRxRfEMMWwmL
	Tn2n7/deRj89D01kSoKPWPwFB2O1/9bATx50fbCJW0TkrfHm/Q=
X-Received: by 2002:a05:600c:4e45:b0:4a1:6c3d:cdcc with SMTP id 5b1f17b1804b1-4a18043b382mr55914275e9.15.1791407927690;
        Wed, 07 Oct 2026 14:18:47 -0700 (PDT)
Received: from sp1der-OptiPlex-7080.epfl.ch (dhcp-122-dist-b-107.epfl.ch. [128.178.122.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f446d51sm57964705e9.0.2026.10.07.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:18:47 -0700 (PDT)
From: spidermana <xuyiwen14@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: spidermana <xuyiwen14@gmail.com>,
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
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: drm: ioctl: wrap `Device::from_raw` in an `unsafe` block
Date: Wed,  7 Oct 2026 23:17:40 +0200
Message-ID: <20261007211751.2428111-1-xuyiwen14@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`declare_drm_ioctls!` generates an `unsafe extern "C" fn` per ioctl. Inside
it, four unsafe operations are performed, while the call to `Device::from_raw()` relies on the enclosing
`unsafe fn` body instead.

Both forms are legal, but the kernel builds all Rust code with `-Dunsafe_op_in_unsafe_fn`, which asks for the explicit block.
The lint does not fire here because the macro is defined in the `kernel` crate and expanded in the
driver crates, and rustc suppresses lints for code coming from another crate's macro.

The patch is to wrap the call in an unsafe block, keeping the existing SAFETY comment. No functional change.

Signed-off-by: spidermana <xuyiwen14@gmail.com>
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
2.43.0
