Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337B1C6FF5
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766235783; cv=none; b=iFHCQpYoh/hSGaK1XbtKl2tbi1Yf2xRYqsgJVoQyTozzGM2OebcBXqd7bTMAKoAC7vCCNfDbXrBaqFFGWhJbeqblJP0ojKSchyOA8Y0VnX1SmnwM0nH5sKaFpsCVaHnb+aRVvN/eSN11CR+/T/sCVuNzOxU0zy7edv3WzY/cviI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766235783; c=relaxed/simple;
	bh=05LHoiuSPBTSfyzJSUG75GOop8lpP0cxRU4f94/G6WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YU9x9DXyVW4Myl+TvCbUhqurRP9D9JFVuESTUMNo/JnRnZ7J06/9mU3LqBx5IpOQ9yAHDk4M8DMcnY3N+nBwCq/lWXpAjqB1kKcaXIa9KO4CWrzCrRK4lKDmUloPqCwBJSHPzDAs6kmAJLfer/iOE6bqnCuqUjkDF8ZKYiFWhxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0Lg9y7R; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0Lg9y7R"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b736d883ac4so467504966b.2
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 05:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766235779; x=1766840579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7RIGHedqTvoAMB4Jqxtxps60zRuzPPKf7xiOF7nG2A=;
        b=Q0Lg9y7R3CvOf1p9k3Dv7+yHyfekhSycC+1Ka4W2CPmoPOB6l6EXCrXQnwGl4lR/di
         8ffy7rfp8lNoTmwgYqJyb+gaRzPtvvAIrLyGrlU2S2rQxiGeKmZ9ONsdVCAPeMrD4+UJ
         fv9yLubbJqkl8We3VI2EatIDAGalwOkIndrxA3EQj9T6aJSLcZ+Ex78lAUZdYHiVH951
         mMMl0NmeJoXfrgWZEz47pu8IPhihZuX7xdH69sUR+HCJIQXbT8qCeM1YH0mN2aTzgfLo
         y3Y7tDvjraZ3w2lwaZpmnh3cXru3QKCPK26IlBuz2b6epQyvxneQAecT6RRbSGICE1vy
         LYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766235779; x=1766840579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7RIGHedqTvoAMB4Jqxtxps60zRuzPPKf7xiOF7nG2A=;
        b=bHnfzs7qwj4vYQVRnanxz2XuobYd/yvzkRBjK+Gh6wCs5+GPizNNynRWEDzmVJ7sHb
         Y9+ehZQWVFpOqQQV4LCeQVIH0gZDzVUP1CwAThxZHm4Ld3nQC9ZuBx1lH2PptrzWgsQO
         s93aSW5qXM5+vsq8hDhPocWooURD19BzCt7PiHEwvuGYM3FD3r068dVJJpEj93eW9BJX
         vz9KGRNpkUjeINzkrVoBrbWcQLxXoJjJaVgi14fC7QpTbgrB8SnPij9KVfvQy1q5/zSr
         JXMjlDBCeQGntawbcz7zsYlw/A+bemCIv7D1ISo2UMCO9yKPd8YbeIxfVSFG8TLNOVti
         xQ3A==
X-Gm-Message-State: AOJu0Yw5jm+iPN0nwD+QFUTjLoEJg1CR8Y1sC5DsZlDQEsQgkYIuPzpJ
	99GhkT87lezzjagEhpcCckm2CYNvDBDexabc8zs9LA+GrGk80otYalB1scCbxiagIaE=
X-Gm-Gg: AY/fxX53dwSzWXXrVwD29nKMalGwJHRybUr8JHwwOevCVTyxIetYsFpFdqXoy9mGXz0
	OkuVKa0HqCIjkzvtnVX23FMDE20eQbdUzfEGx0sE/zR8wJWe+SvO9Iow2hemCnOl5P9R2/UbNcm
	g3+Kh3cno5DX4HJ9NTcw6GIeEUuWGVBOTABuGa85PryJxGNM+yPwYpgMw+D1TmUTWxDnrDa/FYd
	KgmtolpCcC1LZ9ucMgDvbghu3gAsXdEw4cC0Hy0p62L9Zl9nzDSmtd6lBBpQTUneiXauywEYXyG
	DSLDYkkx3XZLGD9NfgM+FAuOGVvkSidIUzmLd85T7ey932j8+/1MNBO9Hn9tJeFmhZxP1Zh9SRP
	LH1YFZ2hhpfk3varzkzIs3sOvJTEWg97P8H1ASVJ8MS5hK56o8PNuh5lRyYJYlTDjpieP63u9SX
	X/qnonRqRduJuGTxSXh3YI7TOAd8D0sRfBdMLmw2YwCrt/MFAS75heFfZGgGbA+AyKS8S58orPd
	pIkVyqFKWMv3AzC
X-Google-Smtp-Source: AGHT+IEt4sv0r1yld1dZFh8MPRnd0bauAeNkmQUxaYCYs60O9Jan6jQ2QuSsgx4NiyEpPi57zZmBHw==
X-Received: by 2002:a17:907:984:b0:b6d:6f46:9047 with SMTP id a640c23a62f3a-b803722ba21mr632196466b.59.1766235779270;
        Sat, 20 Dec 2025 05:02:59 -0800 (PST)
Received: from codespaces-4ad828.m1k4x3cq3poebda54cltipn05g.ax.internal.cloudapp.net ([4.210.177.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f13847sm481981566b.57.2025.12.20.05.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 05:02:58 -0800 (PST)
From: Riccardo <riccioadami@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Riccardo Adami <riccioadami@gmail.com>
Subject: [PATCH] rust: document safety requirements for fmt::Arguments dereference
Date: Sat, 20 Dec 2025 13:00:13 +0000
Message-ID: <20251220130014.3961-1-riccioadami@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Adami <riccioadami@gmail.com>

This patch documents the safety requirements for dereferencing
`fmt::Arguments` in the kernel's `vsnprintf` formatting path. This
clarifies why it is safe to perform the unsafe dereference in
`rust_fmt_argument` and helps future maintainers understand the
invariants, reducing the risk of incorrect modifications.
Signed-off-by: Riccardo <riccioadami@gmail.com>
---
 rust/kernel/print.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 899bed9c08fd..5f54be97a6a0 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -25,10 +25,10 @@
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
     //SAFETY: `ptr` is provided by the kernel formatting path for the `%pA`
-// specifier during `vsnprintf` processing and always points to a valid
-// `fmt::Arguments` value created by the caller. The value lives at least
-// for the duration of this call and is only read here. It is not stored
-// or accessed after returning, so dereferencing it is safe.
+    // specifier during `vsnprintf` processing and always points to a valid
+    // `fmt::Arguments` value created by the caller. The value lives at least
+    // for the duration of this call and is only read here. It is not stored
+    // or accessed after returning, so dereferencing it is safe.
 
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
-- 
2.52.0

