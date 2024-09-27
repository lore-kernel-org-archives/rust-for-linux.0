Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186AE1662E7
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727419740; cv=none; b=reinNHqws/er0oG29eCK8MI8r+YKRJO8lND3iyeIByiPvGGzXKWWFvX0af3LGDs7ePEogPoi0cj4DBoL6LEarIss1dq/+VoRt+ypdZhauYgkIGwlYzmVlIfcK1lY97DiXrb1b2ePnpP6IR/Gen5EYGV2O3HSoueiwMgItvp+Tso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727419740; c=relaxed/simple;
	bh=HbVB23OZTP5tfOpmp3K0L/PYgaXn9XT3U9puUNCFz2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOdQTLwZbxKgKkoKZ0sK0mteIULEOqdfrI9ppmLtfIMz+oB06EFZTZ1eqcSS1HyNd8cFebKUAWXISDlMB9QjVbFwpmPJG3oQq65/6vW90LfeQMt3eavmxER9wfD26sDOZaCl2Ev72AnJshIYR5M3iIOZRVh3TfZ2zJBYxQbZquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cGgok9I9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cGgok9I9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cd26c6dd1so1103681f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727419736; x=1728024536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsWU+c9ooO36ZzyqvovuRAA2PZcmtpE3oZMgAJ7nS1k=;
        b=cGgok9I9zJoLF2xMhzRRArHHeCgRNZXPzlVYpByVxW8WpQSHjZjVDJrNq/oSmao8cP
         5vW17FjvWd8hDWtk3RIC0vR6CMUP7Bf8yNzE0zYvJQtcG7ZoPurQn/HQWp64NtcXrWv9
         U4Wub5WdBNPWOfDxsuQbMlV6EVCxP/Z38DzOZJayrK4j/ebDV/NS8zB7IoRcS5xdl5aG
         lLwQIoCik29hJCIeGaq29Jq/UvloI/ZuO6ig0Df4KSGuMy/EvTMjxvagDInw6+TuNMv2
         mYEzEIcHdYjKIegTB6jFXuDyOKo2XQ+c1H+NWPR3MX9mVQ8Ti+4pap+jBPH40mtktpgS
         dv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727419736; x=1728024536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsWU+c9ooO36ZzyqvovuRAA2PZcmtpE3oZMgAJ7nS1k=;
        b=ZfhXPQQ0e0VKuMyHwM+y6joW15yS3ify+kNjHTxRzIP4AlzNGQWKagtPwkhRHH+lgK
         3hz8Peuvrfw++9kRBsp+aGVmBzyVGgpkYNt03mJoWScMZb4TLHjOoGs/oVA2QseMvFRl
         3Ieu0c69hL98w5/cD3wA7ctCFeu4w/0ae4RKhIkDvWRLygIYYFaKj7vvpiPrs41oBTZN
         7PKkzJY+jW7ka6j81PF4KhINqfxUZPiSO1aLBwl2364hjFJdllD0rOewF0GmVjSds+qF
         nhuca9HEowlkEVLygioO7b29LE5lQk1GiLBETEZIOcb/i12UBTJ2Ais6byDQU1FXGYN1
         mHgg==
X-Forwarded-Encrypted: i=1; AJvYcCWEZowlPUQpYPygdX/Sx0dQ0tM5EiGZwe+1tBumcYYIvmUynkq0Rr0rLeOa9mRLllTDvwnqZ85uPFW76bk60g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCt1tZ/S5TOnuMQmop9c0HYam8ZplP7DPVRlfD04kP5iNJDKsP
	fpYsw8Fc5QNjZItoo7n8T7AOz0+K3sA0nw4svRcZdxdNnI5skmtJoZGJoG7T1sKld6lwN9uLEEU
	QB6Ea+HE+BPIYP66rg0UFrdCHJesqGt2VURH1
X-Google-Smtp-Source: AGHT+IE9wHdywVYcSJ0MhGBl1AGz6FW7pkwWHnpBoOpmqXayWnThfJyUMjbypeLgEyzcg3Wms3RNiMxi4qpc97lqV5U=
X-Received: by 2002:adf:8b1b:0:b0:374:ba2b:4d1c with SMTP id
 ffacd0b85a97d-37cd5aa684emr1665481f8f.31.1727419736162; Thu, 26 Sep 2024
 23:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926-b4-miscdevice-v1-0-7349c2b2837a@google.com>
 <20240926-b4-miscdevice-v1-2-7349c2b2837a@google.com> <20240926220821.GP3550746@ZenIV>
In-Reply-To: <20240926220821.GP3550746@ZenIV>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Sep 2024 08:48:41 +0200
Message-ID: <CAH5fLggMgmg-3AH1JcA6hrNLvEoM8f8a=c99v7gSa+4q3diWjA@mail.gmail.com>
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

On Fri, Sep 27, 2024 at 12:08=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
>
> On Thu, Sep 26, 2024 at 02:58:56PM +0000, Alice Ryhl wrote:
> > Add accessors for the file position. Most of the time, you should not
> > use these methods directly, and you should instead use a guard for the
> > file position to prove that you hold the fpos lock. However, under
> > limited circumstances, files are allowed to choose a different locking
> > strategy for their file position. These accessors can be used to handle
> > that case.
> >
> > For now, these accessors are the only way to access the file position
> > within the llseek and read_iter callbacks.
>
> You really should not do that within ->read_iter().  If your method
> does that, it has the wrong signature.
>
> If nothing else, it should be usable for preadv(2), so what file position
> are you talking about?

Sorry, you are right. In read_iter we can access the file position via
the kiocb. It only makes sense for seek.

Alice
