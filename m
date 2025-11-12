Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E233F8A4
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762965635; cv=none; b=g5MBdy7pO9QV4OsnA9taGaUVwr+C2ewgNwgLkTsKBQN36udfzGvrTHRAHdk7G9MKkFwSBqRRmElaaan1rIlcMFn9YmDxo9cw54qQ/3jP+3RcNLnjIh0iQ0dLo+mHmFNa7ei/VdkG71k45LfMBY0aNJh1ClPEDz05ZcRXlY2Cjos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762965635; c=relaxed/simple;
	bh=Ka+oo3pgj2JB2kc973RtV4omtwTlaZBtkFnKjkUoQSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjWpLzy2hgFBWn2zU5ps+5ipOpls7W+CZmBVJAeEzr60xmLwggvqvGdx29Be+yrRwCMMj3KDSgXU/Ajadlxv2lLKwoKI1HhKIZ7SS+pFFINBWpfjrNbkNFuk7Re0SnlQ16vCYJqiGRRy7XOTOxlAW7Wfx8apl/2+aFOhglweRgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGm7j9oW; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGm7j9oW"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c28ff7a42eso258420a34.3
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762965633; x=1763570433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka+oo3pgj2JB2kc973RtV4omtwTlaZBtkFnKjkUoQSA=;
        b=GGm7j9oWE4/zlHseA4mqq6UbNgcg7r0FAKbryrag4v1u44kO1VbxZiuwIyFF6Ssqco
         jaqqtgt1iiavjyxcii1wobtYqONk1KdqonB62p80YS1YGIuuZZpZGt0M0VvS1uzI/l0p
         2Rx8vDMtYym9pF6A5ONWCwjbRx4ejAaXalvMLzmRzfipMp7DoPa2bP3qBV+T/LMgvUcD
         tZ6yVpfc2u58AR9mGQZZMoIMaXaB7RXalznZAzdQi3CAkbNlA0LLoBcNbqFNlSx1ZpJx
         SMcsOVQbXmVwMvhrgmMf/9dYTa3M2Yg8gZ+HRx5NJSqZtYhki8MzPEA858pA5GC8u2uH
         erRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762965633; x=1763570433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ka+oo3pgj2JB2kc973RtV4omtwTlaZBtkFnKjkUoQSA=;
        b=I+aAW9axiYyazU1dXr6Y10NX/j5qdFF327lvy+edZHzIgIpQGhrBidW1yU3j44yLWC
         IHyyTp1PiB6uh5AxKr9sOkEImMvW7eHAdZY9jc/jF8WkKJDJ5qJZDmmMd8gOiy0Pc0fM
         KaWLRzNTlf4Ght2yHV7ffPDv1WcWHN7XqhJUkQ/1CdEaVY7CSTe73WvPI+E/bJsh6yUx
         l+90jsSA3rUHcWjdnyMqYUYgWvYAMIDAYGDFz1E07nR5qBgfocsykN91rjhTar3NwPRM
         gfEtbocFmveZ+vaFcqM57OzbMP4lTwaGHCgQafe9o6/6OvYQkbedPkG7VSREaQty2K2Q
         X19g==
X-Forwarded-Encrypted: i=1; AJvYcCUvEgVH5Gq/Re3ZrUqKEZKXpgyWnrUntiksp70cEItaLsSgXu5C7yaRO/6DbobUY+8Dpigpfaeh+qZAV5+AYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfeK9AKY179Lw/j2ZbU7LG8pLX58rsnSleFyr+I/TUgsf4heVZ
	a/gZo1Ymw04nlPfSNmrM0f2gnWtFJrfP/V+G9kRHhUQE6pdqLu3icdsQQRmjlzu4ObziKqy/iu5
	lkPWon1+uWDJ9iKk5qJyy+FCQ2KdJ0j4=
X-Gm-Gg: ASbGnctFCMKEC20hRQg8fCCxRKzviZYiA7gS5s1SW1NY52t+0ydxOOSQgUsSZXcix0t
	vfr0hr/KJUbcncF/pu5sJt9T8ebfDqpUsbgg+A+DXDtIiV/Xw+5+IcZJusVkUVW8EwZPW8fZwwc
	g5z9ihUVcH3c6xco5SJU282Cv38NRR61WfjL++2ZO/AJgGr2dycnNvPkYurvLmsS5sM7STIgOSt
	MgBmhtkB5VfNvRlSZ7hss+q6vDtNu8Il+c3gC9jmM1p9JjEgGvCSN5Rxg==
X-Google-Smtp-Source: AGHT+IGK44z86BN2OSnOpdaIYixeb9Hn2wTFfWJTLtnMDWPUJTmZR96qPQq4/NfFd6A9d51DPL2ZhfKVYst5wfWiYj8=
X-Received: by 2002:a05:6808:1b0c:b0:43f:63cc:aed9 with SMTP id
 5614622812f47-450745ae5cbmr1472885b6e.31.1762965632892; Wed, 12 Nov 2025
 08:40:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com> <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
 <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
 <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
 <CAAOQCfSRVqFZAJN_m-kGLe6fnqKYyhLUf_WOKdHHMW-C6NShkA@mail.gmail.com> <CANiq72nU7LOSEv=RsewAwiEbeO4=pTqg_pm+WJGfum90BC43kQ@mail.gmail.com>
In-Reply-To: <CANiq72nU7LOSEv=RsewAwiEbeO4=pTqg_pm+WJGfum90BC43kQ@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Wed, 12 Nov 2025 17:40:21 +0100
X-Gm-Features: AWmQ_bkPOh4vHeoQWSet6WU-HZHFI2Z23pN6yKqCCaQUHSdDpwmkPCSibrem5WM
Message-ID: <CAAOQCfSu3Ej3K63iRcsBJLS0rEVBqjLqN0mE5VSGHyX7bVmU-A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah that's what I meant. Ping me whenever you want to talk about it.

Le mar. 11 nov. 2025 =C3=A0 21:32, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Wed, Nov 5, 2025 at 11:54=E2=80=AFAM Guillaume Gomez
> <guillaume1.gomez@gmail.com> wrote:
> >
> > You can add your own tags in the doctests, and with our patch waiting
> > to use the new rustdoc doctests extraction, it should be pretty easy
> > to plug such a feature into it. We can check it together if you want
> > when the patch is merged to see if we already have everything needed
> > or if I need to add more things on rustdoc side.
>
> If you mean the `unknown` field (in the JSON) that I mentioned in my
> message, then yeah, I think that is good enough (though we should
> probably still prevent collisions with future `rustdoc` ones).
>
> If you mean something else that I may be missing, please let me know, of =
course!
>
> And yeah, we can take a look together (likely after LPC).
>
> Thanks!
>
> Cheers,
> Miguel
