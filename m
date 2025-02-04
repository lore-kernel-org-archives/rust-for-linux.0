Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B260212D70
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673208; cv=none; b=lSBXLfBHgfGeTj+2x/qp+l63bdikW2GJI2HhfMt6GM4ANjMii2Jhm4vbxw5EbOmjC4a1eavgdHMzwDLgxlDIFmjMpIQd7T2jeIQpbTAVMlEqdYRwpjtMDKLltSkIM8Ui+aJHv4WsvBHmPqoWhJzciLvkae2ZmBDgrdjg4/W/SMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673208; c=relaxed/simple;
	bh=01XwQv7f8Ozj8eCNDsAHnXleMt5Xavp29Bpdgi9flQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=r7F89En7ImMYp0sy3CGbcaKt8Qf39eYpbatBox3dIWEuIf0WtpsK60LIp/T4r/O4+Wy08Zv5B7b21HAdiidGMPEnoiOvMsi2IT/7yW5dJllmBwr2qJDQ8RdE4HGHOxCOO5F3Xa4Rqd3XyyVhb24LtnzxAZq/gK3BgEcum2692D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PpTKABlD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PpTKABlD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283dedso56553025e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738673205; x=1739278005; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZIhs10/E/7OHie6ls1kLvr+5pWu5vHwZfAGymSupLE=;
        b=PpTKABlDMuKjYJLfGGw34pffiY9qKhWNXNNhOH3UiUKIT1h4U4zirf/va78aLRrk93
         0NFETPQjxD67CJ5HnCXHLJktSxtGTULW9KetUPzW0wyTjdP3ebIA6UrKNEGXrwsM4pbg
         xXatkYNL4KatI6mvyeHFogNLdAPXdq5iVZY2pwfQH24SpfLVdqCpBcD42QBRWZim4vZn
         cOKnzy3hxWat8XrDJe/9tDRyzfUkebER/bmmLfT4sUpjrLbM1P/Y5vUgIxo/03QgKRX4
         rmpAhFViaxehSkPJrG2pIChb6BFFK9zMYxgAWY9VHpN/WyMJ2TkyWdpUIW+k2zWqywyE
         kK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673205; x=1739278005;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZIhs10/E/7OHie6ls1kLvr+5pWu5vHwZfAGymSupLE=;
        b=TWsF/9dsVhQpTmdxAplDBeEQGLhab+yhimAJKAUwZchl4i/HLTbts9Y2LJtvqB+TPZ
         va5JIpVuGWcx5BfnNuh4lcJ1y4AGnMznXrcRc+jLUXtqBnWSILfz+qvRo2WUXc3h1bWO
         VDLTV7c+xihusIabfkwx5XZGP5RWufE+QnBgPWwY6gTuoOzt6+5Ye7gGRgfbaD8UHo2P
         OmteRhtdiicmvi93isG6ebp09XN37tnUDtBoJ/BnRRlbz2vYE/bMyfgwSqUWJh5PsStQ
         HR3PnFZsjgl2EVyh4OZJ4J64WcTGSLaQIAkQR1VGeVvCgbdfRoj5Cx9AKamQrv+9ZsdF
         I56Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOoz+1zXxjJW+sdYeS0aLVUye3XJonRR9cwAIkPzcmSYeBQWPOTNF0tdGBzeSP8bEn9CLHii4N54veTH20ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX28ayA0sMz+/XG41RXaHxo2VkSPjHgCW1Og9YHc8T3MggKEH4
	MlSHBl5EpyiYCDi3U5vczKDDm/p7ibpauD/SP5fBI6+ngzYvWU+1qQRC9JGUXDJuT8NE6R+pfyc
	X6atpK/KnkP3fqpcPQAqEUJPShAxmk2ZX5+uY
X-Gm-Gg: ASbGncuCYdnDODhhMt2CZ8bxULLdBQx6+Rud9H5JcCioovLCkMAAQj1Mr6S4/IfIFwo
	UM8Yr3ba1woSh4l95ypnR4gMhS2gRUyRMSva530GWHbio/g59M31iX4Y1dzc3C84mYNPJhsFwL9
	r1ToEZ2AKBmzAF28n0yDtlFFnq0A==
X-Google-Smtp-Source: AGHT+IEeMvDTzY/03dvwAU4Yl2RIOwMLjBmew1d3LH3owD/yOENufGbubw5j2/f4efwWgAcJ/EqJ0vGrCTbJSOjwLbY=
X-Received: by 2002:a05:600c:5252:b0:431:44f6:566f with SMTP id
 5b1f17b1804b1-438dc3ca9cfmr216084175e9.13.1738673205184; Tue, 04 Feb 2025
 04:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com> <20250203-vma-v13-2-2b998268a396@google.com>
 <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
In-Reply-To: <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 13:46:33 +0100
X-Gm-Features: AWEUYZk27IDYj4WV-KphnBAyzxUYJ_cTBIi6I5kvdkOoZNqc2m-BHRJ-993o8q0
Message-ID: <CAH5fLggtO3rRvTouoRmZzqJFMEjxaZGy+bcK23OPUr3TN6d8xA@mail.gmail.com>
Subject: Re: [PATCH v13 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:44=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Alice Ryhl <aliceryhl@google.com> [250203 07:15]:
>
> Hi Alice,
>
> These comments are probably for my education.  I'm holding back my
> training on naming and trying to reconcile the snake-case and upper case
> camel of the rust language.
>
> > This adds a type called VmAreaRef which is used when referencing a vma
>
> How did you land on VmAreaRef?  Why not VmaRef?  We mostly use vma for
> vmas today, not vm_area.  Is it because the header declares it
> vm_area_struct?  I'd be happier with VmaRef, but I'm guessing this is a
> direct translation from vm_area_struct?

Sorry missed this on my first pass.

Yes, it follows the C name. Happy to rename to VmaRef.

Alice
