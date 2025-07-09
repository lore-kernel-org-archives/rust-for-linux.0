Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8694801
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 22:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752099684; cv=none; b=mhYe2PQ2WSgzDQJzg2bo6lucI6sQl4YfwsX8iKCrJUFwKl6qW8FHNtOYTRvE+2ZvBam8ay3I/UAHB0w7OvByycy2/hUbldTSd6raFfxQakkAsTPxwT9wY7vNvO3Mvl989vYomeDDmFRa75503eCv34dsmw86LKssRX3ih5t9SRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752099684; c=relaxed/simple;
	bh=lRn5Xzu/HIT35eBhvWLX/C6sWrlucrMXJNu5lgmdO3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5JrdWPW9RmxlrDrnJyzYZGFUh3/mOmDqDoNTsSDMpaED/RAt4kGwmcq4+53OkiUM47TpD/scqjqN/ZQ1bBSE60WmOlhXmCPp3Tgdik7x6Kw4wPdTEPbD3vI/6ZCGOeOWuCPzNqb6GK0c/zdh6KAlztKh0FAXx1BJQpSzMB1JZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NOo1f/Yo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NOo1f/Yo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4393a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 15:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752099681; x=1752704481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRn5Xzu/HIT35eBhvWLX/C6sWrlucrMXJNu5lgmdO3I=;
        b=NOo1f/YolH3hFdMZ3L4Icuku0jmw/RQrBFgMt276heJYnThclbbBdKcMDFcdVR2rBA
         eYSfb6ykENaPV3yerS80OdwC+SdKmGo4QYzOlvC3v1cNKwokcYhbMdd/wldReRp/qHRa
         fGBcsqMye3Bnc+Z4BvaE0N1yH4U9xkVqO+ziKJ9PprP1yFEQKYl0U3NSX77KuCMpg/DI
         1N83U41Ry3EB8DLCP+GL8U0CwSlfphVXzeLfMoTXVHm4pR+tQDga98ZjFaIgNp8X9B2l
         MCO5+pRlWw0VMEXeHid273JwdsJs6+JgxyzvSm/Ff6KUc3mqd3/e8FoTYd/14vDszmuQ
         JsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752099681; x=1752704481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRn5Xzu/HIT35eBhvWLX/C6sWrlucrMXJNu5lgmdO3I=;
        b=LFgObaDyd7HnyKPPL306+LzTV1Yz8gJchJ4tMwdWB2OLQh+CqCMFLs7CUdyEvFwK0F
         TqlBqzwkIb/hr8475tW3uA3hhL0b9PeClZ7b6czRt4C2uF/WNLeC9v24tvfFsPLGg3Ic
         7RdDTac2cM7rcMIVVveekU6AtWHTeXoW7H4Jcao+03fjHSZU25po+Us1q/3lD2+hlj5K
         kNPHDR1xPo2Z/rLJRBYDO8kGoBleFNtOTLUAFfTvRjgJhVs2PcqmqnzarduT7TGU/CFG
         y5bQvr1+3p1ogwTKibTEBJWgwlHpu5coKA+4ME/PJS/go1+tyw/V22b5+9CO57EZvemr
         CfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz546LDxdYHBifTgGHqzrOHpvcoI1evDj8Au2YbPHlhSPRSMn83yTkAeQrjx+1WaV0VbvBfYzKWpmKwtNT8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJkM0YakE8pVbTNdEU+dD5dwyL2F4IA6OuyBbqn52myupFJUs
	DkVILuIKXisJyqfzzPagis1U9+W3v8S+uWSvsEeK5Gu3/mXxO/oQYgRKqJjDAmWDudxt+jxFybe
	m2i66ZSBN7AfUgygthRtXT4seDLPH0M49tUpkU6fG
X-Gm-Gg: ASbGncsFHMcnYZjqE6tMSC+NeQmNAXFBGyIJN3QxO7LJ65qYGQcje+U630kmYRRo/Zf
	+8BEP0fKbBUdnHpjObKe5aLcnRF57doj9Zl5h0U8RAqspcO6mfYneUOI/VpHKcR6dp7c+8E2i3d
	9CjjKcSFC5M2QcdlImF5i2ps0zesqxld0vgkKrdSKSTM6nwkKZ0blziEQyGEECGsgG97zATj3f5
	g==
X-Google-Smtp-Source: AGHT+IElpydce8/aiG+Co2qqFsWk4TL43jhm64lTv49EhFptJ1RhxZaus7tO/Ghn0kH6oitJUQaaNS3bgEeYmpkUgvk=
X-Received: by 2002:aa7:d393:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-611c7970cccmr12327a12.7.1752099680891; Wed, 09 Jul 2025
 15:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-debugfs-rust-v9-0-92b9eab5a951@google.com>
 <DB7US8G7ISG0.20430M3P7I0K0@kernel.org> <CAGSQo01hORWAtrGaYp-_xxrAiN47JkJg=jiqnqdpw87QKzt9jg@mail.gmail.com>
 <DB7V19QE6KFB.3MR0BAOWXT7M7@kernel.org> <CAGSQo01drZoy1-j-+Y-BHHOX5AzCG4A5KiUOu5TJ40JOdfcB0g@mail.gmail.com>
 <aG7pP1BTLQKInFrl@cassiopeiae>
In-Reply-To: <aG7pP1BTLQKInFrl@cassiopeiae>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 9 Jul 2025 15:21:08 -0700
X-Gm-Features: Ac12FXySMpY36tMHMG71IrRFYO_x2FjYq0SXxQFyheNY1upiOBF5N9pRRg3iQ8g
Message-ID: <CAGSQo01ge5QvhRtq9razpmrMNSPJuT3+q9Cafd1Hd=wmEjXfBQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] rust: DebugFS Bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 3:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed, Jul 09, 2025 at 03:04:51PM -0700, Matthew Maurer wrote:
> > On Wed, Jul 9, 2025 at 2:59=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > On Wed Jul 9, 2025 at 11:53 PM CEST, Matthew Maurer wrote:
> > > > On Wed, Jul 9, 2025 at 2:47=E2=80=AFPM Danilo Krummrich <dakr@kerne=
l.org> wrote:
> > > >>
> > > >> On Wed Jul 9, 2025 at 9:09 PM CEST, Matthew Maurer wrote:
> > > >> > This series provides safe DebugFS bindings for Rust, with a samp=
le
> > > >> > module using them.
> > > >> >
> > > >> > Example interaction with the sample driver:
> > > >>
> > > >> I understand what you're trying to do here, i.e. showcase that val=
ues exported
> > > >> via debugfs can be altered.
> > > >>
> > > >> The problem is that the current abstractions only implement read()=
, but not
> > > >> write().
> > > >
> > > > I was trying to keep the initial bindings simple. Adding `write` is
> > > > definitely something we could do, but I thought maybe that could be=
 in
> > > > a subsequent patch.
> > >
> > > Absolutely, yes! I didn't mean to ask to add it now. :)
> > >
> > > >> If you really want to showcase changing values, you can, for insta=
nce, create a
> > > >> workqueue inside the sample driver and modify the counter periodic=
ally.
> > > >
> > > > This is supposed to be sample code, so ideally it should be as narr=
ow
> > > > as is reasonable in what subsystems it touches, no? If people would
> > > > really prefer the sample schedule a ticking counter I can do that, =
but
> > > > it already felt weird to be registering a platform driver in a debu=
gfs
> > > > sample.
> > >
> > > I'm not asking to do that. If the values don't change for now, becaus=
e
> > > there's no write() yet, that's perfectly fine with me. :)
> >
> > Potentially I misinterpreted Greg[1], I thought he wanted to see how
> > mutation would work.
> > If we don't need mutation, I'm fine simplifying the driver to not have
> > any mutation triggers and just export a few random things.
>
> I mean, the most simple way would be to create the debugfs entries in pro=
be()
> and mutate them - still in probe() - right afterwards once. I think we sh=
ould
> do in any case. And AFAICT, this also covers [1].

That's what I did with my `InPlaceModule` before and it evidently
didn't count? I don't see how the constructor being `probe` rather
than `init` would have been the issue - the only change that causes is
calling `KBox::pin_init` on the value you would have returned.

>
> > [1]: https://lore.kernel.org/all/2025070349-tricky-arguable-5362@gregkh=
/
> >
> > >
> > > >>
> > > >> We really should not teach people to modify values by read() inste=
ad of write().
> > > >> Also, without this workaround there shouldn't be a reason to expor=
t the exact
> > > >> same value twice, i.e. no need for File<File<AtomicUsize>>.
> > > >>
> > > >> - Danilo
> > > >
> > > > How do you feel about the `Wrapper` struct, intended to simulate th=
e
> > > > driver doing its actual job and show how that would look? Is that
> > > > similarly verboten, even though there's a comment on it saying this
> > > > isn't how one should do things?
> > >
> > > Yeah, let's not do that -- don't give people ideas. :)
