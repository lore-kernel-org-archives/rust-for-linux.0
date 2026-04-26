Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B02E06E4
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193913; cv=none; b=N1TuYSA6mA23vjqVBL1GVRUJZScVsPbYWNbRvmFlc+baxcDefEd5Jmr7SI3sdk9NhtlbemDW5cHgcXQ6YKxWpqvDGXbVepvfJgLaQqF+hJkI86SJaS9B5u686mCO4w1uIiqnWwON3abRTIqagWAYZKSQWtCtC0oKlMj/H36fDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193913; c=relaxed/simple;
	bh=r1aKh5I901VyW1MTDbYbzZkzaliwYbiMtV4wPKGZXxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW7wasL2jwVNvX9tukcKm+5eUbPG9Si5Paii+hl7d3e/OCTHXeDV2iaX6lJFaWR1rCVnStlcHX5ZgDBWYRGFkKf+fsmWpWwdhr9HPeEeRuWKrNBxDa1RUh6L6JXyxoxxCkkIAttpZwxYoep/oheD+3zilge849O7ESqvDa2b3jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chLkiS8u; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chLkiS8u"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so5607069a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193912; x=1777798712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=chLkiS8u3pQGdO3LWSrDojAaAL3ASk50TuefBsHDoQZ5HNQCRvIUSxEgfGw0/kXjr3
         VZGzOCLhHyU/xlNYoPRvpD5RfHWxbsQBuM0iw6fYyNW0WRerNLjThsiTNGctNkDcw5LP
         upw0ZE8y+p3rdOCUxJXKsVpLvRl3j+ejGYkvm+2TlxUxw+3UOjCCxNUSVB4AvdbYpAWM
         Je1RIRMky7cimJqRupPOhO1BeHy0NB/qrVYCx/rl16WUT4rvKkhHWKkZKjMkGODEWBid
         aXXYFdwHAuUsPQrOhtnfNVtczKFz5UQFezUsR4xaiuBx116cS1d3azlsyw4QkxXHFD5P
         15RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193912; x=1777798712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=o/aNbJPnZ+9S+xV5kU2xU64dL7pVcyCOP3m048FuUbkyv6jBaEnHoC0A6RoVB+CYsm
         BFvxIqDeMvhjpz2VVUq7YfBAJc0pqyBQCAI/+eoJmqSu/YNTDUxBhx4nJhACE82dREC7
         JrKaUB7T31IC0XL5bi7jasJvnMUiBEDRbDsQEKgAxveYqyWsUlxR9ypFg6ZTdG/1SBHM
         aYaeKSGN58PRk6HRsTX0P8c6/0zmAdLnBF5b74N2UMO/s3ysCJqZoNUI93Yo5zkY4iUm
         kuUL56OkZXi63qlWMVzS9ngsthyAE1Brm0xkj7B26utvAa+lmB8M8GVAu3/Ar0ORzlHI
         pUbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OIc2y59OZNBR9XZ0qRgzCtFt/Wp8rs6mub3cdRekNSl8sUlAnIu6g36Qu03UCw2tLI8l2w72ZHOhiimKPQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3i0k/rL+MJDDDrbV4afznb//zWlTgmQrl8aFvyIZbh8ZkH1N
	G8Ju4FTGu9BDHWP9dA2v0nIgq3Zr2VCHCR4O/WFbUbS+6ZXXSCirKi9q
X-Gm-Gg: AeBDietvzzOv7LevowwW2bsUjp9peqtwxAvB4hX6mBX9no7XHY0Lch5ZN+9WHGyJHbn
	BhoU5FpV14Pcm1B4bEQTI886UD++/i5q454BMBmq5K2We8f83NooxSfit69UxudQ2r01wEM8UdO
	eEt/+dRU0XHtCMqgrLCqCwMHX4o1gkmDVqt3ydXZsGYcMgTg4M+OI13nIdzT4kNkVDwJnWuiw4Y
	84MeuWqdX9a4zzAApxBkKSF2P2VxzyeqYA7UZNqFYodYqPip9hPKmGRTwtWoTP/8FIw82x12KFE
	8lZzE8PAFX32oQkjOlqEgdQ+no/TsCNCxBvVu8GWdJAh4pFOHH0VFbyqRRW+9UKYyUGXw7qrsPD
	vGoxeEfznH3LXE1rmWgDNW6DItraWznX4mDHXfGcmL7tSWhu5BYehEFfQNxl3Reh8MdTvLyCkg9
	i5eGie7VSoC/QluzntEQ1SVWQk0W49FE0XGKg+TDa9X+uleYiWEnh36Tp9gCkHrDb4AhwMEzyhd
	A2iA6LRkxvh+Ls=
X-Received: by 2002:a17:90b:4a0a:b0:35e:58d3:3284 with SMTP id 98e67ed59e1d1-361403e083bmr38831908a91.9.1777193911700;
        Sun, 26 Apr 2026 01:58:31 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:31 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V14 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Sun, 26 Apr 2026 14:27:22 +0530
Message-ID: <20260426085725.2090827-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum `rustc` version required for powerpc is 1.95 as some critical
features required for compiling rust code for kernel are not there.

For example Stable inline asm support which got merged in 1.95.

Link: https://github.com/rust-lang/rust/pull/147996
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 scripts/min-tool-version.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index b96ec2d379b6..406895621511 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,11 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.85.0
+	if [ "$ARCH" = powerpc ]; then
+		echo 1.95.0
+	else
+		echo 1.85.0
+	fi
 	;;
 bindgen)
 	echo 0.71.1
-- 
2.53.0

