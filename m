Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D60D27B35B
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989229; cv=none; b=Ki21fBg2q+06x5QDBEYrhWH3RkMUlaGF1Q1rKO3TlNlpQ7rQbjG4emI4XZJvxz0sWUORiPnkDsmq9i9eSypvvgB/nwltzIurh9KEe62CvESLXD+qFSYzi6RGyWboEOxjgPh1CNAmQ8f5fQy3K6dfi8zab2y3nOoRzD7XBcy5aIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989229; c=relaxed/simple;
	bh=DTge4oFG/kkCzDL9D78XhdBGc/jpB86DZmFYvuj59Fc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kc322IVWpD+k4z8uGVl5MbAxajcYgISCv9CRh7Dpq2aAl9puGVguMedbN5pJM8YhZrckoBBqB0r643yjtETFPRlUg8gMPIg5XBslh425qMW6HRMx/bioODSZYMKosnEANXolxM4rtPE73+JBkPGEe3x3yz27yspflU9OJJzH670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sXJx5TBE; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sXJx5TBE"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43b3a675316so1338742f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 23:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773989226; x=1774594026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTge4oFG/kkCzDL9D78XhdBGc/jpB86DZmFYvuj59Fc=;
        b=sXJx5TBE6Q0DXk2W5tbujB2dnvS8i6Pxak6lRiGPz2pkHjC+5E+Vv/DTKmex1EDruY
         bYd23mFUaahh/PPP+cyQMj0alihIL4/ErWNQpnEPuzIBf4y9rG2oF4/J5veBwIE3bzuZ
         zv4qBKVXfyeMOox2dbpwPep79iXBnJlm13v/jnWP91vdHLQslVnJeWBHe0tQHqKmOUVM
         NdNhCQI61bll8pWVT/2LAUoUxQtpmpZujshB2LWt9qWSIbmwm8vPJRqZw2x0E7Nu9eI6
         1TxsnoOeBnwFUl+alZp2QT6bVWwUyPwK92u6Z+tFf1XIWJyNkPFpfX5aM2G3YiFaoY/7
         DFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773989226; x=1774594026;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DTge4oFG/kkCzDL9D78XhdBGc/jpB86DZmFYvuj59Fc=;
        b=tGFNtetDdD65K/4qUNzYwNFhfAdaaws1ptKZ2veq4Hku0G/+OHZMWkqbxxoj+OkfMp
         IKu4hVE1ZWFInrz9x5Ya2ijNN35zFGibX9+32rgFDNkeHfUGrAZrKkrWjj6x8voXJm9v
         S2qaqIH4ZyQFR06W8Hbd7LfGwy1ADD4EubydDA8owFhnGvyNTvli4vPPpq3i4QKsrkgS
         7cCnLJo+DAEGQXvWF6NWIThtyqqvfdGYzH2qpsqupatRRPvTLFvwSn+49ji9w4xz5SDV
         dG3RjLHaOqyfH0wkEOpgoJk6qDcThubrtqsbm/jL2Tl9+XNmNjDorEFUqQwQsjJGnpEx
         ugaA==
X-Forwarded-Encrypted: i=1; AJvYcCVt1zpD8/xGUgiPVegPCV9T90Jwpszdv5vnqVFEfjO4k7gn2gsiJv3vPThZOrQ0G9yzM/8K1TQ8iKEv7FTXFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+FQviDlfIkbLVJHXGWxfYN1g3kdpt9uS9l4GRmbjHDFo21KFy
	Ohs5KqfK99P8B7mWuouOiQK/++1aIOkqbUily4yTy4F1SQae/b+KxPIvPfcYfBddRb+3InVldHZ
	VUbvN4tJcvAp6jihVjA==
X-Received: from wros16.prod.google.com ([2002:adf:ecd0:0:b0:439:be54:3d61])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26d2:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43b64287044mr3201259f8f.39.1773989226281;
 Thu, 19 Mar 2026 23:47:06 -0700 (PDT)
Date: Fri, 20 Mar 2026 06:47:05 +0000
In-Reply-To: <20260319235443.GB769346@ax162>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net> <20260319235443.GB769346@ax162>
Message-ID: <abztachY5pOvwM1Q@google.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 04:54:43PM -0700, Nathan Chancellor wrote:
> On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
> > On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
> > > On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net> =
wrote:
> > >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> > >> > Do you think it's worth having Rust not match the CFLAGS here?
> > >> >
> > >>
> > >> I think the C flags should probably be renamed AUTOFDO_LLVM too. Aft=
er call, all
> > >> the perf tools involved here are called llvm-foobar as well.
> > >
> > > But isn't it just called this because the config option is
> > > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to that
> > > particular config option. It may make sense to rename
> > > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
> > > this change, in my opinion.
> >=20
> > I get that it's an existing config name, but previously it is a correct
> > description, while after this change it is no longer accurate.
> >=20
> > I don't know if there's an established practice on renaming CONFIG opti=
ons when
> > this sort thing happens though. Perhaps one way is to have add
> > CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.
>=20
> As Miguel mentioned, there is the transitional keyword for Kconfig to
> handle renames now but I would really like there to be a compelling
> reason for the rename other than LLVM is a little more accurate than
> CLANG. The kernel has never really done a great job of referring to
> Clang when it means the C compiler vs. the whole LLVM toolchain (like
> LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
> ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, aside
> from the configuration, there is the user facing Make variable
> CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
> consistency.
>=20
> If we want to change the internal Kbuild variable names, I don't care as
> much about that.

How about we just call them:

* CFLAGS_AUTOFDO_CLANG
* RUSTFLAGS_AUTOFDO

then? For cflags, clarify that they are clang flags. For rustc, there is
no such distinction to make (yet).

Another option:
* CFLAGS_AUTOFDO_CLANG
* RUSTFLAGS_AUTOFDO_RUSTC

Alice
