Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C0735206D
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756301930; cv=none; b=ckZh3YexgR6fbIjQP8sHxMSQzp891xVMyIUM/aB+9J8FaiL4YEEM/lTR2bKqaIJiL2QdlzWvoTryG78A4qj+jAfDLC7ADDukC0kiwdveW41EJmPV9lR5OP8hnzCSGDOuRs8tSVtXOW/m7JKBCkqCXf+O3jBiFzy+E5jlzlwHupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756301930; c=relaxed/simple;
	bh=T4Kk9hg7k6nwC121hIRmflX4axzXFxAKRAccn6Kat2w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QMApNgPA2jbNl6icwxfogCIfV29PtjC3qOsqNb1+yTbvqLnu67SmibdXxOCmq5lSRcdB0MkKQW+dW99ZWZbtmZGqGz3vfgQIlOUo7fnQl5GI2sHcwOKs/iV4eoaraGyNxSF5PtON79MOnbfIEHCMBHncCf2bOXb0bFyVpF1o+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BaN3rQo+; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BaN3rQo+"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3c75de76caaso1845710f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756301927; x=1756906727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ReergRz91VYiD0psPGfUqTceP1iKvfFRvJIV10khnlI=;
        b=BaN3rQo+awLbHi6djetfwJ+VnnWzLLysehipFjdW+ADBNcoe3pWWHCEHfvxCkU7Btg
         8U5dRWaX2d0Dnry0agbQ0KnoUYYxeIzRupEOhCLe6kvCBulXDAwyw0d4eioHhQCXQpkk
         6oKsdZb8Rxkqe51WVLGVygir6e6tHFAueAhls2ZobCvkK6745tXygGRrn9ujujxEuwnL
         vbT+ksmR33hE9YnrBnQLhlLFwFqS/aULLnTmszPy/3lm/BqvaHbxlsnojQfV9sG+oW0F
         7dMJD653m7CSZn5JCnDGY+a4fT9njBkjSAQuE46RXKBSX/BwklvK5Ty7EYLQp9/szd9J
         ZUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756301927; x=1756906727;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReergRz91VYiD0psPGfUqTceP1iKvfFRvJIV10khnlI=;
        b=FU1zdJ0cKh7z4CK2j3xI6PtH70N3WTsmtTyDIIY9AX47Ho5p4LtGsZlp0DMgBicgU+
         +0gLhvP+8vkC+s8kc1H1kI6dXZ8i9IaJr/JPz0z4jfNB9Y2Hv/GgLYETvEFcv59mvp1H
         aCIBveVsX69w7znCNbyPl5QMnalXBYaaXmzVf9+lLCqqFG5hbEJorZUGuxBISVnL3y/S
         D1eL25gIyJXENHDSZhmlnQiAojbwqrAL9NyVi3lCFzhsYm8ACBiAJlLVu+hiUFqwMDaP
         IeKz2adoJwiimqcvwtEJEmm1JxPs2NQVCa4ZFx6dFTNnA6NgVbHTjigPX0SVx+miLMO5
         ZJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwBdKBgRGsULYuCVyJEt4G/XDBPgdQTB3jjYMmpRjBGefFdeP1E4lGvCcDniPKEBXzSD0UHqeAIcQpkr5IkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlEs7aD6Y9bi071Bhu5oQeHVqzlgfiIroJjyQGv7+XOe1ZzOuK
	rbPut0A3xIxlW8VJ2swEi0WlrLGsCldOzv+EpryACp1BYjlEtTMqiGYIxwXtIweoYIVesBA2j+s
	gIbMirgE+oUnBIEJ7ow==
X-Google-Smtp-Source: AGHT+IGDR/KKmo+S77dpLzFH/5ksImWOImV2ATqsae8Vpzppb4G/We+eedfsA/IVYVa1fkU/sTJDsVbNv2iumkE=
X-Received: from wmbdt7.prod.google.com ([2002:a05:600c:6307:b0:459:df20:248e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420d:b0:3c8:e9d3:c380 with SMTP id ffacd0b85a97d-3c8e9d3d035mr9768151f8f.0.1756301926661;
 Wed, 27 Aug 2025 06:38:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 13:38:36 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFwKr2gC/33NSw6CMBCA4auQrh3TBy9deQ/jorRDaSKUtNBgC
 He3sNLEuPwnM9+sJKC3GMg1W4nHaIN1Qwpxyojq5GAQrE5NOOUFrVkOZpyjhH6ecAE7gMEeZEl
 r2QiRY8FIOhw9tnY50PsjdWfD5Pzr+BHZPv3LRQYUMG2opsVSV9XNOGeeeFauJ7sX+YfB+U+DJ 0PlTDKqmRbN5cvYtu0No2drIfkAAAA=
X-Change-Id: 20250814-gpuva-mutex-in-gem-a608ab334e51
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=T4Kk9hg7k6nwC121hIRmflX4axzXFxAKRAccn6Kat2w=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBorwpfI6fZ1Q+VznBKbZhsynvbCV9QJCFz4ab1e
 we4fTxdqyGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaK8KXwAKCRAEWL7uWMY5
 RqI0D/9lXu1uJWu6+0Enpnp9JmQ1MzDX/FOFXYDJEa+jdrDhWIQj5H91zbkjIrhcpmO2eKoIgjR
 OUxOX0st5kQXKD21DCKJXUWh0lyn7DT/6yiWRC1xjLro7xiUd2RXDWu6TlbIoVIkYAfXMhaNyOf
 E3T3u3WbsW14M++h1pEl0IGOvPm7/24F4KwUlgEMUUbl6EdJLKQzf0vQenjwVSw8sTVuJ5SjupH
 R5YnOoZWC+rUTDAiqdeQ4534INCopUh8Sg7BdugkVGuITub4UncURL1R60cIsjWckoYou9L7L2j
 rTZw3BzldQ2crlaOEeiXmugYudWxsMez+JVEK/SUS1TFPP2sZuVjLLHSnkhU0g4KagwleTClrNY
 pM0zeqkb6lZcPkOKAvehAMtZc+YFqNn8nDC/qzpoW5TP2Pd3XY9K/ub1B2gbgMMQHSmGhMbJTqs
 p9L+swwuntKUVc9o7zn4ds+cSl1h7bqzxaAK9suEIaJDkHJOxvPErLK3+f20EjjRC79yJ//U18F
 yYiLzydHoE1YSR4gWVmvxxC8P/fUv2U69VZ+5ckSxwDzvSj1T4mQILaNgXWzbEAOKBaLNOkIGVY
 6X7k5/lxwVBofFI7HEpsyVaydIR+UOhRLlILIR5rKrF8e0XKK30dEW8ZshYMW4rRUoswZr5q4Lm moY/XiZMetGkcoA==
X-Mailer: b4 0.14.2
Message-ID: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
Subject: [PATCH v3 0/3] Add mutex to drm_gem_object.gpuva list
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

See the first patch for motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Documentation improvements in patch 1 and 3. 
- No code changes.
- Link to v2: https://lore.kernel.org/r/20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com

Changes in v2:
- Move the mutex_destroy() call to drm_gem_private_object_fini()
- Add a third patch to get rid of the lockdep map.
- Link to v1: https://lore.kernel.org/r/20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com

---
Alice Ryhl (3):
      drm_gem: add mutex to drm_gem_object.gpuva
      panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock
      gpuvm: remove gem.gpuva.lock_dep_map

 drivers/gpu/drm/drm_gem.c             |  2 ++
 drivers/gpu/drm/drm_gpuvm.c           | 30 ++++++++++-----------
 drivers/gpu/drm/panthor/panthor_gem.c |  3 ---
 drivers/gpu/drm/panthor/panthor_gem.h | 12 ---------
 drivers/gpu/drm/panthor/panthor_mmu.c | 21 ++++++++-------
 include/drm/drm_gem.h                 | 51 ++++++++++++++++++-----------------
 include/drm/drm_gpuvm.h               | 30 ++++++++++++++++++---
 7 files changed, 80 insertions(+), 69 deletions(-)
---
base-commit: 3f13bcc886fc034113cb75cb32b8d9db1216b846
change-id: 20250814-gpuva-mutex-in-gem-a608ab334e51

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

