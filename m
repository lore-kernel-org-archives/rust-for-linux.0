Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D9302CDE
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556586; cv=none; b=n681INPUgz1xGI/+hAifpsl4DtYVwmAn6Ay5ZExrSoyi4lnp0HD1mUHtAgxtkASvkhOvRPcjdaR5PYA8tbsaMzjXfBJDa2oruoI6CHu9/MquA4EqnUk1orAO7vzHDISF5JXTQ9Ra2ZllsYpuGaOfaYVXAtB1aGERMldXR+KWk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556586; c=relaxed/simple;
	bh=PIriNEl1QINcRygfPV3g4fvxTFN2kEqSnPbk62zLE6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8msLnEbK7Z0bRNqY2xR9ZlQTf4hHG8oyQRzimzcRlz3TWCmpMdrsPjGv7B81KHVuXxmFBWc1ylyxlw6SDISOa8PFaYNdMRKTU7zo244yetQfFAB7wUpu2oEIYQRy8t9pG7Z5g8qF99KkaEeoz9cPMuD91oqNWOpfW7ajHeBH+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKhj5fJt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKhj5fJt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-637e74e9104so3442094a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556582; x=1761161382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ksEMbgKeIvUZBJjpo4N52YV+1hwQuAsDSMHWnzo/ss=;
        b=TKhj5fJtrNz4feapeW+0BK2MENorh0xfEIf4HeOhca9C4ugfPEesr5Rvj/9LJKP265
         +Fv94g6YH9ge6yTTOEBaxpfjboKa6lVggSOP8GyE15m0yJZ7w72JCAdlw+kcfVkZQRfE
         aD/g0AbzPQYM6a8be7MQ/q6yuPiort3pyrIOg9kHtQ3lRxu/wzwhKLcpyHYxjWf66tcA
         5D1GiEJuydLItL24D53kl+Gg50c6LjqVM6l0E2++vjF+tcaF68PkusKomjrlZOBAViWq
         AoVA7IOpVVj8B/rBZ34p8sV8lcA7+Nxw6yW4GPF188pfJTNfmXkCXhDcuY1lOI2Frn5G
         2b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556582; x=1761161382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ksEMbgKeIvUZBJjpo4N52YV+1hwQuAsDSMHWnzo/ss=;
        b=JthbNdwd94ziQw4uMfwLJqLItVoUJxXRsf9s7P5Z/H2eSjkfaNOfzBeT/u0fHETKcz
         pHrNM93CukgHVimDE6L+Mnk81uraBuGre4tvmv25UOFre+Ohoc7CKrjIIlISTy5rldsq
         5UhmlHLM0QDMUJkesQU22zK4snnE8RnJBubCs/3bHukTskVprjT91KNFWLkGTyZsnEVA
         xRsWncqYlwZ9ZzusLTJZf/w983Talst1uzhtk+Z4xsIUT1cNOf3uTKxNGxWv3aac8w/K
         dG55XGcUG68ANz8y0cIGd3so3iXtclkWHfv2ATwGagv72lnjjibkqZn3+hOZcoETv4Or
         pKCA==
X-Gm-Message-State: AOJu0YxNTBUVdNEJ5ulPIbUfufuPISDbVdRuGKbrlwO3u8vJSTXv3aQb
	qxoZFldivulmzRk2OluAFWhgfW50Cb+B+UoqIG0CZKbybjsTc6u6YuuuA2N9u621GSRmgcBj2g4
	pjtHHSNaveHM02VVdsIwcNRt9TOAZ+LU=
X-Gm-Gg: ASbGncsRB5lOIPOuhNI0WLq8kvyIDHLJr0n2ngT5qAKa0vzwmB5bZvDcF+AS/+xz2fQ
	kDIIJOkStD1l7du8VGf+c27BUjk6CAyRFyJSKSaVFb/MiODECZwYyjNQNSqMlQXR4NT5otm39wZ
	kUaQ5uPEOnmWJH6Y0zwh8OXQpXd8217UD8BaYDfUDbxYHK/jrVpwEg1aRUqOV+5lhn/Ok+DQuPt
	c4OPCpQ4OE+I5ECKwe8ooVheyQJRipgPyR3qprAz+qWJIEMbaXmuKDLcnZuIa+X8eUY5Acss/of
	5AbWhWf3oeAIUZEKJtwNz1d5tdlEnaD5y7ej/gN5atP8093Ss7YVON6pT47WneLIIEtY3w4d4mS
	sHaWQZMQHKezeXrNmx8DioNhe8e/si6Ld8ffGwuFSqUh5tGWnt4bd
X-Google-Smtp-Source: AGHT+IGtfw5s80CNJkem4TNXL/X5g30lTuJ5LAlCBEIiiOXle0xqvtrIM2mLDYUfLHDwkWL5hMYZfB33sxDVPZ7wk+M=
X-Received: by 2002:a17:907:5c8:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b50a9c5b352mr3117730966b.4.1760556581571; Wed, 15 Oct 2025
 12:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:29:05 -0400
X-Gm-Features: AS18NWAV3lBjrdoX5xVPTxh-gkxtXMZeTFZJaDEZjzjbFJTQq56Dz3hw5BWoKLo
Message-ID: <CAJ-ks9myBRqJJEErMU3Zt5-nx-AJ=D=gMNf07e3jFFj=SH_QGg@mail.gmail.com>
Subject: Re: [PATCH v17 06/11] rust: alloc: use `kernel::fmt`
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 3:25=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> This backslid in commit 9def0d0a2a1c ("rust: alloc: add
> Vec::push_within_capacity").
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/alloc/kvec/errors.rs | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/er=
rors.rs
> index 21a920a4b09b..e7de5049ee47 100644
> --- a/rust/kernel/alloc/kvec/errors.rs
> +++ b/rust/kernel/alloc/kvec/errors.rs
> @@ -2,14 +2,14 @@
>
>  //! Errors for the [`Vec`] type.
>
> -use kernel::fmt::{self, Debug, Formatter};
> +use kernel::fmt;
>  use kernel::prelude::*;

Oops, this one is not necessary. Just a style change here.
