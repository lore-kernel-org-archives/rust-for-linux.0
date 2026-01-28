Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99FD302176
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591741; cv=none; b=meC15D877242PD+jfPrNkpj1KyeHebZ5FBhGYcM+Bmu41jnqc4tsnMx20XLaO4yV2QFJVcwRfnqyGG26aic9bkOIpn5xjK6UUS22jHMhLUwVnEhZxIXm6UV8gD+mRr6xGFqi9kqjB+UNMH/uFpcLOStD9FgTWWd6ROLgt0HtvtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591741; c=relaxed/simple;
	bh=LfaBtJpSWCF5kA4CdK+iSTrFtU8Ddk4D4KH57CT9f/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FVTslccqGZa0c3IBSKEdxJaFuXwPNwA46c1TRaVa4V6zGb1gl+COQNxclY/GfR7MWBx4gZUxyNtQ+oC8E9a+o3WLfOrD8iyQ/toQJzaidSlPKxbQluJmx73Vi0rriFCTQS3qK+aup5FkSbQArb2lh+pMg7UeBadyBgX/rdaRz4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4sZH+W6n; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4sZH+W6n"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48069a43217so14665595e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769591737; x=1770196537; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zrjnjrWJRJ/MpDqQmBtQDJOql1m90JNXl6Q6zdTxfG8=;
        b=4sZH+W6nbqOE7yyIEUhfpdr3XmOK06qUCq2A+ULWc0YxqzwlMr1asECRW4RTmhCC4Q
         XuE3AKdIqCNd+rgF3GMvivBQ8O+s3bujYAWdxWPgHGUeoHnxGF3JE/fSb9cQe8zLAwdF
         utTofSqf91WQJSRyb3MSQOcx8s4UN8rUi+3EYe46rVVqIluBvn474vCROpXAzT2dwXV4
         6GqgOx88ssfwpsdBjk58y4YwX1dGj1qDQN6SggkKKoowAMtYqlWVzwV/zbZqMdrvEp2I
         BqNj13GxNXsxYkzNb+u5mz7bNiY26pMYnbSJIHaXXp45Jd4DnoxHcGnT9b9cmST6bE0Y
         ZDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591737; x=1770196537;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrjnjrWJRJ/MpDqQmBtQDJOql1m90JNXl6Q6zdTxfG8=;
        b=Y7Vno83jQCYKtd1V73TMyBOsFwv9pd/KMvVIYaSmcXOBWdUyzXUlZYFRntRg9CN39E
         h+IpsFhvfXmynJ2HnSup45nRd1LsAy5UAL3VaY29pGHO3NJlBrsWgqDwpOIE5LdIOowq
         waKV+rKNHcUr2ZQd4vjbKzJjEO2RT47kAyKLzOd0rl6u/A53lWBpz1kuclwJk4Gpfq/h
         whDvGLBAjqNZWNz9aoVi1uWenukmmU4BJlxKaCNbqUiS3GxS7GJnnNHxsU43KdvZwcRb
         mEMLKBWdog4Z4bDBHnvRTfueCEp5VruiuWXYQBXDBjqgCR48K8QImdpZW4vAEbq65TUV
         08sw==
X-Forwarded-Encrypted: i=1; AJvYcCUzy5BaRLNVFXPV1QvygC+J5FoyoCgkN4Z5rHMViEyl3T1p8IB9dnx9JE7qG+wF4hdbRq2aLBz6Iwt7QUCeOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxwzi+kZ/3RPZOqK/xXqROfAVOoo7eujuF+m4hCkvjYmDKLUxA
	AWJ0lZ7SzW0H3ch7Bl5RQM2P14cQcuaCmgraGmiL+z3gE+vBczOBpiRnh3+NoK34m7YjZjpjTLE
	S1uTZpQKl9R9lNpGKtg==
X-Received: from wmby17.prod.google.com ([2002:a05:600c:c051:b0:480:6b43:8a18])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3113:b0:47e:dc64:f1c6 with SMTP id 5b1f17b1804b1-48069c3fb40mr58701215e9.6.1769591737025;
 Wed, 28 Jan 2026 01:15:37 -0800 (PST)
Date: Wed, 28 Jan 2026 09:15:36 +0000
In-Reply-To: <aXkEiC1sGOGfDuzI@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251203-binder-trace1-v1-0-22d3ffddb44e@google.com>
 <20251203-binder-trace1-v1-2-22d3ffddb44e@google.com> <aXkEiC1sGOGfDuzI@google.com>
Message-ID: <aXnTuHQgbEFHIrhw@google.com>
Subject: Re: [PATCH 2/2] rust_binder: add binder_transaction tracepoint
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Suren Baghdasaryan <surenb@google.com>, rust-for-linux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 27, 2026 at 06:31:36PM +0000, Carlos Llamas wrote:
> On Wed, Dec 03, 2025 at 02:48:09PM +0000, Alice Ryhl wrote:
> > This patch adds the binder_transaction tracepoint to Rust Binder. This
> > was chosen as the next tracepoint to add as it is the most complex
> > tracepoint. (And it's also an important tracepoint known to perfetto.)
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> 
> This approach seems to work well considering the limitations. I wonder
> though if it would be more practical to simply pass the individual
> primitive values used by TP_prinkt() from the start? I suppose the
> downside would be the extra overhead with the tracepoints disabled.
> However, this might be neglectable and the solution much simpler?

I decided to go down this road because the same kinds of helpers would
be useful for vendor hooks.

> > +static inline rust_binder_node rust_binder_transaction_target_node(rust_binder_transaction t)
> > +{
> > +	void *p = *(void **) (t + RUST_BINDER_LAYOUT.t.target_node);
> > +
> > +	if (p)
> > +		p = p + RUST_BINDER_LAYOUT.n.arc_offset;
> > +	return NULL;
> 
> It looks like this should have 'return p' right? Sorry for the late
> review this has been picked up so we might need a fixes for this.

Fix sent:
https://lore.kernel.org/r/20260128-binder-fix-target-node-null-v1-1-78d198ef55a5@google.com

No idea how this happened. Thanks.

Alice
