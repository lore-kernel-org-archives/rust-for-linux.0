Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067C35771A
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610873; cv=pass; b=qD30t8hK4Wk5uvWcVA/MVZ1i/DJ2MLIRCJZGws5v5PikLBsamH0PYNbVXiUaEOyq6vsIi1wHenC7MKL9aKZdRZBwhQptb6pB4naGWzHxiQFLXumRfugt8u94DnFaVe0rMdgTHVFFEq9aT0K6iHWHkbM4ESlt1VpnSsWbEee1ZDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610873; c=relaxed/simple;
	bh=r3ONFDc+5C0Q4KBKl/zXOgI0oUGHey0IRf15aTknRs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+E5ot3evR9yYn1DIW0YxuJ/gXf8f/PZhEXF5XmXC/H5yTQyD2FCNPK1vCVTIaHee6sWzRZJonkD1k2xB+UOoxyMDG3YXd00J4T3y7DkZJm2/EZcsyfrMYJz8wVXAVJgPp7FIcCZ01zCeuJNzj0+HK67z6o1cupeZBGQxaq03/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3R82ymP; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3R82ymP"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6a868ad45so833284eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769610871; cv=none;
        d=google.com; s=arc-20240605;
        b=QiJWpwS9MKE6zsYiIt99wHLtWmPdpiU5WYnDtXgi7qJOiBPLgZ3CVF48cmUo/pnBEP
         /HUnMYiqukt9iiJ4jGlx/MRyXEGTRnaArTUPjc9l89C5t53ljRUixgGQ6e58RQtRjfra
         HP1ytWvFhDEaQx2s8E8BPmPquDbT+mjsRc8iV5Kw8og/+MmBPj6GmALPT2dDmG8ixso5
         S6WdgnArXoAeehU+biDc104rdcL70hNpzKXKp9INR5rG+ew2aYNfqsDxz54z2OJEI9i3
         6Gow4luQVW4AwFMJrTZ2rqel0aJOaw3nrCcexPrddikkSW0AXQbaZZb0P+ekkCFSgHyV
         QYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3ONFDc+5C0Q4KBKl/zXOgI0oUGHey0IRf15aTknRs4=;
        fh=G5f+GgY40UJhh5DgdduPn0+VFPoabptsEfL4htjHI5U=;
        b=IFV5GsoxJ8tpLL4L7QcXivkY60dpZcy44mrXuNw5B7fwd98jznUwbOa+MmISakq22f
         kAzlpQK5itP8efIDO5GMxn+0uurlDUsMAxQeJEZK8WduhtgdF1In2BB+YdeBS5lZfl2Y
         /vKXvM2mpETTLH9TcJE3jpfeOt+saY7DBVnWE2aHZ8vuU+vB+rekoL5/RVdiEhw0XNZo
         0XCGjCgClZ32m4qoBpfCMI6OMXqj25UGz6GtenZF8VhoptDdTlKRvSEG7QYsvBMw9P5l
         JMSS9LjNuNafKUY3ZKEN7g3qqqt8S1RZ+SPhzbHzUIc35WmOX8QyeKFjKNe76/RXpsBQ
         RmlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769610871; x=1770215671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3ONFDc+5C0Q4KBKl/zXOgI0oUGHey0IRf15aTknRs4=;
        b=e3R82ymPThUG/b4sHmzTsHqxEFxL5pEgSPy6zRqVa+kz04Q9A7LGsg+TDVnk9EuPSS
         cQg6DfGxnZgIMQUsVy1Zvpv+tVYbN31/nHCBv+PcIrDYc7ih45Rs8e6JnHKPPK/sBjYd
         wCvIKQQZkscuWuj2WsQsB+9dYipXuxAzHhJr3GZHutUKqiF7MPumcTXdEo0cXY1VjBeY
         61AchBWQotXT0kaPaNbei8+OtQx2HiQUikzD3F2USQqpqZnmXWwmQY3/1dITMSVWTpkm
         I8G1iJ31VCAWImlrBolbJwX3XAR7DQNoyE5qFB4ZE0fJ2YXsa3ZWuljNd5yEewHrHJTH
         SEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769610871; x=1770215671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3ONFDc+5C0Q4KBKl/zXOgI0oUGHey0IRf15aTknRs4=;
        b=RmX/zyEQzha7A8eHFC7ZYk/qbxYrQ0vzuC5p3SfgXFRvfGXD9E/c4tVrejsnZKJ7Jq
         STuzdM7eABqw2j9HOHgXWiYYyORBpsty/47fZTJcVE42+fRqBgSQA1+KXbsgD6sBmLR7
         SxP0XrObBfwfQkbxmpUgq78NeT1f93fPEpwjT9YtizRyPckSrS53xUXE0bHx4Xpx988Z
         0b6C+gy1W9cUX0ZRwTmBcgvRzt5d1segtjn46be5+CeUB7p6DcwpxSA9+835swZpZokB
         HLze7wNGVr9LF8QoWFqmJ8MGZhMTXsdMIYKL82eqdRFykVIzsXVgv3LeLGI1S7eHXsgU
         Rxwg==
X-Forwarded-Encrypted: i=1; AJvYcCV2EtyE/15HLTTP05lzgt1wzadfua+pFs4pPhdRLHClCgWAtcTRW7o7X6pD+5vJdcsYqExtMUU2IOxEwhMl9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3wNn5nKcrZzWZgx0G0AwbpGZEf9K9XmLJaMfrx5BAHfz9Bjz
	KvVZsZ5dfxOndAMvPGw3DLrtP3rw28Bfo9AlFwVgtetJi2hL3BolHsyNtvm6YkbgI1ro9+98BfV
	J1+NpODLSakp8ausYuvpPXd4pdOJ/Tgc=
X-Gm-Gg: AZuq6aIsplMv9mIch2NQHL/ACOkpVjbffQYrsRXdrEMs9y90tKhqI8qOl/MFL/39V8G
	LcM5tO/CLhe5U6nOLGg5sMCd24UVlvSYP6k6pSvMFmEKbJpRM9SLeCRhj0ncTMo+/Cf/RWac5Td
	OUKNAtfZzeDQKS3DMpzW2Q12/2yfhY2FwTNZb9E4Tij1ticwQhYbLYPZgsG2+BrFUoEDok7XFEF
	yHUPaZdVCAsSAqO7Up5ishwXuhfRWKQ33yt7/KptfiA84ecs3m5hpUQb/BMyvjX7ECLqt3PhS6R
	EqjatDd2fXcpuyAEQTPj1i25+3phcTYVuuK8MNSbVOSbJCaRe7vx/D5ACFYPkEnaxhEnt6n5QNF
	ufNLIBusmHoiS
X-Received: by 2002:a05:7301:3c0a:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b7af7e21f2mr63890eec.6.1769610870996; Wed, 28 Jan 2026
 06:34:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org> <CANiq72=nMQb_zKOngmKWQQeESGAovC+pE2wiD7Njxxix-BQ3Fw@mail.gmail.com>
In-Reply-To: <CANiq72=nMQb_zKOngmKWQQeESGAovC+pE2wiD7Njxxix-BQ3Fw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 15:34:18 +0100
X-Gm-Features: AZwV_QihNd5jgm6t6vBSnrsCpxgTLVRALnmhbbMZBG7WMr73lacFNUcPbt2Ktyo
Message-ID: <CANiq72=d97xEfaDF7kFgOyXa+skbx84zZfSZBGyz9EF-J4n5EQ@mail.gmail.com>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment of values
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 3:26=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> It seems you want this short, in which case it should perhaps go in
> that case,

s/in that/in the prelude in that/

Cheers,
Miguel
