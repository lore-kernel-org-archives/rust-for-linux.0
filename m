Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD6534EEEA
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771838557; cv=none; b=Swm/am0J6GooLOy0ljAdjtVrEunBVJW1JtXq0fPH+ttE/WFqgOTvdSNleV3CHujbVtsxAV2atsht75vSN4ffzRGfLkyLdzhmlaAB80QdrkWW4Vdsqu8ACwhzVxdn/7hym93mdc+qitPozhb7N2kzTXyWHL5dyNkmxJpAlsJh/vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771838557; c=relaxed/simple;
	bh=ewIfZ3EnYBpT23se9tTPnU3gYWUWURZsHjmHpqyN3Hs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BI2e2+xjhAG5QC4WrrXXyCCTt1edEk6nhSFOI+6Q4dLucXFBUJRSW5ggED2Py92PmhX3iEzi1S5jKe9QDoFS0BP8ix5cHdKVl7fOgo01LsiQigQLhg5FgALlST3KKC0VGIDR0jyyNHUyfe5bCMlS9YZ6P7JH9RgKvlzKFWbhhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqytCUmz; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqytCUmz"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4362456500eso3813238f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 01:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771838555; x=1772443355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/py8COuiIEGDu7/nY5qfOGmBj2ryx1hQ7/J9NPZ4C0=;
        b=UqytCUmz2gJRGb8qkstqDev0OkUD/hT3mSReEYNV5EdVOdRzSwNA+KR2zIlueIk+kH
         Dcx53Y4O+4kxfxSiUBbPXqUHtnEi9OoVKr0EgOBXoqGwXcjaqKratfQSo5tJ/9e77+PX
         UdGjtku2sdJvdVPDjs4ThskFguQG/JrIokiOc1oMamSGJmLv14t3HRnND/ePHupgQPOt
         7gG5LYjG1cOptQbGK+kkShWiZyDdbzE497/QXNbbDq9gFviABFDOE2X+ISsMKLX0TG1U
         +MVyqhgOPfX83D+WN9OOpBS1L9jabc+p58I2p3FUrxrB99F6xYieJndtSI3TbqCtb7S5
         Vkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771838555; x=1772443355;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6/py8COuiIEGDu7/nY5qfOGmBj2ryx1hQ7/J9NPZ4C0=;
        b=VFW6BXX1hlY10g1mY6FJGW9Hs1w8EoZQb8u/7XQmf/C0u5aAyfJ17Z7isyLTckUbt8
         1qNB9J2Y4JhfJT54gqmyVuw15iTwsc443ydTcRBbgpgFcbg5wnBH5zhtVz1KQwOMTtos
         cmMiTzPtteIoL3qIIl0x53T5UTbd6NmyIH0zw2NhDAj3TWHsERkfkzpOfHRuM40mc1f/
         Q5BPb69elWT1n1yeSO4tYLYEe5YjhFvuux68z9ZQybxvM7lN50EXIngkL3USnRkp8kU1
         ou7pnJEtAhLxOSMd/YDbf2lkV1g4NtK2dK+FkueXiFpgt/YWGQAerKXCYGM/hIrxAw86
         IVJA==
X-Forwarded-Encrypted: i=1; AJvYcCXgZieuUE6AlggX03RIlLJKl2NHr7OFI025W9iLalOZNf2HU9wKKXryVDRT12KXAwnF+DtCTIFK00StRTBqnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNRlGNEgKaC/sCwqL80cqk7FeDAHXuaVVkb8Ij7gZ+i7V7V86a
	9s26ZUadflUxhTk4c2Y10qEofxpk/tQqJpEMsg1WI6zgCUnMjwCKvsVgS6tacMtEHKlrIr67zbs
	6nQJvPItPq878xLH6+g==
X-Received: from wmga22.prod.google.com ([2002:a05:600c:2d56:b0:483:49c9:7c2e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c8a:b0:483:71f7:2782 with SMTP id 5b1f17b1804b1-483a95fc09emr129349825e9.12.1771838554485;
 Mon, 23 Feb 2026 01:22:34 -0800 (PST)
Date: Mon, 23 Feb 2026 09:22:33 +0000
In-Reply-To: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Message-ID: <aZwcWfYkBnivrgNa@google.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Link Mauve <linkmauve@linkmauve.fr>, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 07:56:02AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Sun, Feb 22, 2026 at 08:11:17PM +0100, Miguel Ojeda wrote:
> > On Sun, Feb 22, 2026 at 8:07=E2=80=AFPM Link Mauve <linkmauve@linkmauve=
.fr> wrote:
> > >
> > > Should we come back to describing the target like I did in my first
> > > patch[1] in scripts/generate_rust_target.rs, or should I bring that t=
o
> > > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  =
Or
> > > is there a better third solution I=E2=80=99m not thinking of?
> >=20
> > We are trying to stop using the custom target specs, so we should ask
> > upstream to give you a built-in target you can use (or equivalently, a
> > flag to do what you need, but I think the idea is to not have such a
> > flag).
> >=20
> > i.e. even if you used the custom target JSON, we would still need to
> > ask, since the goal is to remove that script entirely.
>=20
> I think, disabling altivec, fpu and vsx with compiler flag will work.
>=20
> What are your opinion on this?

I think you can and should submit a PR to add a softfloat target to
upstream Rust right now, and I believe there should be no issue in
accepting that.

If there's a workaround we can use on existing compiler versions without
the target, that's great too, but we should get the target in upstream
asap.

Alice
