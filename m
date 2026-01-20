Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504F340263
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939490; cv=pass; b=QOh+q5laDoNK8uxLj0uH1bBakX4mZ4vy5kvWpC5PsGl4RzYYBn92qYcuemM56h0ihKp8tD0JrDGkSDcbhH/056wY8rHQSS1syxFyQ7jrtNjXACVeGX7WUYAsH2uAgklPM/AMUUO8C38V2ZwIO7Eo9AghqzlXxt0Ve3FPJmIF/TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939490; c=relaxed/simple;
	bh=3eRZHZO5uj2XFCeDGvFlIRfXNXLus8iDoYTejlN02DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBwaBFAWVQrq+8yhP/ikmKcW6XffLqp3qIGFk3cW0ASpDLD657mlRoJoQjOZIxtTOIG+z9Bbv+O6co0XEjev55XPlgxwAcAfI7wckv9e0wOdpibK0WF9zeEsb90Z41LFoDr2j2CMB3qZuaQROtjE88T6h+QqJ+/WaV2ZipX9W54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/scfDcq; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/scfDcq"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1233ad1b4cdso378777c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768939488; cv=none;
        d=google.com; s=arc-20240605;
        b=K2bJuh8apATYp5FrIidSu3qurTKFExuQfzwn9jLBRfpLW7n8oouyNudSqje53XEWtF
         llAsR3fqkYiMzUnkBia1K7MHdN+RvW2vZPAwEMFq7vauVD7VDUh9fNnEitShb7bOeRBV
         cgHJFMc+FXFT5HzJKT81cEYGlfto7rbDp+PHav3ci8BPfHadGHnjCIDHW5j9BexTfUKQ
         Oct3HbhaebfxH0GMpgMR8FX3b7sQOKiQL2Ca3aiqVyOSjFF2XUQwt1IwkuxAhJiYnhUj
         MK2pzSeXEXgCmFVx4MKHvK7MJmfT23PjZLBNdXZrIKN0UkFxQCZq/Xo7MmK8o3q5qQUl
         JhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e6jT46+2U8qcBZ2NxdFlnvCnSYaJ9YlCSYUWpSuA1AU=;
        fh=vISTBu53Qm/abJxhOG0ES8XPyh7wj2vAfnALPI8bOYQ=;
        b=an0mxLevMos0coDzE1q00HGVPmSVpcF9VmNDm8SnFhKngCWLGCp86RoW0umogrX1j8
         w0PRy5EZBsdO5XldQqyEjweiUwBz6lNks1Gm9L4UW+d451kCRJroft+tJyjvFbBtFIoK
         gksWluiL8TPniGaRqdS5UJ4SoUySq9S9P7mFLxGu9MrUJMy/qoJrgAmHv/1DGpaF/58c
         UxC52IyMjQ/IRwRhGP/faRJY9TBAZk9KaKj/CWUv8y0XoVNjV6UwjfXSQ1AYNj3gnNeM
         et3RQsaYQa9/CkVbGLFiY1iWYXKowWtrMD1q1yKRxFb44UhdIGV2Uep321DTaD867ao7
         pmIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939488; x=1769544288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6jT46+2U8qcBZ2NxdFlnvCnSYaJ9YlCSYUWpSuA1AU=;
        b=P/scfDcqB52704Z/DAXgeJA0BS4uDOvLZDr/hNjdnegWbZ/3k6Ch0GQ717FPK6Xghr
         Jqg9R2gF3nmr/2T+ReT7x5dzilpCQzrWHQDc3LVh7DNPPGHy9qTMqrJQLT4+gfZdJKSx
         1w679l5Ax6xaC/wFaox1N29kzeES9YLZXH93GBQk+hrxlezt0UYeiGVhce5oO2dHTgzJ
         FQpfmJ4eSWT2fEhgocnN7SH5Aiax65HiKN9gUSfdbHjnEDR4h6dAETvAAivXur5gwxX+
         B0LiERB75rG1WwQuhm01OmNGLzESH/zm/EjU2r8KYrI2J90362QnzN9RKslBn/2sLKp4
         NxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939488; x=1769544288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6jT46+2U8qcBZ2NxdFlnvCnSYaJ9YlCSYUWpSuA1AU=;
        b=PAcQiHbjuOyw0sQq2g9KD47vQKY0wa6pDtrdiABdQnEkXDT3aV/yfU8h9N5ANDqcN0
         FaUSkP+xl+vkfx5qYgi5dGVndzb0OoJYLCNgp45TAE/mlxlOWbzTQKitXd7JgqyW/Nyu
         cYMRj20R426HhvMc2jigvF9tLZE+t1xhKtK6TmgCqouUFmdivo8h+lUPu4nOZEWG5o4M
         iQ6RiGA3+LEtIVZRKw7uPypF6ptqXVPXfrLkdX6GTD86shp5gf9gv0Aj8teIcCKzQH7j
         30JFgUWj+ZB+JiH4QVKMqzv07YZ3pZsonVCFH85aQT3yoDLLJoM9cw7mGzCgB/9AlZ/1
         439Q==
X-Gm-Message-State: AOJu0YymV6FTviwWle5TF5PDWG/62csCAlhB9h4fPPdHjFjtOG+bdFfY
	l79eVUVQqsoP8qOVRXuqFWV0gYlolpX8YwPNnqJHNQalEC1oWGM42LvWnDqkbO07mCSQUtC9bKl
	qKek1T/KnhL7QHFCNlBbqSBBs9mjFefY=
X-Gm-Gg: AZuq6aLnxSivWK7Dlfey+KU0csFpenfxniGzQG95I9c4DEDkmYOVbjc4dmMayW54jxF
	MH5ETH0Nu/nwZcp9wsYDdHDB1nO7PtECOGqGJELIew8LH5yMGC7PXf1qLe+N9xXgJgEX0+MnKGC
	sgFb6VEsFtU15/MuyBFHCmF8QIOnrngY+rz10UWmeKRfenKYZll5EQmBpdSpucFAN0aM+0pNuvv
	XeotJjKRuDsPIwrshvGFGrRVFQvR+8nWuBjEY08zXj10B4pyJzpLCFqP0awTSa6SBzlJqbhAVVq
	cu1CMRI+nSN40ibBgXIqhHrOb5qqAeCBIwLkKBuzLqlP9aqVvr4QnoTqkdA42HiTm6NB5gBXFVE
	3JLEVvIyUPoVt
X-Received: by 2002:a05:7300:6148:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b6f70f2301mr1456353eec.8.1768939486512; Tue, 20 Jan 2026
 12:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk=Op9baRBH8_T1xZpa79TiteMEBHQJAqEM_E=5KHnsmZD8Mg@mail.gmail.com>
In-Reply-To: <CAGk=Op9baRBH8_T1xZpa79TiteMEBHQJAqEM_E=5KHnsmZD8Mg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 21:04:33 +0100
X-Gm-Features: AZwV_QgEFiQHsL8wCiv-YMQISmX2j_hRH_41QUF-M2VAcjpeqa0BLTbrSvenuPg
Message-ID: <CANiq72=rd+AcTSs3QNf+fju1pMg7peb0QK_B1jfVEr4E2BNrzw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: add if_cfg! macro for config-based conditionals
To: Christopher Erleigh <christopher.erleigh@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 5:28=E2=80=AFPM Christopher Erleigh
<christopher.erleigh@gmail.com> wrote:
>
> This macro simplifies conditional compilation patterns by providing a
> more readable syntax for selecting code based on kernel configuration
> options. It replaces verbose #[cfg(...)] and #[cfg(not(...))] blocks
> with a cleaner if_cfg!(if CONFIG_FOO { expr1 } else { expr2 }) syntax.

Regarding the feature itself, IIRC, wasn't this coming soon to the
standard library?

Cc'ing Benno who created the issue and Trevor and Tamir who were involved t=
here.

There is a PR to stabilize the feature:

    https://github.com/rust-lang/rust/pull/149783

It would be interesting to see if we can use that one already and how
it would look like in the kernel.

Otherwise, if the feature was not ready enough by e.g. 1.85 which will
be our new minimum, then we should probably convert a patch like this
one into following the same name etc. so that eventually we can
migrate.

Well, Trevor mentioned we shouldn't half a year ago, due to syntax
change proposals, but nowadays it seems closer to stabilization?

Personally, I don't love that we need a macro for this, but if it is
going to be in the standard library and well-formatted by `rustfmt`,
then I guess it is OK...

Cheers,
Miguel
