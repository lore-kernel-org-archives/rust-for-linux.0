Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A710A3B
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiuZgUr8"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5ff4eb17fcdso4121977b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jan 2024 23:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705390189; x=1705994989; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1I0n7+34nsl+bR69hbBiFh5PPr4WDFeFGBM/qqsFdo=;
        b=kiuZgUr8u9a3AMhAKkx5JwIvJXwCp8ABQ7pEhxuDHib71Q5DStFQ+LQm9z2u7oEU0g
         dRwQq5m4rMfr4Wt/yt7UlPuBFe+NKL/abO4vlsWwvcc4HqpHBlFShYWRUtl8fpUKx3n0
         oQ3p3rRpTDus8hodMQs7ueh8o2/NGk6ClsHxuYFn90mDwx5dRX3K8UjIg2ZJjOOm2ymk
         al9WWyY8Z2jg31lc/gFg/wNc9brgEZjPzA4lLeDr09NNAfzNhpop8YmSksSLfvd8K76D
         ij3qYL8ZmwSic4tdWEfHAqioNHzVu0BNlq3/d3dhHyxHqroNbDW1yhog8WLtEGzkgpQX
         9+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705390189; x=1705994989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1I0n7+34nsl+bR69hbBiFh5PPr4WDFeFGBM/qqsFdo=;
        b=Mbhwt5YfhHPomyKum35ODi79LmioGVHe0GnVqrfgt5KYbAX7lt3GP5RYiDAT7JTA2e
         LgWT3pe7jnzXeqaYyDYQHr1hnDkhaMA5Wrk4rHuFyDjUZU6cEfo6TaYhJG1UDKfNou6M
         EXkekYOIA6K5EBuvkA3kHNTQ6LmYEnIaRpOvH3nzNQXwTq7juMvz8rM3c8X8Op9kIYje
         rNJ9kjZxUA9smVWKRqMXDlm4Sq67ZXM7fa8YRtgOObmGfkdrGwVdDVmt2L9hXMgiVUdK
         p/eUnQxdOFCJls203kOKYUI/jpCQeQKmQy+wDHtGPbj/a39QsIA1wuc0Q1wzyKTvoXtk
         XmkQ==
X-Gm-Message-State: AOJu0YwzUZ/s2nxRoALphKSN5pf1eJsN0TQgodyZuREQMh6Xy1Ct5vcc
	QK0B3WeUPes2m+6vdwe25f0FxO34wlxZxBInezI=
X-Google-Smtp-Source: AGHT+IEmx3K3j419yCCRj3pJ2k3ZM0fncmR2T7VtOT8defOnggr1jeIcuZp+J8TIvMgN+0ct3hc42KKa1SN496pKfxY=
X-Received: by 2002:a05:6902:2304:b0:dbd:4fb7:f446 with SMTP id
 do4-20020a056902230400b00dbd4fb7f446mr3398616ybb.103.1705390189037; Mon, 15
 Jan 2024 23:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116022823.64058-1-antoniohickey99@gmail.com>
In-Reply-To: <20240116022823.64058-1-antoniohickey99@gmail.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 16 Jan 2024 04:29:38 -0300
Message-ID: <CANeycqpk77REoVvmdM-Lbb=rW0kyW7kNFfj_wRYto9G+qzaAmA@mail.gmail.com>
Subject: Re: [PATCH] rust: task: add `as_raw()` to `Task`
To: Antonio Hickey <antoniohickey99@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 23:29, Antonio Hickey <antoniohickey99@gmail.com> wrote:
> +    /// Returns a raw pointer to the underlying C task struct.
> +    pub fn as_raw(&self) -> *mut bindings::task_struct {
> +        self.0.get()
> +    }
> +

Note that the wrapped `bindings::task_struct` in `Task` was
`pub(crate)`, but you're making `as_raw` fully public.

We don't want  modules to use the definitions in `bindings` (only
subsystems). So I'd suggest limiting `as_raw` to `pub(crate)`.

>      /// Wakes up the task.
>      pub fn wake_up(&self) {
> -        // SAFETY: By the type invariant, we know that `self.0.get()` is non-null and valid.
> +        // SAFETY: By the type invariant, we know that `self.raw()` is non-null and valid.

Typo in the comment: `raw` vs `as_raw`?
