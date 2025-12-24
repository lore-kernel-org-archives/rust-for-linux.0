Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33FD17BA2
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 04:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766548816; cv=none; b=CgRhFGKn8MEpP8PyimUuZC5yP3gtrsBmKiOVeQQRb7o+4RiZuylcThSCq/uQlVN8z4gabVEUH/JLMnKXvULUnRjrg8SQPlIJN4V6Y7CH3LK5MS4XWBgTu1dUwJgyH9PxbGXzam7/dByXbeKbJyojBxdapbDJGHasvV2E1QZHfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766548816; c=relaxed/simple;
	bh=fbaJyRDiHq5rT+aHmP3nj0gx6DyyC4LXn3X/Q7G0qbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ruvUPFoMeavFKQx1LJspCl/tHnoFeze516rytcGSsy9gbG/J8ums9lTMspqsfkZE0FtEDeYXLAuOwXP33LdWJwl4qA9NpaS0THRCC/btdipepp+sM8oLfiMb2VdyM4t0Hc2/aKZXYf/tkX9v+0oQSr5Kqjn9uoNtA+IJTHqi05M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMOfWr7r; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMOfWr7r"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b80fed1505so5899894b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 20:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766548814; x=1767153614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15J8JYA2RlXsm9mHy/0N0w8q9AM25fubVC52MXcxDBo=;
        b=MMOfWr7rE1OC2i/Q9+HRLTTOgTtqoX+nXjgCUub0d3RHw0ETEeKtN6Dt6x1BXPidXY
         CaJ3Urhs7HFhmlRkc3sVbrx86/J/uJSb1GJrNDJXFnqAzYYjdmDMPqEE1M9oUM8ByE/N
         cYvCYEn6bKDc+Jmio4U8SWvphrwXaPcW46fAlVPd2niGaFV7Fm1YBxwvVZKIVqhCwVw9
         hts6MrxymCEt4hZwgiJL9VxqMeL2lmx22kxl8BPbj7ZeiXCNd7PxoYRasxksAM57fe/4
         mV7Zf0zVbHNniNVhMpsRFqy2I+atntSJWjBWyqWPUy/9mVmHxdSUsmXwOE98W7ZaU/eV
         4mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766548814; x=1767153614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15J8JYA2RlXsm9mHy/0N0w8q9AM25fubVC52MXcxDBo=;
        b=boVfxesS+R6n8ONOMH9+IXR6RhdJF5t//9rn/10D2jtBKVqQGKKWh3+PQn4dnBAxvR
         uewEtgbzwRuv2HvZZhqCptPJ475tkunFiMqt9jLcTSQwVMLYaSfCil2xtfMPJL5kL+GD
         GSP2vtwxSsjJrnVWx2pbdHuKyjSEkowJOL6y/b+VoWfOQAZz76fuAJMT9Nz+0nLBai8L
         hYqqbGUyb5nQ0XZu7IX3jPnD7G6v1cQQGyhhsjDC4BuM0S0FP8zfMWggEdaks389vwlH
         R0FjPUnc+QfqtbN3XPdpxuVBrY11RjOXKMrRJhooPLXSEerZ4YlVeX/5tkrJad7uHKbu
         anDA==
X-Gm-Message-State: AOJu0YxKoBd2XwwEAXVd4sApk42h98UE8shoa7Gq/vKgs7p/+6SrkPOc
	umGmamjZhWhrJfiTfAqaYgL7g7B3jnMBWjfx0srK+osM6v27u0d4/5q4
X-Gm-Gg: AY/fxX7uHBMjNI8KKm7kIuNCHCdjVKee4/w3TkTYKeptOZphTjm9KIeNKRuPaiBOxo6
	XPSn1Ul3dzGUgASUPHaEKqjkArONEYw4bvgDAFNG+5Hw0kJokgi/mS25nHfboCEyCVlMh2yqBrS
	KeeuCGphTgFtwiUcXRFeqCISknYtKs5+bhKfU8ci4Y/4WGmY6TtjWUgNxmciJf+ejbBD8KztSqM
	ua1K4WuJ0Ofh8mkjsFH2eStVBSvud3k2YcpC0D+0SPTdjqwwjvB3YGiq34YDzDuQhi6dLKK7tR6
	twnwjcQ58ucA0y1F2D/VFtYofsSqd7ewjAsqzm+8DkubSOwtFwrgTd4SV4eBPtoyCjh0ovnEYtM
	vlR/ToP0p5lbvUgnU7EKjS+EqlVkHh//ptUNGvdq5HnUpiz0POhIWera/obsZE6Z/VNXQ6xcBG8
	0yUD+AlAmWYATLV7je7rrPSg==
X-Google-Smtp-Source: AGHT+IFC5XGfwJjNkSwGpC2zGfaXAO1oe8q/u5Cyg28/T7qLlNT6jf0HIuXTN3KWVdXR0G5t+GJGFQ==
X-Received: by 2002:a05:6a20:a11d:b0:34f:b660:770d with SMTP id adf61e73a8af0-376aa8e66e0mr15888978637.55.1766548814049;
        Tue, 23 Dec 2025 20:00:14 -0800 (PST)
Received: from localhost.localdomain ([104.28.249.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c5307c7sm13255131a12.28.2025.12.23.20.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 20:00:13 -0800 (PST)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v3 0/4] rust: add `TryFrom` and `Into` derive macros
Date: Wed, 24 Dec 2025 03:59:53 +0000
Message-ID: <cover.1766544407.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces derive macros for the `TryFrom` and `Into`
traits.

Primary updates in v3:
- Adopt `syn` for improved macro parsing.
- Allow `kernel::num::Bounded` to be specified in helper attributes,
  enabling the generation of `TryFrom` and `Into` implementations for
  types with restricted bit ranges as required by the nova-core [1].
- Add compile-time overflow assertion to ensure that enum discriminants
  fit within the types being converted to or from, preventing silent
  overflows.

Note: 1015+ insertions are purely from doctests. Most of them are kept
private to keep the public API documentation clean and simple for
users. This might not be the usual way of doing things, but for now I
don't think I have a better option. Feedback and suggestions are always
appreciated.

[1] https://lore.kernel.org/rust-for-linux/DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com/

Best regards,
Jesung

---
Changes in v3:
- Use the vendored `syn` and `quote` crates.
- Support `kernel::num::Bounded`.
- Add compile-time overflow assertion.
- Add a comment about `#[repr(C)]` enums.
- Drop Tested-by and Reviewed-by tags, as the code structure has
  changed substantially. (Thanks for the previous reviews and testing!)
- Link to v2: https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/

Changes in v2 (no functional changes):
- Split the patch "rust: macros: extend custom `quote!()` macro"
  into two separate patches.
- Remove unnecessary spaces between tags.
- Use a consistent commit subject prefix: "rust: macros:".
- Add Tested-by tags.
- Link to v1: https://lore.kernel.org/rust-for-linux/cover.1754228164.git.y.j3ms.n@gmail.com/
---

Jesung Yang (4):
  rust: macros: add derive macro for `Into`
  rust: macros: add derive macro for `TryFrom`
  rust: macros: add private doctests for `Into` derive macro
  rust: macros: add private doctests for `TryFrom` derive macro

 rust/macros/convert.rs | 1546 ++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  319 +++++++++
 2 files changed, 1865 insertions(+)
 create mode 100644 rust/macros/convert.rs


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
--
2.47.3

