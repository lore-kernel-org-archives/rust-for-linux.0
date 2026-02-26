Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3D36682C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107793; cv=none; b=gyXav+yqy8prqf7XXLkdAdJl7e6nH0I+I49JzuDtDR7oibNrFoPjmII0Wowgv4MxDClaMtF7CSD4/Ds3VbZXkocGpiJ+4l61PlxEOiy/nnjF8cusAj8O5Ohm8VV0N61NuRuGmQSUxgXMTR+PwFqXI5X/+ZGjmUFx9fKeSd9Uiss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107793; c=relaxed/simple;
	bh=q/BupPXYIK860fliRc1o6ocrwmQWHDcuaa/4DycqroE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p44oIkNBH9tQys1F8CoM7ghZ1UhKxsZHB7dbUXloMBjoUm61WOXrYHNUOEBWVtxqvPt/9Zwgz5yIbY3TbWXr9z/5GMEtgpW02rMCyJ6yXGyyYoL1/P1nhOonTQXwRKZVLaeW0Oanf3WVPCQ8Nni1DV3G1aYk0C26RBz+rlmwIgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnXyonRP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnXyonRP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad4d639db3so3610485ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 04:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772107791; x=1772712591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0B0wEk+WwoWgn7HdHTBnqY/fAvv84JHoXrJcJdw2cdQ=;
        b=mnXyonRPkVZ5d03ZAAdLxxbsxRbKbCKKJ55KJKZTPHKLi0tPc3MYuE045JYEeF4Z9G
         ctrt24UEnHeLnGsgDvQPC2d/9SwJovoCrNVTp5lDx2oOdmqQ+pBgncbvBIPGxslMgNdm
         0/NdaD9LGT5xbXNROt67Dil+iwmEXxzIeuhrN5BrauLN4PPcEWBkaI4TUPrCUqfbKceO
         T9+C34+mtBRt8BbpR/r21nd1mddDm3sA1gH6J4MkuM3XM9PteK+GLbeL2CWVO1o1U/Dk
         ExLMc3ybAGLLaOIuzb2FjLjCB+drz1m7dy5lv0702JcVxGEmLwYCjmKhNQVJIip+cfrk
         DZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107791; x=1772712591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B0wEk+WwoWgn7HdHTBnqY/fAvv84JHoXrJcJdw2cdQ=;
        b=i8hRYtNlFCyQ9qqKOYVkS3pbLP+ZKqlIYHI2QPYvSnIYxcF7RzL6z/P2S56ZcPfU1X
         xWR7jSiYpmNz36cPLL9er5Mu8OO59l2E1NBnpo1l2l5SJwFSB5Q6r955ssfzCubFuMW+
         l1dZWskUokFyvRr7Mseq1OLVrISHysK9JjVrlziFnbAi02Byz1yHVoTChLuOOrDY19nj
         7sySl8sUi3pi3UD4hp54rR0fDy735eohOg7SGm5FihRyacwJeOjFVRkdN1ZsU9AoJH7t
         Gzsz34E/S3Fs+TSePoFxsSqQ932jaXb1wmWDr18gYzvgWzqFAyme8d1BFoDisWgixxH+
         EqTA==
X-Forwarded-Encrypted: i=1; AJvYcCWp65wOfy/POYvyp3tJ6mkQ97Rg7LmvHIvXGpYlEgUClrQXQJ3QoeVFyzkEXHyJl2+a1gO3CcEqY3N1LlRxUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKL1N8gHegMeQcNQzsfBdOfj7K6R0Qg5cXD1Ulqz/TaZocm65
	i6T8LxIpev6VxiyKFFLWGjsxAFJyEK6NT9l5ej939+whfmYwWQkdi5PO
X-Gm-Gg: ATEYQzx403D0UX7OZ4LNvkGIeSjoCAW13JD4kD7ukGxbmoKBAu+vZb3itI0cl31Clg9
	3H2X+HF2ld9swRp9+gbjrB7XAJPCN2vSz3LsbMqzEpdol+lO3MZnIhV3HJtFzOZqxNgfGQ6wli4
	ROxrePYSRWJXiHYSQCBtt0i0t0kLxCUiMMpoPkNUc4lbbrl0/Dm5HEXcP2SNEOBrnRRtVUlqanw
	feFhk5K08gEEYIitAbWHYikOSx+bAnjRM280D9VMwG+6/mF7SyEFyWtaZldKyj1EzuspSlqpvkk
	c60D3ALiM+dSPnrI7Te3G+gRgxZW7r2a/UQHA7Wppdhvh2tNFKnxWv7kyLNthWtX/DR5hSzzFX8
	4BaxQhaBYaDrWQ2CjX/JoC3GAEM1VgHSDIsif6BZiCoBDVaOAS/yhF1e/ZMmXFsJktUlilVHnBh
	IwPH8x0aLFPyxffFqPWLLnJvMf
X-Received: by 2002:a17:903:238a:b0:2aa:f469:fa23 with SMTP id d9443c01a7336-2ade99a6639mr34839595ad.4.1772107791545;
        Thu, 26 Feb 2026 04:09:51 -0800 (PST)
Received: from archlinux ([103.208.68.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6cd476sm24199525ad.75.2026.02.26.04.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:09:51 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH 0/4] rust: replace WARN_ONCE TODOs with pr_warn_once!
Date: Thu, 26 Feb 2026 17:38:44 +0530
Message-ID: <20260226120848.82891-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_warn and TODO comments for pr_warn_once with the macro call.

Adarsh Das (4):
  rust: error: use `pr_warn_once!` instead of `pr_warn!`
  rust: module_params: use `pr_warn_once!` instead of `pr_warn!`
  rust: mm: add `pr_warn_once!` for invalid range in
    `zap_page_range_single`
  rust: time: add `pr_warn_once!` for clamped delta in `fsleep`

 rust/kernel/error.rs        | 3 +--
 rust/kernel/mm/virt.rs      | 2 +-
 rust/kernel/module_param.rs | 3 +--
 rust/kernel/time/delay.rs   | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.53.0

