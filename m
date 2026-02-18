Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D4930F7F1
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771415627; cv=none; b=PUozn0kylEoMp/2ckz07tRfkwayK5UDTZK0IBus2BVESd4b4Lc8tgRBlktgD0PHGn38BbclWFvdcdXgEoecE017i0lMlnEDUIsSfumJVv98qv0Ti0dyWTNlDSgSxIagIOQywMClJkhrvQQi23Tu2fauaNtlD1HRyVJBZ97yDiuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771415627; c=relaxed/simple;
	bh=midTfKHBQR4+V9ov+ZGnHBfc/KST2dfDvfMiMRqYAuY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sypwRKvYZ/rLs0lO0WpEa9CJhKnorjGPXKuidRkZFovwQ1naOMJDDdYcfA7JDUs4DJ//o4h0U/UpkbnJ59LFM/QaCDNP2fJRHnDMb9vmYS7B+VOus6RZkTQZmw2ZSi9ZSYzwA1kHGu7CaLEVmdIESLkYOew3e1jMzn3dzBsHYyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XLEDPgHH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XLEDPgHH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso36977445e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 03:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771415623; x=1772020423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jabDmLqCWECXnNK4LiTet3HnR07/Mdte6Ju6ZynhZhU=;
        b=XLEDPgHHR4eZi/hsSkV9udE5avXFpwjiARuHKwAMYa0OzCJzWfeq8E/CImQhxqc1KH
         0acImqppaKJj0I2KCze91Ocos47KAw8gEjN4jKY9CgoqhHxflK7Ot2XlVdS33KgJnphG
         lp+jHwgkAgl/uxut1Lq4M6uQ25nydO3Pn5pusm88uwD0j6ZLbYbcPzLtRytthi7huot9
         qvPYhNcVFFux1GmUJtkgELMxzz1aNCLVzyjRNN/pOo4zpUAddLa30TY0DgXRjneJI2Jv
         nb27Enveag3EN+wbuTiESszPwqAKTGEdPzkxwv/2rkxN7LpP2wvRg3lD3IydmCdZZ06k
         g7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771415623; x=1772020423;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jabDmLqCWECXnNK4LiTet3HnR07/Mdte6Ju6ZynhZhU=;
        b=wA//mz0xtwp5NL9Fa0cLqRi/Wpc1G1DSMVdPjAJ/UuGHw6ZvgbvuEGoLtLDcn0B3Gt
         o1Dy4jONxV2UejOsR4LVk7ho1TLWqYui6DzurcDhsmtr2fQ0RhgTz8d8NCAIglCNGmKW
         lbi/atVnSa2fio3qXkZMu1nracLF1W6rcim/+GuNdlcNLhyq5GQ2fRgFBk2iBQVnxRXR
         Dy09gfQriPv7REOFdloXnb2TByP1D2YZDgzIbNd99+rulJALZW+bZXt2yaLY3VdOEJWo
         QPXSMcpQVArLJyzRpYf1cEdUXIvATIVOF9rR5gw98ALKnSfjnEELBLD75Q9dhoi4oLEI
         omSA==
X-Forwarded-Encrypted: i=1; AJvYcCVcWDJoPukg/BvVC3pnxNO6EyxV2eRxdDNi5McETTYYVX76u0xnGxzVdZwzMr1VPY8lDMolij82UGEYhPHyJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoECjpJcTUxRwUimASwPqr1iFoDrnvYfvtOqwt5olD+mMcyM5t
	vfqgqvvJu/0LbaXgUZL0T0ExH+wUeUD4SdxgG8iAdzKPevmRt+gaDg0qLaL9tXNkJZP1/C4snZ6
	ThFTvg/i6D3ebRm7XyQ==
X-Received: from wmkz14.prod.google.com ([2002:a7b:c7ce:0:b0:480:46d7:9c4e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b77:b0:483:6d4e:9811 with SMTP id 5b1f17b1804b1-48398ae6736mr34831615e9.31.1771415623348;
 Wed, 18 Feb 2026 03:53:43 -0800 (PST)
Date: Wed, 18 Feb 2026 11:53:25 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADaolWkC/32NQQrCMBBFr1Jm7UgzSqKuvId0kaTTdtA2kkhQS
 u5u7AFcvgf//RUSR+EEl2aFyFmShKUC7Rrwk11GRukrA7WkW1IGnSw9R8yzRT+xv6PTg7dH4vN Je6izZ+RB3lvy1lWeJL1C/GwPWf3sn1hW2KKy5A5mMM5ouo4hjA/e+zBDV0r5AqSRwEOxAAAA
X-Change-Id: 20260217-binder-vma-check-b6fca42e986c
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=midTfKHBQR4+V9ov+ZGnHBfc/KST2dfDvfMiMRqYAuY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBplag6e4SnfP5Lm6TFw/Rn7c9jU60pUWbZGgoRG
 eiJ3ogJMByJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZWoOgAKCRAEWL7uWMY5
 RgX1D/sFWg5zD0sy5I1A49njTIky+VabjigVV7dwODVE083PmcgpYC+86lQTWYCw1ykaZU1ThIk
 dwSruKbdJw1CGF0UrsBboCdupwT4qNJreAWqwk+/yYLRwRssqxokhI55Wl5gI+0NoxbnL0NMJVC
 BhKOwHD+9lCaLdqHhf0gIEW5PBbdsktewAAbejBGEYth19DdAl5goD8ACw/LzFuU62gkQPXif5/
 d2xpP3IHAJuMRAfzx6G77lPnZ718g+yW5WHHy80/rI5wRivDvCnua5ChxAORQPeruSxvuacEBVB
 +dQxy47+EE46hsaX+kihSkcJSA1wcAcJzNqsKnCv219waPh4bzxsGRmKwpG1jZQneWu1relVtyQ
 7nzzJY8DF1absFKxu55m4eu5FtByKoBPIoYk91GIS9CgK5LlRnDg5+Nd7MOteEBR6aLU6wkEJbS
 iU6meSuXAaf5Ei/EaPYG/xuMa/QzCBiFMrxpUJO5PRw3R62iFOq/tsRLbgu219aYet4Wwr1AUvk
 tf2lcu6DJQH5CHD797OAbrXMWRaE5w0manWX+ivKpL+fzdAB/kc+fZEhLuRIkrCmqdnqeNyDAtU
 dsUnKt2LDGqqAoMsAevJlgIqH+8DXwKxXRdeHAqNRz9A3h6u82aFNmHJZjxVTcZalbhczkLpdsf E5l0/YzkV8YDchA==
X-Mailer: b4 0.14.2
Message-ID: <20260218-binder-vma-check-v2-0-60f9d695a990@google.com>
Subject: [PATCH v2 0/2] Fix VMA confusion in Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This series contains two bugfixes for Rust Binder. I'd like to follow
them up with better solutions by changing the VMA api, but as an
immediate fix this should work.

See the first commit for an explanation of the actual bug.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Use imperative mood.
- Add some comments about why reuse of ShrinkablePageRange is not a
  problem.
- Use ptr::from_ref()
- Rustfmt
- Link to v1: https://lore.kernel.org/r/20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com

---
Alice Ryhl (2):
      rust_binder: check ownership before using vma
      rust_binder: avoid reading the written value in offsets array

 drivers/android/binder/page_range.rs | 83 +++++++++++++++++++++++++++---------
 drivers/android/binder/thread.rs     | 17 +++-----
 2 files changed, 69 insertions(+), 31 deletions(-)
---
base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
change-id: 20260217-binder-vma-check-b6fca42e986c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

