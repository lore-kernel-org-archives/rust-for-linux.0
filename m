Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12764A8F
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732304629; cv=none; b=R6KzJQxy+fXPs3Q6SnD1taNHmJ2iEDcuBMEWfkuNgPRkf4PLJcY5P/OzCHrVJcH/+hRVqZerlRUpUcBVc+GNAiL6rJbkgoVJIMvIT0gV/nrPnXMNxwaQ157OVWNcfyEFW6epeC9UCCRo068C8wLtZR3FSPLFuj11sYmJrF61t6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732304629; c=relaxed/simple;
	bh=XHfNscge3k/axjUfbGmFdeorWEeOnxZKspuz6EOu8Uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhFgK/AeOfclKHItn3Vzi9rN2VQsrENn3MCbe12by4heVqTvIT5NYxkDVJY9VMYV2vkJk/ZwcHcQ3CD8Gd9/Yyzmt9W873t08nYUCBLmEJC2BHwhD4PXYfzAAdgHR2lQRo1fj6QYKMxwB+x6DSb5SvUhigDxdbE5Ahcw3BkxJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0NT4TE7J; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0NT4TE7J"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3822ec43fb0so1892695f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 11:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732304626; x=1732909426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJlCZBCEC+QLdkXA+z5QeYevcAS/xMMVoy6tah+3/N4=;
        b=0NT4TE7J7eEzQG6X9qMIW4M6bbBpNpxKvZ42pqOMWF9EiqezHCfcri3Aeql8Xm1maJ
         P3sgSh4rmOj6H1hVvrc6ws6Ju6FC1zLsSoMlziQqcO5VA6ZQRsU1VJ0cxSH6tlgSc5ak
         zLqhCqX0v/cGxS5iFarBort16q0psRNcVxER8R/E4Plg0GPFZ56VxN2pLkfWBtU6fd5E
         Qf8PoxK38xlKixdAeInBb+Ix1pAH43gcD/PJ/VEIBw9/9WS3Xv2xlv+BcJnjtVCzBqIl
         ky0VyU7vX3Rx+UoPszM8t+8IcZvEqofDKzH4I44f18HZ1gbPexO3K17tqhnYOo9FjzEc
         1GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732304626; x=1732909426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJlCZBCEC+QLdkXA+z5QeYevcAS/xMMVoy6tah+3/N4=;
        b=btCJVvRaMRvqGPBtZP+FEdcmSItac5wpzInTGfYfojO//WPh2l1LLdbtwdgiVtFv4f
         zycWIMgz9+FCgHmp/ZAUf7QeE88cMnQ0575Oty2RHTFZEOOgwyUOeQqBciOLMKJgBtUX
         /5zRMa56lKtqdYixCTQvdqIqs26NOJeL9C4LqcAql8z4IyXEe/1tmgouCQMAPezhaaud
         b8DVZEBw436oIvYPG4v8rCmcn/bfEneeTkd1pB+qVsrqtplW8Rot//eL5Du1m8MJeeJc
         TrHcHq9wQlzmdoNCaw0Aag+7onzOvtyu39ZXtk2e+4GVD+Q4WKd1oQnlBWWYNk5rULc+
         YvdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA7IQUKmBju1sA4msk+bRjsVeDO8XWyodnvGD3BeRv1O3xOwFsHFdlV3hxij1B7J9YmiRfcbNdZdzoPxcMOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyitCYoYkq7iBHdfO4TfK7Vu3MLbGD0C2DITelvVODDJdZYNnBq
	1sErC/V1WjiE0r+n/UtBipC+TvoGYxsQu5drOmPcoQrNxRPCjw3A8uRBXDyg7QJyW/8WlLXIavD
	jkusY79yYuIMYJ1ykItzhVjGMj77ocWmoQ6zf
X-Gm-Gg: ASbGnctxOhgweTCvtipIHrY4vT6kLXu2rrhZWIrVTKaAxlk/XIzC2uL5kUnzTz2wx4X
	+bXG5a/Kl8Dl/BmcjS90pOskB7xNES1p/
X-Google-Smtp-Source: AGHT+IGagOmPkvb5KjYF7uq1VeAC+quJqGk5moXsINYc3vtftlp85Q8+CUP4uSVZpeXzo40AoaSlbIJRvQ7WZ+Sc3Vc=
X-Received: by 2002:a05:6000:705:b0:37c:d4f8:3f2e with SMTP id
 ffacd0b85a97d-38260be6941mr3824128f8f.55.1732304626382; Fri, 22 Nov 2024
 11:43:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-8-7127bfcdd54e@google.com>
 <6740c786.050a0220.31315a.5363@mx.google.com> <CAH5fLgiiCgcPRkdeGX7LJcaGN5Y5E=zWOXuwqo+GU-tTt63PzA@mail.gmail.com>
 <6740d8be.050a0220.30b282.4f2e@mx.google.com> <Z0Dbvbj39c87EQTq@casper.infradead.org>
In-Reply-To: <Z0Dbvbj39c87EQTq@casper.infradead.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Nov 2024 20:43:33 +0100
Message-ID: <CAH5fLgippKab6Qarc7go8pz8XPrvEOoi_FvzMNAJXzr8v3qqjA@mail.gmail.com>
Subject: Re: [PATCH v9 8/8] task: rust: rework how current is accessed
To: Matthew Wilcox <willy@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 8:30=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Nov 22, 2024 at 11:17:15AM -0800, Boqun Feng wrote:
> > > I don't think this is a problem? As long as a thread exists somewhere
> > > with `current` being equal to the task, we should be fine?
> > >
> >
> > I think I had a misunderstanding on what you meant by "operations
> > that are only valid on the current task", you mean these operations can
> > be run by other threads, but it has to be *on* a task_struct that's
> > "currently running", right? BTW, you probably want to reword a bit,
> > because the "current" task may be blocked, so technically it's not
> > "running".
> >
> > Basically, the operations that `CurrentTask` have are the methods that
> > are safe to call (even on a different thread) for the "current" task, a=
s
> > long as it exists (not dead or exited). In that definition, not being
> > `Sync` is fine.
> >
> > But I have to admit I'm a bit worried that people may be confused, and
> > add new methods that can be only run by the current thread in the
> > future.
>
> I agree, I think CurrentTask should refer to "current".  Or we'll
> confuse everyone.  Would ActiveTask be a good name for this CurrentTask?

I mean, it does refer to current. Any time you have a `&CurrentTask`,
then you know that you got the pointer by reading the value of
`current`, and that the task you got it from hasn't returned to
userspace (or otherwise exited) yet.

But the name ActiveTask also makes sense I guess.

Alice
