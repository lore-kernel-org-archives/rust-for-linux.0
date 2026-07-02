Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCA8480DE8
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993944; cv=none; b=iQCIYO6QjodGzcn9nYk+fraBaCa47BZpXhCqs9lpQr5Lyhyiy2wOOUlxDzkEWMGqZaSnHxZDOiPB7Nf9KJIIpkXDl6hcLXBVK/N9yjnMRaQcJfYiQwkw4RhivJxm/ikGakeYrf6tr0+0oz7wikPhLUohPzedG1hGTwxwhAdeleE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993944; c=relaxed/simple;
	bh=uPWMq9cV1DRbmfYuy2RpOefsvDQwRIf5lBPq18Iz3CI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=s5WeMbg3KALVWwxEXPbS/XKwUoxanEP5HM72sz+t4cRl7FiPLAL2D6n8MUeiM0vzfeyke2KWbnjEsL0DGSg4TVtXQOiI/8HcG0U3iNpMPgdD5JvwNBNIiGoahOMKBg82XKS5rKFMaAh3EZ3IMndBDuDhpW0AAwgPFP0znhY2qtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=TrjV3Sex; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="TrjV3Sex"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso429067241.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993937; x=1783598737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmBb3AiIVPGFeOn7V5UKb1QDdSuVN0QXacb3HjQ+rKU=;
        b=TrjV3SexLH7pNka6WxoWWiDNeo0ASij9DuWurDGbds5beQ4wP6pkhnvyovDlEkEHSr
         weT7HtvC0qi0BkhSQk+/9MIzhIdONV5tsm/Rga/7QMdEifx6LLJ4ZvRpPL3DBpqLBGmq
         OtSOfSYi/LXEvnTN9rxdUWwE172VENN8u99r9UQ1+eZ8skT4DgRiWzAJh/pZRwgOld0o
         sDRPIr6ldDK0bVjMROPl0MV8vtGdPe7e5nwua7lnfoaNztiD4wpSP2PM3Yq3wXavdX+N
         9aVzVt0MVimrJDwHJ2hYRhuPhGlZgqU95iv8v0FKHShhCVrSS1HMrFevxDa+ZAlzGejx
         e8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993937; x=1783598737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmBb3AiIVPGFeOn7V5UKb1QDdSuVN0QXacb3HjQ+rKU=;
        b=T2TYNQBgM1vt9atfm8LcJJCv1Mmu5laQuHaJ5xqhYjlhxJ4oXWitJ0XK3/M3kWjqZW
         upri7KdlqaM2hBZmyqJLU8N8Tutdbb2wNZ8iCmwWyyxt/b8JDKQg5KqEq3ruyRXMyTZc
         ygZu1gDTl0aW9IoynxKn6GuqmKI+ePUNM7SM8avlhMa9WkaD9ssoRfFTCiN7VaJyuT1d
         sTMo+5ssQbSLNqBB4yyzjE+Uvp7URpQeymgaHOiddz4lSgL5wLoxqHeofXvNA15ayXh1
         vozMCTVlWMjngQ2SuN8IHn0chcK7PUJm5uVco8YUBN1vV45/01w9WR1Y02UxcnhLjaMM
         Rm8w==
X-Forwarded-Encrypted: i=1; AHgh+RqyG9fEoNEX3w7Pr21V8NMHqWs9DJ4FX1icceZgZcUf+b3tYzGXNFV63o9Ea81oAQAtZe/zYaeb5g25O2bncw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHMGsRYBU9EnTxZ2fhTQgya6i849RD2QUzSt6dLShf7f2LhuCG
	LQpOcjttw3diZ2/72swYR+Z0fOUhqzecpeZev8lybBuZAOhBQNXYaX+nSZPlDNBD36c=
X-Gm-Gg: AfdE7cm/+QRGrvGMaGNdeouDbYMRkyxvpcq2+ABXfVCDqtIT5AUf3svjlqQlga+yUAZ
	ESTRcE0ml+PWGzDs1ZNllZQLddpZPgxrf8IVZJLLK8tqcydmPNIpchFEYy66V1vGa8nBEHfq8JP
	DVyNadafq27B9Hr74ww/xF9pO0Hnrp3+H2FT5FN1VB6kIgu/sCDqYZb4u3coj/G9QFETmaOm/si
	hmIIkP09YiafQQIJjoj3nxJrZ3fW/eUusU+IKcp7YVszw+BNKOM6BVws9u7fB7set66Wj+PVnvt
	SObxJrpIlbN/DAx+1S07EHy8qgIuksz0fwtSMCi8hTm8+/5J+8aMV4wpEfvcl2RNoWsJzwKBEv2
	67v2KfRscW+lPDpkt+fRp7+f+mWc64KfGoITaw6zN2W6Etx1ZfAvIGQQdY2eNR+yqDXdVnLjaZV
	0SiFWEqM4iaZsfPN9yCIslksdV/Q==
X-Received: by 2002:a05:6102:54a4:b0:736:e617:b4f7 with SMTP id ada2fe7eead31-73dabb35dd4mr2370159137.21.1782993937394;
        Thu, 02 Jul 2026 05:05:37 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:36 -0700 (PDT)
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
	nova-gpu@lists.linux.dev,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [RESEND PATCH v2 0/5] drm/nova: replace `transmute` with `zerocopy`
Date: Thu,  2 Jul 2026 09:03:19 -0300
Message-Id: <20260702120324.40388-1-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>


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

Resent because of wrong target list and wrong email in "From:".

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

