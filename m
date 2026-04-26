Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC491E4BE
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777226657; cv=none; b=a2Dq4NZWPBjFBs95j333yEYVdJ6z0ZqXG4vKdWeNaVx5S1wKEQLqiFhXOfEQiw4L2B8V2PbvUMrEb5Ji3INYbSVVKA1yM5VgPcU0/Jer5W1zkbgqFAsamJWe+stJZPyfyu2/hGin4XYXrQjvFn86041Nah+/izf4aUJEiBQ49U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777226657; c=relaxed/simple;
	bh=eNRBtwVR40hIzK45O6LNumx1s/DSJoVK5Yc6JEqkL2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWL0usmkdluRvbvYTjLHPRhCu8shWUVx4xjOpscDpXK4lhtgSu3R7hjdDhg0CpdNCxMw+rQBzfmXZnGYYwYDkeP/BLeA0rXu9e4upinGkStIpI0IM7wzYVT6DkgKn/9IPkaEFUftvn9SE5UG3khYSnxlpZ23XQ1NfxVLGq+2Uq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/jbt8ra; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/jbt8ra"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b4583f0a1aso58931365ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777226656; x=1777831456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNRBtwVR40hIzK45O6LNumx1s/DSJoVK5Yc6JEqkL2w=;
        b=G/jbt8raawPzvgbHXl4Igf8g7WENGjzhChpfKh4UA24MJPuewwRZLSbrEO3DV4sg/L
         ZglrlRpyOyCv1CDrNGTMfgdlFEsXNixl6h/Ht2ohIbpMlfOn5fGEYIau7bwR1mhiG/eB
         0brhTQUocbEyiSySe2v9unZgDFzGtgbnqUAp5KNzHCV6vEtpg4x2UV8UifIPX05Dh+Ko
         mYq5yFz5IqeCcAiazLrOXIrA/wDgjWSr/EnnjUElJoiuAyknWRiOYlMMTsmJvTxw99cF
         Mh+JkN5SEI52N72SwA3ejw8JJggg17vfgG/QofBlm1XK0lup+fbDpLVET2iZSdv9K0xX
         zi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777226656; x=1777831456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eNRBtwVR40hIzK45O6LNumx1s/DSJoVK5Yc6JEqkL2w=;
        b=FB+j0gyZ2/NdJJDjxgwcyQ97UdHePzbTF1T8CC8PZ+yggliZvYecS0/sSkba/X2fPZ
         wpHxhSKTNP4sg9+fYSJg5yxh6Tiq3MgOnt5qn/H7vDdvIsgqHvEcVXm0STOnsakfsNAJ
         V4bG22xvl52I91A6g1n/x/gh+KsBFpQ02q3Q1xqzTSQmYuamsAPy5TnkezjwEO6XVAmR
         kYBaU6JJcT79+TY7Nx2dIP7ptOP17ib96yYh7KGvIheqJ+AndEM4Qefu6s9TNUVLKMaf
         XGKUQd/PYxjcZ8T4opdXjkxTrGBkNZ4d/yoo0dUvH907Nbm7fy1yoG3BPjMG9YYBzUns
         Q5aQ==
X-Gm-Message-State: AOJu0YwV/jJIOdEn1D8wc7xOlQH7p1sV5swdUPyIjP2b9lEMSG9El0EM
	6eqfumHAUm/tfpQ+wqSqDVkPfQpZcWnT9zKWIQ/SujsH9j91lFuYnDGL
X-Gm-Gg: AeBDieu8/Aa9bTkKDG9PUhDsPTImujC4FxBywfyRhXLHZfVS8sA8PrQ+ZmKemzc2oY6
	4WG/3CAvTu7SIirUiTGVkRXMrxmBXH0HUPVYvDOcgwO8tlZbuzyGKZjOebkx4xjO5FXQLj5eAU/
	n+izy1XA1TprrJAXRjAOSEN5JGu0W+G6qiX5kLBmKnLjmmrQKtB672Mqb1rOa5kAF+X8V0J1klg
	qUDomr1ktzKhluZAywXhVMx9ztL17cMB95NiwzaazPKHA2lfrdQpqiQMW5jIq9MJ8LqVdMruBGC
	hlc0m4Dy2MSPEPR45ZB0wGzApq9tRohAV4fCxYCpwXqLokKn2V3/hzjmzQpBvGKeZMmEvAHIuVA
	qiNUa0JB+HhwPJIqwLeuz0p8Y6ysaoo2izhWZ/OhJ3UD5RPLZYFwic333NeK17TSvePKp2VDcJz
	OsaJxicvxwtVKaQr/EwtPfiJWrHDwNIJ31gIpfcsafZvXIrgOQ/tA=
X-Received: by 2002:a17:902:cf01:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2b7aa203da7mr168567125ad.33.1777226656135;
        Sun, 26 Apr 2026 11:04:16 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm303799285ad.55.2026.04.26.11.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 11:04:15 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	Sagar Taunk <sagartaunk2@gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: fix SAFETY comment Arc refs in Pin<KBox<T>>
Date: Sun, 26 Apr 2026 23:34:07 +0530
Message-ID: <20260426180407.12091-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CANiq72n2eoHnU++GyXRb0bbXXXU_3W=yjkJ0Yi54O2Q1oprNOg@mail.gmail.com>
References: <CANiq72n2eoHnU++GyXRb0bbXXXU_3W=yjkJ0Yi54O2Q1oprNOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the feedback! I'll use Reported-by and Closes next time.

Cheers,
Sagar
