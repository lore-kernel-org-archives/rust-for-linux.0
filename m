Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F33227E95
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 18:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834003; cv=pass; b=aYuOKrTnSGVEj7tfiuB2JTom/cc6Gwe1zwWx6F6ljzeBH+nwLY1uMbI9QOxwLqen9234blHvEG/c4naE99HxvyK3irZEEwAk7SCWIe9FXn5ZIF3tXImRrAH8KgzPm9o7ABMKpmBZ+Zn66O7qkytsRJKUbmBKARlH7a6qvPQUvWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834003; c=relaxed/simple;
	bh=bzZ4wAeV0FvdXCl/8LkKph1nMxfmn5IZRKzWDN4noHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTcqxpgeFZ5YqTQyHKDr6ZfNQShKWg4CfOzq2OmHeQUgGUD3gYDHbwb8od7Mch3WxVlYik5Sum90wqEXbl3SeL6sPg9ZevZJM+PsZT6RDW+/2SHN8sZny2K5VfvLIhZeDIeFdQyVZBcqI8hwrSFsCR77Yqsp3G+MatidD5fvhyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFwgwUD1; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFwgwUD1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dd22b9895so1453266e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 10:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770834000; cv=none;
        d=google.com; s=arc-20240605;
        b=H1znQHeuGn00dKzdgNbm/jnuj+hs2thWBYG4riWABjXkW46JTKijhxu7LrykCZYThc
         eRGwJCSRkCcHTK/W+KG8XkZRipMZr1iiO7BuHIJw7DRZNuS331RgmIjim1irIOzJ8rmD
         rg9mYS3lPtPYgKFtuWjmWvO2gM1NrAxSCyRq65pgDt0mmr5MXtR8S/2cC4/0Jxg6FH1p
         Y+hCSemL8BBKNk57RXHwB51FX5qgJJf+8ucgQey1oRVmyYxTE2BAY/lCPsPGs4aQtltM
         gG7Ns+MsIiWnu1GJZIo1YvKTwd2K8dC972c3lnjCI3khEQvdsNIavFQrhjJ6IexuveiZ
         67Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wwv2MRWJWDelneWXAYXVt+d+rlSAiITbFJ+Xkl4/lko=;
        fh=SA4a7IeGM3pHt1FYN6IdmabZW3DgxyBYWf5HHnBZLDc=;
        b=cuTV8yow3HqD7SqDIwNmiCACcQDzIfEHcjpLPxP6Lbk6uvl0ukTk/Ac9v9zJlTnIry
         aWxYrWazr+MAh6SNA46SpxzxnsgWXlXM2dqKsEpAqmSpO4emJ1ptYcIVxyqv95LNzItE
         Z/NsRIkA/7MO90Qb5DqIpTe/MJTYwnF8mlRx/TXYjNuoobqwAzZfyEkGvEOrbbq8Tlmm
         ILTRew/hVBHpGkhCBeZ2qfyXpx8u5IL+jVN/gqAO07IBHuhcaAXvR1pXcnXLxEynrSbb
         nJE+k685XygytE8lF8aR+eFVhioPEFxQbORpEntUJ4tibKZr6A8CY6DWWHVJIMWwOFIE
         Xc4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770834000; x=1771438800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wwv2MRWJWDelneWXAYXVt+d+rlSAiITbFJ+Xkl4/lko=;
        b=hFwgwUD1qdq7hlRPZOt/mxElrEkfE62MaswdkpDLYJW1vQMZwL5+zRlzAC/RVIh8Af
         U2hK43xqbCSp/b1X/iXhXDaAFXslpacS8elb90o0Qn5LRqU5qzfbUx5mpTcaVj/RlGjI
         19nH7+4S3+kVe14R9/peIKgZjmXuJaMtDQox3kMfj74ZRqy+eNiPO/vMSjXI4fyHRDh/
         iCC+kW7NGb62Ler4ZGPGUflvPh5lrV9/CQcXmzPWaw1pxnB9gj/rjqHjvL+uqU0bDZGd
         HlhU+U3WH+ParQIjMMor988rwQeA5wXDPaR0UATpIF89VSOWreVK30EPaSsfoSNqjmeh
         8Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770834000; x=1771438800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wwv2MRWJWDelneWXAYXVt+d+rlSAiITbFJ+Xkl4/lko=;
        b=BeqbFFVVgAffgJfhOIwITLq0dQBbCBSJIhPg8SrH8siamNW0OU10/wX8kOkpVY9rHM
         KzVlH/DEDFOf8ruF3M8HhPBPgTwPopUsbvJsmT/8IhYq5/d805zDG/O8OygZqrIk/XtA
         78zF8kyUWEa0U2hpwYDe1EP1PYoGPSB7Itz/IOacRDrBXr0PxfMJib7yxNlKD7+mjwBz
         nMCVAN57fxy2ZA7mfVHzicN9kQoiWTTAJk5r+MFDnrFfLVRzfzXHc3O+wZfk4xE3sE+u
         Y4fGaTYJhuPuGTjtA8UtvpS5QB23SUO4RgdhqJu6VZkQQ3mXTnB585IhCoyxaMYnlz+t
         RLoA==
X-Forwarded-Encrypted: i=1; AJvYcCWdDcINz+J8egREurp2ieVGLjpZcaaPPWI3LICEb/FCtZ3aBMwx8jCRIXX6CHz63XXQyUMnOf984zofJ8jnXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39dUt6t8eZapWM5opKePcS0AOpE/4nWnNQ6iaWdMH6kO+HiRM
	hEiJhawcEuG+dRSf+/bsgAxuP4+rCr51iquScvfHGLgo82rTsqY7K2Hqp//b/AyThsc4UthnJ/U
	ziTx8uOds2Ntfx3v/+pzp8xmgrPuOR5o=
X-Gm-Gg: AZuq6aLf8V9gKa0xtciWgb77z3wQsf+0IJN9P/KGeiRrJzuutf9q3YsrBkfKgzWNX8x
	fxI8BOrgcWYz5Z/Kwb/9eJthsl0eRynI8LJ84BQSw/1NSTyqOkDwGlRwZRPWE51SVXocBwQ1Ko5
	//sGJpfz4j+5jbsNYNUnVlonltbocjzj2FgFAP9xWrJTAYoM2BgD+K59+T9Dz1QPh9GgwBeTjV/
	RfC258DdWlTKDwRNpc23vEs75TAEtj+fP4io931iqyukj85f7yaRTYhvInz+DBTU6sey7YYrr89
	yP9mlIb9L/2lEIB9lkmN5a4Xk+dLyBvZ/FNA+gY7uPFNV7hcVP+Kqq+NTk5FOOiwGjW0MowF+1D
	QUk7NqXiuFVzmBHs5DXDP8k3MrzcYZFA=
X-Received: by 2002:a05:6512:39d4:b0:59d:dffb:cd70 with SMTP id
 2adb3069b0e04-59e5570b02amr2705121e87.21.1770833999963; Wed, 11 Feb 2026
 10:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org> <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
 <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
 <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
 <CAH5fLghKwNEdVeRi3H3LQ9NTPYprpAeY41-jgfq8YEST9PaGdw@mail.gmail.com>
 <hq46fcdy6zvwcwlbtbjynqadiwy3wjs7raxioime2et5amzez6@wvzzlkiijwvf> <aYzDzeh1cTN2TEVz@tardis.local>
In-Reply-To: <aYzDzeh1cTN2TEVz@tardis.local>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 11 Feb 2026 13:19:23 -0500
X-Gm-Features: AZwV_Qgt8SodEZVfr_PtxY7GRLgT7F5bLlBbZTxAcShbVYjdlk2aQQu3bD7qBRI
Message-ID: <CAJ-ks9n0-Uy0n7CsZwPr37PSc_wo5qYG2YGVsGN50oPZN4MrSg@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
To: Boqun Feng <boqun@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 10:00=E2=80=AFAM Boqun Feng <boqun@kernel.org> wrot=
e:
>
> On Wed, Feb 11, 2026 at 09:32:36AM -0500, Liam R. Howlett wrote:
> > * Alice Ryhl <aliceryhl@google.com> [260210 16:34]:
> > > On Tue, Feb 10, 2026 at 10:23=E2=80=AFPM Tamir Duberstein <tamird@ker=
nel.org> wrote:
> > > >
> > > > On Tue, Feb 10, 2026 at 12:59=E2=80=AFPM Liam R. Howlett
> > > > <Liam.Howlett@oracle.com> wrote:
> > > > > Is this a temporary limitation?
> > > >
> > > > Maybe? I don't think RfL has good abstractions for RCU yet. For
> > > > example, exposing load directly on the xarray using xa_load would
> > > > require a way to guarantee that the returned pointer's target isn't
>
> Well, if we only return a pointer, we don't need to guarantee that,
> right? Because it's up to the user to provide that guarantee. So we
> could have XArray::load() (not Guard::load()) that just calls xa_load().
> Also see below.
>
> > > > being concurrently mutated (e.g. under the xarray lock). I'm not aw=
are
> > > > of anyone asking for this, though.
> > >
> > > It's relatively easy to add an rcu-backed load using the RCU
> > > abstractions we have today. I already shared an RFC containing such a
> > > method for the maple tree, and it would not be much different for
> > > xarray.
> > > https://lore.kernel.org/all/20260116-rcu-box-v1-0-38ebfbcd53f0@google=
.com/
>
> I need to point out a difference between xas_load() and Alice's usage
> (also what Tamir mentioned above) there, what Alice needs (at least from
> her patchset) is the existence of the object is protected by RCU, i.e.
> if there is someone else dropping the object, a RCU read lock would
> still guarantee the access to the object is valid.
>
> However, the internal RCU usage of both xarray and maple tree is to
> protect the *internal* data structure if I'm not missing anything, i.e.
> an writer may change the array or the tree while a reader is reading,
> the internal structure itself is still consistent and valid. But the
> nothing guarantees the object you read is still valid. For example, you
> can have an xa_erase() racing with an xa_load():
>
>         <writer>                        <reader>
>         ptr =3D xa_erase(xa, idx);
>                                         ptr =3D xa_load(xa, idx);
>         reclaim(ptr);
>                                         use(ptr); // <- object may be gon=
e
>
> the users of xarray needs to use other mechanism to guarantee the
> existence of the object.
>
> In Alice's case, she in fact used an RCU read side critical section with
> a larger scope to protect the object as well, which is definitely nice
> to have, but not only way of using maple/xarray.
>
> > >
> >
> > It would probably be worth having two loads then, one that does
> > rcu_read_lock()/unlock() and one for writer/advanced users like we have
> > on the C side of things.
> >
>
> Agreed. But we may need more ;-)
>
> Here IIUC that Andreas does is adding a `load()` for `Guard` of
> `XArray`, which is the load for a writer and most certainly you won't
> need to take an RCU read lock for that. The load of a reader can be
> added as I suggested above (similar as your "rcu_read_lock()/unlock()"
> suggestion above), but no object existence guarantee. We likely
> need a third API that can provide the object existence similar to what
> Alice had in maple tree.
>
> > Or at least name the load() function to indicate which is implemented
> > today?
> >
>
> It's a namespace thing ;-) , the function in this patch is
> kernel::xarray::Guard::load(), and as I suggest here
> kernel::xarray::XArray::load() should be the same as xa_load().

Just to clarify: `kernel::xarray::XArray::load()` does not currently
exist and no one has yet asked for it.

>
> Regards,
> Boqun
>
> > At least on the maple tree side, we have both interfaces and users for
> > both.  I just found the change to remove the rcu safety odd because I
> > assumed both are needed.
> >
> > Thanks,
> > Liam
>
