Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C872F12CA
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952954; cv=none; b=fjHrpp1FCEMLzJV5oe3TOcjnvOYJMGLHeKai85y502l9W7g8AombdlNrrcTRVAtrkderOzsrBhkiwJVgmdTgWyKpeUG6NZPBQ8nOeTqkxd6TRanUOa76C9uAOpjy43ldGexvgEedc5SFkgK30ipaKnUjEydp1XnqyMY9j1wbq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952954; c=relaxed/simple;
	bh=XhBk+fLp2W5DECzp9hS0MG7aAfAwiZePIRPabG3zfvQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FUdVdZy2dPHsVrMMEDvCrvA0/Q/htCbhsn0z7aDzNk4FDv1JZ1jjFG45S47ZHI/T2bR08hm7VYM3RPOn3cTMyr8ROXO/7Aa6mxDxWuQB3I7lVlzw9J8X3dp3JvMKmbntEBtlkiZip/SuLeIfyhp6ben/KQomdxOKoPDiV1CHpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1AWuBwr9; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1AWuBwr9"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4270a273b6eso2093438f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760952950; x=1761557750; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ecbXXUemuSWRJnCILxztx4T9Y94vvKKPFZCmK42EZU4=;
        b=1AWuBwr9bWBWN2KdYxxf9bPip8eO54XPe02DKZPLNm6Uu2fC4dJDkOmLHLmx1sOrxU
         gFGSWMMq30EaQVdoT0skNEtw5dW0OL3B67AX/ZNqzFDTY6ZA1q1/N5poKzNbxzrQriCB
         8E7deXS4CYG8hCowRnu0Xh4mvF3Y6eXwoM0cLVqrCnIskgkFqFDwOJYOCDlQPwBVc2/s
         6SYQI1NnXr2BfWycFgZZXpS74Rvonq7KmhbEMR1Zj0IxSt92y5xZUZVkIILP6upMhgAL
         gFeHliRH5I5fbklisFYYe9RIHUKBRgBKP0FhkmtPnbELmpO3M6sfbx1+29rfveWRVTVN
         4GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760952950; x=1761557750;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ecbXXUemuSWRJnCILxztx4T9Y94vvKKPFZCmK42EZU4=;
        b=u3gpfx7TJXPL/o0T+zdW++DP63X2XTkeqsz/1VGQqRogJ4dHDSNN9D7cyp+T9qJz4x
         DlkIaC4YoDwPegEZx9LdOs+Q5Ou5JBEFGszSZGBfTJG3mSxxAc15YAoPmeimypVUQK1z
         kZCo1QE5EDiZJxUnIPmUSJdHfazAiVKLdlzTtDEWZb8bM0zD1AMimdE2o+zu6y7y4lLA
         pGCJyWvMhfmdJ0oGTKLFOamZQOTsfy00tLTzbaMraH+rwmt/ixg5z9quZLKqB2PfxIXx
         OeK6K/uQvz8b6IeBalnUvhAh8OPlI6NcETWBXeN6V1P320Fr2ovTBRiTXJXlZpdLdE3q
         B9mw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6IGZyjXCQi6L94eDlA5syU95aRe5hbkZWrf/QyDXwTzIp1id0D4bxuI3jK1itYEBex9kL+zlgWWQNkIEfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvC8IN8AZ+0wJujM/5BbinFUtBmv0wwyGxY9hCmPjK2va91jnt
	MJCO/UfZofVjuzWsUnGoEpy0lBGvqiHspv8sqjYFnp1IzPmCVKsACuoimJM5p9RuiIXGPWRxkew
	UvdVjQaPk3CsOw/t7Yw==
X-Google-Smtp-Source: AGHT+IEtfKcr2bAXbhY6IBXnQhniMXdtpnsNRZuWCK/iqep4lByGpTbbKfjLmiObkoIKm2uxWetnzZkGUuTSDxI=
X-Received: from wmwl14.prod.google.com ([2002:a05:600d:82ee:b0:46e:2e2a:b707])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8d:b0:471:60c:1501 with SMTP id 5b1f17b1804b1-47117918c0cmr104204395e9.28.1760952950391;
 Mon, 20 Oct 2025 02:35:50 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:35:33 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGUC9mgC/3XMSw7CIBSF4a00d+w1vIzVkfswHVS4UGKFBgyxa
 di72LnD/yTn2yBT8pTh2m2QqPjsY2ghDh3oaQyO0JvWIJg4sQtTqOcnZgoG8xo0Sm3Hs1XENQl onyWR9Z/duw+tJ5/fMa07X/hv/ScVjhxVb5iQUjB69DcXo5vpqOMLhlrrF6sjiBOrAAAA
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XhBk+fLp2W5DECzp9hS0MG7aAfAwiZePIRPabG3zfvQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo9gJs7Q7itgelMJ1LzKLFYAoousvr6TcvFH7hQ
 XjvX4P/A7eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaPYCbAAKCRAEWL7uWMY5
 RkAoEACoMbT7N91tq6z9gw5Ha5yrZpV6rkSfFWZ/exIkoXzGDiz5RKf+RRI/iiwC2FvD5ZAy4mq
 SOaXWmfTBTXHUkdWBUOlYkytI9maWPYNDfdFM+g3jQ8Y5/CFeKJRonwwCWRrpy/TTNjO+sDCjja
 xOvhuxcIGWqX01KA1+TpsGrKPLtu/awy0ttYdUSfHBKbBz/jGGnHWVv9MEzUjQxB+Cs6qFZwfDM
 DNhJxlffjrIiI3dOCarwQkSjILbEK4mE8nA87uH6ExHRtUAazId7Lfva+v7+uGHpJo10AzQ7HmC
 ZTmRY1yoVbmsPaEcJj7CzG4IGsOrF7kSS7MOYGYkI0sCM2MxJaVMsY+JOqAnhcfNpRkGX2ic9Uf
 p7KHTC+Ps0hlwNRbkyjL2uxnd/n4F+7ZR1LKnPxyVpphdzVV+2C/7tOyqBn7isNEUB/hkBYtfzd
 Pyzzzn3xbIJaClZfI6YvG2iQflzXw9VZGLFYdn4a9Gx1GDrDRZ271Q9/sFOw2RBZEZ8CRwQKjNT
 fiEXQsl71RZmGRQePGzg6aGKgcC90ZXfspJzyc5cpitifksiKN81asWWr0hROILxRdUJzoLx+js
 2yD1Vx3GGHOvk7ATDcf7TbuqCfG4NIXEn9DJ7g0x4DFwSOc6KaZamGTkVjUgRCR9EOPY6jOPKWO myLnflY/rcRpMPA==
X-Mailer: b4 0.14.2
Message-ID: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
Subject: [PATCH v2 0/2] Implement Send and Sync for clk
From: Alice Ryhl <aliceryhl@google.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

I added a patch to remove the Send/Sync impl for the Tyr driver as well.
I think it's fine for the Tyr patch to land through whichever tree takes
the clk patch, as there should be no non-trivial merge conflicts. Or we
can also take the clk patch through drm-rust where tyr patches normally
go if preferred by clk maintainers.

Regarding Daniel's patch [1], I suggest that Daniel sends his type-state
change rebased on top of this series (without including the patches in
this series in his).

[1]: https://lore.kernel.org/rust-for-linux/20250910-clk-type-state-v2-2-1b97c11bb631@collabora.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rebase on v6.18-rc1.
- Add patch to tyr driver.
- Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com

---
Alice Ryhl (2):
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData

 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 rust/kernel/clk.rs            |  7 +++++++
 2 files changed, 7 insertions(+), 12 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250904-clk-send-sync-3cfa7f4e1ce2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

