Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462043112C0
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678175; cv=none; b=RstUk+Pd/2OFqVDEJ6rwn7mEL89SiwEF5RSwnyTNe0GGS0LhPyej2kmy312sprOYV/DBUHzsErO190VQo8FwQ6CGH+j7dq8wQIbY6aFc2T6z0cu5bF1rFACZkxuC3CPuvvk/Huvh4zMihn+PcdJELRLKgPuonUiJYqBW2qqrmyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678175; c=relaxed/simple;
	bh=pWe6+giiiKN7ygWHpgsDbutK/nK8fllT7LHQnwMycfQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hDCgfRNCh676BMknb1UYkYVLbOxphNkYScjG0tquRWVR3BUTVaaZc2IWMcKidgBHTLy0jUr0FueRofJbiJAfirGxjZeMg5OR+Xd/SWlKqJWsANeflStyI/DVM3WPEDbfUghDTnwIYgtv/fNLqm+ADlLjxasewhDAiosmoc/6Xh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L9CLMF0v; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L9CLMF0v"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42e2d02b528so1869947f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 04:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764678173; x=1765282973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG6TZ+lvc6AvBf3kAUv3CSNPcBSdqg2e2HCc+7igxJI=;
        b=L9CLMF0v+CP5kMGBi53cXKtkQr4rT75w6k5TmyufVV54cGdUnLCrsfXJHPAGW7fO+s
         aY2EbtBaSLg7KJyR/zk//sM/WXuE9A0pp6o2Pzh2TGjW6xg10Wb++WUd9QVwf42iFgZO
         j4eYakgV32aeUIqhwoIaqBt0MUU4JiDML1fLqFVhDmVyajcgDOqCZnDFV+1VjHTrH97w
         +DwtrgQwDq8hqgtQD82DUz962q91rNhjPpHqKWksUxQtCXN3mBWPPfoG/o37YhJ2MPon
         wQBkB+bktgbgRIohFJyS+QEWjcN+F3mfTXHUXXefs1OVxI8zSrf68r5uHvzJQ6Q5RSga
         IZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678173; x=1765282973;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tG6TZ+lvc6AvBf3kAUv3CSNPcBSdqg2e2HCc+7igxJI=;
        b=lXqhPz/2V16L08UykoIzEtElmsnBGoWO/PKhd91891+a3g9iNz6HShEZnNEjRFHc6k
         Adexjp6+OV6lfRAzg8vWiwvfC5sivJPNAJqCMzq7U/Im4UzpmJTC31TbhT2stpo1A23V
         VSmY6iKO3RMLeCERQzrUYKRJObTMiZhkK4+SsdH52Aosfp5o9Q9UQu5GTtd1BNizDUAc
         r73I4q+RKBmP4oGnCPyVryl7nvidupgOPuAgpHOQKJymgcD2VRjyYCUyvLi/QsfX2XXE
         To5q0WE8FflTq0Xfpq7/djur75uzxYHeKi9Z/lofGIvDkWPIdqkq1oDY1EscLyXsDszT
         Zxsw==
X-Forwarded-Encrypted: i=1; AJvYcCUBkZphiDYc5MY5zpHGEeqwB0xwZEQsL59yMht/CsqyQ8ntOE6G6NZrItQsxGQtTaZiBGqGX04K6d5U0b8XBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AiPFxZaBQVjQMUJMBJNATofGv3/kcNPvGJososOmc/4eS58w
	sxg+w+tyU1MjE84YYT0MjdJiGGfhlMroBO6WOxUGqKj+mUAonczBEXyD8XVunln2UupXiOHqwT6
	OhwAzcOZuAVllnHWheA==
X-Google-Smtp-Source: AGHT+IG293sjcaTqwvNWJNNZvfIkK6AJIFsV1HBwHGuSZ3ABuviusOdhyqCdhJ0d6RGcMV3jUs9iiMhGsbe5Qu8=
X-Received: from wrj14.prod.google.com ([2002:a5d:5a4e:0:b0:429:c639:ae9d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:184a:b0:427:526:16aa with SMTP id ffacd0b85a97d-42cc1d23e6fmr47464249f8f.58.1764678172786;
 Tue, 02 Dec 2025 04:22:52 -0800 (PST)
Date: Tue, 2 Dec 2025 12:22:52 +0000
In-Reply-To: <CANiq72=1ipov2pV9pSQwGh9WMA4NvQRV_cBCO0hhChVg=c-Njw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201000949.1626363-1-ojeda@kernel.org> <aS3seTNRum3ZXMom@yury>
 <CANiq72=1ipov2pV9pSQwGh9WMA4NvQRV_cBCO0hhChVg=c-Njw@mail.gmail.com>
Message-ID: <aS7aHIJbi3DlaUcc@google.com>
Subject: Re: [PATCH] rust: id_pool: fix example
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Burak Emir <bqe@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2025 at 12:13:33AM +0100, Miguel Ojeda wrote:
> On Mon, Dec 1, 2025 at 8:29=E2=80=AFPM Yury Norov <yury.norov@gmail.com> =
wrote:
> >
> > Thanks Miguel,
> >
> > I applied this, but the fact that you've sent a second fix to
> > documentation that actually is a build fix, raises the questions.
> >
> > Because Rust documentation bears compilable chunks of code, I think
> > we need to enable rustdoc tests target by default, so that developers
> > will not send broken tests.
>=20
> You're welcome!
>=20
> This one is a Kconfig in the normal build, i.e.
> `CONFIG_RUST_KERNEL_DOCTESTS` (it is true that the other patch was for
> a different target).
>=20
> If you mean enabling that by Kconfig default, then I don't think we
> can do that -- KUnit on its own (which this uses) is not meant for
> normal builds. Perhaps we could have something that just checks the
> build, but people should really run the doctests anyway, since they
> typically contain `assert!`s and so on that can be wrong.
>=20
> If you mean enabling it in Intel's kernel test robot, then I think
> they do it (or at least I told them about it long ago). But maybe
> something is missing.
>=20
> In our P entry in `MAINTAINERS` ("Subsystem Profile document") we ask
> people to run them among other things, so I would perhaps suggest
> having something like that too (or linking to ours if you prefer):
>=20
>     https://rust-for-linux.com/contributing#submit-checklist-addendum
>=20
> Of course new contributors will miss that initially, but actually
> people find the doctests quite useful, so generally people get to run
> them. At the end of the day, maintainers should test these too before
> applying and otherwise someone will notice sooner or later.

Yeah sorry I forgot to check the docs this time. I usually do run them,
but there are so many targets to check that sometimes I forget some of
them.

Alice
