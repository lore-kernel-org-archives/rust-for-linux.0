Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD0388E40
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Jul 2026 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927672; cv=none; b=as3rIR36gkoUImBHA36m2nDvNVbdlAMO7kjWYJa12KU3MIdXSV2AisuGDH5ALfJ/4phKw8nycfvaODbzm0qgEjITsC/yOcTSDdjE+hRTE1yxA8QnGauJaqlEfMYeR8tkEGlSZHx8Ffmeak690Od9GM2hfm+k+avAtPnnDFIPl7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927672; c=relaxed/simple;
	bh=ypyptmpjqh+YDwzwWWGgbsnPAltxEeoQT0dKLi0Fvog=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Rr72w9BytUL4n6Sw5IUsqhHltku1TkGTi+hXpzPnJBOwtWlfOwXNKjznre4iM+D6xAiSYGMQ3rRhJJ4xOQylxbPJiLE/rwEAMpuKs9DRsFKLhde1RgA58R4isapf1lKZ+cCdQ1l+rlrxtjr0HTzQIg5/6oCASOTkTeae9YSeaPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=Ox2hXerC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="Ox2hXerC"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8454160043aso674059b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Jul 2026 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782927667; x=1783532467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGLo90uqHHqpamVY8idPGcyCygevI0iwqE7yaGUNoQs=;
        b=Ox2hXerCENZR7o8ax2RkPED5LOEYfXpl92mMH6fVEOe7+KIrf73z2XrgfaSduCukYb
         m55TlJ1fRP26BQRkIWd5CJwrJkUynbiI5Rwls0Jygcmu7DtH7uxvXH3lBKbpFRJ1p4fT
         vKwN579PY5CuVYD54erx55x5qSpZKg1uNqgoFaq7ZhUpg7qYEPGrDWpZ1z83Nn/xn+mD
         uedQHmv9vpBZ10Ud8+3krBH2OYCU4lT06KyyZHQLV2oWMWj25S0UglsZSIwqCGZ8EY5J
         xRvQkKr3LqMprZ2/oOH0vhAjTQKN66YayRk2vh7crUiNpXgTiQiH79Ij7wHdCFhUgB67
         ztAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927667; x=1783532467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGLo90uqHHqpamVY8idPGcyCygevI0iwqE7yaGUNoQs=;
        b=TvdOaR7IpG2pEQ0h6URq4BSbFcBlznNrYFH+2ALPcWaNWkr3dU8x2QoI+3VH/8R8KT
         cbKgIwtx1WMkMFByxGY08DBGdauQijiGFfBEy+I4ia3p1wDV/h/2lPjrg+UZvlCTD6Gm
         /gA2ETtqggdNDn3nMXa/6bA52mOmwHKgKKKU5VLF2L3lu+bjmXtM8cjufc0OnH/7k3MZ
         4eEcU+snoUwxW59xIp3BM1upIZ6Z8nvjscYNogwigao7tlxvoL23MM4Y2YXf43up5ECl
         DCGXPXpjRrkm8m7a3D+UKhxFkJtBZAlcgvcie5JitlItNjil9ksVeefBB4ZGVtH6VSNq
         w8UA==
X-Forwarded-Encrypted: i=1; AHgh+Rov6qtAJWqDJp2Wwkwy5LOlURWK4adMiKA2BYHODYbrdtfz6LaT+BFWJytfp6NIoNl7h6GHXUscjhiuauwypA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+NzgUIbnaZ793HDM9FWmwe0c00JE/0TvldV9hbeC+hTGqmIS
	3TaIkd2a0XoBWeFC5H993/+T5w86ClHOZs3gJJsGVMD6SNbrFb5IZNmHZFZoBLaFH7xmMzUwQcc
	uN85EAD8Q7w==
X-Gm-Gg: AfdE7cmJA7o4g2CIPh4sTNK4EaBjKUA58GlkbHf+fqeXypLvC+LTCQ8i50Jg3pbDLVg
	Dl7yzHI/vPm6gw+otU9y+Ci5L9oPkbpb64jwRT+PBjCpBFl/I+h8bT1fJxPj7cduYmMUJPA8Ly8
	ZUYuPH4M3YgTsVsZ3AWhs7DsI7DW2/gDGqiEhfKBD3+TyDqUQVmELrF+wE+BSsvbxSxKl6OunEe
	834+CKWq3teGlj9ZwJKAEHfHG34qPfGw/j2i2QA2co20aLORozp8dd8//lEikuBMcqMUS54I8mS
	cXdzsZN3Ffd0cO7q1BhvC+2jhj85UGBWXCDjGD6yXiUZxMxo+9HeraORcXaL5QdYKwWNkxP28RS
	PIIkT7+ZcF+3l3eox27zEpZnZT9pFgp/c+GyzJT4aWY6WwEQqD4dCOnq0OAnYHiV1QBLegFFc7w
	cDxtUrxssIQrXPvxU=
X-Received: by 2002:a05:6a00:2288:b0:845:eb73:411c with SMTP id d2e1a72fcca58-847c0a3b383mr2403969b3a.45.1782927666153;
        Wed, 01 Jul 2026 10:41:06 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm150943b3a.3.2026.07.01.10.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:41:05 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	apopple@nvidia.com
Cc: nico.antinori.7@gmail.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@gmail.com>
Subject: [PATCH v2 0/5] drm/nova: replace `transmute` with `zerocopy`
Date: Wed,  1 Jul 2026 14:40:51 -0300
Message-Id: <20260701174056.12604-1-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@gmail.com>

This series follows the introduction of `zerocopy` to rust-next and
replaces `transmute` traits with `zerocopy` traits. These changes are
mechanical and don't alter functionality.

This series is built upon Nicolás' recent patch, and does not touch
gsp bindings.

Specifically, the trait `transmute::FromBytes` is replaced by
`zerocopy::FromBytes` and the trait `transmute::AsBytes` is replaced
by `zerocopy::IntoBytes`. Additional traits such as
`zerocopy::Immutable` and `zerocopy::KnownLayout` are implemented as
necessary.

Pedro Yudi Honda (5):
  drm/nova: use `zerocopy` in firmware.rs
  drm/nova: use `zerocopy` in booter.rs
  drm/nova: use `zerocopy` in fwsec.rs
  drm/nova: use `zerocopy` in bootloader.rs
  drm/nova: use `zerocopy` in riscv.rs

 drivers/gpu/nova-core/firmware.rs             | 10 ++--
 drivers/gpu/nova-core/firmware/booter.rs      | 26 +++-------
 drivers/gpu/nova-core/firmware/fwsec.rs       | 49 +++++--------------
 .../nova-core/firmware/fwsec/bootloader.rs    | 18 ++-----
 drivers/gpu/nova-core/firmware/riscv.rs       | 10 ++--
 5 files changed, 30 insertions(+), 83 deletions(-)

-- 
2.34.1

