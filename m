Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09104254849
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695787; cv=none; b=anDIp2z25qPGBCDb/7QSvUdL19+CMPdiQwNPyXRxqcSrTquzLjSLgxP2BPMLOMSEe+bGFC+HRxS37cC0WQG2cRNv+KLXdNIBYAchEdzlPf6pF6TyQuiuD6335HWrwihDFxeqmyFckKVzE4/xHMQSZJ5pziyuJM8wWtqQaj6+0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695787; c=relaxed/simple;
	bh=k87RURquiOri9/0sbTJXsUNDC5vJKdjhxEEbKdLvVmE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DyP72b1buSZaUFEoTpvj1qJdB6wnwhVlqMsAYRngncQ4hZSUROwPwOj1292AdHvMciqoBRXcEv6z5GVNEFVKMh4MlUJIHyjs4j1SnWzNnNqkpuhSGYiXHvuReTbcQ/qMFKZlKIhSay/iUSSIHNtuUtBDh5GesYUuKAm5FXUTvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nTKQj/9c; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nTKQj/9c"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4561dfd07bcso21292925e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753695784; x=1754300584; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H10wQEWO6xBRJKDh5f66SjYHQXXnsmfhqtVgH0o8fj4=;
        b=nTKQj/9cakBRWVHq+yyH9vbEdWuU2qiUJxmiqgCI9r03bUFl1XeaxSFKiBJIfHYlTg
         xzby/EymFIUI6XUb82KqpGWUeid3ZqJK6rJ/jHh+brikJe6k/X2DH2lfNRDey7nEdT7H
         EWSWNUDoaJPwiBzFw6rWg00r8thUEqRXgA0bLWrVw97ANuzcOTPMIxsCkA/Z4dqqc9ox
         2xJPsrjBYbiV8j9qclIOfnSrziY1A9W/zbdyaUsD0QXnqKvz2lQYPkzEvjZOALx7Q35T
         al8TsoWM+RXJ4Ir5denU0Iezp+YiQMuyPrctttXJvxCyzLTkzYBoLTtCmaVwJk0ldyHY
         tqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695784; x=1754300584;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H10wQEWO6xBRJKDh5f66SjYHQXXnsmfhqtVgH0o8fj4=;
        b=i71IXQVjwgyj/AHduekozfCCq+CK6vM/RyF/S81KhvUyWP5ElCY4AnmZzbBYFFHRsN
         6Zfp4B+9bNMqlE4PG6iWIeehfh3718LaLrARhbnDeZY3SVaL8hDbPjRhDe9SFn2SrV+m
         jWJ9+l/g2ESqi13WaeXRtqK2iCm4p9xzlf5buJBbysnV5xdDdPpexqLphwuChcCq9+3V
         bvQRc8NISjiYXVjYYBP9wiNUsBzBD8O99RpOHzCEcZzukAhT68cTSgrnJFRYWsXfDZg2
         Oy+dMm7efjuJmsRMc6C/Juor449z9G2Apw0FE/U2T07BdFkwywlwuW/Hb1o9iYavxKfr
         6Q2w==
X-Forwarded-Encrypted: i=1; AJvYcCVV/V2N+Rd9YjmsRjXvoCNWHhMzewlDIzAH0lLlSbqYIfMWcAlt3AxMrCt25y3mmFOxdEOUWWMKSBHX6RGRmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywRXg8NQe7pbEphb3Tlhavs+pdVMjFwUEfBX66/ammF10pOael
	ZiKWFFMd5FLAIVcOwAPUU6OZXsJx7uZiTsVJIs77KqZOeBG8XC44j4fRGH7Ais7QBY29YdUQ0z7
	ok9fZ0e9l/tR3NTxwPQ==
X-Google-Smtp-Source: AGHT+IENIbQcSUfAOPkIUzvekWDVGRNGR1idBrnUb0vjJtx2emNHAhliXi6NdvGM9BHteNk9vtw9tj3PLJXYZ7g=
X-Received: from wmbeq10.prod.google.com ([2002:a05:600c:848a:b0:456:257a:e323])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8212:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-4587c2f0048mr68402695e9.0.1753695784420;
 Mon, 28 Jul 2025 02:43:04 -0700 (PDT)
Date: Mon, 28 Jul 2025 09:42:54 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB5Gh2gC/4WNQQ6CMBBFr0Jm7ZjSWiWuvIdhMa3T0oCUtEokh
 LtbuYC7/37y318hcwqc4VqtkHgOOcSxgDxUYDsaPWN4FAYppBYXqXCItkc7UM7Y81IS0/iekJQ
 hp5WppSIo4ymxC59dfG8LdyG/Ylr2n7n+tX+Vc40CG+1Ii7NpLJ1uPkY/8NHGJ7Tbtn0BXzX9L b0AAAA=
X-Change-Id: 20250723-lock-class-key-cleanup-a3baf53b123a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=k87RURquiOri9/0sbTJXsUNDC5vJKdjhxEEbKdLvVmE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoh0Yhb3xz5bmrU+TLpV4ylhTnBvtHgElx0MPow
 XVLJtTnszuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaIdGIQAKCRAEWL7uWMY5
 RsnGEACzrAssBrmRlVYL/hWJL+GJ9k7HJCtSgH0kM1hwT5tzF0TbahvnTROcc5wwgf0BE705uMt
 1Pok6yw4ABJHbPLVccQcaf6MOFdpuzpFGTg0Xx5wmE6VVkbgI4Fa3KLG2WrAnhiayhsReqddQV7
 4yXwjGP7C4MaHwO6W4Jt1a0bUR8XXJCMSshE0LscACf3A9b4vQ5RSFgEw1t6ApV3YD6n95ZMb6p
 CrsAL0wRsOiqqgWbDAJXM1oLx9TL2Fx9ZkwbSKiLf35pisIPHAdXjVQYMf+MW7xXlqx4Aibe628
 Qi5OlAvp45/OVPX53a7EQMwBdyMlxsmAnanLKZXOyEK4qZ488PLsOwnes9eZoDxP9UlhzIRJcCH
 W2qAMEw1sFlCeLJmjf1GOgMZG1fKSI0lmVgkKPHsRGAnXQdWOmFsVct5QGPkYj8drWeH0XMNapH
 gubyJ5jpE4zi4C7EAuPadApdW72jOkbaa96m8aXuU7kEgSECHAGHrmdWta0/IgH/80hO05k5rTR
 MFtgRomY2ATZyoGKV6NSgvtdxtf/X+0svabYit1Wq3fAvd5pIlS1/T+Jo13VJpbquCzQvgLZJLz
 05Mnyn1bq0PEh1U957xJDB1isSytKQ0KP5J3vVeRekpqtBK/IwDqhOtokni0dm7Bl6LZQB2657H okSWXdpzGa+0/2g==
X-Mailer: b4 0.14.2
Message-ID: <20250728-lock-class-key-cleanup-v2-0-ad02b80c69e1@google.com>
Subject: [PATCH v2 0/2] Clean up Rust LockClassKey
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series applies the suggestion from Benno [1] and various other
improvements I found when looking over the LockClassKey implementation.

Based on rust-next.

[1]: https://lore.kernel.org/all/DBIJLR7XNI6U.21PMPODHE83DZ@kernel.org/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Change safety comment to require a static object. Adjust commit
  message accordingly.
- Add Reviewed-by.
- Link to v1: https://lore.kernel.org/r/20250723-lock-class-key-cleanup-v1-0-85fa506b8ca4@google.com

---
Alice Ryhl (2):
      rust: sync: refactor static_lock_class!() macro
      rust: sync: clean up LockClassKey and its docs

 rust/kernel/sync.rs | 78 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 20 deletions(-)
---
base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
change-id: 20250723-lock-class-key-cleanup-a3baf53b123a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

