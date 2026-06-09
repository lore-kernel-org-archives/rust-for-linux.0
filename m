Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118B53AC0DD
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.235.156.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041535; cv=pass; b=D7+uD49X9SEwPSmpVxpAlOChn6YSpL1i51s8gZEfaVUboq6BPnN7QeB0CsVIuSNvopoANvL1fcPl/fwRtqV+bB6qzJZUeAsMPWGip+lh6U2pidw7d5y4uptgkhXxAtk2/rja3C/YJUDwAO0nT8KgwyL6MEwppUjrlf5zjeOfUrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041535; c=relaxed/simple;
	bh=sg3v6ccMS3XaIU2NZ7UniX1AbZwcjXhCTJATNCR3JM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emWHJfUA4g+QHG8lFyxmKOBKID/hBlXwqLZR0gaPRfRXkYP/fheRZxk10KZPJGVhochZg0AqpUZ6H0GMQU7fIBlhYVTHT2x9KpVw5/KQsvyBygHjLkAwwxTHRakFnO1lakHGwv8B/hNN86OOh3PEuYGxVzzk7SMlwyT5OKX4wdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=XbpqxdRG; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=fX0bZwqY; arc=pass smtp.client-ip=169.235.156.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="XbpqxdRG";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="fX0bZwqY"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1781041534; x=1812577534;
  h=arc-seal:arc-message-signature:
   arc-authentication-results:dkim-signature:
   x-google-dkim-signature:x-forwarded-encrypted:
   x-gm-message-state:x-gm-gg:mime-version:references:
   in-reply-to:from:date:x-gm-features:message-id:subject:to:
   cc:content-type:content-transfer-encoding:
   x-cse-connectionguid:x-cse-msgguid;
  bh=sg3v6ccMS3XaIU2NZ7UniX1AbZwcjXhCTJATNCR3JM8=;
  b=XbpqxdRGfGotnapqOlmCWpfTz5qf/JRMTrAKPLWQ5BJoPLLfAyV2a9mO
   TQ9u7XUgiTMvAoMP1dfHfmR5DF8o1+J/bp+o6S9hgoLHHIxmYhx8ISjRp
   fboJdzd6jGJY9l7WOV0gDBuwW91VjM5xEf1EZ8K45pu8OVMxbn5eYMPX5
   cB+IhBNcpDwosESX/dwd3t7lO+D//8/EhoT+hrA+k1TDDh7LaVyMdU7Gm
   BYtcvAun1Q1Og8BZdABPForDjOjb3NktHcMzq03fOrOIz2FnhdgPwWtU8
   FVBmocEPpuUwj5UJiQ3L/b/Hx/jKltojWE2jMtaaZ+ehoogn7vHeXnnDn
   g==;
X-CSE-ConnectionGUID: g2lr85uLTSycHRvVnPTP2Q==
X-CSE-MsgGUID: MeXlv4GuSn+hQhNYV3aRgQ==
Received: from mail-lf1-f69.google.com ([209.85.167.69])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jun 2026 14:45:25 -0700
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5aa6dbdee74so3792516e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 14:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781041524; cv=none;
        d=google.com; s=arc-20240605;
        b=RIgPM5JETNNorPWIi9nO1BcMZrKXgQV8HNGsUsCKfmr7pmJ/7cFcur9T1zGCJ5KCoP
         S8b/aCX5gEqIVxMubU8HL4MEUwa43It3cHIsxh3FI3u62TB3oazeYMYtVQNC3hY+qrzI
         vUmfiRQseZMVb9fE03qjRE8k5tUvaX66Ej3JeWji/0NXDOsIYipGnPa9cMJLeTcFlUP4
         h35WDAmL5Tviw0PPPf4lfGhb/lqPrsu60L6nossn416Mm5AZi4q5jFIqz6hSkjThNftF
         vD+O5uW+b5ExrS/m3qcb74E67RBSYwWQWxYntwTPgY5sbsCyMF3QgYGCbyx2InTwnU9S
         HI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cc2pubclTH5XFLkn1JbAg5pIqAsoToCze6/lWOdOZ14=;
        fh=8/osVvQTv4/uSVrB6VHsaf9FvzpuIay025WvCJmO9AI=;
        b=H9L/1DRmZH3occYV/ng8e/i43AzPOsSmLaeYP0Uh+qnWTaVfJf/fN3O7cKcT2mKMw1
         C9whc+AvsL+sUIrPCJlgEk1ePCw7lLwBDac+ALCzqxLjdhPYDrLYRvP6ZwpJN+mSvkvx
         zCPTK5dgUc2rcqtmc57rsveRyt8qCiAoAZ3z1q6FWGtWONL+90bfO+NfN0DBcdAragtC
         KbTtSBF7c2hjVNe8wMAj3dwQ1vJIJe8vgN+8+WMOAfdVtwYjUzaDn/E+CTFelkuGGvDI
         JgpbsJZNPP+IdVAFpyP+wzMxY2AUgrMkJLeqDWH4Ugnnd8uHgDUn1g+ZN7RfeROaryx3
         /X+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1781041524; x=1781646324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cc2pubclTH5XFLkn1JbAg5pIqAsoToCze6/lWOdOZ14=;
        b=fX0bZwqYGOZ9gYRYPdUm7wo1epnPDAKNNiJOE+4WZceLWjeSmPC/l38kkh4Yb00jJx
         gV8WY783K8x7THteMbGSApenutW2DPAS9RvegL56FnbL8MKSzJrRJB2O2+wVildhPFJi
         l5zgpYIYv046ujwatc9RKpA4Wsz51Ewelb45E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041524; x=1781646324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cc2pubclTH5XFLkn1JbAg5pIqAsoToCze6/lWOdOZ14=;
        b=beFSXmUA5m0YtRHs+0ROGRQpRKEw/3ZWIusBiNHzDWa3OxGuO9uPNA7ws8yRYdJLBn
         dYmHEcwSQkh2EKrijT7WQjoWpoT4epU246OFGQhqMiu1CJcdz9DV4nf+kQlnid/yOg6/
         hEfL7ZQCkjI2u3W63vO9DeA8p4hBnpve6KtdnmknBybhrfeVmhXlRAHoNeIKZi/r4ENi
         iennoKtRiKaEXmuiXsowEge1yYJUsN8qHIgSLCuIa3YzsP7C3Vsckqn5Dk62JwaGG3v3
         07cZ/ei1f+ZuQSfPtulcyQQl7orbwmgyHYWMHb/FWVF74/7X15fJOCeahaPkd/HkLP28
         jBKg==
X-Forwarded-Encrypted: i=1; AFNElJ8N8QA9/f/pxdOBbl8ZTx7HIGZISR8kZUIddbXqG0W3qGD+pUjsrgiwSemTb6a0TMvvyMYOEC7aQ3+OZ9MJug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtImbMb3MqQ80B/jkY6RrzQgfG8rE1MZ18aJAEr+hM3SAjbuck
	MRQ/mvwow76U9JpA28Hx0nDY2bgMTe4sL9bEfachRaViWdMLo8vxJCZveuZT+Zpuf6SZzn7MDr5
	bLrZawhZyQUrG94GqnCxfMyQ5U+/w7oi/OZju81ia6ldDZ23eGKDgonNJssiRVlrNuOs7ZXBCKP
	dtiWYV5/3Echv9d5NjGcKmzB+HsIPq324mybGEYfXBV2gS
X-Gm-Gg: Acq92OGRipVtoGGgTRY6PyD+gL2ESvjUf9WpLCWFZzuaHMriH28tbG/1Zuc/rf3jJqY
	YSTp/O5kS24C91Vt/HAecv6m7R14iCeF7bHvzH7Vrry1Btnecy+sDTKEmG8PaREfz2Onu/tqKsz
	h+NTa26WG+kCSz+XyIeuNX1pk3LD9FBVIj0AtsLXRvJiPxJBmrJfqsbZ05aU9zPyh1CRLafkEwO
	oj1bbOfrflJgrjYvPVl8+U+BRtcB6edTkznxZ4NkwF8O3u48Q==
X-Received: by 2002:a05:6512:1285:b0:5aa:5e22:5add with SMTP id 2adb3069b0e04-5aa879ed345mr6613385e87.0.1781041523843;
        Tue, 09 Jun 2026 14:45:23 -0700 (PDT)
X-Received: by 2002:a05:6512:1285:b0:5aa:5e22:5add with SMTP id
 2adb3069b0e04-5aa879ed345mr6613371e87.0.1781041523427; Tue, 09 Jun 2026
 14:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-rnull-v6-19-rc5-send-v2-0-82c7404542e2@kernel.org> <20260609-rnull-v6-19-rc5-send-v2-1-82c7404542e2@kernel.org>
In-Reply-To: <20260609-rnull-v6-19-rc5-send-v2-1-82c7404542e2@kernel.org>
From: Yuan Tan <ytan089@ucr.edu>
Date: Tue, 9 Jun 2026 14:45:00 -0700
X-Gm-Features: AVVi8Cc7l3HzAy2Yt2xtgg6-CDVD_domuZQHBShLKIw1SGPTFaAMN-OeImdTFrE
Message-ID: <CABrc2FU9HuRp4tVEU_R1RdMMRkkS=tM4Uv70WG3UBTeho_C42Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/83] block: rust: fix `Send` bound for `GenDisk`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jens Axboe <axboe@kernel.dk>, John Stultz <jstultz@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Priya Bala Govindasamy <pgovind2@uci.edu>, 
	Dylan Zueck <dzueck@uci.edu>, Yuan Tan <ytan089@ucr.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 12:13=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> The `Send` implementation for `GenDisk<T>` was conditioned on `T: Send`.
> This constrains the wrong type. `T` is the `Operations` implementation,
> which is typically a zero-sized marker type that carries no data, so `T:
> Send` says nothing about whether the data a `GenDisk` actually owns can b=
e
> moved to another thread.
>
> A `GenDisk<T>` owns the queue data `T::QueueData` (stored as the
> `gendisk`'s `queuedata` and dropped when the `GenDisk` is dropped) and an
> `Arc<TagSet<T>>`. These are the values transferred when a `GenDisk` is se=
nt
> across a thread boundary, so the `Send` bound must constrain exactly them=
.
> Bound `T::QueueData: Send` and `Arc<TagSet<T>>: Send` instead.
>
> Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
> Suggested-by: Yuan Tan <ytan089@ucr.edu>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>
> Please take patch from Yuan instead of this one, if they send a fixed
> version [1].
>
> [1] https://lore.kernel.org/r/8839ddc5ff54bf454d508cde91d27d00fc3e2dd8.17=
80633578.git.ytan089@ucr.edu

My last email mistakenly enabled html. So I am here to resend it. Hope
it doesn't disturb anyone.

Sorry, I've been busy with other things and haven't had the chance to
send the fixed version.

Thank you very much for reviewing the patch and for preparing the v2 versio=
n.

Could you please add the following when applying this patch?
Reported-by: Priya Bala Govindasamy <pgovind2@uci.edu>
Reported-by: Dylan Zueck <dzueck@uci.edu>

I didn't discover this issue myself. I just helped write the patch and
I don't want them to lose their credit for it.

Please let me know if you would prefer that I send a v3 instead.


> ---
>  rust/kernel/block/mq/gen_disk.rs | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_=
disk.rs
> index 912cb805caf5..b36d24382cc3 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -199,8 +199,14 @@ pub struct GenDisk<T: Operations> {
>  }
>
>  // SAFETY: `GenDisk` is an owned pointer to a `struct gendisk` and an `A=
rc` to a
> -// `TagSet` It is safe to send this to other threads as long as T is Sen=
d.
> -unsafe impl<T: Operations + Send> Send for GenDisk<T> {}
> +// `TagSet`. It is safe to send this to other threads as long as these t=
wo are `Send`.
> +unsafe impl<T> Send for GenDisk<T>
> +where
> +    T: Operations,
> +    T::QueueData: Send,
> +    Arc<TagSet<T>>: Send,
> +{
> +}
>
>  impl<T: Operations> Drop for GenDisk<T> {
>      fn drop(&mut self) {
>
> --
> 2.51.2
>
>
