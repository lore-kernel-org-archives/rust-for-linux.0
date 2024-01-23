Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD9A5D916
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706011784; cv=none; b=ZJwyHznjbdgXBfOSvxHQKKk2+1mrak4/84TYjacFRbHWaMBJyfVvy2PuPYU/VETFds1Tc8CTIrrMtF+6x7HSluARI6xg+CTrUP/+jU0eeSjGxGChC95petu5EZYneH1HOVHrbwanoLncAdX1nTB5/x02fmjR2p71VM7skinRlS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706011784; c=relaxed/simple;
	bh=wJBbOIj7StSRapGPuZsBbamMou8NHRIuXtD3RFK+GBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia0wyAOpPM7YOrU9FIozmmWUNozrCzJA00vieHoM216HRHcZUmBqtRITs2veLcl1TQgpIvNCUzs+K3Gij19Qj4gGQv8cvpDGowjWkHaR5XG3bhbj/mFt4kRXUjQvlgFdjLCN+4C5SvP0ichyY9ZgYoKt3Hj6ZZVLm2yy1PctF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0WjuBUW; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0WjuBUW"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5ff828b93f0so36318787b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 04:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706011782; x=1706616582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmHa8D20z7qZeKmaQ9pREEPHyNYfhYC8S7EOHZOOBVw=;
        b=j0WjuBUWJQEuhGfgW6QWBLg6piF164I4vUNORNA2eKggpDGtFtcpKluYXs9lyPcbG5
         +Uvg8uzITjk2AY50UWh3Icj+wQ/1KdDGr+AclAdCEAZj6CW6juaER8JnyR4u2V66s5q8
         jE4kIR7/AVyaQ951EmbN2YofC64MD/9CtkF8WeX5zszXxP9sxFjsAZ4MVgJbS0GJ7NOV
         74PxyhjuVxARlZlNSXfXqU8BcaSD/H+kWQQHPxWplNfTtdmWWYI+jhY/QdR4DL5GQrcL
         /jhhkqun39OYDaMGq2OMxpmhZv70bqlDNdbgc2EdcmgibQWUsruRe8kCwDM8pQis12uj
         zlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706011782; x=1706616582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmHa8D20z7qZeKmaQ9pREEPHyNYfhYC8S7EOHZOOBVw=;
        b=l/v8Ba7sQh+CuA0yfW3Pw2NAscSA25G1mLJJieLeDYtjzvKno95Drz3wV8/wgACLjw
         +rsBQvhl1BCn9R7xUvur1OrWP6TzSUfBeH8lgrkX3ZC+khGugt7ACJxQRHagSKy7Umzr
         Si3H5Mzu5sMss+WZKtPd+xu5z+cIjoz7lISI7fMOvNoR+z8szXsOKzrAVRBXp2aPeggt
         HnIylfCBQqWBpI8Q3/+PzHrkK/XwsdqciCn6RREOyO6zqt5jhI1O0m0EOsjFLG4z2Pb7
         9Zy8OzwEVgowFag9sa6c1zqQghu8WiZKr92yXVU3RSgqFcCWYK8voU69iPUM+yUReRVu
         ugZg==
X-Gm-Message-State: AOJu0YxyiJsDjGFYKwTu/q+kp5dmdpODSIfJJtU16WFusN5m8wW0cigO
	J8NDK6MjcOdScQ1qibcxDlG3Zqp6xuYW1UyC34molVgQRlflhidDPmAoxqqMZFxasbMkDuRZN2Q
	1SU9x2y6xnD0Wrm30wqVkesaCIIQ=
X-Google-Smtp-Source: AGHT+IGiNEoIsWBzDkNLcoOM4hbdh5j5+mQ8b8Xivg+x8SNfxwZb5Vw4bd0qsDIeyt/BXVHrN+aMt7TtCzON1aK6D+o=
X-Received: by 2002:a05:6902:543:b0:dc2:1ffe:92b3 with SMTP id
 z3-20020a056902054300b00dc21ffe92b3mr3210507ybs.81.1706011781757; Tue, 23 Jan
 2024 04:09:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123082746.18284-1-linux@obei.io> <0100018d356f0fa5-1e771ce7-1787-4330-bc1e-0d7ce240288b-000000@email.amazonses.com>
In-Reply-To: <0100018d356f0fa5-1e771ce7-1787-4330-bc1e-0d7ce240288b-000000@email.amazonses.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jan 2024 13:09:30 +0100
Message-ID: <CANiq72mEdMv_sc5ps1z8WY6XntxDE4ytBqXhWyw1vKBqUqwO7g@mail.gmail.com>
Subject: Re: [PATCH] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Obei,

Some extra nits below that you can fix for v3 (since a v3 will be
needed anyway due to the compilation error reported in Zulip).

On Tue, Jan 23, 2024 at 9:28=E2=80=AFAM Obei Sideg <linux@obei.io> wrote:
>
> Currently `ForeignOwnable::from_foreign()` only works for non-null
> pointers for the existing impls (e.g. Box, Arc). It may create a few

Markdown may be used here for `Box` and `Arc` since you use it for the othe=
r.

> duplicate code like:
>
> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>   None
> } else {
>   Some(unsafe { T::from_foreign(p) })
> }
> ``

Triple-backquote here.

Also please do the usual indentation for the code.

> Link: https://github.com/Rust-for-Linux/linux/issues/1057
>

No newline between the tags.

> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Matt Gilbride <mattgilbride@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>

Normally you don't need to add a Cc tag with the maintainer that is
supposed to pick the patch.

For Alice and Matt, did you have a particular reason to explicitly list the=
m?

> Reviewed-by: Trevor Gross <tmgross@umich.edu>

Since the patch changed substantially, you should not have picked the
`Reviewed-by`, i.e. he did not approve this patch (in particular, he
mentioned this in Zulip himself, so... :)

Also, please note that you should indicate v2/v3/... in the title
(please see https://docs.kernel.org/process/submitting-patches.html#the-can=
onical-patch-format).

Finally, I think Alice's comment should be applied, i.e. the
precondition on `ptr` only applies if `ptr` is non-null for this
function, so I think we should add it.

Thanks!

Cheers,
Miguel
