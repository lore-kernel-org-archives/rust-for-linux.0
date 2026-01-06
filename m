Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20992200C2
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 21:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767733585; cv=none; b=nvnNbctU1XIVGLE7ETjV8Rbi0UyCXejrba3aKI9CbQNJBOARZhwQvW+53XPauTFo5kOFbGHQ2pKFokXioWeVH1ehIok/vCLYxUiPufEsHZtvMhG9NaF7Qqh8J7MccKkgE/y9HtCujWQSjzhVrg0ZnyImuHQTyH5MKQPbHuA1lBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767733585; c=relaxed/simple;
	bh=edmype8g+s0/P/vyujUG5ekK3dRFqJoRWL2jK1tbSoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUjxsoXjMkXKdE+AdVOLwPwHblTr1tSSydO5pjbOHeC6Ju3PZlCO5WmsCXq7CmIgEYq6pCZUs2HTflbddgvSRFRw4zQhXOyyArr7OC1AxdjPIlVmfklZ4lXrJoEs6EURjDvFzYRKU2uF75lHqqOkeDo76o96GLBIwji4vDkc3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUIYzuI3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUIYzuI3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so11934625e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 13:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767733582; x=1768338382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xibGr+iLgdIV9j3ftN8cA9P8N171rkZEpUKbSHebBMA=;
        b=YUIYzuI34b/XxaJ+xQp4RIVpWjzyU2iZbN9d02S8OuMvVqpkF1AKew6/C3uIpt7/x6
         3C0v+YPIHZrP84KTfEmrJN+Y7QOmmoD4KF8qmzGUluZF3oLMmT46bk04ax58lWhD/I0g
         +sjmcjsvRb2oZZk6hZntTLw3WMaoO7j78d4QTfiG8EnHPibjUcAVl61c0e4xRfbhP6Kq
         4qvy4k6bWZ+8HH5e1no7v2Iq52WvB7sOwZ+Vro297toCWvNLZkpMYXYTzyLcOe6tBdWp
         voMCEKqaNL02lAEF0fXImbiyUwyUU0yQ2GIKU0yVUbXXsehXejJu5I90ag/85pDL2Hjp
         rBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767733582; x=1768338382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xibGr+iLgdIV9j3ftN8cA9P8N171rkZEpUKbSHebBMA=;
        b=PAxUowXFL0shXhaHzEI2wDFtBOP2O8HBcb+xgltrhxgjOwXu8ApiPxl2D2JDRYvQHU
         BBUcqHM4ZbghyV02v/fOLLHbu+33/NY8y9Q+zJ8OqvNVHVWZLlIJoaQpWesdkOGvTZv4
         qUw3AdMzGH70OvpONIR1ng6KA7Yv3q/3sjcthbA9V7CEJUO5/BGXLnN1eu1DmMAPitFc
         CrOQm1h1PICBzYqW5r7P+TBSkWwwnGI4pZf6k+9pznXxj/owO0ehb4oMnDVIfOn+0kxI
         bHSA1A/jR/9INfD1nyAaWbKVk7SwRzSJCyqRQKJ5JankCdkX4Ljw/PaqqAfU5goow0VD
         NukQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl+sAD0R9CLuenzVm0bOC6Cee+NcBFgVad/3/3pl8lbr5f7tiWVCQYlwtquI5baB0JBbRdGpkE89pAt770HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMq2iPLorDuvkye4N2Lt5H6gWEHN99uAGlATe1L7S9O7m8FE1B
	PffLqYXaobcZw4Pqd7Fsj+7iad9g1zMqrzm4pD2YCDu/w99eVSMRIc4V26St0bxxKgzM06nrHJr
	uA5kGTuID6xWOVg5iU6K8m2wfk+nW6PIH5tYvfH0q
X-Gm-Gg: AY/fxX7UdL4e5vMXYKIxnFaZ3BJ9/1/ZMwGFBS9SHB+b5JAEngLH1R1bYS+W+ZewvnO
	5p8thl2mVEbe6hpb9wGoeQulagjCCpygHPYMEr+9OVhC37iQGavRRjTwrBZ13oLKaQGXeGMRVuH
	92XtVwMJoys0xad0q89qqA/ksjXeiaIt/GUyM8MGvzQiYjRRJCzFqkZ+WH+Q9TmtAT7H0S9wKXJ
	+UVnnA7p5fJLkYZNSB7yReieTX9N+vXUC7Ha4KiKY91Fnx3trDc6+UiwGJZlvUgoIJ/kcH0VtJ8
	k/y7yixhRi3ojP9i9zsUttEaZ2YJExXfD3sC
X-Google-Smtp-Source: AGHT+IGd9kqiFFFoLp1r3AsTsPtEm74t7w7b08xVGfNcxFs2BcOfBe+w7+tZcCzvjQD9dkxXm32qIs5yTAWjRP3i7BE=
X-Received: by 2002:a05:600c:1e24:b0:475:de14:db1e with SMTP id
 5b1f17b1804b1-47d84b36a1emr2639485e9.24.1767733582348; Tue, 06 Jan 2026
 13:06:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101081605.1300953-1-sunke@kylinos.cn> <20260101081605.1300953-4-sunke@kylinos.cn>
 <aVgC1qXp1La6E9p0@pathway.suse.cz> <aVt0JYbbXLeuqFBt@google.com>
 <aV08Me9QLvi6uqsf@pathway.suse.cz> <aV1D8d8EyuzwQhHK@google.com> <aV133_IhL91g1PuA@smile.fi.intel.com>
In-Reply-To: <aV133_IhL91g1PuA@smile.fi.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 6 Jan 2026 22:06:10 +0100
X-Gm-Features: AQt7F2r7v25Ym0kTvc_G3QFK76YRHvDr4lnyQtwOmg4dMAtCelVqj9gJV-2duIs
Message-ID: <CAH5fLgjEpNt=eD21FFOEOdkxrbvqca0tY-mbg9SWrMv0-p_5Kg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Ke Sun <sunke@kylinos.cn>, 
	Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 10:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jan 06, 2026 at 05:18:41PM +0000, Alice Ryhl wrote:
> > On Tue, Jan 06, 2026 at 05:45:37PM +0100, Petr Mladek wrote:
> > > On Mon 2026-01-05 08:19:49, Alice Ryhl wrote:
>
> ...
>
> > If I write this code in normal Rust:
> >
> >       let ptr =3D &3 as *const i32;
> >       println!("{:?}", ptr);
> >       println!("{:017?}", ptr);
> >       println!("{:17?}", ptr);
> >
> > it prints:
> >
> > 0x602ae0ec95d8
> > 0x000602ae0ec95d8
> >    0x602ae0ec95d8
> >
> > If we implement {:?} on a raw pointer type (and {:p} on reference type)
> > to use scnprintf with a stack buffer for the string representation, the=
n
> > we lose this flexibility. (Or we need additional effort to pass through
> > the various ways you can configure it to scnprintf.)
>
> I think the field width or variations make a little sense on pointers. AF=
AIR
> printf() in kernel ignores field width and padding modifications to a poi=
nter.
> Only size of the end buffer may cut the string in the middle.

I think that's a fair take, and I'm ok with the decision that Rust's
%p equivalent does not support customizing the width and similar.

In that case, we may implement `fn fmt` for pointer types by:
1. Creating a buffer on the stack large enough for a hex-formatted pointer.
2. Formatting the pointer with scnprintf or similar.
3. Passing the resulting string to the Rust machinery.


Alice
