Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC328DB5E
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305807; cv=none; b=ReQtBlA9qNqtwG5PiOYqV1b56BYV1VKwZEI6pGYvTDILprpJB+il4PrYSaeiBlG8MMTi0yXSPbRUJLOAvFd6tvZqHFJYL0kz1H3jXRcvXTQ7P63XFlxpkwKZwUz+L3kXolLI8smbIE1/oW0vWKdPVB0n+3Xu3hzlVhWdb4Z/Td0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305807; c=relaxed/simple;
	bh=jtBAh61eo0EeByotAJ9t284PGK7v6gs8WxyD+wVpxz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0gLhMvoRK873MZKXxg6QNDMBkAa3thgCdtIYaG+PwBqMjQ3oMUvnuo/JV2+QgawpgBjO1TlM9RYY5F06saMjehtE7acCgiVL1ycei+sePR+Zie3dN/2sEPwRlnW4L5+MsPWAOsmXJQVZtmV8KrFwaDLaTPmBKH8hCYjDwQiXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=feNHTUPl; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="feNHTUPl"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so919a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 10:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751305804; x=1751910604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76brGv/BgtxSswRKiKcCmWnnES0+jnt9FCnim3kL7ic=;
        b=feNHTUPlAMF9WKJJCYvr43EfOR1E8ObnqMKN/gegGVi9qnI3RW02Fr3H8lGm3W64q6
         6vvIoPdnXA4Ie6FuvJHPLDW1foQLCge4PuFZnudlv6WdYUc0LG6OSwU4X+8Y5QhnyVk3
         5KkjANm8tfMNtRb6gzjGwgT1TZizJ8Z70syUWsBSrDs8Ij7ehfuWLbb4h2ai3NKFSqbm
         8A/3CeXHENlIRY6hJjOGr5Bfremkl2gxuv9TVeg19P7yc9YrbbOMW4XBti3UfwS1RWEI
         xiiBlCwPlQeMvlLJmDqYrLcADPQKhJPysIgz2L1IPtwytHSNkeVweLokCdfHiTjTC5LJ
         PZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751305804; x=1751910604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76brGv/BgtxSswRKiKcCmWnnES0+jnt9FCnim3kL7ic=;
        b=QBNTwzLzpcGthQl1V04sJ5PwqgfIU7XqlX+B/QtYA3kXBUCu6abcp8muV99VBcjRP3
         /ktR6v/18hajLFIhiKPf39rfVQM1+CphEiqnR1IBuEqHWOBmkLFoa/8o5fQOk/4th4q0
         INug3+Mg/IlNHabNgyschyrYovuyz78gkgUuFn0Ho34QoOWZuJ2AsmM1BbzrXzeja1O0
         jNJrtUP1eQJWCIJxkvpeaBgBVvKVZF6FrGPlNA9IZtZTYguyQtdTpJXZ6aDdvJUX9rMM
         GGjw3YOK5hzJv/EU1V+QNrb508vh7r+EbWLf4ZNQmmRVKeIdvMFOmTpD4hnHoD6GHLLI
         MQtg==
X-Forwarded-Encrypted: i=1; AJvYcCV015HfZbTmKhkhg3CLaSAK8ULThREq5fckcZ7kMx7V77O2/Dlz8vXt+mdA1XQfxqO7M5BGCgrGxkNerM3qFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DVKJflqp0RJkiV0581/Cx1sJjTk/Lzy24HiJFrsPeV8Xy73k
	pSbifEv66fhN/nFPayHGqm25CUfdyW66hETznwRfrLtDHf560kjSfOTdKa+ZiszlEffZOsq1NHb
	TxMiq3WpvSGhyY4/25bvHrtabLQqThrAr2W1f1oln
X-Gm-Gg: ASbGncu5lrNOh9jlbCQ1VgqB67CKPG+uv2DRshYcFL8rkSZyzKFg6ToE7muYROsCgCY
	PjSBsWNMNGpOdoUd2Gferg+rc0R79l3ICrX8FclKYZtVfok8hBZvwMLtMdv8E32fHotdhZvM0d+
	xhbXLLEvxzxdGn6eMeHX9W0LmENr6ELHVGsjSv3yuw5FthUCLjLetlQgAqxeALZAONJ8GHIYhag
	Q==
X-Google-Smtp-Source: AGHT+IEBh+CI1cqbf9pISH7sgVGVe8cH6ru9riKzQxd3mXVmfQQKDyhT7yHW0zn80ZiahZ91yr+FC86cM4JVvl1UeZg=
X-Received: by 2002:a05:6402:896:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60ca584adb6mr184127a12.7.1751305804107; Mon, 30 Jun 2025
 10:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com> <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com> <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
In-Reply-To: <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 30 Jun 2025 10:49:51 -0700
X-Gm-Features: Ac12FXydvINMsfkKHMbbsooaS2GwZAW6fvVuzb2ElTMCf6xlExh-W46KWpkEgfk
Message-ID: <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:39=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On 6/30/25 7:34 PM, Matthew Maurer wrote:
> > On Mon, Jun 30, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >>
> >> On 6/28/25 1:18 AM, Matthew Maurer wrote:
> >>> +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) =
-> File
> >>> +    where
> >>> +        for<'a> D::Borrowed<'a>: Display,
> >>> +    {
> >>> +        File {
> >>> +            _foreign: ForeignHolder::new(data),
> >>> +        }
> >>>        }
> >>
> >> What's the motivation for the ForeignHolder abstraction? Why not just =
make it
> >> File<D> and store data directly?
> >
> > 1. A `File<D>` can't be held in collection data structures as easily
> > unless all your files contain the *same* backing type.
>
> That sounds reasonable.
>
> > 2. None of the APIs or potential APIs for `File` care about which type
> > it's wrapping, nor are they supposed to. If nothing you can do with a
> > `File` is different depending on the backing type, making it
> > polymorphic is just needlessly confusing.
>
> What if I want to access file.data() and do something with the data? Then=
 I'd
> necessarily need to put my data in an Arc and reference count it to still=
 be
> able to access it.
>
> That doesn't seem like a reasonable requirement to be able to access data
> exposed via debugfs.

`pub fn data(&self) -> D` would go against my understanding of Greg's
request for DebugFS files to not really support anything other than
delete. I was even considering making `D` not be retained in the
disabled debugfs case, but left it in for now for so that the
lifecycles wouldn't change.

If you want a `.data()` function, I can add it in, but I don't think
it'll improve flexibility in most cases. If you want to do something
with the data and it's not in an `Arc` / behind a handle of some kind,
you'll need something providing threadsafe interior mutability in the
data structure. If that's a lock, then I have a hard time believing
that `Arc<Mutex<T>>`(or if it's a global, a `&'static Mutex<T>`, which
is why I added that in the stack) is so much more expensive than
`Box<Mutex<T>>` that it's worth a more complex API. If it's an atomic,
e.g. `Arc<AtomicU8>`, then I can see the benefit to having
`Box<AtomicU8>` over that, but it still seems so slim that I think the
simpler "`File` is just a handle to how long the file stays alive, it
doesn't let you do anything else" API makes sense.
