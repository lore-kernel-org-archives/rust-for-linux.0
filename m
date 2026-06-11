Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D4C39DBE4
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216553; cv=pass; b=phBIFAXU4K/NwmH2+77OledlUucZUm6oIwTY7mvt8EzQuB5TGX4gBoriOFtJzsOrb5/kbMcOBy0hLgIefaDluHGHGDsGw8aRJoYOj5LcDLZCHCcGhOXtNuSNBb1AuJu3ES+HgdXgU+c7nfsh1DsKBWM84q+KY9sMxdJiG/42E/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216553; c=relaxed/simple;
	bh=4NbiSofdu+oQiEoPxXUx0WP2dPkMul7SnL6x2pQKWPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqIjFZViJPT99rY5LcOSn0j9bXThah474NdZTXrNmKUyeSmwsV1clQqMec6Bg+QaaWUSYunWketT2Xp/iHE1UcuHGhANtNg5TwOkDcGQKfzI1sY+8Uqtxn/3HEpEpbmLSNlMPswa1mj7WZVfiqUJgvOYzf2DfMjfyf2t4mLsiS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k8jvzZ6I; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k8jvzZ6I"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso4553a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781216547; cv=none;
        d=google.com; s=arc-20240605;
        b=c4t5g1Exzv/CtYIgULJ1BYhuiKNtTg8WgFyvZ66HL12VaVXypTNxyGh2AR69nFoSkp
         iE4acUn0ZdNA7jIjlqpPsJxDM4kYxUNxmS6UuBfYRGwWbyP+WSv+9gvcnwm7w02DHYNk
         kifDaT2SrJc0g42+ljrnzguyDLihMcJNrqjVoNB/9ajd0j/crmN6O7WiqKwtr3beqA5W
         vPQV5B8noHIj6b61K2jl8ziOJQsr2yQD793VMZSmTCQj01a5n5JAvNh0YsS7UsNBgmz3
         fv40bhNyoTaDZzJCHmA4YsdRM4duP8NuubHWUb22LR7V8pwYcbhHWqiRXIQT65h0YS5a
         CI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lfqrN4KSMEEPAzQGS+9nZt1nC6ftn23/eqH916a63u8=;
        fh=ZUeWYoe3Rx8Qh08Ue7MpGG+RM+bEw/7wQ+poslulamc=;
        b=TdHHjYgL6kKYLzA0TeN0U8wJibtVbzxNKJBlHLCQsqTvAAv8ECHiLO+fx3zj7DROnH
         /hrhvbnFVk53khPqBYQnz7r4BpNbfqRuWedRAwpc/6wINvcrYqPVzWXKsub3yA6eQXC3
         bopMyQBFUeNGnvRsmsPSwHAYQNZekV3v+0V+lMwREVFiPKj+6Qnm0EkU4EEVbjfzpgi/
         IOmkypRgqfznglJlDnqSTmprAdruHIZg9CfSc8LLmiCMHxFwjyYlYVPfxw/moyGaTzn0
         FJbf14DtSmP2qof2JPqApfTPwxo7Q9LNmuzqwpg7KICzS4d/GvvioqK6vyPh0HMgVv+o
         p5Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781216547; x=1781821347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfqrN4KSMEEPAzQGS+9nZt1nC6ftn23/eqH916a63u8=;
        b=k8jvzZ6IUq6zILJ9deG9eD4RrPnAabsg8IbTHr5yeUmoxz7jA4OVGwcrtlgN6yTEoA
         O6RlUD6r0e5r7vRgJ7xO5AiLYDauYsry6GEs9HtNtZ1wfXYaoWYhFx4ZTS5ftjueohEl
         usVZxJUZGrERG0EPST+vcttjFD3BcjFEp3eqPB9nXA7wSxQitmqu1T0IaRRJZjZMsVkd
         n5AEBHY8UPWwLZaPKK1ukbxnxp2psv+UDnDIJMDbEcF4lMLe078V9gh1HREHi/MC/6aO
         aIC6ZALxGx8sQe/mHvoHs+qM5pSEST7qLZEfBwo3OD4BLtptT9E3iUK8GHwg/637d5qi
         M7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216547; x=1781821347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfqrN4KSMEEPAzQGS+9nZt1nC6ftn23/eqH916a63u8=;
        b=eI8ItwIaLOLatga3dU3B7/6SoYkao/64HJeUq7XBU39eaLbOudo24LwWeEf5YZMKwq
         7ZUOPe1oxA4zcTpQhix24FlOPNCYk2mNAZjd+fbkINJt6di+RUvTDF5t11AQDKcpQHZv
         flmoBnOZLRnqW++ISOw/MxayOxuAUf+NyBsQzXTkJ8c4z3QKN6ssN4Yj7Z7sfoVjLQ8L
         Q8klDQKzrKWprGQGsQBjobsnFx0nqRgK6lg6hIPPxed7uRkTk4cK+Jpbfzt8D2SZPX7v
         zwsT6G7zjfvu2BRt9uajbYYZPzLG4Zz2YVFr32Mg2eCRTJNNSurNF44bCBGjbRatfZz8
         BxOg==
X-Forwarded-Encrypted: i=1; AFNElJ+FgEcwA2zPVx/kEcbpWXWLkM+JcfIEMo+78F+PHlnbk8p93lxmTEv7HgJfC0Tlf+fIBM5SnK+iO5F/nb7HBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBwWbklb7wAAOor18gia95LMrTtksnuhHbEU45L8dGjxEGaPL1
	xQxVccn85D1FV9Sii52Y8siua5DfcX5GlNvXH/fwmAevMnFPlTiY4+/u04CDnxV0t6PsST2J5HK
	L/QW9pl5L9Gb79WBxbR/jqWhcNAaRkgGViV/WLSX7
X-Gm-Gg: Acq92OGrCnSdZMp9iaLkJb079MOJV1EoEazX8h19wfDfTJCcekKl9AF5EaL2fuwUdqb
	aN8zj5eVUSVbs7PzYAX9nS7wWv8VYXwWJ4SB+m+IYsaKxFqcpq1W6OuXtUBBG7MXG+zR+s72oWa
	oD+twJyl1MUXzlYka8nxItJpGDDJE54m512edcb5S1Hto91OyNaeAWR2wU8rV76m+L/mntNA5Gd
	UnVxocs/tHdzXY28oWVJCMX/jWrpvZTEcY3nCSn9EPSIRhB++OtQ3jESBeY5P9DWbAoLV8xAMw5
	L+YihmurR2veeOTvJfYXol0GBrF6Sfwe3RBF
X-Received: by 2002:a05:6402:a15c:b0:691:9d2b:b856 with SMTP id
 4fb4d7f45d1cf-6935dba2a1bmr15696a12.2.1781216546339; Thu, 11 Jun 2026
 15:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com> <20260609-binder-noderefs-spin-v2-3-eafde2ff376c@google.com>
In-Reply-To: <20260609-binder-noderefs-spin-v2-3-eafde2ff376c@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 11 Jun 2026 15:22:14 -0700
X-Gm-Features: AVVi8CewvbA1HqGKH46HhrqoGzdUV_7E_kBzYgEpiwfPm60P-rwAwoZUW5nkcOs
Message-ID: <CAGSQo031FbDNfCE8Jjmkw=DBAkVM8Xo2vJPkGA8Nmq6Hq4HW8w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] rust_binder: schedule NodeDeath outside of
 node_refs lock
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> There's no reason to hold the node_refs lock while scheduling the
> NodeDeath to the thread todo list, so don't. The call to set_cleared()
> is kept under the lock so that the state update is kept atomic.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index f4f4d45e1ab7..a8836cb8b8cc 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1289,7 +1289,10 @@ pub(crate) fn clear_death(&self, reader: &mut User=
SliceReader, thread: &Thread)
>
>          // Update state and determine if we need to queue a work item. W=
e only need to do it when
>          // the node is not dead or if the user already completed the dea=
th notification.
> -        if death.set_cleared(false) {
> +        let should_schedule =3D death.set_cleared(false);
> +        drop(refs);
> +
> +        if should_schedule {
>              if let Some(death) =3D ListArc::try_from_arc_or_drop(death) =
{
>                  let _ =3D thread.push_work_if_looper(death);
>              }
>
> --
> 2.54.0.1064.gd145956f57-goog
>
>

Reviewed-by: Matthew Maurer <mmaurer@google.com>
