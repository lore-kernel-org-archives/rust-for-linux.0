Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C230372680
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266837; cv=pass; b=M+n3LmfclPUT0wUmkKqVmhNjgX5a4ggk0kP9hNp/q2VrJYVdUsgnX8zy2yOFLqHlOHhlauaU5xB9H2xdyLQ2yyZP+xtLqLG0gMNy6ZvXTzTOPAm66evbUs6pW5+IsgJPj5Wx7/lvPMkzBqc4lEHm1s+Vm4ti/ypRbycYmhcl2dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266837; c=relaxed/simple;
	bh=tSHTd/P3p6GYKtX3WQgUaDsZrGoJS+1kuOqNXUg02HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwFlxw0JaghDqYp9ia5mz/grpT3RP1J36SG7E8p587ZQwYOeKC3MMzQCe0WfYiJbYG4qPpuWbS8MRLUwqnnQAXcJ982PoyxlMpgfEu/A+6PblhDctRglQVJKQsLw9Eeul/DPvdmlOr3M6TwB/wBkLhcZE4QW9J7nIfRMViLYSag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMV+ztTB; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMV+ztTB"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cffd93cdedso3668085ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 05:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788266835; cv=none;
        d=google.com; s=arc-20260327;
        b=mnD3mpiZiblhOBhhuRZhsWfTOjOH3n3oWa5eG6PNdkLumQqhdf54DqbesU7KdZ+rrC
         PbjRRkyvktOsiug7minvEUWGW7KvIO24yhgsa0/BfbQMEvlZL4ZqBHqTtmuBs1hlWkWb
         odX0yndLVKmFpnWY9wky+6PfmVgHmBp7sFnerVIVJMWxiw1NkV0RUNfbouum6AdwJX4H
         X2e4AARIM6ZJFJW87u2vO90Oq/WYfWi2+b7UaQw51f9Z83f15FgXZMveQTjQI+B9Dctz
         qxDDcMiBbQVMzFEENu0CxLNnb//OpS1p/L857kb0PtGHB97MHPnNHilHlQsXEmEZaV7N
         qk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YY7/nqCIyRT979Xza7vq6CHGCQir1nfRHMiFD5zxFzg=;
        fh=f4CO3jgKeCBDkfk0cOvDWyjdUSug7zMRO+kbgqDE8OU=;
        b=sg9eLmbX/kNIc2+TZ3YA+q6Rp0PZxRjmb5UZGJZgu+tMSGCMZ/X3fu3hzD3n7wIpYq
         OFlc0zUvzQuLLw4qDn42JDE7muir1m+W2jXkY1yxvP+gUOEyKu4AuFR9GHpdEe4/FX7M
         2YcrYBE5sovALGJcFeJPX4p85rJXKjOAmDMEcyV02RcY0haGVT/8CQMKxvQpcwbZ5LFH
         4Qkbb9WIP8mX0ZtMN9b8PANtAfsBB7biIV2wtHwGZP9zJ8On4hNRHrtJAueXf3lwx9w3
         ULjOB8oLGtJAVyJ6f1zm89Yjg6FQ0jS0aJUBkmz5Y3JhwWakN95WpWpJfngViabj/Pad
         gXng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266835; x=1788871635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YY7/nqCIyRT979Xza7vq6CHGCQir1nfRHMiFD5zxFzg=;
        b=KMV+ztTBbp+57dWhCB8ygIGzr0sDdURpsksWI3HQgz9rdwNtzM2s5YhHihvwKfq5Qx
         +VgwI/6sxKEpTCe7EMbExfq1MA5O2LS0VxPnMnJfshI1mFUa0rgAMxvUJGCS+5MsUr/4
         8iTUP9qqNXURS4He4+Mq0S0DZaP7Kjc7Np6547qgjBsa6R8/PWCdAca3nAEsdsVqFNRT
         ZzNR5SGWQ+olkO2qqrisWpHRsOoxso/pUK789kgnKJrOAif1aeJD3w9FVbHH20gXmpGh
         1MxTuWOtHcNZL6cSY+sjBsbUg2sUf2cNlr8PRrKL2aMvrLSjAEdeKrSoaBBSNwHe5EYK
         A5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266835; x=1788871635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YY7/nqCIyRT979Xza7vq6CHGCQir1nfRHMiFD5zxFzg=;
        b=F5973uH52yYOAl0Cgej1mjieNp7YptXL9qyWqrlBYVUiUWzQK2Vm2LGayetB7Yuf4o
         mGf9czR40sCxqfV9c2ap96hnp7Ay3/njG6evUXYVyFDCpXFPcXCSmTAM8JC/7PX6Rgc3
         BTowqEr70+3NECSMiTQvxr/8bnDqobdmKSbZatBmq4Xt9b/qUS/p8gVxN2B3+LXnPr5D
         OW7OHW+01wzbcuIgroT8HgJHDoGlH7uOUC3KinAtuiMU5xDPB7vxQXZYEhPrHkdrItrZ
         U95KwF4pVEJx+E3O6HcQE8HStICXO/9MkeZdyCAi87OtkHLy4NGLHjwZgwrmMf5oFKZY
         NPbw==
X-Forwarded-Encrypted: i=1; AKwUvBwHKxYRA+MXVsGXqBy1MN/fSuPlEL/wBLualD4Y8aE+tNBfzXhMMiyhnFCcrD6jL99tOG+PjWY3p5m8L6BdMA==@vger.kernel.org
X-Gm-Message-State: AFuF++n7OA40R7gtxh4vec6H2GbzNYQXSwoSc9jGtNeWHD1ZIHBahdnt
	0LT+QyKdiBFO1/esl6jzl5qb+CtuyiTzUel4Hpn38FoHN76BP0Ub5O/PyduaGHce/65+9LAepAH
	vB4S+4i0L5OdTrXzZsuJyQjDWb/hT5ZVOw2KmndU=
X-Gm-Gg: AYBFou2Zd7mW5kdJmJzrVVTf6i/d2O7gYx6L9ZrCtwTehmatMNVkmXgl4/4oKX5arUs
	HWg+mWcLpZGXjiuO4zu9f8taBNDb7GpVkV0cigQslDDKqzMjkoVB1UnamPNSYuEWMf3lKccZKm8
	LYGqbhzNEGZWtWlPbibq+/sYIVWgMSy0/eQD+R0WxWHqJwEF9OmBHFzrKWbqKjxUxCI+QJw79a8
	BktiLAODSmEPx5uMGhCHvOVxuSJGB/EiwyzFaO10JE4TLC5ojf9gWIbAX8Cg57dsR7d35KkAHDz
	cyFxK77MKnJTZjfUopBJeL7QiIUXcZIYrtJJPDmO1HuMm5aWdPivlmE6KdGeJnHRKIg5DvS1Fqn
	6q06n3KxkuD+2t8Jpcmeq2BgyjQLcrrRtVXcYC1G1gvPl6ZanGW+BohhbVRtA
X-Received: by 2002:a17:902:d4c3:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d74df1c3e6mr300904625ad.2.1788266835323; Tue, 01 Sep 2026
 05:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901031824.1377498-1-springbreeze@stu.pku.edu.cn> <DL3YRAXKKEEI.GOGNVOO3AV02@garyguo.net>
In-Reply-To: <DL3YRAXKKEEI.GOGNVOO3AV02@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 14:47:02 +0200
X-Gm-Features: AcwNN1V1Jwuvmj9QXGIMvnAzaA7Q6RWpCPniGM_AD7qCT09U20JkW5qZV4zK2EU
Message-ID: <CANiq72n0sgSPQ6SmUbK+tv9S5VZktA7g5XMjHOBOFNYLo2oA2w@mail.gmail.com>
Subject: Re: [PATCH net v4] rust: net: phy: fix off-by-one bit positions in
 device status accessors
To: Gary Guo <gary@garyguo.net>
Cc: Chunfeng Song <springbreeze@stu.pku.edu.cn>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, kuba@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:03=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Might be worth mentioning that this is change is only possible since this
> April's bindgen version bump.
>
> This is a bindgen version that we requested
> https://github.com/rust-lang/rust-bindgen/issues/2674 and available since
> bindgen 0.71.
>
> This will affect backports.

Definitely, if the patch shouldn't be automatically backported, then
we should limit it with a `#` comment, e.g.

  Cc: stable@vger.kernel.org # Only 7.1.y and later (requires
bindgen's raw pointer accessors).

> IMO it's little bit awkward to have the comparision be inside unsafe bloc=
k.
> Perhaps
>
>     let autoneg =3D unsafe { bindings::phy_device::autoneg_raw(phydev) };
>     autoneg =3D=3D bindings::AUTONEG_ENABLE
>
> ?

Agreed, yeah.

Cheers,
Miguel
