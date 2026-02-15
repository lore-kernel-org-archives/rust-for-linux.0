Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D933EBF0D
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771116456; cv=pass; b=C6VrlD043SKN7xoHHer7Nu3IwJkUfqvXzwwcF+6iO1SKp5hbplfXVnYGd6wlcCooceFCpytrQ09oE3rrARtngtnJkzZEss7Ge60HwgifwG2lJ890DDi5oehwHs5DTLDWyEZ+7F/RzpNXSy1h3b+ceJ8UHIQNu/G0uIzpeUD3jYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771116456; c=relaxed/simple;
	bh=faed1gy4KCGnhVC/xu+R9uCA1zCv0zAkRnLti+R2d1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY5L2MQXARYoNW9KW3CUTSJzEEODpVhPDMw/wckSd9VRwkk3veMEySyJY7TnFf1ibSFykMVoYxPR3LguzcSnfm50lh/dyii+0fKFN+fmIg060BxLfRl/fV8P7HoR2lmBlkTj2JW657tv+HsQyQoBFfggnY8YsvbF+d6ghaztvcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPyIyAsb; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPyIyAsb"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2baa1ed79b0so87049eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 16:47:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771116454; cv=none;
        d=google.com; s=arc-20240605;
        b=fweLHMgJ2c2IVNHh83RlxSvrlOJuLpKgLOsZrE6S98OTiHu7/2rrl7qSTmLDNTPkmy
         4aaJhjiaUMJjrYJRIiKgNMic7lkWBbzL+GNbI6xDMJO1hNqsO4ZoeTiRTgJvF16zGryE
         ijp/0kEv+rCjML31eWaccYMPzK5S9CpO1mU62qh0qwbjji+91ucGxtyanjTFfILg7m/I
         djx4YesaKI2/3Wv3TSFZkSxAH9Wv+lNfM0xfwjFslU0cO8dsSsA8GE0u7EmESe2RC5Cc
         BMT9Zcd9E8cARxfHKVQ8mkBDbBvlSJ357KNC9vvVKhwXi5xuDl1rG+EwnLqD1IjeimKT
         AYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=faed1gy4KCGnhVC/xu+R9uCA1zCv0zAkRnLti+R2d1s=;
        fh=4AMQzFsopKJJdow7cH/TO+yoZe+31ItE3+hJrYGykP0=;
        b=hDf1dauoa2s2W7X1dh2g3uQA7Z/FLAsr0vQY9Lclp1l0RmGhmnMJYn1id+qJvxTwei
         x8wPMdew7c/e3u4pRmpRP4Ko0Pa38lQlBTyI8wfEX7NzquWB9Puw6h9y5rYRVgNhWnYS
         40tczzZBsiHREeWz9f3Cjcs0VVSp1RgeLM+wdmcT7dDZbFx0RpIfOhN8//l3soKIJ0Qg
         +0zr9JAECcCDZvatC7XKnNuDZCOyU8LMCoWmBad2VRJhVRr3hwolbqg93gbs+3ad9Yun
         oFSeVQkbDIlZtUzJ3++yKRbg+4IJ6EH6n7czLXBvfPtcdL9bQoUDIiWBdeErP0u67OpI
         WMJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771116454; x=1771721254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faed1gy4KCGnhVC/xu+R9uCA1zCv0zAkRnLti+R2d1s=;
        b=MPyIyAsbIKHX45akwZl+PCg+sQ0Q+FLk+aGC+5mT4sO+jxwNh7pdY+HnWZhf8Vvm5k
         ezI7uTQmqEFi3epQYdaf5BFzDcxzPr+dP5Y20wXDTqGAex4dxk8eH98HGbKhPlZ9JnYF
         hTxcNWSWk2fOZzQndoFbA9z3aANBZ52wmqIoPTw4sn6gwiJEPEZ/E3/xAfJ2sykflXLg
         kkcfVrmLKBPbXF35Mnhv+S0uUCRqwc+Y//X3k1BGsm4g8ShSIkYNwckn6hVCUGc10yNb
         I0d36L7/QlC8u5bywVrYPn1HIe/6Tdf3eGRKJmmJxJBb5uzlXBM5eGAXYylwB5sza4rS
         e82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771116454; x=1771721254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=faed1gy4KCGnhVC/xu+R9uCA1zCv0zAkRnLti+R2d1s=;
        b=W89+gFQfBe4RfJXpqPA/poJGFJzbS/NSrrep+tbSOQPEPui0EcDAHu433Uswkyiuy3
         8LtOOANBEVuOJ9vlpi9PFLDh73nxohC4VcFNZwhFTL7v4XQQs61Gq63Hj3B6Lv8tefdO
         fO17fNdMNlVlN3McpFNtZ4/SFuo9I4GPhlbQlZ8zsPwT8kE6bhpPPL6boPOFg/M0Ijcb
         AbMHDyHSKzJUvme0Rf/posv5WQynnuzcHwS0Iblxt8HzboTmujcXq+0W5ja0Mh0ptg3L
         SGjrn5G8LHC+febKhJJpT1BFjfqnKjkusPw/V2X5R/gyAo5l31NcrNaPxaWwcBRvrS60
         fQYw==
X-Forwarded-Encrypted: i=1; AJvYcCVUaUAnH6AQiZM4nkKfwVOuPRGqf4W3+LcEH2Gb1RzZF45SAwGQNqLAASzUbIgMRbuBPXglV03t+hMr9NeELA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykajT5ofBNDm2nUih8ZP0lPbjrNrwQb2r9jO9w3Otlkyx+CrSB
	AtSHE4kJ5xJx5ZLCpL3zkAgseZM7vssRqCYhdKZdqFOH3UBAKNMLKHpS7GadVzTC3fTAtkxFRBt
	j6CqrkOyeEuk+T99ha2zPft61918AgYE=
X-Gm-Gg: AZuq6aIEQTOwSKoyG23AH0IYKXFH/wNL/ueSAoB71PFAC6PSMO/iSTM40lrfj7jcISy
	RaeuvXVWD7eyAXcnFm5xkLdcurTfjTxgndMRBksqncFyZaVYuwodN6E+vJS2M9PXLzAbYypnRsD
	Swcfn3uO+k9BXL6pWNGDM5uABOCv+DJf6teKKZ/Zy4Q+8lVydQAiq4LoDaswsE024GeRVdfqQw8
	g6hFrFdXWYsD3qD81Ffj2UJhZQX7mExmzg2PzPQZd6Wtr8eLXpSrD6Mx8e82v9ZaBtfSj/cA0RP
	44zcaYi7eTHoZO79+2gEJsQT1rgMwuY/Z+qjLHjabRwUhL64dEt3zqoy848Bj9k+oiiN03B5ns0
	TSDmfoHRvSruf1QXHaTiHBEor
X-Received: by 2002:a05:7301:3d1a:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2bab9ee9da5mr1419258eec.0.1771116454340; Sat, 14 Feb 2026
 16:47:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214053344.1994776-1-gary@garyguo.net> <DGEM8AITP519.149B3IVELY7HA@kernel.org>
In-Reply-To: <DGEM8AITP519.149B3IVELY7HA@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 01:47:22 +0100
X-Gm-Features: AaiRm51Tl1WaEt4Ou0J07lGdZ65hBwrMDvP6KAPQYYXZP_2DldrbUF9nczo9V5Y
Message-ID: <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 11:34=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Miguel: If you don't mind I would like to take this one through the drive=
r-core
> tree as well, as it is not only the base for this fix, but also the base =
for the
> upcoming I/O infrastructure work.

Is there some code that is currently "actually" buggy, i.e. not just a
soundness bug, but actually triggering UB or similar?

It is a bit of an edge case, this one... Hmm... I don't want to delay
things, but if there is no caller exploiting the unsoundness now, then
I would prefer we at least have a reasonable review time for this.
After all, it is a new feature with a new module and docs and all.

(We treat the unsoundness bugs as bugs to be backported etc. as a
policy, but on the C side we don't really have/do that, and I suspect
this would be over the "threshold"...)

Cheers,
Miguel
