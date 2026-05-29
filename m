Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30232B12F
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061372; cv=none; b=k1w40r3zKX/aRlfYoWd72X93A/WlkvWjW3HdHQs68G1t6vkHuXTRZc/ENTomDjAOoH7LFLmWqsmnPU/Gyvu7wOi0bSfd3RsQMX1tDNu1XXJ4k11Jku300GHOvKJJuPRKM8H2O+BwwuJN/0PyGuurE5RbRHih4EWsuGIDLqJ1bsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061372; c=relaxed/simple;
	bh=jQS5w3juKxh/8rsWEVFsuUj2CrwmODGzA/KyT3vg3gc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PjLQ8ChlKK5S+eAOk+vskqM7ACAn44/XuUEP3DN7jnOx787PINMbET43920pO1n/Oa745UnVwtHRr7IbW7c/3HPyl/yhJ9WO4zTCcBjncxsRIXuyB34VD4CO81Djd65pp0PjSrGcva10Cz/DWztBavA1hvwDpHLwa/VpSj0NAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rTmZshYw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rTmZshYw"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-49045243094so100703685e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780061369; x=1780666169; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPbFopuJb3xJlIvAFVS2VoE+RIwABLyaYMui6R01KkA=;
        b=rTmZshYwgLBrjWpD5mkHTMgbNmbTubycRjyFAads1/j0HGvX2aAnUJ2MF4hoOgyq6W
         DtmaJwn8xEYHtTKmoSQxjdpdIl6cqTqMtGY7npsVR4v2EqtFF//RF6f9mgC2BXS1K02m
         V3ymkZWhddmD+D0cirLFiCl0fI0JGh5nxP9mu4D4fEhO45soc2eePOji//C0D4+U4VAb
         4wuP5hbTVPImdaWZFj+xZdZjeSfiCtjdxoiBKITpgs3FOezlj7bT/ce5c7U2SjLH9V4K
         F0HCkgBve24AjYAkR5kARxSZPJDdYN8PzHdUwouIk8hHxUQQy9N42zgMc0BIkL6rUYHq
         XntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780061369; x=1780666169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPbFopuJb3xJlIvAFVS2VoE+RIwABLyaYMui6R01KkA=;
        b=h4ByfXa9JS0yCHcj0qO5l3OMkqeJjSkX7ndzncmrIeGwArReGn6LuKwPF3ayRGilk3
         C7/QaMZU7Vw3dLt36kVwqgYPTG0t1mKiHnlL+oM/YiyAndX99q/uUyX5lpCV1Lcq+nUa
         gX+Ix3U7Xd2aVehpLFm/YQHpEWSXPGxO3dnlhQ7cIx2o9SC54reWvy4hvQqxzR5DCPeF
         FZ546oPLzgzKMgK7Bq+bln99YvIaouT8vI6z2tGcYVT0QY3Wp4LEek0gzw+aZwLYkpq6
         lBH6KAeRlhH4g2pRSlExmjhOekxItFXRjIHzZ57TEBGHsIaZrWvfxj7FIUKBsAYNBHkl
         4j2g==
X-Forwarded-Encrypted: i=1; AFNElJ+c3ZYFMZ5c3+nTtiNlSXBrg+cOM1awPww4BuZXn+oW142vbk5jXqdeIccOseTGLPJdulcB7pU9i30yHczFYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqWa14Bv5Bl5tc5cTSFDYVefTZf6CRIPOVmqGro/FiJgGaNSwg
	544n9qdKWqXdbCziReI01LVDg4w4T1J4TYfYYXPDgCxK5X6b2t/+d5EJ6+DK5jgtOczcFbx7UtC
	nDr58KrtZh4YRgIT6zQ==
X-Received: from wmla10.prod.google.com ([2002:a05:600d:238a:b0:48f:d328:60c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4589:b0:490:50e8:45c3 with SMTP id 5b1f17b1804b1-4909c028fccmr57511305e9.0.1780061365120;
 Fri, 29 May 2026 06:29:25 -0700 (PDT)
Date: Fri, 29 May 2026 13:28:38 +0000
In-Reply-To: <20260529-binder-netlink-v6-0-92dd74b6a32e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260529-binder-netlink-v6-0-92dd74b6a32e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jQS5w3juKxh/8rsWEVFsuUj2CrwmODGzA/KyT3vg3gc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqGZSqiLJlV643r8T6gfx80O09094kuKPpWw9NA
 E1PXS3vroWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCahmUqgAKCRAEWL7uWMY5
 RhBwD/90l0syKd+gZ1Z71dZ0oWqW+27vPX2QWMsTCj7diDQn408Q4NI5cWOxyYmIy19+bbOz/by
 MuUe5K1VYbw/5ifmAf5o77bZyisqa6EwQwLm2cNGrV8ErTf2uPngM9LDB/yRVZybATAeuMLeodA
 GJeof0Vo0m+cKrj6UoXmBEjiY5NbMXKjOnwdtmTQRvMhin2569HK7Dic++xoUUwv/sE09rZADrS
 cbfcLEBsv0ACIh+R/Oksnyz8Jq+GUjcBBt+nlpUWmHuCuYbN3OSiY6MaWodtWN7DbAOU4IGxpFV
 kbzWtpb4hoZeKQ6eKlJoenHuwLA0TlX3sIYRAwOkMtcpmRl9fxEqMn4SZxt2wJFb980pEzpOppL
 7mD9POOAt/wexriuoQ5UeVn0XxWx4zPxlWmRrF2Y+FD9MN1CDQ982dqfrKVTwLfFVAV99viGtEb
 CJCqlfUaImTMmYjMDKVLe2KAiDFLDPKX8EKLQNmbQcHV3+69yysD3SgJlQAp72k6LNvwGmm5t8C
 EsQ/pQajhXT/HGp57F8EHAz5RZIA414UOnFuQyZ/3d7nR3HchfBCp9JFspdNNuXr5W6wBHhrUg4
 2eikaXLsYTjTN5pMuAowxS+OYjHmwQpLZYUwN+cVTq2eKUEqaPxKG919gMEXr2nkLVQSy2UuDRb A0CcsEogqS3u2MQ==
X-Mailer: b4 0.14.3
Message-ID: <20260529-binder-netlink-v6-1-92dd74b6a32e@google.com>
Subject: [PATCH v6 1/3] rust: net: add rust/kernel/net to NETWORKING [GENERAL]
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To ensure that networking code can be found in a single shared place,
add it to the relevant NETWORKING entry. The net.rs file is moved into
the net/ directory so that it's included under the MAINTAINERS entry
without needing a separate rust/kernel/net.rs entry.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                        | 2 ++
 rust/kernel/{net.rs => net/mod.rs} | 0
 2 files changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a61a229670b3..08bbe8e0a74a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18612,6 +18612,8 @@ F:	include/uapi/linux/sctp.h
 F:	lib/net_utils.c
 F:	lib/random32.c
 F:	net/
+F:	rust/helpers/net/
+F:	rust/kernel/net/
 F:	samples/pktgen/
 F:	tools/net/
 F:	tools/testing/selftests/net/
diff --git a/rust/kernel/net.rs b/rust/kernel/net/mod.rs
similarity index 100%
rename from rust/kernel/net.rs
rename to rust/kernel/net/mod.rs

-- 
2.54.0.823.g6e5bcc1fc9-goog

