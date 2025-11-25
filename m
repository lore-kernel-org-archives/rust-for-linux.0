Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958D1324714
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079201; cv=none; b=k5D5YWYEi0AgHsQGksBX0RkeEqiR9u+yKnAUp+X4YA/g9T1b54Cy8rIOKEfH6rV8Z3GJ1TiZ6WNLiq3zveZRBe2ueLYM8cMO8utoJ+8Pz5jG6ubVUP/rYT8cpNazgiHxaeADCMUIdupMHNOQwlTZMCOgFcRscZNVGx7bLQS4Yiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079201; c=relaxed/simple;
	bh=7Lm4L7B0JSXJDytRz3uU8jk5LUez42F7IysaCo6TfkY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B+27kQxLEU539dzhapZGE94i5cyQ9ZpZ1K+/EnA02tp44pC49HyPWaEd6gcswckk6MTRM2gIkTkyNReVToqhuN3OY+KHX2N0j/KizNE/2ka5rgKDeVaajTUyPUO0OAe5bba4ph8Cy2fsN6wJl/bDf+AmIlhLXPdYeJczplLlmGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JqWaxDIn; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JqWaxDIn"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429cd1d0d98so4585076f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 05:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764079197; x=1764683997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJL2eYeGqpdi1Nu5380iJU2myJLCzrIUeqE1Vlfi/Q=;
        b=JqWaxDInF251NR9s2f2rKrZVk8SoRVsLplRVCTqUfy1w9rt2Qf8PaXBU7KJnPiBH0q
         Wb2BGV3+Qcvy/3r7DY1lc/qDzr1U0sC58Wt8gKny/3EJrZoAxvamqXFSEJgoz6uR4YLz
         sCdUzzJmTyggw4rRH1hQS3+2ZFxKh9ZzQZN8qL3kG9njiHipQT8C0bAlyZtkoV0inPR7
         ncI9ELpbfmdnIsqgkbysp8hhV8CqIoifX8e0YbloQBX5wa6W5KNtu5CKUvA+iUnCLesX
         EhmHMGdiTKRPaS+N8QHnr0LPg17/Nfyg9uykyck32zSikbDM1tg+5abWG4fVcgZ7XhgZ
         BX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079197; x=1764683997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJL2eYeGqpdi1Nu5380iJU2myJLCzrIUeqE1Vlfi/Q=;
        b=T5Ov8mrEGmVcOf/hqLNT3N3JtThlEHuLHr7rfkElPMv8NerGKDXSRYCtcoCEK7LYT5
         ZlfN6R8zR0iakbdhf4LSVbv13XvqWrAD+TP9ou8pcMI/GXnJdzE1J77tK7ise8UdovlU
         qdZ2LdPQir+FGOQOZ+85S3yCv1xQH2C8albZLJu2w/FNDKpMqmn/ppE5BLN5myB2GuHV
         XX/0qKWLg1h32ablvSnB27Ur35PLaHoW3Y7/3xzTv7nWfslkZaOYUb1WMgPElSCr97JK
         epXSGWMgrgPST4quEL8eS41f/lrtWOZ67jgWi9AykB2JoEs8/W6p8KfFbe0/84ZqHOlv
         Z/7A==
X-Forwarded-Encrypted: i=1; AJvYcCURvLA0SL+BxNUPfklqZEnx45vZcNjwqf7kqgQthsCuVc7EoR5B12VayvWnFI1D1pfMonmH2WQsMGV0z0AGaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMEXc8odtFkSWS3mk2jCR6kYTwIdq9mFKASeqqXfCjOQ8a9pF
	HW5IhPaXKOu4tG+cPYlWKmwOB4RPaaE+iFbvD/PVeG6gCuib4yiKjaqLjQ6XrA/0IKF+sCpcG7Q
	mMfJZIJfUH8B6jrc3Yw==
X-Google-Smtp-Source: AGHT+IEyeAgM6t7/dx19tQPq32ePVqS87dUHrJkZnfELERMnuGJQ+/H1zVgXRFg/DoKwuDvpjgHvfGYzoZsRUmw=
X-Received: from wrqf12.prod.google.com ([2002:adf:f8cc:0:b0:42c:c2d6:29b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:401f:b0:3e8:b4cb:c3dc with SMTP id ffacd0b85a97d-42e0f1d5890mr3161753f8f.3.1764079196864;
 Tue, 25 Nov 2025 05:59:56 -0800 (PST)
Date: Tue, 25 Nov 2025 13:59:38 +0000
In-Reply-To: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7Lm4L7B0JSXJDytRz3uU8jk5LUez42F7IysaCo6TfkY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpJbZYblPctXPrCXfxhBmnAUqceO4bNbw7uKXEz
 sAl84kcBaSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSW2WAAKCRAEWL7uWMY5
 Rr5ID/9YP8uj7WhTFAyf4iLO1Ty8Nis/q8pafkrxeO5iZ3DXkikeMkBxuYxRy7cPRLhf/UA65HA
 YRMHkFgMI7yBBpWkWwqkGLsaapPsdnjAvv10pbO5qyhM1GqzFv8X9TmO7x2nY/PmzwD961+fQBh
 kvovD3nQ3kiUXapUI6QUSUFCp9W5rRScIflBgu67vmj1IMhBhCc4J60/C2YgkNeSruEJc30RU2b
 ld4qa48s18FVCRV4vwdWxz4xsm5zOXh0Dmtdq+wMBG+zqfNAW9tTFbLul0HI3QpmIdtLZuVZUSZ
 PIfktEqhFqxqGWChS+cqKL7GvxF8wlZJ3NuoLL1hiEtIRQunrqJI+HKFkiFeeIRrPv9cOX+aHeK
 iesIG32InAD3wqncM6R/Jms4QL93dbb0Ee2pemBH7U016VCPYnBJXumvHlFiPgZCqY5SjeEl72W
 sCqWJBMpizJtYsHbmc8BUMQNzPv5U0EWtrzy7LMu3juN9HcHdPSOjjxQkhsxzbwnp2eStXobm3l
 6Odm+oWdsCvhcTMgWoBDLloFSReIpjW4N994UiOR0mFwPOcLhLxJNk7fR1i7jCZHC2CukWQgNCe
 CuD+VJTd1dlYMZrXb7w5AVCJsRmSRmO7qx+OMudWSpukp3HLzTJFuSE5ZK1L+hjG+cugXMTHAuu g/edqGMXUwtkoHQ==
X-Mailer: b4 0.14.2
Message-ID: <20251125-binder-bitmap-v6-2-dedaf1d05a98@google.com>
Subject: [PATCH v6 2/6] rust: bitmap: add BitmapVec::new_inline()
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

This constructor is useful when you just want to create a BitmapVec
without allocating but don't care how large it is.

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
Reviewed-by: Burak Emir <bqe@google.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/bitmap.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index 0705646c6251a49f213a45f1f013cb9eb2ed81de..83d7dea99137ded7cba47ec5a3bf10bb7e13f2d2 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -230,6 +230,16 @@ impl BitmapVec {
     /// The maximum length that uses the inline representation.
     pub const MAX_INLINE_LEN: usize = usize::BITS as usize;
 
+    /// Construct a longest possible inline [`BitmapVec`].
+    #[inline]
+    pub fn new_inline() -> Self {
+        // INVARIANT: `nbits <= MAX_INLINE_LEN`, so an inline bitmap is the right repr.
+        BitmapVec {
+            repr: BitmapRepr { bitmap: 0 },
+            nbits: BitmapVec::MAX_INLINE_LEN,
+        }
+    }
+
     /// Constructs a new [`BitmapVec`].
     ///
     /// Fails with [`AllocError`] when the [`BitmapVec`] could not be allocated. This

-- 
2.52.0.460.gd25c4c69ec-goog

