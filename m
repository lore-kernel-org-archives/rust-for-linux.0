Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E62D4805
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771018666; cv=none; b=K1Z7qSokfxVwOiQrrARduhlFwrnbYFy2U/VujubL63qzPHKmBIm+SWWu4ulbOpPx7ee7e/5MlRh9yV4KfgUkfLNaL68Qws4LpMBF9PKEi/zAjjliBGJpMmE/yajijb1I8SldGEJA/2BwsGCmCpvHALj1y2VQ5A/HEuiVmzPHQhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771018666; c=relaxed/simple;
	bh=9BFhsad+6I5Fo4FtVjJ5rj1jDA4HeOHuUh6rgkgdGlc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rOhCR2irhYfF4EBtkM/4jGqoDx6ArwWIZPhxaijqAMjcNn/GnTCJ0PPnX9+gBcAk/DMGyTkwqBHzCECkvira/9CqB7zZOq85vHTOhi+BqMawvhZzM6OtAG0k1uB4Jee8e9RBVZiu7oZkTv/qfXhMo/TKG1XrIfPkbOuN95f8b+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eDeeLui4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eDeeLui4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so3425e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 13:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771018659; x=1771623459; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OrjAZYkrdyzFWax6YSt6Xv510IEuzhTyBZuGhQyKqWU=;
        b=eDeeLui4oOVILdRwpCv7Ut1qTJV6k79l9DhnPoZPKlJIRVEOiamXnuXGicEBx6IUlD
         pl4XV6tcuR5DN42DnbX/E08cBidHep9MuVj1MGqb97Rik9Zc05A1KLsJpDM3EXr2JDuK
         plHqm+Xpo1a4zZqJPSugUYx84p+Wl3BJ1+DUZYbiOfk0nKj1FVc/F21iihu0WR6Dfx9V
         AmOApy0ui8FOripQNVVlB9nvVvv4rAHlL+R+6M/cfvrjEIei8iSfH8qsSbJApdm7m8Hu
         RzcbcfonQkPVXLGW+AKArVCmOSqW3KqorVyJ1fgnE0kYSppc8/C0KREoNk0QsoFMAYnu
         qbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771018659; x=1771623459;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrjAZYkrdyzFWax6YSt6Xv510IEuzhTyBZuGhQyKqWU=;
        b=mraA6VXuljofE3NEsKY9dcty3gmgURJkqjqaxWlJWPWDqjXNKLApA4pwDctY42g+Kc
         1Nmj+T79Fz1rRE93ZE+JzwLwq40qy0NFgn9egZa0dcBx42eHi3no8bmYN/6wnDGZlhNX
         TibLwF/EhaMk7wH+dC05ruQFpuanlzkz7m+UcyP0SgwKBiiSEqiBI7EQpE8y4uWIEUET
         yFUK5h0nP9AwUaj8iQxtU+ae3F3JjXIthecL385Zo4GppAyRaiz/x3KD8en554fgBTmV
         eFTGaWePBrJm+asIlGlhti4BtlsL27xGh16Y9DGvWjOVJhkOZDyzWznREqRBPUxkSDjg
         4J1A==
X-Forwarded-Encrypted: i=1; AJvYcCW31N7njXcGkiZ3dENFtUQIaAIHAZBZeR/mRQDckqJhRm83wkesXsPd6b1inqaA56Al/MQuXyp/6yAPNL9hZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKJhmpax84/YXxiOnKdmpXVyz1HI0/xZWmPuABmnsLH261VlK
	Ukji9DU4VitzRICRvfeQV4PiXW7603e/8OC+ONbgi/Shmj8tHuTnWdIGzuAkQV2spA==
X-Gm-Gg: AZuq6aL0BIjl+Vya0jncm2usOH461bq1iL++HfKnvg8sRi9ZzGIEEjRaY2MEWWCxISN
	+HVRtecLrXeKqwzHPDnkffBAnbIMx4cXsd89H//FtsiNGH6zKZPSpu7dvEccNB9OnPRL+Oi3r/e
	hgCdAn+DOtygWO/FLTKKmRoL7+q8iwhsUrh79V4vb/3E2MMkKrK5bKQXkcIV8Wj6rMFulkEgIJo
	5t2VaWO0uHWTNVrbAOrl2Wcs3LII56NgafB/rr7dEkn1T2Hz8qt2UAqWGrevlMOHpBp+Tt4mYkr
	uYWRzYV0uYwwWH3zOiFG7V/2qXeeUa4fVZ/iViHUajEDSL1kyjhcPPo5Pq2HYfphTCfq+TUA+kG
	SQnjDjxRU3SPlFoWBfu7XqQqv3DnHT5KrpFI0dozjzNN/myCU4iIa31t6DTjderL8L4hg3VdmEa
	85b0oZK/ks2jxNLddkef4gZyvOXd6yf16vwLy7xla/p4lIN999E3nJ5tCrNhwUKQ==
X-Received: by 2002:a05:600c:8889:20b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-4837a1aa437mr151345e9.2.1771018658715;
        Fri, 13 Feb 2026 13:37:38 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:989e:b55e:7170:736e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4836aa0847asm171980925e9.3.2026.02.13.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 13:37:38 -0800 (PST)
From: Jann Horn <jannh@google.com>
Subject: [PATCH 0/2] binder+rust_binder: use current_euid() for transaction
 sender identity
Date: Fri, 13 Feb 2026 22:37:29 +0100
Message-Id: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmZj2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nj3aTMvJTUIt3SzBTdRCOT1JRUU6BMooUSUENBUWpaZgXYsOjY2lo
 A5SNDOVwAAAA=
X-Change-ID: 20260213-binder-uid-a24ede5026a8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 rust-for-linux@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771018654; l=1192;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=9BFhsad+6I5Fo4FtVjJ5rj1jDA4HeOHuUh6rgkgdGlc=;
 b=DqZzMVtEbHu7cF32XepuabxqofVM1ySmlWlJKQov0K+/NHOF6i3qGw4Zp8IH6yEVQqygpMDIq
 UeGH2pXKulmC0xhYikH1yLzErkgpPeqi/qdmO9AR/Q7thTzcKqhU8WQ
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Based on the discussion on
<https://lore.kernel.org/all/20260212-rust-uid-v1-1-deff4214c766@google.com/>,
here's a proposed change to binder to stop looking at objective EUIDs.

This removes the last remaining users of Task::euid() (in Rust), and the
only remaining caller to task_euid() is the now-unused Rust wrapper.

(Sidenote: It might be worth considering whether it really makes sense
to have functions like current_euid(), task_euid(), and so on in Rust -
it might be less messy to just expose current_cred() and (if necessary)
get_task_cred(), and then use the `Credential` abstraction around
`struct cred` to access the various UID/GID/... fields.)

(build-tested only.)

Signed-off-by: Jann Horn <jannh@google.com>
---
Jann Horn (2):
      binder: use current_euid() for transaction sender identity
      rust_binder: use current_euid() for transaction sender identity

 drivers/android/binder.c              | 2 +-
 drivers/android/binder/transaction.rs | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 3c4ae63073d84abee5d81ce46d86a94e9dae9c89
change-id: 20260213-binder-uid-a24ede5026a8

--  
Jann Horn <jannh@google.com>

