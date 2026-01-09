Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F4F31D38A
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947000; cv=none; b=sQMcf4rpol4RZDRVBoo+1TeP7IqJaB/LVr1MgC4S98wKBNnkcEtc6DnYvf7XBcck9wsG+qsNg3Zdx7MttSBFjuMgf2nBPJI3iuI0Q9Dm+8dKHxrY5wDUMFMzA+x+aSKb5mu9zUNKQPVafQtGiU1SfBy4ef8u39triseaSPgPl1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947000; c=relaxed/simple;
	bh=vBPt4h3wZHY2UNtA6qX2YDSxcBcfgilmBq2e3leduG4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iim7Z0PvqriSmdzp0B249KwRvOriKbu4d94ul1c8ZyuP31Nu+6AKV2JS3KQbV6CdBF5WOFLiGIgNxEIZYEDqXxwej648RGzjityUYRGvc3cAF+4iaj7yI6J1vUFEaC11SRW5hhvXxQCBC+g5lY33P0SgQ8xlSHS4+05EwcfojEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZlUcKXIQ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZlUcKXIQ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-432a9ef3d86so2072417f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 00:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946985; x=1768551785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+OIYQwN5Lnpy5XafsdsgLoQcdxRCARoCXPEgNNxga4=;
        b=ZlUcKXIQbDvZfPppyw8bxVFE3OvYEaQWsebPZjYQmMfVBpD4l72sL0UQWi0qMsTnE3
         jo4uLTuGpSOtRCMlYFImfeTTUjfLCOpRf6J6AfeguEZnFDiQfQ2JpcZHL+YvfwQgWfGC
         MfK2kbreCJ5LdUCR/kSr6SegCRM5m/EsEKFWn8JYVI9PlMlo0CSz40MYCoUVE+6+43ii
         ey3hpq3hDgE05r02zBeCfXCEF+fOEmKKbAp0TUA8gcBIpAa0J2Zp1nNaNQZfj5MnY2WM
         RDGcEIF7zrth9gfURjtwqEVNm2GlNqlycbX+2/sZMucIQLlAmmM+QWIGfIZODq81ua/8
         hv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946985; x=1768551785;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k+OIYQwN5Lnpy5XafsdsgLoQcdxRCARoCXPEgNNxga4=;
        b=LITePgQ92/050ETjA8cq896kQJ87aFgqvbXAxYFUUnqTgPLE1SFTDb1inJtCAi5oYN
         yf3oof09uUNezQH0rytGpr3Fut6qtIz3jOScyhe0JfVMpAtk5uBxYA4PM+t26AEsJE+F
         MP3F2sZ59Lip6bxXZoenI5uxlcuiYOlD6U/ZzBYm4v4PGUD4QUg6PZ515L9jKBJfQESV
         lWnMq0QfoL73Ms+V94PbBFzL4s1Rxe94hLb2sPMPRzDAVlVwtVS0ARVFVm3JqnhIqvaE
         EsiiOJxWwMacQfR0nTIqSiAeidH2WOXU8FH878wsPDjDxyuFYYAtuugst0ZoKSUBL2C2
         jRpw==
X-Forwarded-Encrypted: i=1; AJvYcCUnAq55f0klio3AErcXe24YA7Yn33BOifBs728xrhQWk8/8ByAponQgK4lgCw6PTyzWCZ6StN3B1+VLiiy/IA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jKLNlXDYSblE7BryeuFuYND8HxpTB8kEmUFS89w2JgJC+wde
	dXvrcZE2tF6GWrii8W/U9ZYuZrV7XMq+b8OMvdWD+vPOUvHagtgyGVvD9YOPDg4thNzIN60fay3
	rPZQqWnHPL4SCkkJAHA==
X-Google-Smtp-Source: AGHT+IE7U59bnurv+WF3qIn8ev80ktuI3hTbWJPBTAuiBuCmwkciUQLwJTbfII0vWKYLFARalICFMpRepoekZpU=
X-Received: from wrbgw11.prod.google.com ([2002:a05:6000:40cb:b0:42c:c2d6:2a3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:144c:b0:42f:9e75:8605 with SMTP id ffacd0b85a97d-432c32f5a84mr9154998f8f.0.1767946985172;
 Fri, 09 Jan 2026 00:23:05 -0800 (PST)
Date: Fri, 9 Jan 2026 08:23:04 +0000
In-Reply-To: <20260109.093641.1161098806794561807.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260108125005.2945800-1-fujita.tomonori@gmail.com>
 <CAH5fLgj5UsFqXpT_RMhsYeKZkA+KgXBDw89q-HQEozQKLwNhXQ@mail.gmail.com> <20260109.093641.1161098806794561807.fujita.tomonori@gmail.com>
Message-ID: <aWC66BAmhDgyqpfJ@google.com>
Subject: Re: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic booleans
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 09:36:41AM +0900, FUJITA Tomonori wrote:
> On Thu, 8 Jan 2026 13:54:58 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Thu, Jan 8, 2026 at 1:50=E2=80=AFPM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >>
> >> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
> >> users can use Atomic<Flag> for boolean flags.
> >>
> >> The backing integer type is an implementation detail; it is currently
> >> i32 but may change in the future.
> >>
> >> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
> >> particular, when RMW operations such as xchg()/cmpxchg() may be used
> >> and minimizing memory usage is not the top priority. On some
> >> architectures without byte-sized RMW instructions, Atomic<bool> can be
> >> slower for RMW operations.
> >>
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >=20
> > Can we have a `struct AtomicFlag(Atomic<Flag>)` here whose load() /
> > store() methods use real booleans? Otherwise this seems inconvenient
> > to use.
>=20
> Do you mean something along these lines?
>=20
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 473d3c07e234..19750be1a239 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -622,3 +622,29 @@ fn from(b: bool) -> Self {
>          }
>      }
>  }
> +
> +/// A convenience wrapper around [`Atomic<Flag>`] that exposes a `bool` =
API.
> +pub struct AtomicFlag(Atomic<Flag>);
> +
> +impl AtomicFlag {
> +    /// Creates a new atomic flag.
> +    pub const fn new(b: bool) -> Self {
> +        if b {
> +            AtomicFlag(Atomic::new(Flag::Set))
> +        } else {
> +            AtomicFlag(Atomic::new(Flag::Clear))
> +        }
> +    }
> +
> +    /// Loads the value from the atomic flag.
> +    #[inline(always)]
> +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering=
) -> bool {
> +        self.0.load(o).into()
> +    }
> +
> +    /// Stores a value to the atomic flag.
> +    #[inline(always)]
> +    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o=
: Ordering) {
> +        self.0.store(b.into(), o)
> +    }
> +}

Yes, that's what I meant.

Alice
