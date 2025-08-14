Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270221FF5D
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186881; cv=none; b=bZukAxYXKPDA5v3/w0kwov+TxuWZM8sAwRoqBZeX0kDPLL5/ztBGGGeanOpSkQovkmY702aOd1BlmxMvgu5muEdX3SlavPerMlK7ar97jtzKQtzs6ISIra1g3drX2pyTEGe/vPiuk4rJ4I9Pfz7/qaWALdVBbefAR1KECe4emQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186881; c=relaxed/simple;
	bh=F0pElEsvxrR0RRjThz7t1RhU6UkOvkMNrQNHbBwmIrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBaViw+juU+ot9+rEz3uWR2jFwsC03pGjvijLXlkpS5hpYZAZdah+NpkDm7Hw7cIzM2e3h26QeO866vYcT5sjrw693qFQXutNY/RdkMt3h48ccU+XZyg8QgCvL6gY1aZFh83kEiKIqP9OocH5RHUWwc3wgvPXclAL+CtC+CtokA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AesMwfFg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AesMwfFg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32326e20aadso1483207a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755186879; x=1755791679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvabB1TykqrJuGy2/4C13LzT2Q6NuaXnmqhVowsnYYk=;
        b=AesMwfFg2Y4v8ydIg5KcWovRFzao8+OjlqgnSWYZ6hMnmFQZdYhYcdM1rG2dJ7PRpl
         pQ2Dnnk2PrbTalMzEaiX8/m1WxFyS+x6yslVs5Z9KcBeD+5wfHRkB6NKb6AB335aGlkE
         TAANeaCbrp8LuJ4suTnrLW2BxdacPGqFG9ag6ioofzBUt3quhmDpmDYMdGoXR/MB8qhb
         pn/7HInE0PgdGqz7r9Wbknq8QMg2NXOqCvqPZhiwgufAGzZynpX6hvOty3E5RUXFr+bD
         FsDG/7dA502flcnP0i3xXA1Fehyq+dm5e90lWWS3l7srK5xNzbBZ+rnBR/ueV3q/sooy
         jwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186879; x=1755791679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvabB1TykqrJuGy2/4C13LzT2Q6NuaXnmqhVowsnYYk=;
        b=NunY3KcTM8NBvzqxorbcAY2rub2lk5ws+/OqJ/HX+QURPS9/F/VJlb3az2Yg5nRKJi
         DUVCBJxzsW3Hhs+MRgqBeWtoEvSt0HRlZzlw3rPJS1mejUcvjLhTsKFdgxa3RPbaGxUG
         /zUYAm9AxZKvIoPxmWvXL4Al0XYhlv8uY1kGVa8ScRitjJUyVGpLv5iPzwl/MLRgyOfX
         +eFqkkN6i3azvatD0X3SAv7/OxsyLFyGddOHM5awn+OGf2hY0B0ojjYj/SC6vFxQ9863
         og9WJXFLYH7+f0elwygt3BCzyRP+DcB3a1VQBzuXSDuJdfiKnjKooOaIKgRvxrsoNlqg
         yOuA==
X-Forwarded-Encrypted: i=1; AJvYcCW/2YziWMpBEvhVokiS44CJNN/VhQYUmSEVdv2qo5SfuoVp/H0V7t/UJJy/0lKcjg2SwCc80AmkS7eGsl1yoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YweRcHcj5N0XhnvvhowVMXEeWX8lDsZLlzf681ik4OY3BalDsP0
	PL7v95YmQs15YpyYLMOPXpayCxyioIBR1obBLi4HGgPWH3UxnkvrRvnDP/1hBC8mSsSNKQp1SD1
	IpTq8+JfliYDEduWTBkuEJBo0EAwZhE1eBMyGriSg
X-Gm-Gg: ASbGnctaN1Ch1K5HtDRmY0fPdKdJ0SE3YjRq0wWHz4tYj4spestlvHioYVZMzhwabg4
	H594TB/SZZXVy5A5eb44APIoHjBfIoncuYJsrKZX/Si2KWrJ8EPrFEf1ejUtJ1cWusQwO8EubL7
	pV8W0U/TNDL1LH3drJGEtyNsJz1i0dJWVGh5IULWANLSq/MebzraRs2nsisJBzpTcEmXs5a0la8
	4zH1tR/C7Ra2tXNRA==
X-Google-Smtp-Source: AGHT+IF3C041JRsjxUqaaZy5hpDym6lDLSiH1UTT6ITfTxQxD+tAO83OLFzF/MDi+d7eudf6g7YOpN2iMFBcxPHh4Nk=
X-Received: by 2002:a17:90b:39c7:b0:312:1d2d:18e2 with SMTP id
 98e67ed59e1d1-32327a51eecmr5939431a91.20.1755186879054; Thu, 14 Aug 2025
 08:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814093046.2071971-1-lossin@kernel.org> <20250814093046.2071971-8-lossin@kernel.org>
 <CAHC9VhQXOezJ2=B1BQOqLgfuzDJEVS5G_r9+_bQ+OUNTpjZCKw@mail.gmail.com> <CANiq72=vhPsGjSx9u0FvDa6uzMFkFQFP9qG+DhtZ_U5TyV=bJQ@mail.gmail.com>
In-Reply-To: <CANiq72=vhPsGjSx9u0FvDa6uzMFkFQFP9qG+DhtZ_U5TyV=bJQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 14 Aug 2025 11:54:27 -0400
X-Gm-Features: Ac12FXzlwiXq64khBtAeerI7ifBROgc4LhPQT_zvpgV5Z4PtTDCkCmp0ECJQmC4
Message-ID: <CAHC9VhQNi31KSpB-MtvZO9e5fzuM_87VWb6rrMtxcqOGSPTiNg@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Jocelyn Falempe <jfalempe@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:31=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Thu, Aug 14, 2025 at 5:19=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > I'm happy to take this via the LSM tree, but it would be nice to see a
> > Reviewed-by/Acked-by from someone with a better understanding of Rust
> > :)
>
> I think the idea is to take all these through the Rust one with
> Acked-bys from the maintainers (or we can skip this one and do it in a
> future cycle when the first patches get in).

[CC'd the LSM list, as I just realized it wasn't on the original patch
posting; in the future please include the LSM list on LSM related Rust
patchsets/patches]

That's fine, it wasn't clear from the post that was the plan, and I
vaguely recalled from past conversations with Rust devs that they
preferred Rust wrappers/helpers to go in via the associated subsystem
tree.

> In any case, Benno is very knowledgeable in Rust -- he wrote the
> library being called here -- so unless you see something out of the
> ordinary, it seems OK to me.

My comment asking for additional review/ACK tags wasn't due to any
distrust of Benno - thank you for your work Benno - it is just a
matter of trying to make sure there are at least two sets of
(knowledgeable) eyes on a patch before it is merged.  If it is
something I'm merging into one the trees I maintain, normally I count
myself as the second set of eyes, but in this case I don't (yet)
consider myself a knowledgeable Rust reviewer so I was asking for an
additional explicit review tag.  If someone else is going to merge
this patch{set}, then it's up to them; although I would hope they
would do something similar.

--=20
paul-moore.com
