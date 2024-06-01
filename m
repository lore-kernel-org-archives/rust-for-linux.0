Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF35625
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 04:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717216642; cv=none; b=dkWiLYi9lIvxeKgGcYHr+leGa+oSG9gouGDzxqz7Z3ww8YbeUVsbK7nAT2K2f+iDeuH81Qu/KqCBuMM5ZbwauJTc0pGrCSPpKfOGjl2ZMA8McbLjZI5Dh8iUjUN8P7FUdjfQUV30nW9y6tkwTsSpzytRl+Fr0nXkBWHwCPWml18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717216642; c=relaxed/simple;
	bh=yPJEZIVarDHaYU1/atrs/Hc+QVkBLpduqo4xo2a1mCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ONmR0W88j4KzE7nU7V5AzsxdisCG4SGVCy5O0xeJtkg0bhApJm1TU8I/uXYC2adEDl7woQpHZQwtKQXGECdYN+/3oJGFwtJuhn8zoEmJet9jnpDWlA7TVhaUaODs8lWXNSP83mFDpnzwcm3atz6HGW3wp43qFda3EpvpoAPbK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiXHtyI+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiXHtyI+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f8e9876117so249557b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 21:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717216640; x=1717821440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpZD4FA9q0o6WlrigVDj4DJVsCFgOGBJ1U7ERzbq3k4=;
        b=TiXHtyI+Avy+KnC6y3DufwZ2vYnA4tPr9m/k6Pj14rYJ1JPeyxV6Fq9aROyn723xFB
         xDgDs3q7ENtgih/+LqJOHTGYEAW0O1oBzzR0uvHpnN8jOPKk/jTcPvVgIdIqXgtEA74B
         vHKHg+yArTfDaCJvMRrk/pGHkyMZM4bEc5IYh1hUaJDPcXHbeme9NFACIWO/3U4CKxK3
         MBajvZlF4UVqLk/raUtCw0cR/il9tafzU+mPb/amESj3FeEaoWIDYtKqjNYWoTSeVt6j
         +TEO7bjdlwaxRcvObbT3KXR40Ferw/lmgpimC3qbkhrWXUvLXI8FygnY07KojPAkmNdz
         zbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717216640; x=1717821440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpZD4FA9q0o6WlrigVDj4DJVsCFgOGBJ1U7ERzbq3k4=;
        b=A3bULiLjuTldd1KD7g13Kq6IPTkcTk0uxlyYTb+zi8s3knQF4a6wEYDvwlAYl7FVWV
         wd+ShRGMDZRP9BFRmphAeMOKgBEpzOWUwc2pRGOcXKMgobnlGwEE9vut8Ws7LogAwsHx
         exgNxhNkuQv1dojkV8nY/djf+c6iA1CIdlzvi8j37qMMtltuDyCT2E6RaGMLBKqnGtLj
         jZ9BKw/JcWXHONczJDD5QW/xJkgMJXoVvoFEuAeK9YkeRDIL57ue1mHdzezp8fQAaprQ
         umxBdxqKDGSOcag/Wk2Au8fswQKaB/8+VRV9Cq8RtH50c4MFYPxJS0bo4jsvrbgA4VFB
         qkQg==
X-Gm-Message-State: AOJu0YzjFBSAfGn9ltWrQRq2/rddKrOl41zcLW69En9geujw9ENYjTkt
	G2nA8OckIAmuVnTtvyZsyXGOiLcrcYp+9ZXw9QnFT3qSrVuUhrZnlJ0AHHXw
X-Google-Smtp-Source: AGHT+IFcyMzBJsvbrS7rWiVC3hKxCUoXTtzHBcGwzrOzcRcnX4cpKg5bqrejglo3CRqmaljhJWKXNw==
X-Received: by 2002:a05:6a21:789e:b0:1a7:91b0:9ba3 with SMTP id adf61e73a8af0-1b26f30dbb1mr4793604637.4.1717216639926;
        Fri, 31 May 2024 21:37:19 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e212sm4013086a91.16.2024.05.31.21.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 21:37:19 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	benno.lossin@proton.me,
	tmgross@umich.edu
Subject: [RFC PATCH v2 0/2] net::phy support for C45
Date: Sat,  1 Jun 2024 13:35:33 +0900
Message-Id: <20240601043535.53545-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for reading/writing C45 registers and genphy helper
functions executed via C45 registers.

We could add methods for C45 like read/write_c45 and
genphy_c45_read_status. Instead, this implements the API for C22 and
C45 with trait in an unified way.

v2:
- add genphy helper support and split the patch
- create a 'reg' module
- define C22 according to the specs
- handle C22 vendor specific registers
- add const for C45 MMD
v1: https://lore.kernel.org/all/20240530.145258.456915814420167538.fujita.tomonori@gmail.com/T/


FUJITA Tomonori (2):
  rust: net::phy support for C45 register access
  rust: net::phy support for C45 genphy helpers

 drivers/net/phy/ax88796b_rust.rs |   7 +-
 rust/kernel/net/phy.rs           | 241 ++++++++++++++++++++++++++-----
 rust/uapi/uapi_helper.h          |   1 +
 3 files changed, 212 insertions(+), 37 deletions(-)


base-commit: e19de2064fdf6f1f2488e36cf3927c3f1d01803c
-- 
2.34.1

