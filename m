Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC301EFF9C
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436563; cv=none; b=A3mkHqtuxjVF/PqA14jw2s/1GKFdVGvq1pAbUhTjynh9vTilospZHh0vH3D9GiNIpdu3vxDPeHYbkeGftm842YUMOa/8CIGTQJC/sUdSlzCcS44sHrKUMNO6Wmq3UKxa0H/k4diD6gmoYdbqzIMqaFu8/DVSV48fCgCLXa1mP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436563; c=relaxed/simple;
	bh=27vSvks/MWT9LOaf4f0uieR/vssi1EPq3DwLBLqpY44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpG0owhalAoq5BohVKuloTyJvlDz9SRiPgf3rHFoVJ7Ncg71spximkTXi0fPuaNsq/0nRoayxUrEbuWVrlraDmQLTPySHhj65krzV9aGBfasBIS6ozjRKqvg09+1ozJtHZZ+r92vHpeg41z0F1EUZzjA+Mo3Odny97XV9kLUIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=gH5e1A7t; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="gH5e1A7t"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e5dc299dee9so243895276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436561; x=1743041361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2ozZKg9M4M1eGcQzNOsTQiUzk0UhLzJxxv/goq0eN0=;
        b=gH5e1A7tCR8TiJQPJDwvojeh1QDJZkxHjPV5MxC2XkeDK/HrXfBm2EmKr8TSlhyAuR
         QoJIzlsN4F09pl978oKpapjzM7lXxhSOgA4RnNoNnKfws5qLXohtLIZKFsZj8/5Y7tzP
         oTVtMxUibUixN+wEA9XIQRCaByToDvr+HPvUbFqZosfvCrk3jLdwVImChHSAw9S/p8LN
         pPLPmXRjn67bjQiZPeyrHi1E3fwatl6BXec5VuQfSYHuCnYObIHtKOTucinEtS5a0Gh0
         tPtghxfTKCXA6nF0RObHMugc0tUp8ziAvjUxJFrUFZMlviX/blXJ+abYorFR8r7vXXeQ
         sTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436561; x=1743041361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2ozZKg9M4M1eGcQzNOsTQiUzk0UhLzJxxv/goq0eN0=;
        b=TNRHVqwpI0u+AS04G8sDkWqmIvBSF9bbJj+bhETR22xzxHprEcKK20dquEMuOwNfNU
         H0gYH55VEAIFofEjuz50t9dDcfE0TyiJiPB3Pz1bBpU111kDL3kdvt3MuQieNDjs7vXR
         RwiycyLL1Ef9XOQGnz6B8nX/W1uH0Y+uNpHHBBdY8G/gO84Ng4y5DmTIcWac+BUaV6WI
         O0Sw6TZeosOAliioHMiOhiUBOmYrxY4VNJ9z4UvlgGTVXPySVlGrZCxqLDS+Q12bJrLk
         CySPCVe4FShrLH4B0JREiT1PilRP1Y9Zig3xi2svyxHjLtw1ezgulEi4oixpgHxD8pjZ
         gzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7sIi2JUTTiiJzLYfIlvWcG51H3bgt320cAx70oG7lCIpdzwLyjaRn4BdTvWniQXpUTitR9Rn3BjuK65/hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTS2bGu9N+nO5noE0CqZJ6bd/IeiVy4LGibMQuQx2RS4zRdyff
	jkmNXh6LtRWbWmH3HJkMlMFclvtqdbJyu4ZH6K3KUPU7sdvMQ6Tpr3tCdrJxz/Q=
X-Gm-Gg: ASbGnctrexn8+OvOhgkP1KTnHbGtMycelFYvfuIEvObbfsbxTPVhiC3UWnrOdUcDQ95
	TldWcaFVwpl1fHCGtGLVc6m9jCAvDR1moCPw5rDwcxIDc0BWwoAWNEoxXqd1EIcPQCIS5H2dIi1
	Q+y+pwhNDU53of2773I+8+bYgUhQym80Wc1yUXtzI5EDCKFJYG0esqfcHqaokWEKRtsd14em36p
	OslYYljFu5pZp0E1Y6luvJ6A7secgwypUMixNGJQXZxi7nrbPJJq5qTev35XJaG3y3Y+Yg+Xu2V
	vGGC5U7mkaN/JqdvwsK4QoY2V2H4k+bI8QJZ7eCXpiRh7aGITFLmanVua6cRqgQJKQWimqrG749
	BcGcSgk2xscpFu0Xhlrqn9pj1OH81pg==
X-Google-Smtp-Source: AGHT+IH7EZ6+8+dCz4bP1LLN56y09OfGCvVT4d8nVrS+w4XXeQExgC4rwOB6o+v3CUWV78wi4AnUCg==
X-Received: by 2002:a05:690c:6e05:b0:6fd:63e9:a441 with SMTP id 00721157ae682-7009c02dc9bmr72055117b3.28.1742436561071;
        Wed, 19 Mar 2025 19:09:21 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:09:20 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 17/17] rust: clippy: disallow `addr_of[_mut]!` macros
Date: Wed, 19 Mar 2025 22:07:36 -0400
Message-ID: <20250320020740.1631171-18-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the `raw_ref_op` feature enabled we no longer want to
allow use of the `addr_of!` and `addr_of_mut!` macros.

We instead want to use `&raw const` and `&raw mut` to get raw
pointers to a place.

Note that this lint isn't currently reliable, but we enable
it nevertheless because:
1. Document that one shouldn't use the `addr_of[_mut]!` macros.
2. When the lint becomes useful we will already have it enabled.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Link: https://github.com/rust-lang/rust-clippy/issues/11431
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 .clippy.toml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.clippy.toml b/.clippy.toml
index 815c94732ed7..b7d87377a468 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -8,4 +8,8 @@ disallowed-macros = [
     # The `clippy::dbg_macro` lint only works with `std::dbg!`, thus we simulate
     # it here, see: https://github.com/rust-lang/rust-clippy/issues/11303.
     { path = "kernel::dbg", reason = "the `dbg!` macro is intended as a debugging tool" },
+    # With `raw_ref_op` feature enabled we no longer want to allow use of `addr_of!`
+    # and `addr_of_mut!` macros, but instead suggest use of `&raw const` or `&raw mut`.
+    { path = "core::ptr::addr_of_mut", reason = "use `&raw mut` instead `addr_of_mut!`" },
+    { path = "core::ptr::addr_of", reason = "use `&raw const` instead `addr_of!`" },
 ]

