Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7428A2F12BA
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184902; cv=none; b=rExxgFQrmYk8UOR79E0kb1pOnKIgoyCdFsLZPf55YLKHMMjk3Zq/G4dgXcIIVbqlRAVL7PBSZQj/D26YKPHGe63D+ew1o6vIvdQEQePzAmk2uf6hPzwFnH2Tdy6ByLKEg/0Q0Tv1B1Ae5jHnU794I4H6bb4/vK5DOy0/SBBO0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184902; c=relaxed/simple;
	bh=RC0dbN+BcbAdgap0rNBuWyZ2q8xQ5WR7zSsEygX6N9Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c46Gy0J7elhiIwriUpy2O9ZsTcolgKB8fnuoXfNWcxO6VbGM68kogJXxvtUoLTALmG0+DmMm+C9VRhjZQNDGI3AMx5Wpj1g1DaEnf61RvHpHjBqCorl/vmfwANMgXt7zlzmgxrgpqWnZeHwQF+twuWOp0ezQfHji/6b4Meu4oBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FnPNTaDL; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FnPNTaDL"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836cd6dfe6so17352755e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 01:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772184900; x=1772789700; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Z9d0oqLEDXmnb4rRiPWk+w+G4GTyvBlEUZf3RDZYvY=;
        b=FnPNTaDL91iP+Hd0pBRTDVshiUFhfZgmI/EMx+AyRJPTs+vLTkxvy6V2VQHYo1fmV5
         8srsseu86O17QNuY/hHKesLHdJrx3S+KqsbE0HvH5QsS6V/UKsl86maByCbnpQ3kp+9T
         bRognA287rfztbu5rBPfJFDXdHEtiO91u0m7U5eyhmCFy9W9PVtFvKstbYR+fKEOeJp8
         AwOif/hw83eFFaR+/c7/xl/kLYGne+47UiejhnPRXUBQy5njh32aw6XPaQwJrMdByRxp
         X7JGGu+T6KBjYHmZrCY5F/HZqA+k+wF6MxWfpTfbViBa82s5NwHOXVcSoqN0m2aeN3la
         tctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184900; x=1772789700;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Z9d0oqLEDXmnb4rRiPWk+w+G4GTyvBlEUZf3RDZYvY=;
        b=bQxn9LL8jIYLfHwzXcNT6PNv7Sz9Uos7C+strYvtsrIRmRHFORvVMyTs0Qjt6xSC1h
         PmuNZ9mczY9hUlxMJKC+UbHwmqiXe23zR3WMOfLuFFyFyoPxFblAt1d1zL3ue8EW1sfd
         xDEW7ej5L6+XbMXI+KGXupiHIs0G98jkY85knv5zA3aBSR4ooNZ27kO38wV+jFHu8C1M
         CQoCC77O93Qa81GFVd/EygQ/xRzGje3ZABayQu5QkIx5I575kO8a/kw7Ms/BLQP08ykB
         QRaWhtReGRRms9GWvVsgRAMmkZ46eB4C0/thWJB5YNExVucgfkA6PPr7i8yeEDYe5KFA
         7C4A==
X-Gm-Message-State: AOJu0YwuQlUAnsvRAanar0Nd7+a1gJW4PixsPzfbAEhzFcfMvG2qHuDq
	82+gM4QfrVU0TqMnch5JdgiYU7XlcNclteLw2fAwSsRmBWZoGuzUCagEO7Qww93gxOYDSn/iyx+
	6Ne+3KiKzpdrHbNqYDw==
X-Received: from wmtg1.prod.google.com ([2002:a05:600c:8b51:b0:477:9dee:b5d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c4:b0:483:7783:5373 with SMTP id 5b1f17b1804b1-483c9c0f20dmr27765705e9.23.1772184899586;
 Fri, 27 Feb 2026 01:34:59 -0800 (PST)
Date: Fri, 27 Feb 2026 09:34:45 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADZloWkC/4WNQQ6CMBBFr0Jm7ZhShbSuvIdhUadTaERKWiQa0
 rtbuYDL95L//gaJo+cEl2qDyKtPPkwF5KECGszUM3pbGKSQrZC1RhpDYnQWaWB6IL1i5GlBrfj
 E3GilhIEyniM7/97Dt67w4NMS4mf/Weuf/ZtcaxToyNyVVedWu+bah9CPfKTwhC7n/AWy42Jbv QAAAA==
X-Change-Id: 20260219-close-fd-check-current-98e3ee59880a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RC0dbN+BcbAdgap0rNBuWyZ2q8xQ5WR7zSsEygX6N9Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpoWU8Ag4nQKDSgtp7wai/44/RaULJEToPxu6Ur
 J/CFZHAKDeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaFlPAAKCRAEWL7uWMY5
 Rv3jD/0ReUezjIe27iUkr7rk91IH0H0W2BOozjNYqEWH1jzhg8afITSM+6LO3iCw1tiKubp6Ed9
 3dp6/gCpjKNWW21Pwvcg2IRjcfyssINvIPlCYNnYw7DoezW+Dqf8X6URz/7JBqUn+mthHjACtdM
 Z0Mw58lguCfbZNbL4k7jllMiHHHOVG0FAUi5KHdJxpwCB2IhW4gSy38xtJpW41Tm7qQOCcHx3sw
 g6F8k3tzODHq3G3bGxWscdpovm7WOiJjuQj0LXWv9FLGemStDWTfp/86To8xBoyw6JvPgEDWq++
 p9pMWP7PKm3dUiA5sQwnli3p1nTapqnABhWrJkBUQT3UJLuuiaQ0WsNalcqkOHxSSjIK0XXyXA1
 rwZUXsMJnC1jk9SgDdQJXv04NpK/ZYD3guINR76ME4UuvN8sJxcZJTprQ/y8WvFLMrnKr/TGYvF
 ig0vRUYqV+a6JiLNil/Pd8HeIOedxh3eVq0Eu6hbWTZ4c4ofdnKLn1J4ya9wtulmacDzZzU/reU
 Wl+NP+/5So1Y/SWhH1zcGSQeUtkemEX6DmIGfB3GsLDYFwvoX25erdFT1HxzJ9FSsSp5Cpfu0XG
 EDA18lfyrHA/qf0l6Bjgg1R3XvsEHXoRFXISp7ikxH6nXbi1LcuqtuPJL9B56OusSK4emlriMtk A7lMp0RuXwHrvGw==
X-Mailer: b4 0.14.3
Message-ID: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
Subject: [PATCH v2 0/4] rust_binder: check current before closing fds
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the last patch in this series for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Note that ARef<U> == U can't be implemented due to impl overlap.
- Add #[inline] in == for Task.
- Add a patch that makes use of the new == impl for Task.
- Link to v1: https://lore.kernel.org/r/20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com

---
Alice Ryhl (4):
      rust: sync: implement == operator for ARef
      rust: task: implement == operator for Task
      rust_binder: make use of == for Task
      rust_binder: check current before closing fds

 drivers/android/binder/allocation.rs |  4 ++++
 drivers/android/binder/process.rs    |  4 ++--
 rust/kernel/sync/aref.rs             | 22 ++++++++++++++++++++++
 rust/kernel/task.rs                  |  9 +++++++++
 4 files changed, 37 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260219-close-fd-check-current-98e3ee59880a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

