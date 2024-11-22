Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327D18BC22
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732265424; cv=none; b=OWr0vnaErz59Xkg2IRE+VvuDTg+Wcs9/X/lGpYTR5M5KHK0VwtbAaWccnZ4wE/ivgP54GfZq3LOOvnyAZyVnflNGI3O/TnV6DWE13UnHU126jFLmbVGh+LNJtD5nVPSnNNO4H4lhQogTVwN/hs4nXitudFsbjGa8plcJesrVTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732265424; c=relaxed/simple;
	bh=Kak5wLuuHaVOP0U907HYm5hiYqDYH9HgnC+M3zG1i00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHfWzAzohOkY3wb8unU1AauoHMhdCVWYdH189/uwC53OCedZTsY7NuDW2xZeqUBODwz5XQm8Y404UtDdciS+lnf/44ca/Pah2b3lFfbSMKcGi0XndC0tKYWbOu4KL7q9W5Gish1H3ptp1tfWv/lPbeEKMhDmeVLjBXo7YgismJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vpN4gUqt; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vpN4gUqt"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ea2bf25dc8so1587080a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 00:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732265422; x=1732870222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8+9nnoYbf1UxcWWZ8IBCVQZ3ux5jExiFpmdjlIQbp0=;
        b=vpN4gUqtNBZxMz+BCxB4GkyEmBchZsTXe+6ijIXwhKipG4Dgnzjgh7dd4xctMxCPPg
         mrezVnwAOXvaXApPQZdNVJLwqa8sewMXELsrR2WTaDSATx+xgh/4LDbYIC4zl16rKakG
         Ghn5f7REkTasQ0T8zkclEdhCTTTms07IiUUo4VzCFxr2Vy8SVttbs7wMGMTgTqJemGzo
         HzC9y7L1vhjJZI3nA+Y/1Q3wd0oJFiIjJMvbciBXdMT1De/qxp60o4HBOOhFxbzv9O9j
         nUZS7OfEicRk9R5g78WDTVfnUAKYJlPeUBkKO3fhN1Sts6qt3ttQR/oBmZIMu9uITU7J
         Z4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732265422; x=1732870222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8+9nnoYbf1UxcWWZ8IBCVQZ3ux5jExiFpmdjlIQbp0=;
        b=cWWXWySIKsFBFAaQnfEEjXOTgQGsnw4b01pNjIovEjk8Y7EjeCTIx046Wht2d/hxT6
         cWrQ4dSyAxcls1CQZ0iDICMayLBOFKIkpa+F3Az+kStDoSCtmFHYojtuaszed3GgYCYi
         zxrLO7pjxAcTSx/f4xBCEEEwelSi9eX/Z0Jo8lBlXO8YLJoD2hOwLK2P5ccldy531JQ5
         A747/hZR/TQLtioZcSjaM6IVVbqtMJwJZWWEBLQcOawpvpHXF0YnsPHlrC25fSrIJsIP
         sRz2yYOQCI3vPQFHW7ryfkOqMKUaAzRvbIQCy5C0itzduDjkIi/BYrZte2gaoZ7nl6eR
         /WTg==
X-Forwarded-Encrypted: i=1; AJvYcCWonIwDZLWohw8N9M7VLP0Nj2TO7yZhKKSMl4NihyYKMr/hA5KHhvZOInAITqR6MH7N0+Muevg9NeRyt6wOIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+s8dFftolYkhLaSHMDgMOWMQ4XaxUyivTxZzIgXB8Mmji0WcG
	3WMMvU7mEI7kvZDIJvkm2mb/RuCtInTIdsmcnu7mrQdYclPuOYNkDsO2010R0Fuh+rmnYpVb/QU
	IxFFIeqWBSIMuaW5xG4ToEiIMR5SFU7A9bDk/dla2O2yjF4P8AyCC
X-Gm-Gg: ASbGncsvQfLojji2ID8xXd+riKrdPpe4EgZ8Jonl76rqLa9pzP5gcrGt15md6KzWwCi
	duBXRzsJyneqpJG6zGxPYBBGbkt0RiGmq
X-Google-Smtp-Source: AGHT+IERZ9lNFuDAeT7H4I2JX5gC9cNIWkhL8/VD4BkcdPi2aQdqVypnRfvRtA9Uv8ewZgtJ3R72MEjmWswSyzndUqI=
X-Received: by 2002:a17:90a:d40b:b0:2ea:5dcf:6f5d with SMTP id
 98e67ed59e1d1-2eb0e528054mr2472713a91.16.1732265422368; Fri, 22 Nov 2024
 00:50:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com>
 <20241119112408.779243-3-abdiel.janulgue@gmail.com> <CAG48ez3fjXG1Zi=V8yte9ZgSkDVeJiQV6xau7FHocTiTMw0d=w@mail.gmail.com>
 <43a07c04-2985-4999-b6d6-732794906a36@gmail.com> <CAG48ez1uzoEcsFG7Tsfj2WCXor9-mhffoWO8VFoit3j_mUC7-A@mail.gmail.com>
 <CAH5fLghUb8dEV9GVtJj497cJ5sp4Gg7=qeijfnV_w4BNd70qxg@mail.gmail.com> <f0052c1d-ce36-447c-af1f-db12940f6cc1@gmail.com>
In-Reply-To: <f0052c1d-ce36-447c-af1f-db12940f6cc1@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Nov 2024 09:50:09 +0100
Message-ID: <CAH5fLgjk7UV6URZAK7_37iqXUKTUsfnaBj7bLZVJ91bkieOZvw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: page: Extend support to existing struct page mappings
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: Jann Horn <jannh@google.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 9:36=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> On 22/11/2024 09:55, Alice Ryhl wrote:
> > On Thu, Nov 21, 2024 at 9:18=E2=80=AFPM Jann Horn <jannh@google.com> wr=
ote:
> >>
> >> On Wed, Nov 20, 2024 at 11:56=E2=80=AFPM Abdiel Janulgue
> >> <abdiel.janulgue@gmail.com> wrote:
> >>> On 19/11/2024 19:07, Jann Horn wrote:
> >>>>> +    pub fn page_slice_to_page<'a>(page: &PageSlice) -> Result<&'a =
Self>
> >>>>
> >>>> Sorry, can you explain to me what the semantics of this are? Does th=
is
> >>>> create a Page reference that is not lifetime-bound to the PageSlice?
> >>>
> >>> This creates a Page reference that is tied to the lifetime of the `C
> >>> struct page` behind the PageSlice buffer. Basically, it's just a cast
> >>> from the struct page pointer and does not own that resource.
> >>
> >> How is the Page reference tied to the lifetime of the C "struct page"?
> >>
> >> I asked some Rust experts to explain to me what this method signature
> >> expands to, and they added the following to the Rust docs:
> >>
> >> https://github.com/rust-lang/reference/blob/master/src/lifetime-elisio=
n.md
> >> ```
> >> fn other_args1<'a>(arg: &str) -> &'a str;             // elided
> >> fn other_args2<'a, 'b>(arg: &'b str) -> &'a str;      // expanded
> >> ```
> >>
> >> Basically, my understanding is that since you are explicitly
> >> specifying that the result should have lifetime 'a, but you are not
> >> specifying the lifetime of the parameter, the parameter is given a
> >> separate, unrelated lifetime by the compiler? Am I misunderstanding
> >> how this works, or is that a typo in the method signature?
> >
> > No, you are correct. The signature is wrong and lets the caller pick
> > any lifetime they want, with no relation to the lifetime of the
> > underlying `struct page`.
>
> But that could be put in the invariant that the PageSlice buffer must
> last at least the lifetime `'a`?
>
> >
> >  From a C perspective, what are the lifetime requirements of vmalloc_to=
_page?
> >
>
> If I'm not mistaken, that should be the lifetime of the vmalloc'd buffer
> right?

It seems to me that the signature should look like this:

fn vmalloc_to_page(vec: &VVec<PageSlice>, i: usize) -> &Page

This way, by providing the VVec, you can only use it with memory that
really comes from a vmalloc call.

Alice
