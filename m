Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF4D1A3029
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538757; cv=none; b=emfozz3VRUCi9SZtsoe/b7a3Uiw2gYFuAfDW3+GxxukzT7f8O4lHpUeGco7eT7VB2FOK5f/r7gKYTD5yKo/Bn3m/vO4iDjEqCKVxpgBKdn9DzsQoBiNpCyYY/scvqQzDiKmZIVwwxrzUuvuLg2qzPXNW/gSNZsfxoQdU+bGBSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538757; c=relaxed/simple;
	bh=RZsjeUqn25AVS1/YOuDCPaoEUOHvybw/va1386aHCnc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dnqgcj3zRgi50RXqHw6EHKdCg1NAirVTvD6yo91Bq0IkBCY6JLAupRHffS9LDom6C8MREfqzSTYS9PRlxLKWC3dPraQ1eWmssh1Wtx3hVZEV17gYuWYuflbDBAh/hQit2KRMPCt5q2H06LX0pvrZJGbDGX49MBJl1TSeiY6Z5oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tlqtUsQA; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tlqtUsQA"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485397788b3so9377295e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774538755; x=1775143555; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=om+QlX/arFDy0e2W8eDPmTq2CH+SEUH/vE4G0xRQ2Bc=;
        b=tlqtUsQAhTTuqMwd4IupIe1ShYZRqsS9yDeC9cHDsC4ps9jNvbmdW/OjP2Awrmmpys
         wGXlMb+NuXwfGNAYpJSONPxy9QmcoRqshV3YdMAwcuBk6w3DthAMVC0uRCY0bggV9Owc
         G9HtKJhVfgzXaPNK0fqqTEW8l1OAUxVUzuKV3wfYiE7svdNUN+tlYI3fVR3IpxJOl5w+
         dRfVQsWq3/yx3X5y1aS/LKrW9darvJrYCZ2ebZyxq5I4cUICVr4F1sEIzuhI3+5OxbGZ
         bkYDGXuPSSbw37+8GS+P5c+w2TpkI7uCcefq5VDq9WNPjapsKLB8aq0ZG4bFwvR7Pmzm
         yKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538755; x=1775143555;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=om+QlX/arFDy0e2W8eDPmTq2CH+SEUH/vE4G0xRQ2Bc=;
        b=IkOZ8L7aM982SuiJlwrRrvn9d8BZiFS9MFXWV6Vy5cJgo9vQaT6VSba/5Bx6Nymwbk
         XAHH7PvW1BEy/uTBzxYnayUzTGrfBmYU2y2MEHyRt3MxC22hzQCimKcNO0gN0f2j2dd4
         jjmY/zCeWxVFyVHhEcMXVBFIVQFYltkd6PHbqj0kkdFY6cOnj4rjFKEs+EbjcCXstkp7
         5oxt8+b2Zw3GaPQgNjpOj0YqrV98KLcJAsJ+nXvtdwZl3PsxuMKg2+sjAJoe+Uq41fhj
         n1LZm4txpdpAbZvQOsaw+GE57VZBTLXTtZIJYWHJB2sKmXLiMq8ZdGE4jGkCfXu9IKy6
         xJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg8UNSnfBQ9dxTonXwKMuRrJZSxGs1DNlNjjBC7a+bA45UV4Um5NnF+d6id5gthpvGYt4nWbKDwO7B/oAgBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqgX+/6QjXORRVRmPn1R95kxODfdcC6a6JyExgM8I0XMTkdWu3
	kEJg7eg5zIksKh7l6j+Y8of+/X7vbumVDSMc8D1juoWlZWblHFSYAPi9FE40X0EH5+DPjVNs34n
	lkDlrgeKUjd5oK1rVbA==
X-Received: from wmlv9.prod.google.com ([2002:a05:600c:2149:b0:485:38ca:51c9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b88:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-48715fc321fmr120406325e9.7.1774538754679;
 Thu, 26 Mar 2026 08:25:54 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:25:35 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO9PxWkC/x2M0QpAQBBFf0XzbGqtEL8iD8sO5sHSLNqSfzd5O
 XVO3ftAJGGK0GUPCN0ceQ8qRZ7BtLqwELJXB2tsbUpbo5cN5YonBkonzpzQCc1YtRU1o1eYCXR 8aOT0H/fD+36UYnQ4aAAAAA==
X-Change-Id: 20260326-drm-rust-next-fix-aref-595e7bd5e70c
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=634; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RZsjeUqn25AVS1/YOuDCPaoEUOHvybw/va1386aHCnc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpxU/7DkSrgNEEzysIB26qjOah54fqgX0T1BPNJ
 IT2v1Q1JKWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacVP+wAKCRAEWL7uWMY5
 Rkt/D/4on0M56vdD32mLqcWxL2DQL4BtYqtPqQGL7iWmhKvJZi2M8bsCdzb1lc/OZcdYeYNAEBy
 IWXZ7OgQDxIBRdEB2Zg/ihrAtrhb/U803bZMXF8QWusZyMJ1ELw0XI0m8olmsUSYJfvZwzcC8rr
 JczP8GTXxKdp2XgffX7mranpLJ1+sCBIvvQK1i/vwE+Xc2MzxTlUxKZr1ViJQYRMstdNM1o6XDe
 QbLcQEYCpMzAhKyAsbt9Xmw7cstJJjLBbEpazR6MyYrOiIZThtwY5lUv16fCwJvJCpql7ngVAjz
 oM1f0VrOFEbVPEhl1KIoZogd/F307eLEXBr491le3eFouS0U9Cii2uyQ0c/1ULtuK2/C19sd8ki
 bKaiLUt68B3RfGd/07/14Wv+kjIQl+BV83Hek6AgcGMRW5Qmir4wjubX4BZSSifKsBQwV5Qr5tK
 RMuExTq6Cts3+k4Hxags6GFuPwmGe4cGa84EnuyEwBm62AQeg7mrBqhJMpSMZHq/2FOU78539DA
 9xU+gAJInp492s5MaaCPBIkrVcgaHMr096usAzqh7xKB9ojyNTIrmu+1Z8yvxOsJIWQsFk5aXib
 ssKH9xFgOgMhMcOl7y/vlGfzfg2TbwZYmrpPsmn2TKztquQ+rePSzDLsDi5MuM5BDxDpfsvOEJB AiBNAiLISinrT8g==
X-Mailer: b4 0.14.3
Message-ID: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
Subject: [drm-rust-next PATCH 0/2] Fix sync::aref imports
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

A few imports of types::ARef were merged into drm-rust-next, but this
old path is being removed in rust-next this cycle. Thus update them.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: workqueue: use new sync::aref path for imports
      rust: drm: use new sync::aref path for imports

 rust/kernel/drm/gem/mod.rs | 2 +-
 rust/kernel/workqueue.rs   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 206bada308d0d715d62ac841784af34a2ca22ff6
change-id: 20260326-drm-rust-next-fix-aref-595e7bd5e70c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

