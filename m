Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C04231C9C
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743572338; cv=none; b=b+8GUK6QSaeSNapc3yJPcYtp2nUTb7pieNYm3hIYbgHTKqNQ3NXCuKc9W3nQpWrvd42GSGcUvvxKKLwcbqMzH1jWSo0j84hDCP5XQ5iwB+4DHjaZ/ypnp7qIPHF/rDgNtjMpSg5VzHnwwKlJyP75KhIyNZMKhmnWKOzE4u1UK54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743572338; c=relaxed/simple;
	bh=Fi/SqJtJyUf1mHWGg3azbi4rP4riZdDLaioWwKzLB24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nr0DTMCZFroPP5p5uSWeypNtE4xqTbAZEUR+D3St2lgUh+z76qtEExx43SBdZTJZt8kJM+mUX0oi1ENjknfMQiuxCfy8msypWeUlBAwDBuSAsjVWFfojicyUs+8jsV5SvuvffkvVzrhhOi/KKaksvfTo0dUK8gyS83uWk3sHC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yzk3LWEG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yzk3LWEG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22409077c06so3036385ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Apr 2025 22:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743572336; x=1744177136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vds3osu30LpJLxooKeQfecExvCs326fHSaN8YqB0VpY=;
        b=Yzk3LWEGUDSggbAeTGOF1JhoBYK6Y7NPpHAPN8WWyIskBNXUDipKIRdQW31epCahFE
         u2Rf31jvJFpeRQ2fkwAeZDeWv6mmpN2sd99PBDr7GEY3SUtQ7j9mNQawDKSjoyXajti3
         Bv3PZVHZOYnrdL/MSc0/1pEgRtY1NMCNaCt2UvAes5I4xDP1QeVZmvDASjsjOcJ732xP
         VcRIc5Supu5jfpaxOt6mpwUzWm4wvwP7hjoKc9XshASBNcsWhZe1Jx+D39O1q+ofafto
         BXb8CFpbmgdwSQGuE/UfafMLRcoJapSEiQLOhlXtgvmEpNGIONWTC9bdlIuli3LCNDrx
         dAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743572336; x=1744177136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vds3osu30LpJLxooKeQfecExvCs326fHSaN8YqB0VpY=;
        b=ZjlJbZHlyFGCLS7om8NrYpYBiN9agD40lZYr4V9M+1782kWc3Vcc/qnTJ9Ts1nHLLU
         LY7q/Am9h5iAbbJ8aUXpF2ViVv8d5+viMZbL0RsQeXtkppSyhX+/RmSE3nvlgdsU3j/e
         BT3ssczdquwgpMORjqKvWsdGQ+x7l+XpvXyCrOp30vEC0DsnLdphLjKZrPsY96QtaVgK
         FYNYDfdipOb01rOLQHoqTxmGexVyvlMyD+M/OGii4hSfTuD4CgsMN9ljyLk6EG6pjcKt
         qFgxjYbWrvwQ2xyDcrsAe5f0T9dIihhC8lWvp577caB76ihxNjseEkTm8YapkkTunyDX
         aW9A==
X-Forwarded-Encrypted: i=1; AJvYcCXiRLJ289adWd9xSOeMNhif6JH+GRFnl4qDsnOpx7TgC/xOhaC+SeV3ck2gRRqTTX08InBu04UY7xyWBK1uiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVcjjIWptbZeavBi6iLBS2RbW55mpn1r2L4P2DUZEw61jGUdt
	JpA/lJP+46U9biQxZtTI/SmAwJsYEkdFhwo0NYNIn8RCi2tFX/adrgaT6Vx5ij4=
X-Gm-Gg: ASbGnctdBsPzZrNiNAs7NQ7whXcVKM0+0rFtRWAwTgzq4/wLNXwBuBAAkW9S3cZUlKH
	FWg+jE18zZ+hA9s5K+1UurRjofYayVmmq3uNkVc+2YmpxEWphGWOzeF6p++ZCUOYaGtsM7RVWZt
	84H/tmeAkXXmn+JPYPNQEXUjlevt3jGy0YOTz8Lz5mi3gzC+GgogSuErwl4WMcv7bs8mLzYzcIO
	E0VDWOHthOtl3zjCi1gRtKSzmGbCD7w9+hmj6X1CjJSvOfA337OFX+ZhLLSwk3/ecJdpQmvBYUC
	+ZZiPgMYsItesgEAFdPweXJpA/2D5n74SvaIVibl7mUqeA==
X-Google-Smtp-Source: AGHT+IFjTK/AkY3vAyWwEbnbqfQU+uFaUrIZm4GvtNApjNI1onAoRxSXqjrJ7Q6udqokIM5G8rb0Hg==
X-Received: by 2002:a17:902:ea03:b0:220:c813:dfcc with SMTP id d9443c01a7336-2292f9fa333mr265612385ad.40.1743572336371;
        Tue, 01 Apr 2025 22:38:56 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0bfdsm99945695ad.72.2025.04.01.22.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:38:55 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: [PATCH V4 2/2] MAINTAINERS: Add entry for Rust bitmap API
Date: Wed,  2 Apr 2025 11:08:43 +0530
Message-Id: <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1743572195.git.viresh.kumar@linaro.org>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file to include the Rust abstractions for bitmap
API.

Yury has indicated that he does not wish to maintain the Rust code but
would like to be listed as a reviewer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 315cff76df29..f67060f1b3e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6113,6 +6113,12 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	drivers/cpuidle/cpuidle-riscv-sbi.c
 
+CPUMASK API [RUST]
+M:	Viresh Kumar <viresh.kumar@linaro.org>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/cpumask.rs
+
 CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
-- 
2.31.1.272.g89b43f80a514

