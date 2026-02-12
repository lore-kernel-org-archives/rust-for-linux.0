Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120F32C924
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 22:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770934338; cv=none; b=P6KvNbL0D+5f0aLiCr6M1gHOJ0uNpYfQNwSnRzgiY7ooSPO/l+yAJypk4JyA8z/b3PEgq1X1G44ci9eXlKcSM/SaLjVo8qCGuAqX6ZtCpxTwpif2UZ+wY/aNj/3UylWo61WeJN0fHgL99LrtcxLY4rfBS/54P0BJ/gR8/1vU7+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770934338; c=relaxed/simple;
	bh=GF6lofjVwO8F2sO2S/yR98Ft0GCJ/p8OaGLlVtdB1pY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Eq/UbYshrgOzKwgiRPM9MGCag6rWGj4uHLWwF12xdEkAXYOGepPfqSH+h3Y3VI0l3FoZhil73OGWvBJmV5SXKl7/IWu+x6u10H60kKX/IlZ/Aza7CjMC+gpO37OFQS4vpAkNgpXv8FyPJTYoOOTXe5HcZReRNdnHX0cGJSINNlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LodzLqmd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LodzLqmd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so10435e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 14:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770934336; x=1771539136; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5/73lXmUAGDF9goRsJB5ka+EvsW4ckCoSu6Noq3UtA=;
        b=LodzLqmdJisZk7R1Xf7eOpabvMr5jWhqhvZNbcKgNhD1PtRU3vHVAsIKFxmFFNCXAm
         iSTEu0xCOr7yzoDuyWr724ZwG0WxmOC8K3ETXR7p2TvIUOkCvf9MnAt4jTGb8Qd4NBEi
         zuy+WPOUpkgSZStJ7L0Ed6X84edfc/4z5bXKc83yVBquJ7skEhayafh/QCiHFiWN2jkK
         rE8Hj67+j4aEBouQZEBbnQfJhrp9OJ+FbLzNfU/xBKQwFUQKpAsHSD6GLodt4DZawCiT
         yUmDfZiBj1JrXzFiQCPz9zvgw3y4FhmJPnjOtnp3rtrrp1I72aBdSrr3vlwVzNgl+sTu
         h2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770934336; x=1771539136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5/73lXmUAGDF9goRsJB5ka+EvsW4ckCoSu6Noq3UtA=;
        b=k+le+kwANySMY60+Il26vnX0w20UBgjnVJX644V24g4e+0b9UqMsRwclQJgJwrPeGJ
         QjMhHg46W8dFrQatWxs0x/Vmu6/qV9AvHhXkyxpzcenM7TBKPXoEdV7E2KX8THAbdiYy
         mOQA//sMXilIcfzl4SRMvXYiSMQYaPQb8G6Su7Q8ik0FW2zZUvM6Vh6n7wA6wXIPSe4S
         sYdiksXC5BPuGTMWhzu9pFOrBaOOYXPa+HzivIou6DlLepA9Ebw3hSkmS5ZYvrtR4+2O
         IvdzVIV+6vyaQMQBA0rSvinGqgDg9zLQWirFGmLM1YptJumyklo7e5yiTe62HInugqHE
         4iqA==
X-Forwarded-Encrypted: i=1; AJvYcCWCiB4oRzAOaIKPPLhnX62lsE2XSt8xcPDzmJfUMh1hj38UixyBmvyTCcmbJ5SaUv8P4BFYds0tkjezev1c5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yztce8w8v+u44doO6kEY9vq5q8pFWkuxXauXpUTexudpPoGDBHy
	0M8otRT6kxyhwhuqK3tHcqDEKJyiIJIpQReYpkvH5cDJ/HeVsF5sFBeW8o3EE+pg3w==
X-Gm-Gg: AZuq6aIb6En0snl+8HeMdPRHS6T30q67YLIq8kiIlF15tIeiyJCGfpQXGGa2RhfxnYR
	aFiImYK4XFsr/NTqoKy3B9Uqg3FAqu/avKN0XiLvLQvA+236AYniKx7B9d9Y00V/9q6+sS5tZP5
	udz+6SVD7VL/9/Gn5k/UEMiHgNRR8C9Nq3YzNjpx7XkM9oJGISp/FN3N4Q65XSoVtiDFqt/JQch
	zW49huNJo9qlbgWvu0TpJbO1m3nE1fiR6joxStVRrHRFXAvLy0F0lgFybZZz1TDuCCvaxZYoJx+
	ks5t01cSqj+awozG9Tl6eCxMSnQ9jND3X4kVvzFNa2go6vEuL6rXrDOQ+yxG1S970wqZ8ZlQ12O
	32fvdsZiGIHTXmHIKlL/NNr2Hk2J3uLyUh4RdPG4eYXDOI3namGe3JngAA97q24xqTBXLXya64n
	OgcnsyOEuhFWPVF78+FsN7YlnmckQdjUnzkLSmseW8a6TcikBdSZjO7l1t+477Tw==
X-Received: by 2002:a7b:cc97:0:b0:477:2f6f:44db with SMTP id 5b1f17b1804b1-48371ccb619mr38345e9.5.1770934335328;
        Thu, 12 Feb 2026 14:12:15 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:c531:3fec:ad3b:1a8d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796a74704sm806687f8f.16.2026.02.12.14.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 14:12:13 -0800 (PST)
From: Jann Horn <jannh@google.com>
Subject: [PATCH v2 0/2] rust: task: clean up safety issues wrt de_thread()
Date: Thu, 12 Feb 2026 23:12:05 +0100
Message-Id: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADVQjmkC/3XM0QrCIBTG8VcZ5zpDD25kV71HjHDzTIWaoSbF8
 N2z3Xf5/+D7bZAoekpw7jaIVHzyYW2Bhw5mp1dLzJvWgBwHjgJZfKXMDN2yi6QN49oo0UtNZuL
 QTs9Ii3/v4HVs7XzKIX52v4jf+pcqggmm5GnpJ6VwQHmxIdg7HefwgLHW+gVBzJFdrQAAAA==
X-Change-ID: 20260212-rust-de_thread-0ad9154aedb0
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: Wedson Almeida Filho <walmeida@microsoft.com>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770934330; l=883;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=GF6lofjVwO8F2sO2S/yR98Ft0GCJ/p8OaGLlVtdB1pY=;
 b=g98iJ8I5OHvAqt+o8QHwhnFyhQ42KmzZmqXtWLF5UkUld7x1jW7oOGb0cmGrU1uPt8p+KNEnt
 Z61Pw/oNGnxB4RFWEfom/iYH1WiUirZu5oFt5/YYT8scpWAoVNXYNg/
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Task::pid() and Task::group_leader() wrongly assume that task::pid and
task::group_leader remain constant until the task refcount drops to zero,
but those members can actually change due to concurrent de_thread().
Fix those assumptions.

Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- split into two patches (Boqun)
- use relaxed atomic load instead of volatile load (Boqun)
- Link to v1: https://lore.kernel.org/r/20260212-rust-de_thread-v1-1-948f5b992624@google.com

---
Jann Horn (2):
      rust: task: limit group_leader() to current
      rust: task: use atomic read for pid()

 rust/kernel/task.rs | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)
---
base-commit: 192c0159402e6bfbe13de6f8379546943297783d
change-id: 20260212-rust-de_thread-0ad9154aedb0

--  
Jann Horn <jannh@google.com>

