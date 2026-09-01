Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C592B44063C
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279367; cv=pass; b=b9FipzBjgTWf/Farb43CovgpHi/bqcHNa+xWNqYdARh6H3AxnSBeohfKVebw5KwpbWlH+ksj9KpQ3CS+GZiX4b0WirIeOMLNcG2F5q8KsFUI7uF0S5r93Ppp64j1lRQOKL+UsEKG9AsdhmoctUqwTRXp6JcuMp8jREwoTiWT9Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279367; c=relaxed/simple;
	bh=F6MPTDS/Eqn9KuNPCidvBhD+gbRYSXGKg84eSl+zteQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nd9H4EbCRI1DEE/xidFxMYpf6/Fcw57b/AIF3os5VrymP4Ia8Px4fAwInjiXvfRwWnA2WaDQ6Px/9Xdk7CHEhuAW2p0ysplENGPp1pV2wIdTT1qU0CqEhEFG/MH/JmSBvHXZDBTSFjixjlL3GhcRgGELTqVkJJ5UnKCiMC39roE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leVOTp0v; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leVOTp0v"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6fec3c1adso6220305ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 09:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788279365; cv=none;
        d=google.com; s=arc-20260327;
        b=oGzzWFuSx4rwtTHeXXu7FWy2xd5DFBKafLx7ZkJlxwkitIKgkXiktR5U/dKwe9d5KS
         xwlm24z/gYoca20BeDhI1aeEpE3ZcOAWXKNq4XQosSKcwY+Gp8hizANSH7y1gB1aCXEy
         EarJhmYz5i1gvmVwANYhv9X/9MP/hAOZziB9cZ4waehKtWj3mKGvZilKHOd6ATYg5SCQ
         Axz+NmMR8o9soqaET5W41ZySkrugdGDZmp5OsbvfQvBJovC69r7UfpBKr4QizOI0Z4ea
         y2PZmzgd48O7yhYYUnCO8F3K2LQrgx3jrcocFfebpwwfpkMP8Rzqj1CfKrzrAHnB/GoK
         d7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsvVn5fbjuww4tKVxeOM5w33cM6GM3YZ8so1+ZcvOUs=;
        fh=Xnr/OKeJ/9OXF7ckPoToJ6sXALJHBgjGE5jF+OjLjm4=;
        b=pgOTJk1xRC4koUlYad+mAQ6ezNcFizsy3X8+BU0+crOTV46I2iSOZR5BX7MJfpSe7J
         l+x1XkhVkzDcD9dMFvz0NaEqFxcRKTf313VlUVQHtVCbZwypn4qJpsuWB5Gxg9R6f4jM
         jwjlhgksBGCHRHe+wXnSfLUJh+sdv5rUOg61y3e2cF2CwhnyrQaRVxgpq8cq36I/TQnd
         TqkHqDL/KdVEIvMUXTL/KMK/lpsg3NkNpHRi3fE7Bq2VbtopaYNFbeaj3n4iT1O7oEgF
         eY7NoCZbL6Ap4ALZIrUEIWz8NeGHVhRd6v0CXLqpxoho05K/SaMmeS/ie2dM1XoyfQOI
         EI3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279365; x=1788884165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsvVn5fbjuww4tKVxeOM5w33cM6GM3YZ8so1+ZcvOUs=;
        b=leVOTp0vW0NbRVJNGDc7c5iBwRf1nncQkjYdC5LF/0JCT0ZIxVFXUSJk2yLSG7uT5T
         ps7AnHzUOF8eMjd+BODItg8Ap5LaRsGgyfEh9LoMufzPnIBx5nNh+n5Hvoh5gfYtHZ2v
         ZOurboKc88l2KjGh+sZHHFx4h91cnQodPy6DbL0XGl/ccU6qjRjx0tlmN7fPemXfLVjc
         14+j6/5YHaKU4Io9DuhL1p5AdWSF1orZZsEzpj7Xt5AnWGmxQr+wPbstyXwETJsmDvob
         tUFYuRNlnEgyWgtOYPL1GFw6BI5T0zaZp2czKHJGmqrqvsrxxBgxjMxRNOBVUyTixG3m
         ToRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279365; x=1788884165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsvVn5fbjuww4tKVxeOM5w33cM6GM3YZ8so1+ZcvOUs=;
        b=ZndiRQMNX4hxHvcYveG0kEc+HonJ55hcxLp5srl2o/qiwS5BjmPwxgT1bFRo8JpBpe
         iea5ktF+QRA7OCocTCsXjLsZCtAq0WBNuY2j14OwdTZeVy2AqnwHvgX1xwuW/jDZd9R3
         0RMJxTfFJxw52lCATFlYLENc3SnU1mVenh3FjeOI4YteH0W8XX7L+s71uSG84uDVr7/V
         w28Agts1Qs4O/PBO8pygONt+k3u45eu4D7GpW+zbksgTYMYKNUrcWP3V+flrLTjP6qK7
         MZ1sFCGVgHUXaouO14hc0k6KMjZYnBAnIhfgl0iOd03ciwAJCcDibiSgsx4BM+Cq3ON2
         9Pfw==
X-Forwarded-Encrypted: i=1; AKwUvBxvmDVGJz69b8hqEMs2tt0oFjBKvJLxDWy+LB+gHPJkVm5imAaIu+TBPhuzSDnY/2gkzdO+WrLlrdPyHWuROw==@vger.kernel.org
X-Gm-Message-State: AFuF++m5bJVlhY1Pw1VxqGAVJN60U6MU8E3tzsdvkbZd2u71m9OwGNtW
	zM4AFDi+BEXkZkr4Cj49u1Q4jMMpJZhFMDc/YVhV+dHYhye+nHMfJXpZ+0d2P8vbPViy3eDH8Kg
	uO5CEIi5P2gmL6QFUi91wRBOO3RzePQM=
X-Gm-Gg: AYBFou3XrQgeomLBj9c6X4upGZZQLSEhe2Fg2fegADjgxrr5X5EDJK7O1E64skrht9K
	ux8CPDiPJmO1rROdFpJJXrQOPin8jejxY40M5iU0Ob7fkkT6T1LYaGEEwD+1pSC4FE/57HRBj/Q
	pmAtxcdQGI+miHLDGdTLssrK1xXstWkBigNP+q2LSPDjZSURZF6IVXjiGxCO4d52srmdMMTEt5Z
	Z0WDnQ+qqJFIrhtJ9DnuyNSA7qcqbATjnAp5+h5aJjAswHxEM7MY4CIvIB3GKiOujS0Qv/cfrfe
	7m1xiI6NqtJO6cp8zXYLk7MquLzkQF0bZkgQpTq9U91Nvz0cPJbx09z9ghfltUcIQftDz8GZ5Wo
	DDScZn4G6wWAEwkp/otm2P08Y8bXPaDtznBZ4tFVXzENA15Qo1mnAsk9cmRW95w==
X-Received: by 2002:a17:903:1106:b0:2d6:f09a:da1f with SMTP id
 d9443c01a7336-2d74e0bab6emr289807995ad.4.1788279364809; Tue, 01 Sep 2026
 09:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 18:15:52 +0200
X-Gm-Features: AcwNN1W8b8265qN_tDq5LcEUWEhKOJq8yfSF3I7LdYBVS-vnqEHCYN7HeDbPUPI
Message-ID: <CANiq72kb=X1igu+pK=KmAxqDncGYF9zpxrihSuSD3WaCUm336Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] rust_binder: consolidate transaction failure prints
To: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Llamas <cmllamas@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index a56ba6309594..380cd3f7276b 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -135,7 +135,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error =
{
>      /// Creates an [`Error`] from a kernel error code.
>      ///
>      /// Returns [`None`] if `errno` is out-of-range.
> -    const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Error> {
> +    pub const fn try_from_errno(errno: crate::ffi::c_int) -> Option<Erro=
r> {
>          if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {
>              return None;
>          }

Generally speaking, one should know from the context whether an
integer is supposed to be an error or not, and thus it is rare to need
this function instead of the public one (this one is private, and the
two callers are here, not elsewhere in `kernel`).

So I wondered if Binder needs this -- I noticed the change when doing
my usual go-through-the-ML exercise and asked Alice about it, since it
seemed to me like Binder could perhaps avoid using the fallible
operation (and maybe even define an `enum` for `BinderError` instead
of a `struct` to be more precise about when a `source` is needed).

Alice told me that the `Option` in `BinderError` is just meant for the
zero case, i.e. the raw integer there should not be a random value.
Thus, since the `if` already covers the zero case, it does look like
this could use the infallible operation since we do know statically it
should be an error (modulo a bug).

So it sounds like the change can indeed be avoided, which should also
improve the code.

In any case, if we keep it, then the `error.rs` change should be
mentioned in the commit message.

By the way, I am still happy to take the first three patches unless
Binder is picking this up.

Thanks!

Cheers,
Miguel
