Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAE1C5F14
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630104; cv=none; b=eWp8RLCm4FZdjJGFgs45zwRsZkOQ/8zFEs22va5kzBZYF5dZeodkE+pb98Q83OLBixnJ7toLIt5zymR+ZH/yFlbqJ0SQTuGbjOn+JAtwp/ZlxwaOVhYW/SLIwSKjBqEu1uS60n/FPr4jGm1LCuvX5vzYZx9foifuwlOAp3rgB2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630104; c=relaxed/simple;
	bh=afSa6vVTYCVxy0a759OZdbrn/OOM1dFbHbFatBL2nB8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CLeNWbtCTd6aSHn5HUYoBatgVZF60JSvWcMt6CgceHutHegqNt9MegPe/qTj650A2QluJ5hhB67oHYeHmP8dQJ5lW9TYG7rjGi8bf8+YQtf1MRSBbAAzNXNKBzs3PEIzS5lEoX8iVZoRnjkMmBFgEM2Iem0+lIch/RsUi/HANM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YrNzOb6p; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YrNzOb6p"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43628594d34so4324425e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737630101; x=1738234901; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C3V53K2yo0ts4re6IgjEJ3+fZBdG27oIjNbpXvm4O0w=;
        b=YrNzOb6pQ7UGSAsVxTpoCuS7JmjDBnoYWCt7Kzeqg3/IPVUy3rt0RAB63JJwOEWUKa
         twHNLv/GsxppEW4OTbTWVPH3dGs/wFcjDJd1DQbV0SKwhpwFdfDcCplKmj/rzvAzkCX0
         Nhb+30z9qswYUd93VRmdfXpGTalG1vArmZEzXg6mYcaaq+3iBIOazvUgvF+w0OSEJCXv
         gUGpbWA+/RWYooZhN6slYOXavrpA6xZCbr9h4mgoTuXB+PevfeHMu5fhN1FaNdMg9Xjv
         nng5IFAi3VawzYsZNjnU+3oxpUAv+3SKYChaxuV9NQQLgK7yoD4vNmaZAmCCdgaaXtrn
         vhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630101; x=1738234901;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3V53K2yo0ts4re6IgjEJ3+fZBdG27oIjNbpXvm4O0w=;
        b=db4Qa15tGw3iFeeePQ1vDXQdYWP9i2cVnzN1jv+naRN8nyRvR1RpXK3FKv/d5ru7e/
         esdbBWFXsdKdD1JtMTlRvr+LTXhK2WBn3YBJTUyaIYaa3HwTZVadzBc2++v5IG6VBwQs
         aqR+SwoifK1POxr6ZZv6dQJuRVUpi6c/m7Q3xmF5yEpXFNcGQBmtiagYGQncjLHsqsiv
         eV62camRr89ZkhG+frNYuI/+kTIkonKGSVU+YeX60Dx7SRfIeTYtWgOHwUaWzCbTTewo
         pkXetKW43u4Ohw1zzWoIuAlkCwXpuQ1ZNXb9S0Jzrw5nwu+aeYDWiyt99OGt0I/XAKBQ
         rbLA==
X-Forwarded-Encrypted: i=1; AJvYcCUnQduNcEVysetZkbUKdVA0pRL7AAc/hrRWsbiVVMe0SLZtGwY6cu29q+vktFUt3wb7q7gxTZpCiFA6Ke27YA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/iRsCLhS0r90jEy8lWLOionWzfY0t4Z0HTAze1llx9VwENZI
	IkRDTWoG8NY3fyjVDn+bGan5XBQbwCF/Vuf2pOjOdWwHuKlI6+qqfzFERuwWERStyULAFSMT2xF
	2HyFz1kjW/P/sXg==
X-Google-Smtp-Source: AGHT+IFtE6vBVZVSoSVUzyHmdrnucpKjiNSMnaDXbbiwf5dmer8Jv7+nEpKpe3h45e1JGkhc78I5+Kc2nF3kyA0=
X-Received: from wmqp4.prod.google.com ([2002:a05:600c:3584:b0:436:d819:e4eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:218b:b0:436:e751:e417 with SMTP id 5b1f17b1804b1-43891919404mr243572925e9.7.1737630101013;
 Thu, 23 Jan 2025 03:01:41 -0800 (PST)
Date: Thu, 23 Jan 2025 11:01:07 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHMhkmcC/2XMQQ6CMBCF4auQrq3pDC2gK+9hXBQ6QBOlpkXUE
 O5uIZqoLN9Lvn9kgbylwPbJyDwNNljXxSE3Cata3TXErYmboUAJAjJe3XxwnpfU34k6DkqWZAq
 1I8xZRFdPtX0sweMp7taG3vnn0h9gft8pVP+pAThwUewgzUFqTerQONecaVu5C5tbA368EoCw8 sgFhxJlZdI8z6BY+fTb48qn0Wut69IUugZpfvw0TS+JkkicLQEAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=afSa6vVTYCVxy0a759OZdbrn/OOM1dFbHbFatBL2nB8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnkiGNSx1Vegt5nqiR9mUnv/9xJemAXCvSdLr5A
 WY9UpOkiXyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5IhjQAKCRAEWL7uWMY5
 Rq71EACzrAFplG64OJigfO349KKQeNfpctwuB9I0KETf1bsN9wa+4QLVB9rQzoq/lioc3DAPu+R
 KQ3qFGEZ5ISukctkQMwwLbGQezfpdWGXSypA/Fq6qI9b1S32Re9CHpdlb0OqS4mf9NVNH1xACOa
 OqQ4LGHki7vzQt1pC7vtSF/KY4SyKI0/gPVdFcqfUpvc6t8LeQgdhHanGfhLg5180uitArbbbex
 WU/gWKrQqNaFIUubsfDFc/DU+mZebDCPL3u6Xaz9lVzQ56SVXoTzvlSjBX5MmJ5SarYdpkPY6Ln
 RTLptkZlh4zZPJh2JUm5+gx9xIO8SJp57HBHroceNUmYXdiD/EI9mmXWkCftV3wI/YeD6VGWsXg
 QwZ53XtdyCINRDKC4rF2LuCjl6IXb43eIRgq2K/xGg0h7lo7+I8LZv98TTDeJNo70UZItfL41L9
 YVAgcuRF/W1mdTdUZa7eGve2WXHzsK5SOdtUANSDjP8swuglKRrkDSOEvrl/NnidRiNAqpi2e8r
 6W0A+kQHjRPudShQMi3jvX3Z9/CpRlD2Av6QPA158qnxeCN5Pen5JLtPkGU9Bx3w4YkUxHxV2ta
 wmESWm32bzYVr6039LJv1FcYJueH3vzpACwUrCGulDHYDWxFjIXiob8GhXU8vKwey0Y2gQHf22M fXfTUfqXXTnpJdg==
X-Mailer: b4 0.13.0
Message-ID: <20250123-cursor-between-v4-0-cb06698db94c@google.com>
Subject: [PATCH v4 0/2] Make the Rust linked list cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for more details and
motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Actually call the example functions.
- Link to v3: https://lore.kernel.org/r/20250122-cursor-between-v3-0-aaafbd8af14d@google.com

Changes in v3:
- Fix `CursorPeek::deref` to use `self.ptr`.
- Reword comment on `ArcBorrow` in `impl Deref for CursorPeek`.
- Link to v2: https://lore.kernel.org/r/20250121-cursor-between-v2-0-1b24cd377618@google.com

Changes in v2:
- Extract insert_inner refactor to separate patch.
- Make move_next/move_prev not wrap around.
- Add some examples.
- Link to v1: https://lore.kernel.org/r/20241025-cursor-between-v1-1-08913714aae5@google.com

---
Alice Ryhl (2):
      rust: list: extract common code for insertion
      rust: list: make the cursor point between elements

 rust/kernel/list.rs | 440 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 347 insertions(+), 93 deletions(-)
---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20241016-cursor-between-154bed859e27

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

