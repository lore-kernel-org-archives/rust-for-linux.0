Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B2332628
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 20:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772224596; cv=pass; b=b5B5Z+jE9EBG9PgNN4sWRq5ui9e58y1fmWCpoxBWyL6vw1aIJl+C/KyE52tQv5M+WGJZzA57XifPI0MBgaHeex0jm/sIaMfo3RqFTYVhESHc2t/aAmBCabAhzoBkTvFx86yfikFIMMsbJiE5NOVi329vmsp2Ofw8tyiS3TN0jnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772224596; c=relaxed/simple;
	bh=GXPvU3yHGoGQr/QUWqXmSjT1rRuT8EpCRKuAZQSJr4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5k+BEEWAj63ZjJp0ReFJq8Mu0FoiUIQVBYYGc5ti5ERclm+8EOSusXt+FXJ5TEHijVPegxAs4p6s7ch3f4G3gWpb0rGQbLZfn1sK+zw1Nm84WWD8tQGyzcs8r8k8Wv20X7PVW89YOAmHEDgngTPXfVyU6v3ymFMEUVdMY99qDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KFjCaMb8; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KFjCaMb8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48375f10628so16412935e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 12:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772224594; cv=none;
        d=google.com; s=arc-20240605;
        b=Hbw1YRdBLNMTEUBn9uHQnL/N318a5VXESsJ1ubdlMDFRfrubrDVP8Ejk/mNsWg2FHE
         14924P6+RHSi7hDHN6JplVRx3mpAvz147T30ph9nqJX91FsWyxIiGDYm6gOxxx7Qquaq
         y+hPnukAqrn/SnTMZWkZZn4aptxueu57l/iqKWCzFql2wO9cLX1kzlZhfy7kRpuAVHzr
         +CQOnUE6v/rYZF0HlZ0/eiJjEBTL7ypWG9Pcoef5FqXPGKTlGTVOVTtekVNEXA5hk16x
         lXoC+AzVu3OW91hjL/5OUuDTaKg3dWi7Hx7M4PxHBQiLyGSshpj8D+STH7RJua+i3Oii
         wazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXPvU3yHGoGQr/QUWqXmSjT1rRuT8EpCRKuAZQSJr4w=;
        fh=T+1oygjXDmmTtQCQYEkiqfG8wA+j+jYGXJCaAIIaVAc=;
        b=geQZBhaHLguuWAXnnvbrihFk9dz/LUy0+mqyse3LcP3tmzygsesMVJEQNp8oEpEReI
         BfHLIYaVwwE4pi7LNi/8l2sl+cBfBMnulKJrMsbJpRMiv9CpaCY0UIFVG6H6nSGDCC2v
         fykxQDrYTGTGxwdBYAs//ZGJiA7FILrPtQRSUiBMcXJOFqzmpUwgT5HxVvAbn7lUdeoW
         ZihloBdJOEc5Iu8riAHMod5ZdjWHZivr/djnNMFG25SpFSzE+2RZ/uLYtdBknnaWKnJF
         79sVNoXP2w+EZZfh7bokEE0rGew7CFE4uOHIYOGsWzlf/04+ySdUz6glF3SLsFBzrj7D
         bywA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772224594; x=1772829394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXPvU3yHGoGQr/QUWqXmSjT1rRuT8EpCRKuAZQSJr4w=;
        b=KFjCaMb8I5AAEGgeQMgsZLULxczkwMf9T4dRaiyG1b5XL5D3+MrvBSXoaJKwJlma5N
         GNN0U1vgWUesJG2FU+l2Sa2AEYGBB4Oi+tYtJsgkMOvzC958i6oT4kv1ajk38xP/8paU
         fjLaL7fSi4l1SbTIfVNgWKzqBD/Ws1Wxctwchxjq+uIuGGXz+lI0kb4QIZ+cgZWcLQQR
         8ZVxFEKpfMa3rhKpIbxd1WhCnMmJOreD01RyKzPlhN4W02d+7fMP+vSqdKdnsMhyYXdB
         XNO7sV1OhRzJyIEXPhXGz1Sd+DOxQVH2XK69uqskT2wvrfVlOiVIwMZWBmdoHNrA50ck
         cF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772224594; x=1772829394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GXPvU3yHGoGQr/QUWqXmSjT1rRuT8EpCRKuAZQSJr4w=;
        b=HDIcarhbTi6q+jP3Muca7rNC0w69e0B45crgsG6xhX6j+lCeciKLmzZ9AWFX+zUgPH
         WhkwmuxKJRB5qX49LGOVb2E/3xRC8A9N/Ppgh8qo4BCTfXColDcNCFNNmuBYD0WEd/CL
         uwWMUZ0+yHlr+AJ+Lhcvkehcaya8esLpeTjHaXQP7AtayjJ3+Y4m2M7AaBPdsLFiqgcq
         mC5mNN08YNAWhhB6JvVfBGSndOog1L7eqP0ZZRN87ErwMErnwX9Wbla2O/CGA2bASPlc
         ledDfFgcb5Im5LqcSmTcOK4I6P10tKPOYqGp6aexzZ8EG7ZTaK6xKitc/G+huhWTK+Y+
         tnoA==
X-Forwarded-Encrypted: i=1; AJvYcCVx0UOP/ZS51LPjQeWcmc710Six1ymbST9WIK2754ADts6wcuHgzqr5O4oCQJhrHDrHAO9iquO8vLgME+XpZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwglgjkhCw9iWalSxnUqtDnGDmPvGyYolPdmhPxHTBT8fbuyuO9
	akMITZnWobG4lH5PptFNHf0+mT4L8k/M8iX/oNnv7r7Q9FTDIqirLOFH4Ml7UIsYypp5LFpPcc/
	+1mT764YcSnEphNZNCBzfOnRQV4Gikq2qnxnPLVER
X-Gm-Gg: ATEYQzxeqjmPDl9SqYLldHWnpVnaWeTIqVso5Nqra9w9P149+rumhgIoM1daT4QxubW
	LApvU2tMN9W3TNYK4MLnmJkOQNlpgA4x1oTyes7/jlo3b55V7wJC8M7YsQCE3igyEJcx/gVLUT8
	5ZvqB2ko9fB5AHZYwWEua5M4/aG33ZI6Wda5SYhguWp9snJemc9EO6A78W+Fk8qYnwrcafFs60O
	Z3OYJY3YU+GD98WxvrqwygQOYY/kDAdoNcp69jDJR1jl2OOhLAJWM7u7OMcsmloOrtgljSoxWNg
	AtoMYlbOB+4QhxUHe4ftBXU5yID/7WaRjAFt5j3I0j9KlLTb
X-Received: by 2002:a05:600c:4715:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-483c9bfaf59mr58287215e9.34.1772224593291; Fri, 27 Feb 2026
 12:36:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-1-87de133f7849@google.com> <aaHPs-nULPEt_wJB@slm.duckdns.org>
 <aaHp_pGBxA4pNiXJ@google.com> <aaHrxzWIFFUjzWhu@slm.duckdns.org>
 <aaHuXEO64ONKMW4O@google.com> <aaHvcvbmkl7oSFOR@slm.duckdns.org>
 <aaHwSxIaTqLWndkw@google.com> <aaH0e5YKnH7x1gCB@slm.duckdns.org>
In-Reply-To: <aaH0e5YKnH7x1gCB@slm.duckdns.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Feb 2026 21:36:22 +0100
X-Gm-Features: AaiRm506Ib-Fl2WN6TaIOR3S0tdq8UlbZS-JTeVYbkG7Q8VPGCiBJPP-KBkw-q0
Message-ID: <CAH5fLgh5M=HQ8XRNnpqMxHU5q-T5OYVGCLq46aqOP5dxOYDMuw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: workqueue: restrict delayed work to global wqs
To: Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 8:46=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Fri, Feb 27, 2026 at 07:28:11PM +0000, Alice Ryhl wrote:
> > > delayed_work is just pointing to the wq pointer. On destroy_workqueue=
(), we
> > > can shut it down and free all the supporting stuff while leaving zomb=
ie wq
> > > struct which noops execution and let the whole thing go away when ref=
s reach
> > > zero?
> >
> > But isn't that a problem for e.g. self-freeing work? If we don't run th=
e
> > work, then its memory is just leaked.
>
> Yeah, good point. Maybe we should just keep the whole thing up while
> removing it from sysfs. Would that work?

We can but there are two variants of that:

If destroy_workqueue() waits for delayed work, then it may take a long time=
.

If destroy_workqueue() does not wait for delayed work, then I'm
worried about bugs resulting from module unload and similar.

Alice
