Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036FE3932E9
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307397; cv=none; b=P0Wr9FQ+u4UKe/CxzKvys04nf/nXoMxuozLc9giZiBB9RlnZsEZC575BcDVMzdaAwy47NbQe3XKcEkLCFHFbLnFT1m3UqVp3AbipiuGRkRfXbNvLnhUDr8CFnz1x3eGlRT9eeST8ndXc1Ttg6O4Q7FYq0KaQsRVsnSjXNTA47ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307397; c=relaxed/simple;
	bh=pz+QK4kxfSdwEbArT7hXzuxcGTfKgY7syMJ6RBjmujs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z6GTMtihfo3QDbpbqsyUK1JBGiCNUV9gRCyAITmegjuFmv7Vh91ouiHFch8dQK/aG9tK7MxQSVNBxHb6TcDyGpLJqezjM2WZ1PVxFO/9ZqJM+3Bc9SvQ24fuAQk2niz0+tUXUqIO8KM2uL6oWJMdx+I/AgMRybtLMn599gz4jI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NIje6bnK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NIje6bnK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4852ccff333so5976265e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 02:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773307394; x=1773912194; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z5l0POW7ods92+Es4vxjYOIQBNcIz63tv3MO7mCRKzc=;
        b=NIje6bnKVko/Q5pbVGbY/b7AwIUdgEho7s1Tqy7GvGBr9xR8GC/Y5DjUQoLp8Qyavw
         +EJBBfOYPkTZrFy144vy+TPjwcNkb+Xjr6U23Tk2huhAXchFY+YyoiK8vVkJPOVGKhMO
         NsmlCfm37QocLFro3UKuNSCZIvuSFzevmHS47y/132hxHWU8ZhPs7+shXBpg1egtLrd/
         fMPBjhqL0zvHaGSv+suzNdkJZ/Nnh1UJrP7jvyhjf5430zz8P3QIaq02V3yYeOPIEDYK
         WUYDC/ZfqMyRPtFqP5gobTjq8ZEzt73Bcp0Xt8MS2OX4E8UvKrP57qHUnIyri/UiMl2o
         WOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773307394; x=1773912194;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5l0POW7ods92+Es4vxjYOIQBNcIz63tv3MO7mCRKzc=;
        b=rLA6xDtBeiGsaf4PA63WygwQIpLz8yhd9CtLwQIfFFNXLckI/8JGlShk41yvth8RY7
         vWgRnOHj3nvDxjROtdYwcvNSgcb/4EbC8wW54pGy/roWIOkA/xfFSslwy8LfZjzYXg/R
         bp7T9ofiEiDZNnZAN4aivAgjbHOtpBt7UpZgSdY1fi5goZmelDWbjmSGo+c3WlMQDJw7
         RpYARTwdKl594nM3KEOAQF4XwD93Gx5z2YI+AIO4T5y5ACnOmr10HJ3Ev6xFp5pFAVN+
         uChUDhSKon85o/Vf48gCjZfrLYRwFk6eRJx9sPwIKrvNw0QxcDO36/61UMeIVWjdf3dX
         Jiwg==
X-Forwarded-Encrypted: i=1; AJvYcCV7jB93nFzBsi78Nil+xD51S4OHtO7sKR2QT3qSV2kjYx+gnVYlAZ0BkpB2vcx0u3dRr74R5jfDbKAzkoz09g==@vger.kernel.org
X-Gm-Message-State: AOJu0YycVTbYfStnzk00Z8h1Wkb6UzkB3VE+u14aOuPti+pJ+ChFcp9w
	O1fq6uAdZpocviw+18ggpV9mtMwTcTnBzEblrvWkRV324hGFJzYUSxweqo5clihlivFgoQFBbGx
	XoVLSoCg82Yw5ewhauw==
X-Received: from wmee13.prod.google.com ([2002:a05:600c:218d:b0:47e:e922:b080])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4710:b0:485:3471:cffb with SMTP id 5b1f17b1804b1-4854b0bfdf0mr97949495e9.15.1773307393959;
 Thu, 12 Mar 2026 02:23:13 -0700 (PDT)
Date: Thu, 12 Mar 2026 09:23:01 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPWFsmkC/33QywrCMBAF0F+RrI1k8jDVlf8hLtp00ga1selDR
 frvpr5ALC7vwJzhzo00GBw2ZD27kYC9a5yvYpDzGTFlWhVIXR4z4YwrJgGoCZi2SM8+7OsOO6Q
 5UwJUYnQqMxLXTgGtuzzI7S7m0jWtD9fHhR7G6R+sBwrU6jxDbQGZspvC++KAC+OPZNR6/hEAQ EwInDKaZFJxrQFWmfkRxFtYMs71hCBGQecIQlidyNWXMDwrBqy7+Kz21XMY7kdbH8xKAQAA
X-Change-Id: 20250411-create-workqueue-d053158c7a4b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=pz+QK4kxfSdwEbArT7hXzuxcGTfKgY7syMJ6RBjmujs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsoX7sVc+5dfeKTxD79I5FaiH/jXI7I/LfHvhg
 RQ5DRJ3IZqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabKF+wAKCRAEWL7uWMY5
 RlmtD/9BOySqzW4chGh+Mn1vEn+x9GVreG3tyOrlOz+KFGDhyW7EKXDhB7T8q1td/FKtg3sFyrT
 b10PULyxLi3s8C6nQxTOulFmImgvKQ21aEs4fRUut7+yf7Bc/xjbH894qnQxJdw/cR4fpXGAwO8
 pXitI7rKl9Xfc6yKe9zPiDJNYL0mO3OHfQ+QC8wbmH2R0PhinWsAI1+Eh7D9ZafMypRoSl+YT0e
 yqO1EhxlRqGbObIrqbnjFVE8Qg/VdNW/pV92V/TuanlohM4b9LdywNG9v7sNjdLORxm6NX/EmJh
 8ABXFi2uyVXt9h7Vpin8atjXuxC/ob4f9jsORDK19HcwSEImsMEAP44p6flxfLr+/tQErOyxqqw
 91WR/WtaUisEixvo67UWPkIvi+buGyG5o1CJBNZqxqIYnA1lnJvdEREgKvWDwH5Tc9oNulFy8ko
 zaYU8Vsps8ldFPBs/Faa+hB218DILz54Z4MpOVSTpg0JNMAy81p5D3SE1JxLy2t0HhD9zaXPd2h
 lqkEMe9mxwCjMKytqTCojxxsfDqxlbXeMJddHVFUNT0aZSAmc+l+IKHJ4C+Q2aSQB0sweO2uJmK
 ll48PUtSHZx2Fi0k0lEngZR0BobhB9Qj6JUw8XHpRyWgWE30G98GfCjtw4p4Bp/6NjswLWbBqI5 OfsIrfcYY1aGFIg==
X-Mailer: b4 0.14.3
Message-ID: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
Subject: [PATCH v4 0/3] Creation of workqueues in Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

GPU drivers often need to create their own workqueues for various
reasons. Add the ability to do so.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Add link to delayed work fix.
- Redo workqueue creation to prevent invalid configurations.
- Introduce a directory as workqueue.rs was getting really large.
- Link to v3: https://lore.kernel.org/r/20260227-create-workqueue-v3-0-87de133f7849@google.com

Changes in v3:
- Switch to builder pattern.
- Drop BH workqueues for now.
- Mark delayed wq change as fix.
- Link to v2: https://lore.kernel.org/r/20251113-create-workqueue-v2-0-8b45277119bc@google.com

Changes in v2:
- Redo how flagging works.
- Restrict delayed work to not be usable on custom workqueues.
- Link to v1: https://lore.kernel.org/r/20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com

---
Alice Ryhl (3):
      rust: workqueue: restrict delayed work to global wqs
      rust: workqueue: create workqueue subdirectory
      rust: workqueue: add creation of workqueues

 MAINTAINERS                                    |   1 +
 rust/helpers/workqueue.c                       |   7 +
 rust/kernel/workqueue/builder.rs               | 380 +++++++++++++++++++++++++
 rust/kernel/{workqueue.rs => workqueue/mod.rs} |  53 +++-
 4 files changed, 437 insertions(+), 4 deletions(-)
---
base-commit: df9c51269a5e2a6fbca2884a756a4011a5e78748
change-id: 20250411-create-workqueue-d053158c7a4b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

