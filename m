Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5E239E8D
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752098706; cv=none; b=nAA8ib/ZDDk/Q51pmWlLMfCwBbTNG5u9Mqnpw8FR0UenTkevTgUJ9cUnS+TWEx0EE+LHLMJysiDFNtuILwxUOnceyLadwI1SP3Vma9kczZ7d9lptze63jqce0eUXt7EFpjfS3b8BV1li/Cr3Dm++f0q1FMbfdk2QQ119y+NedIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752098706; c=relaxed/simple;
	bh=vn7EJCVn7vkbl/99TMM91++Va4PiEu2rnwusD2cqc04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZeFetoqOahhjrEWMfvprFqpnVqnxQeYvFbexIVGNAWg0Lopr0KDIbgLIodJBdShIHI3BpIQTlW/zOimnvfqegACbD+eZi15pArhuDYaCTFLjcgieV21bP3AfKXCHF6GDXlhiJV1MicbEw4QTbeQBStNd840koF3Zv1wA3hKNE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qy9i49LT; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qy9i49LT"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so1907a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 15:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752098703; x=1752703503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn7EJCVn7vkbl/99TMM91++Va4PiEu2rnwusD2cqc04=;
        b=Qy9i49LTAIrfq2A0CZWH3j7JU8KK5FgEISRoaNJxBFR8IldWmlAKwm9wOP1rYgOpC1
         T6Hn2E9VPv8V8L2QJnL/kDCN+8Wy5IEd3qGcGDNqLIWe0WZNqXFAdsdFDKBejLDb+ptH
         S6bWm/0k1siZUxUzwhlvYkUnqSdP2kOVu2UQSRRWDuBBJEogDQfgg6sW9WmazknAh++Z
         Uk/XxdWBGg1aYAaq1K5Kdyky4p9w0ijUPA1Acf3p6j14o9Ab6p8Ru4TLD3UMMH0bRtxI
         sxsPfxynJJmWQsVC+yZ81idjLi7czckathpyXdPK0OfyK8RIwpgyr5nDDsrXDjT3OEWt
         hP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752098703; x=1752703503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn7EJCVn7vkbl/99TMM91++Va4PiEu2rnwusD2cqc04=;
        b=i1RfLPaIfbWkfN9Q13bPOHEJMqORxOcQHEfAa4i0Q1PTBml0Mv6q7pAq6oTJDwVoUl
         oFDal/imroGuaDPw4DXHsmmclvwg3hawpZg+dL/TYsRYHAdrVo7/WxqX7nDcWAbpfXqn
         FFXx2KU12h7COQ1y8aDNnHn3qVeb2atDfdAGfw6tzlhDG7ySPwfs2iz7e1FiQMFZhHtM
         W5HjVDZ+SQuVuFDLsCqGwHH6GnZQ/mfpezGeajQhLTEKzCBougjgTV7JpAYZR5nEs5J7
         Be3Jh6PGx8e2Z3ikFEr+abEo46UKyCCdXw39sldaUvn5CCrrNG5eI4aJh8iFzDB5EcNC
         /u6w==
X-Forwarded-Encrypted: i=1; AJvYcCWradyjOEFFAWBaNpWXqjj7KPt18oN5j1FHfye+1gkpnqkbiJ0jn/nwfSYehHHUfT4SJfebXhPboUK8VAB93A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqOE+5WjWYIBO1ODoJg6aNCh4FbGe+/aTKxgCyQOPDGN9wsUO
	gsSXNIYCqJ4AaJN3ztqv82KrOnPsfEKZ9Cge0NqShi5cB5V4CF2v7D3MKwtocRnwMprqiaVr4AT
	SNdicrsxFEAn5+AM0XDL7sWCVvEZ812IiSUnziv07
X-Gm-Gg: ASbGnctKD54QP77JxnUN7HpkfVWAEHmxKmMVkNx3/A7nJASF4K4uYb8ijlCRhx2vLoi
	/CnAMn9sHDZCxaptsHZRiIcEVE2RFqPf8/0nJrFHzByRkMxkkYwCqBSoS8s7v8JZlb4OQoBE9ES
	uDLGlKQRolEzRkIS6ya6QYlv/zBd2/h+wH6sXCt+dySNzzoQQ/eZjw0OwubdobWagNwmqz8Nu5q
	Q==
X-Google-Smtp-Source: AGHT+IHMY2S2cOq4aj7R9JhuwZRVDDRnUaRyOd/9Y0XjkBE9lTZ7Q7zt7tkV73zfMNNQfimDA/LHV+q48SyKRNdcNnw=
X-Received: by 2002:a05:6402:a41:b0:60e:3d45:c65a with SMTP id
 4fb4d7f45d1cf-611c79717abmr16007a12.5.1752098702766; Wed, 09 Jul 2025
 15:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-debugfs-rust-v9-0-92b9eab5a951@google.com>
 <DB7US8G7ISG0.20430M3P7I0K0@kernel.org> <CAGSQo01hORWAtrGaYp-_xxrAiN47JkJg=jiqnqdpw87QKzt9jg@mail.gmail.com>
 <DB7V19QE6KFB.3MR0BAOWXT7M7@kernel.org>
In-Reply-To: <DB7V19QE6KFB.3MR0BAOWXT7M7@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 9 Jul 2025 15:04:51 -0700
X-Gm-Features: Ac12FXz-6atGuBPiC5MKmxYtYy_PzNi1g8QW4v6Xr2bH3tjr0kUa_yJ4Vji2mrw
Message-ID: <CAGSQo01drZoy1-j-+Y-BHHOX5AzCG4A5KiUOu5TJ40JOdfcB0g@mail.gmail.com>
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

On Wed, Jul 9, 2025 at 2:59=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Jul 9, 2025 at 11:53 PM CEST, Matthew Maurer wrote:
> > On Wed, Jul 9, 2025 at 2:47=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >>
> >> On Wed Jul 9, 2025 at 9:09 PM CEST, Matthew Maurer wrote:
> >> > This series provides safe DebugFS bindings for Rust, with a sample
> >> > module using them.
> >> >
> >> > Example interaction with the sample driver:
> >>
> >> I understand what you're trying to do here, i.e. showcase that values =
exported
> >> via debugfs can be altered.
> >>
> >> The problem is that the current abstractions only implement read(), bu=
t not
> >> write().
> >
> > I was trying to keep the initial bindings simple. Adding `write` is
> > definitely something we could do, but I thought maybe that could be in
> > a subsequent patch.
>
> Absolutely, yes! I didn't mean to ask to add it now. :)
>
> >> If you really want to showcase changing values, you can, for instance,=
 create a
> >> workqueue inside the sample driver and modify the counter periodically=
.
> >
> > This is supposed to be sample code, so ideally it should be as narrow
> > as is reasonable in what subsystems it touches, no? If people would
> > really prefer the sample schedule a ticking counter I can do that, but
> > it already felt weird to be registering a platform driver in a debugfs
> > sample.
>
> I'm not asking to do that. If the values don't change for now, because
> there's no write() yet, that's perfectly fine with me. :)

Potentially I misinterpreted Greg[1], I thought he wanted to see how
mutation would work.
If we don't need mutation, I'm fine simplifying the driver to not have
any mutation triggers and just export a few random things.

[1]: https://lore.kernel.org/all/2025070349-tricky-arguable-5362@gregkh/

>
> >>
> >> We really should not teach people to modify values by read() instead o=
f write().
> >> Also, without this workaround there shouldn't be a reason to export th=
e exact
> >> same value twice, i.e. no need for File<File<AtomicUsize>>.
> >>
> >> - Danilo
> >
> > How do you feel about the `Wrapper` struct, intended to simulate the
> > driver doing its actual job and show how that would look? Is that
> > similarly verboten, even though there's a comment on it saying this
> > isn't how one should do things?
>
> Yeah, let's not do that -- don't give people ideas. :)
