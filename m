Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4111F1515
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737558043; cv=none; b=WR2yTyl+b/FhtSvIoq9+0GY55VC0+7q9I1LorlAQFsRpKKvIAfzumZ0WbcB1f4ikyQGj8AkkBH0wVdSG6l2tk7CDQ0VDbztR542Gy9fyPBOA7pnuQ7Y0gJz2kUaCkIcGPlkih3Rre3r0+s0lmhhPYgciRDq0sqzlPSb4jI8XcAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737558043; c=relaxed/simple;
	bh=UlFTUval075n1pU1lJt6aekYKOAzeEhpmVnWDx7T5n4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CGsKTn+NkBAXqr+3YOwSVvmgxnDREw16j9G9ipO9oNsyJ4rOlTjwe4nuZ7yCV10URzYyYAhF2UsTZNJQOk6SEtpzp2FzSJf/Sy9G+8b8kCtM9oHxDI3d8mYaRV+KmeFavKaEBRKlRbIT7z4AIItCMUoLGgk+Ba+XqxqGsViIh48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u/9pZhi1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u/9pZhi1"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so53355815e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 07:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737558040; x=1738162840; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=id1VDflTVzcefpgECX/4rEE5YcXZVQjN6vr26lgBwBI=;
        b=u/9pZhi1hOt7L8KIpf0Bhy8PeLMSJd8MmgJQEAjPHYA/Ecn5mKXeZUo35c4uqqG2Zp
         oXcAzLmsBg9wRnmocbnO2QImc5NFw1RRZoGldcNZqZLp4GrozLcM6bTShA+vZj5yIYPO
         XU5Inc3qmCdO17exaROIYOCBOT7oxHrjwO4OUZRpCvm2mT1wZ9cf4iiJx82plW2aaj4v
         hqH1Jfxn4odCLbqVGbgfNb8GDLmu7pMm/m3DLLQFvxT+Vd+FOATI7WzK5IbqXp7l2C0T
         A3X5Mz3huPUR49izkxdLrFeOdfYnT4vI6pK04SMwSa/HdHD1QYhyJI7nXyu3ul7WAW4g
         DbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737558040; x=1738162840;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=id1VDflTVzcefpgECX/4rEE5YcXZVQjN6vr26lgBwBI=;
        b=DZZ5KjESEwZGiO9i7WzEMK1lJz6ZeD/i0w30pNY3N2AGGSAHTEDKpUu3qpDgkszCx4
         +0AnyuqoaVGMj/pIzwcJhtWHGkaw1ax1aOJ7ofrQuJ9PQaPZyFOZpIEr2BLeKmXs59tK
         2nIATDRvGC90ebSEsbjsicXnNmYjFVZh5guruK+Af+U5wmuFjsd36pnn7NiikRHMZly4
         //pnqWg+r/pz04T69wKfDUroerSPUEQ7MShqKYW+qCOCig8yB1d7ighaMsUtOVXvGdSx
         D8ZBkPcwr/vR9vkp16tw3vjt95LICcOWI/j8+TrwGvP8/bz46M9sZPbrYy4z7fU0u7/z
         rZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7cSXXmf3BTHrfaQ7UTeQkAp1Ff5xbLPDRR5FGZx0qftv7w/+145r7p2ZYg2FkXNUQ0B0v2Wqnd/z49Jk4mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvmpmRACJum63QvH9cWjURP6gJEaw0aGacMLnz1JseohK9kqpY
	rqgt7XrHsRt+12sONXz7UxPkwtNzJNbwz+K2nCF5DMlyYGe6s2IsoxHVrXijWnwmeQy/5zySrHI
	U4eZpXw0laeOdWQ==
X-Google-Smtp-Source: AGHT+IHBLsYijGd2ut5M4a+0bxVzhF2qoLSU+a9x16uYXYdXRCoRbAB+dduLcUshn9HLwrZ3fF7s/hF7kRNNb0M=
X-Received: from wmor13.prod.google.com ([2002:a05:600c:458d:b0:435:21e:7bec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4713:b0:436:9227:915 with SMTP id 5b1f17b1804b1-438913caa3cmr176218165e9.9.1737558039813;
 Wed, 22 Jan 2025 07:00:39 -0800 (PST)
Date: Wed, 22 Jan 2025 15:00:16 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAIkWcC/2XMQQ6CMBCF4auQrh3TKS0FV97DuIAyQhOlpsWqI
 dzdQnShLt9L/m9igbylwHbZxDxFG6wb0sg3GTN9PXQEtk2bCS4kcizA3HxwHhoa70QDoJINtaW
 qSGiWoqunk32s4OGYdm/D6Pxz9SMu75sS6peKCAi8rDDXKOua1L5zrjvT1rgLW6woPr3iKPCvF 8ABGyFNm2tdYPnVz/P8Agj+T+jtAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=UlFTUval075n1pU1lJt6aekYKOAzeEhpmVnWDx7T5n4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnkQgHdOjKt1bSg8mdlg+kKSRvIrwf7hnmOiUFs
 YFVqk7NK2WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5EIBwAKCRAEWL7uWMY5
 RpV5EACHp0P7/1vBr8Wb3+wrOZaXdgmz/lYdYvUnatHqb5dYv8bOcfunuHOMHqub5PqR2EC0asq
 z9e7gDC/2AUf7qmk9xiKnR5VsmLVzHjaHrdfODkgsPBL8ltaYQGfESO0424M/DWP1YN0UnXX4/p
 K6x1kD3q8qQu9s8NbAr98jJbyVU+FgdI6R1f2kcw4QuGT7xLMGGJ7L5XTlbYPD2/gv04VRq2sDk
 qY5y/YQZR1GZkXK5TqCg8MJcaf4+tsYI85DiVF1Y9KCdjuaiV9Vl6+LpyzzrXF+VmuWPJoWp/ed
 MtRFK8yS3f+8YRIVmz3+POBd195RY9CXigjZswN0RJ4bDoQiPd1VcwKJdQcGRoJ/ekp4NCZKEhb
 RB64GAMQ7d/QWXJ5OmMwu8IOyVM0sIsUMfAy5Yn+kRdowSoNF0wqDXOHpL0E2VhKV/tYwOHt2dj
 gW5fG8UuV1BM3xyVYSpi2to+12kfVlY5RE75lv9BFv3kDhz6zkLSq7QApz2es30aUfyHcS5X2jv
 HOnYDRTiD5zfw5hmlYGP/o0brSwOcfybp0z5jp6svlr96NwGZxG0VF1OUcXt8h+QAzrjwHhlQQ+
 sExgxepsUMG1h5sw6Z9uZ3sX16k93cHcqa0DpAC2dUKtVGIqYP3Pr5u6kq3NBY21Fpm1zRN+bwO Hd0uE/EJiqsMFdQ==
X-Mailer: b4 0.13.0
Message-ID: <20250122-cursor-between-v3-0-aaafbd8af14d@google.com>
Subject: [PATCH v3 0/2] Make the Rust linked list cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for more details and
motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Fix `CursorPeek::deref` to use `self.ptr`.
- Reword comment on `ArcBorrow` in `impl Deref for CursorPeek`.
- Link to v2: https://lore.kernel.org/r/20250121-cursor-between-v2-0-1b24cd377618@google.com

Changes in v2:
- Extract insert_inner refactor to separate patch.
- Make move_next/move_prev not wrap around.
- Add some examples.
- Link to v1: https://lore.kernel.org/r/20241025-cursor-between-v1-1-08913714aae5@google.com

---
Alice Ryhl (2):
      rust: list: extract common code for insertion
      rust: list: make the cursor point between elements

 rust/kernel/list.rs | 403 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 310 insertions(+), 93 deletions(-)
---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20241016-cursor-between-154bed859e27

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

