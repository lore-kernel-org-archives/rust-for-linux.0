Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731935950
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 02:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772592003; cv=pass; b=J3JPn5Rn+SaMFWm7UUdjvhdKQ8DmGSJDDf+siRmiiIO5SWyW+Zjhuh00U2OaadrHMuJxEDONSIf4NOR7RyGB+I62G2d+oryb8qxGn6hifHtJDm6hS+5fOj6/Y7UOnibekB/k4EOf9VV5z6fnK5NAVkftA01Kquf0MG+TVpLs06k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772592003; c=relaxed/simple;
	bh=6u3WfzRtHs9u8vnunqqP00fx39IKEL4thU4xEicYcYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgb0ze6pIgsAbhEBBfUsA+YjzbtqtRtxfDvPkx27SAO5Ntj8pbwBxOJy9c4adneURRqaeEtqmZ2242AXzdhEFY0p2WilLnGQkaUzLg012HcURHkMz1AsesKVAS4uLMM+iDTYclF0DSl0KrknlUN66vo1osXDLwOYdNZTU9BimLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUWgdfoy; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUWgdfoy"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd801b4078so517207eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 18:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772592002; cv=none;
        d=google.com; s=arc-20240605;
        b=BJ9w7lPKCEMgfC5rZpMSwTxq1+HFOhU9uHrE08QCupuJifjADFavoezW0Tfcrx7lxL
         kfJchdBTwzhegT5+vqlpYxU2uDEDGWMc3wT/6Di9BqZJXFlUH1FkK8AlcQG0OMXuQ3fQ
         NQm+CxQLrEoFcKCsuTM2VMQtFOhFyk5FCb4Se3nwrRJJQkP4+bQcNIIyAf2Im7ttpcqe
         6cKuu4Jic2miHrASc1jTOc/sqGuYgN8ji+bIWlSIse/ZznvzpLk5NANIdtKDLl++bOql
         W6iZm9YMaFBOQ3EWKYSkeFBQU9ykdCFDSL6XUL5oJpBXpGMNeZeJ+3RmeA8QMmEmzVvC
         N/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDeFX6ART7B3BVdcaJ5X/veRzq62PjBspjay32pUUCA=;
        fh=qeKTsbegVRz2RZ2usZW6AxlJbM2NWQ8O66JFfgt01rg=;
        b=fs5u+NJvjCXS+tgZk89ZZlAGstAS+53Kz0X9VCd18+mFh36cHzKVigb9y2vxGmROZc
         CDVETbKugwFzFcmouZoA/Cx3/oZoCvhnReUfQbD6FR1JtVVAtQAZsoiagLxpPmyXtw+x
         yRnXq7E5wpf2vUFRCVjtgtOGh9gyJU1Ls3DQfE02qREtjKS2FNsicfhpzDwPCJuIuz9F
         J10sc5aNUAaGgraDZsoMLHQ2YH75MOnqmhnTRSQzqadRY7JwjLHUpbl9ykDRCztWk1fm
         AnB3ecuNZQ5ySQygTRqo9qhocvHUEpMFN+e7U+4y6AzaeiXPwrEMkVW6J6UWHR94sa1I
         0XwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772592002; x=1773196802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDeFX6ART7B3BVdcaJ5X/veRzq62PjBspjay32pUUCA=;
        b=AUWgdfoyqSuPqASadgM/9UEg6gGSKsklpXRr9tdkgM/I55NOT3/lzwT36uo3WOxVjJ
         eZCOV7oZIF50ykNIw0FZYEcQG6Q/Q+S535qtJThS1J2VzhOfXKyz9EuvQM6KhscQkpko
         DIi5xPex/w6kKGBd6d8M9mtrHay22Y6aEzyjAK0QdPYbUgCTxYx8NlzVIJ2M1SudZS+f
         Q8X685LMTkXzgdTocD8Filgqd6v94sLaw+l8TAyNYwxbHCa0ocl9CPHQbPfu4BG1qh/C
         bXx4zwd/Ntjofpg0blXa2tZyVoZlwc8o/LhrXWuYCsyU/3iGq62IwfhKNC0vB2dgz4gY
         04lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772592002; x=1773196802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDeFX6ART7B3BVdcaJ5X/veRzq62PjBspjay32pUUCA=;
        b=gtXhara1AsvyQaD68wQ5e+q0Ut22V08haWiz2ategyvIP7LsByKpx8MDF6ZYsUU/BC
         gP6rVODV2pQCPfK0dKzSuSUQ7G1Heq0uinCTMJx2FOWjWjve9qKeavWWIs022yJgWeUJ
         EdGaPkEq7ECFY2d1xTexYj2X8hDvURzEJ/1Rw+pV75rqnyQrsTPNgUg4E4JQ0Na6uIAH
         Ecl0O/kki5TdvJ224nbAOjLBk76XPkm4ht+5yZMXAecGVWbFT3vfQGUBxkAWKhZzLikZ
         jmNgGdAgsY81sl4yak27XbugN1HK8B2zlwxHSwntGgmEvmcpSbO71/AAm+okvo9m/cL5
         QuWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJaNVFU5rFnM8NLJ/MXKRfccn8JtN69p3jRzA9mio4qVcqacMzyvBZUJ9+iBWMgLiGuq23WOZeTUR+ujFXYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEqNEmy/sCXIBsfKqI0PZ9ooTOYGGAymctrBNpYMnMfJyBDzY
	FBpCafRuE26VeYHKz9KlpBUVEVVvZFBB+2qVr+aCzXsrPn7eJjQqeiyTLqZKTYhcMFTrZcB0h0r
	Ae07V4KAEBUIgQDlgVF957fbFODbDgHc=
X-Gm-Gg: ATEYQzwMaBw8IeqpLHUbLgK2tTz/KMiDgPM6Nh3Vim6zSLgogKVpFAJoLMw0etajQtC
	s2XS/jVV/dOfwznwT0j1DXz5BSaxVko0l5rz6CyG+0m084Wk3Er/bRl+wRKSV7CWYbQxBc3/cB+
	BXic3NxHPu2Ko8yj7QYBPoIbwM8lAyKh9uSD1XoDAA8ApEd4GGh6U3dviPPHNS52lTHZU7w/UVD
	py7hZkb5AuGALeRkSNNE6TZVNy8YZxYDB9o/QbYW2p2aBtRsr8Udg49VKjSEMQc91CCe+QmAK0X
	TmMkJH9tKy3hCp6HQ+NJwWZ57wpERnYCvj+cX4Fsd2u4fVn3cFdIivEbBNxhIPiRYjZUTJgdZiw
	yLwTo1Q77FZLOLbcCvaS/33kh
X-Received: by 2002:a05:7300:ec16:b0:2be:ca4:e136 with SMTP id
 5a478bee46e88-2be30fd10eemr113160eec.2.1772592001174; Tue, 03 Mar 2026
 18:40:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224072957.214979-1-gary@garyguo.net>
In-Reply-To: <20260224072957.214979-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 03:39:47 +0100
X-Gm-Features: AaiRm50AQ1h-nlqQf5CDvJnD6CwsW_qLR96K0uS2KkMG7XY6Fo8_bKuyWFv3nqs
Message-ID: <CANiq72n7untEAnjO7tEorU37eNBCrepn+q7vb+pOFYb0+Uw6oQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: emit dep-info into $(depfile) directly
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 8:30=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> After commit 295d8398c67e ("kbuild: specify output names separately for
> each emission type from rustc"), the preferred pattern is to ask rustc to
> emit depedency information into $(depfile) directly, and after commit
> 2185242faddd ("kbuild: remove sed commands after rustc rules"), the
> post-processing to remove comments is no longer necessary as fixdep can
> handle comments directly. Thus, emit dep-ifno into $(depfile) directly an=
d
> remove the mv and sed invocation.
>
> This fixes the issue where a non-ignored .d file is emitted during
> compilation and removed shortly afterwards.
>
> Reported-by: Onur =C3=96zkan <work@onurozkan.dev>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/syn.20artifact.20being.20tracked.20by.20git/with/575467879
> Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks everyone!

    [ Like Gary mentioned in Zulip, this likely happened due to rebasing
      the builds part of the old `syn` work I had. - Miguel ]

    [ Reworded for a couple of typos. - Miguel ]

Also Cc: stable@vger.kernel.org

Cheers,
Miguel
