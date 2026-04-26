Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD43311C11
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777191768; cv=none; b=LAH1XUSmqi9UOvvFu5ZD0TAI3+i2bKfQ8N+9B6bvdXP6BwSnx3xCm2i7Tu7g4r9osswd2ULDPu34iTK6FaT0Cqmh7avru3KrLFSt5UiqXZT0N9lMbaG7MbbQbMPyzIdsZ9F06uA2GgRDnW5UNm94qL1XHBsXBZgoZuGmNNAkQno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777191768; c=relaxed/simple;
	bh=G9omqjrwvg3pMWdOWX1fTCum5sLGqbqWU6AB+TLGI7k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ESt/H7a2Tzr6chXVwjjhI5z5BwXLV1uAWz3SOD/RnKJppKvddKPF35LzK5Kg4xFpFcgagZC+trcj/8jYeiivP89kefCWD0IgL7zUmYpsVXXPnxOg/LKayQvZdXmo9FeB20mB1AMkKJPN2VdA7OlH+nG2cwR+ooatoRckBFWB+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1c3Nz9X; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1c3Nz9X"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b24fdac394so89469085ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777191767; x=1777796567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul9ZtatMmSZUhyR2nVk3wynb1YIvXtkXr30NlopXkrk=;
        b=R1c3Nz9XRxPPisE+//bsRvLcCybWiH1rlpK9lKT5pQI26U4oN1JxRneb7vVYm4Kgo7
         RmDeHztBtuRQniSibVSKo0dy2TiprEIfrBgNgZPBPIjzDudXR2D4WzArn2tgDOIyyMqU
         717VpYYwMx6SMJ7GyzNcwWkhQSXbQH/SppErP9TMmar+QmdFMGTHeqfrqUfwC04285wy
         LJY9nWf5vm6SknVxAAt2axA/GTEOcqhxCIySgtQriDJ3k0jX9YwarEHbcnJxb39PNcPg
         7YbGkf9htzQ4tSFPZsI5TT0geAg4sHVxdH2KFhYxq/HOvv3+dp3C81IxiTieY1EB4Zyv
         gxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777191767; x=1777796567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ul9ZtatMmSZUhyR2nVk3wynb1YIvXtkXr30NlopXkrk=;
        b=U5z5wCHnnMHPvG2dJviNhZMrVqa56xqQHUsxvDxAC7DCX7Kr5PRv7eRNUfewHif74i
         qQqq9Ezk8KyYg/21GP+EZatwyFp94CoRLhjGnRGFdq6zlm73CQgHaWdN77JQSOGMxIbp
         gp+utY/SHYLqr4K5n9UhQGBlzj9T2kJdrcwOhOz5GAdlPZOlkpfx7n9hxgfqelIP9IB8
         4LpCXUve4XqgydimOpwCKTxcfSRBqFp93mAAvL1tGFIqxLveb+VCbena+fnngQUAPupM
         CggMVcPm7tsWYcWY22tKS8qwHQzExDJu8WMgY5cwwqYaipFIBFVZzlzWiZqXjpbGgNnm
         4mlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L+yXhlmwVeY2Z/oM4URuLNuHnHMl3Yac5pQCf6We/2cTQef4GuOBLJLDphiMVKlfAr4WcA4ilu+664hswxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9P+mHcZwjOsNbtGDtkQBL1IIwlXB7amjJa/qiQQ5jVkwCo35R
	NTx/aMr2wDosTU9cOu5KFmEaTKVOUUPYW9Awav8wNfIWngVW2i8aCOd4
X-Gm-Gg: AeBDievu+LHKbLbRV5p0reALmMeb5dEf13Bg2MCEEa/YT9KZe8ucWRvHKBChqvq+99N
	jOIf8ot8JMhVoWdxYtY7LrACpp8sA675uHSkmMWAkQLPmRobQH6xG6YRbjTWL9iXf6ZKrzjepi6
	rVj5DJlHvtRHWC5qyi84CfVdaM+LTWR/f7LjOPmDaW5mtoaA4SRFSSpQCZ6YY0K7oBqaqo6Yr6b
	IuTbAOj6p5ahWOm2thBaFWp6Si9thuuL8fajkrxNCSAvIzYswZVrFH/rcudeEOSrLnM7KWG9hjt
	Ms7GfTOC9/r2FN/RqaOCgBOfOh0DIgd4D1foKDmhDScrURAFRQtS0s8AQYcbWSfZJ6IwYqULDT5
	1VGN8vjj6lJn5gLOTFaZ5vyD7HQydZM1s7gFH94/2wHjbKyHCDhl/qkRkcO+Iz3qNKdAmTmM1Cf
	7vhoLZpvPEOQpRRnRyNo8SydW9GLu9heV4WuuE+qaXCRvgLVdD4IXsugYfsguQ2ferPpCXQe1uM
	g/6DjMJxFqsyng=
X-Received: by 2002:a17:903:1aa4:b0:2b2:5771:4ce5 with SMTP id d9443c01a7336-2b5f9d5f6dfmr383386905ad.0.1777191766686;
        Sun, 26 Apr 2026 01:22:46 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0dafcsm284770165ad.52.2026.04.26.01.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:22:46 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dakr@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	lina+kernel@asahilina.net,
	j@jananu.net,
	mkchauras@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V1 0/2] Rust DRM build fix
Date: Sun, 26 Apr 2026 13:52:32 +0530
Message-ID: <20260426082234.2026908-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rust drm gem shmem doesn't builds due to an import error of ARef from
types instead of sync.

This series fixes that and also makes CONFIG_RUST_DRM_GEM_SHMEM_HELPER
dependent of RUST and making it selectable from menuconfig.

Mukesh Kumar Chaurasiya (IBM) (2):
  rust/drm: import ARef from sync crate
  drm: Make CONFIG_RUST_DRM_GEM_SHMEM_HELPER selectable from menuconfig

 drivers/gpu/drm/Kconfig      | 4 ++--
 rust/kernel/drm/gem/shmem.rs | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0

