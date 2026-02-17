Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CDC2D781B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771358764; cv=pass; b=VN2Zs9V2VzUZaDh6pxlAmFVmlQC8kMRwXTDsWV6Ur5Uq4SCHgnM3kY53ZVG+TlWBnD5gIRQd6ISz/rtwQ8Xi3s09vzY5EviGCGQVigPfV/mJaPeaKKPCLQzZTpG7eIhfokekGwFY6qcE9f+ZkMX67VG6AjiJOoUNvdUTCl6qE5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771358764; c=relaxed/simple;
	bh=QvmFEfilerm7lO2XoIh8wNsVoLikRWpQlWvEe4HXSfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQfJPbi5xU2AYpeuqpg/pCKwH5FeYh5R0ZpuBFr8Eh1cWM6miMk3ZhFIXUOr0KkAQAJTP9x8U6fPGcQsqSo3IU12OkeTnpNgrGypBDw3pa7dRTDCDyf7ocZpak30OmOzQ6hur/gO5r7wRioLYkV57iTFSzPc/JTzxdfj6Z8O5WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JueFnRDL; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JueFnRDL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so45880765e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771358761; cv=none;
        d=google.com; s=arc-20240605;
        b=estNSs9DUrzQbjadMaHUCZEZeKSyIvkjU70f2S01hrywazuqLpqynfRnY4R5r7UNSM
         VYLrV+O/7g4b5e2QK30DDENSzA/SjVYZDLW81lMTmcax3kzcpD/AifJfehsQ04G/fPgI
         ci1c/GumS6hgOPOR/8ipX8hF1Id2LM7dTgnSj0vKWPWLjCpigKL9xXw+Bwx2LOTFwF3h
         HPfBUf4st9YB+I7dy77kZd2/2Jl1jKJyAND02twUfOsHr1Fpc0Q9DH9R6UzDZVD+QtDq
         diljetWjWei/tCQym7rgCyUdk+F7vg8IAdSwr//1oIQ1GbiXRyiFVaXfupLiuAMhRlGG
         5Naw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T+fSQAiWwoKsBkf2pV1VjK0/Igt7D1QD3gcI6T4bBSA=;
        fh=GnBkTCA+bbRB8P7bf5UC2SZAW+THc1f58W6NilQKtCQ=;
        b=P7ipWiRK7TnBtGM2Cd3Xu+53bsxySmftixzTFWhkt13rtWTbpRHvWvFNET+gKNf/wc
         JuERFp/exIwwrJMZTG8lGDLcgPK3BO4KmPayulZpBJoBh9elHmLxYwXjr9yZ/iZGGhkH
         cGygj8SkqSTCmF65TH6zXeexr8BNPb3/t6KAWPEclFlHDW7uoPhd/eRAo6iLPH/UjVxy
         VggzN+h4fpmUxns6hjWfHyox/qGcVyWIj/TDKVPMI9AKfPZ4cgAG0QhhwIGZ8W7KKN2D
         XVyryKWaPEhTyvz/p5HJ+erWq6JOmiIapNfO5HJ+jM/lmB21UkHtYEHzgLp4RT42SI/x
         9Y7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771358761; x=1771963561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+fSQAiWwoKsBkf2pV1VjK0/Igt7D1QD3gcI6T4bBSA=;
        b=JueFnRDLCq3eOIvExg+Sd0+l5j0h5p0HgBEXJuFR0nj2XacvqP1Cjtn4tFDgjd6BMp
         OVxY9PTJaqEOI6sVRs9zYPSw7eJh0rASgRfBFgs8/0bCPrPdOWzsA5ie66ojNRzSyytu
         0GmUVO8SuZaB/6sMQpHBNlqIQn9MxrfP8hUUqE9pc4xZurW2xAUf5JvDbRlcXtj8ATYf
         hksq4G8PeJY9fH/vQC+62ZoIiBKf/LI0JSnhz89ZRVm+lc9DX3j6QNlGmKkwnyH2amS8
         HdTk/ByQQKgHTHdHDnQyH61vlnX6RksviYr8yyD/FNPOO5/Jio5k2hKNnsvLf4ZAlEq1
         aRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771358761; x=1771963561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+fSQAiWwoKsBkf2pV1VjK0/Igt7D1QD3gcI6T4bBSA=;
        b=YpHdVM298QP2cmN72coIgDbSaGlkebmZo4ZjKf23s9WH7CdOvXq6ZZKCop0z+hH7lO
         JpiXoy1JWU34QzwlpBslQxOphIqZEcOCgpmOHIQvCG72XUWK9mNgtejHUGHGVAjyj7eg
         1pHC1oPSZkEDPiLsrJOSz20LEpYp6W/9EUvOlsLfwt3GIAo/GMe8JG/6qeIfNGmrKg99
         2qymvO+QOAPeFL9d7PqGp6grdMwP4b2wPnIJYyhXu3H83RKlIEYSuMewI7LQ+SFKC5/v
         0wio0cnJcc7X/Q/pCM7Xmjf2SgXTgPsNJfiUzKj/42KvEif9jzF7WXGlmbx5jXWWri3O
         l4xg==
X-Forwarded-Encrypted: i=1; AJvYcCWU2ryO5lgFjkLkl1ZMIqeHS8hKgFUbs1rj85TZqMlIih2pnJRnDm/b8EZrIFo2Yi9vl9C+FxcVeQx8AguDcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpI1F1lH9wbh1nVeflUfLJnWTrRoWjFXNah+UdgQKUh9+KYsoB
	vxHeXqHpJ7OSrXcPJQQIKYmW0EoYVwz0dZbPvPD4vKynQcIdwBMPL9+6eSyPU7yFw9GoLiYgy8P
	skMSkOYwABon1u5HAz4B3o9uX4qw8cfRAhsbo8XOv
X-Gm-Gg: AZuq6aK1BPbmYcd2sBo3/9h+6PPCymX4Q8tJGKoi4wqXZG8tdQOFBrP3N6RxZYSA8NQ
	+oGbEbp7jgXDWscNqdoGHSrRTKaGzJbRgpK9iLQ2c8zOkmVf5B/nXg2Bril4Ftkbwi1BcAvVJ3+
	D819Q1JnZTeHR7FM+P197xo1pv9GiENE+mT0zdnpxdIWo2Dz3qB6qOWpRSMdY/+/HTPDBF9W816
	+0lvKuUP2dlSI+rrmGqXdEs4m1Mys3D1BY8gD4+ipCED5bs02MxwanNuq1+mZa8vqeDmqtMdlQx
	zYe50dKRQ+izhyzp6gfuPixz8Z/q2VbMbFYbNw==
X-Received: by 2002:a05:600c:1d0a:b0:483:3380:ca12 with SMTP id
 5b1f17b1804b1-48373a74357mr227106915e9.29.1771358760418; Tue, 17 Feb 2026
 12:06:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-binder-alignment-more-checks-v1-1-7e1cea77411d@google.com>
 <CAG48ez2j5xA-+XwVejp-8gUv2uPEJNOO5t3MoYBgbigE2oV66A@mail.gmail.com>
In-Reply-To: <CAG48ez2j5xA-+XwVejp-8gUv2uPEJNOO5t3MoYBgbigE2oV66A@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Feb 2026 21:05:48 +0100
X-Gm-Features: AaiRm51LnptDI8uYMgxt3iMO_zRosmyLsJWFHS1h5b3iwf0sDDYLYCM6k7AIJcQ
Message-ID: <CAH5fLghO5pAmOitPXFA+udWZYTNk2n9zn4RjX5SyydvjzsFEWg@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: add additional alignment checks
To: Jann Horn <jannh@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 6:48=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Fri, Jan 23, 2026 at 5:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > This adds some alignment checks to match C Binder more closely. This
> > causes the driver to reject more transactions. I don't think any of the
> > transactions in question are harmful, but it's still a bug because it's
> > the wrong uapi to accept them.
>
> FYI, this actually fixed something somewhat harmful: Before this
> patch, `unused_buffer_space` was sized such that BINDER_TYPE_PTR
> objects could grow into the area reserved for the secctx; so you
> could, for example, clobber the secctx string with a BINDER_TYPE_FDA
> file descriptor fixup, resulting in an incoming transaction where a
> file descriptor number appears in the middle of the secctx string:
>
> 00000060  75 6e 63 6f 6e 66 69 6e 65 64 5f 75 3a 75 6e 63  |unconfined_u:=
unc|
> 00000070  05 00 00 00 6e 65 64 5f 72 3a 75 6e 63 6f 6e 66  |....ned_r:unc=
onf|
> 00000080  69 6e 65 64 5f 74 3a 73 30 2d 73 30 3a 63 30 2e  |ined_t:s0-s0:=
c0.|
> 00000090  63 31 30 32 33 00 00 00 00 00 00 00 00 00 00 00  |c1023........=
...|

Ah yeah. I suppose it's good that BINDER_TYPE_FDA isn't used on modern Andr=
oid.

Alice
