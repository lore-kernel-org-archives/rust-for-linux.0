Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17716FF44
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732355441; cv=none; b=Up69Lzwkeho2bHAJSzRkMyDoo264T2j9SL3L/V6spN3Q0wJ3Z6MA++8iAT7sEsGgBr/rNRZOBFPrwdZk0UMPPyvJDNf0e3ukUUt5KbWaiNIp6EwKi+aTIguwTmogTMmZNH1x1qRQ9mYHgDEdSADN2Hl+LrLWjMbDvtt6rSq1pcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732355441; c=relaxed/simple;
	bh=SRiP3n15qooOFZWg5xLnUkjZLAeC3efqKWwpTwF6rLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxzB1dVdzD8aIC4xXuCJxntAJbfcZS5DS89Ml6W65oQSuxKfHTr3oPxs5UWWHU7LgA7xL4vme+2Ff2CBCkPzfy0K8QbPj2rfndXiu9UEZOExUidpNfjBCoO8P/ENIgZXDKRIkl+baS52oyf0ex7R4QZISMSPLsBnpB2IFJXrnpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=GS0fexm5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="GS0fexm5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cfddc94c83so3529896a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732355438; x=1732960238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXnCDWRQwhX+72UPQl79xPSO4w/gNRm5H1gNcEYnhfE=;
        b=GS0fexm5ySzKzeoB3/hpmrcQNASrBcwQ7Ez811bPapFPrz+FFBAn2H+GuV4gt4ymPN
         dFwcbhQXRw+4JJ/3+d3OOVPWk8XVKTVKv/rIZGELnRCXUgDFKkwP0jSoErIqxe0vjQVh
         wwNeMVPH4z5TexiSvDg+ert9YVEK5jfpRMmfqM2KzJm1YzGF3IhERQe0s9DnPYl79sMr
         QF51/wZPKue5pCWryUPU/wgIDR/7XFUpoSj1TYSmSVBW6Yeblwpcf7e0isxkAO16DLAs
         gr7GJHijxvxKE3cQjHZSPQ4ueb7QN3nxnfFuftCiP7xcGI2NtoysOqWCcKfre76janTx
         HRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732355438; x=1732960238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXnCDWRQwhX+72UPQl79xPSO4w/gNRm5H1gNcEYnhfE=;
        b=MHVZYqz48x109djcM5G2rNDV0XoRCewFNLfM1+NPxyhE95adfE8yrYAdy/TEsercKU
         HDSotJpGxAHRg5G15xkFW9BuUA6eEmrSsnNb8hVKOaxOLBK5gFqgajdNQF0B0wgABnSv
         aD1D4Jau5B6bMi4/AOL7EMc14qKBKLGmRX4jLnwCho1JfiOO9NofBHK9yzIPixDFE85R
         zP1GVo8IW8GniQFWE629PIP8dUvj7M66wZKnSD8uYe2v4Zs9tzl7uyNbfo2yK/aHwxzP
         ivFbCWlSMQli/wozz1mSj0rbZgbHw0aUaFtubJEYj0zSHFBH8JHJBuOqjIaP1b9D+bIT
         7sUA==
X-Forwarded-Encrypted: i=1; AJvYcCVdkvH6s8Ii6LHr1Im+nY5nxprW3LcdzcB6U2B9nBwYipkHKcpGNHwwFxIDFu4LraM7B3J62jOvlZmcqh8Tbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEyTYXm+93+Plnv5jUbgKSN6hq/8EZW98JMXySe4CHbMP+e2D
	J4q5kITVMcMNgrvUWphMQeZBYRz0EoFYBxmjZXlFQ6rv3/uymY4SAEHrWoXznIE=
X-Gm-Gg: ASbGncvNIvhs2T+ybIovKtdZkzqhiPLQex+jUKCVvUk9vOV6zj05Y8YSh9HW/qhksAw
	M0xN3lWCUD07UWc2mEyu3xoWznAnFVlChwScvQi2ewdqDkvGgCnTXD9zDAvImOglDIOhdTo27Y0
	bMR8/12GjPjHNK778By7A6tyOyCdVUuvdY1UFeDTBh60OdZb1b6HxpI896rFkdHTP2d//aHk74p
	rLlL4cfdwSCSjFy9sKTCFymasEUr9422ZV0R4oZ5N4=
X-Google-Smtp-Source: AGHT+IGtcuYMIUUWJ6eJPHvFs81uyykzxtQnloBl06TEtahrvF8Lp2FB6hbuRr0tnun6f/F1rWeY3w==
X-Received: by 2002:a05:6402:2682:b0:5cf:be01:d7e8 with SMTP id 4fb4d7f45d1cf-5d020798b89mr4873762a12.23.1732355437759;
        Sat, 23 Nov 2024 01:50:37 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41af39sm1806918a12.82.2024.11.23.01.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:50:37 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v3 1/4] rust: kernel: init: replace unwraps with the question mark operators
Date: Sat, 23 Nov 2024 10:50:28 +0100
Message-ID: <20241123095033.41240-2-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241123095033.41240-1-daniel@sedlak.dev>
References: <20241123095033.41240-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use `?` operator in the doctest. Since it is in the examples,
using unwraps can convey a wrong impression that unwrapping is
safe behavior, thus this patch removes this unwrapping.

Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/init.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 347049df556b..81d69d22090c 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -1076,8 +1076,9 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
 /// ```rust
 /// use kernel::{alloc::KBox, error::Error, init::init_array_from_fn};
 /// let array: KBox<[usize; 1_000]> =
-///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL).unwrap();
+///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL)?;
 /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
 /// ```
 pub fn init_array_from_fn<I, const N: usize, T, E>(
     mut make_init: impl FnMut(usize) -> I,
@@ -1120,8 +1121,9 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
 /// ```rust
 /// use kernel::{sync::{Arc, Mutex}, init::pin_init_array_from_fn, new_mutex};
 /// let array: Arc<[Mutex<usize>; 1_000]> =
-///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL).unwrap();
+///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL)?;
 /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
 /// ```
 pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
     mut make_init: impl FnMut(usize) -> I,
-- 
2.47.0

