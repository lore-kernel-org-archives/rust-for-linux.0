Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1F2BE7B8
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871026; cv=none; b=B54CYuoyzZDZ1nZqrcR0QE+ifSfCRZuuucjBtEjiClN+IgNu2b3hyPWELnpxaJ82K+Aj/KLsS/EuCNcrlQFROPnc4pCNlemWKLJkPATQJo80Hh0B6LWcP4ErlGOLwPzBxM4jU9aKVnXnmdVp5eTbYnpiReBIOYPfVjH5LR5T56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871026; c=relaxed/simple;
	bh=oj2s8bO5lxhx+kKxRe74EFxM/F/qWhzbrg0KtIezBuY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RZE0XeZ4o6vFkGGbHIOjAtyvMdlmyqXJ/DFWzYE8xIJTkFVfJFLR3gtnhYZStljoLz18C8xze1/d2I4enNcdUwTUe/7wbtGmn9HDg6sPJf/6Hbr49e9/RjT1aI6Aa2k2hrYZc120kX7+kgYXhdaJV56KjBWK5WfOgIqlfHAJRRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KO5eNHGH; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KO5eNHGH"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4775fcf67d8so37504815e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762871023; x=1763475823; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iTBpJ0w2os/1RvBWHXpd8TL34XRCPeFtbIxSDsdtlBQ=;
        b=KO5eNHGHPChbMoZMluxxxOTIUURGRU5v3cU+HpR0zaTRDcSwedi3JKdeniMG7AvsIz
         mwQI2yP3jdd+9lCh+P1JRSGm24uusOFeNauIm7/oNluqZSdBze6TvbltVlyHyYV8rrfg
         qtDLcUPYFZaP/SPCJabxy+gE4fkfugr3vmjg+Ioo1tEVAQE6r3O2xtnAMh59FeFMKS0I
         5hJeg+Or6IvvFGbgvjwnC2JWpj1A/ALmkfnTQgvrw2+c9/K5dk3fXdl7hflgkOA1lS2N
         I+a33YPW+6uM/WXceZzM1F3GBhErijo4goA9aJjdqndYRlM0lJ7qC/Ba0k21fNvRpJBL
         vAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871023; x=1763475823;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTBpJ0w2os/1RvBWHXpd8TL34XRCPeFtbIxSDsdtlBQ=;
        b=cWdnE1SjJHy6MsUlfLnEjIODuBmpwpQtEqg6KWyCcjkKGNPhgha9YL+rnUd0fUpU5g
         3fBNbCPoOrEP++tC+K97G5M8nPzaeJQus6Qz203bHQw+SLtFujm9mDQbGyFhtF0rSN0D
         UtXwxJDr+BBpbd9E3o0CJJKOXOf3n88v6LmJZJoIHWMRx7hQA2E8ru8zGiFiR6yuFIgR
         imIi0udl5/3QjQoq0VfS8TKGZ11BuIaFGLw4aYbN0PTLpMjhEF/3R0B5wCV8AgfdH7GR
         6eHrv9E2pPUZVDjRQyounzn95VIVp5euxRjcJuFxEFOS9p4x/ZVVaeZi7vGC06oMHH9a
         YWtA==
X-Forwarded-Encrypted: i=1; AJvYcCWDhJ20z4hrdyDLkZY4/nlHxC8luFVl9raCzGP3R7KCMYNwqGVIrfNLk0yMZtjd7bgtu+csZjYQ+s0MCN9/MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0DA7I0dOybiC36OVSsyHi7ojDBUZKbuoMIMqAVpxPRiqfV+9
	WLqi3UcCsURpH5CcEBRth+FOmOgcEAvDYuroIHNW8xSPuil4R3twUuWq9eCdwIufguKuMkagAvY
	GBi+acFQfP9EOZ0LfSA==
X-Google-Smtp-Source: AGHT+IFYs3kJb3BKRTegYAhCqWpXq9+rU3WS99Yao39uyZ1Y+HHPv27mS5SqNN8IIJFq2GgDoV2/NTcxXq+gdLU=
X-Received: from wma12.prod.google.com ([2002:a05:600c:890c:b0:477:54f2:85b7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310d:b0:477:55be:f615 with SMTP id 5b1f17b1804b1-47773224f5dmr106326985e9.5.1762871023136;
 Tue, 11 Nov 2025 06:23:43 -0800 (PST)
Date: Tue, 11 Nov 2025 14:23:31 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAONGE2kC/x2MQQqAMAwEvyI5G7DFIvoV8aA11YBWSaUI4t8Nz
 m1gdh9IJEwJuuIBocyJj6hiygL8OsaFkGd1sJV1RsGJ40yCgW/cOF0otB+ZsDbetr5xIfgWdHw KafIf98P7fiGHDFZoAAAA
X-Change-Id: 20251111-binder-fix-list-remove-41c29c75ffc9
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=664; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=oj2s8bO5lxhx+kKxRe74EFxM/F/qWhzbrg0KtIezBuY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpE0bpi/WI7dIpOwFKvWdRwVEcAo9vBbRNsfaxI
 Q0PzoEYrkqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRNG6QAKCRAEWL7uWMY5
 Ro3tD/44ZBOKxIr8I0ZmiJSpYwK/aReOFe101HeEva6QBMbGahZnUPutQnKc71AE7fTzvqQxyDP
 PHBtRnuilDjPCe5zxQxyn69IoJuP50x6Ty366iWizgfp1KL8tkNB17zIRfF00MVZyiW8Pvz8VqA
 qwQm9/YvR8daSorxtQjJOpUKbQFejmOg5oo3B++95hj1rRu5vFTUFVnfKxW0J0uEg5dImsoz7a0
 8l06vtacn1he0voaZ2sYlY3uJCeJyzP8JQ/nALRvzEjwZz9+d9khuifWH4nNLCdvHJayRmF61Hj
 dX4IUYgPLhL6Dr9eCll1CxAJIh5CN6aF/VQXD9X6DOUWMstq4pGJse+cwLk50vyq4At1PBZLAOM
 NnicKTyttD2HZNs0abHzoXvdiAAWCSNXW26mUldwMxGSoYFUAP5qW+kUB8avc5LfZ6SmYjx/fo7
 VvpI7Dj6zfvCK0EBrONW7chcgj6OXZccO7EvI2GkbfmqjRaaARAu06pk89c6YyXKuHzvs3pYVv5
 qioNRCHAT2K+t7gSCmn+rkqT002dzVJbf20rP7SMlGIbDTRKGS3NhPHoJLLq5wNpIfL/UJ/xIKG
 XE0lMJQIabn37UbqSylpn2+3kGq05KOmdJkhqPfhI8PXdPb1Fv3JtRjzG8bCfrdXZrFfmPM6qJ3 y+bGgzRTLiNDRpQ==
X-Mailer: b4 0.14.2
Message-ID: <20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com>
Subject: [PATCH 0/3] rust_binder: fix unsoundness due to combining
 List::remove with mem:take
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

See the first patch for details on the bug.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (3):
      rust_binder: fix race condition on death_list
      rust_binder: avoid mem::take on delivered_deaths
      rust: list: add warning to List::remove docs about mem::take

 drivers/android/binder/node.rs    | 6 +++---
 drivers/android/binder/process.rs | 8 ++++++--
 rust/kernel/list.rs               | 3 +++
 3 files changed, 12 insertions(+), 5 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251111-binder-fix-list-remove-41c29c75ffc9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

