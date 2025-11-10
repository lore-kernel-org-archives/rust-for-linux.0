Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C1310629
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762779978; cv=none; b=AkITxVt2/hwu0oZZ+ewZTt/i2yDmNn2chNAMQafD83mYyzF40pI4JyRur8ENsTuqrfefJyCfrdKcQLlVi0J7z9JRY3uSBluDcFohGcGa+SgAsqEBYMsM7tAIZsh4kv5YJi22mTQ4FWKY3b81LMVOSi+279B7St9wFK9EQdjcBe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762779978; c=relaxed/simple;
	bh=5yWWXBJ/seWzcBWVusBVihezy0B+tB+i4oi0yNZtcHI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=alj9oqotrkcsAYTTPVwY0hzdTPCEfcTinK91SiOA3DbH2lJKaoXSNkqK3pgq2MZBX5kpxxt+xjYn6kCQzVkhQxdJ8GKDyMJDYWlwrUoYOg9ekjW7VF4M0x9ZkVwZMBjYqfi+HeWBPmCWceFyCC0muOiDVupG+K6jD+NZyxZXr84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4jFeWqDv; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4jFeWqDv"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b726b7d1f1cso219772266b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762779975; x=1763384775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pHwGxOsEvh8XnVa20cTuA1Ds9gHFTZACgOX8iktePx0=;
        b=4jFeWqDvGgm0nOScpVbFGNmAd53ZAgUpzIvtOFAzOgH6RcSuRLQRymoNJHYFhTc3DT
         Bc6Gp5xXGMd9HRFOhz9BaGTas4odhKkK5l1w+jqanY0KLMPGHdASL1cAuNW39cjcZvk3
         fzEM/2g3+mTRgeTA+QLeOKpT8uNXuYZ82PqZaySmqxqJAqSpFyNAHD9+ANr3tyEgkeRu
         JotrQkjxnTff3erKHe0jVgmaBrvCS+4OWrpNEmNKHn81gDYRUeJI38BTrVO3OJW7Va8c
         OO38F3oLgKjs0mdIeFomUXmpgFVRSFktMVo4I5ChF8dbLGLkmElfEN+blx7Y6DWFJj9+
         raCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762779975; x=1763384775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHwGxOsEvh8XnVa20cTuA1Ds9gHFTZACgOX8iktePx0=;
        b=v6PB1kPY6LFsZ5upmy1opzHGiMWF2FJ5OmRObAqSwAt7gcn3LWrvvf/wv4ij6isKe9
         iCertJW4V/+GrxNnfpFlxPZ9TMy2WMYTs2alvpPyBmZ5tzD2ot/zIjvv7UuHjK9DJnwr
         OodebpUDpkN8srq2jTanpInVvkTSRshDr9jTjoDKDcP3vUK8CO+jOMRkM3x/7ktKVCdn
         GmGuFro7ui3aNMaXv1V8rlVCTwu4zAmLHovE4SsDTVKXMU3vJpZdZ3Qqw2a9tsQAcepN
         n/XQVJOdUVG+rGEvcfFuBBxrhYKzFEh6/SQG7eH75ZqcOIgIrOlkQlzC1EUaPLEurRTb
         Am1A==
X-Forwarded-Encrypted: i=1; AJvYcCWcg0/FBAYCKCLGL8AdABWHii6e0kLpqVdvzGNBkm3mqxE5/9xbWuJPLWo0w5MlUr3m0WW2LF2ZhTcZ2z9qBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbbr8npgW8RoVDqZLhvfy1L1XeL/wgk6Vt3K8bZKR86y38O1ms
	dYS1+hGxePejYTv4lwTEsBeJ1+ZPIrc05PkUh63mbY2ETSMCbOxth3wshEa83fuTXhd49zmLevW
	RtinquLdLUhn+I0bjig==
X-Google-Smtp-Source: AGHT+IE7fsNymb3cAzuCb6+5n3SmW/7Uo40AyZT2QxxNiGyJJ40x5ZPnFv3m67RlqsP8fqRJkgKNNkgdGcvQVuw=
X-Received: from ejctm14.prod.google.com ([2002:a17:907:c38e:b0:b71:5dd0:8e42])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7246:b0:b72:aab5:930e with SMTP id a640c23a62f3a-b72e030953amr903743166b.16.1762779975531;
 Mon, 10 Nov 2025 05:06:15 -0800 (PST)
Date: Mon, 10 Nov 2025 13:05:55 +0000
In-Reply-To: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=5yWWXBJ/seWzcBWVusBVihezy0B+tB+i4oi0yNZtcHI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpEeNDKRkmT+eOFgF8qJNPqMuq73VthlH6qF02U
 gm/b3pc2m2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRHjQwAKCRAEWL7uWMY5
 RgovD/9UPkoV9/Kw5N2FJvKeN4yQg2mNamCxIoxCg410jOoQTCh67qNkiYf86ZwyW8r8GG3MWqY
 qH8f4IONzFImNn7/0e628fJWiKwDyMWkQ/ne/UMTmbENtdNE86kce3vUnV8JoxwP14mu4UwBg3T
 ZnL8zCmdXaUWCqarCQXv22vYx+cwSQhk4SnAFcrCNwmVZwWzd7ieh1CLNULkL+4q/IdN3TuZP+4
 JWEm2ff3E9XX/FjdMKLTRJN6iWfj5Yntx2kjpS2fNLNUpK9rOkjO6xc7FZj6UiPH9Fba1GssHsI
 wDfcPe3Wj1arPK7027CA7WAQcthCNJRhDzkgRQMGg07pVXzgmLVAkNsuQ4DNcozA816NuogzeQv
 Y8V/x0Guce+xnkXHeNXpeQ/2XpmGu33+o0J8bVMDGcOWh7suzreLkADlMzrK7My4auA94o8zPPG
 W2KuCFc6XnQhunaHw6c7PbwAdzgBErEnSFUyo3rOPLivmudr3S/fwX3bN+C3fNEwoCuKSWEnZUm
 MaRlwvcZDl7grb3g3xW4qeDEBRJNZuJeZ6aAWucXPikb1i0kjTZLiOsjfTqK8Az8AezfOWaBH4/
 v8AfosvP2PI3ebNlvZZpVGirKDdh/CB5AkB5l+8VMCxZcA3LA/IZrVPudctSuBcqrS3GYjXaExA voaqrbMLunNLsgw==
X-Mailer: b4 0.14.2
Message-ID: <20251110-binder-bitmap-v4-2-5ed8a7fab1b9@google.com>
Subject: [PATCH v4 2/6] rust: bitmap: add BitmapVec::new_inline()
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
index 15fa23b45054b9272415fcc000e3e3b52c74d7c1..f385a539a90ba87a7b9f6d686e150e95e358bbef 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -232,6 +232,16 @@ impl BitmapVec {
     /// The maximum length that avoids allocating.
     pub const NO_ALLOC_MAX_LEN: usize = BITS_PER_LONG;
 
+    /// Construct a longest possible inline [`BitmapVec`].
+    #[inline]
+    pub fn new_inline() -> Self {
+        // INVARIANT: `nbits <= NO_ALLOC_MAX_LEN`, so an inline bitmap is the right repr.
+        BitmapVec {
+            repr: BitmapRepr { bitmap: 0 },
+            nbits: BitmapVec::NO_ALLOC_MAX_LEN,
+        }
+    }
+
     /// Constructs a new [`BitmapVec`].
     ///
     /// Fails with [`AllocError`] when the [`BitmapVec`] could not be allocated. This

-- 
2.51.2.1041.gc1ab5b90ca-goog

