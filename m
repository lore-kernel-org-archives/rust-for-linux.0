Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110381468FE
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709049425; cv=none; b=lJsN7gBYfb1te3bSfwW2u0QvQZHlYPcjm4I8M2USuT0iZHR9S/TM1x1jey4zRHTHXqm3E+TKuCESkh36Ssn9Y9e+82Mo3elb7B8u/WbZmEgwMMcX2IkLibPptXpZmW5rru9FUyPOeYkZNvGprJPuxX5byKpe5QsmkkuzqSVr/Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709049425; c=relaxed/simple;
	bh=T8GmRBHe54nbmuaPkv00EKb3E1ieTIbnwEGf8I18sXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NA6M0setqe50vrvCzgIXMAVPOCnlIwGv8jy5VyB1ndFRwanFQ2QIHF2Ky2IvWRz3TE7LY1rK0Yjdepe5f9PKl5/02TrGKa1tK8hmgMebRM3giz/4/1i5uOaaC/RssASsFqgsxEwJerDuZ4oTvLXBy7/bt54aTzY6Aw8UpydKkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jbtFR3yS; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jbtFR3yS"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4724f2b88cbso211741137.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 07:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709049423; x=1709654223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz63I5jGJam9ziTsehsBfrmLZXVDff45p8Sdh7Rb40k=;
        b=jbtFR3ySdR2r1CYCDZrNEI1eSFVDrOtIVvMc+mFCzmBcA42twZojGMt6JqTBIYO46R
         ythFyksTfqlHsfx6rkSf/NadLNff2gvVeJMLHPuJN+9y04c6OmWtbPAWiJJyOz+lZZmy
         ZQ4Svi5lkV7blL1xJUWpuBEmhSEqqzRXhr8UAJ58SCmcoM/DuHGr+1FWRfb8D6upyhHe
         3Qoyz7BGeZJYPmA/mSj5y8ZSIanwrwZ2MULJWm2vGxECIpwtGpsbLpSFiCZ7w1DeyOiO
         t9BuODeTeLALNY8YmO8r74/9TC0ajRsy4F3vFCfbacBEln0Zl71gWMQfC75RwCFF6gra
         Qkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709049423; x=1709654223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz63I5jGJam9ziTsehsBfrmLZXVDff45p8Sdh7Rb40k=;
        b=fwW12xsEOFMdk+5LPnTo54N1ZmWQw5aZpc7gZajJcWDMQyyx+DOL2W2pnzLFPKSW3u
         qouvPQ9zTGZkF1fF+JfhGflMHAhjvn/sUTdZwLFdlTYsk1SEcC9cYcBfFtVOYUQzu+rU
         Zn2FylykbEyo/2EU6BsB8pYgLE1l1fiPkixEv6m2lMVqOuZfSx0r500j+Cko+KHteFOP
         KAnMzTdTl164S9x488ju3FhNhyVPQg4yZQv+X1YBEihA3lt8MpvA94Xe9m81l5onbEd9
         9CtMlO1gdnrOD0FW+YA0f/Ao2jfuMAJvp4GbNMaKxUxjDYafSr17TQRSz8OSWZYmzR10
         mGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDtQi1rx2fXQRnVsWa6NAFGOr6zdtEQM6w6y8aR/KblNR3uNfmngHJF5l5aULZmR43Z3FgzCqWFl4OEhrDzGgEas3N/C2lcUNjaonxmN0=
X-Gm-Message-State: AOJu0YwClnSiv9LkLxg5+x/U6gR2Blq1tAxMylF+epZKjxZuFi7rrHKj
	AlwrtS1iopzz3F2Z+LD1mfB+kuyopgP6AobrbwAelAtVsxl8lZSjyl0EY1zfqSfliPZ74/kZ9fT
	tB0UVh7msqUFXmzdw0ZfGlE4tdZ9Th4R7C2R9
X-Google-Smtp-Source: AGHT+IGb864B0KCLFtT9j0TGLsO0nGGyrgue73owoa/PB+tubylZra+Dcxo08UFSc/HUH0+ETPHEEz5iBt94o4W0Cnk=
X-Received: by 2002:a05:6102:f12:b0:470:3eff:e755 with SMTP id
 v18-20020a0561020f1200b004703effe755mr9887738vss.24.1709049422611; Tue, 27
 Feb 2024 07:57:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-alice-mm-v2-0-d821250204a6@google.com>
 <20240208-alice-mm-v2-4-d821250204a6@google.com> <Zd4Bp6ohjb7H9poA@casper.infradead.org>
In-Reply-To: <Zd4Bp6ohjb7H9poA@casper.infradead.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 Feb 2024 16:56:51 +0100
Message-ID: <CAH5fLggmaemG8EJamSy6oEDneZAWhJWJ7OrcbG52rdrdukyaxA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: add abstraction for `struct page`
To: Matthew Wilcox <willy@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Kees Cook <keescook@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 4:37=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Feb 08, 2024 at 03:47:54PM +0000, Alice Ryhl wrote:
> > +impl Page {
> > +    /// Allocates a new page.
> > +    pub fn new() -> Result<Self, AllocError> {
> > +        // SAFETY: These are the correct arguments to allocate a singl=
e page.
> > +        let page =3D unsafe {
> > +            bindings::alloc_pages(
> > +                bindings::GFP_KERNEL | bindings::__GFP_ZERO | bindings=
::__GFP_HIGHMEM,
>
> I thought I raised this last time, but this is over-specialised for
> Binder's purposes.  Many places that want to allocate a page want
> different GFP flags from this; they shouldn't even be the default flags.
> So either what you're defining here is a BinderPage, or new() needs
> to take GFP flags.

Ah, yeah, sorry. I never got around to figuring that out.

I can change it to take GFP flags.

Thank you for taking another look!
Alice
