Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0860053368
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Feb 2025 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739083469; cv=none; b=BDU4Le+/s9I6fcB1JL3PEw4FvOXFMt0pj2zt8QWtPm2a4XImsXqiv3pwOa+WY+vgzjniHDqft7mNxVeubEmMfLBgu4JrLQwIDkjdDBMN9j9OLxZnmAB/DGjsyIKCiDhRIAp4OrfEh3YjYzIfcRHZ+0ZtuxGNEl6QlvnDHBuABTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739083469; c=relaxed/simple;
	bh=k5z8UYLykpDZztIbyOAipUwnXwi+GKpDaKyRXhJIv8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFUESTAwuaQ+/GAjxUV3PktaNYBbXEbTf+0rcqfAItNwB4Xb9hX8jWpFBWuPg0PCVUKL/c0gdJaprBf3/5NVCX7rpMBHz82xq1tsY3MABfyWRekv+gRKQ8xZucIu4goqkbIvv7fFqdp8+X/CqKIMXH8fxlGBXyKNdPqthoKOjRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PWYxLBY4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PWYxLBY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739083466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5z8UYLykpDZztIbyOAipUwnXwi+GKpDaKyRXhJIv8c=;
	b=PWYxLBY4mk198/i2bsc0B1DBx+NrDTQqIbwrFpqq+Qu14OVbbQvcY1uZBS/xvqAHD3fPZL
	WNM4QRO/XKQ8hAuP1vwIsu8sntEZJaUOvCJK/fcRS/3R8cmPDwR6dbXGHgX8zlVVj3TmTO
	NfoN1EHJ2ZTxHsD/NNazMPWnn1x3MMw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-brqGcWU3Ps6kp9bBvqavhA-1; Sun, 09 Feb 2025 01:44:24 -0500
X-MC-Unique: brqGcWU3Ps6kp9bBvqavhA-1
X-Mimecast-MFC-AGG-ID: brqGcWU3Ps6kp9bBvqavhA
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f73260b22so13622965ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Feb 2025 22:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739083463; x=1739688263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5z8UYLykpDZztIbyOAipUwnXwi+GKpDaKyRXhJIv8c=;
        b=aNmZ9nQidkUxoOghCQukhE37cDzSoAjFWKYqqLAR1fqh0XdbifyH3ExjJPBxkXG3T9
         aaCCNSuESF8V0L60Zqn4cg09BSCOrelf2O8MexBtjuh+yLsWMkoF0cMIcV5WiCt7YPnk
         XvlWz+uvjUX5lWcRhc4KBDTWZuO8rVFLJ7oss1eMFyQRpVKzP2HlGah9HIh1g+SDNQ1F
         LbhbRyb1MB8cE6kZxlnA/dA9gZhXAfhPPdPJcW1nTgh9x+uBQsulJMFShcIytZXqmHaB
         ZLz+Fjsu8LOkMZlje8Dwuam3mi1zY9tHk1Fzp9Y+7UJJSCjoClnDSpUZ5vt/TDVK6aqe
         g1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVJSQ64g+GgktrTRO18atFetJQCgMvWIEQsAaEUkpHcg1VSWIZJTwhxIJoIjScSpKSe/pYjP88lpEGAmhrvYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKA4MFmxbOB5CZsLQpivTfU55Rc+7FBPilnPrLx0tauOW9/OOE
	O0PlSWevWOAF52W+uu3kzLrxhOh4qVw3N0tprxlor30iQav+3kAy1VeimU7dRzl99COjOFrmDW1
	TohbDGPsBHd0gCH5QjqP29G9l4EkVhMsAt5oKkMXt42kcdnNR4FXQ7teNRH3SGvrbdByZhYm9sW
	ODWVQYKRk9Z7+BoxKV2R/Y3eeBIrJ+Hq5KRS/Jps0=
X-Gm-Gg: ASbGncuODYInANFsEgu8G1EEk/S+752m01P9b+jv23EAQoj8B+SHopebG21s1Qqiawq
	M0F8RMpIZI1XAUEufjxfhlFQGATInkCy1WeuA70iS+ynq4u9/135L8GN59SDQ
X-Received: by 2002:a17:903:13c6:b0:21a:8300:b9ce with SMTP id d9443c01a7336-21f4e7772e2mr169599895ad.49.1739083463100;
        Sat, 08 Feb 2025 22:44:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO6/xttu4T8jZGaWc2hd6Zzb3mRsY1UKxFcJ0RUiPT3DBzdzt7cBP21ECwMvO1eY4S6krwSRPMmgqxuGo22uE=
X-Received: by 2002:a17:903:13c6:b0:21a:8300:b9ce with SMTP id
 d9443c01a7336-21f4e7772e2mr169599735ad.49.1739083462831; Sat, 08 Feb 2025
 22:44:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com> <20250108135951.GA18074@lst.de>
 <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com> <1894f095-e93a-4def-a223-d5c089ecc2df@vt.edu>
In-Reply-To: <1894f095-e93a-4def-a223-d5c089ecc2df@vt.edu>
From: David Airlie <airlied@redhat.com>
Date: Sun, 9 Feb 2025 16:44:10 +1000
X-Gm-Features: AWEUYZmapeVmf6BlNwM1udDZl6mMgq_iwcj8x5DFYjHWYQsJjAcjx42A4duswn0
Message-ID: <CAMwc25p1kGHjy7z19Kg+vv7yVc0bF2taA08hBKhk72e4HiK5xA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Carlos Bilbao <bilbao@vt.edu>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xnuy7rdUGjcRNVIvKck2T3-Ryeeox5mImKxLuWbT2rU_1739083463
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 9:55=E2=80=AFAM Carlos Bilbao <bilbao@vt.edu> wrote:
>
> Hello,
>
> On 1/8/25 09:16, Miguel Ojeda wrote:
> > On Wed, Jan 8, 2025 at 3:00=E2=80=AFPM Christoph Hellwig <hch@lst.de> w=
rote:
> >>
> >> No rust code in kernel/dma, please.
> >
> > What do you suggest?
>
> This is it. What do people suggest? This thread has received a lot of
> attention -- maybe it's an opportunity for the community to brainstorm.
> Here's an idea:
>
> Some maintainers clearly hate wrappers/bindings to Rust, while others don=
't
> mind as long as the R4L folks commit to the maintenance duties. Depending=
 on
> the subsystem, it will be a completely different conversation. It seems t=
o
> me that right now, every time the R4L folks interact with a new subsystem=
,
> they need to understand the maintainer's stance. That looks like an
> exhausting process.
>

That is the process we are committed to, everyone has a voice and gets
to be heard, and we move forward in the appropriate manner with each
maintainer. Bypassing maintainers is the last resort, not engaging at
all with maintainers isn't a productive way forward either. Your below
attempt is trying to create a technical solution to a social problem.

> Would it make sense to have a C middleman that Rust calls instead of
> binding directly to the C funcs? This dispatcher would provide a simpler,
> stable API with fixed function signatures, even if the C functions change=
.
> If a C func is removed/changed, only the C dispatcher would need to be
> adapted, but until that happens, a new error could be returned to the Rus=
t
> side (not ideal, but Rust doesn't just break).
>
> This would obviously impose some limitations on the Rust side, but it mig=
ht
> be less conflictive than direct bindings. Also, in Abdiel's case here (fo=
r
> example), he'd explicitly take on the maintenance of the Rust abstraction
> and its DMA dispatchers, leaving no ambiguity about ownership.
>

This just adds overheads for everyone to little advantage for the
cases where maintainers are fine with all the other approaches.

Also the bindings code in rust is usually pretty trivial to change,
it's not like you can really abstract things that far, changing APIs
is hard no matter what, understanding the nuances in every C driver
can takes months of work adding rust bindings to your changes is
rarely going to be the limiting factor. We have learned over the years
to not make API changes that are subtle or hidden, and can leave out
of tree or in development users broken in subtle ways and as long as
we keep making API changes like that, updating the rust code is the
least of anyone's worries. This isn't like having to learn Mandarin vs
English, it's code written with a different syntax, it's not even
perl.

Dave.

