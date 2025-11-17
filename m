Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4A45C0B
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763339124; cv=none; b=bRMNaIBO549PmMnajkIUromNA4G1fXybk/Qej0/AiQ4fkMnWHeaY5HihJ2Il8uRVSI4he6dmbsZkGbfE9ZZwJs8IDbxK1NzgeMmVJJHrb2WVqbl6QbjSRsKMLuVY7z2m8asO5h1hEbOmDliz+Khwb9hE7tylgNJc/iiBzofiRYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763339124; c=relaxed/simple;
	bh=orng9jQPLrMq9sfd5TskrBcYq4s5aIOcxvDLDZAi00Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVt11J7omA5SktDXI3qlVjofBl3eZmvVKu5MeILilmuH8BeBgQr0sF65DUXV4jU+GSLzNURs3uFo18fBBmmZPpDFjjw866rBaj/e6b/Uai7w3Q7GGoGqiJmGrSiRWMpZZHQFgESMN5I4TZl7DqZVS399tk/yD821y1hsgc0z+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll5K4eAo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll5K4eAo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297e264528aso36675325ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763339122; x=1763943922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+94nB7cv81dhcYdBboJrA4bvch8P80O7f+9omgPAgak=;
        b=Ll5K4eAo23F4/liTWWmQJbImptFEPzHQPcpJ16Trf86vgorfzyjXMDKVbdUdnOY5b4
         6S5pnbtOlziJdC+k9ANIwVicBRxdNqxUZbvt26M4z7sbQgxGc9UGfE7Loec+0wQpx9Dj
         QlfsXQZ+NAfjg+Oo3MSCE5Za306X54RpdakwCE+9F7FTbRdSuTjRrZHdmK/JKbVGAn7D
         lhBIRzrk+CLGEZGDSeeKRBinS6nVpXlZnutePc7xHf8xwFKid18RIePNC8cMQ25v2sjh
         kNVf/Xz3xZR9A6Ad9mn6imybN2YfB8yJ0rT9nuUFy4eY0g1ey5n+9e8ccGlX/43PZbC4
         4SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763339122; x=1763943922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+94nB7cv81dhcYdBboJrA4bvch8P80O7f+9omgPAgak=;
        b=am3UojiihuA9NIKPQZTz/QdasU6aT8Iq6Hi6xHU/M8obSR9MPxOFaGasrJw8qA7H9w
         6Kc9S2g2ayIueS33oOUR/V7XPLZPC+JevoydLZBTxUzHQYn/I3626LaVnCaK2H7p/oFt
         MNZg7WupP13o9qThvyGdWgMEcZxOr/Yyfo7FVoMWIncFG6/oGLrTFpvT2yV8RzVntOfQ
         XLTT2uH/ymJ4Lt24kaPT6tfc1Qi2QumoI9UxZXY7he0fqjspruj7mxStJWHcDyECmgtJ
         DahuldxWCdQ62+z4lihU7NfbXYNasxTo3LSHvMrDHATC5XGjutiQfqDZe5UfoH92J4lu
         exOg==
X-Forwarded-Encrypted: i=1; AJvYcCUbksP/TpL3kRv/dxo3c4mC+fdl8F1djADJw10+05fQWJ0FCNAq18AWRLAHWZb9UFpguM0/SzhmvUe35NKs8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhx3x5fNBO4au8vVndaaOfHLGQVfxPYPQFqAGm+UGjsyiXYg7
	Ano7Nf8d49zyx/GRSl+jz0OjDPE592uoc80HbhbfMvQJ+fCfGxn4JllL
X-Gm-Gg: ASbGncu8wDsoCYdYzLW4gwgpTes6syDfgpha8fYUKFx2KA9Z1J3rNhCSYVegrIpprd1
	njv3/McNsfmhoYUvc/sunzcwbrvlPdc0BZmEjEi6SoCjvcK1Ja7XmFFTGw5Fb6cLc+DPFKDAQGn
	+bBqBX81nQPitZsgux3I9tthwVj4U55b5ogUeKb1B0dwxOan1kR+2PRATbXz281DCkDO4Q/CxrI
	y6OZKFCn0ZlnoHo+Vlu6eTJM/hfQFGz2P73bw2IGaR0xZJKV0EbIZxW424XThoQo9nfpynGOW50
	AGT4gwOJ/S3MfcjbRnMJNjUGLsGZGzK2PjVrpABO8XIgVCdvTEsBI83cpWyK87xOJgyo+nHt2eY
	YWP+KmsJgHtN1Djfw+jxwOooCRNyJut1U4gVp8tRwB2sBR5OK+RVXIpr3RhwUj/kn3Rcr4sOuaM
	Q1nPoYegt8FYluzy/khoRqq/UODwZ4CZ0mK7Yu3IDBf/QXpXYQ1zdB1TNnEz4=
X-Google-Smtp-Source: AGHT+IEtllDdMETdUQWdW4V0o5++TTtYEyfqqr1o3Sl8csnPifI1biQ/jiVVCMGyu9oU3GBkaXd8wg==
X-Received: by 2002:a17:903:1b47:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2986a7330e8mr122181095ad.29.1763339122398;
        Sun, 16 Nov 2025 16:25:22 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c249908sm118263105ad.45.2025.11.16.16.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:25:21 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	ojeda@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	boqun.feng@gmail.com
Cc: bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v3 0/2] Add support for print exactly once
Date: Mon, 17 Nov 2025 09:24:50 +0900
Message-ID: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the Rust equivalent of the C's DO_ONCE_LITE and pr_*_once
macros.

A proposal for this feature was made in the past [1], but it didn't
reach consensus on the implementation and wasn't merged.

Unlike the previous proposal, this implements the C's DO_ONCE_LITE
mechanism using a single atomic variable. While it would be possible
to implement the feature entirely as a Rust macro, the functionality
that can be implemented as regular functions has been extracted and
implemented as the OnceLite struct for better code readability.

To make it clear that this feature is intended solely for
print-related functionality (just like in C), the implementation is
placed in print.rs. If an equivalent of std::sync::Once is needed in
the future, it should be based on SetOnce rather than OnceLite. Unlike
std::sync::Once and SetOnce, OnceLite only manages two states:
incomplete and complete.

The do_once_lite macro places the OnceLite object in the .data..once
section, which may be zeroed by memset at any time. While this means
tear reads might happen, OnceLite only manages two states (zero and
non-zero), so no actual problem occurs in practice.

OnceLite currently uses Atomic<i32>, but may be changed to use
Atomic<i8> [2] when it becomes available.

[1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/
[2] https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/

v3:
- add relaxed load before expensive xchg
- move OnceLite to print.rs
v2: https://lore.kernel.org/rust-for-linux/20251112131619.3585510-1-fujita.tomonori@gmail.com/
- improve do_once_lite micro syntax
- move once_lite.rs to kernel/sync/
- add comments (including ORDERING)
- fix rustdoc errors
- use vertical layout for imports
v1: https://lore.kernel.org/rust-for-linux/20251105054731.3194118-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (2):
  rust: Add support for calling a function exactly once
  rust: Add pr_*_once macros

 rust/kernel/print.rs | 153 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)


base-commit: 3b83f5d5e78ac5cddd811a5e431af73959864390
-- 
2.43.0

