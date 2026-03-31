Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E812CD8B
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 00:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915414; cv=pass; b=o7LuR4v7EaZCIaCX/IbVMAoXqqKll+sLveVofNjkw2mF8hI6uEJqIdi0+fe1s+NoOJdHty7yGj6HJnCTC3zG+a6jPMr1r2PUGRy0lPfp/j5gIMfAaD8tI2rDhcQeAVj4T5kYGKxx/x5Xmj0eGA/Cmp8jkf9NIavUA+WyKhGh2cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915414; c=relaxed/simple;
	bh=xOOf0pjDbKZw7+oKvJqOMZ1gPAm//7EGckMajz+mKMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsmU5x4hrTLaKNfUZmiblNVk96k6jp7Der67YmDLtOXGX0I38/lZkF4OcPG0fjsNIOeU+IXxB0H2s1y5pUQKRkS34KLK0MPbOndpkhSvuBYtC6Unzl5cRUlR669boi34cD9KRr5Ll6GKF2Hv14CvEsWNDKK/+66LSHPEeX7qlRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVHm23Pn; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVHm23Pn"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c5cf871adcso57680eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 17:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774915413; cv=none;
        d=google.com; s=arc-20240605;
        b=RNrgiNFSvDya0D9WyYjWH/Xt11NdUWnL63Rg3y2TjhrtDksG24cT0MeXWBbJhpSZJh
         Jvutwuu5APddzsyRzdaq/g1Nm+GpaQrk7c+4/pCLSKkgWxYeZt8jusIwlLbfUGTtlEKQ
         r0si8+n91Z7yNBhx3EV1kcMVPgPIo1tbDRAWfG5AE4JQIpzi7XvQ72yXHwtPccTe7fyE
         EK3d1G7bTy8XV4ZBbMBeqAbAsi/Gb7RdPy3itnrcuVWHgaSRZ1jfIcGtjbhe6eb6jB0z
         2NUvkpIbudgdASNO8S5jtxmmHmGY9kRGIINoAxFy7uNH93KQyo9T1gEXFGHrZOfTVSIt
         XV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOOf0pjDbKZw7+oKvJqOMZ1gPAm//7EGckMajz+mKMQ=;
        fh=WWOhOgMI/K9Zko4pyvAppXa8K74ILBaX1Cfh0C9Wny0=;
        b=aVX5ywmsCalXsnjvg+GOTDNkEJOQ/84v4YSc8hC3y8WiS0UC6+0snYgEhRt+YeLawn
         K+iwsnGkavBiQ/r43ZoWw2MaSP4yiAR65DGLZ3SV87ySFTUNLVY78LP22f8k3lc4iqE9
         69P9wSOtl/NIjqxskKV/yRnN0NeYUfuFfAkgxgEnNxusRr/xra3GOCDuVouD0zGpX7Na
         BNHzL50KdH1nhBXM9poKnLExbXGjUc5zErnp0D0fR2QiObBCvjxtCq6Q1yZaTnMPvo9H
         o9jMXxl35nvsIqyqyQ5V3/W8DDWllBa79sPqH9s7K/MrihYJHuHderDPsX3GHx25T39a
         7WPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774915413; x=1775520213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOOf0pjDbKZw7+oKvJqOMZ1gPAm//7EGckMajz+mKMQ=;
        b=qVHm23Pn3w0RV1sCFxW9bXGv6qcN3cj0JaM3ST8lWEn4KUuvnsqrhaimsmdLCgrXam
         mwx3p9Xr7tsdazhRRgg6t2DmhIbYa2u93Wr57BowGRiPsjJH8ldle+IQohz3gG025Gqw
         TRNyj+JUmHIEDpeuZj6Q5xaSBgJOmdR+7a122b0MuzLOQpnMU/vhr76D/UdbwN7JiUfv
         GVb5kb/ZtlcYzJeXKr4M42vsGVNsDq3QYxiyMG2qKpIil0wQr2c+XKk5WOAdpS/OMIhU
         jk5bd2mYzOFYqrTjFIC2JlHiLCJJVYyatu4lpNyRHj6JJFDsSOnOuCjbfdALCI/rcpY7
         o8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774915413; x=1775520213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xOOf0pjDbKZw7+oKvJqOMZ1gPAm//7EGckMajz+mKMQ=;
        b=beaob/N0GUeGgF+YcovS55T60OsWX4qqnsxghHf1XCwi52e4xu948E3hihTwz+ngwS
         CN+TSiImDhqodDhGYGcxYEPchOgYcuxQBLktBARG1VyGP82MlImxpTJCoqyQiYyNMYf2
         atsZx4b8EOMpDt05AuzV4fZ8Uch1xi3zgAwxzZSpLgTZp0vzK1sTKckK0ygwEfPkSfxd
         EeK3jb/U8PAYwxKhnFEGuo2C35bMdYHS0PQ2T+L91T8ceBQPGnGCQPwwodlToJMRkmBc
         +qCZ6R2OY5uLeHJeRU3qAeRRiZwpfjOoUvsgwuZYFKlCFs5pRHUzemMZU/wVvYgZ7H32
         kIXw==
X-Forwarded-Encrypted: i=1; AJvYcCXOshUWx+QcTD/Iys6YzuBikex1qV/cHK5J0NwSOGczo0g1jPfKNa0PD1DAL89/3fnd6pKboIefwTgdOdm8Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eK6/W5gugM0UtLJOICJr7Rlzh02Xjga/XQTMo2y35BbiBeMv
	zJIzN+qpRqqI3kDcX7PyhF82A9CJmRXVxEYSZvcARiI2mmiWEX2bP4MZCqnlJvidhw5BEv/FEOO
	5oTxgmf6UbMikii3juKG1z58y8ctrTec=
X-Gm-Gg: ATEYQzyioRKG/TOSthQkARuxF0C6/EuoAZAQPAMFyUSTKO1eW3ydzTC5vSaeVwZQTyP
	WzwIdA6A4s+0MlxYPrw1NfZh7ZuIeyYh1AOVqAh6dIiYND2t7FNhN0T1N/D2pgTyfecIEWXFnpI
	VPQXsgTmsXkk9ZBdBB3ITplRcHw+YdoYW1Cd8DTg10u1FQ/I8KTwj9fmXNc4AhAMPVdytDSpKdn
	SQroKZ89w9D90iF8sfNQAgatz+T6qDj6moGqRI9PB+h3OzULhqHJxw1fUY4LdmNIcpE0B9i05l2
	pOyxPppIjet4aEdzx2y9JbSlD7Fh33md1JchNBJLlnzAtEueLFcizXZ+7fvQXMiH35+6z5IWeao
	YMPLtc3FLIfnh1iQBl5qOszbpwTPUW5ocMw==
X-Received: by 2002:a05:7022:6987:b0:12a:7181:2f12 with SMTP id
 a92af1059eb24-12ab29149f6mr3609253c88.3.1774915412693; Mon, 30 Mar 2026
 17:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326013902.588242-1-jhubbard@nvidia.com> <20260326013902.588242-17-jhubbard@nvidia.com>
 <CANiq72mwC9K3mOaTUsfrreJqiE7WumqcwqhXQK=nvhsb=024=A@mail.gmail.com> <0c9af1c5-b3f2-442c-9af5-c156926442e2@nvidia.com>
In-Reply-To: <0c9af1c5-b3f2-442c-9af5-c156926442e2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 02:03:20 +0200
X-Gm-Features: AQROBzDHIWH_MvY4hBWyq3GF3gMqaA69xGitGb2XDXhwSXjup7nnEl1FxXMLe5Y
Message-ID: <CANiq72kHi5dawEdT4HbAAZvE4gSJ83-ORHEZJ5+qKzJMxN5yNw@mail.gmail.com>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:41=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> I probably should ask this out loud, just to be sure: is this
> patch on track to get merged though one of the various rust-*
> repositories? Or more to the point, is there anything I can
> do to help here?

Since it is in a series that uses it in later patches, the usual
assumption is that it is meant to land together. That is why I
provided the Acked-by, i.e. so that it can be merged elsewhere.

But if you want me to pick it up this cycle instead (e.g. perhaps
because you don't intend to land the series this cycle and you would
prefer to have one less patch to worry about), then I am happy to do
that too, yeah.

(Sometimes we avoid that if the users are unlikely to land etc., i.e.
the usual no dead code rule, but this series seems like it will land
and the patch contains a general enough tool.)

Up to you!

I hope that clarifies.

Cheers,
Miguel
