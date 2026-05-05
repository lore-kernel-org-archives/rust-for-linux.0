Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D862737E0
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940460; cv=pass; b=EflyZHuJldFg8yqIXLvn4o0yuSdxBq97fFi61ro691Zy69ZK0Irjr+bkY8ULvOFhzo7+eqTvMV4jWlc0ZJD2BVT5kmqpm/I9NY8eUdk6Cjd22CQclMbRCIuRq6XtXCmMfyek3cxITelDjMKn/GQ9Fx81Aicjzav8lP5YrNUaLm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940460; c=relaxed/simple;
	bh=E+pfYveaOFnM+CEJD8EHmrnPFtPIDU4dQqfIWgmer30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2rzNz++RDdPLp3uyTF3zhcnJ3ydc4qfiVG19fzHw9XQlGRrvoq0w14qQbl/eIzRVkfoydO3ivAs6wYOy84VjrVBJNc/YYF+4ifsWXr22POxRudtXK8lOCKNhtc8IuzPHfuWsQ8XmbIhcGqljeDnRzwKwbHEmR5eI9Tp+9iFLLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lX9ogNQj; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lX9ogNQj"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2dd52990758so470646eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 04 May 2026 17:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777940459; cv=none;
        d=google.com; s=arc-20240605;
        b=D1gsX3Y7w53BcABpTFQL/fxYpKJYhvmqqcxrcotBNoc6jzTLeHMENEjK0hs0/Qm/Vi
         oOlkaBHJuwevxu9RyjqywL1pn/E1pVHXiu6Gdx8k8tV19vmIBMlq1iYeZi3chmFsMOb3
         PjxQ1uWf00m/+/7G04k5pPxeOUVJJAK/HuvBRefJXp0O6FyEnqZ0FTbDgXksetTyCOb7
         DbGbIFAxvwSAu2Crp+zK5tY2nocx3OCgDQwBryg/DY4ZVKmAHa0yI4SgfkYAw2mnnpAE
         DKKTmgzuVxfgKLARkAWrNcvEUG6jYjaImIe4h9uhGynk7Enlg+XKThBITgPKjd0jqwoY
         /gAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RVlZwsPw5AHVw89h+zktdue+8maFvSx8/pduyo4+X48=;
        fh=2VGR4sC4ZrZWLoVWXpZGocAG0cj6U9dp/3rWJGozo3A=;
        b=GysZm7hKmBzDFt29MD+i2sClOBiTfdfyvr2LSf1+WKr/vKRJbbWZtpSK+Lx0zufMsN
         43ZL2LnXcIWtRm7emLVCjUH9u5w1I4qH9zZoFLcF19Wkkp2+d7RuTpI3dC9KFPfRrnr/
         e/bg5tP5VjiZKUCWxmYHo3pNYwWF7FZgRJKfJTHK3DzU1YeGU6M9n2lH6Ed4CUoiuKUv
         9+Rmbupkd+vLcESPZXLJQudYWnDTS292AA+ILjLmc3x3+cfQrCQKhTie5NqH8f8LRd1S
         aaTH0n3UYLDgFL+QUEk0OW4DrLs0E/yJQzUlh6s+eJGLVlxtotKSOQthJdem+xkFCJaM
         FEYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777940459; x=1778545259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVlZwsPw5AHVw89h+zktdue+8maFvSx8/pduyo4+X48=;
        b=lX9ogNQj0+4SRyS8fXVudrCHe3cDcXykWkKqoAJz3MUYyUiI8xCd0aOUlHJ8Sgxosv
         2mqNY63sFEIz603wPcXGdrRQ7pgLOd6Y+qFzbCeUkLSEfljLfwWMreMg8YqMH3jDuPH5
         /HX88dC7OZwSj6jO80jNOFTeB69Pmt77n6T3UZise2NlYNuWCTQcVtAZazZAEgPr1P6O
         /QJD4CXVIeJJca4x9M8a0tCds7qBOOKso8H+3VjNCSsqwoXnGMCYWM0o7BkWFWMTpNMf
         x1A4VibiIVHEcFkk1RA0wrJVprda3foVy7KkGDuRAGyBUW08uWytX6HjrhjOpgDTkKNB
         C4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940459; x=1778545259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RVlZwsPw5AHVw89h+zktdue+8maFvSx8/pduyo4+X48=;
        b=pur496VYTEStYw2zBYLYf/xW4S2/bIQI0LyXpclbngggTuaci9eKzXGCstr4HP885F
         4YhHpvfOcTsD2mVXJT/t2m8XJZ7jCR9iUZ7EAHOXtkdARSN4FtJ+1zMfeJLqGcLxTHDL
         kTm6vb5JiBtVHhwVUAweRMhfZwVu5BzKPF66hdvXsNyJfKaDOGixE62RRKoRncAzl+KJ
         /LjzygJUUfSRWOaQex6g+dqAZ/rgqE/n7E0s6bKtU+x4R0foF/IlR0ZJoGu6HFv2Na+L
         G1L8nKMZpE+AabFwHkKnnJH+2VEApRAV//9u+NBDeOnDIwXDAI7LzFoKYKSvhJP5RDLs
         X+lA==
X-Forwarded-Encrypted: i=1; AFNElJ9JfRJ3+gRPsbA8IGrOCTKjVnn2EduoQxAaBUWbivdxzFB8yTD2jMTolubbKimjEw3CoaTUjPBxMB8W4NtOqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXo5k758vFmxk57hKI0lgNjN+yzZRuwuXM9eun0RY4Za5nVVWQ
	u4s6MlUs5Gp1aLljwQLPLnUUhf8jnDHhw5ZuAQPFUaTwtYTsQ1PTO0QiH2mcCHBs839s5cOaG9s
	n033pQgMXI4u1V77IfQX3DdbwPJZwQZ5nrO/JpSY=
X-Gm-Gg: AeBDiescqVhBFa8aqtfDz4OktzT2f+0IzdINVgamaLZ+WYmcN7bg5rtkxz+KjftOIhS
	TCvZHYrApOwa3mkLHL/CzXJMb8F9Su4R2r/ZvNSYGMs8G1r7ZCxh1pZaOTpnpBPRJ0Fn7uqte3/
	StWG8q8oEIDTL1/DmqziGYjTxiIf8HrlzfPMU6YG/7H2QujA7lUCiQQA0LXzv6zsN57VzAhMKIe
	NOXvNNVEixuGdJW08RoqWk3a5b8SAGWOH4fevNlW076zjAnAA6MWMIAMDJisC7vKM/cKGIl4aMV
	gtkCrzM1IqB8afA+L82E/ewIhiZeu2l7V2TPpXKLoDlXNlQD/f5nxJcEV+M0mnhJZfyM8gnw0qI
	QWs64hoFm6jMLRGa+VBjaMFM1yro3+2COmQ==
X-Received: by 2002:a05:7301:e25:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2efba5a5b01mr2724385eec.7.1777940458622; Mon, 04 May 2026
 17:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
 <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
 <20260504222637.176edc7c@foz.lan> <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
 <20260505020831.698650ec@foz.lan>
In-Reply-To: <20260505020831.698650ec@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 02:20:45 +0200
X-Gm-Features: AVHnY4KSxlk-N9KA9mnQzV_sKDA6WOYwJuaLLhMYBFqpfvIP8kEX-zogb2LEpB4
Message-ID: <CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 2:08=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Also, with time, maintainers may change their employers while still
> keeping their maintainership status.
>
> So, I'd say that whatever is there at the "P" entry, or where it is
> located (either on a ReST file at the Kernel or on some external URL),
> it should reflect the model that a maintainer or subsystem community
> that actively participate at the Kernel development agrees with.
> This should be vendor-agnostic.

I am not sure what you mean. By "vendored" I don't mean
companies/employers, I mean that the file comes from an upstream
repository:

  https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md

Nevertheless, it is true that this really is a special case, in that
the upstream project decided to provide something that could then be
fit into the `P:` field.

One could say "let's ask them to do rst upstream", but to be honest,
it is simpler to just put a hyperlink to GitHub's rendered file.
Markdown is anyway a better fit for their file.

> Generating on the fly is a bad idea, as when one uses:
>
>         make O=3DSOME_DIR
>
> It is expected that the original source directory will remain
> untouched.

I am not sure why that would be a problem -- the output would be in
`objtree`, not in `srctree`, as usual.

> I suggested pandoc as a one-time conversion if one wants to migrate
> from MD to rst, as for simple documents like this one, it works
> fine.

They are the maintainers, so it is up to them, but it is simpler to
use a hyperlink.

(The file is trivial, i.e. the conversion can be done in a moment
without `pandoc`).

Cheers,
Miguel
