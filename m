Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962A23D647C
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688743; cv=pass; b=HJp4zN1zSz2ms/awcWQr84g/HihgP1/OqiVwAFYJrDnAwSVj52PgkmtrNdHI9+R7bI1iAGqmcaG+FX9kSwIG/jdAlx0a41lOd39+1lV59OUINoNHc3UF2YofYRU39Kk0LIx4dWqHa0xsJGi0CqqdFwJPZ0aXMg37lr/ZZlGbtZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688743; c=relaxed/simple;
	bh=CF2ikandtVIT1owgnKtwBk+vrwZcicDlI2rfdeet7vI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBNqlvUL+u0ayzyAJ8cpP9dqir6f2/+EJkqK/44ntsuNZWBGDnEFp0cB+tB7Gha+UyfJmbZwGwq1NSQlyCdpOv0Z36uV4Auf91VE6QY5wGvN5SQenvI9nwXJtK8lHcUFyZPZ9t2ox5oNJXr/fRPaURt2JljlldeZ4oQ2WzJHsb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/8F5E0k; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/8F5E0k"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so692983eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 02:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781688740; cv=none;
        d=google.com; s=arc-20240605;
        b=NCu/vejU/xg/jdphcSdIAviz6GbUcztPlj0yO/8xQ6CHw52cg7A52EGdE2ywTR4KCu
         iX1rc0oCo36uZjLEp67vttDUmRX3PISqbbtWd4bXZSwUNWWkiTho+hGmS8kY9dpi6CUY
         AAZLNWwy1oCDZTrWVdUb43IgQp5l5LQ02gRwG4UWDUbIsy/2/MsbHzireQZZzvlLiEyJ
         nwFi7Cegdm2SEh/93hz99VB7troUYwjtdd14KnHz1FaqKLGbcIO/PTGRGmZiAarWM/3I
         w12PBknwYPY/V7maqDMAvv0W77eRvoYaI+zI+7U+fkriDgI6unzAxOcbVgyZBZ6pLH8e
         56eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+M2u0whYbtR605n6sG4R2CUdyrK3ztIkie7LjFmQ8N0=;
        fh=uYgel2NnzvXFJAlNgAbMm0isaHj+n6COgHmREf9fn6Q=;
        b=IywUBUgEiLeoQDFTOwIufG9jNuvSBYyX4h8XGgjJ36VYOolY3YlCvfxk8PaJlx4/Mj
         jCJm4/+31JkZ8+pzDZg1oumEbqVU7PrMFnTkmDk5BlxfQQtPB35fJ0NYSIojwOsOk9xe
         6WVROcsRcCgQsQQK0EMvX3Qk2OizDqJ1kgqcF8AiRIKzA/hsgoLQLFZUj/e/YkRbtAP7
         /PyuviypmfpgF9XhQhUT3lcLd5ogLx94M35fgRM03VwSpY3x/LKKIEXJh8/XX05je7EN
         8vI9nxlG0F8rvAvC4EBDLeMD9nGrerDDm512JIsWvN1YBfL4CDhBgf5iyH2iOWVuePzd
         FENA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781688740; x=1782293540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M2u0whYbtR605n6sG4R2CUdyrK3ztIkie7LjFmQ8N0=;
        b=G/8F5E0kZfsdROR+CtlTQ2tv4rDzjWtyQN+AGYvPHtdr9XY9qy7UYwZE1hrPDkUVlk
         ATgkj26J9kqLtk56XA6FnHSy5L4k/dkUm5Ogh72X13Jzh1RHxgn2JXD65ndtA2rCz8d0
         puHq46jG+pIyQHrjzFiSizmniDMZKihAdr9cBWcU3w31jrTYmFyLqSOIOZVmEa3D9Yrz
         oy7Id0tibTmRPqxtOMp9lEFdq16zNzl/oZCWDJJck8B278PgjASTaFzbqH+qM5zNCwRO
         bce4fOM1lXvQj+PJRekDPQJFUJs6eT/2JuFqyf0tbhMswKLqMcAk75QDIf9QJhPOzNou
         qaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688740; x=1782293540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+M2u0whYbtR605n6sG4R2CUdyrK3ztIkie7LjFmQ8N0=;
        b=nqQxaQKAW68TfJwOwkej0Zqj/SuHJPXhhEL0FjhvHNExt99gqoxoPiut78nWSRPgvM
         xGE/e/zjf7ufA6s7ARSrmdlDLLRBbajV1aYaBmBfTKGTP3CHvct/HGabE6b/QbH7xIxX
         TPxxIK3GInAJ/BZnlzcBB8HQc66DjuhWSJzct5j3n9wKQAeCIsBnoORYBUoRgn/C94xD
         UyFadnBTIRSCGCDOQ/rG+kw5f+HN0vWmQxhOnchhCrNyUmoNSz5KiGPd+km1s6sWv+8Q
         UzjfjWjx3jA5uJPfUu0Bvv/E5H/Ae7oivOMR0dlWl1yCgkgwFuJuQvRY8clM9UcrEYMz
         q2VQ==
X-Forwarded-Encrypted: i=1; AFNElJ/90jEZ7frKf6Y5z8hOQnQkb96jtOENyXhNBBc/mJ2Uvw8IGmLism7Y6G8oJWb1iuTjNlg6dIGhNO/9ZruVOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQyY31GRfef53RFv/9tLrTIPbQQ/xf7Go6ikYQ3AYyYTh4fYa
	lyrwrZsH+ae/feFLngBngJPL6bnP97h7b49AqtntTo1PMwASsmDr4pJXdMFnmpdZLFkiCHhimXU
	2RmIATcux4ZJoW8x3Kw1Y7eOvajdZGdk=
X-Gm-Gg: AfdE7clY+Jrnd0VZkQO35SP8jqfFjr3vTo+TAG3Pr/NAQRHk8PGwSZodkBHebv6L9Eo
	3/NDGsruqtVwyzbANXPIKdBYixHs1+ziE0kMAYByfQsseXT6bBQvDBwpD/lsf/Mlutnes/Ka8uG
	jLq3cVPmTuJCjwWmr+gEPJba1Iq81ErBYKSxfEq4f60SJZStm7Nwo16UReioDRkEFltKM8N5Rxn
	sXy6SA8sLRFL9Mx23UKWTsFiyX8uYvb2pCuFU4ViBfc8OLpWqftMh26wPAS4Da1hzZyXZY5tpyz
	Kp8uzQM2VxXzcfGArzBtKfucBoqEIEiSOaZuuHN67/oko5d8T8EVDoiUgRz/LoSQJQqLcvzZwY8
	/Tply7vyZssl5
X-Received: by 2002:a05:7301:100b:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-30bc9f179cbmr752260eec.3.1781688739625; Wed, 17 Jun 2026
 02:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-configfs-syn-v3-1-3292fbc5cc32@gmail.com>
 <CANiq72=RX5V6W+1tj0GHxZusrk5OqYbZ5-xV=wvSssrx_CWXAA@mail.gmail.com> <75552e2d-0bc8-40a0-b783-fba64482aea9@gmail.com>
In-Reply-To: <75552e2d-0bc8-40a0-b783-fba64482aea9@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 11:32:04 +0200
X-Gm-Features: AVVi8Ce2KN7fJSDwAaIQQF6892I0cepUA61wd2hQu8bQ0ZSAIWDKWJ48saLTpEg
Message-ID: <CANiq72=fUuX7fF1=AQ12ahYHwW7k2i28Hkpo0TtUhwV7qeojQQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: add procedural macro for declaring configfs attributes
To: Malte Wechter <maltewechter@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 11:13=E2=80=AFAM Malte Wechter <maltewechter@gmail.=
com> wrote:
>
> As of now doc strings are not generated for private items in the macros
> crate. I am moving the `parse_ordered_fields!` macro into
> macros/helpers.rs but this means the doc strings are not generated for
> the macro anymore. The `parse_ordered_fields!` macro is a larger helper
> function, and the doc strings are relevant and helpful for macro
> developers that wants to use it.

If it is private, then it is what it is, don't worry about it --
developers can still read the source code.

But, yes, having a render of the private items is something I have
wanted for a long time, but as a runtime toggle, so that it is easy to
go from one to the other (and without having to have 2 entire copies
of the docs).

Please the entry "Private documentation (perhaps as an extension of
the private items/fields toggle)" I have at:

  https://github.com/Rust-for-Linux/linux/issues/350

Upstream `rustdoc` implemented an MVP of the idea via CSS/JS in this draft =
PR:

  https://github.com/rust-lang/rust/pull/141299

If you want to help on that, then you could try it and leave some
feedback there! :)

Thanks!

Cheers,
Miguel
