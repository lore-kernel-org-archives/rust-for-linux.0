Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC41079FE
	for <rust-for-linux@vger.kernel.org>; Fri, 17 May 2024 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715935069; cv=none; b=bJBLN1wp8uvEVBtuRGk7PbBqCX6Z9MUNjJmNZsv/g0TFyn5APOMiZA5hM6o10o3+PymQ8yjseO8gZhtlDVkVAWN/VFdolFfqssI/i7uHsBCxVua72BZ9fZlDgRnSFCU5CQAc3DFcVB1N68u3crxJd1OHe4IOFpL5t+XbcVp5408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715935069; c=relaxed/simple;
	bh=oZaYfIg1b5PeNakYmZDSai/ytacaCteV8o/JUE4aplk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKw2og68C7V1JyPVFH8adLby+F4OwLgIxdlzyrurNrdj7VGVG4KuRLoZljXO05Ur4ozFnvkH9EOT9GL7AIBr2U1BdJ9WWYhaeIp0fH6yT6RRXVnXnBJ6XSdrpMpD50O9f9K9Gqe/56+qtp2s7O843Xvqbn5Ayfr6JMCQa/BJJ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PjNWKdOc; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PjNWKdOc"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4df97a50d1aso176765e0c.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 May 2024 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715935066; x=1716539866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZaYfIg1b5PeNakYmZDSai/ytacaCteV8o/JUE4aplk=;
        b=PjNWKdOc+jiPLw/cLjb6GqM+aByQsl/n2bQMebvgP7vLp1kcOEjpbhRKabUToMk6pn
         6sJyoQ3tKHmgFJG/7QNkiOIgAMCtsszcmWyQzvmdcx+05a8Xaj3yrDN3nSxJgM423Ojd
         0+JrixuRY3Y+oghgZKXfjleKAFut+DjTXH56juerziV6ymGMRQeeh/sJqCxk+i7UQtZE
         Yt+WqCR4oXViBIfqwDxjcB58TU4otian04w3VrsoNruPs0M1odploz2MDM7m7CQKAgCt
         CcqI3Eo5inWNoj60NynfjBmpliEc1B6IuByIb4X4hK3xI4lmBsWKrjthZaOiX+43ReZb
         +T7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715935066; x=1716539866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZaYfIg1b5PeNakYmZDSai/ytacaCteV8o/JUE4aplk=;
        b=TN+YTBZGF96v9hjYicwMuZD+hWexsSP8zPVjZuD6ap6P/Ohjkkqr2UqH76guf2/O7M
         JDnazB7QeljOhDbELnmmAiZXeTni13EZ1pwUlN60YXEaV95YsfaJYBf7f2ByYSGs7oYY
         L8ThahEhFBp24t7ZOGEXZ+0gedVdn4vxDm52tqmSHJdnl9VLaAarGy396XlAjI83KPWt
         wtr+TSzrWBqkhFkDYOR9bKFzu+HQH+RvDV2QrpgN2U5FAHXtiMoOJAbVs6hPzbkK7Ifp
         2TpbIJJtpeZ8phrt1xHv4c+EXNRizLizt5QV1vjrdZZmvwBCMpEoVF6L9w5ZdWZwqgnA
         uEag==
X-Gm-Message-State: AOJu0Yw1b49wkQ1xZbQYmRHChLZfe5LneRfAsNKekArVKZTbi4ILas0A
	SGLvboiKXbd2VCgBueqz+Q7ifTtkXMYK5r2Z/YifG32iA/1wmdnLHGe6QFXc1KppruzHWi7xWgS
	gp8NKEPhYOn0q6v2q5ag5sHmgBphQ1XwZ8D4R
X-Google-Smtp-Source: AGHT+IFL4GJ3IW86f4TdAqBso4sQrEZT9ST0LY2/Kk3ESEsh091gdbRchgGrqHSDTOg0AXet+59cHAjpLBjAdY3+y0Y=
X-Received: by 2002:a05:6122:17a0:b0:4db:223b:1c0a with SMTP id
 71dfb90a1353d-4df8834b107mr18839185e0c.11.1715935066358; Fri, 17 May 2024
 01:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240516190345.957477-1-amiculas@cisco.com> <20240516190345.957477-19-amiculas@cisco.com>
In-Reply-To: <20240516190345.957477-19-amiculas@cisco.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 17 May 2024 10:37:35 +0200
Message-ID: <CAH5fLgjUQxES8spGx0QDmGJBmqyAfKChjDfLLWUaqSUWWTAhLA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 18/22] rust: add improved version of `ForeignOwnable::borrow_mut`
To: Ariel Miculas <amiculas@cisco.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, tycho@tycho.pizza, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, shallyn@cisco.com, Benno Lossin <benno.lossin@proton.me>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 9:04=E2=80=AFPM Ariel Miculas <amiculas@cisco.com> =
wrote:
>
> From: Alice Ryhl <aliceryhl@google.com>
>
> Previously, the `ForeignOwnable` trait had a method called `borrow_mut`
> that was intended to provide mutable access to the inner value. However,
> the method accidentally made it possible to change the address of the
> object being modified, which usually isn't what we want. (And when we
> want that, it can be done by calling `from_foreign` and `into_foreign`,
> like how the old `borrow_mut` was implemented.)
>
> In this patch, we introduce an alternate definition of `borrow_mut` that
> solves the previous problem. Conceptually, given a pointer type `P` that
> implements `ForeignOwnable`, the `borrow_mut` method gives you the same
> kind of access as an `&mut P` would, except that it does not let you
> change the pointer `P` itself.
>
> This is analogous to how the existing `borrow` method provides the same
> kind of access to the inner value as an `&P`.
>
> Note that for types like `Arc`, having an `&mut Arc<T>` only gives you
> immutable access to the inner `T`. This is because mutable references
> assume exclusive access, but there might be other handles to the same
> reference counted value, so the access isn't exclusive. The `Arc` type
> implements this by making `borrow_mut` return the same type as `borrow`.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://lore.kernel.org/r/20230710074642.683831-1-aliceryhl@google.=
com
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

This particular patch something that I have abandoned because I did
not end up having any user for it. If you have a user for it, then I
recommend that you resend my patch and ask Miguel to take it.

Alice
