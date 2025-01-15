Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521EC28EC81
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929676; cv=none; b=aTTQKjo6D7Ll4SK1q3AilECKpLfPbh13aLkeVdNVCxfoMVW/3C8djlRX7v04KNZ1RH3e8sT+Ix6zXWUrCpBfUYjmHH9H/r5h1BK37AO2+iH9u6m3tOLemHmEgfh99EqKg7VdwrFPx9GchF7yCmxbNVXLTRI7xkF/bDwWLxKicsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929676; c=relaxed/simple;
	bh=BmZy0rPHCigL/upwI9iBTrhLB8OPQ5SAka62/sAHh+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHQZeDZ0oqUhC4zzeOUrQyccFoS91Dm8zYAWiw/D2OJjOMqsMZk4RtLKoyBfyBj9zNXEw2FyGXmoI0ySDkuzz0xSE6wTz4bfbEBCHfD2VZMKh/lwcSJgEMadTWY/oGUx3rpj3G0DZ6m7iYwVTGDNeQUm5CM0ekB6BXh+zt3lh1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BKhSkmFh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BKhSkmFh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43622267b2eso66233895e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 00:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736929672; x=1737534472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmZy0rPHCigL/upwI9iBTrhLB8OPQ5SAka62/sAHh+M=;
        b=BKhSkmFhj4CK1IU+9a1eOFGnJ7NMiXY3CY2Cpiagv9L3+kM1iqCvb4ACtYn/S0bixA
         d+SDE2WWwwZr8RiOrba8Gb7+LwDtJ6kbMX1fV70k8Fl7hZqG7vDrLnu3IPVUtGqZNDUl
         zkDcZPG2CB/ZrtyfpmMFn34zoXhsK6iXghc9TnefCBNS9W0vuB0glDxh7xJm1zm5mPiu
         L8fEatOnr3MOeNIRNJHosS2nLyV1QkkJuyfIFM9igDDseCduDpqYynEvbDIBcuIByYoz
         fLWHkAc7iNZiEpyAHnqB1kH/q1pWjpMJsi1nhnQAe8Ea3xDgTAau4BsSWCqjGbTYUD+z
         wZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929672; x=1737534472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmZy0rPHCigL/upwI9iBTrhLB8OPQ5SAka62/sAHh+M=;
        b=S1J1TOkOA9K5bmSFjeZ3KTJ6kGgtS8m2Lxsp+Xe8mrGA7yhrBAJXKXSXQoPhKocO0W
         ANioLdjjVOkoYV1C6uevd/yb2J2VvJrkHtMhfCllTZYKu4OvGu3uTpdWCsW4wVY3ZE0D
         MaG+XwtAmY0f4MNAhfnax7UGCbzBQWdHuBPs+mvTpQ54e5z5zI/J/uPCfDf2yOSPvaKl
         SK5tZKYhq7awQKhOZU99Wro6qdiEZea5WBdXCqspuTkywUY3lvwYnQ2gYWoFNmXZa/Mb
         oK0YzX/c7ji0mRaKQ8gir95g+6cZcH2hnJUpDRzTgfeeuX/8Os8A9GofQxvQ+Cu7eez+
         jv4g==
X-Forwarded-Encrypted: i=1; AJvYcCXexU4qsbDBbdRwbmuNYM+N4EYwdCW+5BGpf7lT5hEQA9XoRuOr3ZStcB3tDPVdtlUPaQOFeCPnNjE1NyblDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXf6+1qzq1W3ezpk6uYa8yPzJo4F7p8mf3JUPQzA+O2Q2zgciY
	/nDteF8O6ItNGN08SfHaeZ3Chgsm1hpFt9xbr60wv1Z4W+4GR6t1yvNkqVkae2Ijncwy2RsIWwZ
	CpMesybnDaPRVaq7UJVNaRnn5SkkEkRxgqiUm
X-Gm-Gg: ASbGncvh0hC96R9rOYPq0sx5rPDakBD5C4uQrIhmGrTfXwzGiqHoh41eCzy2L6Z4nVZ
	3iUQorkqIMmrMMcSu7XbbpeXEXN76v5rgj5qo+Dg=
X-Google-Smtp-Source: AGHT+IEtQDDGu5A1hmH/iRkAeM0usamKyM1KBDNq3/8W2gHvMHYKWeXUr57ak41Cx7HNDHsua7BeZOeD54QUbZiv9s0=
X-Received: by 2002:a05:600c:348c:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-436ed3316a4mr214329925e9.12.1736929672497; Wed, 15 Jan 2025
 00:27:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com> <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com> <Z4cFO5NIW-E07Vl5@boqun-archlinux>
In-Reply-To: <Z4cFO5NIW-E07Vl5@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Jan 2025 09:27:39 +0100
X-Gm-Features: AbW1kvZOMLVsqCzuSk7asXVasP9aOJamePC-DUUpzf4uHWIY6TbyumJ3JDL1WRA
Message-ID: <CAH5fLgge1pp10a8w4xp1eDobMJUHpnM1Ezh+JHmVmfF=6_vpTQ@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add support for request_irq()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 1:47=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, Jan 14, 2025 at 03:57:57PM -0300, Daniel Almeida wrote:
> >
> > >
> > > It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> > > it runs the destructor of Opaque<T>, which does *not* run the
> > > destructor of T.
> > >
> > > Alice
> >
> > This is pretty unintuitive if you take into account trivial examples li=
ke
> >
> > ```
> > struct Foo(T)
> > ```
> >
> > Where dropping Foo drops T.
> >
> > Is there any reason why dropping Opaque<T> doesn=E2=80=99t behave simil=
arly?
> >
>
> Because `Opaque` implies the value may not be initialized, it's similar
> to `MaybeUninit`.
>
> Do you really need the `Opaque` here? C code won't touch `handler` if
> I'm not missing anything.

The irq callback is given access to handler, so it could touch it at any ti=
me.

Alice
