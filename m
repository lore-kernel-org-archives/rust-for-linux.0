Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29B2E8E1F
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648928; cv=none; b=jZa8rbJQ+3W8LCK0CMMZUqsCJIA80io4/stzt7U1LCqjJVpI0IjqB243osYc0Twz63TU9ut6WONVUX5//IBGarjiZeC3l5EoB9utew/LYeFpFAOAyJ+o+Jcb2SrCVMPGyGaRvuudpJypqBN0DgT/0Pu1IGxWcNwxjp1FXgL9oY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648928; c=relaxed/simple;
	bh=UE6ywXPRJUbBb9cAsX9Hq9tzePOnoCU35bVTMfeOOMM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Zj2sMgNGhVFWKZK83Aw8AQ+NYTGHGoAdNp8MwZI2nks2U9o/1cfiON458Bz9Tl1hKIugjzNrmGSiSG8JPHN2TF79/rEzJoTTAVzf0FhrLfCAjRkS5a1UnBpsKajeihhLsTjLYw9SyBVH1elAxrzPb/rmN5hQLKUbE9r+aSUVU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lstSjdWz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lstSjdWz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so33203045e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761648925; x=1762253725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l0c6uBRSvj90qkJBe+2p1+Rf+B5WpDvsjaWD6176zos=;
        b=lstSjdWzjWj/HXRPOfILujShNm02vidO75hTI0TL6MEES1xnJAIa7MPmHQ3/2mvO8J
         9QEehavIc9u70sVgjvPoNv9csvg+0p8/2OzIjbGZR5a3G4Zxh4tN3wEMAII7Kk7I0Ywl
         A9b7NcDJyMahUYJ8qS6orIBCO3CNg0JIsQlQTilbMrcMl3G3iJ+N5Y+ydrAJMjzTeqbY
         l83WMwDOBARMx6WSYuLyedJm3QtBQ1UI1wFYvUYXmeGOgNwLv090xiZbS4a7ddDKDzfC
         msJRgMbV+OzX6rRqSM03i380MIaAruqGKeQkSV8sm6ErXExApTFfH616fFgg+jnocJ28
         AgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648925; x=1762253725;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0c6uBRSvj90qkJBe+2p1+Rf+B5WpDvsjaWD6176zos=;
        b=vOMnrNG31/T4xyB158PMA6sDKBT2zFNaCmXr1okUDCk9o4DvK6eOH8cF0XaqfFurmc
         a0EsdFGFO/EYn3/ji6oA6jsxxZPWfxj8gALFEWmgXq7pfR1yx/LGkHDKyqQ7qANp54J1
         qFKN5LZUnTO2h3TG76mU2PCh5VLN4VbIpsqsOQmzO1qg9M9qZ7wvyo7vsF3b1mQHJub5
         n5IIbdvBStOFyPp/CaCmu18KPg6ljdGa6SR77YjiSuqg58NqxX7QsXf5m3SLaSdVeoSL
         ui1Bq0IqoSXqNSZg28WS7k0/kZKKyQjdKT2rOGVmdSOv3p/5O+u5N2kwd6oWKQKOnWiq
         G6iA==
X-Forwarded-Encrypted: i=1; AJvYcCViXBHIxFS98AHq4saWxwE8sL+1ut7UGY/S6vWrZPDVzJjoVmFZMxMFFG6oS+tYYfU17AlBwIJkCj8InsEv+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNaF/6jlj0SNBFz492DDMRyBCEki8+cq/K4aJrQEHOFRpEaXxF
	2FZb+l2XEZygVvqS3RBxZdfdyqejEebmbbuVLwftr6N/dH5RtZQpKabXjOLROJXEgbuZGcE1ids
	ij6yYhiorMXEyPnlHgw==
X-Google-Smtp-Source: AGHT+IFzmh1BhBeJBjuO029iK4qw9Ix8hlxGx7v2jqCs8ObbbTFbar6Lj/km5aPi04Jxsj1XyWO3V0iw5i78R5M=
X-Received: from wmbeq14.prod.google.com ([2002:a05:600c:848e:b0:477:15b8:8ef1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a013:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-47717dfd41fmr25732385e9.9.1761648924955;
 Tue, 28 Oct 2025 03:55:24 -0700 (PDT)
Date: Tue, 28 Oct 2025 10:55:13 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABGhAGkC/12MywqDMBBFf0WybkpmirF25X+ULvIYNVCNJBJax
 H9vlC5aV5dz4ZyFRQqOIrsVCwuUXHR+zHA5Fcz0auyIO5uZocAShKi4dqOlkGce1MRLpYStpWw
 1tCw7U6DWvfbe/ZG5d3H24b3nE2zvt4TiUErABb9WtSZTG2sNNJ333ZPOxg9sSyX81eGoY9ZJl mihQiNR/+nrun4ATDIn9+oAAAA=
X-Change-Id: 20251007-binder-bitmap-5aa0d966fb1f
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=UE6ywXPRJUbBb9cAsX9Hq9tzePOnoCU35bVTMfeOOMM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpAKEWT6pQMlXT7Pn1PIG6vgJTTJY+ROhWS9Q/J
 Oti+0jIpqKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaQChFgAKCRAEWL7uWMY5
 RlmWD/wMZGxAE60Prw2gR0J7Slr1yBQGjdOaXVoqHfPaZ4/HDFGkFLIvwY/JvBdGge8xQzYQ4oL
 7kFYHBTR2biHfPzwmwFWpd8T98Tyj5u4Al9zKa1vRIympmoK+lQ9vEEDPqSAFkikhUek7pNJcEL
 JS9cyr9WoAHgSd0Zy8cFgnEb9zMFKM1Om9sR0cjgMlVFyrp+rROdEi+OFSR6grc+7+SnqKibMtz
 GmeT8G5lJBMz9Jx/oPT89ZDnmMZ++dIDFMuHIBobW7vPajJ3v1YDDg3kCLWFiqHGFeoKxbkmH9g
 eEBQzt/UOQqxFkwER8094RHv/BFYQDDfVghJrNMXq0syzoMAXn+Dkd7u+OWSpWaXyXbhwF4+mpJ
 bLLFoF1aYb9MSrgZJjb3hS9sSw4ErSmijyEmZC9jy7u9NJz7ppmw8ZXtOuOtzsjHhdpA3clVYeI
 4hBPSdTqRV2SWzeDH4s7lpg5N5/MujWOAmDGnP6FxBL3m/MpLiEq9IwkXmN9ZoqYpA/E8X1vuo9
 WT4xE4zf04VTSjo6GxW3eL/8Ck6s/K2VdU4ml7HuXfinW6WdCMW5E6BENAgU71M5KSMP3HcVXNl
 bf80MzJn4wuNNjUAsaRcF0hNnQHX/WFfuiIV8Gsdiqhe5TiIKkoCmo+qiHIyirMrNBA2T+Dugbu JNopozjhQw7PSZA==
X-Mailer: b4 0.14.2
Message-ID: <20251028-binder-bitmap-v3-0-32822d4b3207@google.com>
Subject: [PATCH v3 0/5] Use Rust Bitmap from Rust Binder driver
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
Alice Ryhl (5):
      rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN constants
      rust: bitmap: add BitmapVec::new_inline()
      rust: id_pool: do not supply starting capacity
      rust: id_pool: do not immediately acquire new ids
      rust_binder: use bitmap for allocation of handles

 drivers/android/binder/process.rs |  63 ++++++++++++++++------
 rust/kernel/bitmap.rs             |  26 +++++++--
 rust/kernel/id_pool.rs            | 109 +++++++++++++++++++++++---------------
 3 files changed, 134 insertions(+), 64 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251007-binder-bitmap-5aa0d966fb1f

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

