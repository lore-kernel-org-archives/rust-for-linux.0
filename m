Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0993BED35
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005903; cv=pass; b=urYLE1NitcVbm014TmOFXpHCJ131tjdnD0YD6c1+eslb1YZSb4X7vlBJrR/EzQk2Sh7roT5j8P9WpfAvhx+jZ4zrbSfB2ibjn9cQEQPENPI1aqiJAOYQTts5tYO/LfG+1uH7whJqn1CjBmUJZk5sVLuBHcOYQG0/jKtB6MN8vo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005903; c=relaxed/simple;
	bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDfkVFxKjKwMPebJ+lAEKKHmbyyb+NAdkRGAV6ldjJgKzBKDfK+/PecWYhE5NgX6+PsLpBvufKNC7g9k+vRYBvsbWplZCXgB7CpaE0pULCQfQvLnxzqTPT6ztnWDuZ2pFL15yGzsy4k7JU9Vl14Rz9J/D9rtpL8S23xFBU4moBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F1/VK4Mg; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F1/VK4Mg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so18160385e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 08:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790005895; cv=none;
        d=google.com; s=arc-20260327;
        b=Gv7u8aT6xxnHgwJFNo9dCuJykZ5nwJSf9v/1+noFZXVDcavfrDp0gBBZduh/rGX7xx
         7Wv0Efwlc2VSpAEMW1yaQc6mvszqP5DhptirQfyBRlFQ669vApKZUAUAXtr6cPjPureO
         lqjdWPLtRRs04jzQue2RnR8Lp5JJNxe6CdeJbJ2hPXW6vUDeyTSvxjMAxKClKmMMQ/bW
         d4REQ0ZIZHbOJcA9FjGzC59yJMwexzZwerCcaq21mh8HlDwUTX+EUrB2Bhwk7a+0Ly5w
         9Mi1L3Tk04NUed4pYPxNivBM75PPfRHPy+ZSeHSwta9KmIxkpGe95ziRu8Sgcquwj7F0
         IA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        fh=03Bczf57RT5vjfYoWbP0UmRg9jqBDDCMWoEeecB1zZE=;
        b=NEwSyik+XuiGuH4W2yyc7wKqE/CphjlLGo/sGER+4P7KLqtZ93YOnwpx7bRerIWuxl
         5GGsbcfBZBgBrPE4z2wON2tqpE2PaSTIL2IV5ogciBOSpEmFAkuJnNlULiHndZS8S2Fl
         yvACqoO6YAn19w7L6o9Z9+iojEdc0coQ2TSUWVPQJ7t3PXwLxKTJ/6Bb2O6QNTIx6sLU
         A61FVlYDxvQt43hGnY9OGaf6pe8UpimaQgjx3DriGT9koC9wp+Ux1JsWh9fA//AgpXrw
         04WWy3C1/sPam9DfXoWyGPF4ZdTz8E5XgkYn96vaFSPii4lUUwqKlDDAPDgPHznbSwKC
         9Uhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790005895; x=1790610695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        b=F1/VK4MgaZmDwKwdliXEQ2wCeHgpdPbdak60ZWI/JLhP4F/9ZV9xc2OldpG6QJJfdJ
         KTwTVCN4eV9go6x0QY/u+uAEJOPrtjy/wGkdp1SChfYn4OvsXm0K/XWASPIA57mK1qCk
         DRfMpYPjfFTM7+kQHIxeuCCXAdIdacDfl5KvoyhfgDEQMwYbM4M4kJJMsmwwE7za3KAq
         iZ4Bm0BYMuv5+hKWlCIL6YCL74ckJU9DsOwX/LMM323alQ2v2uVy3j0JfFQkSvVKH9vf
         9kkg4wyHowkQgDkPujDsI8vIJEk9MbHIEAzmzJtVi1a47gZ7MSF3l2PR/DpnTT5gKm2x
         iQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005895; x=1790610695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        b=oCc02q2WVILOaqSCaTIZ9xyq0ZwX5ajaC8lG3qBnxUtMF5KRqnFMORd9ftg0+UCdUB
         /yUtPzO6GqXPH4ML2qdTuH+KQ62CUQXckvHBbURxk7kkIa5+m+C69EphOBz9IguaC0ge
         82cMcNxCJ+eCpslp2LWaOCw5SPGnXmPoXFnrCDo76/AyVVqzKHGuJ4QEfw5Xs8i1wN/G
         tiwfc5JVcQ05++E5NZwVm0GSx4vb73o0nTLXSEcek5iP8kVoTPeAxcg/qmUYO3aBZBz0
         UB4MHyi1Jf5ay6Q6C8ebLg4k/gt/ThmJJZi/WPklQIFTjvV1DLgliFFlHWEgoVz/U+ll
         uWuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ3/bSL1Zy4mQ7N5r6pTN6HJlKgrv1NcKfbqdThUazwRMqUw0374RKnfyD1D4p6Ot/TeRrcnU3YB39l3VY5Q==@vger.kernel.org
X-Gm-Message-State: AFuF++koFoC+4Y1YIZzAipW4EQq++aZ2fKV5BcuAOP8HLQSPdhjl/M2h
	eaqRAKG5HPr3DKiDGrnEeS2ZBqfxbn+WL/ORFBeXojocS20mMQlQa10/nCVhq+oKTud1HPb87s2
	BzqNhAtzNTd+AtPw2ZA1Iw4LnazffTclPXYcgQDic
X-Gm-Gg: AYBFou063Q2h/qK06jBN6yM+ns1yboxwDuVgH4iPgmfstg9gTIROnImRELLIWe0qPzj
	spctAoMp+1NeG3bmFnAAbKeeOUpWGEk7nbkJJ3NWIC4tPPUxWSvUpMJu92WPjdlsOgLpssGB68J
	/+B7UgH9f0xmR9t+lDx5pFS3ylaCom4KEZokxm/sqrV85WdZiZoSucmUWdzEfbaWcpA6CCQvDsA
	fw68iaLA1SIQ5M8mFA8lXk7D5lOB0yCU4Y77BirWDB6VFB7xCWlqAKcVH1wcE1yh0tKyv3QwB5Y
	F3lEHtpP4rczck5LOGQQTMskNPpTWfCBWjzgG5dPWz4Eql/0gnOergJkaHHyIZQD2/Ajol8U2Vs
	1jt3On1XPEKmO2FRtzVzn
X-Received: by 2002:a05:600c:1382:b0:49d:1d7e:4085 with SMTP id
 5b1f17b1804b1-49fc5750e24mr144662275e9.22.1790005894477; Mon, 21 Sep 2026
 08:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com> <arFPKcA1RCecTfMD@redhat.com>
In-Reply-To: <arFPKcA1RCecTfMD@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Sep 2026 17:51:22 +0200
X-Gm-Features: AcwNN1WhcitqwBWirpcIjWt4rgRy9zn3sgw8vKnw5ksshoQqpBgQkPX-PXAUSZs
Message-ID: <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz` constructors
To: Brian Masney <bmasney@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:37=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> On Thu, Sep 17, 2026 at 07:10:42PM +0100, Alexandre Courbot wrote:
> > On Tue Sep 8, 2026 at 11:56 PM BST, Georgios Androutsopoulos wrote:
> > > `Hertz::from_khz()`, `from_mhz()` and `from_ghz()` multiply their
> > > argument by 1_000, 1_000_000 and 1_000_000_000 respectively without
> > > checking for overflow. When `CONFIG_RUST_OVERFLOW_CHECKS` is enabled,
> > > each panics once its argument exceeds `c_ulong::MAX` divided by that
> > > factor. None of the three documents this. The panic occurs only at
> > > runtime, when the argument is not a constant expression.
> > >
> > > Add the missing `# Panics` sections stating the bound for each unit.
> > >
> > > Fixes: d01d70205601 ("rust: clk: Add initial abstractions")
> > > Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> >
> > As we just discussed at Kangrejos we might want to harden these a bit,
> > but meanwhile documenting the behavior is indeed a good idea.
> >
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Acked-by: Brian Masney <bmasney@redhat.com>
>
> I assume this will go through the rust tree? If not, I'm happy to take
> it through the clk tree, assuming the rust devs are happy with this.

My understanding is that the "default" way patches land is that the
subsystem also takes Rust patches related to the subsystem, and that
the rust tree is a fallback tree.

Alice
