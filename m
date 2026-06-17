Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B218477E37
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708512; cv=none; b=hSAQszk8nIBw2xDZhNhgyUv8lPCEkiGFQlxHJVmr0/xPl2Oow+TDaa56YUYG9i7hLYUOuPBgI8g3ZjdhhykqTn16kW127uISyMHroY3F9Jlxy2CDT+A5Cukc+QDniqvW3fpQymuYrYnFiru+pJV1Rr9apQ7oVj8SPl97bs2KWTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708512; c=relaxed/simple;
	bh=v4HgzcMPKtCA1bfRUgCAIH2p6H7a1hFEIgPWyKO8bQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ac1ODTrFPVxb92LTMQNYjJ7ZATF2paKk32PQbJf8VkAYnyKTKERcIpSgEPlR93i7pE9LbC05C4kV/GLmreSsf8wluT/MdeU79loIbcMogmPxrnkak9LOb7Ugtem7rBEER3LvXl+QDJEeZdeiZjoSQO0maLVjepRhy3dx+wmw4gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=hawcx6v7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="hawcx6v7"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3967738c801so51789921fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708509; x=1782313309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTwZZKye4gPezAdX2S6YpGx1K71xdb9A7yBEG4t0T58=;
        b=hawcx6v74GbT9EOTtbj8ucFsSSd0/pvWUbyL2gYhzzthroeu3qCtwzHeLc28sNz3ZN
         tiiVnpOitW8xommw2DUavJ7v/+pykJMEI7MyL+YJpwkTaNf9WYsEufI4C6Jp3QlmgEJa
         TKY+F/e2UWIc4Z27jKnJj76EnCfso0npuZ0XApFqj4YrCrVaD7IYzgq/W5KGUscEaZY1
         3yl6AgFF6AHK5tZbFO7qLAFzT07B4Hkm3eay9Ktsi1df+Gxfh3NKC24Z2LHK84bsrUtr
         70Xhg584bksqwcFGBOj/s28mWlHQT8oxFo1a5kNQ/S7me2euBVT92XCeaxQwUcnSa5Nk
         DRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708509; x=1782313309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTwZZKye4gPezAdX2S6YpGx1K71xdb9A7yBEG4t0T58=;
        b=L/vPaLX3zi0YmKQ2Qe8v1XpIbiHjtQuRyGDFLRdo+CCZaKVDsKluwhVgEBbH3fBQly
         9xKtgRDKJ3P5DAY3yZXYaLcLk0LktbFLEFYIlaxmTEPkb5Bl6jzl9HG5dw2AiEMS64uY
         fYkoxCnz/zLymUAGGE6n0Thjj9Z0bIPgFZDBFxpXvbOkdX3Icy9A0rgYH/e/TbuYyabw
         ++MeonexVecsBLi9Cdr6DHyLp6pwNrD06BcnNcxx6PJ2rq3j5IihBUXYRrjx280Ta7p7
         654aoxJUnNNeES2eMWHKxCBFTj6L/SN/DSCdDyfK3OdUr8iPqOaw/5B/xNFSlnSP5mcw
         jW9g==
X-Gm-Message-State: AOJu0YzjZNd/A3UmIUGJQGVYguR94vHAFflUH1GDYAHyZpOQNiHFWWPI
	tMCovyosv5NWxNQjWtflz5nO7g/7fDQLN/6FLo9gQ8NLLK3j68pDedaPcXPQtI5dWuFxhWNoQuT
	fmWSK/G59
X-Gm-Gg: AfdE7ckSV6eSXcXFY9PLDSDjxh2+EL2YnzvyJdWXUjntD4NFJ11688ZJTKM+wJFxs3d
	cRhSZsk0gY5iDgKiYP2Id9igcdbxVfmQZA7DJSnphpv7IT+mhCrq4r+z8QNGYnrnIqmQ/PaguTV
	K5iWgggmNGuHzPEsxxc3kKCbvTsxOy7w667mdc/bJvwGjEdZAZAtTcEvW+60F1KeODrdwCxzKTN
	/owKw9aeM8YgjN2JtZsfoZkyRSvDQ1nQqsst9H8CcQqbroEykDpiacGEveoiWYgsvu5rx3HaAIl
	aKX4hK2mvmH0DSsm5RmS/6pFNS0BWOHCVUyuUye8mBPn5OOrYewiLh/lxPAD7exKb8WIwRUBm13
	k7qcPfvrFI3I42tveqJvxMlhHeY3RkGzBVFdeZObGWx08G39kUqKnAdtMB17NdREKfqySCsR9H+
	W6Cb0ZhIBUaU2klzf8dBKCppaF90knClVIGaOPNPfy504PsXhIsuJgyCxU
X-Received: by 2002:a2e:b888:0:b0:38e:6:4f89 with SMTP id 38308e7fff4ca-39969c2feadmr11390881fa.25.1781708509077;
        Wed, 17 Jun 2026 08:01:49 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461abb44c3dsm13769159f8f.9.2026.06.17.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:01:48 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] rust: crypto: library AES-128 / SHA-256 / HMAC + RSA
Date: Wed, 17 Jun 2026 16:01:31 +0100
Message-ID: <20260617150143.2152-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This RFC series adds a small, reusable kernel::crypto module so in-kernel
Rust code can hash, encrypt a single AES block, and do RSA public-key
encryption:

  1/2  sha256(), hmac_sha256(), Aes128 (single-block ECB)
  2/2  Akcipher + rsa_pubkey_encrypt() over crypto_akcipher

Patch 1 binds the library crypto (lib/crypto) functions directly
(SHA-256 / HMAC-SHA256) and uses one rust_helper_ shim for aes_encrypt()
(its transparent union is unbindable). It runs synchronously in the
calling context with no allocation and is the independently-mergeable,
self-contained contribution.

Patch 2 adds crypto::Akcipher, a thin wrapper over the asynchronous
public-key API (crypto_akcipher) driven synchronously, and a
crypto::rsa_pubkey_encrypt() convenience built on it: it DER-encodes the
RSAPublicKey the "rsa" transform expects, runs one encrypt, and leaves
padding to the caller. The request/scatterlist/completion plumbing (all
static-inline or on-stack) plus a kmalloc bounce for the DMA data path
live in one rust_helper_ shim; crypto_free_akcipher() and
crypto_akcipher_set_pub_key() are exposed through 1:1 shims. Going
through crypto_akcipher rather than the MPI math library means it
composes with any registered RSA implementation, including hardware
offload. It is kept a separate patch so the public-key surface can be
reviewed (or deferred) on its own without touching patch 1.

Both were factored out of an out-of-tree in-kernel Rust DisplayLink DL3
dock driver (which needs SHA/HMAC/AES for HDCP 2.2 and RSA for the AKE),
but the module is generic. Compile-tested in-tree against drm-next.

Mike Lothian (2):
  rust: crypto: add library AES-128 / SHA-256 / HMAC-SHA256 bindings
  rust: crypto: add RSA public-key encryption via crypto_akcipher

 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/crypto.c           |  95 +++++++++++++++++++++++++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/crypto.rs           | 255 ++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 5 files changed, 355 insertions(+)

--
2.54.0
