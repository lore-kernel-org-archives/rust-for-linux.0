Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524D2F90E0
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Sep 2025 03:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758080336; cv=none; b=eTetwPdIJd3WnNpY/iRvnv/TZDOuDGojaCBi7lkuTbKu2+lXtmSzfWf8zKlZqPTU7uoAfsUScoxsDhya38asHN9PQDqTibc9SnJacE5b6wx+BsZr+CuFLxEuw5zR2n9GQLclytzlYW02j+Yk38y7Ap8HARTpD3bz5p+lL/2v+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758080336; c=relaxed/simple;
	bh=7lmroYbXZ3jYHLQWLFzJWOCaxrUS0F0MWWUAjtp4xGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iHNi7P+PNBbcH4zrbEm84Deb3psmicQEBKLAKGDyNwFuGJGQnVsEFAKlS7edRj0CFH3dkkgfIZpRYa21GwxNeoMkFvqMXb/PDcoapx3OE2dWHqmB8PmpKxSvDJv82RKU4my9hYZoinjC/gzt/e2kVcBP5J2741K0xjZQ8aJWZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1I9eY7L; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1I9eY7L"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24cde6c65d1so54137525ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 20:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758080334; x=1758685134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+PEicOZlOrq/FatAZZFuiytqhYw1ERpH48QYBjUJ8E=;
        b=a1I9eY7L4WwuK83vH9xx08zVvSfHMhzZfA60/xQR2TFgGraN5TuVT+aNhVwFiWtXZw
         xF1SRExlqY7XRgq1pt071o+UC6SI5DbdET2t5agwdxu3J7yyi63MpGTM2KM4dMcm81EZ
         iGO67X5T7C4QhX6IWEQzYaZTQtgPgxnSOkZwI5Ro18UbFy387KROsGmwNr1nsiQL21VM
         B2gAnZ+dHVZVhp9oukxinEUZh1U/vjxslRZg+/WCY8Nq6Fe5nyEnsNrVvpm3tsD6TjCg
         QMPhhZFKbjmuCwafVrRoPPhgTyzZeEXN2hoNIOSZ0TgzojdRYiaW55bNigcG1onCdKbo
         XoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758080334; x=1758685134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+PEicOZlOrq/FatAZZFuiytqhYw1ERpH48QYBjUJ8E=;
        b=NAfEeFULHb4vyiRncVX/U2gD+I2N+XgnJFrWNV+a2OOS7RBVUmOE3aWgadGRdZibnN
         5ZhzpzCTDWF2MCkzjXg95ee3/mBlARoLaCXE4gYP+R7/bfY9Ssqd8AZQGy/+NI7QxQhi
         2XXQS3MHqQ+aAveWsiKhECcPX8XS/XO4IlBjGgiK1VG0lBrNWuhj0NytgHrlrx/S8GE8
         3jGYU/3bWeGPPDL9v9OFH/3YdBxBVwTgNObxRxED2+SmrPR4+PR5BRfaQ+36pWCD+fPy
         4DhzLH0/qmIKjZjypcjcyXY7uQr5TTPWAUdwU4+QlLbSDgjePGFpc48NYAdScOzbPcPf
         mMeg==
X-Forwarded-Encrypted: i=1; AJvYcCUGCiiI2+MlUlkFmQaLtT4Js+8w/85DJwb+quEK15Y+wIQzwAmiSdaEZDUDPEAGZ75Bdb/lEV1uqDegoMipnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IpynN7ltTSd5YEJZ+GgA92aF9cmqf+eG0A6irmbCnNmDMl7k
	kT6FF5Dmvp2a3fgDUhMj7jLE1CDJgfc+a+OsLcomqEc5HuL9PX1nhPhsOESBZml+TAa89n2Ggzk
	=
X-Gm-Gg: ASbGnctDyk4ydXgpwJgXeYbi9tLN2g+g8QsUMl+3Z+KZiNCZL1nVbIBFCfJ3srgZZGK
	XH1Ka/hVML1thFt0ifoTzp71M0nU4ysCk4frrtgA6z8OEzk/YHHk8w1ixEMzdSKNui5/Ldk66EU
	1NgWonz2oc+rPMJ47eqUOWG2F+XGfKzsMnyPjn58y44uFt06thidgI0XTj/R/L0rNfXKWYddsaL
	hIaDf5Hns7uarnzoXYLXndgxOENsAOgaqK1+3OUrDckxdGWFq72E/R5WdotJKoenaG83CegGRoP
	URrJVFk1ahGhakhBWiGxem71N9P6hRNMha0QPMh+DCsMlxLANCXg5GgzptZh6G1H70ENbjg41Sc
	cnbCoXNyf/yrFa+YNtr96HABOyYFq1I2mpdffy3Q7
X-Google-Smtp-Source: AGHT+IHy+1k8k3fFOOqCUZ2yFSZz0O/pwBaT70fSXPSBqjZ3VXyi425K3IsoaOXB3a6ERrNNVccGLQ==
X-Received: by 2002:a17:903:2acd:b0:25d:d848:1cca with SMTP id d9443c01a7336-268136f9cccmr6032175ad.35.1758080334177;
        Tue, 16 Sep 2025 20:38:54 -0700 (PDT)
Received: from LAPTOP-1SG6V2T1 ([149.22.88.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26804b83afasm8002275ad.68.2025.09.16.20.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 20:38:53 -0700 (PDT)
From: djfkvcing117@gmail.com
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Onur <work@onurozkan.dev>,
	gregkh <gregkh@linuxfoundation.org>,
	lossin@kernel.org,
	gary@garyguo.net,
	Tong Li <djfkvcing117@gmail.com>
Subject: [PATCH] rust/fs: use intra-doc link for `EBADF` in `BadFdError` docs
Date: Wed, 17 Sep 2025 11:38:33 +0800
Message-ID: <20250917033838.8171-1-djfkvcing117@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tong Li <djfkvcing117@gmail.com>

In rust/kernel/fs/file.rs, replace plain-text `EBADF` in the doc comment for BadFdError with an intra-doc link [`EBADF`].

This improves the generated documentation (so the `EBADF` constant is linked), and helps tools such as rust-analyzer to resolve such references from the docs.

Suggested-by: Onur Özkan <work@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1186
Signed-off-by: Tong Li <djfkvcing117@gmail.com>
---
 rust/kernel/fs/file.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 67a3654f0fd3..f3153f4c8560 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -448,9 +448,9 @@ fn drop(&mut self) {
     }
 }
 
-/// Represents the `EBADF` error code.
+/// Represents the [`EBADF`] error code.
 ///
-/// Used for methods that can only fail with `EBADF`.
+/// Used for methods that can only fail with [`EBADF`].
 #[derive(Copy, Clone, Eq, PartialEq)]
 pub struct BadFdError;
 
-- 
2.34.1

