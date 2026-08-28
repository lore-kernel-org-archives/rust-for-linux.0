Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF6385509
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898463; cv=pass; b=oeQ1hb0CIeyK73GG4pDs0zpUsbnbex6WJr01XX7sfKrGB04+ug0YxfD5kUw6mAfNL8ZOUWpYlP2Uliu0Fx7QJY9fmqxFtpS8W1Nz6OcyL1Gwh9AYuxkrMsXKo7gkGi89/R2GC6g5bsUqLnI3zufh6QQUBAo9QLudKtSH5k0fTMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898463; c=relaxed/simple;
	bh=sqoZ94TDKxhKMtEaQYtpm/PK1e8YOo1KiBgbrVI0YPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLB8jRIGkA9chXtNVG6ViOa5MyTby/tUkmKgXnQreEiAL6KegywYNcJ8EGlqFtez5p+cJY9KpTWVLjyo9V7HO8BD46+2mNbUby323J3zITJLKag5X7r5FywSvVFreO0KrRUuEomwBVjYAXK6kRykIoCaeJpXoIX9wW7urz/MVd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIJJh/k4; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIJJh/k4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ccdce28edeso568365ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 23:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787898461; cv=none;
        d=google.com; s=arc-20260327;
        b=IT+3o6eWFLx27SpSjlfw+UwpQZI+5wCDIEtdW50dyv3hzUQ4xr4ITwt1ylI50Q3bWg
         b81BQMEJRL9WAqVzmpJwO201EDDSTeY40g/rzWPxOjkTPaXIiRRNwa/c/hgAxmJFoTmR
         VA7Aft6seJPvv16DQGKOidbaiw0ZEtGGjdBi7vRkh1MT/avhLX3+jA/Cgxk1sCDSe8O+
         3bH1eQNOGzsB0sUIKDKnnMyqfN/GjxEvz8E5W0xIa//iDltoo8kIFA7PyqvkFbh3r/ai
         z4sJ8gpbX35PrDoydmdf/xzw6ZCvNPCJn/p4Q6AeHPSq67n0LAHsVrUCL1HBLH/1QuOC
         f46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        fh=dsV4kX5QTzT0m5eH442DJnpTIdGrCZBHlPxXAm311i4=;
        b=qkusdZahlBdZQ4ZumZVpymBoVQvlfny7DX4q7HyOBBTyhWywpB9y1vX0WccH0iepOJ
         HrUu7MkG4WCXw1aIftUBFGNKSkCLFXst8NPTuDYE4sjkwOAfxjhdt4aQBmCJRJAJecJV
         fTAyp5zI6RTws4zCw9qj/Lo1IGqOeZwu6+VoKS8daPhw4JMOYsk8PvKrNVjZABPuFwX0
         78qabB1IFtWhNUPRQCCa6NTcxY21+HY0kDsYB1Df+IAnjGmk+JfbPWx8DXYGP1KlVbJa
         n29fWiR3w1FS9xNfKD+DXY0vU0REnk2Ln2tb8CTYDYdds40BrPQpn23aCIA3WJ7poFas
         88Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787898461; x=1788503261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        b=qIJJh/k4UmjPVgvS0qlsnxPn1Iah9n+eN8J5ne7xQd153XWI82luu2TmbsVIBM+zaa
         Rgr8RDBtWiRHXEUUzvS+k9ej6h3lMpthIvsjK7Gy0WyrGGYekzZ9QjVDmrLcBSPSr6iY
         +GCfPpwSvnfL+9rp4ysxZSAdQJ2mC/xVPc7wZu3iTkQYTjOr0eh9ExVqP0c6rmui/sud
         Gj6jGOAiCzfWCNts4z1OyaEgp2WjA4iw7dJ0TLxoi28gOo0BYZpnRnx0SZ+CDPHi3wfS
         IK9ZX2BN554w0l1UTY1ol6/0f5wrptyJjUN9+2Kn37O9cKOfOtACvmdkHkMDJTzNd8V4
         k2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787898461; x=1788503261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FpSUPDMQtu2ZqaSK17CZnsys4mRnbF+hvV6Nhgnp7c=;
        b=bFMcKcd1gmOLF792jxs8masKoI+289+mhmoxA/xKtKdBzocSfw6jvtrYKw5lsb7DWC
         RTGgu1e6omzA4NtWlfKuOUKwFfKY0TDu02F5G55SjiiAr1l2hI4DiQ5zv1HNLzK0RJgW
         i3P81MtR6UFW/GtlDpiLDh/6mHYOBJ7nfgRcqZqA/HByvaZftFvGeS2ku4OMNYU2dCPY
         mRU9uS6igRVEdlOiDLjTfjblNwjWgZsTYWSIyLpUdu8AowQIgdDXXhxKngP/H9DIYbPr
         B4JMUT6z9l2sKA/+/pLkLhAHJA0kF+c8gPanVVqCIO9Dgv2ut1h3JX0iaIS1xCn+fvwk
         IQkg==
X-Forwarded-Encrypted: i=1; AHgh+RpGr4K+Ih5SrZ9aFAaUNh1wSm4I3AwJui1YRKY3eQ4C+v3DXUrjGdugZgPlaQXB8B8qdld/wol7iqbM35zvlw==@vger.kernel.org
X-Gm-Message-State: AFuF++nB1dMlbPFpgUxcW+Qwp1bTQffAck3BnWbRFIc0YIjSWadnRaQL
	XsxxtarOpyZh5GO/Tlov85UI+lvAQ0H2MTjvpJQFaDoPNpoRgFmkyl+tgzJvfmQ54MWQ2JfgpBM
	zSRcWWMI5Iqgs5iHc/6ne1MSQCysHOU4=
X-Gm-Gg: AR+sD13W8EH/bWaLZ0kDygaz1JWz3L3R/0UdNBi+fGyKjpyBNhpvpsv235dWDZk8yzT
	w3Qbz0hfOZ1+4k6k4U3NtPzK0elyRsPRG+aBkfesNd+vSWApD98QllUM7jUffm/UBe1Dz068TrF
	GIV4KFJHMKICw/1aw6WDEq2IJpgEOdB6+OpXLZ/VNU3QbIOGbkJio96FKJWhxNWDGezIVKIfg7U
	HCPfsyhSrYA95AnXXDEqQ3NItLLvhxH/aDblHOvK0QhFvV/lSpo6a14a5U2EMSIja0iQkPnGp1b
	z6bSanVdVK5yaM7cEhiSyMxfHcXPWzJBjcm7K1ceRGQv4XRNLbPs7TloS6uIAWPwwTBAIxiu/wJ
	9W2Um/GSeFT19yX84qgRA1UQC+3qfN34rJPwV7m/ajlhVuKyG8PX68DE8i8RrhzZRT/Jc3yY=
X-Received: by 2002:a17:902:e742:b0:2d7:d12:552f with SMTP id
 d9443c01a7336-2d74ce2e25dmr42511675ad.0.1787898461636; Thu, 27 Aug 2026
 23:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-7-bc74c77d0214@nvidia.com>
 <DL0BIY2CGYQ3.TY18JERIWOUK@nvidia.com> <DL0BR314U4Q3.PMFAV27Q6EM8@nvidia.com> <DL0C0HAK8CKB.PES9IOYFNA9D@nvidia.com>
In-Reply-To: <DL0C0HAK8CKB.PES9IOYFNA9D@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:27:28 +0200
X-Gm-Features: AcwNN1XEykTRjxOk-JWsfu04X-RzlIeD5qnkPfp1CbxkCq_OEMkQfZ4p6INdjp4
Message-ID: <CANiq72nunnWs7+-fwJTvqYQn5J-0bbNq_O4LBkua5GymX1vN0g@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] rust: sizes: implement SizeConstants for Alignment
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:36=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The custom is generally to have `Link:` follow tags like `Suggested-by`
> or `Fixes`, but I guess it is also ok to keep them as general context
> when nothing matches.

Yeah, normally one provides a Link tag after e.g. Suggested-by or
Reported-by, but the Link tag is more general, i.e. it is meant to
provide context in general.

What I suggest is using a reference like [1] from somewhere in the
text to the link, so that it is clear what is the context being added
for:

  Link: https://... [1]

But sometimes that doesn't make too much sense, and so it is fine to
have the Link: tag on its own too.

By the way, the commit message also has a "code span" in a new line --
I would suggest indenting it and removing the backticks:

    Alignment::new::<8>()

Cheers,
Miguel
