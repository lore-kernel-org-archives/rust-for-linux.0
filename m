Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D745830C379
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762340057; cv=none; b=BmfqoOinI+sRa5HX9brMU6WPHKGSEFeD4KlqKSUCiqflkmglROUeuqMYlhlFsQetIQOJZ+x76COvZ2rW6FRBHoO+DyBeR8Fe0d24xHCgjWs7SSrDGcmrXZh/7kjwe29BU0Q4vh8DrUBdeK7LBqX0WiXBexcCjCV7s84HixQYqB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762340057; c=relaxed/simple;
	bh=rLYGShjvH0ii87qREH3WO35v8IHXOBPLvlHQQ38IJz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOj68o30QcGUh6wLwkXMpqVNN+kZBIdwaAj+/YT+E4wc/IA5x1JgVwY33+dCTKyOamyBjByLeceQGRAzBVKl7AEhsdS05wE2WJmNGnCeEC8eJGr7/9gXtlAP3o7hFoBZTBfvZlmVdt0hPlJWRYDIXH5RC+7rSBsUYgOwA75lHpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjMcy7OW; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjMcy7OW"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-653652a4256so3050621eaf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762340055; x=1762944855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UI+zvnrKdhRN8SIehVxo9mkD9QgvEwvxC3LXtBEgkQ0=;
        b=UjMcy7OWjWCaW/DCk7GTJ1FQ67cT7FkJi1DDY8H6kgwpZmbp582osfW1a/6LLO/vz6
         96Njttx+wh8KMTeGERtKg2chOONmr1/XY3r5s03kP4MWfe5x9K6k6Vi2tUJCpDJljUae
         g44mr2LtI/IpJ7VzpNq55ie/c3HN5CFj07V4pnSVMDhruUPdo9anhAc5YUPJFJF3WudR
         uQaBrFr0i4WJB8TJo3Z2HFyuv8CA3yUfw3Km2Oq2xxpvvCrQjLBm3uepCFNGffJ1+Sfi
         erCEZF6zygeE9tvy1VtCIAPxe126MSk4HO/XYhf1RLN/dfCSPGIjd2anFtxnG42uMGz8
         zg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762340055; x=1762944855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UI+zvnrKdhRN8SIehVxo9mkD9QgvEwvxC3LXtBEgkQ0=;
        b=afCq2n8PK0G5ixmMqk7Osw9tcjXXoRmsridCH8YumUUtBY+ySu4AJdw4wichrV6AxX
         tipwvOVMto1h1L2oF0eHcfTvMsBGwO6G3h/awCDQ6OMD7jgUcx1mzaUCXicy0SsBTCn7
         KoX8/p+FUNTBD3Vdjq2sE5UPe16/aqiIdkbbOWB0oajZkSABJhEzvKac4ViiDtKJHSVm
         FlJV2jXDb1/2hZH4M52Pj1+HdHCFEfs54QnvCwo+mY6Akc4gjJ2dVm5Xd0F/B6e38nQR
         Pnw3DNGEbkj4tgn9I0VMhApqFNTpPrgL07OyQJXQ6Q9Hs6v+KMTwzVvMqr61zPWT9y3I
         sVvA==
X-Forwarded-Encrypted: i=1; AJvYcCXj18Ozmi4iRiYxAZ+Ft+5smHhEXZTke1bSYYTfrxu32baVosthkKlv0SFYtvPe4jGc2uxV/TyFSIfzVRMLSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyczXKoPMyfkiXV2HhDQrNzuIh6X0jMi2IhcDIzB5d6Uky1S2ho
	JJ39rfYuWsRN5NpBd7oCEFvKBuhYHRfcoP4JsOf07hqySSlC2AXqchXy1ley8++v1/Ia7gNzzxF
	bErQGeNfmONcJp2rRZL1TzDqhEyVSxaQ=
X-Gm-Gg: ASbGncs8Wo3D19Br/cQlFvZWVTrL+MekFHcSqd7gQ2nRf5r25lgdIKFIN58f533zADx
	ULogBdo3B3AtBNETKef22rFB9ODRbuBlwXAc7xDyHrSXzINMRt7uIsaHJumgRIhBxpSrxgv3Dmj
	ipBWw4uyrEXL0Ooko4CHcUsJKir6O1uC69l+ztXryal8rvDPMoUBFnVM6ZCLWgzQMdk00/8ZuV3
	yaC+/edW29pBsQan2DqiUfan6i5tXFcCOLGG/ZFbGxTIELV0RE+3Z+iLZby0PJ79pQ9V24=
X-Google-Smtp-Source: AGHT+IGOrCYrmHNMLavSyZ02ydICrKRBss+q8PZq/0Rzc5ZPlgYctyKGHcxtmk3f5rN9LiTKlT/v4xGFjERNNmxuico=
X-Received: by 2002:a05:6808:21a3:b0:43f:5e91:d556 with SMTP id
 5614622812f47-44fed48970cmr1063735b6e.44.1762340054900; Wed, 05 Nov 2025
 02:54:14 -0800 (PST)
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
 <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com> <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
In-Reply-To: <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Wed, 5 Nov 2025 11:54:03 +0100
X-Gm-Features: AWmQ_bkMmilAyN1uUJZCacC-4Uedu5I4tT8-UDX7Z-O78YpFpr8K3EAt082H5zI
Message-ID: <CAAOQCfSRVqFZAJN_m-kGLe6fnqKYyhLUf_WOKdHHMW-C6NShkA@mail.gmail.com>
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

You can add your own tags in the doctests, and with our patch waiting
to use the new rustdoc doctests extraction, it should be pretty easy
to plug such a feature into it. We can check it together if you want
when the patch is merged to see if we already have everything needed
or if I need to add more things on rustdoc side.

Le mar. 4 nov. 2025 =C3=A0 20:06, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Tue, Nov 4, 2025 at 7:35=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Orthogonally, the script that generates the doctests could perhaps
> > help to automate some of that. For instance, we could have a way to
> > specify an "environment" for a given Rust file or Rust `mod` or
> > similar, and then every doctests would have the code prefixed to them.
>
> I guess this could probably best generalized as "tagging" doctests
> with custom tags that `rustdoc` just forwards in the generated JSON.
>
> Something like:
>
>     /// ```tag:foo,tag:bar
>
> would give us a:
>
>     "tags": ["foo", "bar"]
>
> in the JSON. Then a custom generator like the one we have could do
> whatever it needs with it, including prepending code or other things.
>
> Now, I see there is already an `unknown` field in the attributes which
> already give us the unrecognized ones, which is great and we could
> potentially use that.
>
> However, should there be a particular way/namespace we should create
> our custom tags so that we don't conflict in the future with `rustdoc`
> ones?
>
> I have added it to the usual list:
>
>     https://github.com/Rust-for-Linux/linux/issues/350
>
> (There is also the question about supporting the old non-JSON way for
> things like this, but I am ignoring that for now)
>
> Cheers,
> Miguel
