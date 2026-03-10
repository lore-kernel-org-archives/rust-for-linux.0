Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161163043CF
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154435; cv=none; b=KegYVDHTDf8ttxQZ0UyoLXpJ1XyxWaXJv1VAyipL+byCHwtE3UTlGEOFNaT7OdAQlC0TesrwB4Rz8V6gJNgJJ9iG4zZhX/yElF82qlLb1NAZCDYGk434DzVuqw5NReB4G6WsCrbEtn/QJ4ex5vjMdtdSOu9sg8TLDe0OhJSk7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154435; c=relaxed/simple;
	bh=o43fn1ouimE6mF7fFJExzH1ZAIFH5SPKWzvmwJePCi0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MjbvyLtOEUunhujYuwiywiUw/0VZKnIq412mj7xqV8TmTBmQU61PFF1DH0LK25DcTq/rpLopiqZMnuX1C0NCPS4V30kjTq5K6LhHVUAlUfBLiPYkpbxo4s1iYibvv2CRL84ein47TRTMlsiD+wYHSTSU53UBq7Iy5PVvn/WCuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aO0pe2HM; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aO0pe2HM"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-660fc3f2f90so6736970a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773154429; x=1773759229; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=umUx7EdRQjvOw+Q69mYvYZUiAUsBvG4iofWGqoVTOxw=;
        b=aO0pe2HMGX0i50vy0O1zp7fzwW20RzVIghG913xepVrMO5MkdjWv2AtXuYoezaIZq1
         9HuPyQKQoSYTcv/fWbgF5uAJA2pelvhFT1lUjS85HVHGSq00UGBchx6M9F+9WNGnGr7o
         xbPE9YzfLQzutuXRDY9GcLYGtOYV2lTFIKrcCabACrg5/pFrUisHUJv5pvGOPnXqNwuR
         cTTxGw/uovqFAJs4F0WHaNBMurTB0qiTpn5+LLZKDsg6HYym0pVj/0k1Y+rimovybC5R
         1VjUf0AAWfv+muFtNUUfDqVyqZCNXRBnjFcDollOAfhKDh2wbmXvv4afZ7dHCIBErxP8
         luig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154429; x=1773759229;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umUx7EdRQjvOw+Q69mYvYZUiAUsBvG4iofWGqoVTOxw=;
        b=oGaQ6KRF0g/bhCskoZoOz5xL5sUkHpIRVmY3/g0f+rSRP7tWhvvxmXtDN4oMtyYmJs
         aqwxjX73i4gSGpAtMZoxR+W9x7fHovX/K4g4MQHm1TgVZMI6OUDRJf/XyxZuwc2oqw1H
         v8efmda7ldE1qmg+VHhN/b1nQFlhRMbJ0BFUVbMvSubHfpvt9mM7qbIs/n5yXcJZt2ib
         GCFm3Fv6M9qoBL/nWEJKhEr9hqviX6MYpFQnqo0aTZ9bYYE7rvQF4/ubbMS0PoJhVfqO
         HarwrbEOPF76nyBYLEuH0apPLg3BTt/1hLxMBn/96QL0i1eWw/+guHlDgzfJGCD9BF/7
         wXJw==
X-Forwarded-Encrypted: i=1; AJvYcCVFWpZDqYYUTl+HQIQcvNbInuUilKEaK9JgoNJ7T5rVurxVnTyYEcUsuOWW2eqSdXcX8jvqztNHxMinChk9Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3g/V6Gr1oaQvzzVtzjcsNBrRzWcW4K7OLB6+7UZbRFYeccFV
	tIDlCrIctK8tT353SSQf2HF7r189AO7FdOGx7TZGy88tuyozbRhD1+UrqGW4wC3vZuaTcmZ9Uvi
	EtFPFJIBrDBt1NeZNUg==
X-Received: from edqx3.prod.google.com ([2002:aa7:d383:0:b0:661:5b68:9ca7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2550:b0:660:ce49:f6d7 with SMTP id 4fb4d7f45d1cf-6619d54104emr8439961a12.32.1773154429060;
 Tue, 10 Mar 2026 07:53:49 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:53:39 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHMwsGkC/32NSw7CMAwFr1J5jVETwnfFPVAX+TitJZogp6pAV
 e9O6AFYzkhv3gKFhKnArVlAaObCOVXQuwb8YFNPyKEy6FafWq0NOk6BBL3YiTDZkVAdozKkDiZ 6C3X3Eor83pqPrvLAZcry2S5m9bP/arPCFs8heqUvV+tcuPc590/a+zxCt67rFxKQca6zAAAA
X-Change-Id: 20260224-binder-crate-name-15f14e134fca
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=o43fn1ouimE6mF7fFJExzH1ZAIFH5SPKWzvmwJePCi0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsDB3li4s4TWFx1ynTkM4Csg1XBDsWC7do+pzT
 znZCU2T85eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabAwdwAKCRAEWL7uWMY5
 RhrrEACNZtRiBmEQwxDvpLcogFCd0JRRF3IUQ9TZ+5BbVjQnFthkvHlw4R8ZyFKxHrwy2UEahLu
 yiJJcImTyx7Lt2jkUEidrLs0t2k3Dz2XYtWJ4c4er15WykXd+2vgfSMIq5Ar5bn51NTt1UG4lLW
 umDlsA5Hu5Rn1NkQoKkUXjiCR95wtUIhJ2WhXwQesjmfp1FoaFSNprhXm6EZn1dOE1UWGbJBVp2
 EdgzxqP7qJo3/8dCtwnpVqPb7EfiKOC65i+xgMzlL6uwXyLW/i+P7vrDLBXj8eZrTZ8xtBcfyNV
 duNABUgMRrfHpc7j5QfyMW5l0G6iZikB7rvCq3FxGAUVExSd3bNhwE2UNpMNcmhLylCbOG+geyx
 Lc5Dn0VPmVemOUqfzZl/+7nlhmWH0ZZrkVWGABv4Vw8P0c4MTAwUARURXab+THrORl33hfaFwGf
 IGIqzJX6qZBd2nW4foDo8x15coMUsLbrFyM0oWy15Opfq/MuE15eTfkOKN9D5cjyqiqhFvoSCir
 mylUx2e7TVYOv/HkAwuvQ7X90t4NYhfc5dblDWBkcTbJ+/4cjtqcTmoCy0ls3toXPrMF4vz5RZS
 WS2KYlI2AX/f0x37k1jjnBQW3sMthuXttDq3aWzsaUX/OyA/QGKbmXXiBYjnJLJy+rEvD+K4i4h G8fuRWhILCsujWQ==
X-Mailer: b4 0.14.3
Message-ID: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
Subject: [PATCH v2 0/2] Change Rust Binder crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently the crate name of the Rust Binder driver is rust_binder_main,
but I'd like it to be called rust_binder instead, matching the .ko file.
This affects e.g. symbol names in stack traces.

Thus, allow use of the #![crate_name] annotation, and set it for Rust
Binder.

I tried just using RUSTFLAGS_stem.o and RUSTFLAGS_REMOVE_stem.o, but
RUSTFLAGS_REMOVE_ is incapable of removing the --crate-name argument.
(Even after changing --crate-name to be passed with = instead of space
as the separator to the name.)

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Do not pass --crate-name and specify crate name using annotation
  inside .rs file.
- Link to v1: https://lore.kernel.org/r/20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com

---
Alice Ryhl (2):
      rust: support overriding crate_name
      rust_binder: override crate name to rust_binder

 drivers/android/binder/rust_binder_main.rs | 2 ++
 scripts/Makefile.build                     | 1 -
 scripts/generate_rust_analyzer.py          | 8 +++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260224-binder-crate-name-15f14e134fca

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

