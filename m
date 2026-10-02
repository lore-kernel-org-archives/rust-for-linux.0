Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151822423A
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 07:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924882; cv=pass; b=k6KImLiDPPgxA744d/pqt70bk9OBgBOCLOFy1ihBPbfKsp1sga49zWTEZjgsRmvOV759gpRZ8wG3pJwdNWuD2l14YtmfHtbhKT52CgL65syGC8i0X65L5WF0F1YPbhVVisdqTwkI2woBt83CK4rDlgwzQlmOzDVhLZgudd/qFK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924882; c=relaxed/simple;
	bh=0kZsdBM5+mLa10yDdH+L0iB3oeaEIMlgEYbn9by+WsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuMi55h//eLTwLqu8Vj49G9TYsvhfvl8+KvZFh5C/e/2t1UoKVaQKrS3VHq01VQerIqNb05N4wHYepTWcxxJJyqcWjMuIKpRDARx79tLAOMCcgGSIcaIPw7UcJM8OjNU+H9KSyXGnIr/CKFkeeW+HIcuCUuR+7wlqrR/m2GC7rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWDwGJ8t; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWDwGJ8t"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so407717eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 00:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924880; cv=none;
        d=google.com; s=arc-20260327;
        b=mrkaz2DhGI6zAX/zM/iP7JRyjGZCkJA5Mae2xmIZJ18CaQINUnfZcuLAqiSJpvK/n3
         2o2Zs7rpTJNPUTcdzvbqq2pkzjmPy2Zr5LCgzP402HrmRE6ryji4lHqpJNW4IMMv/dgg
         kAcPb60zQAJxoUbSYbqxG7liKkekc6M7ldB0VdQUJGmHEoRtEQTMI1T4tsmQxnhMbwRI
         1W4pmX1k+qjUonJ8aAPqiW9awf7PHOF7KYMOt17UmnbduVHJ4ArKrmtQZERj7Wtgd2bg
         RF9YtqHGERd3PvcZ+hvL7m6j784TBx01budBLYqHHWtLpZ6sQXOz9SDgZPg6+/3H4Ucm
         UP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ydpe83lA41yCIuGVNyMdAFh7MZn+N03Wctk3bDM8jMg=;
        fh=Vuv1aUUGpWY7+FlzmHs9Wi1l5IA8vj+5D31h4XUxJKg=;
        b=aaB3S1fvN8O3wqj1IVKJek+toVSi4wK9U5amsyEtFynTE4Zg+tqhusAKWtknmHGOup
         iQT6gy67WV4+EWfqnDXMtNPdMuuYs533JUOoXyEOqReNOQ3MbTFbxCP9yNklsuOSTfKt
         np2hobcbDq6YVhZwKDFL97ppy+p6f/W95eqf3QZl0LIrlkAyUy4zxizntlNRW4JS2MSV
         FdCoW4z59X7tJp2RsuGHkIBCamB5j1d7FBZL0pU+QwTOU+pNLQ7fIiu7XFo7RMwGbQnn
         z0M56QvwakyxJWjvgWftHJrjd/YMXsG2FlHseqhczSSsgRiWV6Q1YIP3AKlQewgeULPX
         GwqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790924880; x=1791529680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ydpe83lA41yCIuGVNyMdAFh7MZn+N03Wctk3bDM8jMg=;
        b=EWDwGJ8tFoW3rBtfEn989iLj5LLLTARD6BGr5YkpF6GLIznSZ8bfyDrUj/V9lPk9u4
         ZDCgTf62C9CaXJxHBgFhLtwJ6i3kK5n+GFE98t/4u/Nvicz92kjpOAdm6LRi0ZVCGajI
         2Sm0GBMeC9xp6gVdc0DYULcWnv8ZsMsrj3RLV3WLRWwjo5UOA9qv+zK2BMxtYjaAuwDv
         Psh+62EFsYEJ6x7fbv9gBKMn1B+C4isA9QWm66niJS+J2cXaWXpu70uS7cHRFSHVwNRG
         DuAftSJ4griVbdw6cOJQhzzj3Rj4yeHvxO9u3ZWPnJGRvbagkvba+W3vYzBVepTxoduW
         z5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924880; x=1791529680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydpe83lA41yCIuGVNyMdAFh7MZn+N03Wctk3bDM8jMg=;
        b=K6HUnSZOhkXRwqMJjIYBbJgpdBgIa/GsxhjHz1fonsR2SfAuyixijJmVe8pG4ISRDQ
         Eifcrys4aLNx4rc9zIMdcsSQOfgZHmgjH107ZPKdDmtIyJpNQ18S/lPN/oAzb66hrway
         fxkl71QOGrzPzxZvRoomC5TJq300/Z2bEgFGTwVOT2UKTsXIl/b+q2tciFaUweYaVlMf
         ivBrzxHNNl7w5nc9M+8OQvtV3mtvmcEVb5Jj+7+1+OWol6mtQ6xCSrMl1L6qdwvQ1RHe
         jTlLSALpvOXy4smn+twP+OntKOsd6Qi8OwzppfUiTFma+IE9VH2l57L2VlWohwlkEELp
         NWQA==
X-Forwarded-Encrypted: i=1; AKwUvByl2JYAa6FydbEADT9AhjJzWRcFE05dRvzQQ1iMQabqUy8Xdkvk5f7YK7pO1iY/NuGYnnOXLoTPX5n5OQD5EA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdsBqBiIMTwhhEr9SQP0qdD9pcZbbKpHaPLyVuWCLJQoASnDKq
	OwDaGVbXNhCM71rxm+3hI7wSQXDUvPeBN5XKydtTEWQ1Z5UeU1iWYvGLCdxwDYxk0oQQM2HQAz9
	nkMY4DaskrjOQKXcJ3mqNajo4FwDuUFg=
X-Gm-Gg: AYBFou2GV+mLd3WNtKD4ZFHg7nkqI0T6gOEIPcAkRGy6WHxBCW3fFirHVVhnsYqCD7O
	Z8r3+QaisW+9SBmt7Pe0NvurOhKZ0IrLfcDYeWcIczIBZAxlYejNGy3/g9fPalbGSjCPA2HVwO0
	XVYIEAbXeFxOzYJ/zx/S9SXMozLy1ALd2RM4CzBorKJuGioWv4oZRLTEapGeXlzaBBjVhyJCWbZ
	WZu+dCUOMqiNv2TRqlaIoPobadQ51y/Zon6l0qTaTKcaZ9cc5fK46L9hsyAqegJRlbvV0LBJBFp
	DutTwKWtbffOCNYF+1KmsYVVKATCxz4Fzv1e9shCKaS72kwuaqTKxRG+XsfYEC1SCxuDZ97sw+Y
	2cirvikMRlMNYlbZx+2lN6tdymDF8wjY+hfviA5nbZgm1dTlYJS/AwEACK5d6Om512g2mEEPRc4
	TtPXFpQdmdMWkBh1YXracGWKTPDon43LjmCtSJ2EBdMhGVs/zo/BU=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr3285553eec.2.1790924880358; Fri, 02 Oct 2026
 00:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916140952.3290924-1-tomo@flapping.org>
In-Reply-To: <20260916140952.3290924-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:07:47 +0200
X-Gm-Features: AclHuK9Yq_tH1nukS-9Fts_dqm4uruSBaNfzWTiLEcRyMGMpTUoth3myfAIkIlU
Message-ID: <CANiq72n=fV7v-pdodt1gW5YJ89s4qcrLZj5nhjvq-3crZtD+Zg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: add a KUnit test for warn_on!
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mkchauras@gmail.com, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 4:10=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The test runs warn_on!(false) and warn_on!(true) inside a KUnit warning
> suppression block, then checks that one warning was counted. The counter
> is incremented by the kernel warning path, not by warn_on! itself, so a
> count of one means the warning was really reported.
>
> warn_flags! has a different definition per architecture. The test does no=
t
> look at any of them, so it runs on every architecture that supports Rust.
>
> The new CONFIG_RUST_BUG_KUNIT_TEST depends on BUG. With CONFIG_BUG=3Dn,
> warn_on! does nothing and no warning is counted.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks!

    [ Added newlines for clarity. - Miguel ]

Cheers,
Miguel
