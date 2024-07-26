Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A6433AB
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721982769; cv=none; b=qCGOLV+/bhveJBXhlX66yCYA5um6DDOQOoaDPptmKBoT6gpP8srlVxEI2VIlA0e06Hac+rGhajEbmwpgekFgc1vh8bcmxGXay6N0QI8Qtxr5Hn7uQWepcENBVPQpTluVJ3L1m/HtNHYVXLYA9jVSnMLaoKTS2kf22TlkKFHGc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721982769; c=relaxed/simple;
	bh=vwKVjdvi7q/mOK8CLeQJUjtonGZ4eAyz4iuobreU3q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7H60Qyto6Y1wx/2LOdDSR09BJmba2b6bPtZhh5cWZ6TCmKfBYbBICuIMB9pGkJrIYhkj8wCuS2iEc3awGbMztS8BZZvmjGXlSHFAhgLMWAaLFGOg0XzExYIkA0v8MEm0UQiDhF0eDqd60/MJ1LvcRE1LfqEufqdnSFri1j2dBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IJ5oUVrP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IJ5oUVrP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so13420075e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721982766; x=1722587566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwKVjdvi7q/mOK8CLeQJUjtonGZ4eAyz4iuobreU3q4=;
        b=IJ5oUVrPdbbZ4gm8AQjTbZwG88gOFmXuzv5a1hOD+h/xmk7oTl830xN8Jw69YlkC6B
         9vdhoFm3ZfzhE5xK2+kfB/tFYS6QllCTeyNmCx8Cp2bV4Ep1vxQ3PGQUP/cRsVkMZYEl
         1nxPCE18PLB23KZs/OEqVpEQ9oEgqDx2WSULHG+L0HsB/qcfTwQp2dL1Od/2KsjDht6t
         YyxUNetri99/OpFXsHanJht1SfZyOJnpcdGog4GyX+Wx5L787FhLotVbwOBy0DH1XvvA
         Iet05AZq1EMMXIpFLLsywRAojFSBfqgLImEJniKNM45hIrMNLc7/jTpwBs8wnxcpNidD
         9YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721982766; x=1722587566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwKVjdvi7q/mOK8CLeQJUjtonGZ4eAyz4iuobreU3q4=;
        b=uWwi1AGiDeuio67nqUaTZMSWJ96+0sNImUrlsgW7+VBvY3jUWFJ/Jh8OegbbXpGo1b
         frx7OXjP3kvbDw9nNNnrT8QDyPWuFgo/nKb8klWcOuQza09EJZzHQTHHS/XUbjx1Af46
         VVkcCXapHndCpPBptGTBbG7mTzvZEmiTPDZYiwRTRpTou5o51N76pWrdt3T1fV+LHorG
         swhQTPBVKnJ8FLPeKsG+r/7e3rxpQNmHXZqbadOOZko39wwuiRK78Shz3jI8msIydM9f
         Fwj1z8+kWIZ4w1s+xOaI8I1MGGTVU0zcYyW9r6Eyl+CEOn9BNSz73liFJv6MmfVRtUqm
         A7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWpSTds7smzrb65OqpZ4FJSFH/zLsDnYVjKsoRdZMgO9sZ5w1g2ikpydcbuTiU0cqsUBqoUtjHkaLJipfMZQvDtE7TRPqFIsHMNOiaQwrI=
X-Gm-Message-State: AOJu0Yzq+ZOYdQYhStZGy1cCEBYooN5XINYKRihTxDODKdWiHewqWWZR
	5dtVz7UQtN3LH/e9Z3nNFnCXdMX2oHsjLxY50N262F3GyPxxCvmL4gAymB/2qHp/oyj1bcx48x9
	/1ogdJxSB9bySJSJ6pdb37nTnTSMAlwQ+aT1E
X-Google-Smtp-Source: AGHT+IFw9aEiWWbNWrKSwIfNsoFiq7Z1Ie3/K23HqXX8wAt/1ZIGy3iHnGySvW1LYIP+uZ2IjLERURUQtmKWmr5gbqE=
X-Received: by 2002:a05:6000:1544:b0:368:557a:c64d with SMTP id
 ffacd0b85a97d-36b319d238dmr4990492f8f.9.1721982765950; Fri, 26 Jul 2024
 01:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-vma-v1-1-32ad5a0118ee@google.com> <3bf6bfdc-84af-442a-acec-a58f023d1164@proton.me>
In-Reply-To: <3bf6bfdc-84af-442a-acec-a58f023d1164@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 26 Jul 2024 10:32:33 +0200
Message-ID: <CAH5fLgjfiE6xNpKVBAgXu=eFyE65k+RxWqNt10J+44pK-mJgTw@mail.gmail.com>
Subject: Re: [PATCH] rust: mm: add abstractions for mm_struct and vm_area_struct
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 10:11=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On 23.07.24 16:32, Alice Ryhl wrote:
> > This is a follow-up to the page abstractions [1] that were recently
> > merged in 6.11. Rust Binder will need these abstractions to manipulate
> > the vma in its implementation of the mmap fop on the Binder file.
> >
> > The ARef wrapper is not used for mm_struct because there are several
> > different types of refcounts.
>
> I am confused, why can't you use the `ARef` wrapper for the different
> types that you create below?

Well, maybe I can, but it means we have several wrapper structs of
Opaque<mm_struct>. Would it not be confusing? Could you suggest a
naming scheme for the structs I should have?

Alice
