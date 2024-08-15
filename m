Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8F179965
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708625; cv=none; b=fBsQCAfVN4f+Gu6u4codLDac0v500KENvLL3aLjhY5Rg1MXmAM8EKWV+GO+t59ZtQv5ZlPyyMVe3VASOaLyL31T7ZYHJ4R3g69esXp1bOudd2qRgyyYP7p5XEQoW+de0oM83Eg+5x2nC3Ev7u3eWUCbRzaGFL7LvhRwBaonjXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708625; c=relaxed/simple;
	bh=lFaxAIKnjHKxlZBdeFXofarPjUb1JU4bQlq7BQ4PqII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0sB8JhUcK2iMs28ALFgeXlZoQsCduqE3O0n+Ni9tWLmHIcp8uz6I7cooL2nOdH+5RUC7Kh+gwWgHJAMD+29XOX0pEa2eY7dFsiVOHrLQN5EdTsnVOKS+ZwPIArgRzjfo2vsJa4qBBAWo6zCpnHSDoTq9bhlX8r/aw69i+/ZOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DY3lNqIM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DY3lNqIM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso5566375e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723708622; x=1724313422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFDgfr18jKgjWjTVFgaR01eg1gTio0cJGxh6b91x9kI=;
        b=DY3lNqIM1qtQ7LniAOIidz9AC316Y3uGEW7SxbGvMUOelPaDtAt4SGCbH90KjxD3Pi
         QkOnDqJYNvAsiGop1cVA+5B/HLOUaMPfYhRbFcMze7LNQkFxh4CZvyGFuJsVGgHWG7Q9
         RR73e3gCUaROUnt+rnMyEwI7iduRtj2QymfZeCHu79KWzvZV/H8/wpoCiK+H98Y2dJSb
         KUntjiXoI/FRrJqnUZhT0Sc82OiQcVxTlbIm7xbg7c0QlGyt8MWep0FXHCbY5S+MRpMs
         Z8xjOeOAwRWKI9Ru8ABtBgvjzP2uj8jFpLixzsxDe3y1HGkMNb353OWeFvtNfQsd3WLj
         yGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723708622; x=1724313422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFDgfr18jKgjWjTVFgaR01eg1gTio0cJGxh6b91x9kI=;
        b=SBDoijJvJmgn4+3sSTGQgxDmRaC63dm4/hbjEDNnM+0ATxZameZtX1oLHzWT+0pjAB
         y1KBgOMJuG+R/drFNMN54Si7LqP2DhvcEVI4WyqISJUxzVaiRJmuhCl0Zwt+4VSK4EC2
         zht/uWaiZ/taRz8/fB3tRCVgPXGiP09oWrd5O9iHxa2WaWPIAC5kkvSF2cz26ZDCaXi6
         V0/CF4n+5p2ySXXxqA8FkpOsbetjAWLAF6/Qojukk6YqFQizdtWiyGAQ5dTsUPDY5X7Z
         LM73yFcD6qWRRwIllSIDRTP7ChZd3YbSwcH8GrNwE9O/wh7Cwfi0h9gzlt5j1qnckuP9
         yUIw==
X-Forwarded-Encrypted: i=1; AJvYcCUr7/t9RAKkRmxiAq4AJMk2lpiQNBs8PHmJ8dOYEfjEkIIhgRag0td6WwlqU6H0O1/jsDXvPhim8X4q3i7lRa2sBQoB+HLblJ4XRQdW96s=
X-Gm-Message-State: AOJu0YwxfsVzmUUrrvE7G0eK/HntxIfmdH0mihN9gz2f9J9WvvW3RXTg
	5d5+JkxjX62bGCWeL27cl0YgdCeVspwbaxXA+myIoYx+cUwkSQQ4NXlIVMvppRCB7UF4+yxUih1
	upntspcq/Rq2s3Ly4fPmc6AohsjI8rkAr/3HR
X-Google-Smtp-Source: AGHT+IF44XjYngCZ8eLUhbWGRFsRASvEhApV5Zb7EnuduDNmFQ2HllL4LplMRCeD/E33eirS9R2OR5QzF4QYcVIzYOc=
X-Received: by 2002:a5d:4985:0:b0:368:4910:8f43 with SMTP id
 ffacd0b85a97d-37177744ee0mr3834274f8f.3.1723708621922; Thu, 15 Aug 2024
 00:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814163722.1550064-1-ojeda@kernel.org>
In-Reply-To: <20240814163722.1550064-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 15 Aug 2024 09:56:49 +0200
Message-ID: <CAH5fLgi1xpuH1KpwSTPkiVsPsQ6YUC1=XhEusf3bXoRVyJefQQ@mail.gmail.com>
Subject: Re: [PATCH] rust: enable bindgen's `--enable-function-attribute-detection`
 flag
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 6:37=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `bindgen` is able to detect certain function attributes and annotate
> functions correspondingly in its output for the Rust side, when the
> `--enable-function-attribute-detection` is passed.
>
> In particular, it is currently able to use `__must_check` in C
> (`#[must_use]` in Rust), which give us a bunch of annotations that are
> nice to have to prevent possible issues in Rust abstractions, e.g.:
>
>      extern "C" {
>     +    #[must_use]
>          pub fn kobject_add(
>              kobj: *mut kobject,
>              parent: *mut kobject,
>              fmt: *const core::ffi::c_char,
>              ...
>          ) -> core::ffi::c_int;
>      }
>
> Apparently, there are edge cases where this can make generation very slow=
,
> which is why it is behind a flag [1], but it does not seem to affect us
> in any major way at the moment.
>
> Link: https://github.com/rust-lang/rust-bindgen/issues/1465 [1]
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3Du5Nrz_NW3U3_VqywJk=
D8pECA07q2pFDd1wjtXOWdkAQ@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
