Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154C2F8EA1
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782670971; cv=none; b=oMT9KNgJHJYxJcNy0kv+QCQ+Y4KwKfVy9V5Zea9GRL1A1Dj0DhwHi3L3kG/jIPZL3uT/bP0QaDfnG6eWpT6ZiU1opi4SijPYOzqBa5Q8fjrmI4vd1NJ5M4GJ1sAznA0AmtqxpF328nXPoAc2jqmbmy0s6IJnYjmAXdeWRyoXYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782670971; c=relaxed/simple;
	bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXa61KMx/g+82kqncwP3UJfqW1stigkJiJ5noZvQ+hHOAkxCWUcs1Ru30hXa0wA/nYUJpq8owdLKgzZYlBhCgJRkvpyr5AfqRFX6FSyxWHra3rEI/G9bKDRqhNijuTlQVxXSpgf3lN2nucYJtum5UTD8DFSyIvdp56R0kigGFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLlqydcy; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLlqydcy"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso807440a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782670969; x=1783275769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
        b=VLlqydcyw0+l4LFGZdN2F1iIepQqaVCMDuXrI/AsiNSG3ni9sKh1WpkR6BSiTKtsaR
         xobFiwvvCMQTh1pO7C36QyTGsRPvUlGBmEheeVQdCLltI99DWD5u42sA9ZACVR+aT4US
         98zQD92YKxBH2lxrqd7ugMrQ7D5wiLvUIMQc6qZ4npYD/1ST3CBjnKd3fI+5lbsu1/Tr
         KizlX1gsvn3GQfODVQpySOzuD/5YZDoQXnVFUEKnDrDphr0viLQV1Z5uhSatYhweclxg
         gnelFDnkH9wzKFOAhH4S7fsHM3nPsFV8DBXKnFe+Jxber2k2GnpofpM4gnrSUbd1+vFP
         F9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782670969; x=1783275769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
        b=rYs8HMQlFiCqcsM77PY9AD76Y2xTulSA0HVcTbvxH2YGkpT6OT1Ve5bRIYKTIqG+Rb
         KCi3NnsOxWfdSoNgYxWtXwO1MzuTVCUrcONYIdu6NRXPq+ZPV6tpxA1cPppaexbBIM9B
         frlCcdveyydp8mptQd7WEV0pXRBT8sjtY9xIXEYuI2G2IFxfp7Vf+zRGgdl3ENU93Hv9
         tIeNEvpRdHZzo7oB2xfxq2VR0/vujed0ho4f8BsCmhcuxqcCmfPJE7W3U9P147NfTmPa
         nRnxYj+Uuso9XddF/3nhlLkCvan6ITiLhw68Kh9Wta9OYroNTFVXRfA2NXu7YINLWXb5
         q8HQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqj2WDpwUfDePOrCRu1jL3kL5yvvqNtI/8GMYs91CmtCmPxCWiRLQhFt7rM+4QQVdgAsi4rWq1pNO2v4QwF4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWcNo3U2ciGIR07O1v/TluATLhUglDUPVasomt4k194NQZp0IE
	FC5zU8J4v8a9j5EbnAAi/UZPv0wtaAIjlilXOMthDfTkSEGYHPjJv38d
X-Gm-Gg: AfdE7cl8G03nPOiR9Cw4tx7G6qViVwaOygTYAOA9WZrnKqTMrkdy1cP5L+/FohVU3tU
	E0GJxrmLykyBse/MNpecQMwHoLFVjGzK1GQr/zyM9gqd1cybestl6wKooew6teOV2VbXe7vZqNP
	dpBxo7FliuOa/X0rd1hwZbBOhR1+B3URP8oIdxRnjV2RSF7ncU8OONotnZNXrcKqBfLOTI5uw87
	B2dLKZOK/9kWJdVvOBu03lR6PepoCfJlex0SIeaPxhI89MNO4HbH2ZARbdFyu/nL5pZEkC8m5hx
	TGTn9usqjOhyVopeDAYKzgddASIw/Gd6XMl8tiuFsgoHjJ3RlsAcJLy9i9W4yCUNObW4/5igfbC
	ued0UykgX57GWJyhFJWmJEsLUg0SIi4MwJNGfq2edv5R8tq2KyaAqwKjhcznbaW+O9tPuiXVCHv
	wuBAPLx2JUyqXZ6yp2YMzBh3QPsI+UvELHRFAXHQUVhYDTISZN0tRFnKMuUBAU4Pk6qsjON6iyq
	rpExFZbVgcr9SRyw7uADaJd7h+imTL+9IHQlw==
X-Received: by 2002:a17:90a:da84:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-37fa9151d83mr6068848a91.19.1782670969047;
        Sun, 28 Jun 2026 11:22:49 -0700 (PDT)
Received: from libra11 ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ffdc238c8sm781779a91.6.2026.06.28.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:22:48 -0700 (PDT)
From: SeungJong Ha <engineer.jjhama@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org,
	dri-devel@lists.freedesktop.org,
	acourbot@nvidia.com,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	SeungJong Ha <engineer.jjhama@gmail.com>
Subject: Re: [PATCH RFC 4/4] gpu: nova-core: gsp: convert GspMem to zerocopy via the transmute bridge
Date: Sun, 28 Jun 2026 18:21:54 +0000
Message-ID: <20260628182154.712621-1-engineer.jjhama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172200.B116D1F000E9@smtp.kernel.org>
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com> <20260628-dma-zerocopy-bridge-v1-4-9a2895ebe30d@gmail.com> <20260628172200.B116D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is pre-existing and not changed by this patch: it only makes
explicit (via a checked `zerocopy` derive) what the previous `unsafe
impl transmute::{FromBytes, AsBytes}` already allowed implicitly -- the
layout is byte-identical and the message-handling path is untouched -- so
it neither introduces nor addresses this. I'm not familiar enough with
the GSP threat model to judge whether the TOCTOU is in scope here; if it
is worth noting, I can add a TODO comment near the affected reads.
