Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA1A3EBF34
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231600; cv=none; b=aMVD6BesFyZwUyOIG+vUfBgHMmtHZ5m2NAe8lqtcJnpkfAauhtQAssWybbYlou6M/Q1Sjc4JKegGID/vuksFx4vXIikhm+oWD8E93BUib+h13gl6Kby3nbD/2W9ZO2bCo8e1Hy0/0wdCoyH+jwnrSWevLQHwpf7JJnKfcySoXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231600; c=relaxed/simple;
	bh=mbjq+FRK2nX6+tBicVOsRK0dghmKmeXV81hETpPKXZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HJHWO8beU4qKT4KpD6jFvCnP7TUtf5An1caJ1wpq/An5VsYYp8iKx4uZEENbLUeZCI8GS7e0/LIj27o1ivjEM2VvKKxkVZGiFjFSGRDEcdfUkqbLlnzsGro0UbowuaCBVtOrgJ+mrd0IyaTmkarSccGXKdZmUsPtM/YHqxagV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LADhozhe; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LADhozhe"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso22463905e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771231598; x=1771836398; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LPGO6IK6vf6m310aknJYPg6oVbAt+vYuSFArBMF374E=;
        b=LADhozheDn3VSiseFQMHoUqxFghjx5jhJkhFkns4kxu/jk8vJjgYjvzkPTbcRo475I
         4P7LJheAHsNRnVc8qulwRi68zb/u2qGcS8Q5mF9Zh7lfQwJ8gwNdM1agFlWYr+DjP+6P
         9mWDs7GFzRYGLu/K7Mr6bjoDFI2nmD9pK8Ks99wmlFUve2HzuWPQLw3sJy9UKsPvpJ5G
         tRp3rxWQ91DHShJx7pz0TOS95hOdSqoRJr7inzZ/a3ziMBtqqcKTU96RC0aruqQ5vFnt
         fTVJxTcPbF0T5LYhnZVpJrzBXN2Pn9jv5uFIws5fd3wv9fPbuFUIa3ftVcFvp6qQ8QiJ
         hUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231598; x=1771836398;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPGO6IK6vf6m310aknJYPg6oVbAt+vYuSFArBMF374E=;
        b=MvQAP75+H6KCTfX7O37jUtSBnpnjD7++tuwW/VzUizohxMZ263agd68lxA/wbfM6qH
         Zd4H7VRX8MjxFGlh9naYnkjklZ12Okv09C8FcL7Y4wY4JTGB02+CKHR4BhAqDUr3enXK
         3vnzDicVx6zplvci5BFUEV2yGCjQhLYRGG3xdmcB6nwlEQO4820BgO+2RUhKz9jiVBa9
         wO1Gw/vYOf0oXR5zV4O6I8Oc7s8G8HDqW1nJPwEp+q3vNaYEEGExY+7GecfNZgehFHwu
         5KGAd/CHJM9BBc+F758k95kS+pQGpdDHEGR9DHdWqRXDzU/bsKyQxvw2t2TOpUYFRE2W
         4ojQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXSNI0VnhhADR+HFskBeunlGw6FRu94oLpIK0QetNeC/3ISLMvRemqWEBeRnewUsAg6jX15BS6wDrM/5N6uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdHVQ7ND7S+atMM2rQsFgZ+KLwKrpGh3QvNReTWTAzLE989dT
	e2I+UANw33aeMcLbHiP1M+E7QYd1xaLplaMja6lJWiXEQxQYQ5hgCJuNEQXxK19OXWTXcWW4WrO
	2xvUd+p7hYMFqJpIULQ==
X-Received: from wmjs7.prod.google.com ([2002:a7b:c387:0:b0:47e:e4f5:36ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5294:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48380620cf2mr78995575e9.6.1771231597785;
 Mon, 16 Feb 2026 00:46:37 -0800 (PST)
Date: Mon, 16 Feb 2026 08:46:36 +0000
In-Reply-To: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
Message-ID: <aZLZbN5C3wXgt3kL@google.com>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
> Add methods to get a reference to the contained value or populate the
> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
> directly, while `as_ref_or_populate_with` accepts a fallible closure,
> allowing for lazy initialization that may fail. Both methods spin-wait
> if another thread is concurrently initializing the container.
> 
> Also add `populate_with` which takes a fallible closure and serves as
> the implementation basis for the other populate methods.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
> +    /// with the value returned by `callable` and return a reference to that
> +    /// object.
> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
> +        if !self.populate_with(callable)? {
> +            while self.init.load(Acquire) != 2 {
> +                core::hint::spin_loop();
> +            }

We should not be implementing our own spinlocks.

Alice
