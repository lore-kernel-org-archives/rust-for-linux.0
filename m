Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69E1E0DB8
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730275776; cv=none; b=Nbe03+tqv/BaVzTMYtyzsMIUaGt388kSUUL6n6mBiza3MRH/2KEja9R2jwPLfzK+f06/d9aVy9h1VJ2FewVTE0jBcIVlFS6Vo2XmBAl9u51oCI8+zK2Wka8mRjsTuZ1iYUixpwCdwfhmg4M9MNq7XSwcyvHOxtmOVvpN/RYctCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730275776; c=relaxed/simple;
	bh=+kVSzx9rf4BIG7BfgSll1dC+VOkG6fik/owXU9ICoG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3gqBuEeGOoem0w9Sjie1kvBnLusAiRyoywGEVE5ITwa9u7J3A4h4pcl1odhBYbGUK/h4U1iEnPQr3JPJnlsiN4N9Wj5x2BPB7YY3kz4qJ71qWVQZY0kBRHndYK4rJPXiAM06hQq6P1Zlq/nYm0pLedWjnKfiY9bHu4LyIcsj+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q/EMnEqP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q/EMnEqP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so4028369f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730275773; x=1730880573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kVSzx9rf4BIG7BfgSll1dC+VOkG6fik/owXU9ICoG4=;
        b=q/EMnEqPFZUZV/gEDBmi998tbHUDIBDjB29VJ5eQeCB1i4+TxHBJmsUom0zgPXkHeu
         039vVD+15aUVSPij3pKtNhn3r9XK6y3cCO1DhRxUFTj5fVquBo08ixr9cUpe2/oAQ1Ee
         mBHTkf2CN86fsz+sO4C8Z6LhJk6DM9i4Yfkmk5ZBFrish8WCWkrmIEc+QTQUKrSScBD/
         ug7kTq2KAZZPxU+35LrS/AVDlqW8f4qIZvqy5eEVJMmT4VgpRtoHLniqg0cTcK/TU9WX
         U6O60ygRLcLy7EChrMAFggTQ+qXUyGAb9LO2ZtDlRQjj2NU3Wwehg49LzfrufBHGUiXn
         Ri+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730275773; x=1730880573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kVSzx9rf4BIG7BfgSll1dC+VOkG6fik/owXU9ICoG4=;
        b=T8JMS4xEHYMpj9l+NfuWYx98oxdw5EK7Vn2CgZoHDoesMkysZr6t8UZhnw1w4Pdg7B
         KGJMfjTvelYn9lBFmPX4f8/qMlh13IJp0vbME7K+v910Dz4hIPVZMszKJIWDjFXFzb5/
         puPu5YbKOSCCLR2JKHf5spnyfak8kvi5avorKhuv0JTeRy3pJOgX7/OyIOsHGKU4SHvi
         JR3ToWd3ABRqski6QXvtjlIU+WzbNeZaw1uBvkx9FSxrHUOJ5ZwR1z4rKu1YVlrmrKJ0
         4ir+06mqZus9z5riQsFMIWFVgvnOxjCaKdKj+RLZH7Q+L+YFom0MwxEBsmfmtYTh0Zuv
         XtIA==
X-Forwarded-Encrypted: i=1; AJvYcCV/dbiaq5lVLoF52y1n5Lc3PqUNgrkW4qaqq9pQH77yfPj4quQ2yfNuzoR4L3w7ks4HXXg5SsvYUX7hJ6Jb8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6zzYpp6cG5ybMtk1ptH7Jlk3ocp1Y4d6rWtRBf2I6VWS0CYpZ
	vwmIIhtcRp42/QNl/RLfm5yZkady1Ria9s7TI4X5WuXr/1+q6VUlymhWyD9xKkFT9dO8aQ4fQgJ
	KFvXWHAOPK1q0fKwIs0SXoTwZQWkBwUtMLHcs
X-Google-Smtp-Source: AGHT+IFKM7cBceg79DhIJpxYNbilbjqWxqPxFbnvkwCq6F8IMzAmrdLoK45koFerLCKZMqJgFqe+f8/8Mxyt4nqaq3g=
X-Received: by 2002:a5d:4d03:0:b0:37c:d225:6d33 with SMTP id
 ffacd0b85a97d-381b710f718mr1739159f8f.55.1730275772880; Wed, 30 Oct 2024
 01:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-rust-platform-dev-v1-0-0df8dcf7c20b@kernel.org>
 <20241025-rust-platform-dev-v1-2-0df8dcf7c20b@kernel.org> <CAH5fLgjhiLUYPgTt_Ks+L-zhWaQG5-Yjm-Y3tfh2b2+PzT=bLg@mail.gmail.com>
 <CAL_JsqJWPR-Q=vsxSvD7V9_v=+om5mRuW9yYNqfavVRUwH9JFw@mail.gmail.com>
 <CAH5fLgiXPZqKpWSSNdx-Ww-E9h2tOLcF3_8Y4C_JQ0eU8EMwFw@mail.gmail.com>
 <CANiq72kaidDJ=81+kibMNr9jNxg467HjOm9C_4G7WRvaiddGvg@mail.gmail.com>
 <CAL_Jsq+T6T_3p2C62U3v4aSjm_oc-Ycjxi_ckF0ufh=JJDz=rg@mail.gmail.com> <CAL_Jsq+PYtRR2T2ShPyC0Ae3P0FnzKKPr1uK=QG0hVmPUV=PVg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+PYtRR2T2ShPyC0Ae3P0FnzKKPr1uK=QG0hVmPUV=PVg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Oct 2024 09:09:20 +0100
Message-ID: <CAH5fLgjyOMa_pVW1fLP8MR1E-=xF-qL2F4_NT42+y7tP9za2Xw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] rust: Add bindings for device properties
To: Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 11:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Oct 29, 2024 at 2:35=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, Oct 29, 2024 at 1:57=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > On Tue, Oct 29, 2024 at 7:48=E2=80=AFPM Alice Ryhl <aliceryhl@google.=
com> wrote:
> > > >
> > > > One option is to define a trait for integers:
> >
> > Yeah, but that doesn't feel like something I should do here. I imagine
> > other things might need the same thing. Perhaps the bindings for
> > readb/readw/readl for example. And essentially the crate:num already
> > has the trait I need. Shouldn't the kernel mirror that? I recall
> > seeing some topic of including crates in the kernel?
>
> Looking a bit closer at FromBytes, that's almost what I need. I'm not
> worried if it also includes usize and isize. However, since the trait
> also is provided for arrays/slices, the following happens to work:
>
> let prop: [i16; 4] =3D dev.property_read(c_str!("test,i16-array"))?;
>
> Which is a typo meant to be:
>
> let prop: [i16; 4] =3D dev.property_read_array(c_str!("test,i16-array"))?=
;
>
> And it doesn't really work. It reads all the data, but reads it as a
> u64 (DT data is BE), so the order is wrong.
>
> And now my dreams of "if it compiles, it works" are shattered. ;)

It sounds like FromBytes isn't the right way to go, then.

Alice
