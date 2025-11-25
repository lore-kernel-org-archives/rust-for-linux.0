Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819C320CBA
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079197; cv=none; b=bvR/ks832HdT7SL1uAOv+7HrFNwJgN/zxFqW11dGclxavRS0H+goeo79HvzdPJRI1USzC6OS2WeiQUQQPqsvMvjmZm9qjBdfja7BlOvybmaBkFOQysqJYmSEbT5Cz/+1WDc7gfth3drQB1bYXz48psz+UjALdA4FN75qrJrlQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079197; c=relaxed/simple;
	bh=bRsPLP38cHQDSFaJmoylK3g4RDF0XCdRwPw1uZId5KU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=csZGgmpEknDBGf4mAwQFFtVZo15dIl9nFl267ltA/Tb+zbLqQVrVo03V+MQUrK2cNgJYMSE8/4RBfG1dZEPDqnLTnhxwpQJ9hK7EK31r7yMYegpJ6QFrlNPezi9noBYyTTgzkifBK9C63U6+Rn7o+wpv/7L3HojROpoCv+uHfCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pERlE+L1; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pERlE+L1"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7369635423so731689866b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764079194; x=1764683994; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q1Umc5xakz0p47odRNCKRo/Cs7UN6/Vvp4GOsMfqkPY=;
        b=pERlE+L1hMhdnrY6zrtsPikRLuZo310KBWewhgDuhiRDVAVFm1+VlLVSqwPUSqyiIF
         PEPZxcp+t5Jt4kKuh8YCVIEXedISsjXWUV+yxjq1WVVH3VUZtLsF8gtREyoA87ow2dSs
         JK+1sopenEM7FcQ2AgslbLmRFFGVZy/+geM16ZlhnXllcHzweaoAQWCWHRXQTSYN97pe
         M+nP06gEaW8n3Q5UGNtbIpzgonKidWI39wa/SeSeVTul/O3IkDQq/8f7wuXNWtgBArwb
         9TZ3xs6HCTLhi5g35rpq1Z7F3tDfaH67yb33o+BQjIL/j8YLiqoKOGoWEK3GkOyEF9ph
         SNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079194; x=1764683994;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1Umc5xakz0p47odRNCKRo/Cs7UN6/Vvp4GOsMfqkPY=;
        b=k8bJQooi8vBfF+kUw+fGcUx9qhomtkuo/muBkO0p19uEV/keXAs2s05EBvbCEcz+/J
         GK8s+GD3gligtjCEFD+jenC7YSX8Uds/JGip2q8iLz5HCrXsSJrjZq26DDwu3wqFWAJ4
         1vrwrzUBFccIKBY0Gp5FaAtJPXhr9SRIWX6ncpWyr7UW1r+kyqbU/4n0Z+dnGW23a4yk
         Z2g320YZokhR7KRHLyxCiJDox+TeQaYBvxeTlQpsVIjCyrphSFbMEP9jPcid8OTCU20L
         3+FkhqN563KV9iYi0GDpH4MzsLLDtsgu4lHhZowofcZyZJqmkTrphNwfhpdnRgVneU5o
         jxVA==
X-Forwarded-Encrypted: i=1; AJvYcCVeUhz6QJo/qCdNcw4QFpBkV4umDV27QlChX6Z0UkYaiTkgbTlsZxAE50fQifE2gG3durMYQHkMWnhQRh0faw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPAzbLRLh1/vVClK3dfUREKWGnh39FKkyo9cggT8YZzjdT5IC5
	8dDF8TvDrCumqg7Z4rRqwpdkBDg/2dGlSot6gAc91v0/6xAPjyCtEMpJHYRy+VFwftG07ttsIeP
	gYfCzXVijhG1o9WHOqA==
X-Google-Smtp-Source: AGHT+IHRr0F3OZH/lXnIU0dw9lR+d4//8yqIdIG4fFEyZfF9jodYQp47unQezT7bSlyXN/0BKdvQTMzWIKhDOMI=
X-Received: from ejcst1.prod.google.com ([2002:a17:907:c081:b0:b73:7068:f975])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6e8b:b0:b73:467e:47f6 with SMTP id a640c23a62f3a-b76c54b870fmr323173766b.15.1764079194249;
 Tue, 25 Nov 2025 05:59:54 -0800 (PST)
Date: Tue, 25 Nov 2025 13:59:36 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEi2JWkC/2XPy2rDMBCF4VcJWkdFM7ZuWeU9Qhe6jB1BYgU5m
 Jbgd68cCnXtlTiC70d6sZFKopGdDi9WaEpjykMd6nhg4eqGnniKdTMUKEEIzX0aIpV6PO/uwaV
 zIlqlOg8dq+ZRqEtf797ls+5rGp+5fL/zEyy3vyUUm9IEXHCjradgQ4wBzn3O/Y0+Qr6zJTXhm
 sOWY+WkJEbQGBT6HW/W3Gx5U3mDBjG2vkGhd7z94wC7x7eVS4rG6c558HbH5Zrjlsvl795GHTQ FZ/Afn+f5B7wtlOGnAQAA
X-Change-Id: 20251007-binder-bitmap-5aa0d966fb1f
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bRsPLP38cHQDSFaJmoylK3g4RDF0XCdRwPw1uZId5KU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpJbZTqhEdfXXjETT2d2p2UxGZIrlBoV8F1nN1s
 xlL9uZoeiKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSW2UwAKCRAEWL7uWMY5
 RhLCD/98rrOnXlaRajCbmSL+muGP211gqpDhc7Qtg+Fqkj4OGNpxjbHxAfuOOZWTOhJnmqBmcUu
 L1tpuxmT3aZ+P8HQomtyAo3vu83ShnLdZ2niFgKirVkZ7FouHci/971JwQJPYamosUhLW5OG+Lx
 l1WsngXFjiI0IVdFMlwlB3ExcHSXjGrBUfwTLLH+dVN6S/vvWNEmADi5+1Kl3jt/tM7ohyUzHLF
 pqrz2s5bUssDOIhM2KVA7XUr3nIwN6NtoNxYo7uUlWb2eLae/gI3W4G0c8lBbIBaCmSXYzG1BHO
 aP46VYUEP/8sv/5ilsIHnDzWEKtyuohbi/IOsMGsIOeXcsYR2o5gq0/iXvmJ2+DpeiO/0PRNT/x
 QSf85XUZHtf3efts1ZhdLOwqZpy3vdJZ72tIlOiaxjOnF3fJipXac/EEzGle7aEKUDqnOffy8HP
 dWIN3SipC/u4KE93zlyqrwupCKJVN46VSND4qWVorINdNlRG+B5T7LhtRt0QJx85LwUU7i18i3l
 hkmU5gUBb5j3wTz56Rxe31jfZ26hnedML0Q7O6quZ6X6/fIl2ETTKgNjfjnO0YI81parj4/BeKZ
 A03P4vZlc5XB6EpGmLidc2fP09yy7NmS87kv24yvI+LYnPsbRJ+h3UtRUMPDh4Gt1UQEdKRmyAE Bxt3Z/nVvxL5UDw==
X-Mailer: b4 0.14.2
Message-ID: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
Subject: [PATCH v6 0/6] Use Rust Bitmap from Rust Binder driver
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

See commit message for rust binder commit for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v6:
- Fix rebase mixups.
- Include benchmark in commit message.
- Link to v5: https://lore.kernel.org/r/20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com

Changes in v5:
- Rename NO_ALLOC_MAX_LEN to MAX_INLINE_LEN.
- Update all uses of MAX_LEN/MAX_INLINE_LEN to reference the new
  constants.
- Link to v4: https://lore.kernel.org/r/20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com

Changes in v4:
- Keep existing IdPool constructor (renamed to with_capacity).
- Undo docs changes that were due to the removal of the existing IdPool
  constructor.
- List id < pool.map.len() as invariant for UnusedId and mention it in
  as_u32() comment.
- Fix [`acquire`] docs links.
- Link to v3: https://lore.kernel.org/r/20251028-binder-bitmap-v3-0-32822d4b3207@google.com

Changes in v3:
- Also update documentation to fix compile errors.
- Use new_inline() instead of new_small().
- Reword commit message of "rust: id_pool: do not supply starting capacity"
- Change UnusedId::acquire() to return usize.
- Link to v2: https://lore.kernel.org/r/20251021-binder-bitmap-v2-0-e652d172c62b@google.com

Changes in v2:
- Use id_pool.
- Link to v1: https://lore.kernel.org/r/20251020-binder-bitmap-v1-0-879bec9cddc1@google.com

---
Alice Ryhl (6):
      rust: bitmap: add MAX_LEN and MAX_INLINE_LEN constants
      rust: bitmap: add BitmapVec::new_inline()
      rust: id_pool: rename IdPool::new() to with_capacity()
      rust: id_pool: do not supply starting capacity
      rust: id_pool: do not immediately acquire new ids
      rust_binder: use bitmap for allocation of handles

 drivers/android/binder/process.rs |  64 +++++++++++++-----
 rust/kernel/bitmap.rs             |  43 ++++++++----
 rust/kernel/id_pool.rs            | 139 ++++++++++++++++++++++++++++----------
 3 files changed, 180 insertions(+), 66 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251007-binder-bitmap-5aa0d966fb1f

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

