Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5AA189912
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500060; cv=none; b=h6M6WyOEpC9i0JFMGTIZI170xm+17/cC79lvaYe81OmG/JsI0EEo/clct6cbI12KwlFw40wiSpPj2P7T9IC6UMGBlAz0VIzEySAbxftBNBXN8WSFhvu7ZjDdVzk/F8V6HLtsG08D9qls0/GaQcyBhmW2tRpv5FgbFWNasg62MDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500060; c=relaxed/simple;
	bh=XK+5lo3HBdUQbAUVlBZxC7V4AlAb8QMJsjpC+v4brkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffer/sT94IkOfLlg2KHDdXtDRCTah8VvFyY6DcuBWfjXmV1CSsYBuPYBw6yIDIxmj8r0TZcuF6u3HbAZt4JKFfgyIw85D6QC0qUrdQ0jN+mUYeTEYgEB0A/RHTkVRqtXu8s3b0cj5WxopzMkk5kO8PlqIeDNx44etTbvfRUhV64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xk8NaZSy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xk8NaZSy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f73e6ed7fso2169205f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 08:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740500057; x=1741104857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK+5lo3HBdUQbAUVlBZxC7V4AlAb8QMJsjpC+v4brkQ=;
        b=xk8NaZSySvzvLkIg2A1tdUlO/BC15aQVv7gi7jecJJTPJswvNo4y9+o7XMotzX7EH8
         953Oiolq/vmneRrCPa5bbidqncbMBOSTsem84NMtdsKpKZb+aekK1v9Zk/3saPGQne3d
         0QnUbyA5uaHYQ9ASlWlLY3SkIHvf1VhHUUwNlAx4lsVoa3LNSRIWDKSwvXJGovMkF0fH
         zg6XBsHRdhEnw8lxkPbCuoI5SeLtVPWCKhuigVMusRbvXE+yI+CAwr3A7LPs030ZUHoU
         3iggvq3Uvw3vY0P6tdIQ078tWpNq/QbhO+ZWb1C16f6oy7S2kRPlF6XDhDTI78cEqcbE
         +vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500057; x=1741104857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XK+5lo3HBdUQbAUVlBZxC7V4AlAb8QMJsjpC+v4brkQ=;
        b=IldtIGHjdd6pymAES47J/AV+fwVl1JHR58ScT38vkYYuAtaSGLPA3saYE7VPdsHHFB
         UcOf6mRmuFbMJv9LAUTp4yCTpGPCbuRHtDvWYr57XOOIhFF9+WmV6FUjp7bZuSsUc1f8
         PMYyYudP7/XVl7mgCRH95y5QZq3mLUpNwJ+NfdOu6pN2VD0lWLLrCejHctRINDi9/cGQ
         AYRo9hUFD6J3+I8MiylwJhg46F1vD+fz3cSj2VARKjnZ/JilY0jbV4qe+eBRiOHtDcUL
         gT/Jgbo5/9FdLHIm5ExckXVxyolmBgKmdBzg1SsXSkdbzvG+0y1s5YmtAZnpTiLPVDD0
         5P6g==
X-Forwarded-Encrypted: i=1; AJvYcCUKLcv8xy0km84fXTQTgPXFPKxEaBRbRwY2ER6TuztOp9Bp60HiYUfSyGJjnYjLglWguNUhTnYlACphyBbadg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGtWdn64yIXBgYMgt+JyWzm0K0JdiApjYKPPxrqbcEjS/byr+q
	d3/OnjHq/68V9ZdA4w3s1PXLL1IBRvkSdCvL95pmBVlP4iq4N7J80wrstkpOCiOD5+1TktAusRf
	8/g1zpNa9HaGtDe/3SDqh6IyJXVRWNd5RsluO
X-Gm-Gg: ASbGncsIfCsO+FZzWh4gYbh3UzffMby+yaqYVc+2/ayN19cL+IxsZmKS0LwW9L+lUTH
	q0I3Pu8310zOS3By5XwDB9yrt8ABS9U7t9CWUQ5Gz6V3BY+iFruTf3eh1/HrROpuZt3WL3PL1In
	eIXrwYGs5X7Oa240CED0TaCYYhKdjhTIJVONvebg==
X-Google-Smtp-Source: AGHT+IFeOrnS2YilApBIdrzwq/ZX/O6MVfPF3KockjevL9jqE9VGA4rrlvEu3VXcwoVdvaUuGAyA9tFzp4UCo8Dc3v8=
X-Received: by 2002:a5d:5f52:0:b0:38f:277a:4ec0 with SMTP id
 ffacd0b85a97d-38f6e74f162mr15327640f8f.6.1740500056610; Tue, 25 Feb 2025
 08:14:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-vma-v14-0-b29c47ab21f5@google.com> <20250213-vma-v14-3-b29c47ab21f5@google.com>
 <20250225160603.4d4a2893@eugeo>
In-Reply-To: <20250225160603.4d4a2893@eugeo>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 17:14:03 +0100
X-Gm-Features: AQ5f1JoGbOrMtDQMPf3ikgvl4jGB3lyR6mbHfF9fDJZgtAdACnHj8fwMViezsGo
Message-ID: <CAH5fLgirLZE4MWwQ5B1W=ri+fTiriWtjJRmD5SZbKTUBR+GzAw@mail.gmail.com>
Subject: Re: [PATCH v14 3/8] mm: rust: add vm_insert_page
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 5:06=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 13 Feb 2025 11:04:02 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > The vm_insert_page method is only usable on vmas with the VM_MIXEDMAP
> > flag, so we introduce a new type to keep track of such vmas.
> >
> > The approach used in this patch assumes that we will not need to encode
> > many flag combinations in the type. I don't think we need to encode mor=
e
> > than VM_MIXEDMAP and VM_PFNMAP as things are now. However, if that
> > becomes necessary, using generic parameters in a single type would scal=
e
> > better as the number of flags increases.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> LGTM, so:
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> BTW, any reason that this specialised type is called
> `VmaMixedMap` but the base type is called `VmaRef` rather than just
> `Vma`?

I used to have a VmaMut type, which motivated the VmaRef name. Then, I
removed VmaMut and later I added VmaMixedMap.

Alice
