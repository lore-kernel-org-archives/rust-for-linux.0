Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548710E0
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jan 2025 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738323397; cv=none; b=BieAyy3Mj/z+mLFkt5YRlnpl7vpb8inKra1q22NzuDYWfjxzQ9icfGFFBWoT/f85GGQoD4s6I9V4qsHOyAZLyXLC/R7fy5K8C1lc4q6wop7IiuxU11Yqy3ndST0sOJ+eMh3cqeFO/v0KufpjRRWN3AIsAzeZAHRyqOqTMAc5DtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738323397; c=relaxed/simple;
	bh=BQ3PtgVwtTEF/h2ArOXr9xcoaHTj1o/+iFcvWi794Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=casbrD54lfH+2PtIYAenQ8D80gPO5HkKETW4i8/8+NkI/UeWrRuUpZN2TcXswbNzOTpvo4jZXPRvP767FRiHKQcTdaWfkvl/jfkRl9xRgJYPf9WvsG+vWBj4jL55y5OHJdgrEKd5fWFlQxR7S+wl32ojAy77pGeyECYraNCIBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DsL/dhqq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DsL/dhqq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43675b1155bso21471615e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jan 2025 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738323394; x=1738928194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SR7zm6aWfdAv+CDJx4pa3ob/BdGYMCgycDy3MUU93g=;
        b=DsL/dhqqCDAA424wue1+zPwaUfBNK3xc2n8l8tKrRYqrEh9rmGt5OweXlxLHLQIgKJ
         yjpQwS/vHx0Nk6wAdBIV2MeQa62YKPmKtBlz9jyKp2Www1Lrv7XJI6ZWzSHspILFQF0/
         h50VAPU2SucABFVd6Qc/hVcVe3iFvY2gob++DJfQThcO0OdNBqBaPN+kTdPSyVJQy4w/
         VlOnapYlRTt/1OfIn2vtaxlQoNN31toxdTRBcWkkYsjixNYol2xtAxff20oOSBESwJ9o
         rvRk77njVonXJoNDk0KNvkIFabq3OGwlALIemc8iAyQnpcVYjvvXhkaPg4DHl9Lj/QYD
         UTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738323394; x=1738928194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SR7zm6aWfdAv+CDJx4pa3ob/BdGYMCgycDy3MUU93g=;
        b=hxAPfvNUFB0sSxadeSn7yG38NmVBWKev9N2xSl8Pj/uuCSf61x5AMMzxL7H/OjWvDx
         aIg1ptFvRpyhmxl1HcrlLmG6SmWq/WJz53QBx6S+zQuiA3IsmzMOtFy5D4zvXe8iu5rg
         J5+1ZKee1JENjZ8CYhP7Yr8r14PnOtwGp/8rxlu3XJecTtsKPhAKqPywh1Fu2/AOER2H
         Je3GuYDBr+T6iUHJY9a9HtSXb+kqxZqOZwqe66EaXIcBOoDnxew8ZbxWa7Q25IpD1Qyx
         lEyboEYjVYMvUt6OY6CSpBEqeHbfUEnylxMNUVzHYqeaU3ocp7nXIhP/TfkpSJWNyHKn
         7Rag==
X-Forwarded-Encrypted: i=1; AJvYcCUlgPo6VQ2a4kkhQtT86AFVO0GCaYospg4hsmhlu63dKp+AIWas6mebE9l6Bi1u3kRZqEyyY8PQfR9EHoUbKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxicjVNdZP2Yu3fpS7MXm9UYmA+3R2wEMxljjgvUV8MOefLe3EZ
	X7tIcO9CusMjmDle7FKSFn1NS2kUhTKc7hFpjiL6CJGxWOypTyClrcuiikTBd0I2RwvEoJhfbmZ
	1IECXHnKdle33OMrgGbnlLwscG9r9X52IUJo1
X-Gm-Gg: ASbGnct6Niz6IuE6ie7GBNG5cenv6FBtVy3Y3W3KKBaDpyr3aXB1XRicY+gPENbnDku
	4BzJdWyFsl9Z6iFBVirqq3Q0FOKebXcHmjyF9fjre7On2xOzNq6w0iSPYOrqfla4GM7Dm21QuP2
	qnWIFCIVYEr8Qnx626TCFWQispV7k=
X-Google-Smtp-Source: AGHT+IHRFoJje0XBfarURrX/WAI1h146aSMoYdSVlrd84+vg7Nzi1IUkjjsFrXIj4yq92bkDJ1yKtwkjwlbbL0fKzpo=
X-Received: by 2002:a5d:59ae:0:b0:38c:3eca:b30 with SMTP id
 ffacd0b85a97d-38c5194a7e3mr9796494f8f.14.1738323393804; Fri, 31 Jan 2025
 03:36:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
 <20250130220529.665896-4-daniel.almeida@collabora.com> <4518f68e-c6cb-4c97-957e-b8988e2b309b@sedlak.dev>
In-Reply-To: <4518f68e-c6cb-4c97-957e-b8988e2b309b@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 31 Jan 2025 12:36:22 +0100
X-Gm-Features: AWEUYZkpECKwFj2XE5cPc1r9KfvYcg1mII4V9PMbxHJsXk8rVDlWR9LASjOizDo
Message-ID: <CAH5fLggUvcERo2+xwSkFcv-ds++4sy+Q5JoxCCjrx-R41KfDiA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: platform: allow ioremap of platform resources
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.mco, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 11:19=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> Hi,
>
> On 1/30/25 11:05 PM, Daniel Almeida wrote:
> > +
> > +    /// Same as [`Self::ioremap_resource`] but with exclusive access t=
o the underlying
> > +    /// region.
> > +    pub fn ioremap_resource_exclusive(
> > +        &self,
> > +        resource: &Resource,
> > +    ) -> Result<Devres<ExclusiveIoMem<0>>> {
> > +        self.ioremap_resource_exclusive_sized::<0>(resource)
> > +    }
> > +
> > +    /// Returns the resource at `index`, if any.
> > +    pub fn resource(&self, index: u32) -> Option<&Resource> {
>
> Maybe we could utilize the Index [1] trait to make the API more rust~ish?
> Or at least name it `resource_by_index` to keep consistency with
> `resource_by_name`?
>
> Link: https://doc.rust-lang.org/core/ops/trait.Index.html [1]

Using the index trait would result in syntax like device[7] to get the
resource at index 7. I think that would be unclear because it's not
obvious that devices should behave like an array of resources.

Alice
