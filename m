Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FBA2DCC13
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420745; cv=none; b=fhDQsbzCcDzKrOGyZ6zJcRCwJuWm2VDkSoDZS3tUgPkg2918smzj0RpbHNfAP40z6OOsX7pisxQ1m4G1U/okn+YgZ7t4yGtYY4jruPdVXzojR4jigYSIg3/bSjRA4pkk+lQbgcrEcyKwskWygggFLs7jiXnOuOiuUT+DteA38Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420745; c=relaxed/simple;
	bh=4eGTOJouLCjXQq5nAUTm3nn6eAB8ZLfoiC2TTPgqwOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k57naQ7GA+31qjC8hEjSclr/mwKOnM0N243XTAJw0GPCVcnTpn4An1PFp6JqiwxmTO2kj+x6NHx8TiRrKnoE6j0/pq9A+CXL0DsT1Kfwq/EvdRsBdTA+bjz5LbKs6Mm38mwqIL29ZmfnC5ZZwGH143bNYEtMiINTf4b+Z4olfqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=oVrtu3GM; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="oVrtu3GM"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-139d5c9a495so830337c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420740; x=1783025540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OruPioe6tbdNpycRDGam1892gPF8sbvYnG0WqG8AtiQ=;
        b=oVrtu3GMeBOjMSVpjiPWGjwrs63SvpvC5WfXmBctZkYRm8EuYARf1SfbwvVMSAsLWB
         z0aT3cZFTJH6RFRTq9hBDIK//SbKVRiThspjUPRXQHwyNp1dd8KtDw8p2rxP8NezMQUa
         R90NbOWG7PJvmIbQCWIBT5qqfuX8fdw4g+/bNKw6EK8ozbJu7/73OOiO798b6+kwm5hP
         iGv9N3BY96OCrThfRO0rSKZHDkcF2klvO1e/XtyIRB5iGGPErAsTz1T0I17Frs17VH8F
         UCGBDjSAtxcMDAKbOCVu+gk8rpaS5JEOmKZqnKll1U9wN3/oLX4hcWftmVXmtQL03XW2
         xRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420740; x=1783025540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OruPioe6tbdNpycRDGam1892gPF8sbvYnG0WqG8AtiQ=;
        b=oVHgYQ/d4WB/H/dtl4ncrFH20pqJS7ZhH2AKchiTnyIQIiZtO/4SGcEy8YG4IIrWzO
         q6DABj9XhF66wEG9QnixQSAe3VfcIPmzsjs7rGGpgEgc5pwr2LdDN1FRkug3w5G49JHU
         Pi5lb9RZl93zVXcYpeTV8P3VdOZXark+mL0HAVbJ8zFO30lQxiFB+99V0/QM3ha7tjiq
         L52C6qoqx3MqgHdgWj4OzeB+Q1Vym9B9bbIOK71YCFK4U8hlKEC4FKlC6449ySGiCGpS
         dGS2h7D3N9FwnLZMJ5S9X40a9e5gN7S9+hwCa2OObJXog1xhqJO6SSa4cxrfE0v7UZh6
         jbAw==
X-Forwarded-Encrypted: i=1; AHgh+RpPq+62p/1pZtOU3yt6/LtMusZ9tr2r/Ra6D6q64ZosZ3NNETMPc27reGgSis//5PYbXjS4cyMDejEYZlpbqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0pxoJqUxjKYZ/5qZ8iOopzFu1I5yJ5pO5x1OwY4a7dU+aANSs
	dqFd50oVLq/lAqI8AsaIeIai8KfdYeGmIa36v9F118Tz3NRXN8XcePHIu4f5f0E9zeE=
X-Gm-Gg: AfdE7cnIb46XGiV3V8af9SZ8H4PlQzSKTRPjLaDz2LbXmp2haNAi6qVu+PlDqZkzQLf
	oUbFMlrKWQ6LNAyEDmAPo+wBN7w9AopMa670DBbdG2jYvGjGjkMGl86NQaaEfVYqCgud59a+6BF
	LrydmO7KZJFT3hQZdkmFpLdzmsqU9SL7T15Hbw7zY1zBxCab+Qemg64qWY+o2Yrgi+NNJ/VRgY5
	wQGdLsi1Sgh7L5LrI5lO5WqQ109HproG5zOzuyK4lmCe1o0H0Aq4OVcdHstCQYFzMZGooBeSEaf
	n3vVa0oEuIbNvlA3jCFFizyun5GjI2WjpqUwFqlQTaiMm95VgnKjK46b6PXM8KFL+lUyO+MAOm3
	CpsgQSqN8p5YG3oQToigwgOHREJ7B21LLJckK7tk0BW2OipUooFDjAMEqq/viQHWhUiRweH3bU5
	BWLLdrNz2ESaeUW00jd5P4/U0OYA==
X-Received: by 2002:a05:7300:cb83:b0:30c:d60:a879 with SMTP id 5a478bee46e88-30c84eea4a0mr4233861eec.35.1782420740087;
        Thu, 25 Jun 2026 13:52:20 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:19 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [RESEND PATCH 0/7] drm/nova: replace `transmute` with `zerocopy`
Date: Thu, 25 Jun 2026 17:51:39 -0300
Message-Id: <20260625205146.5047-1-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

This series follows the introduction of `zerocopy` to rust-next and
replaces `transmute` traits with `zerocopy` traits. These changes are
mechanical and don't alter functionality.

Specifically, the trait `transmute::FromBytes` is replaced by
`zerocopy::FromBytes` and the trait `transmute::AsBytes` is replaced
by `zerocopy::IntoBytes`. Additional traits such as
`zerocopy::Immutable` and `zerocopy::KnownLayout` are implemented as
necessary.

This does not replace the trait implemented in newtypes over
bindings. Currently, the only solution I can think of is mirroring
the bindings into another type and transmuting when necessary, but
that does not seem practical. Another issue is a type like
`gsp::cmdq::GspMem` that explicitly does not meet the requirements
for `FromBytes`, but unsafely implements the trait anyway because it
knows all of its uses. Unsafely implementing `zerocopy::FromBytes` is
not allowed, and implementing `zerocopy::TryFromBytes` would add
unnecessary overhead.

Feedback from the maintainers on the direction in these cases would
be appreciated.

Resent due to incorrect maintainer email address in previous submission.

Pedro Yudi Honda (7):
  drm/nova: use `zerocopy` in firmware.rs
  drm/nova: use `zerocopy` in vbios.rs
  drm/nova: use `zerocopy` in booter.rs
  drm/nova: use `zerocopy` in fwsec.rs
  drm/nova: use `zerocopy` in bootloader.rs
  drm/nova: use `zerocopy` in riscv.rs
  drm/nova: remove unused trait in commands.rs

 drivers/gpu/nova-core/firmware.rs             | 16 ++---
 drivers/gpu/nova-core/firmware/booter.rs      | 26 +++-----
 drivers/gpu/nova-core/firmware/fwsec.rs       | 47 ++++-----------
 .../nova-core/firmware/fwsec/bootloader.rs    | 16 ++---
 drivers/gpu/nova-core/firmware/riscv.rs       | 10 +---
 drivers/gpu/nova-core/gsp/commands.rs         |  9 +--
 drivers/gpu/nova-core/vbios.rs                | 60 ++++++-------------
 7 files changed, 49 insertions(+), 135 deletions(-)

-- 
2.34.1

