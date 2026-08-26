Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E241F379
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761765; cv=none; b=QgVDY+kt+dalLRjMu0R2ofHqtaQBKCrfIlHHfYg8/URNN8tBXQFbJJIIZvIkJDV9e+E2qXY48b920t310gyxCsGHAxql1CxMOzJ1yxHEtyPLIqD+YFPHEQcA4iAxBRlukn7EXrR+e6xJJoWGC1SQ1alvDMxPaKcUDA7+HkM+qcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761765; c=relaxed/simple;
	bh=kaKGfr6FnlUUXMw7q4gsuwa41L12YQBpbpijnRDMLnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POmlQ3j1AAuWhk2nNwbHmIl1Cr5YKMEiFrQyR0bceOxPZla7mYhL16jl/I0elTrDV1EGFa7T/wz2hN03VFShvbeI1zN0cGugcLJhRLFgDXlwICBKunwWUF2Kj82+mEHtyRqoz+K/ONU6FJXHa23ayd6xZ/omNTEo+6eCCpCdcww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Ff0HWLBV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Ff0HWLBV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso10695345e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761761; x=1788366561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y5RuZrNPnm2kHL6KGCg8G4oIv2nEgMkNhrs6LFEUZE=;
        b=Ff0HWLBVFW+NeRh6lgXkr5MZ7OQQit5pQm5c7Fikcrys9Vfb/ZKYCZw06CiA6wJFio
         /Ep3RNeh8TGySIlsuJVBmB+2x9fL+Zctf7FnBEKUr17UVeC3K+VWHZXWx11Si8wxIIpn
         UJphPcEaj3953XAyCeAfTQtgbcJ/7DlAKR5z1KNLcxTuqFFQ3D/8g7woBb8O+l5YpNfB
         vga0QcHK0WhZ03RdaNwLTHVlkOlbBQdxzfgNSYScsyXIzuJYiofOTjb4vUeUcZo8KC/X
         a5t0i38E4TlTRNcviz4bTbexXt2hdvRYUYcTJRnP+Xadvn3Aa7TIOVkdGwPBUKrJQWgx
         Q3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761761; x=1788366561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4y5RuZrNPnm2kHL6KGCg8G4oIv2nEgMkNhrs6LFEUZE=;
        b=iYQVO/aG2yrG78EEVprc4fNoLox3CeJBwrGM8/QmTPhVmFzDljI+KeRLG6jLK2gyhM
         TI4gwnI1htNyTuuF92t4NIjr2x2c9LYjwT+M0JKZ8eAG95PEqb4ZfQ7d08Lc46KqDcc3
         xtOgPUYW8xbD6+tnB1v7+ettISFVUigR5m6r+w297ItoOtw6pCbN/a7DnaYjzNPaTiZK
         78XZP2eUb/4I0hG+Q3uuKgv8yo0FRztb+2BC7VNWdsHgDoblubp85LTTbMnqE3pcFqGj
         ksDxR7RSAU5B9b7oRGfABIBADk80Zz8Cd8Vx0ZhNfwlZM0yPgKSBK8Ms3xv9Y0wgXciv
         4xkA==
X-Gm-Message-State: AFuF++nhJ6i21gwVBtphTJBl2anAr78EUPndRtVGffRIGjtfmqAGBLlm
	BZKJt+TLGZtn5oJ3WzKfDB4ZXnJZNA5LkwC0ySOjkmKFJW52/gPTrhkc6/H1VBrDJj/xqV15gbF
	WdlHxJBAP
X-Gm-Gg: AR+sD111hvyN6hr636RX321K8wXnf9/fXI4lJXHMm7KQu9SOlbyiWSXBMiUABIMohay
	wU7xXvwU4TmHtbYMQFSW7boerErJHB4vNTstm2ybazW9S2Ssd64a3WunH+uuSvBwjVaH4oLnU8C
	Ntl6uq0tumm9cXmIUH8JPyY7mo/TeXcKd2I/VRI/t4j5XYRA5RYvFSKDKZvaz71/Zqx6aDZjmWo
	UMT+HqeYMTj2UCA+gCC3hebgBhNNu8paNOWFJxbmlBAokoHPKGOXRamGJFlbH7SGqk4ORCzLwAQ
	aLsWoc765oH0/PbxvYjz6Dv/KT5mn8rvfVIJlIIvTpFiOET9WgY9EgCnzjYxZ3C6dhERK8BhqTs
	olDobqhOnBazTiDZNee1JhQm6FD6kAKYVkehfDi1WSwhQHgmIsXTBFLctjdXphD2YhLd8NZJ4uR
	RLQ9yzkPqXXP68ZMSqHuwUdgUlmy/FfxW3u8n1jINcmlX8LGfBx8mAtaAQEYEbO8/6eQZ4+ge7N
	aAiiW7+ambACTKud8gWW0wHQO48dS/W6jhE
X-Received: by 2002:a05:600c:1382:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499dc70b76dmr68755785e9.7.1787761760744;
        Wed, 26 Aug 2026 09:29:20 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:19 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] rust: error: expose EPROTO
Date: Wed, 26 Aug 2026 17:28:42 +0100
Message-ID: <20260826162851.2497-9-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the named protocol-error constant so Rust protocol drivers
can return the same specific errno as their C counterparts without
constructing it from a raw integer.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index a56ba6309594..9492471c2677 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -64,6 +64,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EPROTO, "Protocol error.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
