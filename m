Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B7C1A2C0E
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309064; cv=none; b=AKukcf16XFJOoJNsW+7ljoYEza8thcJiJ7EvCA3nnDHbjvHiI8UEHAC/N2P0GGVaH+2IYfI4Qw2cUqd7YhpUbZw1aPuDqCgIKiPiXtoYP9N54zR7B0yFzsjln1o8zyefwfsSfjE/AZiDUIXSWwqefUHxVF+lnuQaWvKcMtgTGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309064; c=relaxed/simple;
	bh=fLIyFC84cNuRIkl6BuqtHem66qsH5HFpSzxSSvlHDek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gPL2S4c4Zkq+a7jXeFHkPm/FKTygHtwdjAu6z2Kax0PUqJg24MYV9Sf2gwW3AiSMu+R5CVJaxG42sU+B65bf6vXXSjydmCIv3SgrAeNbHDcVr81/mdYNA+AZLVoTdumoBr2n/yt12nWQqjv04EspSlGiFwZ25NDpGouGTQLF/yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lq6J+6wY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lq6J+6wY"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so29412725e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742309057; x=1742913857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfhIGoNUej7lluGTETydFlNEk1+KiJXUugkQI5WYNmw=;
        b=lq6J+6wYk0wTEQ98YnBgrYUpdqDRZCnDpxwOtcv5/ATtDlG+3nnrRMXRJIK4s4I7he
         gFKt2ZU9udRU4Tca5z1dcHUvNsyOQcYd3vdKbPcynCeq19HTbHiOgzcLuZFsquLGsBN5
         PzRXe/MTk4WcVs2/eeX6sdTb15peLvtf3AIENyRq7x7XeMaZ8brtHOAKGzFE7Y5yhHlf
         5Mrg30c/xS5CxIyF05vAkOmkFG17TMeCCKf3rMCaMfMCHj2gbIFxBSjSKSM6Bpwl1eet
         cA8NRYIRb1lajCzyO2QbbsGANEod8aO3JzqVx5iM/yokNY4M+NI5GHZeoRlkXWsvTAEe
         bZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309057; x=1742913857;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VfhIGoNUej7lluGTETydFlNEk1+KiJXUugkQI5WYNmw=;
        b=LlJRKqKMVFq7r1XA+qT2tO6VREZbiNyAoxNohC4rrhNRc7Lnzhg8rrds/EKnAtFwxn
         sHMw8wP0NO2mtZYBg3UoORcuY98C8SJwRfrtb/XDTEthecdxsfJisvSw23VuHFQraB3a
         OEmMxM+/CMgzuYpa8aA/QkBP7KL1MurPWb5OQ5zMFI9q0LOaqVkPRSfoVb34PzTq6o8f
         FfPADQGW4cXrHleyunlRm1/iLFf2/0cc4u/CFE5z0d1koJYyieKJV6nlMdcwK0ksSuJo
         8orxIHh9iy2JY7vCAWf5LjBeUzmbp6QyZheoCc6BvxUTzG5BuXrvx9ScARC0uqH94wuf
         waCw==
X-Forwarded-Encrypted: i=1; AJvYcCVw+ZJd0CdFV7rybyHnPe7elVsDFdD8D4mxcUwuU4dKq7CZQk6LKIxTxZVjp2Tvy2NZnN+U35KqH8M9rbuDzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2lQvpuzJaxlGdUBXSeIfSK/AWkk9/ctImcr+Y6Faj2o8WLbj
	/nscreXXQ7YiLswSh98g+j1I8aIzfalV1QbgpzqewYNOdoSnhHJKA85LbbnTk2KifLwkgBBECoG
	LHEeRNaMQLw0wzQ==
X-Google-Smtp-Source: AGHT+IFNwcYMuZzCzcsU2UV1EOAK+v46c6jOpysGPV/S/nwnOcf365ojUr1p2lUcWGDAiU0cfSh+OfVPYWtWb74=
X-Received: from wmbgx14.prod.google.com ([2002:a05:600c:858e:b0:43c:eaf6:525e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d85:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d3ba30defmr29194635e9.31.1742309056796;
 Tue, 18 Mar 2025 07:44:16 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:44:15 +0000
In-Reply-To: <CAJ-ks9kcNvGqGrU1nKjYs_4XPbdxo2cW8Tj9JOGJesGO4StdAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250316-vec-set-len-v1-0-60f98a28723f@gmail.com>
 <20250316-vec-set-len-v1-2-60f98a28723f@gmail.com> <D8IGFTJXS2A1.9JBD1UKGN4PX@proton.me>
 <CAJ-ks9=oq+c_pMg41QgGWsj=phWYfntXQgpSrFmz16Vifofn3g@mail.gmail.com>
 <Z9gL5hQWvCNy5XNH@google.com> <Z9gcqHihXLg6kcZb@google.com>
 <CAJ-ks9n=7fqtNr88co-EU7d9Wo1Dz1Wmp0p3K0b8RQE9mjrbHQ@mail.gmail.com>
 <Z9k9I6mp11Z358vz@google.com> <CAJ-ks9kcNvGqGrU1nKjYs_4XPbdxo2cW8Tj9JOGJesGO4StdAw@mail.gmail.com>
Message-ID: <Z9mGv6ir4c96Of0Q@google.com>
Subject: Re: [PATCH 2/2] rust: alloc: add `Vec::dec_len`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Danilo Krummrich <dakr@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 10:12:28AM -0400, Tamir Duberstein wrote:
> On Tue, Mar 18, 2025 at 5:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Mon, Mar 17, 2025 at 09:53:04AM -0400, Tamir Duberstein wrote:
> > > On Mon, Mar 17, 2025 at 8:59=E2=80=AFAM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > On Mon, Mar 17, 2025 at 11:47:50AM +0000, Alice Ryhl wrote:
> > > > > On Mon, Mar 17, 2025 at 07:34:44AM -0400, Tamir Duberstein wrote:
> > > > > > On Mon, Mar 17, 2025 at 6:04=E2=80=AFAM Benno Lossin <benno.los=
sin@proton.me> wrote:
> > > > > > >
> > > > > > > On Sun Mar 16, 2025 at 11:32 PM CET, Tamir Duberstein wrote:
> > > > > > > > Add `Vec::dec_len` that reduces the length of the receiver.=
 This method
> > > > > > > > is intended to be used from methods that remove elements fr=
om `Vec` such
> > > > > > > > as `truncate`, `pop`, `remove`, and others. This method is =
intentionally
> > > > > > > > not `pub`.
> > > > > > >
> > > > > > > I think it should be `pub`. Otherwise we're loosing functiona=
lity
> > > > > > > compared to now. If one decides to give the raw pointer to so=
me C API
> > > > > > > that takes ownership of the pointer, then I want them to be a=
ble to call
> > > > > > > `dec_len` manually.
> > > > > >
> > > > > > This is premature. It is trivial to make this function pub when=
 the need arises.
> > > > >
> > > > > Normally I'd agree with Benno, but in this case I think having it
> > > > > private is preferable. The function is safe, so it's too easy for
> > > > > end-users to confuse it with truncate.
> > > >
> > > > Thinking more about this ... I think we should have `set_len` and
> > > > `inc_len` instead. That way, both methods are unsafe so people will=
 not
> > > > accidentally use `set_len` when they meant to use `truncate`.
> > > >
> > > > Alice
> > >
> > > Isn't it fine to keep this function unsafe given that it can break
> > > invariants in its current form? As expressed earlier, I would prefer
> > > not to make it safe by using saturating_sub.
> >
> > I guess that's okay. But I would think that with the exception of
> > `Vec::pop`, the interface you want for Vec methods that decrease the
> > length is set_len, not dec_len. That is the case for clear, truncate,
> > and drain.
> >
> > Even for the Vec methods that actually use
> >
> >         set_len(original_len - removed_cnt)
> >
> > they make this call after having previously called set_len(0).
>=20
> The methods you're describing are all on Vec, right? In other words,
> their usage calls for a private `dec_len` or `set_len`. As I've said
> repeatedly in the course of this discussion: I would prefer not to
> introduce `dec_len` at all here. It (or `set_len`) can be introduced
> in the series that adds truncate or your patch that adds clear, where
> its signature can be properly scrutinized in the context of an actual
> caller.

Oh I did not see that you said that. Dropping patch 2 is fine with me.

Alice
