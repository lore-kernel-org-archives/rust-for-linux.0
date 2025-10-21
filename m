Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0659C32ABC8
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038875; cv=none; b=p85mGYL2+7qAdcFfb9c9wFDgytJWUyrRyjH7hZLLNYdvyVZ28lunLBNNqvj1Fvv93xfc/OwVTfcsFH6A3aNPz3JHto3Ivt2B/EU7YmDzaom7QHVJkRQmO4m+g8DFVSosKYaVxbPhWjOfkNcxsVrRLwD7MZx5VdbpqoBzYazpUKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038875; c=relaxed/simple;
	bh=HaRv5VyyfQD/M02LECLvCAgbJjUl1ZdqnmY2ulTf2s8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aETubB6DnNLWgkNivfR93ZDkmkThWZrxVLzlhOf1LSDshotAs8GnEpDLYLDeCTX8DoFN3ngbBbKNipdac98fY/w9z+F6C9VNHlIAVy5MFxFLNKJohu6T111S+rnWRkMUEnWaVUZGU2aYUXJS/9kB4RXwfjLyBNTu0WdhIlPWVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTWfzsph; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTWfzsph"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7841da939deso5007151b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 02:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761038873; x=1761643673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kglR9y7os7mQk0o4TszsRp8WyyKIWcJcUjeWX0BXTU=;
        b=hTWfzsphSpOFRrBz17YUPJhPQKZYzwAsmpUj33Ps9G2dggfzlp9P+Mk4PVS9CN/2j4
         WNH3vnKgfL2whvrmtpRMLDiyzcEkQbS71yVv50JjHvYctZiwwIDoyNCdUiG6bgcCPF3z
         K4WQeZvTRgh+ysWQaorb8xqQlCH6Cvhaq/h557xxpwZAI3Dt3bw+n8GKIvlNpW+kDyJS
         AGVgWbT5s0BQ9+1GZdSSax+l1HcW3Zh/OhodjVDm5k1h0Po2VbLkb/OcSBcitbyGwhMA
         itqCRMwoBYvwGS5K29OiY/Psv6BILfNoABJchxmhxd0BrA4S8wu868q/ejpsqaXg1g1k
         o2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038873; x=1761643673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kglR9y7os7mQk0o4TszsRp8WyyKIWcJcUjeWX0BXTU=;
        b=vamC29iqEVkSZpCUJjIMdMthXR+Mdyb9PQ+VCpmhHQ6DXrlK92gbQD/MdIkTVagRET
         aI2VLPfAiltH1WXx/CCWpUmH2hmLZCUULC7YOHaSRRaykLn53gCn1IDOzsxqL8F9cZdo
         l4/cxHCdAOnt0ykDfrhTXSWMPFemxvlnEb5Smcg/c/KtXA4SnacRrUeOkClN6Sl0vOYN
         tM/JPE+1tzgIU7/fxxrF32ak1HN2s2fnxFGQ6YO910B0C/B5IlCEAuRe7AUjDTlm7t35
         6uJhiX1d0nWx5FWGm+gJu3EWst3nPCQrPPIU9i4JAzKZYtox3tgNTsFdoOLveazNBjI6
         LcNw==
X-Forwarded-Encrypted: i=1; AJvYcCVhP1l3Tnj5ELzncZBAX7Ibn3Zvsbc8fFvfAIVk8FW0mFt7bvA3Lke2eckxa3w4JTc6WnVIRvIZpguYRXheCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYp1K6T3ELmPFr5ZSBovH+u88kOHtipPP+xwO9pTUS7vXZIUqj
	aRsyFoXIyOJS417IfX8dfFEgF+X0tsZ+ql2qx5/bM6s8QIKMmqW9ZhN/
X-Gm-Gg: ASbGnctxG+HKfwy/Xg31Y5hbWDXRIN3Gjzrv8UWbEvWwBZ+2UBnj7HGaQ/wmjmhHF10
	n3WJ7hwG4FtheLA0k1WmUT4Bg1PFAA7SFaErI7JaSimWsJmVojRtI6EAcjUzGsSCE7e8mLIKPgQ
	nZqlIlUHCjTjDzlu2kLRlSLCqzIY2JhjI2aaXKlC9IJQEeJolNHv0jF7vwhLeawvdUFY58uGjN3
	7CUDyilG2pmXHy82j9rQ99RKmPBCEL6yNsOAOB/ls4bCF7oLn6Ucz9oqmKOrcgW/gurNWniFCrk
	0x6ibzyYlIsUK6uW7ETjjSWbQ+uVH3IbikdjVEEww/kG1MSGoBQtCE3VmsRMxSQHSfev5itWdgG
	9l1VWdJNZBvexKl7ArJ4hAFBdjdepG8OhNP3LZSwT0rl/CiGwcaWgpnWOFHMUwPuCF+yjphQQEV
	oTap/vmt6T2YgDabKOfalLnfZSQ5QAJS+wE+KH3YRasj3sF8PN
X-Google-Smtp-Source: AGHT+IHDdJUUyy2/lnWhcN6WecKI1X2TU8NhpiAbnyiGwmti8cS2MOl6n3DpU9tB/v38jytZQ39ykQ==
X-Received: by 2002:a05:6a00:94ce:b0:784:5d3a:5f63 with SMTP id d2e1a72fcca58-7a2208fe6b4mr22110698b3a.2.1761038873163;
        Tue, 21 Oct 2025 02:27:53 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a25f41ad15sm493996b3a.41.2025.10.21.02.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:27:52 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v2 0/2] Add read_poll_count_atomic support
Date: Tue, 21 Oct 2025 16:11:44 +0900
Message-ID: <20251021071146.2357069-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read_poll_count_atomic function which polls periodically until a
condition is met, an error occurs, or the attempt limit is reached.

This helper is used to wait for a condition in atomic context,
mirroring the C's read_poll_timeout_atomic().

In atomic context, the timekeeping infrastructure is unavailable, so
reliable time-based timeouts cannot be implemented. So instead, the
helper accepts a maximum number of attempts and busy-waits (udelay +
cpu_relax) between tries.

v1: https://lore.kernel.org/lkml/20250821035710.3692455-1-fujita.tomonori@gmail.com/
- use the attempt limit instead of timeout
- rename the function to read_poll_count_atomic
- add the comment about C's udelay behavior.


FUJITA Tomonori (2):
  rust: add udelay() function
  rust: Add read_poll_count_atomic function

 rust/helpers/time.c       |  5 +++
 rust/kernel/io/poll.rs    | 80 ++++++++++++++++++++++++++++++++++++++-
 rust/kernel/time/delay.rs | 37 ++++++++++++++++++
 3 files changed, 121 insertions(+), 1 deletion(-)


base-commit: e6901808a3b28d8bdabfa98a618b2eab6f8798e8
-- 
2.43.0

