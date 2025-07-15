Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B913AD1C
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752590171; cv=none; b=GvUHZAdg61051diFTasHUgbQxsQCSuhZRXBTsnPmFgJiuPtyUBAE9FHSWJ0kwTolItXT/XxGv0LvUU3rEOUXYCom0jSwPbD6WV0LeSIa4rtY9eoGU1eosgITOrg00XwQiXBr6HCIgXrye3clVerXfgFOl8I4flJAKvWzM7XM+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752590171; c=relaxed/simple;
	bh=EecG0RfOgPK7guoEmHKkFnJxuOMZMfGIgo2mOHDfw1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cB0U08OBpshMmelbz3+puFQyLMFwWab2U8HPlbkqveru5EyxYNJCUfpNvTNQZQIenr/CB1Z8V/UajWGfHgDSTQLgOLBVweG3BUWGt8EmhZZrii+IJkn9ZvKN8Emnk3Uysp+SJ5XiJNrCHtM1PKt8TVk1a31gi+85l0OpSGXYs7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDScMyq7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDScMyq7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so3153878f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752590168; x=1753194968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGvfBdhqi/ZhPT44V9PeuAZ38V5//XMxkKdYPmm5xrM=;
        b=TDScMyq7G4ZAkuHRue+1e5eFKgBcqEF1BKX23YP85NkYZktStaC1B2azhuyOHn+v8d
         AQzq71dbQIDhf9NfHaBe1Bin/A+Sgoqnuj4DGfTPJIrEazGqvAKj0pZAVpTadsmu2Bob
         vLWoucqStq7BtYCe9b+H1d4NJgW3P1gpw3NmN3Q8fp9rNEulLXgcO8UiV0EZ9LUVLxoQ
         hOTI0epfWCBLa4siKuxuk1y7XROooVRmiC+6sVduHAIIgLU8vjt8uKzJro/Y96tkburU
         srGx9xTAy37hxMBxjnnNxbX1jHBPsuSdWlBgXOWXapqCuKUfT22DamzA/zJebg4sK//y
         8o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752590168; x=1753194968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGvfBdhqi/ZhPT44V9PeuAZ38V5//XMxkKdYPmm5xrM=;
        b=YgX4trd4tMyNZwD39ZMZvkQFlk3g2EDpVSZAy+nt6iOMvDGBsYrrj3F6TfvuxBQQyl
         AEkTCXUpgJCV7tIncKk55E/CJd4pvdlpHaoUtZa1Ksb0ujjeB405IIMLnFNmj5E1mM6Y
         FFPEmQE+udRFEeXm4BQKtdHHr/IBkxEQS9ETlFWhAEycniB5JBBNLSoLbh/THfC36beM
         lMTzVon/BoZtJLMlFOoRawExbGXuNCDfM64TMTdfx4J03lXnLhecUJtlA6XYNv59GwQN
         B/cIGGd5l20DMxfBXL+RT3GO9lNaZpn24SQpBiDPSTcuGpSOgZY74GE2YgtvsAOxn71V
         DXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGvWBu7prellO7o2X2oicTK9xeFmy3pajaz0dbH5AP3x+IOH6yWd54BbnKB6m8duUQAzlk1QuLK+qtor/KTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU1bZu5B4BZ30p6hmqH5dpy2C07irtNsGnrFJ5aaFJsj8BQkld
	8PiVoJriT68wlh3pR4OCsLeDF2qEkQrbjfcNoSK8h2Y5uP2l3WPwF3rjU+v9u7oJo5ad+LHtP/f
	3DuTfNIELDUtTJVLtOztPVwy73hHgYq6mxfZHi+WK
X-Gm-Gg: ASbGnctAVZDCVKcSjN2yPixkyr4vbg30yZiPiCZmTHNogH++MvQMROuoJLcy8KPZ0Ce
	OYIkX/b/jumxHhOu4piX3/iBBYrlt7oFknpBalCuGEkWVJqejwwijDtQE+6eRF1aTFEepon3UBy
	ZH4HHc+HqOLBe+zKgwoGW6FSCEHVKPvRdsPbYIIv7BTqauJInnM7u92dc50KyeZ3aHC9xB2Z/zf
	M5LQ5BIthgCg2ojIe6dlkOgstBMNLeDL4jDY1HZYe7DA/jo
X-Google-Smtp-Source: AGHT+IHchtZYVjwPT3Jbtde6bA8r0SM1a6NSKREDZEHuUKb1xV+X3nINxk5+iqwyl1LWyFSQCr/TULZEuO0NWNXPtg0=
X-Received: by 2002:a05:6000:4022:b0:3b6:938:86b7 with SMTP id
 ffacd0b85a97d-3b6093886bbmr3936441f8f.35.1752590168224; Tue, 15 Jul 2025
 07:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715-align-min-allocator-v1-0-3e1b2a5516c0@google.com>
 <20250715-align-min-allocator-v1-1-3e1b2a5516c0@google.com> <DBCOPL040H7H.2MZO6ZBIR0Z2T@kernel.org>
In-Reply-To: <DBCOPL040H7H.2MZO6ZBIR0Z2T@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Jul 2025 16:35:56 +0200
X-Gm-Features: Ac12FXxYoaHrfSJ6mWRMdg4R-V_viczknh-7oNSEIV-JL9gT_TR3g9iuEJIcalQ
Message-ID: <CAH5fLgi+6Ahh_mKrdxyfc+SBKymEhqQhgg=6MxxG7MSvpJjveg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: specify the minimum alignment of each allocator
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 4:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Jul 15, 2025 at 3:46 PM CEST, Alice Ryhl wrote:
> > diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> > index a2c49e5494d334bfde67328464dafcdb31052947..c12753a5fb1c7423a406355=
3674b537a775c860e 100644
> > --- a/rust/kernel/alloc.rs
> > +++ b/rust/kernel/alloc.rs
> > @@ -137,6 +137,14 @@ pub mod flags {
> >  /// - Implementers must ensure that all trait functions abide by the g=
uarantees documented in the
> >  ///   `# Guarantees` sections.
> >  pub unsafe trait Allocator {
> > +    /// The minimum alignment satisfied by all allocations from this a=
llocator.
> > +    ///
> > +    /// # Guarantees
> > +    ///
> > +    /// Any pointer allocated by this allocator must be aligned to `MI=
N_ALIGN` even if the
> > +    /// requested layout has a smaller alignment.
>
> I'd say "is guaranteed to be aligned to" instead, "must be" reads like a
> requirement.

Yes I agree that sounds better.

> Speaking of which, I think this also needs to be expressed as a safety
> requirement of the Allocator trait itself, which the specific allocator
> implementations need to justify.

The trait safety requirements already says that the implementation
must provide the guarantee listed on each item in the trait.

Alice
