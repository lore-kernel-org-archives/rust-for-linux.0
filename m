Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE776F068
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712238052; cv=none; b=UMSo0Wd1r/iVRBZeYH2CjaxM1dU01x+aZHNVxuf+18xbYNUP/AmlV2p6QMR4yKXiz2LArZubzyhEpAdo6O8Ju5XxvjyirpdTE7W1IbMXcsVEGuV9+zd/nEEwSR6zz6rCOg9ikRay0kWYMAkgRdBGp1DrD1fGZAOCS0wHjwGuLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712238052; c=relaxed/simple;
	bh=z89MX8HYRU8eftunJgLf/N/hvA+22G0MlIRdKBYcBOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfa0ouRgVj22Khx1mfxe2njYKYBPcJ+6C/o3St8bAR8iyD8Xbvl9/kmU+fhSjjd8OYSug4x3b/DwLhb58+VPXvDBrMy2kfM5WGITBqpJaPtQmFAotmaLzjACUgyIONfPkN0UEQfr3KUZ6RxiPc1VMZBQdldvvq7pb0nhuTwIfyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PgH0YwT/; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PgH0YwT/"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7e3d93697f7so332496241.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712238049; x=1712842849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOS6jB5q96k7GK5LtcB2yIdNav1TsSAYvbOvkVp9ZNE=;
        b=PgH0YwT/maUKinOEMoJeJk4WnIxwiZTejcEeGmI/DPQLzkTNGgss4D9gmgLTe1l37p
         6daai5ETDqoMwVDYmAyXjk8nLsPA12joiLU9WEvcYRA27ICOl4KipMdTFiS1IdRJb8LD
         ZOwUy4nyc8vwwUIqeZ79nUayH7EduYwkxzGVA8YzUxrS38dQIIqLwNEBuBZXHexkrH/0
         hLDKtDUDRp+ui+9lL0yLgCasVBSYz+e/swMLNP5RgFHTRPnPiNFpz0IuswuxfAnfYixy
         Lf1z/9aGI6Uy64pPIfJyQFW6v4ErYNSLZmG9HqJ/F5fM0wJPuOy120CRPoM/LkCWVVzR
         g0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712238049; x=1712842849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOS6jB5q96k7GK5LtcB2yIdNav1TsSAYvbOvkVp9ZNE=;
        b=qk+MTSnqLxacSrvbatHyi6A8Ai8rYTfIyXD0kxKPsE74+ST+9sHGNvxDZAzL5hzFPX
         2N9mgiUMBBKV81dfEcsv62hKGijpZDoFVGKEZS9J2jVtiTscSS9tS2BtxZjpdFEij2K8
         Uw7dawLo7x/3t52c6CBUle8ax/iTVSyjmvYKtVJ9LSSDklgWtlDokc0Qa6X2us1L/Kqo
         JinoPbjxAINkZcwy6r6DhokScP1cY2AGuByuS6ojSdTB71+4F9q692m1+3wkSqdBPRbO
         u0W9J/ZSGMWKWsIdTnqBZ9+r66lOzb7lflI35ecK+8GAiuvTrWvklsn9FhwZZ1xsTLgL
         9b+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3XxLA92iC8VEP2L7iUxflp9oKxqGhWdB635QYaoTW3hIj2p4qG/3KX7L7Uk2mXKN1/1/8hHq3uQLa2j1Kk7vAnsnp9AHPOzUT6O/AnS4=
X-Gm-Message-State: AOJu0YwOFJPEw8SmI//1NsdJVwGnBp0z08m7s6zx4yAfXjFD2JYJusj/
	3UwLiCNthhPZIyRLwKiUEiiveXbe9OY3wGGcVGo29CBB7BuMmHDxnG/gO6sQNKqfEifpET0B/lh
	DySSeClbrbUDTU3tyBn41wZWKml3T6gacLd5Y
X-Google-Smtp-Source: AGHT+IGpIspdlUNbRLtFDNytIXGtHZMaPzFQpb3jBaHTsPiM4ZMVlngt4/RaBpp9RWjLv+l1kAIe39yYGp5s9H9JN5c=
X-Received: by 2002:a05:6102:f0a:b0:479:c181:a659 with SMTP id
 v10-20020a0561020f0a00b00479c181a659mr3220344vss.14.1712238048672; Thu, 04
 Apr 2024 06:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
 <20240402-linked-list-v1-7-b1c59ba7ae3b@google.com> <4aaf7fd7-49ed-4b3e-b691-0d8d7d426d3a@proton.me>
 <CAH5fLghEg37m_PhJxE8FVORHGROE9rd1CJttaWBGc7cXZCX+yQ@mail.gmail.com> <fe34947f-2daa-438a-b621-8557b78f1da6@proton.me>
In-Reply-To: <fe34947f-2daa-438a-b621-8557b78f1da6@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 15:40:37 +0200
Message-ID: <CAH5fLghDBzaDf38FQtt=DROmJ7qV+cXCxDn3nAmeaZibW20Trg@mail.gmail.com>
Subject: Re: [PATCH 7/9] rust: list: add cursor
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 3:28=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 03.04.24 14:49, Alice Ryhl wrote:
> > On Wed, Apr 3, 2024 at 2:19=E2=80=AFPM Benno Lossin <benno.lossin@proto=
n.me> wrote:
> >> On 02.04.24 14:17, Alice Ryhl wrote:
> >>> +impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> Cursor<'a, T, ID> =
{
> >>> +    /// Access the current element of this cursor.
> >>> +    pub fn current(&self) -> ArcBorrow<'_, T> {
> >>> +        // SAFETY: The `current` pointer points a value in the list.
> >>> +        let me =3D unsafe { T::view_value(ListLinks::from_fields(sel=
f.current)) };
> >>> +        // SAFETY:
> >>> +        // * All values in a list are stored in an `Arc`.
> >>> +        // * The value cannot be removed from the list for the durat=
ion of the lifetime annotated
> >>> +        //   on the returned `ArcBorrow`, because removing it from t=
he list would require mutable
> >>> +        //   access to the cursor or the list. However, the `ArcBorr=
ow` holds an immutable borrow
> >>> +        //   on the cursor, which in turn holds an immutable borrow =
on the list, so any such
> >>
> >> The cursor has a mutable borrow on the list.
> >>
> >>
> >>> +        //   mutable access requires first releasing the immutable b=
orrow on the cursor.
> >>> +        // * Values in a list never have a `UniqueArc` reference.
> >>
> >> Is there some type invariant guaranteeing this?
> >
> > The List owns a ListArc reference to the value. It would be unsound
> > for there to also be a UniqueArc reference to it.
>
> I think it would be good to add the existence of the `ListArc` as an
> explanation.

Will do. I'll do the other suggestions as well.

Alice
