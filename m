Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8E1F8EEC
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729538829; cv=none; b=EDuuw86aSeYXRJHa8Nwt6X2lZ/UNFwKDjxSonz3aJpSoPflCzwrGbKBY8tAEa/qFoRPL/ZNIhWJtxt1JSA3fvm+g1ZUBMtkFpSvMcBQ1xk73bH4uoquCyrQ1G8o7Y2NNIa4OBZ4eZw/Cm4DdhWjCYoRF9/YS6KjzCRUSebMWkgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729538829; c=relaxed/simple;
	bh=BVoOVku44aTl9bVy35c2nUYZcFuN1B+ec5SFemyGpSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzB6hlcsTlQ3N0oiDFaabA3HHElqnaN+D+KK4KPpBAje1+YtYEQGKRpbebUjQtiw/yd+uwpHGRo99RmhOMn4i/oUDtAPBV8cmQ7OVRZRNn0yVxLNjI3xzzszKVNPV93EorM0iu8jZAd28kgAGSMychmWBnZS4U9RXXwCGCN7rw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ck6gbZT9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ck6gbZT9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d47b38336so3277869f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 12:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729538825; x=1730143625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G06bZX4NZYaGTrzKEnb+wzgfWTRjPnCRzAr7/SDwOJg=;
        b=Ck6gbZT9kfn78MxvXol/aFBT45kRypP2IahvRwYASDpvG4Li3n6rfyteQUAiHFTUdq
         kFFVYfZy873Y1Ga5vkI9YM3w5nq/flWjVG7lYrIDtN2OFCQmPQhZAdFUle+esDFfn+ve
         NTvZPAoLFxaVs4b5RJUgaI/0fZjrNc5S+oDKl2al7SrLajiTHl/uxXtFnNrTwiKrrJdN
         rnQqpWxGw5wYDCengUyirf27Rx2OU6BsWvYHz6goMN1ye02W4QC1YjD4l0vu+oFUrInL
         lPQMQw53+7cfmEJHCEKEkl5RlHph3CfdIMNT918C8XlwOOAmv7WA7kzLE7LGu5HXWeRy
         Q1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729538825; x=1730143625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G06bZX4NZYaGTrzKEnb+wzgfWTRjPnCRzAr7/SDwOJg=;
        b=rkyTOZ3d+D4fbWUtCwmojZdfvs5uTKO/Cpv6U4g+6zNCKFnpJeeluzHuin4vcxIWWC
         sdjjqJlewUrRSDjW44NC905ibMZ3TK6FXu+Zszu03uE/p820fWxlWVG4YDvVByiy+R7d
         G9TQynzWMDABirJuJD8Reiki0SK5CknUx9d5hisrXZXgh7Lgwq7pADYeLnDHKy3+Taij
         SbXwMxFzt0Z8QnDJObOqfma96gPEDPGonbNBTxjKNMAsfKwGbK5eNpFWYLFUva3sOdzo
         orr6il3fGJip1YsLuEc33Yr88v+nOXMEHL7J6xciNyNO1tR/ab2Q9m9DHlkmNKl2vwGi
         iZig==
X-Forwarded-Encrypted: i=1; AJvYcCUFZw2ZDSq1wPIxRVLoTF/iSUd1E1PnNt2eqaNSgevGkKXIYr306yH7RnhmIvu9yceUe7hpAr5S63iTwmZ05A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdioD4exXgq991XD90F/D2lMc38y2mMr4/IBpnL4jBD7f4Rgax
	zQj+qORm6D1jaGSV3d0X17srv6r+rzxDsgxpzyfATuYBg9WMRYsTupFHKekshsz9qgtyeIjEFai
	0jRIykorA9Sp/CiLUp333yMLo8MqI4E9UHt2x
X-Google-Smtp-Source: AGHT+IFjCfQpZXB5FfyR7n4mNoSlSW2stfPEZ5HGjgY7Qm6kIHo4Oefe2PJHKlWsVvPnmJG7vYibttMDHPYnP+AWtyg=
X-Received: by 2002:a5d:6e56:0:b0:37d:4aa5:eae5 with SMTP id
 ffacd0b85a97d-37eb48a0ea5mr7193856f8f.55.1729538825298; Mon, 21 Oct 2024
 12:27:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-page-align-v2-1-e0afe85fc4b4@google.com>
 <81e9b289-b95c-4671-b442-1a0ac3dae466@nvidia.com> <CANiq72mW8seB=938XZM7bwdSU43z0eePXinE5QPYyybvNfbUeA@mail.gmail.com>
 <dc5e7653-8d6d-4822-9c29-702ece830717@nvidia.com> <CANiq72kuQ-fNTYw33czgN3_DYjixzk01+hahFhR4QSkENeDBkw@mail.gmail.com>
 <b93805c1-28a6-4ad9-b0d2-5116ef4b0d83@nvidia.com> <afc139fe-ac03-43e7-a5c0-22410f1acea3@ryhl.io>
 <682c97a0-9877-4e31-b180-c1e38d3bc883@nvidia.com>
In-Reply-To: <682c97a0-9877-4e31-b180-c1e38d3bc883@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Oct 2024 21:26:52 +0200
Message-ID: <CAH5fLghMiNbyD-As40Rz+eRzxMVdX9TXwesxN7cbu-iW2bZJpQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: page: add Rust version of PAGE_ALIGN
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <alice@ryhl.io>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 9:09=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> On 10/21/24 11:59 AM, Alice Ryhl wrote:
> > On 10/21/24 8:41 PM, John Hubbard wrote:
> >> On 10/21/24 11:37 AM, Miguel Ojeda wrote:
> >>> On Mon, Oct 21, 2024 at 8:35=E2=80=AFPM John Hubbard <jhubbard@nvidia=
.com> wrote:
> >>>>
> >>>> Is this another case of C and Rust using different words for things?=
?
> >>>> Wow. OK...
> >>>
> >>> I am not sure what you mean -- by BE I meant British English.
> >>>
> >>> See my other reply as well -- I just changed it anyway because Rust
> >>> apparently uses "parentheses".
> >>>
> >>
> >> Right. For spoken languages, that's simply preference, and I would not
> >> try to impose anything on anyone there.
> >>
> >> But in this case, at least for C (and, from reading my Rust book(s), I
> >> thought for Rust also), "parentheses" is a technical specification, an=
d
> >> we should prefer to be accurate:
> >>
> >>      parentheses: ()
> >>      brackets:    []
> >>
> >> Yes?
> > What word would you use to collectively talk about (), [], {}? In my na=
tive language they're all a kind of parenthesis.
> >
>
> Good question. I've never attempted that when discussing programming
> language details, because it hasn't come up, because it would be a
> programming error in C to use one in place of the other. And it is
> rare to refer to both cases in C.
>
> Rust so far seems to have the same distinction, although I am standing
> by to be corrected as necessary, there! :)
>
> At a higher level of abstraction, though, perhaps "grouping" is a good
> word.

Rust macros can use different types of brackets. For example, the
`assert!(1 < 2)` macro uses round parenthesises, the `vec![1,2,3]`
macro uses square parenthesises, and the `thread_local! { ... }` macro
uses curly parenthesies. The round and square brackets are used for
expression-like things, and the curlies are used for things that
expand to top-level items such as global variables or functions.

Macros cannot use any other delimiter than those three. So e.g. <>
wouldn't work.

Alice
