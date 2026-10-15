Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFA4B1D0E
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052239; cv=none; b=WKorkwZKvHgGtN2p71nyIXjxyUe+NlRi/RI4ItYviX9gNWpi8ACXDhCy3xD173PHSwNgnTuK6z8scw62Y0j8Y4lHjbhS4USYucFHcXKL4xFy+jdJd7P/e5HQ/14iZBNQXjM22wYUZBSt8aTz1OKRPnyoCAwdURv8jQTvubabncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052239; c=relaxed/simple;
	bh=E7PZ6N0FszxLMMdaYgjXFBu8QGf6U3lNuUd7q+Uemus=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ro78o0pfMJiR+LiLjTOCvlOihmOgspOp2bsSBbtjGuXcKhMad1uF17PeXjBw1TWircEZMhIHbbkIvxlbU8lGmzfN6uj33+rifnOKtR1IEKoQjIe7cQraef4O+DVDNPmc6arf2u8ZrkeOIOilaLLV1SYd6tKXcCdXyaTNlp2aJzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EmTSgeQc; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EmTSgeQc"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c437ae81eso921600f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792052235; x=1792657035; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qX7Lg8nlPzyAAsaFZtEahUdsTQmoqhdq+zOHN21G2HM=;
        b=EmTSgeQcmOPgZbudvDM5YK601HW2rXW5xDB0m8AXDOTxntsugs2csqxdLrlgiwhe/3
         n4cZg2o8EQnO86ojJPs/YXnK21XbtYU7q1JBUGycMhA0cFz5KkRfHlEAlL/sN26qCxLX
         ayRyW6v1tVXTWXatTwvQDU2iYYufNLHU3BneJZ+jcDDlNtojmeYXtsqOaWihcnyNbALc
         1FWHCZD5WviZ07ttCNN09UBPcf3mhE/va3ddG7Mb5h/xslD52ecdYqU2us1qoM7Lifkb
         Zf5qM5nLvwW60WOVL9PWfI1mg4TsldjdZ3lwHrbh4wQmbT9F9ZOsTApAktzuzQdr+Kie
         Cbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052235; x=1792657035;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX7Lg8nlPzyAAsaFZtEahUdsTQmoqhdq+zOHN21G2HM=;
        b=wjJ3B9GXbIjCEhRiArozr5xGvd2vw8/2FFHRdaNnsRe0k3yKf190vlvUA2VrP2kIKj
         5VzJLZgXVdZ++/cWTSnGj9BOwg5acMM+Bixsww1gEJeCthTpQIyLddALQZ6cwOhCB8H1
         PoTMsnqVfbjkgEtzrVGx2IvA0tZOjpzFi0KuF70KNgCssZLoqXnfATUn5tVhSbQfTVHd
         RU7zO17v3Dh7KhwHe6zurRK53LBQvGkp4FxGlD2qdgu9Fbi4RUNaIkqIeaipGHOAEHvs
         BdfcJ7SxyHVvcSje0EJQG7eeIWi9nNSfMjnYgw3jpyDfRPn3xTo2P2U7GsNLFY1YFZCm
         P8yw==
X-Forwarded-Encrypted: i=1; AKwUvBxgNJwsXlvDCX1vTidAU1VKYxSZdCc3DEXtylfawUvBQIAFbqNoW+Z/5h7n5qby0De7TDDiDZx880U8HycO7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvDLVWkuDIeJ5VJ5P8NpP+f8itQPs99jidV6tYAqexeEfDxgvv
	EF3HKxa04qQNV06GU24Y9mR29WmK6yVXG6xUplq4RrZVHJtFc2t7OFVn4SmTs2efnMSRxKOdvFO
	kI4qYcsMvnfbDGY1P6g==
X-Received: from wroy15.prod.google.com ([2002:adf:f14f:0:b0:48d:f52d:93ac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:46ca:b0:48d:f14a:9188 with SMTP id ffacd0b85a97d-48df14a92b1mr4100690f8f.17.1792052235100;
 Thu, 15 Oct 2026 01:17:15 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:16:26 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANqL0GoC/x3MQQrDIBBA0auEWXfEscXaXiVkUXWaDC0mUQgJk
 rtXunyL/ysUzsIFnl2FzJsUmVMDXToI0yuNjBKbwWhjSdMVyyLpO4cPSl7RIjl83I0O0dPNs4X WLZnfsv+fPVhFTh0wnOcPRFahxWsAAAA=
X-Change-Id: 20261013-spinlock-irq-6-18-9720cdb14be6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=E7PZ6N0FszxLMMdaYgjXFBu8QGf6U3lNuUd7q+Uemus=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq0IwERFzAhp1VNXrBknz/Gt2WAq3AYCiFa2d8Q
 rh8yHyRBHCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatCMBAAKCRAEWL7uWMY5
 RvYfD/41o14648yaQad597iJTkzJ9ic6n9ykRuUWrHM5caQsBVoLm6StqOROvoTMoPXnxoDwVt8
 k+D6HHmT/Wfp5hXMBLBh8cBcPN91UDml/04cVLMsEAr4Gnt/zqgdj9pVJQOiD/y2oB2SmfDGV1B
 uIZxlPed2k8dFNl6c//nCBihgeX4Sv8cUkdSNBIdb7vOjhJB+ow5dZ2KOZX/kdeh2OBdPWK3yeN
 grJYZcTDmPA+CYyBJ8ayGWC2DfYIDtZ9IAoh+cMFVPAUopLkk/fQRcBNw/A8sZv8Rb1i6MTDHEp
 xNpnYnjPt+dKy3/xrqrdwDptf5s8eZBI9OoA2A1ft7e+2nkssL9RsYVeLAFykln2kcE6U6vIEKA
 TdmDXspxrEvizz0/x6B5TVhlP0z193iwzxTkAPIM9qZIsDdgVrDqRkD+3gTMSVwqnkplynWTVh5
 cfn2ofzRe6Vf4r5nGF1lr5Hhc/cy9UTZ8asPTITVssTbSBmSCSiUe8vVGPmqn6tJaEl6VY4DIgp
 3kFj70It4GLkTW0tbmTDLRkXFKmHqAZEXWpe5JAmREWwYYuldOQ/qXV5Wskz16N+oOocFPOBWhK
 FXJN7R3/IMuW0HEz0s2iThER18f+0JnhewIDaEbuZI/FGy9meYTtSZeg0d8inU+N6EM9przq8Kj 61sj3bwXiV9QOCg==
X-Mailer: b4 0.14.3
Message-ID: <20261015-spinlock-irq-6-18-v1-0-72c58975994e@google.com>
Subject: [PATCH 6.18.y 0/6] Backport spin_lock_irq_disable() to 6.18.y
From: Alice Ryhl <aliceryhl@google.com>
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series backports the new spin_lock_irq_disable() API, as well as
the new SpinLockIrq API for Rust to 6.18.y. This means that any upstream
code using these APIs can be backported cleanly to 6.18.y without
needing adjustment to work using the old APIs.

The first commit uses a different implementation than upstream commit
e901c1510e24 ("irq,spin_lock: Add counted interrupt
disabling/enabling"). In mainline, `local_interrupt_enable()` works by
carving `HARDIRQ_DISABLE_BITS` out of `preempt_count`, which requires
reworking the `preempt_count` layout and arch-specific accessors across
x86, arm64, and s390. Instead of backporting those invasive changes to
6.18.y, patch 1 implements the same refcounted interrupt disabling API
using a dedicated per-CPU nesting counter and saved irqflags word. This
is slightly less efficient, but is much less invasive. Patches 2-6 are
clean cherry-picks of the upstream patches.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (1):
      irq: Add refcounted local interrupt disabling

Boqun Feng (1):
      rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers

Lyude Paul (4):
      rust: Introduce interrupt module
      rust: sync: Use super::* in spinlock.rs
      rust: sync: Add SpinLockIrq
      rust: sync: Introduce SpinLockIrq::lock_with() and friends

 include/linux/interrupt_rc.h      |  26 +++
 include/linux/spinlock.h          |  61 +++++++
 kernel/softirq.c                  |  63 ++++++++
 rust/helpers/helpers.c            |   1 +
 rust/helpers/interrupt.c          |  13 ++
 rust/helpers/spinlock.c           |  15 ++
 rust/helpers/sync.c               |   5 +
 rust/kernel/interrupt.rs          |  89 +++++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   9 +-
 rust/kernel/sync/lock/global.rs   |   3 +
 rust/kernel/sync/lock/spinlock.rs | 329 +++++++++++++++++++++++++++++++++++++-
 12 files changed, 609 insertions(+), 6 deletions(-)
---
base-commit: 17ad2612c11a748b50d32eefc681344b26fea946
change-id: 20261013-spinlock-irq-6-18-9720cdb14be6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

