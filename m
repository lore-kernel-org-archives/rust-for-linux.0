Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135A2BE02C
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763838580; cv=none; b=YbnfkpbVpUspGoZlq9Qd8LePrdJZ2SuMdB6Ee5SVz1jlc9/5y0zWL7VCIg4CASfwCD4UyTl7D3vSRj5F51/K6uwaXGgeCvbmsUZFFW5h7zQ3kRHhZApSb1TZIiS0Ft7fc66kHeSnRmqX12Ga1c0YW6AuvZa6Hvymqt07IJy+Mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763838580; c=relaxed/simple;
	bh=yRGZbGFFObyQytZZ8kBaavN/fLsYv/swpAmgISoziYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAfwNbZk/JTwuf/yNNkGkWEJXqZLa8u+4oYSLnsCho5c/LoMDwM2R7I6JpOHf7jXfUGBIKUwQbQ2fGOfCqrb6JyHAkowcZ0DmtVo/eGysqJk/AKO7zBDqT9zh4IElnZ86lvKuE2PWw05EJESkBvihLr/IENeWTkK/lha+miQZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWNLhDap; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWNLhDap"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso4700514a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 11:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763838578; x=1764443378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJfooVxZuxbfyt+kzW3sDvpv3faeacPXZajG9C7PKHc=;
        b=JWNLhDapNg3iTjURVIi2bUQeTD601g7zTpzcbwmysE3gWKnSgngJ+i6I+VRo/frIr5
         ueGF1PtwdeOpmSSUFRBiOwZYIXXG0DnP1kOxl8p27sSnHvOUIA8qLNd+EZE1k9/JNVjn
         LCs40SC1wICFv6VotiiJU8a50Ah+yuFBPs5ZxfxHNwPPddqY+5Yi06b/BmsNiv3mNFul
         5AgQip+YVYUoPMMYoD7Gcx13ZLLqMSd43JvTqCM605rSNOD9D4h6Ci+XsBUh+VZD6SPu
         lgyYjPwvp2X6FbD9UaFsAlCUPkH/wj5i/w0DAHFyuRG89XG3qC5HTaWUhR0PoLE3FqV5
         uxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763838578; x=1764443378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJfooVxZuxbfyt+kzW3sDvpv3faeacPXZajG9C7PKHc=;
        b=UnOULjyT+KwJ9FKxgrQ/JejroDEWx7p2Sot8sPwd36WT7PltVdK0w5QsCvoehharo9
         Qodv5yEiqCWfPRtDId/632AUp7s7lboB6ifHS1uVYR04Xe4p2joYF9796oV+Czp4R5hk
         oSGMZjHfBAuVIvkIt1Pg1xLEH2Khckn/HUc+/IHl6/hgla0RKkIblnSUVkLmjst8qS4Z
         tQ+FofIzvnR79UkBvYV7ZPcTgoz2dZ6w6IT3zkUMz1RUEkDuqPeu2HBIMalyDdIrG/So
         jofLzS5Ir3AJVVWoTf2aYaRGMMoAH+YY6CTWdGUxG6u+o3x/E7P8LBaMiFMW12qmXQ2G
         kIzA==
X-Forwarded-Encrypted: i=1; AJvYcCXmqIbEFXEYalDmuB9N2OueI6YjBVRJvv6y2ok84MThCccP7znrKlB6RmKSAbp8Hu3V8mDaM5SJwUn1MfmOFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws9c0wrwy+wGKSe6F9WJ9U5sBtfomxzSF7NM8dB4y8ZXussA2p
	+HjNW2/Cd18GDd5yrEEGNcQocmk4pXb92MNqlG4YJFZlB9XteApQnRuX
X-Gm-Gg: ASbGncvscBc8RuWqvKdIxYddedCssVH0Aojki7NDP2WfqjJtQev8bhBdvLqw29WT3SC
	ZXASPHja5NEN3qDuWKYrrY4z3ocUZ9+2+k20TtPnP2fEIefvIJxqHW3kZybwT+J8vo/7zW6lChH
	/qGzJdzIfz6oEGdw9KtftHXG6L8pv+n64e+b9JgNVPnX/tUSo5Z1efEjgshCxC62XwW5yBHxroi
	ZXRO4T6C9sormnwtPJp6OHMPgHoNiji1Fk1V0TmdbS3hr3i1wSr8LVWjkhQvuOvVhMX31k4ZDcc
	acdGgLJPGNdDyndV6mJ74W7VAX7xIdTWA3COOkMmRLBhgOXpq9tFGLOWnUXPTYoSSOafyfculft
	i2unfIi8N6AAU04qcjUw14pPRkac8/v40Fi4SGTeB+KT6XEfLTPJqg8gGBFhkfkBBO0Wm3AFHai
	duFfYthIRPo6+TRO2Np2aOZ5JN2Qqw5xbh29+Fd76oMiNhoCJCJHumVKfOzjRzZ5E1oXlf8yO2+
	LkABQX5EyW4taNWPWNieI6NrjHyKA==
X-Google-Smtp-Source: AGHT+IFcy0EocP4d6arurWa2zyL2SDDg6YoRfGwykuA/obeqNyK7UhD6z5oLKJcTe4Q5zzP8itsnSg==
X-Received: by 2002:a17:90b:3d0f:b0:340:d578:f299 with SMTP id 98e67ed59e1d1-34733e45883mr6607593a91.3.1763838577788;
        Sat, 22 Nov 2025 11:09:37 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693c1e9sm8869211a91.15.2025.11.22.11.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:09:36 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 0/2] rust: kernel: add missing safety documentation
Date: Sat, 22 Nov 2025 19:09:06 +0000
Message-ID: <20251122190908.259929-1-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds missing // SAFETY: comments to unsafe blocks in
the Rust kernel abstractions, replacing existing TODOs.

This aligns the code with the project's requirement that all
unsafe blocks must be documented with a safety rationale.

Navaneeth K (2):
  rust: kernel: document safety for rust_fmt_argument
  rust: kernel: document safety for as_str_unchecked

 rust/kernel/print.rs | 2 +-
 rust/kernel/str.rs   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

