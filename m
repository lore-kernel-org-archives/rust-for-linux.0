Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C61130AC8
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 19:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728157702; cv=none; b=Uv1+QkC+xoz9c9C+DdAcKcU2rfxuitW5oAH2kkz0/y/9LR8t6BvqILFBm7IkhD3YIT7IOAr5wMh3P4/ini57PUOmsNF3V0khz6GPGS/YXKkCNXWwm0lBI4TYlsG1yLlORo/gHC/zrUfudMv1/5945IsSoOVz3ce47FXbLrxPwDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728157702; c=relaxed/simple;
	bh=XRqVWZXhjuJeb0BLst8E0uVdxasgSte6+jSFr/uUMqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjVNnVOEGQ1seSoU1kipSyLphCJPwsi7XmDkPK9/Xk+zokfAX5fYCUqYs+fCbg1ktcYczdv1XwKXZwCuiBGCAbjnGM6jkkMpMOfsqksZfvlqzM/a0uhzAKOUYbW7Pn1yNAMCHisS/LBwFEpGKWfbI/iHDr7u3S1ODKB9vGo+z68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5N2s4+z; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5N2s4+z"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7cd85502a34so530770a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Oct 2024 12:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728157700; x=1728762500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AGdmqkwHcI+OOUTrbsHqsNqU/JhroJvkU9YGvqJ4K4=;
        b=G5N2s4+zYB2zep7nKmFiFaW4t+jhnU8BFsPcMu4cw86eBtZIdXtDHAiTe0zlOEBP+n
         /XHAxnJKAYaUx012EiU0Cy1CnzeGoOCC4RtM5yCqiWsfAMahKeQyi80wuVcFhrJynXrw
         uPuoHFpBUV14dbZ1a2r41QddJ7BtW0gVNDomMSVgFzHfCiW43/DvtILJuYHW3ODQQ3Y0
         wWuKb+s2lpPbbWCsg3JAF+FfU8I+HU4gCmbgKavV3umAe8hyN5dKbgBFTl5/rbbUdfGM
         k9IX780frqtmPXFYRRpRlriSGCvDZ7N3qeWSw2qSmeb8Pg4uTwH/cPVQTVm9ExHXllXY
         v1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728157700; x=1728762500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AGdmqkwHcI+OOUTrbsHqsNqU/JhroJvkU9YGvqJ4K4=;
        b=qHPa00eTW4M3r31cXFN397a8rcmjtfldVqvSoI0reoDItFLeNHDqcV3JTED673wU5K
         hvSBu4fK+ld29MMmXwbRXsiCYSmnHaATYlz9/HHIR9DbYS8vsXEAeKldwttk6Hqb/kQa
         FNW5H/o6PrwI51XUaVcEFk5RmwfnZsPPAwnw8OIKlPwz7WQ5prPA2TiX4s5gx+g6jfI6
         aAjtMunN0IUTn5ME2qfrniksc2CginlRv1S7K0A98nDxY0Pg3ZsJ+5VFubN+xjjSF6Rb
         a0ryA7wWgjk4dEoDtYrF2yTOs4MIo/YsoKbtqzYgO2hBnHF4zUJ1yXD+r0W1XNWKV7Gb
         OJeg==
X-Forwarded-Encrypted: i=1; AJvYcCWy5kW6AHtgfB/lb2UM3I3vnLlx7t5PfcOlZQg1iM/6mqBIZsp7XBBreLFA85s+6DKEFN82tXmivrY0UtCEVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7v+7dQa0hmBKJSo08xp/1P3ho0+JlsN6RnpcxlbYTLDlUCqTu
	CGTOpSuKJ9RowFm93uDj49oEPRRnuKXqLTLhL2Y/hmDUaTNkEQCs19/SGwX5dlpA/jIlQT3Qglh
	oRcWs/TVqEbaGNctWC8BMZ6hcyh0=
X-Google-Smtp-Source: AGHT+IGrzVgpZAN8saEpVEtRvINf/WVtwgiVY+TAWuvm6JK9WN25VV6RpLIlkgtlA9sL+NsO977LGQWowK+6C6ZvUhI=
X-Received: by 2002:a05:6a00:3a28:b0:71b:64c:813f with SMTP id
 d2e1a72fcca58-71de2479d53mr4503094b3a.6.1728157699974; Sat, 05 Oct 2024
 12:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918225115.2309224-1-aliet.exposito@gmail.com>
In-Reply-To: <20240918225115.2309224-1-aliet.exposito@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Oct 2024 21:48:07 +0200
Message-ID: <CANiq72keixz_kVpUQMEFQcgewwrjcA_Od3E5-K9jF_UYFrg2aQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: Move unfit code out of `rust/kernel/types.rs`
To: Aliet Exposito Garcia <aliet.exposito@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 12:51=E2=80=AFAM Aliet Exposito Garcia
<aliet.exposito@gmail.com> wrote:
>
> Hello all,
> These are the patches for a good first issue that Benno Lossin oppened
> on https://github.com/Rust-for-Linux/linux/issues/1117
> According to the issue description, the file `rust/kernel/types.rs` is a
> rather non-descriptive, general file that contains code that might be
> better suited elsewhere:
>  - `ARef<T>` and `AlwaysRefCounted` should be in `rust/kernel/sync/aref.r=
s`
>  - The `FromBytes` and `AsBytes` traits and implementations should be in
>     `rust/kernel/transmute.rs`

Applied to `rust-next` -- thanks everyone!

    [ Rebased on top of the lints series and slightly reworded. - Miguel ]

    [ Rebased on top of the lints series, slightly reworded and removed
      unneeded `use AlwaysRefCounted` in example. - Miguel ]

Aliet: please double-check that you are happy with the rebase.

Cheers,
Miguel
