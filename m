Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC830148C
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861588; cv=pass; b=hMI1jXKQGfPnx7hZHYx9O+odfjWEAR/1g/m6iEwDZF4JvqEVZoWnbjtsKY/WL66NLmONigUyCH+OKEqFt8XMt1xDU/p1NV9PrgVOZuE2Muu+Xzu+7uKlapiSaHgxuNymgTU69kWdrduUz+itzorAO//K396Q9jffI5vsYkF1dug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861588; c=relaxed/simple;
	bh=Hz/ckSGmVsuceVifcDvUws3eWboOnB0LG2zIhuPz7Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0gBQ3XPOkDoavUSzYf1vhizHaC6U+xZtJ+TcIl4HxD3QzOTZyM7Lr4096dVJhe0km4ghixcOJo7WAU12KSWZhrWEGhHZ4jjdYqUv7l+oBuPuPf4w1v7pSIugqo5o2h2/7oUX3S8TMeXP47YUFYNA/4S1SK6CeqwmZcRoyv90uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+g/qvaF; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+g/qvaF"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bd801b40dbso128637eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 07:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771861586; cv=none;
        d=google.com; s=arc-20240605;
        b=OH8y5RNFqlg8aSL87VaNTXv0YifTizqYMM5MCSDesCv0yj967Ij/nqUC8jrB8jX1C7
         T6X0Bn1dxNKp4mplGPBMlv3V03cjjHIxafzDOAzTbJPbLRs486jlSyYQ4dHMnIoJLV2j
         JELlkCmuP2qFy0bKPsp1dwQ6cYTOWQBEqhl1bcwZqqe3MAHNAn5K/isihS/pShjsh5C+
         NXyje2nqP5k2jbgvOA7zPzly6iYG8T8rdY5fW8brwu9s7w4/dRs5rgu7Tb4t/2yMMWfB
         Wu/jlf3C5L+SDG3m5rUk+y+WnUCxKyBHGwBLqdA6lYoLVy7bebogJo/ujNrRipw2THMx
         DCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hz/ckSGmVsuceVifcDvUws3eWboOnB0LG2zIhuPz7Po=;
        fh=9I6cT3zpug40B6Ta2sRoGGtfeOh4xv9m3JSCDBHxGYg=;
        b=Phm3bccEr5DYuE3PruOGX89DHGFN4CDYgRzbVjnhHzzTdKWi2HI5abwoAwRlALd4I3
         fH2AtyCURJg9G+Njbtcnh0BPtNkVp5XiepzfqYGbJDw+/QAAxZAxrRjEnrfKKoXH5S9L
         Bk+FkN4XnXxqMXM5mt4C5SCL229NW+qbMSgNpQmubB+jUSKV/dkCBqBNr9D3DbT0u55r
         XMHox77kCexAOSAHDBiqS9h+NJcc3kh1KIA42rKVtB+96QT89GUUE8fSXXw20mkEgp0/
         1xkY0KI2LT/aAFN6kdPRYGw0e+99fRxYN6IYFANOMyDEkRXt3On870amud+ZrckWxhsD
         Rkjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771861586; x=1772466386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hz/ckSGmVsuceVifcDvUws3eWboOnB0LG2zIhuPz7Po=;
        b=S+g/qvaFeH9u18G/FDASXvnwsmeHkn596IP5pxtQDc69i9zeWplct1flpblDX4csqy
         I4AUoLSoIvmSrFgxu24pUR+lmv/zJU7NA0LZOk5D0XPcF6h71L4LNuESi8QdIF4GbH2U
         W/AMsLcgIUvoxOdL0kfbQKU8fxu/AE+COQzBAY8fpXTbK5fXHfCH96/b6O9XEhv0mwoV
         Rx6+JipUFLwRlEaZB3IXViC4B1IQr5sfZgDYRR8+j7qJUCvNvvmq3wxEoEJ2eE1XYWRV
         O/cOg/olRWPmHHYjLkmjLpmFkOEm9dUsZVLACl1L7egNsT3zMj5KdpRQ9dQ9ggOzSuV5
         0igA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861586; x=1772466386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hz/ckSGmVsuceVifcDvUws3eWboOnB0LG2zIhuPz7Po=;
        b=FCEypLwqtgHLtwEEgWQBKCzDmkarwURSj5kcwR4svDRMfPObcOwENar8DenvfnXK+/
         wLFZCFblYmynj5sGHriddmh+Ja5O9CTD7PQeS698G91vK88rXFUuBZl7H+HI0VAaJAuA
         QiNFo9XGH3t5sNUXrEq+ZrUTiMiExRrExf02Ek4gmJRfNa1V7raeb8R+szsZpK82J2TT
         WPRagN3Oq8YlmytEW04Jc0pMI5yAVwB1U5EDuMozJKVqhlg0PezkGt2A42AcZcTdPnX5
         /Bys2eI6hgkFOr0GzToyF7gG5gi3xFujZzw+Irxh6WN+aflJ7BmaUfuEjv7Bs2lThtxh
         cZcA==
X-Forwarded-Encrypted: i=1; AJvYcCVwNJ1JQDkUXUy1kjdpOBwc1nvdj3pG63b0izED/iTM5N1NhTOyNe10mKaXWLwC0S55G7s4iMO8qtclxZbwAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZqAPmo89bhDPX4WTBeLbBGbNi9uro3/rkr/hHqoW0CdEbszu
	Hv9w4whdGt7jiDYPmjK0sJ1fpDXAZ5zj5bYo9KFItAcLql1tHDbdQbaw19Jl2pZZBm0Jpn0KCtD
	+JuQt8+1rtTSD7s4mr7Io8RF+zuGDL10=
X-Gm-Gg: ATEYQzx3xcqAULhB6GTS1Vz5XfsBrFGKhbECGd1eGt1QhMolvDmfGF3RbEMSqSiPgTv
	aNBYoGX6kMVN+X2bhSWYxs0M0OfUg+9H3rj00v+Iox5VvcciCVsdPgsJs+5WbJpinupFAZfUmo8
	an/TTs5bWdgAn/gGbwFGxgVcWGv/uIHjpmMWFTk3T4uxy+FNIqVJwN08fLA+SzA6a8bN42jkTg8
	Unsyw/yKvTTWK9chlb4/7Yhool3vKr+S3xXkKEGTaZC6wYXq9dmdFXG0uMF5+sixBRTjhEYbIyN
	XCsOt5TP8F9bkKaX6ejPiz+7KIeBZR7m2ztPZXZ+mnbKDsUDN3IobZ0PIiRzrVuub4U2r/kq2Us
	Yhk5H1rmYtdigdE9GYhiYbg9K
X-Received: by 2002:a05:693c:23c6:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2bd7bd7194dmr2073477eec.5.1771861586044; Mon, 23 Feb 2026
 07:46:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-hrtimer-examples-v6-19-rc1-v3-1-ddfc19a90741@kernel.org>
 <CANiq72mHuOU-KCsX5oOH=D_9caN9C-bdKSBL5aq3QciqXz=KNQ@mail.gmail.com>
 <87pl5v32z9.fsf@t14s.mail-host-address-is-not-set> <87ldgj32ds.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ldgj32ds.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 16:46:12 +0100
X-Gm-Features: AaiRm52QAgZmAq4J8jRG7fZJh-vUFoc-Q2cVHa6hfjf7ZmtdRaA-CIwubTnQLws
Message-ID: <CANiq72naMNGc8p3GJT6gBisOn7Kv0pU2-B6-O3GPKodcKjzKiw@mail.gmail.com>
Subject: Re: [PATCH v3] hrtimer: add usage examples to documentation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 4:29=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> So, after copying these use statements elsewhere to format them, I was
> rereading your message and I see that what you actually write is that
> maybe we should be using the vertical style for imports in examples.
>
> The examples would be nothing but a wall of use statements. Do we
> really want that? I know it is the style we picked for the kernel in
> general, but I don't think it should necessarily apply to the examples.

That is why I asked if we could perhaps merge two pairs of examples :)
i.e. to reduce the "duplicated" boilerplate from the imports, and
perhaps a couple of the items/types that are the same too.

Either that, or you may want to hide them (but I am considering that
we may want to just never hide them (or always doing so) and thus
avoid the discussions that keep coming up on that).

As for using a different style for examples, I can see we could save a
few lines per example, but we would have to remember a different
convention and we would increase the risk of conflicts there (though I
reckon there may be not many conflicts there unlike the module
imports).

Cheers,
Miguel
