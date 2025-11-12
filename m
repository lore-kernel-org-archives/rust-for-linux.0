Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0B334C1B
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951654; cv=none; b=TAETs67rUuPQQ9RX3OhC4iZE6Zxp6BS2lfFPG1judX0PlAx8WQrp53cC5Wqi7tmff+9mEU/dWOfZsMwcf0OuwE5TomdKQx9NWVo5ZGqDeS6fp2doEUBiGa5Af9bysxbDL5AiCGfCMgK3co1udrx4+06bl4307pTVytTfAvBvOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951654; c=relaxed/simple;
	bh=jU12ZpgtH991h5e7ZBwBatZK4g5q1U/xD8yC7I7uHME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iyCcO09qwkRw3kjKYEUiiYs1H9ee+Q0QP2pmLHnrwBGQoif3ScDSACYM7AWN4ajhjrM99b6jjeD8uAbqJ09+KSfeTbFVfs0Rl5O+MGgUBhlLaSvINWoRWD/FW7Ee0M/AFn/aZGXJ0Za+Py6Xkf3A/yc+6J00JpikTJQex8V6ayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lgTP+NTr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lgTP+NTr"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4773e108333so5475505e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 04:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762951650; x=1763556450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAyL6DXdlWMMZNXZ5ef4zX5oC6lp6MOoZedmRmCWqCk=;
        b=lgTP+NTr/M8Gm48Yj8XGLAlp4oF/HO5/6RgojVAbh0MclKXN8XHna3ugrq01wJt+c8
         g5Jt3JnuK757V9rJcbGpAKup+19Fnfbk4DWyJiqW48r17Nyvj5ku8ZbEsW8242dc3fHe
         BV3Wi98AZVhzmdjsFUDhJyMA5k4JckbCUo8UveMFl+2YmNjJoQM7epzzWhzGM4lXRHm4
         xRdyxIVQBVxGNlXMpqLezvFxvcq1tuPvg2bhJWwHv1WkWHhlP/BWm/D1h2BvsPY30v8b
         +1L/q0jRNGQJQjvmwx8AYnYAgH7xuhNuVoCQgmDMj1V5Q9WUER0hQbeuu8JD4MHoBHm0
         U67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951650; x=1763556450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAyL6DXdlWMMZNXZ5ef4zX5oC6lp6MOoZedmRmCWqCk=;
        b=R4bQZWfEjdAai/hf9bGfkyZp26N5mLVB5A9MqjlDLFiqf0PKdUGWkf7eRklG79G/Oc
         evEbATGFvlq+oufkQ3Qu/8N/HMsWZtZvcW8eV6vazQLNhoQNW0iekuBXPOa/Jiw9One4
         2rcOFCOadMc9gsxs3nV94+WVyLkGpfxRQz5F/y4H6UtJnGK4tmAfaDU2DFMzWLBceBGT
         NupJrMWbyS090qFYHgy7TKR0Etb5oMclgipcwnqp7IIRCW4ldDiiRSWMtv6/MkB1jZxh
         hh8Yg/SVgHStVYPek7N7Kw5/sB3qAv+RfA4VydoFq3mxAwQWgv2OxtURMeBr92CX1h1w
         J3rA==
X-Forwarded-Encrypted: i=1; AJvYcCWuvnz+YpdB6RdtTZ/9jHyNfbZi6q++Gcxoi3E80Ki95DrrKCSvmnsDx6zmosKPQroqoT5uIyD+B00g5qkERg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHOVhE+gQbUDc4IOJ39eibullAt9nxfxiM337pVqKYVqUaIRl
	E7YZyjIuRGA/NQ97N9Q80Ix5uB+vt9jJLiaTIH/qFGjUa9aG+wtbxRywIdBQXE+MQ5yN/gor1iP
	/w3ONmoCAqyqKsu3wPQ==
X-Google-Smtp-Source: AGHT+IFI26OUAU30HxN4N5ESdqUbkEvk5F+6vXXL6DPLRxYyP/If0dVPFSht9YaKcqDMKtTuRH20LVUf6M5dr2I=
X-Received: from wmbbd13.prod.google.com ([2002:a05:600c:1f0d:b0:477:63a3:2748])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0a:b0:46e:32f7:98fc with SMTP id 5b1f17b1804b1-477870962bemr26756645e9.21.1762951650641;
 Wed, 12 Nov 2025 04:47:30 -0800 (PST)
Date: Wed, 12 Nov 2025 12:47:20 +0000
In-Reply-To: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jU12ZpgtH991h5e7ZBwBatZK4g5q1U/xD8yC7I7uHME=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGkUgd7IN5ZSHLCDpzD9Me3XDUof+vZJ+MpQbPfrpbDnUcnSn
 IkCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJpFIHeAAoJEARYvu5YxjlG66kQALG6
 l36BdIAxhSaLv06Oh8rVycDqelTzLAe/S4UyL1ibV4SbA2OwlkMe1W/qXjTWofTFjUE+G0d0We+
 mBmiFe5ANObGJoqifL+V/FCeZeyOeGzrL0toiPTwkJ4ORfsfxDy55Ej4QdjqHCb3qrjpHuBgXO7
 pRPNtoy+DH7Lk0ATI4MBx8tYnWPt+WtljVLTPTWkJw0KSn1Q34JSD6klKWRNWseBj5IIvR0Rnxz
 Dmv7Ij6knxHf81G0HLeK1CdLar8KUiDVSateJ4BlG7DG86XU6+lgx3yVqlck1XUqg7wtr2O9XV1
 Ysi1YB/Y6wwe1nHzlhM4afN26AumEWw1iiT3njn5ZSme+lP3pi+48cl3vixgPwv0+aofx0yk1ON
 4WbDuhL7bxF8pDc6/5Ckb+/T5smMsG/YQmaci46CjIruPXLU5ko+RheAsb1WaKBqhExIZF5+ZYb
 ODExzuaiMAqeT7nNrnFGhvWiVLolpxyb4SLJjeJED0AWsWJAJDpmFlXFw1+a8liVZ0fiDCihCqo
 lbdpxmbpSTy5OBenoTAD8Pl7jLe4rs7cNMFkCwBbwg4wguJv+3hDSFNkhH7wvRpEzvxu3kmhEBL
 LiIrQVH8CxKOFQ2l8dEPV0zTWWNUxvw46PsnL37KhDG5px+2+lhodpg5CbF9s1oURhYI+Y3W854 hp7x9
X-Mailer: b4 0.14.2
Message-ID: <20251112-binder-bitmap-v5-2-8b9d7c7eca82@google.com>
Subject: [PATCH v5 2/6] rust: bitmap: add BitmapVec::new_inline()
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
index 0705646c6251a49f213a45f1f013cb9eb2ed81de..bbbf0f9e5d9251953584581af57042143447b996 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -230,6 +230,16 @@ impl BitmapVec {
     /// The maximum length that uses the inline representation.
     pub const MAX_INLINE_LEN: usize = usize::BITS as usize;
 
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

