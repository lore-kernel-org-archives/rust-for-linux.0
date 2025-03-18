Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774220B1E6
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742298718; cv=none; b=DroLJ6wFHI4ay1HsMnIUA8yOAwlEKaLJ5gGQKdjogFJsdqwjk/NGDJyo/cnEU4MkepBSx1ozw9IR45sWIh6qdyLSRqw/xAxpc4Npr2l60NzUEKD7iPFSIGIsmRowAiKr+6iJGXVL4s11Tvncdj6UWwI0LAD0UwxuVu3AXeXgYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742298718; c=relaxed/simple;
	bh=278+u3fizP7W8E5ySpxmiPu88Rz4xQpc2j0W/vcy+uE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FQPovUa6wfRPkgbaoXmTzCfx8L6EKkVxaK3pWOjNzAs28/fysUPCcerH8YwRZ3/l1fqTqxNhSCpt4h+J8b9LZx22kVeReDDhKjk3jP9JbCgmiPKxFSkOpiqvUc/xgdWzl+6vUd4toj3t/xv0ZD+8knfKAPSZ/Yn1rhvDCmi7Vpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkEZngh0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkEZngh0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22438c356c8so94381885ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742298716; x=1742903516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVMWAIsRCWkE85QC6mHErAJfnb/S0g2tA5F2CDUjozQ=;
        b=mkEZngh0qaEUdh87z4y9/T8XWz2qWhhJuVsF2rImhRit3XuqBFArI/wcDUcztv5vSl
         Gjla9gr86kfXZXFBRyPL29RIqVxdFgw4lsK+9iva9N4h1FS9giz/MwogmzMM4PEIpy93
         Ln/j2NG07qqhjmmA0ZlGMZIAqC+ZUfMKB6cMtVTQ2ued5IMtKizVbMAJbN5k5YsxtLNv
         uGdLHhgculLo1FeI0JjOILJUP3+cdKbNQds78JTazCGnNBYzrKjGTFlds7oniINLxqUd
         FVF/cPfUjIzWri6unjnWKwt3cD9007HrCGBNMYhZMEvU+PdAO2w+E9xo1qjj338vkAwW
         gs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742298716; x=1742903516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVMWAIsRCWkE85QC6mHErAJfnb/S0g2tA5F2CDUjozQ=;
        b=P3yu3Q1wzb5+uID7y+MGqDKsV7ho6kIkaFO0h2TH2ylX6okwg6o9vBEiiwblhEGFx+
         GjgpspKEbMSxneY/N49NEC+RIiai+qfjgPDjTr3dm6xclrBHpXe7VKNOUJ/VzngvHx51
         EI7ifFMHrwubRTRnoCx9Zi0WMZWLF8z4U4/rLG75jvq+B/0ngL8GPLq498PCoWUHEH+c
         p2zUdZbwBR6BMlGMgX5SwHyJISM0gBx6upvH9LqGiR77hfXNJXGM059cCHYWYNplTyMc
         lT9vtps2wRtopWg0qe5vCWuYQ8FSfbBRt3XNn4l2X7YCQMwAdNOBAt7O67jPCtTAwFEJ
         xUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0xJ5vmkjAjphlhHwYgIkNP03V+TFUc6e3CIQ1C9FFMTPbd4jDOhrFpPsauo8rSLq+5pxIhjhPwRVNbOmGDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6/K1202XUzI7h3+ZKre5BGND9kYnW/8WiKUCDo6xfQp95/C6
	TTnsvHv8sCoA9QUfy8p38SV5D40p+zl5BLvnx6DzvaGrJuti65PYn/KcC5uouPw=
X-Gm-Gg: ASbGncuHJUDPHUgPK7H41+ymIVk+ST9kcyFHvfbxTRK8ltgT12T4nz0gUpvA1zh/afl
	+ODsturlaPE/igiyXH199I6xeiqyOzwf32PB4t3eaFrnwTeI82tM5inlm/2qSZpS9KPaJ6hYoJ9
	rxBnAylk1FXF1mIPkabqBw3HiKZ1OcrMGvuODcfqauEKH5bFbjJFypy0SMbRtyiK0JXl3gcrW90
	J7khuT2HzjTHN+zT2kinqF83vgX1nVRNn0Gy4yQ6EAw5t/I8xAYJ6l6GoGutH1VtoDk6TDOSEkb
	emH8JM/6HcSF74Go9ajo6PNt5/HGOHa5EPD3ByJzJioZng==
X-Google-Smtp-Source: AGHT+IEzMpHgErA9n1ehW0f2v6qOCLqe4x3qcL5Y3qH01rUKVjK2gAXQcOufynlZ3NKmeynRUexjng==
X-Received: by 2002:a17:902:d50b:b0:224:11fc:40c0 with SMTP id d9443c01a7336-225e0a52d78mr205251585ad.11.1742298715753;
        Tue, 18 Mar 2025 04:51:55 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba7280sm92079725ad.147.2025.03.18.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 04:51:55 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: [PATCH V3 0/2] Rust: Add cpumask abstractions
Date: Tue, 18 Mar 2025 17:21:48 +0530
Message-Id: <cover.1742296835.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds initial cpumask Rust abstractions and adds a new maintenance
entry for the same.

This was earlier sent as part of a larger series [1] and it was suggested to
send these separately.

Depends on: [2].

V2->V3:
- Improved comments, SAFETY, Invariants, and INVARIANT blocks.
- Add examples.
- Inline few methods.

V1->V2:
- Add Yury's Reviewed-by tag in 2/2.

- Implemented two different structures, Cpumask (corresponds to struct
  cpumask) and CpumaskBox (corresponds to cpumask_var_t). Thanks Alice for
  helping out.

--
Viresh

[1] https://lore.kernel.org/all/cover.1738832118.git.viresh.kumar@linaro.org/
[2] https://lore.kernel.org/all/20250224233938.3158-1-yury.norov@gmail.com/

Viresh Kumar (2):
  rust: Add initial cpumask abstractions
  MAINTAINERS: Add entry for Rust bitmap API

 MAINTAINERS            |   6 +
 rust/kernel/cpumask.rs | 301 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 3 files changed, 308 insertions(+)
 create mode 100644 rust/kernel/cpumask.rs

-- 
2.31.1.272.g89b43f80a514

