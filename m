Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0A3009CC
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169438; cv=none; b=b7M8ybuzbNSNsrZtUAoszhVpT9tnUPsptuf3UdjxCSytyw6UpzME4EtlPgS9mMKHtCbCE+9sYbVG7+1zoGMMTfiHo6sV/AM0UKZDu11yjI1+9ezn2dZUxBD91LDbd/Mww89bT+q9xJL+SGWNlVprqCSDqzH0mi8ZlM5gzP6OGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169438; c=relaxed/simple;
	bh=0suKgHuLRwkBTP77PUvWJkf99RJxwXQOarlKT4reJUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/bS5uVwrh+Sp4dBjKuRZ0yRmgutnaTEkWa7ErcMaZztt4sSwSex5Q8RbYP5ynEvfNZtMONqkq9wqEdxNrZwday+UIWEy/johTZjgDnKbzRVpDRxijHyBRCxRJMZFVMrURcV9gJw9LajhjfoCB3RqveuMycLVTe7GI4aDI1yg60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byP3W5O1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byP3W5O1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7abe8442103so304026b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 03:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762169436; x=1762774236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/qh3QJ9wKU70Pva3b0Eg2Hw/21TsuzKDzuHyxygKns=;
        b=byP3W5O1IesJt+Kyr+/uVzGRjG2XpiU4fZr4oBghP27LAvz4hmFMMvIkx6cbKwYko0
         /wStooa9RAuYayeqeax9YbmNrX4yX0DX/reZ3FoguzsfYfcfieva9uMg2mNNoL2qBPDT
         MeqQ7XOqB1yqQ/iZzkd9nZhriH+F2P8/2k67TkDzwimEcIJpCbyD79DDanQroEO8SmEX
         P3BN0gTYYzy+AdMJaj/sseo/JB/pNLwdYq+sjhBBpPIUgFI9OgpMH5mJ5UNferaNTlar
         gNtjAiLvfQaETrXNSv+Ok6UyZWjYa7QDbXIdcAkGofJ3N/ZGZvRfc6PaBS7A7QwBqb4Q
         61Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169436; x=1762774236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/qh3QJ9wKU70Pva3b0Eg2Hw/21TsuzKDzuHyxygKns=;
        b=uRABrz/Gde2Ce2WueGPDEhSgyqS7DoA0c1LktzVAVTwJ9019B60mckXSe+RQRyLmyW
         Z0DESDerKPkF+a2DW8DGruesQnKQ3ef1khjiN/c33YekESMloTZFtfaoYtRpRHSWRuLZ
         M0oIfTnmPlWRSrjJu0PXyeuS0Fuk4QJ0I5WS03wH7ndFnDyMist6somkcAlGon6LhV3Z
         qvUysm8ioisvfJwl8Cd3Aaz1ez7b6m0Cf6nRdU6Wy4umjI+KKhtG4ZMKJiVfZQc8UNZw
         HQv9YDYZTU8TcLqtDmClr2LrxGvLReRnszqFcMPBn2Q4xQCnjOIxMA+boINBDf2dRI8Y
         xMxw==
X-Forwarded-Encrypted: i=1; AJvYcCWTWZImPHAseEpUBZ/kkQ6Y2oBzxie+mxbErNJPrjmJaQTTne29M9CZLzDiMmHWu+KSEL9Mh/h1kjpSyckFlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ySIrXkWWC+/4UXh6PfZwbZZfPTbwyagP+lY6iKsDBWQy7j22
	ipl4NZx4aihwOyxoEyR5mPmEn/g4NsWU2wWzRNegu98Z1ND+so3HViAE
X-Gm-Gg: ASbGncthCoffm/qp3DE0AN9+aThJW2fzxEtaAwEG/qRinI/2cVGdPtSB7gPAk0uuw7E
	OVI8W3PCpwn4tLOq6MoEwnZWzcGrkfLR584q09CuUNBJY1DjukfwjNks/wlzlj4ozBAfJzr8c/4
	QpsOiGVNCGTB5N5en3VnVD3Wy4BsoXqEh3gAhYQsZzx8tg38O528JDxG3JyYmIUD8TYR7+56AAJ
	gRWtrZVOLRkdPyex/w0ikAdjUKQhYthTVxD4BJ6TIpkkfTefSM9akF7xUf6KqRjofpXDAzw6IEs
	+W856TpUC3Ny/t1uZZGAS5PZ9jaSPZZ6PlAt6TNdgyuD6mKGdjcWyQnodSL8qQuoiXLdjivdHEN
	u5zcs5zVGlHSk8cwPRFXccO4lSIdsNRKkFvGBORcOFYe31qW0g3DSVR2oCGVgYqVevPYdZwFURq
	BMy8By/x0cvzslIvjeiGFYaQEjfE/srPHCyl1h3mgdYAkxK4E4neoTT5OG14U=
X-Google-Smtp-Source: AGHT+IE5/oLm71Mm5Mx8J4RBYI2+xTTJ8AwTf4zBrIpxR08Ev1LR4nonjYQhd6iz+19QOqH9Sq10mQ==
X-Received: by 2002:a05:6a00:2d1d:b0:7aa:8397:7750 with SMTP id d2e1a72fcca58-7aa839780d6mr5007659b3a.12.1762169436363;
        Mon, 03 Nov 2025 03:30:36 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897c632sm11011033b3a.10.2025.11.03.03.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:30:36 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v4 0/2] Add read_poll_timeout_atomic support
Date: Mon,  3 Nov 2025 20:29:56 +0900
Message-ID: <20251103112958.2961517-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read_poll_timeout_atomic function which polls periodically until a
condition is met, an error occurs, or the attempt limit is reached.

This helper is used to wait for a condition in atomic context,
mirroring the C's read_poll_timeout_atomic().

In atomic context, the timekeeping infrastructure is unavailable, so
reliable time-based timeouts cannot be implemented. So instead, the
helper accepts a maximum number of attempts and busy-waits (udelay +
cpu_relax) between tries.

v4:
- update the comment on udelay
- add Alice and Andreas' Reviewed-by
v3: https://lore.kernel.org/lkml/20251026125458.2772103-1-fujita.tomonori@gmail.com/
- revert the function name
- simplify the example code
- add debug_assert to check the range for udelay
v2: https://lore.kernel.org/lkml/20251021071146.2357069-1-fujita.tomonori@gmail.com/
- use the attempt limit instead of timeout
- rename the function to read_poll_count_atomic
- add the comment about C's udelay behavior.
v1: https://lore.kernel.org/lkml/20250821035710.3692455-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (2):
  rust: add udelay() function
  rust: Add read_poll_timeout_atomic function

 rust/helpers/time.c       |  5 +++
 rust/kernel/io/poll.rs    | 72 ++++++++++++++++++++++++++++++++++++++-
 rust/kernel/time/delay.rs | 37 ++++++++++++++++++++
 3 files changed, 113 insertions(+), 1 deletion(-)


base-commit: b0b7301b004301afe920b3d08caa6171dd3f4011
-- 
2.43.0

