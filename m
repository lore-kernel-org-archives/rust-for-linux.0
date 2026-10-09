Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE751AEE2
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571726; cv=pass; b=HM3VYwPae9xIHVouBmY/vICvthgv9v36gCJX0+xSN5sxxSXwKXW/9j7vcj34juTMKrfUM1EgLfLpC+nouV1UvJfzS/eHZOkqVbP2uP1oPeSaw+t34QaQlLwTbGzf5ea8wSGFSN4euxVQ8CRhGubTK+ypGeqxgskpCirAjVCIjrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571726; c=relaxed/simple;
	bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHy6KR/PDUAlNM+Z8gnIhDw9+HU7zRCOS5NXanQMet+P77l+XKViD+Uyurs2SGADnWDJRpPAl6IPJCANjGwiyDt3C7ehYNTj/4C7Vb1i3WKpnlnZNlEUeWXK3ydjoOBx80ekBgUNVcX8koBSKtq7uL/SyWG8SqQUuzsn1ccwM34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYIyd12E; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYIyd12E"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-351767ef18cso4258278eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Oct 2026 11:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791571724; cv=none;
        d=google.com; s=arc-20260327;
        b=og1fj8QtTmIGbMiF+CWIzt9GNDYFkqS+bd/ZxouvG8/yQI7kVC0T0DAplzaoaof4AP
         Ey33IWji1V69YQre5uZlHet2p/NvaIdEpRpmmZV/u3vvLdW9F8fxceCsSuq5EQlaV4+J
         1RIX8S6YIWY41pseAnEnRxlu85R15ItM50S9es9+kxDIAuF/ljmFXdPOyuWzr9vNqDDQ
         9o6HWTIwI1uvWYEImp1L9R8eKQHTn+L//3yL9eS7nzrL9Jml/hfq84NzTEdceFN/pAWO
         BNda5dHY0cJt7k0M85mVZ6BV9BuMPqbqWKYE2vYqcyeOHDOJxRs/7xarE58tDreuZ8FP
         giDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
        fh=WYt0WqLN7Mbxf8RFIhIR8N0yvrvAI8ufaPvhrKUPuac=;
        b=pd7cyVF5MlmBNDfRxZBcicG1EaNGTKd2LBAAxQiipG7MxPBgI8QgBUfCjuJRRWNDjB
         TNoENdj7YE1mX1AimJRODfUSynMJ/JbT3R27AlybH3m/GUaWU+9KGE+SWDB/QDmWxz5w
         gBiRT6rP0bkP1Yvjs9C2bZ6h5VJSo7v+q4a1qWcYZb959Eov63Ov7Qp/r7ELUGOWV2Zn
         ga1MgtwjcvHl3KVHxn9ejW4s4Ysw2ZWGn7FUaBxI3+o6UCl/7+dGx48BF6dJ0e07OA6C
         J+wiM9OG8xCBOoR62oy/FyQ6D6gYGOrLTUqqj0ArrwELocOOpd/RljKh0eygM4thIs2Y
         vL8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571724; x=1792176524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
        b=VYIyd12EnUDdnT8Z1l/1WPnqE7Yb+8klPqGIIwI4kuh6EPw3QcIIJRFvazsgALnMkd
         yJvbatXkT3wu7SUFr7gYQRqB7fbeRl2tYDuTGVWCG+NyDA65AX4GVx0GTMLO1RCvjPzh
         Rw5l1kfI8QnOdHFVmlQEF1a0bsSltITJdOQ90G1Cv+sKhDaGPbj7H0a3UAqTqYTfdTYE
         nB5sMaXOU0BIkT+z4+hYzboyHnBRV4Vv4UgiJewaNqKcTNG1hTNuG2XxrkShNwYNsaDr
         hQBOP5k3ZkZj4S0WADuxQTGqcppmki6jcqdDy0E552ja1K4Ei87e8+Yhx0+g7o6kZmkh
         +R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571724; x=1792176524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
        b=k7xiWJwYRoAAMvRWOpd9exFmMRpOpRzBdakI95XqiFT9LMIqOSSzFqTdPusbzTLeGn
         LkuT3N2iaBb0zKrEuHU3MyEhChjnUL5alD6QvaCZKuGA/pU0FX2vFDRO+TNVK+C5bWoB
         cUDdEUrxnin2vQfwVZMNhQrHd0W87wvdzxP3yMdcjD0Z1ZUU7kn94P9EYIXn1nrtFvZR
         fmmhH7O5ZE6ufsZRHd7a8RA9zIyMJHwpJzfUP+DCllc7RgXHl5+Md6F9zdzB81m2fHNk
         zzWaP6APNPDM290WQ5f1T3oIJQA7ePpayfC+Kns05qja11ZHsRfSwk0d/9p7q8lfWlVJ
         Omag==
X-Forwarded-Encrypted: i=1; AKwUvBx4WxY1sX997/yuxSy+qyB3SlKP0Wxg0zjoruAxT9BFW/MZSL/PpiQ5tWNVEQg1wtviWxQWiAxINWy5CoILEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2iX/b1Qxwm3Tq25f1OFAFa6u5wMpeGpJXsjwEd88pTS8JU6Qu
	bIAKsEUWMKl4TGm58lPCGlVRvoyq/BwPEKtbeli/eSmYG8uEVWk1JJfn/fBeKhNpqpVhYqoNvl8
	RK7qKPsNx2g7TbY/zRhmSClCRzDYZzN0=
X-Gm-Gg: AYBFou0dbxaqag58wpH4c/qwIyR/TcSNkx8Ewuj5AbOjhSYwQdooLrFgEWHVZMDovAM
	jmWcvuL4T64btZC4kmgrBay9uGIZrVL0z72R1kFp7W04jDpiTrb9HlS3JTYySehd0Yy8nBxrDgU
	+fjb4lupb2XmPtSlbPwAZ9c4btwHHAs2j8YenuNkaiCSjMRtCf9DlfKbOKxvSWI+ajQodn+HTve
	O3RRE+cI9cXT41Xv95aYloC2PwJSIyp35XzAvUaC8OHGQqdJUfjVTNuQ9VlIlf6uh3PnRVQH3O9
	jer9N391xGCvqdePOu+b8m5kT2FsZIsASf8B3w4ZTv83MuWINwuCun6BckR/Kvk47Nv4/P/gXCX
	PlJyNE7YUtcuxH0Kpsvv6t8fHBkVWRkaAmdNaSJ8eHg==
X-Received: by 2002:a05:7301:77cb:b0:356:b370:a0ee with SMTP id
 5a478bee46e88-356b370a395mr1072744eec.20.1791571724058; Fri, 09 Oct 2026
 11:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-8-0d6cca376cff@nvidia.com>
 <aryYkkB9j14xnWo3@yury> <DLTA93JE6VF2.37UGB3SWU6ID6@nvidia.com>
 <ase7IBtZjQsPVWSN@yury> <DM0D75ZTTQXJ.2XADVI38UGH7C@nvidia.com>
In-Reply-To: <DM0D75ZTTQXJ.2XADVI38UGH7C@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Fri, 9 Oct 2026 20:48:30 +0200
X-Gm-Features: AclHuK8Xj8QHFk5-TbzyPwVsH20KRa9KXwlVq0lwopsd7qnglTdkhqow-XI0c1A
Message-ID: <CABwQupMVzUOsqP_fTZQdwUU+xEO1k2Q4=RQQuq2qd5HCYY0ZUg@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 4:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Fri Oct 9, 2026 at 12:47 AM JST, Yury Norov wrote:

> > If you still think that you need 0-length bitmaps in Rust, can you plea=
se
> > give the clear and thorough explanation why rust needs those 0-length
> > bitmaps. Are there any in-kernel examples? Any language concepts requir=
ing
> > it? If not, it's still a NAK.
>
> I don't know of an in-kernel example, but please look at the
> `bitmap_vec_new` test which has been here since the API was initially
> merged last year: the first thing it does is create a zero-sized bitmap.

Well, yeah: I wanted the behavior that the implementation rounds up
documented so it can be recognized as intentional.
Later, the `new_inline` method was added, which is a clearer way to
get the largest non-allocating BitmapVec.

I think the problem in this discussion is that we want to treat
capacity like length, which is maybe suggested by the BitmapVec name
and its len method.

With the minimum capacity behavior documented, it is as if we have a
specification right now that no IdPool instances can ever have less
capacity than BitmapVec::MAX_INLINE_LEN bits. This patch here proposes
to change that.

It is not clear though why client code would be happy about *less capacity*=
?

In other words, why should the client of the IdPool have the right to
control the *exact* initial capacity, even if it is below documented,
free-of-charge minimum capacity?

The IdPool, despite being backed by a BitmapVec, is not meant to be
used like a vector: it does not grow by itself but client code calls
grow and shrink explicitly, and client code has no control over how
much that growing and shrinking happens.

Like, you cannot grow to 65 and expect to get a capacity 65. So why
insist on exact small sizes?

> It is also easy to imagine a user starting with an empty pool and
> growing it on-demand. Having the ability to create a zero-sized pool is
> convenient to avoid special-casing user code, and in this case I'd say
> expected, just like you can create a zero-sized vector. Again a size of
> zero does not trigger anything that a larger capacity cannot trigger, so
> I don't see a reason to forbid it.

With an initial capacity of minimum MAX_INLINE_LEN capacity, it is not
about forbidding, it is that the added capacity already comes for
free.
You could say "not enabling" instead of "forbidding", but pretending
that the capacity is somehow not there does not seem to buy us
anything.

Do the other patches in this series need this, or can we just drop this pat=
ch?
If they do, maybe a demonstration of how significant the special-case
handling is that can be avoided with the exact small capacity could be
part of the commit message?

Cheers,
Burak
