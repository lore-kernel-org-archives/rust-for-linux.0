Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BE82E5B19
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359307; cv=pass; b=NLKqlYBPYMaLcPAHWu6pXkpck0DMu4FaMs6pRLTNsM90UgjE+nKtziOfqUmApHl3CHDmMtQq9nkubC7XMdtY+O+diyqoP2QsyBlwuwILelkIteI8C/A9AxXkEmUVSgH2owm5ZkR22YmWpq+x4wrU3PSEQwI0lWDiJ0ZeUMOvSd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359307; c=relaxed/simple;
	bh=3wcMuvP2NR080f3mTAHN2bNdtQgsrGUt8kZbd5b6fE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db3c8Iq8xNRjB7krhRl2X/EOVqn8Tc7nSnybjY4C8N8OOB5QBS4dSDDdPyhUDHbxtSKsZXFOxNYgdnPUrrK3++8cU3SRwQHRHE1NFhJgQ4quiXSLX1IiRmU+g2ARYrr8ER/sFEdGdrF2nkKsIzx5+eZJ8D7Hg6/yt3J7boo1X2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd2CmyL1; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd2CmyL1"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1273c690e5bso257662c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771359306; cv=none;
        d=google.com; s=arc-20240605;
        b=iVoNalarfGVecxt9BF1dtA/fRSpJ1PjZfW7hu9X6fcl8bwIQDMnwix5AR+nRxu0VYn
         LVvpsNSILgeqGG2bSkjS8QhJMZjMN5u9uHnMfqCLr1sB1GLfTcB8VegHGLsy3UJ2VzEo
         AISxneANYg2DsFlGsxw2jb/TqrkcHQ6niDJrwrv26ivYwugDJgZEOJqsv9QhoD3DvzKJ
         yBZFnd1WKYrMMZYgpJTuugXbOy2AA64K6D34UJQFcEkcgtbbs3U2F/X9UliNUMjcMR3o
         7bJH39VTpGNcq2AuXWzw7+YaOPjWLONAPP/BgSEIYWrQ8urEslBikKtYvdERWF83miQv
         nELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAYO4SE+uXRQFqS02L09YZE3aUET5DXvetwhztMDmzU=;
        fh=swScQEkIiOXUj//U9z3f+3JaLCWMVDoS0dEQoNXHBiw=;
        b=ONKC72SwuowUIYvgH03ZR9TvBcsQpvN045/jmilXe1UA9eSUjfIER2NU/PvkdR1t44
         GlYh1gOpfVA8H5jF0TnZosZeZJgSHba6rcQTs8IHfzNszQJrjDKxsHFk+EjGNp6PxvU0
         ylFDGqQVon9osk5+oQQYCtVvGmkBrzf2gKMx1xLI+0bUVqdmjO59CRVfY4KGzyAb2AID
         D5DyUxo/OU4ESv9jPa83TOCwObPX377dpq7+Nvqueq82zquwXcnpBkpYA56VkumUUHjB
         gHChOGi4ZIgSzNEvQhemgMZQBTeHLiuNHHfe7f5MeKwZ8Ypgh38SUq1bUCz3YrI+pLYr
         ONsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771359306; x=1771964106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAYO4SE+uXRQFqS02L09YZE3aUET5DXvetwhztMDmzU=;
        b=Qd2CmyL1r28G0pmwkEFxQh2quq+s7HiqqnmqQSMreLWrp1bQty8lFU8loYxU6LdHHo
         0ywE41cJGo1TR1/IM/hVQHmSyn01hf71+fZ8saqBiPPsN0zIAq6omElTOfuk4R0LdFPs
         8qqEInm8ooXkvzFN+rnNy03HXIRqU61GsVtY5lzC0NKNfozAnGneicDenz++/gL0fKXh
         DOSgCgDW1OZ2mLl1sKYgcGc4HtiFm9Dorp2WjtyLEx938n1WcG+/m1YTN/MukuIRqko2
         WRhVnW6BJPNaTTz0oVIlGQ5iDnRdeGhnB2BDjNyCVDZLoHvOnBvQja3eNCsmgWXeeh06
         1s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771359306; x=1771964106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAYO4SE+uXRQFqS02L09YZE3aUET5DXvetwhztMDmzU=;
        b=VjRFsIP/BOSS1DwrHOyL6sH6uLYQPSBl0Zy2BLfgt057ACJDA+ZSRsQLLESB7ZFm4v
         7KpBkXC3Njkd+juSAMuO7TkqWnoBRVv8LmfWFotfdBrLF+dHUn5Kc0nGm4cPk+xSjjOP
         E4LWLlR2FZaK1W7V2h+e8QeH3iGQcSAWCWcOAzU06v3vMPo4ujyVHbGB70B2DwHqQ31C
         G4oUPCUBJomLY49fIGDCW2oHCym9dbVPhYWCN46QVyV8kc9eVk/WF+BVx9A8JpYuzQQ7
         uZIRguALX3U3UQkNfxAQwwoX+ex77sZeNCOWo/31jmTRMRhGGAYs/jzCeBdlAPiwNSXl
         Gd3g==
X-Forwarded-Encrypted: i=1; AJvYcCXiUzPqRNlAn7LzZSxp60KXP2Qun5Bjt9gdqiOluvy4G5No0vNET+9gqg0l+mpC8RVAjFUd8FKDWPydEBqLXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhab/1WNlKB6Lyn3JXR6VQTf9jhyEkkCf0NUm7f2WajcR70Dx1
	jwQIp2pDMAHWx7D6LwcxjjOMkGKYJtZW5Wb6yGnI4bgPKswIjj8zKsY9kZXxf4A6Q1vFJbyRXxj
	tckwV1Q9eTsIhF/tthp7rkTij3desg6c=
X-Gm-Gg: AZuq6aKuj6IzUu1fnNtwrHlB0L3xBNYyabpL95X/iJQr/VDjpkUwBy1zQXPSL/XnSob
	Ht18l7BFS8/5IY2GcQUIyVAszd0JfIv4IPy3yQ9qDP7JGcg2l9KTsAJlZIpr37fk+HK7S6uuDFX
	n7iy2kuN7edxuVYMb9ASyDqXVQZtfZJ8wZFdhdTqmzXkJaQi2CugaJtnI0GiMX9Fw1dpSQ0gwCV
	phxoWJH5JNa+bAdU6OOVVEdEHpxowDeNzKnTUCVDr2MnGFnBw6qCjynb6McM5zVCUagZe36Wqd7
	xmbXI6/7SaLGI95t5BNUo/QtiW3ODyd1AQZIKkFSrXfNISNMlHcuMf8L8RjuqTNkY9BUCpQKYsX
	KCkKUYguygt1BPLE2MT57xwcs
X-Received: by 2002:a05:7300:3b04:b0:2ba:673b:e328 with SMTP id
 5a478bee46e88-2baba13781amr3352534eec.9.1771359305469; Tue, 17 Feb 2026
 12:15:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZRncP-sKLLS2K1U@macos> <ix0mR76G9a_ieuQUUkkfHMJIviAsrFaO859172fuFx9Goj7QdIfz1jtnv3ptubGEC7uEFCvVfEoWxcisUnTi1g==@protonmail.internalid>
 <aZR-ItMBkiqyBdKd@casper.infradead.org> <87bjhncl7j.fsf@kernel.org>
In-Reply-To: <87bjhncl7j.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Feb 2026 21:14:52 +0100
X-Gm-Features: AaiRm52VYhrU4cs6R8w700gaQvNkNfHgVUmjPtJwdjGBU7D0DnMLnJVDQ4-mO04
Message-ID: <CANiq72nTOpGw6JhrMLK47+7TCJjrLRdNebctrmj5xO6yqAqSuQ@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Daniel Gomez <da.gomez@kernel.org>, linux-mm@kvack.org, 
	lsf-pc@lists.linux-foundation.org, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Daniel Gomez <da.gomez@samsung.com>, gost.dev@samsung.com, 
	Greg KH <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, 
	Kairui Song <kasong@tencent.com>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 6:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> We can, and should, start evaluating if we
> can deploy Rust in this area now. We might find that we are lacking
> something from the Rust language to do what we want. We can work with
> the Rust developers to make sure that the Rust language gets all the
> bells and whistles that it needs, to support the use cases we have for
> the Linux kernel.

To clarify for others that may not have the context...

We are already working with upstream Rust (and have been for years
now) on improving the Rust language for the Linux kernel. We have
regular meetings with them every two weeks, and have a shared roadmap.

To give a sense of the collaboration status, some major language
features are getting developed with/for/by the Linux kernel and the
kernel is even built in their pre-merge CI.

In terms of discovering features needed, I don't think there will be
big surprises there, given all the work done so far. But if the plan
is to expose a C API, then we may actually find we want new things
from the C language instead! :)

Technically, adding Rust "core" code can be done today, whether for
Rust callers only (which as Tamir says is where a lot of advantages
really show) or for C callers too (where a "native Rust"
implementation can be simpler than dealing with "abstractions" of C
APIs).

So it is all a matter of maintainers being OK with the costs. To me,
this is similar to the "Rust reference drivers" proposal, but for
currently non-configurable parts of the kernel:

    https://rust-for-linux.com/rust-reference-drivers

Cheers,
Miguel
