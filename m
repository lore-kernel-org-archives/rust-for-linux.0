Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB77C7C0B1
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Feb 2024 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707407322; cv=none; b=CiI+QTiYIl8fwYAr31XIVc7XokUSCDaw6JShGnKbzBAGIrViIm5KKht+E5v0ZI15v8z+KRvcHi6uYWXrfvIiKai9hAqEgdoW5+Td6lg0Wubj5yJX56r+BJiJpt5lU5DN0q9n6XNZeyjqDhjgO8R/xMdkP5S9jQSa0joCrkc/+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707407322; c=relaxed/simple;
	bh=p4H6OppwPLzivo83Hr2g72Avg5StT4o8YtOOlH08jJM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=omxYdl7/OMxT0MU19WrK5rjwN63cPBLjVog1D0WxlZt2xx6UR3CFz59OadelegVSyu9vSt17q/xyQEq1Ct6sZdPy6dwmsXjIyN6nNnj3uFFfm799IlZ916yPSLbAltmuy0RqKoielNLYH+6aiBdEdDuS4v4yq41ZqqB2FqPsQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nDunHfpW; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nDunHfpW"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-604a423af12so137847b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Feb 2024 07:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707407320; x=1708012120; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zhocXZ6cl9/R8sKVq7H2EWpDfoTTOkJP066TsAIK9Rk=;
        b=nDunHfpWKmH4ezyPpzXmVL9P4d5OG9E/DjVDlFjds0ZeheB0hq6eODt7h/8HZ+tMh0
         69FPdmLiu+dwYdHABw5fqxhQvu06uMmjMfvHSH5dsOnuFthckYdKMUBpoFHM+CNake/S
         4s2MP8ZIyGNi/UWCvhc64PxGR4vF3TKfwgN1rJJzlHBuavk6+EeMwU3CxyUsrYCbqwyN
         SiERQx3lBZSjtoQZdShF8f0TsRaVHMqM0qNBBVEjLNOozi8ft1KX0d7fN30ATfiviWVu
         HetWLtiDlm6GdW/t2Z/GpRZYsFP5TYQW3X8wXEiIzib5FFx5RddtBwpKXn5YOqLdcjuI
         65GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407320; x=1708012120;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhocXZ6cl9/R8sKVq7H2EWpDfoTTOkJP066TsAIK9Rk=;
        b=XVgTHlOc2vlqP2lC1g6n6mam0sg3i2kndsoi4w9lRy/AQqKxaYKyI0B9Tv6kSndZh8
         vGrw1nxSo/znpfXAi1nwVDH2jy3+d3fk0jHlZjwkXH26O1/0Knt6QdEFsyyMcckoRRki
         fUknxj8LDfNcyiFZVfdnaE8eV/ihxwpdepPA6PD4QVwhttZZywSgnHbDOzrfkhGOYerI
         ayArCuXYzh9ZWfaYocu+A8rmamvj3SelpdPqJVCtHloY+xA7c1tnsTAB09mA15hlq+td
         GugXGFJcgYtSL0upY+oxTjJcKMEwl05B5i898jwqN3QRcty3dAW6qls6PZ5449GdX7gl
         Rtjw==
X-Forwarded-Encrypted: i=1; AJvYcCUzltb2M3RtBHAk1aiCirvtYD882tayAudugwNNoeC7zsNBp8VqruXl58TGaEOk/sZKoLDfZ889HdIxqcgqta9/E2Ln5ywb+r9cRznb8uI=
X-Gm-Message-State: AOJu0YyriG7pTAhr+O0ZJXGiKqRb+mMn7X+/nnV9cbCUERhwFypt5m5G
	z9kQxa3fR5BIeQt8MeLYhhqbW/DKKcyhWdF6RQ2E/WU7rbCc76dXnH61kWQTdu8lRqTKd2bJNrX
	wt3UfLiu+qqwujw==
X-Google-Smtp-Source: AGHT+IGB69IIhFNwxRPtvZcnZuA13Du//6/DSbGdfYAKGD+kDxJ1iEF81gU+wMSoEaws5eDyArLbmGlsrf6877I=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a81:9ac5:0:b0:5fc:d439:4936 with SMTP id
 r188-20020a819ac5000000b005fcd4394936mr1831732ywg.8.1707407319906; Thu, 08
 Feb 2024 07:48:39 -0800 (PST)
Date: Thu, 08 Feb 2024 15:47:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKb3xGUC/0XMQQqDMBCF4avIrJviJLFIV72HuIjjVAeMKUmRF
 sndG910+T8e3w6Jo3CCe7VD5E2ShLWEvlRAs1snVjKWBl1rg6hb5RYhVt6rgRpjbHMj5hbK/RX 5KZ+T6vrSs6R3iN9T3vBYD8TWqO0f2VDVakQ3EFNryNrHFMK08JWChz7n/AO+yW7goQAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2872; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=p4H6OppwPLzivo83Hr2g72Avg5StT4o8YtOOlH08jJM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBlxPfP5S5v2aYkxsj2q/BsmpS4ZQZHpliZ9Y9nN
 zdV3J5MPXeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZcT3zwAKCRAEWL7uWMY5
 Ro/ND/4l4hC9FDoEPydpei/6vNJcR8jmD06FC/VgU+GAa3Q5g4EziSs6o6T9aaQah9bAW2TRkQb
 Xx4btpXW8yE641R6Vtn9DwIHFgF0DsBPknXyUI3KANWo4QcJ8mt7moHllQyX/8Kh/nTv71rOTUH
 JD6SWPgSvqFEfS4BB81C7ypAlPPQB8GX0j/V5Hp9tI+4F/Lt1mtdo74KiB/h8d5mbb6ZJNByHDi
 5Gx0qj4kldEFqb1f5n38/mRuVYDJdarqTmNr+Qk2lEw3E36d43Hab0hietJGpsmzF9lQlPnT0O9
 gM0CgHV8aduedSp/wOb6OaYNmmW4rB3Qic+IkTyf6vdnSW1HA+eysjDPZnA5r+5He9mqDeEtkDN
 22NQ7SajRh4JF59ueakxKXHs5nFef68LYntvHg4dyqKLVXX+31uqqUPbijmhFlRUYwGMd/aqRKm
 vjshrpPeZ+1v1LfsUoZWKvMlb+eN+nNZqAlR3wsdUz/WaXs1tjL3EvVRrwfN94bnOW6PFt3MTK0
 DEvuw8hzkjMfSglFQa3zilwIZkGF+oDYg7YQwBit4xw4vTRTGlXzi7FSBYHjDyG23HtE6+QDZo6
 lquy26SR5FxigoHSo9F5gJN7RkKarjuHd0a1wcpvAxqnuYF3fxlaOkcunuedbGO9yYsJVX615tI doaejU59PxEaQRw==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240208-alice-mm-v2-0-d821250204a6@google.com>
Subject: [PATCH v2 0/4] Memory management patches needed by Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Kees Cook <keescook@chromium.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"

This patchset contains some abstractions needed by the Rust
implementation of the Binder driver for passing data between userspace,
kernelspace, and directly into other processes.

These abstractions do not exactly match what was included in the Rust
Binder RFC - I have made various improvements and simplifications since
then. Nonetheless, please see the Rust Binder RFC [1] to get an
understanding for how this will be used:

Users of "rust: add userspace pointers"
     and "rust: add typed accessors for userspace pointers":
	rust_binder: add binderfs support to Rust binder
	rust_binder: add threading support
	rust_binder: add nodes and context managers
	rust_binder: add oneway transactions
	rust_binder: add death notifications
	rust_binder: send nodes in transactions
	rust_binder: add BINDER_TYPE_PTR support
	rust_binder: add BINDER_TYPE_FDA support
	rust_binder: add process freezing

Users of "rust: add abstraction for `struct page`":
	rust_binder: add oneway transactions
	rust_binder: add vma shrinker

Especially the second patch with typed accessors needs review. It
contains a Rust analogy for when the C-side skips `check_object_size`,
and I would be very happy to receive feedback about whether I am going
about this in a reasonable way.

Links: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rename user_ptr module to uaccess.
- Use srctree-relative links.
- Improve documentation.
- Rename UserSlicePtr to UserSlice.
- Make read_to_end append to the buffer.
- Use named fields for uaccess types.
- Add examples.
- Use _copy_from/to_user to skip check_object_size.
- Rename traits and move to kernel::types.
- Remove PAGE_MASK constant.
- Rename page methods to say _raw.
- Link to v1: https://lore.kernel.org/r/20240124-alice-mm-v1-0-d1abcec83c44@google.com

---
Alice Ryhl (2):
      rust: uaccess: add typed accessors for userspace pointers
      rust: add abstraction for `struct page`

Arnd Bergmann (1):
      uaccess: always export _copy_[from|to]_user with CONFIG_RUST

Wedson Almeida Filho (1):
      rust: uaccess: add userspace pointers

 include/linux/uaccess.h         |  37 ++--
 lib/usercopy.c                  |  30 +---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |  34 ++++
 rust/kernel/lib.rs              |   2 +
 rust/kernel/page.rs             | 209 ++++++++++++++++++++++
 rust/kernel/types.rs            |  67 +++++++
 rust/kernel/uaccess.rs          | 387 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 727 insertions(+), 40 deletions(-)
---
base-commit: f090f0d0eea9666a96702b29bc9a64cbabee85c5
change-id: 20231128-alice-mm-bc533456cee8

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

