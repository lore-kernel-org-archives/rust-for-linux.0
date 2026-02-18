Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B6A322753
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771431702; cv=pass; b=FBGxnzQZilg8vG7cOinKiI+jtSrN6nXbsaJ+douMNbSI2IMW0LKmzcDY2+to6wRnWFX0KItvx9dlb2zLW5AhmNFisRPltgXxoFU926bFDZbM5l//zSMzU7sPiQDoDu2e4V3QaB0Hcao7apCqC0MqyLcMisxNtjJfLT+nVyeMAdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771431702; c=relaxed/simple;
	bh=N27KEVtuTvXxCb1DztZ20FZNW+sKQDHOlovAwNKEeO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/bPPKWmpTm88NYqT28s0WRkoBX3alJZj8jv9i7t3yeARi1tFGasoEFBNjYXhPMDdJOmmkVOVNBRqDfme+RMckeWViNh8iqvrkjn+veq/PK7MnEhOJFECIDRLafgZB8sUxfJesfvbaClT38+So695Q5qLp13PlSJvp3hsJOznWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yvg3Of5A; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yvg3Of5A"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so10634a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 08:21:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771431700; cv=none;
        d=google.com; s=arc-20240605;
        b=dnFF8M6e5rti+ikR4lM8+io+KJNGPBZ1qCj3Ilhhfnx12EzbbFjaaFnYUphByoOK1z
         hfahQ2q+Br2wBg3cl/pKkda/6hx+7woAYLMdJsxMqty6RuxaHoFHjLqOqgyEtayHFzuP
         l8300Dl7X8NDiNZpjsghBwb46IHn3yoTBck1R42579DIOAgzQXwdHu021BNmnHNpSFqs
         AeeDze41SOQi4lKhcR7ut7w6jUgBFCVmUuDxJ2X+cwWSnEQWa/qQUhUeOjCyBbkHGDwW
         X6L3L3+4HGtcYuvIAwKGYjEDvI7ZQynxsvdbU1OSkWYR9zaoUlm8NbANs7BChQEU5dhE
         seHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCb7YiNC9EbJODNenpr0byXl5zVWMU3mhtJ8bdZBpH4=;
        fh=WQXss5IWy8Vt+KPOn9H4CQKKkjhz7stcLN37PtNNczg=;
        b=JPm9BvP2v4TAGfUqFQnkWRxfJoeZVLr5PpFBQfxhRFxudCXXG84ebQ+v3jFvvu8aqv
         P6zBJainMaC8nH3Bw+KwQCznJHksWiDcoKfljjV29SCefPg025VelDNduDpwXfvKCIJT
         o2NsusFQlrO/PxK16u+Vy1ud5N4/T9oI4lqgHSl7mx40SlNdr/8m4Guggtud+N4KIWhO
         1aTFFSadn3D1m65FdHJD3QvOpebSoKIfnkgJfbow6ZDcMSKWt+tqvWxjRIOmA844z6L+
         XDUnrQxYa4/naS8tVXVLeEs/mM9e9moDOduBRz5iaBiAd9eNO7JQ1zFrA+W4qW8i9ZMV
         TZBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771431700; x=1772036500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCb7YiNC9EbJODNenpr0byXl5zVWMU3mhtJ8bdZBpH4=;
        b=yvg3Of5AMXdhlqd6jDjFTg7J4Uxrme37t5v9rvvOYt7Pw9/o5JqD3GJmKiX2S3lX7m
         GItBEBcRVnUHL1i2hPfmw/2sC7/kN+nae9CjB7s3SjLeotttC1RPPGpuYtzIzfh03N6f
         xh45ySV+I73l1oY5ed06aU2VpwlzENxTQbvrUQrfTcFJNgIkqkTcnLY0jjAwCsK8Iwdu
         A3osAm/CvSmHG8N8ARDnBlfsxGMJEQdlhb7KsC68JCqvyV9waN9KdwbnsyxC0y5/eLoD
         BWpY36R1rZ3C+5vfi0xgHcsDQmhHCriU3DgSzlEnXeA5iywB0gLoFTynjYgrnkNj8lo5
         uu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771431700; x=1772036500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCb7YiNC9EbJODNenpr0byXl5zVWMU3mhtJ8bdZBpH4=;
        b=uTK1jF1vXpZAJFdVha2hmYp7fX7ruX/tLwldnTy8EI707KCbUdBmfub3KDOz8NCmjG
         HPo9G4nZxYXJ7PPyKRADKUX+kf45VFuCuNaoR46XUinR/vA0NmWJY9RL4KikCF6T13A/
         ANa7QoDTNhmZwWu5XmwACq5knYSOi58wArge4kf8CfiEmpHFkhvWLB2tLjbq8LKMIqPX
         ZDvpvaW2nMP0Ep2NkH33PxesPR4zP3YKkz+R+XuLWjncQi/GnygYRBIVrxr/89uSkB29
         xYRBe/3gPvbriak9ObE81XmJ9O9+FfIqigdQ9TLlwcyt647b1QzCq1KMNLoSi4YcrQwj
         cYGg==
X-Forwarded-Encrypted: i=1; AJvYcCWDg7hZrpwlsdRG6J2iqXdwwYV4LzvIqmA7UGCtN9G4N4XjqzIWCs0MUuSTuLJZLjitaRGTVzSuTMBtSChyaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSP+WYFnWpqReRZw3lxObrbIn6CTzArLcaqAmmZwXusCQ/zUDY
	kBjhN6WsKkmySHnpCwrnjusMRjM1n1nDuAtl7GamFT7Cj2o6qufnro8nP6o0forXLw1xp+Y/lOc
	H26Xgy8ZENhQPXoyi+Rn2wecstIhgKTasvdH7r8PW
X-Gm-Gg: AZuq6aI4gS9rxPWzfDOSoqQFex2ysBKk1K2IFPdrb1bXSBJElUFz2ycCssD0kPnRbu7
	k/1ckp4r8LW2inIotUi0C7YqcYshKdULQ+50a9EayQPfU2vQUQSsAqcohQ5bnknbDbK24bzRygd
	TctfGFwZmo6No1Tp1W3iFTNd7XagTGhhJixa5fa34ye18XO91v7JeSf6QjB0lKm94SHSKLAKq8j
	VbUBXpwIORT+3f45FmhfcUjzHgHRdvwd1ajjbRZto91LcjX34UgbcUEkBvukVN3a+lKirTh8uib
	hh50tgjcDHyP/0dW2HXSx+4TPVp0vw5qBPs1
X-Received: by 2002:a05:6402:43ce:b0:65c:1e9a:eaf9 with SMTP id
 4fb4d7f45d1cf-65c78b73dd1mr32034a12.6.1771431699117; Wed, 18 Feb 2026
 08:21:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-binder-vma-rcu-v1-1-8bd45b2b1183@google.com>
In-Reply-To: <20260218-binder-vma-rcu-v1-1-8bd45b2b1183@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Feb 2026 17:21:01 +0100
X-Gm-Features: AaiRm51ZVP5ooWZ_n6gAsTEQdsiNCjUAPCM-PZs3XG2hJOqTY0v5t8E4kpEAp9I
Message-ID: <CAG48ez2v3RoHhOiKYJqBA=UvF+0PnKCZMLiemztTFxNwc4gH=A@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: use lock_vma_under_rcu() in use_page_slow()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 4:13=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> There's no reason to lock the whole mm when we are doing operations on
> the vma if we can help it, so to reduce contention, use the
> lock_vma_under_rcu() abstraction.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Jann Horn <jannh@google.com>

> ---
> Depends on:
> https://lore.kernel.org/all/20260218-binder-vma-check-v2-0-60f9d695a990@g=
oogle.com/
> ---
>  drivers/android/binder/page_range.rs | 37 ++++++++++++++++++------------=
------
>  1 file changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binde=
r/page_range.rs
> index 67aae783e8b8b7cf60ecf7e711d5f6f6f5d1dbe3..9dfc154e5dd4e889c4f3aa89e=
5edb89434113e1a 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -435,24 +435,25 @@ unsafe fn use_page_slow(&self, i: usize) -> Result<=
()> {
>          //
>          // Using `mmput_async` avoids this, because then the `mm` cleanu=
p is instead queued to a
>          // workqueue.
> -        check_vma(
> -            MmWithUser::into_mmput_async(self.mm.mmget_not_zero().ok_or(=
ESRCH)?)
> -                .mmap_read_lock()
> -                .vma_lookup(vma_addr)
> -                .ok_or(ESRCH)?,
> -            self,
> -        )
> -        .ok_or(ESRCH)?
> -        .vm_insert_page(user_page_addr, &new_page)
> -        .inspect_err(|err| {
> -            pr_warn!(
> -                "Failed to vm_insert_page({}): vma_addr:{} i:{} err:{:?}=
",
> -                user_page_addr,
> -                vma_addr,
> -                i,
> -                err
> -            )
> -        })?;
> +        let mm =3D MmWithUser::into_mmput_async(self.mm.mmget_not_zero()=
.ok_or(ESRCH)?);
> +        {
> +            let vma_read;
> +            let mmap_read;
> +            let vma =3D if let Some(ret) =3D mm.lock_vma_under_rcu(vma_a=
ddr) {
> +                vma_read =3D ret;
> +                check_vma(&vma_read, self)

nit: this might look nicer if the check_vma() calls were moved out of
the two separate branches

> +            } else {
> +                mmap_read =3D mm.mmap_read_lock();
> +                mmap_read
> +                    .vma_lookup(vma_addr)
> +                    .and_then(|vma| check_vma(vma, self))
> +            };
> +
> +            match vma {
> +                Some(vma) =3D> vma.vm_insert_page(user_page_addr, &new_p=
age)?,
> +                None =3D> return Err(ESRCH),
> +            }
> +        }
