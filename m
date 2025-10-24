Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C6309DAB
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761297310; cv=none; b=kr15T0mO5IRrk9wp4t5/DxILUw2mt+EH4isFfdJbk8RK5fqW+ffhsEVz+3FmWAg7QdMILTb9rixZ8MqPRjH0/x5lRbtbye13/MJH2eVQisoT9mEkdRe7i6mIf5NJ5cTml9gsIXA0IcPR06HUoiXOcp8R5nTYq65yyR9i6veov8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761297310; c=relaxed/simple;
	bh=gp5Egq5ameAXdwClzXG04EH5DhuqXsgDtinzoznDd+g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FrIq7rIzmM3QgFqp78BtO1pX3D5c/jr0FHjEKze3yb+RzepxtQB5JfIsWpmMlg8ZsOWRY9tEUzm/nev1c3XVdU/plfwAA2Wtu69mhUO3yt8+VZ4HDAsLuH0Kgq3oGrwAlqeoDYyJdciHBICau98ab1fVAXZJ8ZEhPlS4Zu5vj2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AxuVyveK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AxuVyveK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47114d373d5so13976255e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761297307; x=1761902107; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X970IEpCywFRTIPVLS0XVbTWzubcRonA7RRkNc8xdJI=;
        b=AxuVyveKs8OeK4WSjiI+5AOH4ycn42rwo/gaEXgtEhzSta3i/Q47FmzNJ4+ttTeI0B
         4tv3NZms1IMvEVhgditEaW2GFe9BJ96JMewiiokvFtM4jl75ISUxeO7cip0IyimHRN05
         xU7d1ln/QZUGbmlfpNzPCezr+iQBGVOEIYp/ZJasxeuqoTugirk2/bbGM2jD30V9ECja
         DjVD1/S+LLe4VM1oK4M4HuWYOkt6T/KH7Q7fo6ELDwapSge9LYqyB/UYHhy2glnauHfh
         RIdZilgGwzSNXBPle/O5IBuhgLJIG+ngjHckZueE1TsMTuiK1qFwlRiXp/U9Rj28J89l
         RJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761297307; x=1761902107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X970IEpCywFRTIPVLS0XVbTWzubcRonA7RRkNc8xdJI=;
        b=ZiMPXqDRjohVRDE9tvzq6qrNMNxx372UEZdHGeAgwX67qkiW82WlC0IeNoMxOAyA87
         hnf4wetPJEtol08lg3V7vFjGg6woQ2PPrdEDx/jF1osY946VkMXw1bv9dY65nZpUEPpB
         bXm3YzteWHODXSqrU9oZ9uQ1/Rj7CvakKLHxKHulboszllBDqoz0mRT/SU8nLGBp3wiG
         it16mx++K9+mElMedJCsy34wu0p+XdZHJ8fsL5O6tPFYRA47dCL0lpCXAAVujNVmu0Xr
         Qj3rN8Jd56sabIhMmBaSy7OTmAdEuTyVBV/zC+VcGzHjWPSWYj6nJZ1QalbR0ucjdP/p
         utQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPkqerunZlYtIpcBbV/Jh4JkiOpa/jKSv86HD2W6AsXeBSZGt3ehXnQDAfW31jzweXY7IKcEMCCUGFkiv0/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjgXbwnIP7ENm2pR13PZxYmmOe//V8isWn2RaJ4fM1K3hbHFr
	MqBDr5LpGIdZ/WakVrZLYlrf6SXh/zgSV0hPhk6/YiJYEMByJ+3CEYKhXPeYmYa+R7oY+eXeqEK
	M4ftYB8pcOhQT8iLC5g==
X-Google-Smtp-Source: AGHT+IHkUHZjiQIMxCihzC/k2cAyV2sJyA3C+gNgg/f3wWf2JoTYxfwjMMyMBLUtFIpfbKldriSXAkVgFLSx97A=
X-Received: from wmwk13.prod.google.com ([2002:a05:600d:82cd:b0:470:fd92:351d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec9:b0:46e:2562:e7b8 with SMTP id 5b1f17b1804b1-471179123admr202108085e9.21.1761297306819;
 Fri, 24 Oct 2025 02:15:06 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:15:06 +0000
In-Reply-To: <aPpmxy_oYoJeeqfr@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com>
 <20251021-binder-bitmap-v2-2-e652d172c62b@google.com> <aPpmxy_oYoJeeqfr@yury>
Message-ID: <aPtDmn7fSn5LcuC7@google.com>
Subject: Re: [PATCH v2 2/5] rust: bitmap: add BitmapVec::new_small()
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 23, 2025 at 01:33:03PM -0400, Yury Norov wrote:
> On Tue, Oct 21, 2025 at 01:32:44PM +0000, Alice Ryhl wrote:
> > This constructor is useful when you just want to create a BitmapVec
> > without allocating but don't care how large it is.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/bitmap.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > index 15fa23b45054b9272415fcc000e3e3b52c74d7c1..4ffe9eb0f208a3d62016e00297f5a0800aa33336 100644
> > --- a/rust/kernel/bitmap.rs
> > +++ b/rust/kernel/bitmap.rs
> > @@ -232,6 +232,16 @@ impl BitmapVec {
> >      /// The maximum length that avoids allocating.
> >      pub const NO_ALLOC_MAX_LEN: usize = BITS_PER_LONG;
> >  
> > +    /// Constructs a new [`BitmapVec`] without allocating.
> > +    #[inline]
> > +    pub fn new_small() -> Self {
> 
> Nit: maybe:
> 
>         /// Construct a longest possible inline [`BitmapVec`].
>         #[inline]
>         pub fn new_inline() ...
> 
> This 'small vs large' lingo is internal to bitmaps. I don't think it
> is worth to expose it in the interfaces. 'Inline' or 'inplace' sounds
> better to me.
> 
> With that,
> 
> Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Makes sense. Will reword to 'inline', thanks!

> > +        // INVARIANT: `nbits <= NO_ALLOC_MAX_LEN`, so an inline bitmap is the right repr.
> > +        BitmapVec {
> > +            repr: BitmapRepr { bitmap: 0 },
> > +            nbits: BitmapVec::NO_ALLOC_MAX_LEN,
> 
> A side note: after merging bitfields, we may switch inline bitmaps to to
> 
>         bitfield!() {
>                 0:31    nbits;
>                 32:64   bitmap;
>         }

Personally I think I would prefer to keep the union only on the `repr`
field like it is now.

Alice
