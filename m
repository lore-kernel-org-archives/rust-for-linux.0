Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3809C42AFB7
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233905; cv=pass; b=idpZx+2XWEU0ORQCSgpJjknJGBGKvWBWGjmnl/PxBLE9ZBtGZ9IKDAriYXLkqchPMj+f0lcoGsMZFysDIvJGjC02icYt8pESjNykWkajJ8GL+WcEAwO/MQBB2jNKFROT8D7gKErcWTalsf4s1GW0rQfFqHK0OJG7DF9I7lFtrNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233905; c=relaxed/simple;
	bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9bLOUlEfZ6DjqjB0uIaEeIhwxa+fpx2SIOqFYVNSKmZVhVqOHSja1yDUoCJvdl/8IBZLEwQo8L7sFgstSuEF0nwXiRaimTdCMstywL0R9yCochBzypiRZAoNNitnqej6qCh2twG8jhn+nEDDuxvgK96KuZ1gw5vnEgncLBjvLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NbFX5OJS; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NbFX5OJS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so19122665e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 00:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790233894; cv=none;
        d=google.com; s=arc-20260327;
        b=PQ1cCuR9sJy8FFr0kvW6yL2MBSxIQncLdNp9VyE/O+7KBN7nUBCbbGeY8JtMAJA7Ve
         hCjYFLIvSegM5P+fBs5OTvh+mi0mZkvuEpM2MT8LZYd14BEsx/YrVSOOmmOOGtMrr89u
         K3UxqHKfrlugaz7lkll3FZiSN8DpMdggnX1mkZMZG4ay0WnkwzPiHURka9gL49T9mYF+
         NdOzwLLIIw3EIsFq/0jp8r/FMUEnIc15rntZwDR1z8wVrhb22IgXLGMPSeNGjw8YE7u/
         +htZ9urmvcUj9uMTvrcrRL+4XR3Fijun6bwfVqm3XzYngJ+kYuEleIWBC1nx6C0zFsIp
         f+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
        fh=j/a3MxuwUD1nHKos7+p/vp8F4W30NMp6bhXvvLBRUo8=;
        b=Itwx5MTkNJ+DK8hrYTSl1p5Ot83LZYnqq9RhKwbbW+Yx8IpXPzsfUgGvOscxjCD7lA
         ovEkYhdJExbZTqTxGuCa9L5Z2CPHw19u8ML3lINl+0gqY+8KL9sVeRhZ5LRvuUVckW1b
         OCwKJvDEhKGAwowcpCUadOpnSEqOfVSHH8KsuY5PLkH2Ik/o1o1rQ2cCci0Mw0fb6a1k
         0kgXxHkELRw7Pi0kYyY8XW9X738auxWO5IvenpeKtfJmUXvg0eiMlrVlgwAIVRDJtczV
         +cAovIcf/Ew0Z2uZESZuNZP2MvZPRettmv25FPBlpu6IPUQAUJvk9i+ycj5CYHUSz4W3
         M1MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790233894; x=1790838694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
        b=NbFX5OJSO/KRXSvMdEvLZPWP/dNRoJ/0OEEfGTKQGA/eDu+q0sNMvebZgushbfs8vW
         6sA/o9XkvF5B00+mQppyh7IIK18quc3J3ZlrtH0sqqjOD7DzbOPopzf1kLB8abNiIWCo
         AYxmAXihGXiuXWx6xexRfaaTcp38y58PQxFY5K0Kz6nEkWjhPBSpfTRxrvgiGAmlYKJX
         +FcWvObHMF/ZSDmYfCbzQhyQV1nfTRPLceOnAiRGghKP/Wso7MILwgDS7f4pj/yVJ5jB
         ifaDYkrDem00uX2of7tueNFc7R5aNNP8jCxSF25MTTO1JSm6uxYMF9c0DogqetaMexjD
         YuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233894; x=1790838694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8ZS9uQVTg/RTh2r6b83ebQzg64nZ6k+e24taUncwLw=;
        b=ZHRZeGsC4/ZT3nXAE208p4UUETeZQk1kkpkNhUfotDCiDqnjVlgJ7U0XgsxyLERgNp
         OHv6X8EEijwqKNdo3alYIU8YlIVgEn9EWuZXf/UQ9+PqKwTjXopBp53J3kMW0e/QCGUM
         IUa49HvsTiUNsJlKYxK2fT+3an1lA7cE8L/Fl7BhmDEDbC2z0YpDur5EyYjFMKDJ219I
         UJDqodpy9VCgd+5aoWPNt87TGpUrKAMEfrkeLHNx3DB4to/lzpYG1RzqNEycj1CkE8XE
         8JZSip/DMKZaQc1cIU6Jtwh+8cKf+uSJfAoBG7Y2kOw3ajic37dvuQ+RGRem5TRzaWxf
         TUPw==
X-Forwarded-Encrypted: i=1; AKwUvBzr2X/9b6qfgiCPx3tyxvTUCY7laRiYqhAo3Kdaq4KgSmlqfoJ+rAo44Nm9TsAWsaJs4+0SOXwhYr6jZj3t+g==@vger.kernel.org
X-Gm-Message-State: AFuF++kNklW+vRv5NDUCsKqtA069GyCFNMP80cuglb0HRL4JfJ/lv77r
	6DO0ENsq0ZL+wncR+3y7Bzs6bou7Am/gvVotwHueDCT4q7BovHPxRGwIBKHs/qJFf2TFuNvjKrz
	jztIOIXNE7c6bqbVArzO50k3XjiD+Hfbued3MPRFw
X-Gm-Gg: AYBFou0+ub4wV5aA4jhgzbpAboVwIz+NrVlDlAj2xgurZU1/KLHyv0mqBA73zox9Cai
	06cOnTIoZtmNAbZ1pzORqpwmtnPXMZdc8wM8yePaMqI3BqisIoOD9OJx7+zjCQ8qE3qk+5Gp71k
	mcuTvTgSNDuJm1cM3NyVkRNI+GxxvLbOyexYRkq7VVyDx0W65AKAA7VQ3sFx9H8q5k0Eop82GIP
	olUuBfvwWrWs1Ghpt196GHRTtdiDHLUzIHVpcm2cO4k5Ti5DZTh8W/ay3ucRPjN57iFdAG8IeHf
	0XdjTr3iLVcjpF38mshZ3sL+NjR/5bW/40IsePFpBXE+wfn/B4VAgBVFuXByQcbS6X3fO1nl9oe
	EkXKEEymar8GpuyWxT1ouur4BwouxxMKX
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id
 5b1f17b1804b1-49fe66b426bmr22734545e9.12.1790233894197; Thu, 24 Sep 2026
 00:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-b4-gpu_info_zero-v1-1-7259840069c6@collabora.com>
 <CAH5fLghN0w908Z-MYDfmaeC7gvAB78MMT7zg599=1kU0HexkOw@mail.gmail.com> <arRua6cN7FXIDOvF@um790>
In-Reply-To: <arRua6cN7FXIDOvF@um790>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 24 Sep 2026 09:11:20 +0200
X-Gm-Features: AclHuK_E9AAemunGDpBVxiUGy0rHsdGrBH4aZK_TH2BuNmOFFvcup1Ldi-77Xl8
Message-ID: <CAH5fLgihqM5WcUaQd=WTUs6JhxoGyn-m2N1kkrsNvBXShRZWHg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: gpu_info: zero out new/unused fields
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	karunika.choo@arm.com, boris.brezillon@collabora.com, laura.nao@collabora.com, 
	steven.price@arm.com, liviu.dudau@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:27=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> On Wed, Sep 23, 2026 at 09:42:23AM +0200, Alice Ryhl wrote:
> > On Wed, Sep 23, 2026 at 1:16=E2=80=AFAM Deborah Brouwer
> > <deborah.brouwer@collabora.com> wrote:
> > >
> > > If a new field is added to the struct drm_panthor_gpu_info in the pan=
thor
> > > uapi, Tyr must initialize this field or it will cause a compile error=
.
> > >
> > > To pre-emptively avoid compile errors, use ..pin_init::zeroed() to ze=
ro
> > > out all new fields added to this struct. Tyr can subsequently change =
the
> > > initialization as necessary. Also use it instead of manually zeroing =
out
> > > existing fields at the end of the struct.
> > >
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> >
> > Merged into drm-rust-next, thanks!
> >
> > With regards to sashiko bot, we should look into whether the
> > MaybeZeroable that bindgen adds to structs applies on this struct. If
> > so, we can remove our unsafe impl block. But it's not an issue in this
> > patch.
>
> I couldn't use MaybeZeroable directly but if I add IntoBytes and
> Immutable then we can stop implementing unsafe trait AsBytes. Could you
> please review:
>
> https://lore.kernel.org/rust-for-linux/20260923-b4-gpu_info_intobytes-v1-=
1-bb2173f91e11@collabora.com/

Oh, yeah, MaybeZeroable isn't the one we want. We'd want MaybeAsBytes,
but I'm not sure that exists yet. I think we asked for it, but not
sure the state.

Alice
