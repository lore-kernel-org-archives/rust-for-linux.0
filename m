Received: from mail-lf1-f74.google.com (mail-lf1-f74.google.com [209.85.167.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB1225DA
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713165258; cv=none; b=G7yssN7NsE+fGi6iZhQ4QLKk6XRn4ORo+QbVPaML4l9+ZU8FgLkuheDQmGWgHTqyGnDD/ZUC1TdwXM/Lsy7U433uJ6wdKbf8LoQ3WJR/ZCvnesMMbHVyRFHmtZbU0sFAtVS0Q96/kmUZumLFzHvWx5kb1iz/1sQYFpL5Ttxt+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713165258; c=relaxed/simple;
	bh=2e1X85rvz6Dc/ugdTsdRjXFp5/BAFi5T5i940mZmfps=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TRTcwITgDPtbOkhYngeYjt/M47HHi5Fj5qqQBlckgYK4utwebuwgGySuM8YMkz98t6lxtAVrN2qGdfzCdNLdvx0uL7MKnkSqJdCox6sO+okSU0QGNtu/y1XppfXpVc5Ub1P5i0vfTSFG/ksI1i7M7IDRzGOFeUQ7pLybtViiUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O/G3tb7E; arc=none smtp.client-ip=209.85.167.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O/G3tb7E"
Received: by mail-lf1-f74.google.com with SMTP id 2adb3069b0e04-51701401bd4so2003954e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713165255; x=1713770055; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4GRRmywA9h466COkiWztO2k7QWi4sp/9u/vk8Vh//Fs=;
        b=O/G3tb7ExuXnI0/T5IGDQIwtri/cuekJ66kPEomTWgZ4YMm6WnNbtxFLUV1TuAE79p
         RA4JxkIltCMYDgCbp+E5qMAXM8fCRFyLijTxmua6j/db23ZDb7E51585obFa8RML4kYR
         QT9AYdUY8j0m3jcYugSvnKKgN3DK0GCXQUjnXEDDsRU2hNuc25jEuZe+Fv30tgkSmsBt
         eo+qSjMGOlzSXw2o32trj48XrZjA11N9YomyeX+gmtEiDvsj9p27QGw6VDNgA5LKFaBO
         eypdCrGvAIja8k2Psy9As6tEuvJ9LGuiqlJVNRXzxOjFB73LNfzo14EPZBkv/LrEkfrH
         eL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713165255; x=1713770055;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GRRmywA9h466COkiWztO2k7QWi4sp/9u/vk8Vh//Fs=;
        b=tN1kTJVvV5bFU7QAJGJIiPu6w1qxlnEfWbFZ4yaU6xIqdfcF/ciDun5BS8E2ubZj8W
         EY6/EQ4rvW8PhEOJRTDcMEsrZATUemWa9fBakDs6jyeX9xVkmp3tN0VgYBKpgkWvpc5O
         ZDX1BjWSwLUZ4pJk/H+Rc2vwqWJmRuUClHjd5mgx97ZvwyS3Ihk1T4RaplsbSkb5irFO
         arpUjLvvzkWIa/RI6ypCOBh0/F3oJHdkFA4/qKXXazasb+Z6/gUw5HL1fwLH/2zi/1hy
         6O96iYd8mAEE3XN3tDgLDU2XTjXBa5WfNtrNtlEhiYoj5SXtacaFGaffNC6jdWVuzeQC
         MEWA==
X-Forwarded-Encrypted: i=1; AJvYcCWk6Ca4tfliRnBpuJJvEaalqoriqEqV/eaSmZfKPVKCN8dbfpjPeGxIf0o3yYRS1WkWbvWg39qZsbUGnKj1kmPeoKuwNWFjDgBECQn6RiE=
X-Gm-Message-State: AOJu0YzhwAxx3zCjvgyxY/IpaY0SMduSYEVA3YgCS4XhyN9DWOvDWOjn
	OeG5qTFy1CgpJYZrmI1MHWBTiwCi2GmfKX3roIS4up7gKPvNpkHxz6K/c9aIrKBLVFzNLQp9AWZ
	Fk1AU/Z+gweRcIQ==
X-Google-Smtp-Source: AGHT+IFP1799A/INBTP1ZJNrG0CuTASrln5KTO4oyjuvBqEvXsF1x0e0IOk1vY1Jk/fFjJUdDNNJnn97kfGjtR8=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a19:e005:0:b0:517:7879:5b8a with SMTP id
 x5-20020a19e005000000b0051778795b8amr7915lfg.13.1713165254748; Mon, 15 Apr
 2024 00:14:14 -0700 (PDT)
Date: Mon, 15 Apr 2024 07:13:52 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALDTHGYC/2XOwQ7CIAwG4FdZOIuB0k305HsYD6zrJokTsxmiM
 Xt3Oy+bMZz+wveXtxp5iDyqQ/FWA+c4xnSTUG4KRZdw61jHRrICA85a8DpcI7Hue11T6RyWFTF
 7Jc/vA7fx+a06nSVf4vhIw+vbnO08nUvQWMClJFttdGNDTUzeEeKxS6m78pZSr+aWDIsEs1qfY ZYeLJRygaH6k26R8vWVdCKpaXe1CyL39CdxkXJWEkXiPngEBGoN/Mhpmj6wdeXSTwEAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3730; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2e1X85rvz6Dc/ugdTsdRjXFp5/BAFi5T5i940mZmfps=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmHNO+dW58xo4FQMfR8kYfnMJW1eEv/m7+aySBj
 faN9axF5O6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZhzTvgAKCRAEWL7uWMY5
 RqgsD/9bR2gcW5Kx64xZTwO+cA3WFov2fLiqMOmd4VlEM+cQvQ5K6wZJKJGim5eoXJbqr0Ygd57
 RSaurpgg+TG7q6zK97W7lgmNAuf8sMzPisSJXokZnCFiNIJcLAGLL6WbvaS35BoofR3q9jFQFDV
 stsO2IKubIwGh8R2k7lBE+kukvNBjspgRgMW2q+WLP6gartfgMiPChR2QzLzkuxH35KLcY+OG37
 SG+rSze9LKShYJ+JFBkdylxmPWKyc5Rtuq75+HMP9aDmOd1PqNVSxZfc/J3wiUEePLjlIKNxXYU
 4qGI1Zhs+0ktT+2XRwCA0DD2ruJp+Fx6NpBtELI/6EbZhSrs4/hyJTb6qDs8s/nqc0C688v1hHC
 PfXWl30Zkzbhn+otAQ3m92tFQFIp8bMIl22BEQMgrF7BtR82nABtx4vPFeRYCkms7hE0tZs3PrX
 UmmPBFFjvyJueHDxgPzEVSEbr35NQ3i9RkGibDHMiDVmyj7rD8MCmqS6UGEy7UNdGW44RPf1Vyr
 rMm2uZp64T+LfgYi1+qCY24J1YukH8H+nWupUAlndXjin1RDB3PE0S5CMjbaNPhoCPhDn9kcuDL
 LsDAS8zH3a7XvODIMPrNfaG2bMgto7dRV0oSjPwGU+vKfabSd9sJSzE7j3Dz99FJ+007Pmhg+V/ 0YIJLw3r4Gm6XRQ==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240415-alice-mm-v5-0-6f55e4d8ef51@google.com>
Subject: [PATCH v5 0/4] Memory management patches needed by Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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

Links: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Fix casts in declarations of PAGE_* constants.
- Fix formatting of PAGE_MASK.
- Reformat comments at 100 line length.
- Minor fixes to safety comments of `read_raw` and `write_slice`.
- Link to v4: https://lore.kernel.org/rust-for-linux/20240404-alice-mm-v4-0-49a84242cf02@google.com/

Changes in v4:
- Rephrase when we fail with EFAULT.
- Remove `pub` from examples.
- Use slices for raw uaccess methods.
- Fix PAGE_MASK constant.
- Rephrase most safety comments in Page abstraction.
- Make with_pointer_into_page and with_page_mapped private.
- Explain how raw pointers into pages are used correctly.
- Other minor doc improvements.
- Link to v3: https://lore.kernel.org/rust-for-linux/20240311-alice-mm-v3-0-cdf7b3a2049c@google.com/

Changes in v3:
- Fix bug in read_all.
- Add missing `#include <linux/nospec.h>`.
- Mention that the second patch passes CONFIG_TEST_USER_COPY.
- Add gfp flags for Page.
- Minor documentation adjustments.
- Link to v2: https://lore.kernel.org/rust-for-linux/20240208-alice-mm-v2-0-d821250204a6@google.com/

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
- Link to v1: https://lore.kernel.org/rust-for-linux/20240124-alice-mm-v1-0-d1abcec83c44@google.com/

---
Alice Ryhl (2):
      rust: uaccess: add typed accessors for userspace pointers
      rust: add abstraction for `struct page`

Arnd Bergmann (1):
      uaccess: always export _copy_[from|to]_user with CONFIG_RUST

Wedson Almeida Filho (1):
      rust: uaccess: add userspace pointers

 include/linux/uaccess.h         |  38 ++--
 lib/usercopy.c                  |  30 +---
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers.c                  |  34 ++++
 rust/kernel/lib.rs              |   2 +
 rust/kernel/page.rs             | 240 ++++++++++++++++++++++++++
 rust/kernel/types.rs            |  63 +++++++
 rust/kernel/uaccess.rs          | 371 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 740 insertions(+), 40 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20231128-alice-mm-bc533456cee8

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

