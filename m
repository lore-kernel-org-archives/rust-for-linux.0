Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44975241139
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757500855; cv=none; b=BjOqwGni2amUDomfih3do1lHld1Uyty5vkWCb+PoCeLS+sPl8SecPrmSCGYVdcULhYxAA048H62+NwRPMcIiwXKni/7NSrmOc5LKBZxYkg15pFzH6sZg5fum1kjDiL0loo8exzGVw9FAJFa09p/cLhckdfYNQ2d2O4htBzMsqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757500855; c=relaxed/simple;
	bh=Wns6sS2pcIr3iv078DE04wA4JW/ZNA5tmPg+ifTffxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmhzTxHMAd/yyNGGreDm9P0nqU1XMqE8N/fEL0gq9FJFORYZJ8LV+b7z9NVhquJNyOAz4WcUvixTBrtsB/g6/XXktUfZ49RGG3pCXRyyVTO1nLknU08Vm5TB+9vU2xQ8BWDtptZr6CBLCxdeH+Nf2aWCmcAaiqOtivv0qXanCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vni4fn16; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vni4fn16"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3df3be0e098so3633821f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 03:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757500852; x=1758105652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wns6sS2pcIr3iv078DE04wA4JW/ZNA5tmPg+ifTffxM=;
        b=Vni4fn16IehxmfrbrRk3IeU1cH2Nioxv/tYoGyLN9UblLa8v9cJTqmeFF9seqX5jV7
         2i3zCplmQ2riyU+FE0wJypDG9/i2xCbYRZe0C0vh7dtRuUyeb7yo/yM+PcuuSzXdmVNm
         Nvy2gyB+dsFwK85RSmuAI2D+MWYIo1OWwWI3wFRHKU68PZTQa/N0lRCrqxiuG8m1HTcD
         QPDKJgAqQWBOTj6Y7gDk6mNGrLvOzcYbvutSMOaW8ujb6qrGMffNeFzB1PihdQtvFUId
         RGBtmngMbqNpJz16Fjc1qOrT5Zayda6pMCrUm63qY3E7J056+hy9WY4A/B5Cv3AsMsMy
         cmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757500852; x=1758105652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wns6sS2pcIr3iv078DE04wA4JW/ZNA5tmPg+ifTffxM=;
        b=OZXx9viUOyyzDR+gJBoXImdNRy1BE6p7hdEuJm2Kq/0MbZEvaRgSyNcC9qZe860+7O
         khPYaso+xDhAd+wCOs8KhYygAvzG/bp38Y0vMzlu4QF9osfyloKutwW7e4CG7n9ITtqq
         G4JE86m1E6KLsE+P2BVkflF9eIjMxQJ3Fj1tNhpxRfK/u4geLQwn5yJUVVbb6dJZFxyf
         bWjHZq0z0mZH4Oma8/muwbQC7JLMhLA7BYqofce4QdyYk4LVzJ+LhbXCNj7MUmBrCA8u
         nVCXCIAwdkPlsg3JsvZHoS/E1DjyFOdyIvhqpo7nlMwxoJkR8x1TrO8lmJGxqh3tD+PP
         1X1w==
X-Forwarded-Encrypted: i=1; AJvYcCUMg/+Ci66lAo2ntD1bqQ/FpE8HXL/a3BW7se7DSlxGv6hBMGt7ZSBsWF8l6wffpVr9UpoKUp/Bx9KfirDZ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFgMMittNAjVMxfEcVt4c1lTx19c9pQyiDLRGL1m6mPhykZIC
	vjQuiTw7YieYvHq2pt+c/YpY74/flVbZ2QJPmCwh6H3Mawzl2uo5J5hritzPIoulGFrrU1Dj2kk
	KvTZHipDgfe1wKmuU1fYXHR+gu/rpcZOKbV7Jr2z+
X-Gm-Gg: ASbGncsoLNYXqOGuBJ5i/v6mL7+E5AGH8sHob6c5tDE6PKFqmJXY1vzL6PKjsj++53J
	NRTUNLxmw8X7VuZo+boaBgqcWGusOPxkfTNdezK0dDVnGRhk9hO9c0W55w4vhKlzoAZhJmUF8d8
	/KN49+zfv+oQ4MdXc16z9y5bJnOd++qpo7Xm2cj7b9bOo3dpNCQVPzEXJI+PBprv5cRFUpB32xK
	+tWRa96guSIMTV94IoORwdj4MF1AQhEXoTtyunpCmN1jU0=
X-Google-Smtp-Source: AGHT+IFyoqz+yFl9emZ+M8hdpldto4NzhxwR45/60xCqklRMedBpcace6NPWfsvipC8Nylf2dM38FdnLwjI76aGtoDM=
X-Received: by 2002:a05:6000:1885:b0:3de:e787:5d59 with SMTP id
 ffacd0b85a97d-3e64c3ac7edmr8097730f8f.50.1757500852380; Wed, 10 Sep 2025
 03:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910100755.2361281-1-lossin@kernel.org> <aMFQL-Hq1KvBG5lh@google.com>
 <DCP1Y8N4SRRF.25V7F6PV5ODCQ@kernel.org>
In-Reply-To: <DCP1Y8N4SRRF.25V7F6PV5ODCQ@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 10 Sep 2025 12:40:40 +0200
X-Gm-Features: AS18NWC425qAg6IjeBoODYU3Z7WVEBCQjIq2zbB60jPOkQv7VJ_nQ7wcD4ZftVg
Message-ID: <CAH5fLgg+-oz_cP9=ke+ukp9qYZAsD=hKqvvGfkJWRcCKdrTQ-g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: pin-init: add `#[bind]` attribute to access
 previously initialized fields
To: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 12:36=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Wed Sep 10, 2025 at 12:17 PM CEST, Alice Ryhl wrote:
> > On Wed, Sep 10, 2025 at 12:07:53PM +0200, Benno Lossin wrote:
> >> Assigning a field a value in an initializer macro can be marked with t=
he
> >> `#[bind]` attribute. Doing so creates a `let` binding with the same
> >> name. This `let` binding has the type `Pin<&mut T>` if the field is
> >> structurally pinned or `&mut T` otherwise (where `T` is the type of th=
e
> >> field).
> >>
> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
> >
> > Is there a reason we can't apply this to all fields and avoid the
> > attribute?
>
> Adding the attribute was due to Boqun's concern on v1 [1]. I think it
> might be surprising too, but I'm also happy with no attribute.
>
> [1]: https://lore.kernel.org/all/aLshd0_C-1rh3FAg@tardis-2.local

IMO the ideal is if it works without an attribute. Perhaps trying that
in the kernel is a reasonable experiment to find out whether that's
reasonable to do for the general language feature?

> > Do we have a place that might be able to use this?
>
> I didn't find one, but Danilo plans to base some changes on top this
> cycle that need this.

Danilo, what plans do you have?

Alice
