Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E037178377
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 06:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420228; cv=none; b=Lbij8fbBUKVzy6nrXAVHBzyVyS+C45azniYLgnTNsI+lEUMzrFVc852hlwYuiXc6wKFxOha4Mec2sIOAilvJBZaBjfRwo9YiqBv+1bofBwiRi8quRJRhwDZO8PBFQnqrrzdioZAeiCzPwomSOrVn8qP6uWCQGRZgAqU9Ylx4174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420228; c=relaxed/simple;
	bh=ntPXSTn0XaL1bz+NWhec/AVUqU9BTy+XXCzoOAy9NCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjD7ZddJEQeQpDIounsA3rKKHCh9A3HcMsNNXZAEH+8bTVn58alPaadk7WWyQ2+AI8gGlpHi7V8tBOFxYjG3BoiZzTBNq0jvJ7pJStWUyc3jFoPsdIQondX/TvMqQDkoRm+TmYF5hZU0lP55yEQXJiH3JDrZ4KOTAa/mOhtUwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SECq03ZU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SECq03ZU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so15361815e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 23:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727420225; x=1728025025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqmPizVsqq4qdhBRG8AwKRaqHKBJIvPdTR51rrGTtac=;
        b=SECq03ZU2pg9DQNujkSYfZivqpvthEnMbafx09geZ4kG+VEiy01aL+XVPziekrQJ//
         DHMo4bPnWmOKIP1rZ7S1IOg2eNOAZ4iZcaH1q/SiVex7+KPjmGJRMtWnYw3RA55UQrdb
         teMm8RfyDaCYPNlBi+03Wo06oiMO5zztZI5x9bWhrCmEI8J7Z+38i4l0NIDrNjoqxLVz
         OSdz5l8Wrm1e4nDsl98RIDboD1P8GNq6wU82QIPW2pXPQcpiM7qKpuhgOf5OW1wvZ+nx
         tU+uksxDbBStzkmayixOmu0U3YZdXQ6QgeUKt0nK90PMdMgcZEQqLXPxh1xIdU9I0+Ol
         cBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727420225; x=1728025025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqmPizVsqq4qdhBRG8AwKRaqHKBJIvPdTR51rrGTtac=;
        b=E0aNfOnsKM9ntVHokaxHJNQTmr/iwt/1oDz9jUQAybOhs71dbnwAMcZRI6syHx7Mob
         4wFa11IyQN2+wEv7W8l0OG3dNwCuPCXlpNYZOr2bRmlJAhrXc7+4+HkFnAEtDC6zUrMu
         cq0kJorc+r/bF45Oy2IVU6Nhfq0rkaHdYCJ/PJRRlCACDmAIgSEWcc/j1c9z5s69XWiF
         5STTfvMvQ+3aeKoLxwOOW2SBDWxkjaB0/fdJ/0t5XK67aidrjEph17BEqauQlmcAiTix
         tmjyM++a4o0d2hkF+7nrGo+ZpI7iBiEL7IE3bgqdodKfihXyyxBMY2KopY8UuqfHCkzM
         zIqw==
X-Forwarded-Encrypted: i=1; AJvYcCXEZbxANMWEjzsKGH/Z8v12Aft85p2cuPw8L8jSH7YLObkBx6RxaX/GkKsBQyLLrWM27lSny43T4t5ldIkEiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl742OrlLruNANQEo1iTpIz5lojfeTavIRwy8KAW6oeNS51iRy
	WJoh3PJrZC1mjDW6iTwCFNX0vjUxDNazDjQHz5VRjchhVz8LQegJrwpbOMfiHu9mC4eIiJ0WQyx
	uxK3TK6P2J6T7Mlc6p9HJngiYLAN92ImV00bJ
X-Google-Smtp-Source: AGHT+IEL+etCLpk5OYw+YdsvWhveUaQTGppJFFWoWLIplEsVQRyrmKK2vppq4B4v8T1EMDfuPi9L4dAtpHeeA2VvdXY=
X-Received: by 2002:a05:600c:1c81:b0:42c:bae0:f065 with SMTP id
 5b1f17b1804b1-42f5840cf46mr13043465e9.5.1727420225137; Thu, 26 Sep 2024
 23:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926-b4-miscdevice-v1-0-7349c2b2837a@google.com>
 <20240926-b4-miscdevice-v1-2-7349c2b2837a@google.com> <20240926220821.GP3550746@ZenIV>
 <20240926224733.GQ3550746@ZenIV>
In-Reply-To: <20240926224733.GQ3550746@ZenIV>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Sep 2024 08:56:50 +0200
Message-ID: <CAH5fLgick=nmDFd1w5zLSw9tVXMe-u2vk3sBbG-HZsPEUtYLVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: file: add f_pos and set_f_pos
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 12:47=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
>
> On Thu, Sep 26, 2024 at 11:08:21PM +0100, Al Viro wrote:
> > On Thu, Sep 26, 2024 at 02:58:56PM +0000, Alice Ryhl wrote:
> > > Add accessors for the file position. Most of the time, you should not
> > > use these methods directly, and you should instead use a guard for th=
e
> > > file position to prove that you hold the fpos lock. However, under
> > > limited circumstances, files are allowed to choose a different lockin=
g
> > > strategy for their file position. These accessors can be used to hand=
le
> > > that case.
> > >
> > > For now, these accessors are the only way to access the file position
> > > within the llseek and read_iter callbacks.
> >
> > You really should not do that within ->read_iter().  If your method
> > does that, it has the wrong signature.
> >
> > If nothing else, it should be usable for preadv(2), so what file positi=
on
> > are you talking about?
>
> To elaborate: ->llseek() is the only method that has any business accessi=
ng
> ->f_pos (and that - possibly not forever).  Note, BTW, that most of the
> time ->llseek() should be using one of the safe instances from fs/libfs.c
> or helpers from the same place; direct ->f_pos access in drivers is
> basically for things like
> static loff_t cfam_llseek(struct file *file, loff_t offset, int whence)
> {
>         switch (whence) {
>         case SEEK_CUR:
>                 break;
>         case SEEK_SET:
>                 file->f_pos =3D offset;
>                 break;
>         default:
>                 return -EINVAL;
>         }
>
>         return offset;
> }
> which is... really special.  Translation: lseek(fd, n, SEEK_CUR) - return=
 n
> and do nothing.  lseek(fd, n, SEEK_SET) - usual semantics.  Anything else
> - fail with EINVAL.  The mind-boggling part is SEEK_CUR, but that's
> userland ABI of that particular driver; if the authors can be convinced t=
hat
> we don't need to preserve that wart, it can be replaced with use of
> no_seek_end_llseek.  If their very special userland relies upon it...
> not much we can do.
>
> Anything else outside of core VFS should not touch the damn thing, unless
> they have a very good reason and are willing to explain what makes them
> special.
>
> From quick grep through the tree, we seem to have grown a bunch of bogosi=
ties
> in vfio (including one in samples, presumably responsible for that infest=
ation),
> there's a few strange ioctls that reset it to 0 or do other unnatural thi=
ngs
> (hell, VFAT has readdir() variant called that way), there are _really_ sh=
itty
> cases in HFS, HFS+ and HPFS, where things like unlink() while somebody ha=
s the
> parent directory open will modify the current position(s), and then there=
's
> whatever ksmbd is playing at.
>
> We really should not expose ->f_pos - that can't be done on the C side (y=
et),
> but let's not spread that idiocy.

Okay, interesting. I did not know about all of these llseek helpers.
I'm definitely happy to make the Rust API force users to do the right
thing if we can.

It sounds like we basically have a few different seeking behaviors
that the driver can choose between, and we want to force the user to
use one of them?

Alice
