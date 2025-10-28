Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E762E8E1F
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648930; cv=none; b=OB9M810oKkgMIol1WlY8DEi8xzqEvSjlmj2s1jq7jxy6KbmK4YfKF7U26SG36STHMfQYDBUmo0vVFxubhQlP52Lmjb5XnVCTeiozJHxfSzeWfdY0wEVv5FdpXz2E3lBxQ9uEe5vqkxDx9klaGmkT7XVgwe/p0SuTLMQsgmm6lT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648930; c=relaxed/simple;
	bh=u5cQmrhUMazV/NbgrGa0POvpnkdiyA3r9buDRqet4wA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fZCnyQy7BTkqIV/TPGabE6mn7yeTNOTyPdm+TJapgL9T4O+e2LRFAULYf84LAZAxmK5zqweEu6dnRKsgWyevaMSOCfV8QN5AS671+dux/I9zAUmIpqrP5YyHkE1iGKl/FxV7nyYSryYdE7r9MUMDIohLiK6LFLI2mnY8X9Ug+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+5owXJB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+5owXJB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471168953bdso53549375e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761648927; x=1762253727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kA4eaFrdLr1JSkUKeDkNkT7+AEWbhQjt26vQGgnU0WU=;
        b=n+5owXJBrA6OBuR58/vANOK5DUWs5eqhheUaAUbxhoHlI06A0r6kazitHzh8HKVIv4
         Gaq9wc4apDpeE49kUj4OL5flb43Beqr6iGVvnwBQAb/fbvtLqsL1g6FbxAeGqHliRRz5
         2vQ6LTKJI6W8RfkShShThdSlCuHmIzngoyIdXv8f9TQBbqtyO6aKLqRC8+phOVxnZpU6
         g3GdPgigi5t74J0eHK4d7d03gF0Y2SqgHSq5187JAnuG0sIlsftSTZ5Y/WNssUjiJ06c
         U6pZu88JCI7thl6idwTBr6aEaPwy2oNKwhQSqsI6J45ikYz6xoBOTRP70gS+M650rjSC
         0zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648927; x=1762253727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kA4eaFrdLr1JSkUKeDkNkT7+AEWbhQjt26vQGgnU0WU=;
        b=hCkppOtyGLF5NLeWUJHh3Q3hEWC5nJxLU3qmZO1Rc54uNfP5X1bAaQ/J5PeV1/FvIZ
         OYLsQ2H9UvJ9PbULomCD2vh3+UY4NhcGNn+RyJ/oFF3ho1vi1eZtow+pCopzFyOjwUTX
         rycGNG69itoLMuvPTUax+kqDgI2gds85tm+8qQ3j1+vj/YvrcmWSJFwMouR5alHRMc17
         bs3LCL6nfVl/0pfrWv9fbZDjBSg7N87ddtsCTi5Vgt4ddsypUb0nVN8DJ+CC3ZzpBACF
         F2L6vs/6p9N07uio4UFT7TkixoVECypcpJVTdOMH2E0avCCB9/gXb3zBGyzMMHaTIkAg
         dXtg==
X-Forwarded-Encrypted: i=1; AJvYcCWKywbnuofJ6QBDgTSOU4TWIUvBU8fQOhzHbrHKWsttVi6aYlrnzsHpJ34e/2KRXw/R095JBzF3kFWS7vMUgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWChuo13FRYkNC3gOn3hsxeme4dPX9Pk4NZb2N8xbJ/hiA+5/D
	2EbwcPWD5PY4V2uJUxX9AomaE8uGaxnMago9ojpF6NUm4w8NaFnm6NR2SVesXfo2qAtZo3nn5OT
	l1vwnN5F475nNJO69LA==
X-Google-Smtp-Source: AGHT+IFRbJ1tH44lIpEv23gIpvmhBMuxiE+JbhC8TVzF6WmLYlq4uRK7OPBTmIpSxquYR3bw2fwC37MlLZWhza8=
X-Received: from wmmu18.prod.google.com ([2002:a05:600c:d2:b0:475:d8ac:bbb0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5246:b0:46e:6339:79c5 with SMTP id 5b1f17b1804b1-4771812e415mr29064065e9.5.1761648927520;
 Tue, 28 Oct 2025 03:55:27 -0700 (PDT)
Date: Tue, 28 Oct 2025 10:55:15 +0000
In-Reply-To: <20251028-binder-bitmap-v3-0-32822d4b3207@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251028-binder-bitmap-v3-0-32822d4b3207@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=u5cQmrhUMazV/NbgrGa0POvpnkdiyA3r9buDRqet4wA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpAKEb/ewdk1lpt9r1xeOREyfL4xflpbXO9tvCh
 oxRUEcrfsGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaQChGwAKCRAEWL7uWMY5
 RmPfEACfpfOQOfGSTuquxnxa9aaTAoYP42qpAtVpDHCibufjxtFsccqhbnZ0HotxsAXILZqYHLN
 mvdg7QyxmXMFPed8pdiEZp3PnpCKNWMWHlWGl2mG02bwq3xxj3Z7lQru1D1Ik273TgBsKw/6Z7+
 R3Wv7Z67yLe8AtLMo+/GBz2oCm4JHasM/Gfj9Nec/N0/8Ay3eTed5Xv9EIdiS/WaPFrvDJQ26Rm
 pV2fcA4dWtI+J8Kr/wkAGB5baWqQ1D/hxKbp+0mC3DnNht7YLxhMf1pyN2hpjklzSOeXcuZGVhk
 btYbncIoeLeknvtsMG2aPml8ZsYt7WPC8qk8dC551ma7cIQ4/Pk7PVQ2Ikv6OgRaPz4Tdg9AhFv
 T3jloqyCq2qlhpw6pIMlvAeCuoCHjPrSdBo5AKfyhXQ+bWk6ITDspAO5zBFr39cpf04NKHV9Y8X
 nKWlkbAaIQmvoUrXsqcttKRbAJirN6KCVtPYdT/ARSWBAIQyXM5X/g3lp1eTMY4baZhns8kWos9
 zs6fXKSMS6RMSCgifnXqgm7m8I/XoX1kdAVh8srSxTAl4MiykIbpLVZZsUUylxjBprpQNug0z5D
 AWlrZ3wqaSk4kQJqjqtYLoxViFKm9fda2ydPVhDOjdd5v+eHGm0a73O5HXQ4aLYDemYGtwsCNz3 l25Y+iqrYTgIGwA==
X-Mailer: b4 0.14.2
Message-ID: <20251028-binder-bitmap-v3-2-32822d4b3207@google.com>
Subject: [PATCH v3 2/5] rust: bitmap: add BitmapVec::new_inline()
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
2.51.1.838.g19442a804e-goog

