Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F9F421EFB
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338923; cv=none; b=f8n5cJOPy3sB+krF+kZdwQuh/Jc1WgoqFezMttlY9URTLxmCxoPAceWELut54EyQuc1QhWWmDLih+6x7CoYqPdJTrCdhqeSbgQO003tU4NxZvHxpxXbCUn3mXUP+h1nnBKgJ88e1Lr+ibz+jlkqV4qFWYS1ISidLFtTn5EJ4UFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338923; c=relaxed/simple;
	bh=KEJuQka/lAHPOXYTPGsjyTGS14JS8/uSiPEYD0VW2SM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sdT8e70GVHd49/7XVMFgdpviD57jABnn6TwF5Du0E/JjEwtXIp1u38aKhGHjv7xY7BpQGGwam/6d7SUFLrNxBaP+HALCNs4ffcJTUc2LZAKdsWjjb9kwWajevJof9WAh8iHGAWWtbBpqAR1AxeQfHEhdtDeYSBzuAKxsq2Jk0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uSN7xqnk; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uSN7xqnk"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso23498365e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783338920; x=1783943720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzTwFKT3REdJ6G5TZ0YBDl2Hm1+LCDk4PNVrne4DR6c=;
        b=uSN7xqnk7pglCGzZA3+zabybvU1be2oNlPjXzag0Czr6+3vr+fa9VhxhSB63T4lBJM
         puDU4C6lTNreqYe3sojxCEv0EbpKBtpFtBbHD9oKFq6AbOdJRYP3g8WJu+rjhYzzjVEo
         ibTAOQbbAodkLe/OYkTktQR39myu2LA0/ujrT/kVaGupwqOXS0Rt7EdpuSaLO1fXxvEa
         FAML8G4dJxQKeLL/A1v2tXLm9fq4/f3V3fytVk0MrjEpp/S0osojN4qG77D84YfdpHsa
         hTldNIpjnBjZLcZvWwjPYOrglV/gkUO7v43KzrEH4jn0jt6R5j7qKo7zSuUkwm7U1ykH
         vsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338920; x=1783943720;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GzTwFKT3REdJ6G5TZ0YBDl2Hm1+LCDk4PNVrne4DR6c=;
        b=cA2z+MPGXM2mnIGXzO1KNJWOposjSkVWOmNjZIFN9AP/txT2AEkuZS6vjjJekwVKCs
         2nj/vX5JoudAyPBMIWRE55n5wsOrWQWrOX+Xt2DK3FSqUa0Qby08mARhNEbXbTzzKP3D
         NWw2+OFDUnF7U0h+L400UxLzh/kwzaXA4fLkZjOi4uhFiuhYernimQYIYDpVVRK2qPI5
         L8xs7zRyCHxUVqHc0EduGSWGJa3RARgvcAj26GPXvfImbSawgxicc4oG082FFo85hmqo
         80lkSwkpXJyEnVTHw/YrDhtdlUUXNV513ZNVOq4cecUCjyLcqFAHL+8u6DidvfNY6W5f
         G9aw==
X-Forwarded-Encrypted: i=1; AHgh+RpdFaPkbIjV2BBgckZybVjrZtC/NdtUf5lrpVvFchZ9e2/cdUnbfo+f3fwSUCbff4mH9Zl/ygRtPOwlmHX0vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMirM43xqw7Uvnn7kIijbIO/fUMkZYOTvbSFb+ThQCH8E5qHo
	qMZSApdawm8cxMqUQSjnrQniwlIGIdGzVN/g4Y7TD0ZtmrzluKpWssLWjhPD9WcP9ZNJ41oOtSJ
	+nHfA9hT3Mp7voPsqRQ==
X-Received: from wmjl19.prod.google.com ([2002:a7b:c353:0:b0:493:bdba:620b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34d6:b0:493:aa0a:45b0 with SMTP id 5b1f17b1804b1-493df08f925mr889185e9.23.1783338919855;
 Mon, 06 Jul 2026 04:55:19 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:55:18 +0000
In-Reply-To: <20260613065348.96750-5-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260613065348.96750-1-work@onurozkan.dev> <20260613065348.96750-5-work@onurozkan.dev>
Message-ID: <akuXpnwb_y4R7ekV@google.com>
Subject: Re: [PATCH v10 4/5] rust: sync: add SRCU abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, boqun@kernel.org
Cc: rcu@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, 
	fujita.tomonori@gmail.com, tamird@kernel.org, jiangshanlai@gmail.com, 
	paulmck@kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 09:40:10AM +0300, Onur =C3=96zkan wrote:
> +#[pinned_drop]
> +impl PinnedDrop for Srcu {
> +    fn drop(self: Pin<&mut Self>) {
> +        let ptr =3D self.inner.get();
> +
> +        if crate::warn_on!(
> +            // SAFETY: By the type invariants, `self` contains a valid a=
nd pinned `struct srcu_struct`
> +            // and `srcu_readers_active()` only checks the active reader=
 count.
> +            unsafe { bindings::srcu_readers_active(ptr) }
> +        ) {
> +            // `cleanup_srcu_struct()` may return early if there are sti=
ll active readers.
> +            // This should only happen if a guard was leaked with `mem::=
forget`, which is
> +            // "WRONG" code and may cause a UAF because Rust will free t=
he `srcu_struct`
> +            // while it is still referenced from the C side (e.g. by `ca=
ll_srcu()` callbacks).
> +            //
> +            // Another consequence of leaking guards is that `call_srcu(=
)` callbacks will
> +            // never run because the grace period can never complete due=
 to permanently
> +            // active readers (i.e. leaked guards).
> +            //
> +            // If this ever happens, that means the guard was leaked by =
mistake and the
> +            // caller must fix the bug. Sleeping here is intentional and=
 less harmful
> +            // than risking a UAF.
> +            //
> +            // SAFETY: By the type invariants, `self` contains a valid a=
nd pinned
> +            // `struct srcu_struct`.
> +            unsafe { bindings::synchronize_srcu(ptr) };
> +        }
> +
> +        // Ensure all SRCU callbacks have been finished before freeing.
> +        // SAFETY: By the type invariants, `self` contains a valid and p=
inned `struct srcu_struct`.
> +        unsafe { bindings::srcu_barrier(ptr) };

Hmm. It's not entirely clear to me that synchronize_srcu() is needed
here. If there are calls to srcu_read_lock() that do not have a matching
unlock due to use of mem::forget(), then either there is a pending
call_srcu() callback in the queue, in which case srcu_barrier() already
sleeps forever, or there are no such callbacks in which case I don't
think this actually leads to UAF.

Thoughts?

Alice
