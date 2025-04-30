Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C06C16DC28
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025945; cv=none; b=BtMmpB8Wxt0xR6gGesdAk6mHR4EAZiKYbdsVKlXTFJsIe7ZD+gymDkV1pzPgd9dwpHPc2DrMgQFZgCm8pLzRaprl8eO2VAQRE1vbcIoXrmbyKlDClVlNXvlmbvvtVoSFiaP+IN5WK3xMe08XHy2RkS+bjOfNgThYM9OQ5oHRXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025945; c=relaxed/simple;
	bh=3cycFABzBd9M6b4gkgL4KrEdY8QhVRFmgCnPwxrmyOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Stb1m6yT/t88nExm2xx/O3RoDutiXATpJXQTKSOysZXR79WupBsbO77HKSZqs+SHMYreIXoXg2LvNyTkFCtJPTRXCfgAntDeVle/9jFUjdg9THCwNDiOdrRPnG9J2K39vokq6sJvNGNVOjVku3sipfsx2QdGj5lFcwi9g+d+kV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36O17fre; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36O17fre"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47666573242so743751cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746025942; x=1746630742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhEh4tvbRMYHNdTjhp8bc+1l+QqiVag0W2z4WqVEcFg=;
        b=36O17freEVVJUorWMnWXx5lDRDqTOw0ly60tP2p4r4N3to2CyK3Am3fgWPTWPHyvmt
         uCQXVQQJJBZPy23VoKFuk/B2BU6+hRD2pHmxhpnO7EHZxUiV2FxkQJpiMC9Sf4mIqX6L
         XOR3ztBGaG6TwjQkzUsMso48XyeX/mx6tmmdj40eOx6uJVDgCKNhHpyDhYl5K3FuAE4o
         LeMj7vYx5ZaZ3aiG5A9epukKu49Gm5UWfuHGVNqFNptvTu46X4qq72oP+c5we5nUGPdJ
         EfJc5HbDs0hg8qmu+1vkF4cgR8MTlCi4sEfNyPZ4v2kpbaVc7cm5LAdYf1kJI0JgCmEN
         Je0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025942; x=1746630742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhEh4tvbRMYHNdTjhp8bc+1l+QqiVag0W2z4WqVEcFg=;
        b=iiBwudk70fVm9JckL91oeGgj4v8RCY+SfyDQ+79u2g/VHpB5BDR8zYFsc6AjiBNoi8
         vftQ5XyYfBvo92BckULQeg4X5KsOvDaBteGNlkTD8nbup3T5yPiylcCPN1mVJf0o/h+K
         YKytlSQZrmnhIX9aE/8N1wjXHKsodKjw5J8kCCexcVhgWW4Vrik9xNjQ6IHmHQoQWPKa
         Swtd1NL++Z6h7i7zXo+Q9vDqWhb6E11L54Fc2hj/KLFu3QhJjK0CS3lqiZWjU50E9UWP
         uBt0NREpM+L31SkcVWBcOJLtwBdQTjejFHus9mlAq3FEY/GNw5827uBpfLxQG7sayjFK
         9DRw==
X-Forwarded-Encrypted: i=1; AJvYcCWOKeNin8dCRvlYjH/J9NssImeUwSxhdmf/hN8m3XcUjtgdYx+F2Tp1YLIUfr0i/WjDUc34mEQoRcAIyw7PJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QHc45N/H8WXNG5TkkvlCNPpnZDi1NxkZgh4NS7iYkp/EFwgr
	awrV9iw0bZ8t4fG1c+zT0N24dzPgC+O2urXd2+NgYPwwUCz62vxOK62pFQ5p+52zUljue5dF4lZ
	C1/v7P/I91+joL5THMZ97yOZTVrWNuz5RLzdC
X-Gm-Gg: ASbGncsveNR2Ti+Xyl0q3KDkTgQqTvosww+/r3wbLhSrVYjQR+CoZx+ej8XQiVX8K+d
	bEZ0EPbc5nOdi2GwhUO/tdriDwRPx9Ll0t2lcF7GwH2Hyd6iKmCjQgK8LFf3ui82plnT9Bb72Xy
	xBfYAMDRgPbi0/tUkCbyo2wJ1YyRo04wBKFr6VbnVd2I0F2OyPoGg=
X-Google-Smtp-Source: AGHT+IFmlpWRvz2HKpk5LKdhm8W/XO9lRRW725KI52RH7XaAa1gsuyJ97GzbXpDX+9WOsXmG+wHKzjnR3JYZPru6i48=
X-Received: by 2002:a05:622a:1a01:b0:48a:ba32:370 with SMTP id
 d75a77b69052e-48aba322710mr352041cf.10.1746025942178; Wed, 30 Apr 2025
 08:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com> <2025043006-snowflake-headless-e417@gregkh>
In-Reply-To: <2025043006-snowflake-headless-e417@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:12:09 -0700
X-Gm-Features: ATxdqUHiJZ8BaCLBuJNRHBSIT3lqotNE34NeBiHm7ND-1AR63rbwktVRylHyOGg
Message-ID: <CAGSQo01-bQydWgiC-+VRL7ac6v8WG2jwZ5RewPheW-quSQBsow@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived Display
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:06=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 29, 2025 at 11:15:56PM +0000, Matthew Maurer wrote:
> > +    /// Create a file in a DebugFS directory with the provided name, a=
nd contents from invoking
> > +    /// [`Display::fmt`] on the provided reference.
> > +    ///
> > +    /// # Example
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let dir =3D Dir::new(c_str!("my_debugfs_dir"), None)?;
>
> Again, can never fail, so don't check it.
>
> > +    /// let file =3D dir.display_file(c_str!("foo"), &200)?;
>
> Again, can never fail, so don't check it.
>
> And "200" is wrong, did you test these?

How is 200 wrong? This displays the number "200" in a file called
"foo" in the directory "my_debugfs_dir"?

>
>
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn display_file<T: Display + Sized>(
> > +        &self,
> > +        name: &CStr,
> > +        data: &'static T,
> > +    ) -> Result<ARef<Self>> {
>
> Again, will always succeed, you don't want any checking of Result<>
>
> thanks,
>
> greg k-h
