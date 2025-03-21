Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C633F6
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742559024; cv=none; b=gyXQiX8GaO0hLyii5ZItIajc219gQk9eXHGYpuFYNDQzXykNQdPU7mI2E00nS2rYZSelQ/hr12HH+Rs5IiTbpe+w1DdKEK6UEQwX3MDIitD7daZrWgOvGqpBWEuzOEZUWj3ikHzdlK5cjHsZKN0USFTnMsZNTr0ESqiSiw2OC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742559024; c=relaxed/simple;
	bh=m77GtzyuRQyH9r1AhRKLOBDFfhXXm3iZOjUs15wpL+s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bN+dx6mLlQukHTYdM9d7A2xGcUunXv3BrR0aeDpuTiigJd8/5qXOgwhWFXgeHZqy2WTFjP7WJd16CbrY8y+ot+wOORoxsjeoDXD7g1wJXgM4OJGx0JX/RbEXKkmRJH/QQDU2rj1TwOZBNluFyN6F4wmN33wkRo4ij7M6QV0maDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BHahGHRf; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BHahGHRf"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39141ffa913so976525f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 05:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742559021; x=1743163821; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=niclr8+DoLpZdWNc9oriyXHlvdFbMf2iV3dQAVqT6ps=;
        b=BHahGHRfxTkFvIMbVFp+5heh3oZCiWPpyaPwsBrpjtRwxMYBA8dmpWUcmvUcOlTPlQ
         CDf3Pgi1VSJISaGAMJgTAloUukPg86EmDkRz5odgLkx2e6apZDmf5Vefc2nTk977wngA
         TQ3d/UpMyVlEuFihRUl7AaMKIoOxglwRWEUxmnzIA9WZbX8XuIrXNainTuNbLjw7c834
         W8A7x1Q9ijbdxrf7PlCdvBQZ6frsJYbFRPGY++Dq7jLAwjooB0Jj2ZNqwOKPn3o0GSXU
         yr7bTyAuVufDg/H/ojIHUk60ND3VSzwnumavUZa9/AF4vQI7+BJ4kVhR6KI9CaJ+/X0X
         topA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742559021; x=1743163821;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niclr8+DoLpZdWNc9oriyXHlvdFbMf2iV3dQAVqT6ps=;
        b=gH0ffYsg2Q8RtYwVY2Xzt6eG+etE0V5Me70NMzf/j5M13FNHI00oA3tFLJrwqU1AMl
         E/hebhiUQPypD+fcmIVd2Jg4rTRxG0vSruKwtaRDZwqI5hfLYGRuVPPoGRwndhTNRpv9
         6taM4gBhVxqlr28xKNzaNIZOMcxcWmmoTsc67t/7WgQV/0Xk8IVJKCXgNXtLiGJFqf3F
         k6gNwyost3ZIrGltg1bPi20GLEOftxww4rTdwueEoIYwgKpd4yzJ0lUwX/ZyCADsG8ve
         s/pWHiehlfprI6RVBM7gxvvv4zLQn/fJDoMSoNEvI3erXAWrpYeldFSBzQPTIRwpgzxW
         dXgA==
X-Forwarded-Encrypted: i=1; AJvYcCVg9moPp6JpEhAnZbb733RyCYX2Lj0aM+jVyRm9VUEsgnw/FKEHoaQ8iZIbd31vcTrv2eOI6s+D9wZFdTIa4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS18hVRQVsHbDTvlYQ0LBR4RYz/Nf9km8N3/dUjY4rdbUI1XRC
	ObY7Scvv17no+vq8z0hm+ZjYxFzDamGS+G4iBn09INb5w84687qtkqK23CflVCpiNehRiZP6+cb
	+K37BTLNWKSmEsQ==
X-Google-Smtp-Source: AGHT+IFUnWcxjonRBINox1/nLtB0v8eeiJ7whsk3pcv1B6qRkzdqH7Y3jkCu3QtacO4RnclOGnfKAtSfRW+GlvY=
X-Received: from wmpz15.prod.google.com ([2002:a05:600c:a0f:b0:43d:55cd:66bb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6d88:0:b0:391:29f:4f70 with SMTP id ffacd0b85a97d-3997f8f9259mr2879692f8f.3.1742559020693;
 Fri, 21 Mar 2025 05:10:20 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:09:55 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABNX3WcC/23MywrCMBCF4Vcps3YkSQ2KK9+jdBGSyQVsR5ISl
 JJ3N3bt8j9wvh0K5UQF7sMOmWoqidce6jSAjWYNhMn1BiWUFqMSWMniQltkV9A4by6StB6lhP5 4ZfLpfWjT3DumsnH+HHiVv/W/UyUKvDrvtfVKe7o9AnN40tnyAnNr7QtXy9ORpwAAAA==
X-Change-Id: 20250320-vec-methods-adfa41e55311
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=m77GtzyuRQyH9r1AhRKLOBDFfhXXm3iZOjUs15wpL+s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn3Vcaleg9wtsMTP1gG/5SVuhcKOhy/X/BW2oiO
 JtO7u5HrTiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ91XGgAKCRAEWL7uWMY5
 RhFfEACzabiIIfDN4MB/FllsQTwoeC3CKWvpewtW0rc2FuQh7P2E7A0XNRwXagFTqP98EPBGpIP
 IvoWAxlEymm3mPBair50ajtBnBw8rQhlupJfOnBc2xXCqhuqhDkiZmfw6PZuscPeZ1p9bw1pfZs
 eKG/k852uG7wd1S6sj6nGE/ROqgTWb6ESS5SA+ek6pCMzXkirElGBevDS/gSX7w9Gn31ajUAV1j
 +ipxJwbokxICnKdkJsm4K59YcET3OkUPj7cdxacoP8N4rnyQK7Y0KKXlGU8bmbZhsFNbwYWd+Y+
 R7ZIBRKmmG0tvFbEf5s6nE5812dtToXiyR5KxULKKLK3QYC2sqSoUti9MjYVEO2jysSlH1XxtWe
 vb6hVL5QoGrmsFuFjZNl53jRjE9gq9cUdpFuVcM+ZPFh4CY4a7mkkeBVtR1tD8ebJUNiXSpWKtL
 95Nryo40h4Ql4Tq9h/RgwfTapKgEnxKoxITBPiQUZ9BR7H3iWt7o5a7hBERjvwCcMIckGENsUY6
 QSLbb+2ndl0UQ9pscB4298tpOUOdTI9K+jhZbRUsFdHPGxjj1+9mvFrGz7YUy6aA/WzYO4e+alo
 0Hbarc9pCq99E8UV703CJUKwr2d10mCuf75i+7RW5wBpY99L6RL9pt3TEVRh8JmswfEexsLUd9N G8S5SJxM3KEcIrQ==
X-Mailer: b4 0.14.2
Message-ID: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
Subject: [PATCH v2 0/7] Additional methods for Vec
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

This adds various Vec methods. Some of them are needed by Rust Binder,
and others are needed in other places. Each commit explains where it is
needed.

I'm not sure what we concluded on the set_len / dec_len changes, so I
don't depend on that series for now.

This series is based on top of Vec::truncate from
https://lore.kernel.org/rust-for-linux/20250316111644.154602-1-andrewjballance@gmail.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Add two more methods that I needed.
- Introduce some uses of set_len.
- Add example to retain.
- Simplify pop.
- Adjust 11 to 10 in push_within_capacity example.
- Link to v1: https://lore.kernel.org/r/20250320-vec-methods-v1-0-7dff5cf25fe8@google.com

---
Alice Ryhl (7):
      rust: alloc: add Vec::clear
      rust: alloc: add Vec::pop
      rust: alloc: add Vec::push_within_capacity
      rust: alloc: add Vec::drain_all
      rust: alloc: add Vec::retain
      rust: alloc: add Vec::remove
      rust: alloc: add Vec::insert_within_capacity

 rust/kernel/alloc/kvec.rs | 202 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)
---
base-commit: a337a03281efc4553191b432d757d4c04884bf4c
change-id: 20250320-vec-methods-adfa41e55311

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

