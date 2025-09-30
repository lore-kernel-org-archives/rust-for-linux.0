Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4B72472B6
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759224429; cv=none; b=WNB71NfRbh+G40DGlEhNQZg8IY5lJzitPVBEiaXPXrT6amvzEHdi8lmUOUWi6/ywcYnLyCgdlpcrJ6BUEskweRvbA/AwQp7UaBgpQN9SfummGxZBL4S9/57ESJlQ/ZwSCXOyy1n2w63DFqXqsJBQYQz5d1aQ0aozRkhuvAiS3xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759224429; c=relaxed/simple;
	bh=nnOJoFklgxkNVnV6y19zqwF7kPIYf/E1Pt8Foa/jQz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eW162cXgU54Xf/6z36TY6lN46OvTWIuktqp4iQB/PS++4liGFozfkRZ0bdn6YJNQSV5A12ASizUoUNlLUpUFJMPYxcJaw8B6mwGdueTnvcrwfETxywNnzovHT/BNaswxS5Cift9WfVSf2MOh5hJqXPqy+zb84v3wyQadFsRGD7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lG5tBqPZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lG5tBqPZ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5241e51764so4832373a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759224427; x=1759829227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oV9nwWlvwMw+boSlHYxl2BiHlv2LHDCeucM2QPwsS60=;
        b=lG5tBqPZN6Tai22sjjt8EMPd3kHOkiWAiFG9OT5uc2FLX66DkhRwrJSwjn3CWXsOFv
         GmF9vFdxmRvlTHqMsOb8Jj22Cv1y36sfoDNP6nqoN8mDz3ZkHiYjphG/G5es/0EVuo2C
         ZOIIiuSrPSBsErjkQkw9B0p6ZDSkZ48inD96w1SfpC2aMqNDm3B8Pk63gPBGKUl/1lAM
         9Rk/x+HzdSppxD7jRda3hi2yTCcMagC3W39VPrTPR4Sw2W53RBmWmXxQ5MUq5c9qD4R/
         e3wcN1IcjLtlfllIM5RAVqUdgC/z7uwldiloo4Q57Tb1OkZgkBKF1G65EZGXS+9m8Ukx
         Zp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759224427; x=1759829227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV9nwWlvwMw+boSlHYxl2BiHlv2LHDCeucM2QPwsS60=;
        b=Reefsl+uYU55vbdXeI0vYXL8gE66KsYGGAMx3ka3M92QC9col7zL5M5VjxREL005QW
         vWAkuK55xvfzcs6fcCNH9b9FsHHOcNdIfhiA+viLlIU9wwmXEBeJgH37l1CU9b6O39Il
         seCk45aJgBS9GVE5unFp5hdGIsWh0Fb8BjXdsXYG7pRMstC//IPi7Kknqi4gAdiJ+5Wz
         /q9GhJWKJcTKFF1Z6HGMW9zNl+XxCpu6Sc1ciCdYZ4Ys6ahGgoZRB/X1ndu1mccn9zAO
         bn2yP67szpeqwt8LsCJFlw4/3CRGOWrdGJOjbnEdlXJMWsPwjq1bx902pPZ48qYOtLlX
         00eA==
X-Forwarded-Encrypted: i=1; AJvYcCXScvVRYAzIKCJSxTtTtIDpM1hijPTynrKaSumvYWzqG1v58okC11Fbdu3y3Pst3fkVis7wgwmIK/XYVYLANQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZZbPyESlMnSATIvsrtoDWcTVyEWqmgVvrnKDR59xO6rvmaZpr
	prveBN0H2+EYUK+4p5/ElzYZnjShWPcDVU9Vc9mtw8WMaKuMG/qZnIge
X-Gm-Gg: ASbGncszp2JI2IOyOtqrfDGEqhUbpTJYF8N4dTqQwHVdCl9+XUH7QALULsBAXMmFjoz
	vVVNm8bPlUHr6TZPdRTPfXtYmpFxmy/FM5+gMHA5DJfboAM/KYSkUy5BoH0f0YwGpIBPQr32rED
	n9Ut1aLr0ErXeiYPMBRc0hy8rHLVN4bXawJvaZyTDxdue29w15ElYuh+1PuD0BVizECOEs4ShW6
	apMcnJ5ZpgEapQGh02nNbpdS0ReZYxEFt1DmDDsyJlsl273rAeOOt+qvERiosToBjFgWtV3b7rt
	Jegon/TfhJCYQtc/guTh7wC/L0zA5wMfWqSq8iDu7GQy8rlFN/u3NEEIyN2MMHki7JiH6w+SDkX
	MJN7CszhxBDkdr9lOs5EqFETwSmaWzi//jgn26tmmiwaWoVTHnXqOu1DE
X-Google-Smtp-Source: AGHT+IF5Mmu2cJGe20mrkbic7TsBlJPKePi0vu8IJGytdkUd9qXqS/ol7do4D3mDYqG73gSZQACchg==
X-Received: by 2002:a17:902:e5c4:b0:27e:da3a:32bc with SMTP id d9443c01a7336-27eda3a38b2mr187134845ad.33.1759224427493;
        Tue, 30 Sep 2025 02:27:07 -0700 (PDT)
Received: from LAPTOP-1SG6V2T1 ([194.114.136.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bcd9afbsm19821660a91.0.2025.09.30.02.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:27:07 -0700 (PDT)
From: djfkvcing117@gmail.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Onur Ozkan <work@onurozkan.dev>,
	Tong Li <djfkvcing117@gmail.com>
Subject: [PATCH] rust: file: add intra-doc link for 'EBADF'
Date: Tue, 30 Sep 2025 17:24:33 +0800
Message-ID: <20250930092603.284384-1-djfkvcing117@gmail.com>
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
2.51.0

