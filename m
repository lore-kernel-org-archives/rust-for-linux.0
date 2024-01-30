Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A558208
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706605584; cv=none; b=azaHSHzSMy6PuV78WEVxtQzsiEerDUwWwM2jZ4Wyyqfp7pFIp7sg/Rre0p4F/5p8LIlFkvFQ2uv2blWBLnz8MfY3VIOVCxZAYfodbtDJo8xv4yUWEEevv5VMRHvQssXTRD1Th5PMZzFA7EMQ0FTWMYAjAL6FxLsK9rF4MOBZgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706605584; c=relaxed/simple;
	bh=UiTaMIx2Jm1EUQDykoIgKkQLEt+vN6yTNf/ep5hPZjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5rNxCH5opbnGND0MMXoOCYg2iCAQCb4ziifKRcXSTAJ3CmhQlR5os9bUWU0xVq3SPwT5PEB9ko2y3sVYd4MqmAGdse5HRNFHdBUmjHtQUQaKT7xPD9B2IcC26fe/MkvzYQKNUCFAgrNy507hVtvabcWOkKySO7HO2uxR2qQX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wGT7lJqI; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wGT7lJqI"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4affeacaff9so675740e0c.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 01:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706605581; x=1707210381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZhWHmKw4vi7AxSEO7CuV+xNiUe+yFZ2ZzlwsymAg/E=;
        b=wGT7lJqIintsMjwm0ifRYemISbJCg+SGcnQRNhf8ghKDdd4HIxQE915m/RLitrWGAE
         trTE2vcfkzaSIdNOIVbc0voS+c4nvBQnVRCEDLcgs3v/dvJuc9wMJa+jZsOPNoGI9TCu
         ig4kSqgHVq8EgzwxObmZtcpbwaGq2rSoSG1Bd5Aomwlp4ffjWP6VM2Vy7opqIWRRQGGl
         YDH1V+o7SCnK7k2sC74dTTVhrxCkgMBzuZDeUDoFSK0JHk3OdQlPe+DO7psalWBjhluh
         6t3sLmVKEZK36SZbpV1UJjdq/05qWeRvqtmSLyY4+eU2aWvAYLPNZrbuECFVpsHKo5R3
         kmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605581; x=1707210381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZhWHmKw4vi7AxSEO7CuV+xNiUe+yFZ2ZzlwsymAg/E=;
        b=RXNvotFo1YzAs1NUM8/1+rA7x36JjIagZVi63QDfUcLcRE8ehVjny13jTTEQF0GHOp
         bNDclfLrr0LWgqQc40Gfv4Ne1WPSQvmGim52VmiJn8bqTRyUTJc28IV003xYBghQF1+u
         sJutpw1mGVptArIonCQqnyK3EfmVJFwMMo2QE2Hs7dRGm5cJaAT6u9rV4WZWEwroL7vd
         sd28uqnrgoRCmKlfYyGqdNhS/d7U2ONSPTpHZsH9AzTRtbrvGGysNIUzm9AN/uDFGXaL
         oFD9eVa7iKXk4JJ3joVBjHIwx7og4SuU+PkpH7sIwiTXmHrmZTOOQ8dtVUMro5EpCoRd
         1o0w==
X-Gm-Message-State: AOJu0YxbNme+ESboDtfCRslYPaxUeib+60WDnxYVBUNMHvjSAzODZfdA
	fv6Gwq0WrYT3PpYMcf/FX0ST0lHfgz3yp2ll5O+6DQxTiTUcQXGKqhzrVrnN5f4BhGrOXjiwnDG
	kSTPhjoqw48xJoMP2sb+euGP/LWcNjE3j/NNY
X-Google-Smtp-Source: AGHT+IFRKvthvPaK/eQQw262qb3uj3gwoqQFpPfljrQVEpXmKBSAG0JgZF/aeoOMlfcPoJI9wUzPo2V3cNjqBI6Lioc=
X-Received: by 2002:a05:6122:45a5:b0:4b7:689d:9d9 with SMTP id
 de37-20020a05612245a500b004b7689d09d9mr3412354vkb.32.1706605581206; Tue, 30
 Jan 2024 01:06:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124-alice-mm-v1-0-d1abcec83c44@google.com>
 <20240124-alice-mm-v1-3-d1abcec83c44@google.com> <CGME20240129180005eucas1p1c1962ece31e6b9619f9e22dc95f54087@eucas1p1.samsung.com>
 <ZbfnmX1J8iLV8UnO@casper.infradead.org> <87mssngpnc.fsf@samsung.com>
In-Reply-To: <87mssngpnc.fsf@samsung.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jan 2024 10:06:09 +0100
Message-ID: <CAH5fLghoxdAQaWRpDpn32A5YUM20oW=7Vck1fPUz1rk5ruH_AA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add abstraction for `struct page`
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Kees Cook <keescook@chromium.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 10:02=E2=80=AFAM Andreas Hindborg
<a.hindborg@samsung.com> wrote:
>
>
> Matthew Wilcox <willy@infradead.org> writes:
>
> > On Wed, Jan 24, 2024 at 11:20:23AM +0000, Alice Ryhl wrote:
> >> +impl Page {
> >> +    /// Allocates a new set of contiguous pages.
> >> +    pub fn new() -> Result<Self, AllocError> {
> >> +        // SAFETY: These are the correct arguments to allocate a sing=
le page.
> >> +        let page =3D unsafe {
> >> +            bindings::alloc_pages(
> >> +                bindings::GFP_KERNEL | bindings::__GFP_ZERO | binding=
s::__GFP_HIGHMEM,
> >> +                0,
> >> +            )
> >> +        };
> >
> > This feels too Binder-specific to be 'Page'.  Pages are not necessarily
> > allocated with GFP_HIGHMEM, nor are they necessarily zeroed.  Maybe you
> > want a BinderPage type?
>
> Rust null block uses the same definition of these flags [1], so there is
> at least that synergy.
>
> I feel like we had the discussion of the flags before, although I can't
> find the thread now. I think the conclusion was that we fix them until
> we have code that need to actually change them (as to not add dead
> code).

I don't think there's any problem with replacing the constructor with
one that takes a flag argument dead-code-wise. I can definitely do
that.

Alice
