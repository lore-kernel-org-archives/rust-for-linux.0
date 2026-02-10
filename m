Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1F1A08A3
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735633; cv=pass; b=QlId5P0tTD2t1Xbl0CChbXpiOEhGM2mZKgoqMKC6/hBUh6j9c/Q5IXrKrhCtd7+BCEma2+R2WvBgUDuqNWv/nfBaeZ7To73PlEkCJKPXLMOX/lRFEoFKD+EOkjrpR7Xop6KpGJGw8VTGEJE9UgNx+nwU+6HeXtP48veipWiqbtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735633; c=relaxed/simple;
	bh=fHvNLDKdNs3rD1+j79owLZkE6hAZrYMpT38UIC05qEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuxnPtQDKLgwV4PKz6YZz4DB+akCEDp/P3aI9/j5EQOfYWhjlhZ/CZiUnfwlExz5itsp19rhKevCwv9lr5eu0kepAZs/5cqex064pqGrs39zJxuHQL+oy4iitXMWE1rW9EcoKsH930bM4qdp2p09PtaPNU4aQeV/ueDffdWmPeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzzsjIA4; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzzsjIA4"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b86a9613d8so156203eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 07:00:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770735631; cv=none;
        d=google.com; s=arc-20240605;
        b=kXsMMOatFmdYR8PdleyeCUVgprSBB6O1cRrTJiV986VpkSlnyHTyUesdsSXWpAoSdJ
         /lROud57HTC+QjgiaJf7Zk2rPoVwz8J0mjF7ZASKPIk7rGLg5Tpy/9sD/oS55egOwnxP
         h4+9jt5jq6VATXrsi3d6sNrkauL52Je/1uiHMs5qdWLxs0h6pncOAy8srZgiRFEdeZyB
         NR7gecyEKKnp3YWuY3+9ZBDKpl08O/Sq69EzMaGtANBGoaWszLwlBlq5SRRCUKRjBb7X
         chxAxcy3VkLEVyL3ZTsWxPre3JoXN7Hm7iy26LPam9tJch4fC+pZhf4if0l0e3A8CA67
         CGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/58CM16a4UEFUH3sKWke3Kl28ka8eimGZFM4bJf9a30=;
        fh=pYlaqoJpo5Chp2yFto9Kkn1uUtguXbpkpOXrfay1W50=;
        b=jH7Yt07FjzmASva1ILMKlyLZloHDArSI5lxBt7po/iJRZ0HjyaEkwBEet4plYIFlWt
         lJXSj9smKt3ouJpbHyMi6T7oD7qjRF4QFGsW1JK2n4n5ka8boxfUspYtEcAc7j5WoheX
         xDMCW4Hj+aYOB+X9QlasLZ01u7zEBoJY1E7YObfsShtkKYspKrDFd1WQLo2J84MCInC5
         pGwUTQ2jLSCzEis01YnLy+0b2T+iluorS6DgShGSZvSf98ropHcAR8lTDCNeak+AKqJE
         tHutA7e7r5h+NPBvIECpoDG15gQizZVqs6nUhnpsHXwaAovEvcqNDpmk5R2njfCXfkmX
         l/pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770735631; x=1771340431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/58CM16a4UEFUH3sKWke3Kl28ka8eimGZFM4bJf9a30=;
        b=JzzsjIA42tqr1VZkEezdQL8cm/r4/w7PNj/xVu2hMRzBpPKJnS7WYUGsgo0u2lGb97
         4RtW4pCAp/qj+mTlbZeEeaDqZKtn0DvUBBjc2rnOtu6zztqmGuM9KGi5HwSQX07BSzFV
         rexdvQZWdTtPr6RshRusi+LY3kFNr0fJj+cthxmgZYB6lDHtpIP2mWwZRBUGJF5k7Wkw
         M2CG09LJglhDYiO0YxH2E0uDHc92KKWYJw1wtr1k9S8eNyDkQNBSyA3MPmtgNcIhOvXF
         tYOFwIPuLwHuVxQUViHp/ZB3qMk+QlDly7EroMfttbc0JKVMW4yVicyJiDdZJVjf00yI
         LHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770735631; x=1771340431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/58CM16a4UEFUH3sKWke3Kl28ka8eimGZFM4bJf9a30=;
        b=t15jXCh+seq2PbDt7QW2XyBx8iW0k7R9hSnNzCg18wC+N0gPDB3J7R/pumPjSvzB8s
         ipjSHefzYmnFpn0PxPlxvrv5DCIRu9ZGfQEULT+wta0Q1rv8s5lvtGW4LgxcYrHDQRon
         aKYP6vtoLixTFtP4X5fHQbH7WI3OD2VmSehO06VIAgOztGFbgcPdy1Rvkic9PqHEBgsg
         0JDq4dzhuxA3Ah/s+aDcAWi95Yq7cAh0Pj0AkBfPcmfn8HwCVYlowKDWwPVr3wJurnyu
         FycPqVfI8WT1UntM3/vaD4+XW1T0dOH45DNHpkwaFaJd9YwS7gGUskXCmdjgJJrzGn5s
         LssQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6gkmpnnJopYzrva6KluCK8Yoba6V8oxMu7OMbkw9jDdEnhG1u2NN7iP7oeg5lD6Py2PkglU2rIlKYtDIebg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfp3zlx1KISeNaksAyVjC2yx6RaorXpjpzDhCi6Fqbujko7qX/
	YBKHnjHDO7/CfX/tGaeIMlLq3QdQyaSsSb3xztJJ23iFyq3GSXKgng6ON/9ilWjjVIQTfulxt2t
	Unv5/TJvA6zyCANf63YXqtxYdDuOSdOQ=
X-Gm-Gg: AZuq6aJK+5Z1EnVw1i22/S6/AFpQUBZrqal71C0Fj6ueezbmpI8zq9JUylUXoPKUYVX
	PFuRiC+tfWUPh4h4u93UW6GvfdCT7Ua9wgcNOHfKFw19j4Dgy3BTEfScYiVHrmnTqX8t4l/KbZl
	txwjL12fjM7LmZ72apbbJ7nE7iJPEua4GceWDRDgW+5rx4ytY/jj1mLGDbM6azYO2ZF8G5qCVTQ
	Z6wlBI3gSK9toXiY6k4mwf2jdNRCYob9Lg953zG7mu6mu4auFJky5V4Vj2rEy1/D3D21IDA26lx
	LE+bzlnRvz5Y+prn1E50gYwAA49DFELZo0VIse+Fj2+mAXb1mtBqSAtYixB/7jogoTxvBEr6NNu
	GahYO06if9u7Tk9JxEdUnrANn
X-Received: by 2002:a05:693c:3282:b0:2ba:6f02:2939 with SMTP id
 5a478bee46e88-2ba8cc4ede0mr385332eec.1.1770735630030; Tue, 10 Feb 2026
 07:00:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205042132.40772-1-muchamadcoirulanwar@gmail.com>
In-Reply-To: <20260205042132.40772-1-muchamadcoirulanwar@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 16:00:17 +0100
X-Gm-Features: AZwV_QgPLmwMioEKSee7rVHs4dLz6Mo6lIcIwxgTVAt4nY6M0WD2hDfEFlwUDpQ
Message-ID: <CANiq72kc_mAko+5S=fEOF0Y-ry7rLyd5a+eC=nZiciUcO3rxXQ@mail.gmail.com>
Subject: Re: [PATCH] rust: print: add safety comments for %pA formatting
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>, 
	Shivendra Sharma <shivendra02467@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, 
	gregkh@linuxfoundation.org, fujita.tomonori@gmail.com, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 5:23=E2=80=AFAM Muchamad Coirul Anwar
<muchamadcoirulanwar@gmail.com> wrote:
>
> The safety comments in `rust_fmt_argument` and `call_printk` were
> previously marked as TODO.
>
> This patch adds the missing safety documentation explaining why
> dereferencing the pointers and calling the C `_printk` function
> is safe in these contexts. It clarifies the contract between
> `lib/vsprintf.c` and the Rust implementation regarding the `%pA`
> format specifier.
>
> Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>

Related:

  https://lore.kernel.org/rust-for-linux/20260128202130.196419-1-shivendra0=
2467@gmail.com/

Cc'ing Shivendra.

Could you (i.e. both) please coordinate the patches, perhaps merging
them into a single series? You may want to use Co-developed-by and/or
have a different author per patch etc.

Thanks!

Cheers,
Miguel
