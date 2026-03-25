Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB52351C32
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430825; cv=none; b=nuxRpLfruPjI6yZhHF37nBZPVS6lj0B2k3usL8VuwbcU1mzLmlU5Cgvv0fdDFfDTqi0bYs/bRpgO3KYR5W6TS5p/DbVLBlacLIDm/YzXRVWdBqzmnwfMgcdpbsguuhIW9irXKgQi8713U1InKddic5+RPsyi0sj9GrbK6yKblLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430825; c=relaxed/simple;
	bh=Gkp+txELiHIEhkzEMp2BVH5d9/FABWaIfVSHBigX4DM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UlNS1n1cuFWWO5fOS/SrqJUqEUsOSO4SISDIqBL5ASWgmWCK3iv1kRLiy/6mtumQfC71NJluSM/op8PXJ78+mPwPfEYux6xT4xe7ZkEoXAHjRdL0ycsI0rPP/7gbryfNFl6NTkoHPStCaQSosPn8/lYYbvig7MDXHPgY/N9e5zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cqtE3sLX; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cqtE3sLX"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439af7ba802so4628487f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774430822; x=1775035622; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BEHtnkDedFMhPuXZm50aAWepNktE4XNs6FAEIq0X4WA=;
        b=cqtE3sLXxVyNJN4HWuP5cBQM0ALIUXC20Jzyv38QkNlo++AfAnNW2PjBYFHl53MvAs
         BHvfmPtVciqdB4rvmccls8yMzXGctbrIM6DBCaSCljGK3PMTe7HmDV6D9GJXPZRhMVv+
         4SNuMHFjAKUEzdZUVU/dknMewM4CCXWDQHZ7rkovUcWbNWAebfDYrzQNLKl8SwWK1ROW
         f/9gd505HsonP3wUlKm9OoHTPr1WJItY0IaSWABwPtobzqdbxW68JtQOlE32bnkDfduU
         3TN2I1+Mlu8gpRJmOyoE4Yj2wCG+DZQLnl6m6QRK2aw3SGYQ8ZqLtxXFiO0BqTzAAhvM
         SfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430822; x=1775035622;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEHtnkDedFMhPuXZm50aAWepNktE4XNs6FAEIq0X4WA=;
        b=GiivoVSFUhPE2HlmVBoW4JI/2LnEcCPV3syXOeSH6B3dYlNgW6FEDzmZ+TRfyIvAuI
         EEIQcKgg+mh2B3fHHOlS3uLMFTqIoStgk795kMbpO1fOcTkTQRLN7feqHb3XzfivCjiG
         xwn68Da9xh66A63mdXYHESRsj/Pr9r64cII7HDsYWSF0QXUX/Hm4pnRu0qRoxkviHfpc
         xUQ48WskL4Pt3+onYpUDXwIbJT879QmkirMUXfQsvMHraTaZUguBnkUB/WeVDTy/KcpU
         v51tUZhNx2DCvABZ6ojBKe3De/acK91d+v8KAyJ3dyJ9XKkojrqYexI2DO48eBuueNEw
         T+WA==
X-Forwarded-Encrypted: i=1; AJvYcCWp9MhzzncaEFrOKnxU/JpGDodXJBLrO1EdUDkwYHuHyCN59BKnUaCVVNkAojuNDVDlCOSgG4aNHsp5jZZytA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjqyjb5tQKo51oWdZfWdXlkXqwhy8pMApMDiGaV+XN6/LuUIx
	8CUMLb3c207SUfQB/Wqdo373Urtx/j4DceJLGelSw42wZO74HGSLzF+OaM75mV2BH/vMnEGcKyv
	OGSowDmjeKObouOka6w==
X-Received: from wrxp3.prod.google.com ([2002:a05:6000:183:b0:439:bde4:bd47])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f12:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-487160564abmr39098945e9.16.1774430821806;
 Wed, 25 Mar 2026 02:27:01 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:26:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFqqw2kC/yXMMQ6DMAxA0asgz1hKE8HQq1QMJjhgKqUoDrQS4
 u6EMr7h/x2Uk7DCs9oh8SYqn1jwqCvwE8WRUYZisMa2xtkG36QUMa2aUb+YaVT0DYUQnOHWEZR wSRzk95++utu69jP7fJ3gOE76yllBdgAAAA==
X-Change-Id: 20260325-kasan-rust-sw-tags-c5afff30e63a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=658; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Gkp+txELiHIEhkzEMp2BVH5d9/FABWaIfVSHBigX4DM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpw6pdwhphutdR3ITrnsA1N2S4eeYWKkURVyY6r
 vbAyTxB+eeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacOqXQAKCRAEWL7uWMY5
 Rtr2D/4u7PHGacW65aBo1y8qAu21b5nekFu2tSbr1t8ywoFs1uxgj9FUcNkzOcfUtiKsNJtANvg
 QW2LLPq3Lrr+82jq+rEb8V16BUDoWZq43xgFijXQCEBtuS4R6D7g7jM5VNQfS2r2rlYhY4IyjYb
 CqCaPp1EFmvg6U2rZMnYkftb7604uzT1j8/lNXt2pwKW2ccK1tzCTQJl/xCCDUs71h1emciuHTZ
 c/5fQA8a7ceFyAk7YFIm1HyUUHutdM17Fh9bGtt+LfBNhKlb4BWl4pYk9uDa0FsMzjDJucLj7x+
 l9TWEt3HIijFkWyUOg19uH3HXLzA1E6CAiPFQaUD6biFMH52jpdgYtFpYZncIIyMck7jr8fxL6b
 SmGN2avkhXO/U9cP7gGH0nKqhSK7ngYda66V96dDwsZmjFAp4EJq78dy3/04zW0fzsnhMShTDed
 K9hdmJdLH9JvrZzrWyNNgSXTjhI8h+C38zpagR+s423b54dB3QcFndRCy0lB7vqQP3B1i9OUcv7
 Qt4RaWrmK7NIibwcvmYJw4yla1SK8yM9i9acPSBHvwvawzzVZNmrBa/7TcZM8LdDlXEVGoH5NcT
 Gt7ZRFlxlv9nU2IxDJ5KFY3HsmnXETpqIiD3qx30ZINPFMcw1FQh3a3oSIHf0P2Uewyes1/nZgs mPiBoMv506akpMg==
X-Mailer: b4 0.14.3
Message-ID: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
Subject: [PATCH 0/2] rust: add support for Software Tag-Based KASAN
From: Alice Ryhl <aliceryhl@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Since my kernel-hwaddress patch to rustc [1] is now landed, I'm sending
this series to enable support for it in the kernel.

[1]: https://github.com/rust-lang/rust/pull/153049

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: kasan: do not pass -Zsanitizer-recover
      rust: kasan: add support for Software Tag-Based KASAN

 init/Kconfig           | 2 +-
 scripts/Makefile.kasan | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260325-kasan-rust-sw-tags-c5afff30e63a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

