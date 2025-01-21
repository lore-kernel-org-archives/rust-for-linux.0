Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC681E9B10
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454497; cv=none; b=Mgax7WP1HSjFo7nAXlsk+Kb+8uzEX4Bs+rN5+QSq4B7AE99KlfBeTYM0Zoza0zGVyhkFhLVZJkRf/cDlQC73aAjfnNrfJHQJLLzXyU3VdijbFTpe2CAun/k/i0T1ZPpu3VZovjDBiUqn7WTKR3/Tsx7Cff30VYRPxr6bn8hZ1nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454497; c=relaxed/simple;
	bh=84LGlajnIsiDyDNvcSBjiHBSqCRjx2vYfToPoBqxZzI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gIg8KQ5tPBbaSZur/ufNRdry0ndw0Z4rat8Vf9DVHMcIq7729sDqmE/GaSJRIB5M3ah9S/0jQTX7suyNRDh+lRmIBcziBcuidQiXMQlCLqrcYE2gic8dAhy9WAUFtkHfdEtZFTNhjAkQ9LHTBVY/Fcv74IgHNgTcXAfrJ6qpnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lQ50RW3+; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQ50RW3+"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-385e49efd59so2347738f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737454494; x=1738059294; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W9/U7tHRNXGosnB7a38NwWZkzN9loxC/pM9akOxlSo8=;
        b=lQ50RW3+dEXWZHMyBtBUh4h3ZGsj7Mv7bA+8tGM4KOir8HowdAkYkfVoSk1V5s5GeJ
         2I7ObXaV736btIrAOQVjibDv60ThI2KhVA/TwSy+Fz7FK0yTjFqnp/0WC7ZWOdexnbaD
         mZv9PyX+zCtcsoW7EnQst1pexu83ZPOpz1P6O4Qzztpme8iuFx5STPWJsR8SNsxSbsSG
         YWPRVjrsXJnpVRrjsD4hthN6fb8ufo3Fh1b7SGVOP5TE4p73drqC9BWIovbPldJ6y2cZ
         OFLSoZHOHAxDOtMHsBRdtClOLX/MQRuFNQyTangwi1jMp6oQx/2xlwnZKfq/g8Fx+fvo
         C9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454494; x=1738059294;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9/U7tHRNXGosnB7a38NwWZkzN9loxC/pM9akOxlSo8=;
        b=WAg2gDysXe0CplG1EorWO0cTbVCdpARNVf8qaYicWW5kEIySD7nrue7ONiiK5WQdjV
         hjYzVV6+krcPPLiFvZ6B/lluE/4IsU9+iuiJH8l2HK8vh2ja9l6SX5vmMWSbgxFoKI24
         tqFD20pvz1IUq4LTGsn6/+TzpKqHGNzVLwkDw5bBRigqz+DGFvt1ElydLYyYKpa39+br
         fTOgBV3C+AZccA4VOAymYU7BcDtSnGK31cq+XtXCdGq2DufikiaIez/nPf7qu6z/vnXD
         bqAfudaRJNnjaVNR+XY/hfbZOWacA2FcxzbKvzznL0ShBnJ6l74NDUbPbEgMTuEHVSKQ
         2WOA==
X-Forwarded-Encrypted: i=1; AJvYcCU3G40e01ZatntkSnXnvRsXdfKUpIyVXOI9ks4hAYbojj1HTqUpVMUtKbn7ypaRPAim2e/rzVIQS7hj8lQETw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTX2qWVMAhQQB1Kb5Er5qaLux+tRlxJIDoFM+MWZIUAZ6RGZ2E
	OXu97mVb+WykQ8bhciXXYX5gqbDE5sAs5v7HwNja3mY09CeZvfwmpxfrUvPdBZAVoSH+MhXZJbF
	Q4Wz61fo14kNhRA==
X-Google-Smtp-Source: AGHT+IHT75BmdFgnJIbblSR9wgGuPeOU5qQIZjFAPbXK5TlIPQOe9C5GkqpqZ/3Lv/eRrKYN79afMYyCFoOXQDA=
X-Received: from wrbdh1.prod.google.com ([2002:a05:6000:a81:b0:38b:f9ae:244f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8d:b0:385:f062:c2df with SMTP id ffacd0b85a97d-38bf566e6bdmr14664933f8f.11.1737454494173;
 Tue, 21 Jan 2025 02:14:54 -0800 (PST)
Date: Tue, 21 Jan 2025 10:14:22 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH5zj2cC/13MQQ7CIBCF4as0sxbDINjWlfcwXVA6UhKFBmrVN
 NxdbFy5/F/yvhUSRUcJTtUKkRaXXPAlxK4CM2pvibmhNAguJHI8MvOIKUTW0/wk8gyV7GloVEu
 ihnKaIl3dawMvXenRpTnE9+Yv+F1/lFD/1IIMGW9aPNQotSZ1tiHYG+1NuEOXc/4A/DRa+a0AA AA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=806; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=84LGlajnIsiDyDNvcSBjiHBSqCRjx2vYfToPoBqxZzI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnj3N/pmTInKWOLMNak/eE0knrxaujvqXwum9SO
 JCIUfCnmi+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ49zfwAKCRAEWL7uWMY5
 RlvoD/4vUTXzwtA3KJOanvr54vVqhAfAJVeEvAfcpvi2HP3Whi18/BvG2oc2c1CrdNR91Qp/1hf
 QN0m8XrWiajYwqQaQrSGcheAqPUiOh4jV4c9xFjgXODiENWH4fNy0AbhVTBtTfwfeOkXI4XWLNu
 x2hQ8Wn/s6a/m9jl75ALgG2K9hCoU2SEp3L/aQ+56cWFzrHjbV+jHAmgDiaEThnSfAQsgPUCxOn
 jD2u5xqmzAhkniilRRr3Nd41khAR+mPrj6AURNWMg4z6NztYPLvZ9bEEaYHem1iLls4gGwJ+2Zf
 nk9pa+5NNjvgltvsqObGngUXOBbvD0HdbnNUm6+m6YAkRKTIrqvBE3hqglEIyzd1SWjZhXKIjfU
 cTGQn+K/HIlqSlUh+lCccBQ2Sk4dj3Av4tUUNZI9W+STUcGBS5QfuOYgxG0qNih3/DGefG+TyUF
 M53YfZijygDhuDjnKS96C9ZG2dX8SZt3tSHiYVQjCvvmRD6nxK23ibrjpk2Upq2diOceo2H/YEN
 uvMWMyq4vTPfIcfhHfMfAx4iSUYKL6zyd4sJ/64d88O+hGD4ZseNF6OkiHI4kng05qbsW2i4veE
 bm1q9O8f0n/JB9adxccCoFXIhanfPVsPMkYXtVZZjKIh/hlwkrXhWJzPIx9Qm2YajkEAuf/SRPd +mmY/2ufmmyr/sQ==
X-Mailer: b4 0.13.0
Message-ID: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
Subject: [PATCH v2 0/2] Make the Rust linked list cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for more details and
motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Extract insert_inner refactor to separate patch.
- Make move_next/move_prev not wrap around.
- Add some examples.
- Link to v1: https://lore.kernel.org/r/20241025-cursor-between-v1-1-08913714aae5@google.com

---
Alice Ryhl (2):
      rust: list: extract common code for insertion
      rust: list: make the cursor point between elements

 rust/kernel/list.rs | 401 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 308 insertions(+), 93 deletions(-)
---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20241016-cursor-between-154bed859e27

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

