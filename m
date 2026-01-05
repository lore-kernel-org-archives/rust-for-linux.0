Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F45316198
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610996; cv=none; b=LE5ON4i4yWIhC0B6hr8zLBW6tz1fI8rwg4W75vbLleL1ZFqoSa0GMzvv4C8FEG6gtqGnjptTMwInUOAuegfCWWmz+5DvAI7Jpv6HURzo+HGB01nVgMAhwfmkF/yqw1ZRbNUIOERLg+KZra4q+F8PFungaw+7PLsRTCFHg25u+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610996; c=relaxed/simple;
	bh=NDnOMeHhBbL3x2I5+qx+V549RbT3UV5Bcv/sqexDu/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO0XALEK4buzBl9Gp6sXjSm9JrmJExPSqFJqNWR+Yz2qXrvxllgE4VLJ9L3KMixL9C51e8/si0BVPKcAvlG9zluQVJi84EuGKvtn0hEbxwiEn7Egko1MeOsxq45LFr5vmnsX7wvaGyiRA/I9/xE2Q/o+SSZNpamiS030si1Otyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXP0QyCe; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXP0QyCe"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so2749678a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 03:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767610992; x=1768215792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3u8/iEVfK3z7Qw7cgsYF9jXJnut9PWGklt2avhVUd4=;
        b=YXP0QyCeob5KUHdavvtEAy7hYaCZsIi8Iz1kvyAN+wo5uERmpcZztaBXM16Y1gJvBa
         MrGs8B2k6P7IXTqC+AYtGeZw85qdCYQVy7RBZCv1oZJ4m/QXQO6qYKIPubVSOLnat9mS
         LpcPHn06G0xsglQOLCalqSE4SY3Fz1Fhxew4085/0T6pw+4LqQAG05D/UPKeOUIdmNiY
         XfWgpDIhwMPvAljcv4iV3BXcCHvZ/tzezaRI1NF8CFfbgQ2DlbTJdc23/hjWXeDdxaZL
         nVjdAn1kAzEUSc63hQw2vURs5eaXgYEyIjoYO5WOwYicEI2rtstMnhtK3ZhjuZncPClO
         vYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610992; x=1768215792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3u8/iEVfK3z7Qw7cgsYF9jXJnut9PWGklt2avhVUd4=;
        b=bcEwFWWrJS6JgFLMQGR+IM1yiuwzmnQSTuH8se9o6J3bMNqK8vpzSLrVo+dTdtepi1
         V3pf3JHBX5NQJXob9kvWuRvET72LqCjMHS+y2dzxdQsyemGsgGbQFCHKMJUBgaqGnJri
         CKPh4llw0L/Xu+Ult96wwt2KEPTJkpKCEbJ5J26yrJRKlY082vCrrNzlRrMJOIOkNDiR
         wlbhDpNinhTosDVf4C3k6XLJbs0VwB3P1LBfduSHEkty2qHjDlCXmMQ5Jdex6YBuiy0b
         RWEPzHUkY0L9i7KRdZ43UDMcnZcsL5s2Roa3+MyTt7bsisCb/qzr9g5d1ZynEIdaEUT4
         icJA==
X-Forwarded-Encrypted: i=1; AJvYcCVNGcBT4fGIxbBCfHnfviHwFnlosILWbkxnSXGZq47ZWjJo97TcUzEKHiULUDx/nt2wHzCjsP2K/56J8B5pMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7NI6HP0b28RxpWIyMkHdG0l8948Vx/Y10RGJ7O9iu8SwAXkqc
	WDB8magXgRGj5yKdGtFzTyqInAo1AIBU0+wbf7DUi98mD6JO7AaNHUdaBuoEpTl7XEcNSFqUsFY
	AQeR3LG8B7LGZMGqSfH8TdUGEH4Yt9tc=
X-Gm-Gg: AY/fxX4qVmt1t9ilcSLtpjMo1iDBWjl14xfeiwPtL54Oz+Ev4QO1+D9GNsZ9EP7NK3y
	gtnOQ421N7NBtdNtuBWV1WutxuNK7ypk/0bcmsD5ah0C4NHA6ao/9qXn0RZgjh+sRmPkJOhRTDx
	AdK2G1gK/SUBCdSqSXEvXvQvWiUakGQInS0t5wOJaLUL7mSg484umw7ru81QlA6qJfogXSiG/zs
	Sj4jmwua/m01AoZGu33HuRl4sybzcz1y15EM6i2YSWzzcXhj/7Ds/yQ7MC/uwNf5Tzkh3IsQoVG
	xdR4Buj4cIAVRg5LJ3mo2zqQFegwuKsrDcaO1jdSSFnQ2fcsgFpSrYFsHT6sJxWoHGSx7fOB+4l
	CO/pzwb/o9ijpEa1lwefJuhIyFNHnVgs6bmgcb0250g==
X-Google-Smtp-Source: AGHT+IGe8pFfrn3IeMZR8Czjlz0kQ0Md3MSzReBbBNFpm9wlBTerBp46E56UtUFWt+MTcm6sJ6fESvIGLtHdBD7Nrgw=
X-Received: by 2002:a05:6402:3583:b0:64b:5d42:52f4 with SMTP id
 4fb4d7f45d1cf-64fd4a43a94mr7334059a12.15.1767610992047; Mon, 05 Jan 2026
 03:03:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-4-gary@kernel.org>
 <CAJ-ks9mQXP1mAYOseoUo0jbKD0FrhKOSW7ifgOUKzfrTM4WYeA@mail.gmail.com> <20260105021756.5df32974.gary@garyguo.net>
In-Reply-To: <20260105021756.5df32974.gary@garyguo.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 5 Jan 2026 06:02:35 -0500
X-Gm-Features: AQt7F2pwAacGZQt2sMTrsUTSxmL1xK6T_AT_ipGbNWm8xOsX29M1ESxdkaUV7JU
Message-ID: <CAJ-ks9nTwOvJi=5b7SLZn6ZEd9pPRPQJosnAOScEw6LJ__Un6g@mail.gmail.com>
Subject: Re: [PATCH 03/11] rust: macros: convert `#[vtable]` macro to use `syn`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 9:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Sun, 4 Jan 2026 18:44:43 -0500
> Tamir Duberstein <tamird@gmail.com> wrote:
>
> > On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wrot=
e:
> > >
> > > From: Gary Guo <gary@garyguo.net>
> > >
> > > `#[vtable]` is converted to use syn. This is more robust than the
> > > previous heuristic-based searching of defined methods and functions.
> > >
> > > When doing so, the trait and impl are split into two code paths as th=
e
> > > types are distinct when parsed by `syn`.
> > >
> > > Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > Logic looks correct, but the duplication between handle_trait and
> > handle_impl is unfortunate. I golfed on this a bit, see if you like
> > it: https://github.com/tamird/linux/commit/8354c5a48769f5e1e52963d19ca5=
7c31e5926b08.
>
> I very much prefer the code to be separate. The trait and impl *should*
> be different. It's just that they *look* similar.
>
> Defining
>
>         const HAS_FOO: bool =3D false;
>
> in trait is defining a new contract while providing *default* value,
> while
>
>         const HAS_FOO: bool =3D true;
>
> is implementing such contract with a specific value. They look the
> same but I think the way `syn` treats them differently is justified.

Yes, the similarity is perhaps superficial, but the duplication in the
current patch goes a good bit further because all the surrounding
ceremony is also duplicated.

>
> I think the fact that existing code has a boolean and do different
> things based on it is a good enough supporting reason to handle
> different code path.
>
> For some new `vtable` features that I am working on would require quite
> different impl between the two.

It seems unusual to justify current changes with future changes.

>
> Best,
> Gary
