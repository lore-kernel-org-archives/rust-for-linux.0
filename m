Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1058481A4
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 06:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713767485; cv=none; b=Z8JSCV06FiUP0lZtwnibEWxR1yLBSMmt3jb6Hj7hXoXyMJHY7Htj31xwoxnEi+GzChx3nzbXw2Hdoc7GnjH7o6nxNbXOLJntjs+cFFDsZyaJBNUvC4uNpMbfgpzobJqGTo9x+zufNNvC2Pi6dkVHSE2k05UeK7krf8c64QotP/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713767485; c=relaxed/simple;
	bh=L3a0jSRw+MZFp8s/6+dJnOk39w0ZIQV4LLLA+ljmtU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OF82ZI1Nfbye7tHIrFV7WgRjQKIFW98LZZo1okGzow86Re2VEyzB/V/2aoHHBc3fUjy7msd5gde/q2bu7JpAA9yZIfEMIfBwwQh3zHGFkMf4HSAea1rf4rB72fAK9kb7WUUdIBptZz2duNeKjZ9OI9gTMRMmhuP6Z9k45X4H8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K3pMlGzO; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K3pMlGzO"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4dac5a3fbeaso1109678e0c.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Apr 2024 23:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713767482; x=1714372282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3a0jSRw+MZFp8s/6+dJnOk39w0ZIQV4LLLA+ljmtU0=;
        b=K3pMlGzO85ohHDE9G/IkCDv+6K+jODlWotKTp0+WThmOWLdIaLhZoUg4XUyJhYRwg3
         lBspf3dvZbBlYPpV3qS9LVSEONbcL1BsySIi4h66qq3uYOFL8zJZXQqn8kGko1Sv7Ut8
         9NJHIoMDrRqL7FDhs2PlF8n7fnsay657CcS0k8+QQZhxmNegQ8BMVLu5uD/bbqoBSkq3
         HXRYxBGtuRP/qRxhXoq54o0dMkyzX50pm+BZ7VT62O1lXwW0IK6JYw9vaMNa1sH3eSg9
         x7KsZYKiJy5d/OyVOhzXqNSvkAcjqExgDH1hKumF360L5WvaIo5lg4TxqxzLYPfftsAR
         wbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713767482; x=1714372282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3a0jSRw+MZFp8s/6+dJnOk39w0ZIQV4LLLA+ljmtU0=;
        b=mHEPG9gtDxcdGtZBVxKhvOMtDzKWFH8STJEWwdPeQEf0xACZIxR+VnTrydNFJZ7tQF
         tivBJs7E7ylaU45tZl3xzSwomIYbFsXudXEOM9PhsnbZI1vA2eMwyGAq5gJL5dhcHLVL
         pF+4AhcO96MqXTsG5cgRjwzj6DjfsmlHuvTlAZAZAbjs0T2vpo865GxT3OPN5mXVifW2
         dsSdl/b4XX7bTDMKB2clG5OaaF1svptpMDp27K/NFX8yfMdzfsEH4pk6Tk2zz9YiWJLL
         geZ7LolI8Klh1KHzyFWHpIm9u678A/TKTJVAAjaVGr+HZpiSycGiKdJ+NtaxymHU9vBg
         cXJg==
X-Forwarded-Encrypted: i=1; AJvYcCUqid2CRn2INBmT3CWRDABgvbYV+Ka71nEi1VF50lm9ygG16MTUKvAI0tpRFqCDYEgDERfzMQNiarEu2xhIf8ce6xL83ZIqTjgxTZh5cak=
X-Gm-Message-State: AOJu0Yx7eyIXQe/D0q/2pFSEh7FxYsxNWglqOqpg1pmjNaerok9lzDA7
	K/AEGDHYcK17Ra3xVng/qwDGrAwpA4yMEx42Mc6uKmyLDHag7do8Lemw0cQ3uC01B0w7nbkRvB/
	nhaCdBBGXUwMtmFbjGp87NJYu6jlVnaMh6M6e
X-Google-Smtp-Source: AGHT+IG8+zRK8xnCF/rH5UllHl0k8Xbd8lhN9hFB9HvM4ssxa0WBFfLiL0cVle12B4lh80EvTUTz2VIAUTu5xNEQqGo=
X-Received: by 2002:a05:6122:7d3:b0:4d8:7339:4c35 with SMTP id
 l19-20020a05612207d300b004d873394c35mr5908761vkr.13.1713767482365; Sun, 21
 Apr 2024 23:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zh2hw0uQrkN5yVVA@boqun-archlinux> <20240416095323.1107928-1-aliceryhl@google.com>
 <5a45ccc04cae4976900d031989104737@AcuMS.aculab.com> <CAH5fLgj9xt9RnohE1fbLfWBAHv47AgwzrMf8cWZO4hEYC2Mnkw@mail.gmail.com>
 <98d51251e0dc470983b3fae339e0f3bf@AcuMS.aculab.com>
In-Reply-To: <98d51251e0dc470983b3fae339e0f3bf@AcuMS.aculab.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Apr 2024 08:31:11 +0200
Message-ID: <CAH5fLgjaAB+6aqNaPXRxfKBzOjVxBNq5_Gj6ntG7rMM1ToMNSQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] rust: uaccess: add userspace pointers
To: David Laight <David.Laight@aculab.com>
Cc: "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@samsung.com" <a.hindborg@samsung.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"arnd@arndb.de" <arnd@arndb.de>, "arve@android.com" <arve@android.com>, 
	"benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "brauner@kernel.org" <brauner@kernel.org>, 
	"cmllamas@google.com" <cmllamas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"joel@joelfernandes.org" <joel@joelfernandes.org>, "keescook@chromium.org" <keescook@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"maco@android.com" <maco@android.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, 
	"tkjos@android.com" <tkjos@android.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, 
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>, "willy@infradead.org" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2024 at 9:49=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Alice Ryhl
> > Sent: 21 April 2024 19:38
> >
> > On Sun, Apr 21, 2024 at 8:08=E2=80=AFPM David Laight <David.Laight@acul=
ab.com> wrote:
> > >
> > > Should you be implementing 'struct iov_iter' ?
> > >
> > > Even if it means creating an IO_UBUF for ioctls?
> > > (Although that might take some 'fettling' for read+write for ioctls.)
> >
> > That seems to be intended for when you have several chunks of memory
> > in userspace that you want to treat as one contiguous chunk. That's
> > not something I need in the Android Binder driver.
>
> It also transparently supports in-kernel users and some other cases.
>
> I think there is a patch intended for 6.10 that removes the 'read'
> and 'write' driver 'ops' and requires that drivers support 'read_iter'
> and 'write_iter'.

Binder uses an ioctl, not read/write, so even if Binder could use it,
there's no real advantage for Binder to do so. But it does sound like
something we want to support eventually in the kernel. However, I've
spent a long time on polishing this API, and it fits my needs well. I
don't want to start over now that I am almost finished.

So, I think that this could be a good follow-up to this patch that
someone else is welcome to submit.

Alice
