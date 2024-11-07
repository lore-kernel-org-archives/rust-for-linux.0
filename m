Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D31991D2
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Nov 2024 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966175; cv=none; b=G56LpvZZu54BwNJPXVnpos11O/inBhl89k7we4MGFAghfmULVeXOD81WgOUHSuaj1QjzorNTPRWhUmvCB6uxUmw7THZHJVxlxeN5UqVdgdXuBY3TbzBW64KkywW+hSMnhL6nfrMEpZc5jt2B+eXQnsNakmqZyxPP7YOORwMizKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966175; c=relaxed/simple;
	bh=jDomde3/iUFvIfJ3iganah2LEQ63z2Z0sAm6v1RGRhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJA8Q6CdsqQO22X9+Cfhs/YJvJtWCrOL/u2tYBa5MlxCqBsYokJ+iyehtrvvlZ1TyW0C0sTeVG6sOa7DHcjABKrszWpXTMi3P80q6uDI8EmgFYaatAiXq6nuqVr/Vz+cwiu+q5jKrHw43fjmHRTc1HwvUJWK2oUW3BoNTed8qC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AiLz1lvG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AiLz1lvG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d5aedd177so424017f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Nov 2024 23:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730966172; x=1731570972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izGbQDZbA5gZiVbrG2xjhpkYo/HP9m4/wsr5q1Biwlw=;
        b=AiLz1lvGYLKNJi6NMD8lNzlso28koZajZdvc0mvjljoKIBQQKb+DumbX7YkVLcUBaO
         wdZ2YTNwj775cGQbWV0s3hcCn7tq5b75CWqz3vdKutciggp0cOfGKfzVTbaivDaLCFF9
         etwLF8OlrrKQgiGiuVmj6oNX7meICP8qQ4ws77TJa+N75xKjlSLFXixxawOjuk8fsiQk
         y3htjjbu9dyq1u0qXb8CofBb/k66wNG/255MGT/Y2k+5k/BrdiRNcO4C1Lb2pKgSz+Kc
         3fwqRkXhfxm0TDKRlK+tgWGOabkHKBprIBcBe09L9pEJalH7eK2eTXoQo7T3CE5tj8xh
         aQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730966172; x=1731570972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izGbQDZbA5gZiVbrG2xjhpkYo/HP9m4/wsr5q1Biwlw=;
        b=tBZ3aap3aZeswZa9yj6TPqGWl8eMa7midONLKLqgpki48afxYUIZzZ6kujZCfJ1+Ss
         ixR1vdgnW6qiOzZYEdT1bir/6XcYhVUwvgWqrMI+X79BHsYWNWlqXKKuO6xdoyviVtNs
         WbdiWGI0NdZKPk9ZJDNx8bLB0+YAZ40oHP2zDjlzIvPfADe2yfiQPO6KKB6qMdAfxat7
         n4B5mCNgiJDNHSA5g9EWviSm68wo2MoGh1s8Hm8YWVXNY9SM0R15feSq0a9/kJ07Kel8
         SYdY7iSXOBLAP4v4pyf1aYFvniDt1oNzDh5k+FgFDnhp1+OJHrxwXl3PuIPZRTolbglz
         KEGg==
X-Forwarded-Encrypted: i=1; AJvYcCXGDdaaMOslkq42o84wGIeGhAgB936MQLDAIooK0qHg5YvPtBpCceTlX/ZqtTOje7tX2PxowPPzP1BGDMa6/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxot+G8VWE17d4gIxoF/ycexHf5DD+i11f2G/5VffCwG4ZTQPLu
	JrFl/4iOe8JwWFiqQgR9LZD6ZqkG3x8YPt6j8YG5SR3lS+PcGy5Eex92a5UuTuoReBLzKqcZrK5
	J6WHRfonYS9B9ZrjuTV5k9xfNxOllwM2LBw9H
X-Google-Smtp-Source: AGHT+IFe1EMbcnGrMkjttOt1av9g+20rXev7NSCpetyPrTr+VYaK1t65Ogth97wIOCnGytVqSGvqJpUgTuD3IfRKLBE=
X-Received: by 2002:a5d:5982:0:b0:37d:3e8b:846f with SMTP id
 ffacd0b85a97d-381ef6a1bddmr190822f8f.24.1730966172361; Wed, 06 Nov 2024
 23:56:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-simplify-arc-v1-1-a4ffc290f905@gmail.com>
 <ZylNvC8enwPG4IQ4@Boquns-Mac-mini.local> <CANiq72nQ6b1wO6i6zWW6ZWeQFN4SJVB28b216FDU70KmtCbaxA@mail.gmail.com>
 <CAJ-ks9=xW_WWZXB0CbDvU-3otkYs-TY+PSYeiPyidM58QujC3g@mail.gmail.com>
 <CANiq72=9XiYOMQ9ttDrgqTt=mPZnWJuCL0EgQBjFObfqVmr1UA@mail.gmail.com>
 <CAJ-ks9kNmH2t2Lo2PdLuH5rwSC3UQRGWd-cTAX9-Q2FE6oGHiQ@mail.gmail.com>
 <CANiq72k3AJgMq_US7MYGpzKRqOXZQKpOkBXAd8DwBKyE+Bz3Jg@mail.gmail.com> <CAJ-ks9kKtGkBmjQCfM-idP6uYas_wOqMq7q-oPxZ=+MkS8XVqg@mail.gmail.com>
In-Reply-To: <CAJ-ks9kKtGkBmjQCfM-idP6uYas_wOqMq7q-oPxZ=+MkS8XVqg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 7 Nov 2024 08:55:58 +0100
Message-ID: <CAH5fLgjgKmAOEdofTR-ZnqcLa1D_KJ9C3fs4PchYyzZjBBYG_A@mail.gmail.com>
Subject: Re: [PATCH] rust: arc: remove unused PhantomData
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 10:13=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Wed, Nov 6, 2024 at 2:20=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Wed, Nov 6, 2024 at 5:33=E2=80=AFPM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> > >
> > > I would be happy to add the relevant details to the commit message bu=
t
> > > this is one citation that I haven't been able to locate. The closest
> > > mention I could find[0] only vaguely mentions that this change was
> > > made, but does not reference a commit (and certainly not an RFC).
> >
> > In Boqun's first link, there is a reference to the nomicon with
> > details, and the section:
> >
> >     https://doc.rust-lang.org/nomicon/phantom-data.html#generic-paramet=
ers-and-drop-checking
> >
> > explains the change, including:
> >
> >     "But ever since RFC 1238, this is no longer true nor necessary."
> >
> > There was another RFC (1327) after that, for a finer-grained approach
> > (`may_dangle`). The name of the feature gate was also changed.
> >
> > Anyway, I don't think we need to add any of that to the commit message
> > though. Perhaps linking the latest RFC is good for context, so if you
> > think it is a good idea, of course please go for it -- but in case you
> > are referring to what I said, I didn't say that we should add the RFC
> > bits into the commit message.
> >
> > Cheers,
> > Miguel
>
> Thanks a lot for all the hand-holding here. I think the sensible thing
> to do here is to add a comment rather than remove the PhantomData.
> I'll send that as v2 shortly if no-one objects.

Adding a comment and keeping PhantomData SGTM.

Alice
