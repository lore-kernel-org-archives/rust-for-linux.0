Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C82356A23
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524363; cv=pass; b=m2MrhCRvd/AETRlITCDbBQ5bDp8qsYJVtQBF27VI6rC3V1YGrsMq4U/wxP46WZ/QPoD/ap6mFHUji3XMU/zK7WwFNM7u/iazTCjDdBHhi/+/UDDn6+3n9nrYmLZiiwUxhiTY/lto12m0dDBlzLxhMfq/iL1vywLQsEyZwoqsRaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524363; c=relaxed/simple;
	bh=Cc7+/YE7Rl/PzI4fH+4fThvAmUzVx7iijBq5+mSjYAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGaJ5/ulvhWUNfXgZhPCPFd++yIs9Ii3dCvTwNVGkZTVEJQR1ttZZ60R5VsCMQ9dPAI8oPjrG4+vQqYDnqB5yzNmivd4gTSjbcU+Qz5RW9/RTHSRmrIJKCnh2cOhv5MJ/JEus2mC/dWdzstnixFDSQgjyQeKQt+bNuVRCJcizVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8Q2DF0H; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8Q2DF0H"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b79658162dso23332eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 06:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524361; cv=none;
        d=google.com; s=arc-20240605;
        b=A/yF1cNe0UShrP53BHGZrU3hx+pNuZ+MoD+ufl9Uue6edAHigOfsCc28dEOLrfvf8w
         edrk814frGiTbmtVsxaPwbhmRe8WKcKEpbC3UCQvbvuxAWwOm5tddD0if2BWJja2rcGD
         /keksu93a6YfBWYKqerD2ftxovOTIc/snuI6OCGkUbD4/IAtxEsDQsy+yBrgJedKSk2d
         fhRXZnO6i1rgyYQe0Ripw+stBikRiL9C5nomJiAw0L0zM3opO5rdojkADh23mi8pYS71
         8Gm0fdz2nKJ0O8EvAxfMWbDDc+faLHbjtpU5FJWDAgn44fm9W77175NvwZkO+OM7z0ul
         OkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfomtdesgddwjPzUh4TNACOea41l38H8KrBdrI/Lq/8=;
        fh=O9S308tMkalHKwc4Lexgt1JIQLH9809p4geojSLHKtI=;
        b=VsvAzq3DR/QnMUcr9mFAZhOEAtpuh/S8rBGKaERFNK3MC0A7x7PE68kuZciv2EWy6w
         D/uKusl1MOsioKS9IR4bLbBZLiS5gxqt18jPvAq/o6s9RBE43N7CH00o0UbkRMpdYkaa
         u0sOezYxCnndzPtpRDz7Pa6ETWeJWAL9abcTO6WDuI6afUKA5sjp+RR/UdhZ6Zt62ggA
         Rx58tiePAGuz25sRJy7C9/AxiPIGHPzWPiCAlLNgcet1LwUTsDbzkGN18ZIjYwBk+Qsv
         WkoMYf/vPbkA6Ay0iFuwiPrsea9lNQ+GnR0j4YXKGiMPpON0R4V+0kE4oquYNyFpONfo
         2nZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769524361; x=1770129161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfomtdesgddwjPzUh4TNACOea41l38H8KrBdrI/Lq/8=;
        b=X8Q2DF0HdrLLQO9gcBN5OHtmUUwEPFTDak+Emu9djZaDVYYSURoBq8gJgMw/91+hmI
         r98q7cnfjgl1NylbOqZlBHTC+5JW2YiROJJzQMqPbDDOT9gQZ9BOT2uxUMfEk5PuWcPg
         W7VwtnVz7kA5FfJlH12xXCayblw71A2nLKuJ2NicRSnogC+75PnbTaD4Awrbql4dv2N8
         tNDBNQYtGZ6PS439h8z0N4LL7kRRhMgLrsgrSqgYW1fPtad1lhkntvzWoS3cHJPCHKlL
         mWe8wpfU81MfSasru3LZJVI0cth+kmjLV5Fw+M9n67agXoPCQBnUl/RVQMD9HdkGJEsJ
         vreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524361; x=1770129161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jfomtdesgddwjPzUh4TNACOea41l38H8KrBdrI/Lq/8=;
        b=lEIXzz0SxlnUqPM+6kgLZaZF//AWgWwwzpLtYvUEGlGPaMRlfvpq32KQhIg3oRqa2J
         3yLQVLd4E5zyaypWc/Dpc0mDpv4AuGGXZS70UYodvInWXpf/2xvXrwyeAQy+0+ew0RwY
         kGQ2CqGhCweoRKAxjAnl8tflBo+3kRfDMZPTNPlE6ZbNIm8zjVFKWzI6MksllM4jELSP
         ItZzfdVhfe8HfEN6GpTRctooDvML7hpe1UcaFDb2piYprZmWbVPUsqv5jm2x/HNdI+nV
         aYvObPKO1sF6W5ocruOd1lDkqw/o/wYREBVA5KvjwkWnwerMH0/Z3bvjAz0Yqzszx5FG
         6rrA==
X-Forwarded-Encrypted: i=1; AJvYcCWwaj6y3w+P3/K/6QT7dwGXDgMTKHTYwZGEOsD0cm53UL6Y0eUwlWi/r0NTv3y5FPCe9yYXViNUAWOxV/Fdpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWRlzn+LVEXwCmFivjsnBGBIXSjds7JaZQ6OtF+bnVZ6rEbIr
	Fb2GGu1txssalnJzsd77OmymUbf1p1drhHPWhxrE8EPohWfIPaxS213KMHgXryrHn09zZhDk/KA
	kFVFHVSmyPxSOYl+eRJCmM4BOxElHe2M=
X-Gm-Gg: AZuq6aLdieMbr6537zXHZnGfna42ljqf3irhnn/a8GDlf47i9Nl199KhGmsJEGxapRy
	pfXwkK8CfqAD3cnhw8KD6836uNhuxVBGCgCSXFdvWbr4rDQnhdspCEutIqrPz2hLs+PhWpyTFRw
	jxxGs7SEVdxg2XgUI7D8+LqjDGobu09YDA9Z9CBy4FU74wZ0OB8rIlAQK2QFCK1WeTgLdyqCY0H
	+pLFLOi4ApsuMMHpf5KzcfffKC1lEx84gb/GRV2IaWNuX6vrqFtLHwEsYp9YLri+jN6JCT2LBfL
	iFEvyloIY7r7VyI/4rnFXpNvtGCXyelphK5XavUabVGligWrUo6nm1FbMpgxBjJhCljwwu5Pt9i
	QmurQMPptP4M2
X-Received: by 2002:a05:7300:220d:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b78d9bd5e9mr655278eec.4.1769524361274; Tue, 27 Jan 2026
 06:32:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127125300.3656544-1-tomo@aliasing.net> <20260127125300.3656544-2-tomo@aliasing.net>
In-Reply-To: <20260127125300.3656544-2-tomo@aliasing.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 15:32:29 +0100
X-Gm-Features: AZwV_QizwftifULF5ULpQlWGTXPNbX8VfpsBahST63KtK7Ft8ITBn3bLLEV5QKE
Message-ID: <CANiq72kEWSkjDcKKaXs60SxCC1UCXLdgyvBqv8H0FmLaAa8f=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net, 
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 1:53=E2=80=AFPM FUJITA Tomonori <tomo@aliasing.net>=
 wrote:
>
> +    /// Returns a mutable reference to the underlying flag as a `bool`.

    [`bool`]

> +    /// This is safe because the mutable reference of the atomic flag gu=
arantees exclusive access.
> +    pub fn get_mut(&mut self) -> &mut bool {

Should we give an example here, perhaps promoting (part of) the test below?

Thanks!

Cheers,
Miguel
