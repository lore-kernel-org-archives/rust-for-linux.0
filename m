Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621A1A073F
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836836; cv=none; b=CPDsg0+ETInyYPr3mmdzKgeHOf+4/2t16DnYNrUvwvKNoprnz+XD/X0MntTIQMepdtK5fOVrvkKEyIgICLIiKDRgix2FlUvukyFM3wFnf5mZ8N6qhr6XlWnQDnar4Gqbuj5MeHH2wvbvMoX2amfsrzZ6P0UYhLigFL7dqOmDZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836836; c=relaxed/simple;
	bh=Pm6POzEQ75BlVylbif0HEf7s27urrkneJ5sq4z2K3gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAasoNDw8cnq6PZVEc7Wku7AuvmrHpdnjqG9tQgOZIPzv48pu7bB+Y6j9SGKpZVJvCZQImbzkTQJhKgCrlHc/fLZbQZv+fVDv4Ugb9Din+PrcvdYxqW9Y0IVGzFWBryXbBadORkC3Jz1JJWeQowgo4HE+TdaaqkLwrBKo5hXMCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gw4IwGKM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gw4IwGKM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0bb2f093aso79237585ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 04:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836835; x=1767441635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it2hF68oCwswMjVaQp64DMJGQxchhxVsTvSR1+FnkUw=;
        b=Gw4IwGKMYqAeX+As3E6Xuu2gN1PhZRoGBuCfcdmGii8M4vHR58PyiDe3Mu2tfodiO4
         gVb1JJOAqhNCt898QbsukVUIh6fm0fPQndTx/PHh8eTdlEVvIzRAT14EXpmeebvEK67w
         hPxKa9A8aUFT/lAOhgNlH7vqeEQ9i61HFotu9Y5R1uNRCutm/if2XdIbHHczpRurYIpf
         vky12fLIqFvWperDf2wHNetQoohHvIVbcsSekhUaEaPFw+7p0F1XnZHEwtwvRG56Imoa
         M+l45yuH2vwrkCdbY1cJ0gbMeA4yqq7VFreNZ3mW5IRBwjYYsdEl+5YEBOwkL8kyqNpV
         ogPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836835; x=1767441635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it2hF68oCwswMjVaQp64DMJGQxchhxVsTvSR1+FnkUw=;
        b=vsRFRw5JBxdT8qjSJSKczFATiPVdSJRibXaga5aQEqQn3c7TZ+0FdneHT417kOuZV+
         v8COeNq9jav7WuSpERJ3A1MmdPnU6LQCBQg0KXTKjJa7KADP5PNDW0A/acH0gO8d2e4p
         yyxC1psLDlXzRHLwTRgSRJmGYOhxpX5Blc/BaQyP+hwRk7vubYCEAXlp2pt4vLQdoiqw
         6sgtw9oSkeEjlQc9TYV/U2PqI4WO41K0eNp3GfYfRxqsFIVKICeUNkJGkB4wHciKLwB5
         e//JRAKC25JdjOYnn37BgLaLQpLiOv4/R8GDzNdpxoItIwJwdwhf9etHaOwluk8zKNeC
         sghw==
X-Forwarded-Encrypted: i=1; AJvYcCXFAhfZCqnfqTEO2O0MSC0a1YXNzTb7+Zl8skY9VKBRChIvQ+v8u0zOl7ZHjp2hr3JIVnJF8neVFMjBsdzfpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAK+OPm7haO+3ppbzDeoxdurlDoWIMaxyQH2JsKaMR20frs+st
	3RTt4ZKWVrRxCBsgAfAOU3TGIpx+DIH3QKQlSPF1NDn01GvLsTIQTSwi
X-Gm-Gg: AY/fxX7oeM0GJ8Ep23HJN390K5WA39Go//ewnhrk27krhziPlCTE5x1XY4/Dkc4LjvM
	C0O1KFROo9AYyBUuOVUkWX/sdta+Lvd8bzCL5QhGYjQOMpR7PnbZ+vYS4MwuHGjuTsiaDlsU8v8
	HehqwWBl08e2YKQgXnYkxBl5g3yoCK1OE5yp3L7p7GxOfDnJtqUvH+k+OIpdJ1tyRX9Krv5WjNh
	q+VyVKRG6OBmS0V3vMRZuNitN101eum0DQBBMlxHFPenmTleyyEr0PDFu9j+EZwYdG8IYrdXh5v
	gK6LNDjVlnO8qyyqE1OQrPv54zSfNLk6bdHAl20UkTYTXa1eifUpRymt+HjdsbRlmyvA2sK7L5s
	sm0fWlaAQrckcldHyxmUw07O4NNJtPKgyPQO5wFSkEhLtlEMVAy+8TMS8bpZ9ERgpbcRqzB61hK
	2JnJWUdVeuMCvvghivEGwC4Vcy8yoF0V/0srgy+uX3Y5O3dGVKkay31VUeuzNdWQ==
X-Google-Smtp-Source: AGHT+IENUd7yFv5tVhyGggFo64IK9mERVcs/A5DvQaJYTBeN0PqEm5aAJX1uvH65Tl/mwgzXBzwXIg==
X-Received: by 2002:a17:903:b83:b0:295:5972:4363 with SMTP id d9443c01a7336-2a2f1f6bcb9mr270722215ad.0.1766836834702;
        Sat, 27 Dec 2025 04:00:34 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbcfsm231033165ad.50.2025.12.27.04.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:00:34 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v1 3/4] rust: helpers: Add i8/i16 atomic try_cmpxchg_release helpers
Date: Sat, 27 Dec 2025 20:59:50 +0900
Message-ID: <20251227115951.1424458-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
References: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add i8/i16 atomic try_cmpxchg_release helpers that call
raw_try_cmpxchg_release() macro implementing atomic
try_cmpxchg_release using architecture-specific instructions.

x86_64 uses full-ordering try_cmpxchg().

On other architectures, try_cmpxchg_release() isn't implemented; so
calling try_cmpxchg_release() ends up using cmpxchg_release()
implementation.

arm64 and riscv implement release-ordering cmpxchg.

loongarch uses full-ordering cmpxchg().

arm v7 only supports relaxed-ordering cmpxchg; __atomic_op_fence()
macro is used to add barriers before the relaxed cmpxchg.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 69a258ebbfa0..589c070f589b 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -110,3 +110,13 @@ __rust_helper bool rust_helper_atomic_i16_try_cmpxchg_acquire(s16 *ptr, s16 *old
 {
 	return raw_try_cmpxchg_acquire(ptr, old, new);
 }
+
+__rust_helper bool rust_helper_atomic_i8_try_cmpxchg_release(s8 *ptr, s8 *old, s8 new)
+{
+	return raw_try_cmpxchg_release(ptr, old, new);
+}
+
+__rust_helper bool rust_helper_atomic_i16_try_cmpxchg_release(s16 *ptr, s16 *old, s16 new)
+{
+	return raw_try_cmpxchg_release(ptr, old, new);
+}
-- 
2.43.0

