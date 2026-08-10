Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993973F329C
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372805; cv=pass; b=IZqQfmbSs4uxw2gAksMeHCLXg+ewWNo0QRRg/2HhWsK1TPTwbfSG2tP3THxOKvxIUgkJf/o4Ayqq6XG7J/LsYnLkEsV/91yjo67SVW4uzMCkmWRQ5UyB4uBw0uekpgZ76t+Rk6B47hIWPzl6vOhvL0Z1IC4gNTozMXSAzuyQhyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372805; c=relaxed/simple;
	bh=QYVMswny3A+uMxAAFUQ4ScYnAwj3LyFXIQ3le5g3vos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPrdiM2uKcvo5rDKlNw4Nz8Ii2i38rouXqyNRyOb/XsBohD+F4RHS3cP3BuJB0QmpawhuYYQqOy8mL21cxmZzvloChFNkvUvpOWbQyb0RXTHik20bDjOjWF+sSIWN0xiipUqLw3t9K+bqqyjXU30shNjTnDVK+W/3ZrQihQNa1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPJ8oiKD; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPJ8oiKD"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf110997efso5117015ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 07:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786372803; cv=none;
        d=google.com; s=arc-20260327;
        b=ksnoE2TdkiYJQUc1ODUYZAtxBuJyq40xArwFke1KdPJjkBCraXFI18dLU3LSImnBd3
         Ndo5g+GnfjScOoRb9ua+LhbodFROep94m1rYhJANbOd3OGvIufxtFlFkvFs1xFalMumc
         c1PLdFU/CqE1w+nE/21221tFCe9VeZ3ez4mRKAFOk1orBGA1FjGA4CaXQHpWoYdBdnuN
         b6YWU6J2U4rw8aRnp1XsYXepw9Bcut1Q0Q9doC9pLI+/CYdzIOw6Gc87zImRNJG6pzCt
         AGLC3TpJ5tzS0zdNIsM+LHPdq2wpq7NHmJbrbP2K5tK9m36aT1pKvK0Y9lJWLtJf/aV0
         MD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QYVMswny3A+uMxAAFUQ4ScYnAwj3LyFXIQ3le5g3vos=;
        fh=pprDlVSaQxMLcHAF4gVyGpINcvpi/vdj5/hjrFJUMBQ=;
        b=MeBJ+qpUI9HTvh//0DMgb/BHqPCcMoJunHrxny4ENXxDQKrwNG/FSstRWh31s3lrn/
         94g1o9xAj6BN0GRxqO1MIQ4Wh5LwMxNKFIMLGqrmFaswRdZZ6RJV5ZevVV92cy56GQxj
         yx9ndIxsYsAcKVCgEeodBYys4FaLypk86YBdV0eQuYzyRkQ8/07ekjKXhAAUe8ZpuPcO
         z+el8t0NQdBbMesx+V7Ph+1UKnydAaHfDTuivBzYGrJRH9u35befesVOC9pospDjezUu
         hfhDJdsbkj9fvtqecx6bANFf4u9ASRsZNdQX4taHWfqgG6n1TaUVvccFZxC/wfJm0PD1
         jkng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372803; x=1786977603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QYVMswny3A+uMxAAFUQ4ScYnAwj3LyFXIQ3le5g3vos=;
        b=JPJ8oiKDpo8rqbwXvQZh2P42Y7PpuE5PSkZJ1dgaIY9+yfiCCiM3OSfhfEA4O1HNCr
         58+MoR5/QxsNG6xb4dqPzh8jDlJVn8LLApuE08D9IrqP7zCOhjcK5x3wvuyJpW6stYKM
         aEDyw1Q4Mqrs8fHOMYyBa+ErlmZeOLxtl1/eqvRth6FhgGMoB3yZTtk9K6ute8k/1f+o
         Q1x4/WZMTYZNZaVegGaE34snlZn3LvDupD9khgpaFNFB8JAIND8l1Ys+dwHjjNaodrdG
         08/qEyIa9RlNfs+VaVERxhUtJyFiUoAne+cuiZpyWGyd/XIsv695bs+C+nRUaVTUYoeh
         KjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372803; x=1786977603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYVMswny3A+uMxAAFUQ4ScYnAwj3LyFXIQ3le5g3vos=;
        b=YlknPp8FjUuDVi/pR/RBxwkKGdC5hc/GlkG12PMCI1LF2BJ8EuQ6pz5W5V/mM67j62
         faVdqbjIUqgcNjYy8W0aG/vm0uS8Kd0fuqC3xepqck764c/+y98bag7bt0g8+ohvyaUg
         JwF2AIzYVKmXMlVgpG2nc5KWZzcraD3/hbSzhn07qh8QYvOlvmq36cYR7migj3LDbCaK
         kKiwaWnr9EiuXEk2gtYnRFDpwlWFE4lO32Lx5YF/bUNhGdp4RVpb92bFULCCa8g/+7CM
         t9/KuViNtjkwO9M2fqtRkryM3nya5ZN2V3e3NWZuUbzLEcRkRczgSlpEE7OXju8MRASN
         mBRA==
X-Forwarded-Encrypted: i=1; AHgh+Rqism1pp95plWAW1V4F7AMi4CdcBt7jzGyByKYRFK/HsSbNmbz93ZkbzR+2PL6VMeJw5cEW5GnkYM7gOCpH3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZms853NOUkbm0AZdMnQ7pOMa64VVp/dmO04pCfkyiJYkS1Cew
	bzWsBxg7JpsvUvaBCOi+HEvng2SOSzk2X61rn5TAlDWZuJZJXHhd+uk5lWeLziX+J5KCsjcM9uS
	ek6neEHz+g99n18MvYVQn4p03DthEY8g=
X-Gm-Gg: AR+sD11Bbze0v1EfwZMPzjogGNjs0adx05PqsOXUD3/Z5mjyNqwHjDy6QaxIjeEHi9I
	yDKyDjK00QRNnRTfW0mI+xSDByn55/VgLR53oGPzgxMw/ABEIn4rc/+tbriT2WWjHZBJSgLrBY0
	o6p/9BpleVi7T1AxdrPwaDHn4dBeAnz+cYqV1MO08E78cpxqURf/I3FLqwCxQq22FTdm+l69swo
	y2UGhmsvj6RVSfKdMiL9Nfo9OtmDwSUD4jMqbLop9xZc1hf/4pclVoSvQpTbmipJLAW3FJ14oj8
	4KdA+kMSmIRaMMz6sBTFHwiz9dYuHhjNAo8lq8xXgHYHVdolJ0IhfcaAFgghaARG6e/BrpoUmGG
	hsVT5CwR7FTnKJs/QU0gvgjNPrBFAqOy7Ibeo3LNvzzeGnZ9UxdRKGuhvvs7S
X-Received: by 2002:a17:903:17cd:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d0ca7b0285mr336700075ad.1.1786372803390; Mon, 10 Aug 2026
 07:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807.211008.1388653306665929214.tomo@flapping.org>
 <DKK236MNP2NH.MFG9QEPIEH1M@nvidia.com> <878q6e2p6f.fsf@kernel.org> <20260810.211542.1020667562439851698.tomo@flapping.org>
In-Reply-To: <20260810.211542.1020667562439851698.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 16:39:49 +0200
X-Gm-Features: AUfX_mwUfjY-ARrVazMZonj6XOeSQeJOCvLHqK-HUd39x_vXEAyl3w7D6FV9_Jg
Message-ID: <CANiq72nYwjwSiMnMURNa49v1yfRT+LRAe5KaYShhUkN79H4nZw@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time unit
To: FUJITA Tomonori <tomo@flapping.org>, Gary Guo <gary@kernel.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, arve@android.com, boqun@kernel.org, brauner@kernel.org, 
	cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org, 
	tkjos@android.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 2:15=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> The reason for landing it this cycle is Gary's point from earlier in
> the thread: the users can then be added in the next one. I expect
> those users to come via a GPU tree, so it would save some coordination
> later.
>
> Miguel, would you still be happy to pick this up? I'll send the
> arithmetic as a follow-up next cycle.

The latter patches involve workqueue (by the way, Tejun is not Cc'd, I
think?), sync and Binder, and are not trivial and it is late, so I
wouldn't pick them without at the very least giving time for their
maintainers to be aware and acknowledge them (and even then, Andreas
is not sure about landing this series in general).

A compromise may be to land the minimum set that is needed for next
cycle, e.g. the first 2 or first 4 patches. I have pinged Andreas and
Gary about it.

Otherwise, a tag early next cycle is just fine if Andreas is not
confident about these.

I hope that helps...

Cheers,
Miguel
