Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C421F3EBF09
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769375268; cv=pass; b=d9PoMakr8Gu9d3sWp9tazeX5jjqZH2rdG/6Th5Asevntyyxds23K+SXmjMcjdBXwpYsaHt/3lzX7ekKXzQUUqO1eYeSHdkMUUrH9OBEPUNDY2I0UzGeiI3XJyYtSOCZm5A3e/rNUivCPk4Yzlwad2RUWgeT5HIfrqXhU8H/1REg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769375268; c=relaxed/simple;
	bh=QElr5C7h/WEZ2XkWUj0fD13Y4g5cZjuLGOEGFxpDVhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyvRNEOYZs/glxb9GZ+CicoE9ygruEq20QirOEN+5b+pHYdxK8yYedUkinM7Yqc+e0ftlPEa8lLmYsR/WBXlYhsfX3pca+fqF2EHS+TbfM+NkRe1vKAdQ3piRta/MLCRNF3v+DVG51gE2jlZtjB17UztZGG179gEO9jgz9hGcyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgm+C3Rk; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgm+C3Rk"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b70b21ce0aso122072eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 13:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769375266; cv=none;
        d=google.com; s=arc-20240605;
        b=Mdi6qgRoN90XMgYF/V2J9CuntLR2WlsYWjlwObaLdk5YVkdrVaAYNro5wM2mwvy5cJ
         dVyu0UGpWkjIsbsLOcfxDvNEJNCqvSIKrfsi/WzNSU0xlciU++LaWcVCPPgWL9AWYZUp
         poa3ZxgL2YMOPhHQ9mmuAQwMHYxCiNlp8l4QwS+vAvkqEKLbnUyozjCXkaRHJdMmgaOb
         SKUQofxidRysSo0PCZS7d4r5XyPkJVOKvlj7KCZTRfkn8J44HFNEzOUdnl+V24YByAEJ
         84bzV/SPUtlEXVbydQY7SlCknDMb/qQlhYqf/RJd0u1T78bpnLSTPcsqjdOD305GWF6P
         mxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QElr5C7h/WEZ2XkWUj0fD13Y4g5cZjuLGOEGFxpDVhs=;
        fh=wI6wtf8BmfcLy/eac8/7F/Oht5anCThRjV4xCLsuUk0=;
        b=RAx+iBFPmmmd3pr8Xn0z9V+QT2VdGzNVt/eKAEFtSNkiDWY7z15nPrODgkvsMOGJOl
         LBWVJFlVK8M0Dx528+FyPPitI4Jiw3zcwzZn1nxwwh+JU/mXmz44oV/4+cyfYl5bJT3G
         3IhVUSfKPIF9tbhFj7met1cyxj9iYnD/UFbm/+Mt56yUf60m38kUmMMtWdCRSjOUNs4r
         CnvRJsgryfQirqHNJPTgwy6l5tdPA6tez+v8zXk7+mVwwgWDEC9urXRtqlQrswwSiFtP
         kPUiy30telsWR9HwUG95WTF8lxlLD3SS+858pa72CLiDHTrqRfMUxcjPqwI+0Ur5M3fl
         BVtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769375266; x=1769980066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QElr5C7h/WEZ2XkWUj0fD13Y4g5cZjuLGOEGFxpDVhs=;
        b=cgm+C3Rk+TbopWMbErsAecaS2QRGAqISpNS/dlQDZrhm9DqPKjWLQCjeL1C3yJgxmc
         K9Zmb0+RpYGJuhGDMunsid1v9XLB+bHPbIZpND8GUlnQM5vbLUrKCPq+ei7Vr5Vw5Hlk
         w8ougrcFTZLki2vRM66kPykx+/6cCaqcIJ3wGzk5/y382iRZHf22Gvb1bYcJk+QyZ4Kr
         pMOzxQIaKbJyS/SX1Tsrg3K5d6YcDFDAEivYMYsmnscltaVB+MVPRSlmlo1b5s8FbRyH
         4Fp884I2R+GxoS5MIui0Ojwl6yFJSRZTpRX58os2zo1ZUYPZpLnrJraRTGH8TcXQyuaj
         S/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769375266; x=1769980066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QElr5C7h/WEZ2XkWUj0fD13Y4g5cZjuLGOEGFxpDVhs=;
        b=Qpk8lpfONxfbs0YsdkIaaGyOQINp6evjywh9rw+2md6RrMrKAkvb/IWBGoxA36T7ov
         cy3T67y8jKZIirFdu1p5bgBuJBgAUbdkNqJy+sRuI5hlZr8aVlHziR1bDsAdTMWpp/V+
         y7EPW8MkkR2FQyAcp74+48D07iDePP7p6aCQF9+VWxewSVZ0QvhP7l1gWvNF8J9SvHJX
         RPcXp+LJyLksucFRMHFy3oM6bHPd248uF8DXc4Xc4192RRE/QizHHL+m9NPF1T86PK98
         ARyuwR+yQb5tSEZnRR0TsfLVrQMNrgInQL1Wei43xSPNaaYaSavcjio1/B/wtfNClAz8
         Hg0A==
X-Forwarded-Encrypted: i=1; AJvYcCVYzj7TGLIuJvv/0gBkyloLhBgGz2MqjyCDH1Wap+4Ny4hdZ7DLDq7IUyShhiukkF/p99k2uVW2uwPI/5neig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvqreMYGCldAvlDjdlXxDqr6H5osEwdjBo9afYVmsHjBgcylae
	hPuvuWpxJseAOE62QNc2f+BHjIfog7wUwSos/eFheMzu9HaSdDStUw5Zex9d35aBh7zUH4tarJ7
	USNDEnPxQ1eFyTAs421fXOMRv0RLvoN4=
X-Gm-Gg: AZuq6aJ0CDQVFljyl02BztbN71PRHS2pa5SVjcnMNPN+BdCggVaalh7RI95+b83J9yH
	W6ybY+gxF+SoUcXRvp3uUxrrNfQjEPn31n8N41GsOZ2gyjO8Fu0JvoZIYFjNTa9H70BWtKZJ+ne
	WFvm/hbMqyWnQeL8kM812NUdsQ6K4TYVy6Oxkj2rxy4C2r++vK5KJCF38o1ErHpseyi++QvARYp
	3ip4iK8R+wZIgMrXZ+7AaxWpJlWTtPS1pgJZtK7YLBm419v/+yhTv2ASXGAHTKZOqs4NPuO3/hn
	LMWfpb6QIsgWesl80/9Gh6EroryfK2GczlOjFRmk3qb61fe8T85i1DfNWWBmX2QT8tNeBaCO+TD
	uqI+mTenE5+qM
X-Received: by 2002:a05:7301:1286:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b764505d01mr597652eec.4.1769375265611; Sun, 25 Jan 2026
 13:07:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 22:07:33 +0100
X-Gm-Features: AZwV_Qi4824N54q8N5DW-YqARODM9TUmihwxHH8jN1UYM1eFxecmsSlcGMzI290
Message-ID: <CANiq72kaQVopOdB809=kFMVx83MGca1T91RdNUSyC+iFhg642Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Remove redundant imports of items re-exported from prelude
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:22=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> We had a few occurrence of these redundant imports and up until now they'=
re
> mostly checked by human reviews.
>
> I have now implemented a new lint in klint, which is able to spot these a=
nd
> advice on using prelude imports instead. It caught a few existing cases
> that slip through the review. Thus, fix them.
>
> Link: https://github.com/Rust-for-Linux/klint/blob/trunk/doc/not_using_pr=
elude.md

This is great news, thanks Gary.

If others give Acked-bys, I can pick these all, but it may be easier
to pick them independently (for that, the print sample should be split
in principle, but it is so small that Acked-bys may work better for
that last patch).

Cheers,
Miguel
