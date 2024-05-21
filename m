Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0DF18B1A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716260368; cv=none; b=YYuNjR5+/cZzqE1mX0RqRMym9rwKsDFLTKbbi6OAQJdfWzW0TFw0vlpn75tU+W7kyimL6FzR+cSLtmwjXSqZr//aAxmDXp4KchUOQQDuZNy0mECxXjlzmEUIt+A1H3notu5/r5HCYWe86nQcXne8VGYafYMCifTiFPGrC2iJbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716260368; c=relaxed/simple;
	bh=rRuJbplpsUJb7QH5ZD+g+0WKv5TFPFuteynKWmO7wzQ=;
	h=From:Mime-Version:Subject:Date:Message-Id:References:Cc:
	 In-Reply-To:To:Content-Type; b=dh/E56Vh5I2RFoEmqj0r9irzCuei3JFP6GmgbiYtCnNgzNcWfBtjAZVjvHccZ8COnE/4Nf+fxLvSzm8Rtx9e4tznb1shvsBCn48sbkRlxwt+kQKCHScMF9s6UGXmyq92iCVJUqAttKnXkXKJg0LtTfzcFIVegpLOwfQvMz4u7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CoHxloTW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoHxloTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716260365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kX7sVz8oC5kOI2zfBrtrNS33Au3zo4hBf/Zg6N0PQkM=;
	b=CoHxloTWQ3yuWZggf8b/azlmRvOBy1sDfwWbVRpW1lJn04TNZ4tTTCJm14BySa0qs07GYZ
	+XbiDhrx+F6R8QtNMDR0pKYQbS6e8tS2jvny5mD1bRoLEI4UgQFEYyD0wqo9NLJnkGiihe
	oqNLWQdqvY2/F9VnRoaGj16LOHb+C1k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-6OvUlXXhPEW84C-_YJ05VA-1; Mon, 20 May 2024 22:59:21 -0400
X-MC-Unique: 6OvUlXXhPEW84C-_YJ05VA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4169d69ce6bso265835e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 19:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716260360; x=1716865160;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpHxUzO7krNIPiV9mgzFqkbtUMxrneNQVP8XN/mttLU=;
        b=tKliC4YZlbdgAXr+SWTfJPPiaSQiKX3P5OrRGgOQ4Qu4JraquYIF3P2geoEPQG7a/I
         12xtF7oaK8CpSfMOTJEnOk5YWlhrVu4sNiPA7JNbHubLUUkMGofqd4DiMOc5a3zYzrMC
         ZFTxQ3VHUrjphFdoKoeFtqyY+0hFhRGh5SI0NmMTMubEuoq0bg1MO3QMjskeNZSSmZcG
         lvC8PuzJyhqQwCRv/2ydfhUgbSdy8FIZCeZK/Lvfyp/eIO1Uww/A6TM3IqzexmX3tiyu
         KJ9ZBSujwcFTsMICfGDw/VkvAJulvTzbCypsodNubvkY6wNZB2nnBjMzvJnn8PJwCfxY
         fiAw==
X-Forwarded-Encrypted: i=1; AJvYcCW7U49o7Kb+9FGrfzgCMAgPsTbpQKhbCmQW0OjukM+zMpL4k4Ltg7Ho89SMGQN/pTNAmqzsDcm68PT4nqgUWFndi3mu5JzlpHZAhv9kk6c=
X-Gm-Message-State: AOJu0YyEJPbQbJRRatDb3kfpC8aWjbMxcGD9buFWRCna13eTDXmjb6oK
	jWxp5JHZSfym+qVeZ2pwVLTIWfnx5s18e1M54Cx+hWvyqfLz5RQbG3DpKlvgaXIP/eQkWgmbOJ2
	JM0VVxjuJwHgOQc8NZgx0B+25Lgg3kJdv6Wno+WH63joQQL60wW6+ata7gvB5tQt6
X-Received: by 2002:a05:600c:35d3:b0:420:14fb:de1f with SMTP id 5b1f17b1804b1-42014fbe1admr189796915e9.14.1716260360782;
        Mon, 20 May 2024 19:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN6LF6zOUxd0TtcyOUp7U9AawDsKqXA8eie9bsey3aMIwKmzga3L4ta6139bGXkj0jSRbreg==
X-Received: by 2002:a05:600c:35d3:b0:420:14fb:de1f with SMTP id 5b1f17b1804b1-42014fbe1admr189796825e9.14.1716260360431;
        Mon, 20 May 2024 19:59:20 -0700 (PDT)
Received: from smtpclient.apple ([2a02:810d:4b3f:ee94:9976:d2a9:2161:854f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8fa6sm445082275e9.2.2024.05.20.19.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 19:59:19 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 10/11] rust: add basic abstractions for iomem operations
Date: Tue, 21 May 2024 04:59:08 +0200
Message-Id: <CE78A4CB-F499-4BD8-8E29-28F561B320C1@redhat.com>
References: <CANiq72kHrgOVrdw7rB9KpHvOMy244TgmEzAcL=v5O9rchs8T1g@mail.gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 airlied@gmail.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
In-Reply-To: <CANiq72kHrgOVrdw7rB9KpHvOMy244TgmEzAcL=v5O9rchs8T1g@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: iPhone Mail (21E236)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(quick reply from my phone)

> On 21. May 2024, at 00:32, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>=
 wrote:
>=20
> =EF=BB=BFOn Mon, May 20, 2024 at 7:27=E2=80=AFPM Danilo Krummrich <dakr@r=
edhat.com> wrote:
>>=20
>> through its Drop() implementation.
>=20
> Nit: `Drop`, `Deref` and so on are traits -- what do the `()` mean
> here? I guess you may be referring to their method, but those are
> lowercase.
>=20
>> +/// IO-mapped memory, starting at the base pointer @ioptr and spanning =
@malxen bytes.
>=20
> Please use Markdown code spans instead (and intra-doc links where
> possible) -- we don't use the `@` notation. There is a typo on the
> variable name too.
>=20
>> +pub struct IoMem {
>> +    pub ioptr: usize,
>=20
> This field is public, which raises some questions...
>=20
>> +    pub fn readb(&self, offset: usize) -> Result<u8> {
>> +        let ioptr: usize =3D self.get_io_addr(offset, 1)?;
>> +
>> +        Ok(unsafe { bindings::readb(ioptr as _) })
>> +    }
>=20
> These methods are unsound, since `ioptr` may end up being anything
> here, given `self.ioptr` it is controlled by the caller. One could
> also trigger an overflow in `get_io_addr`.
>=20

I think the only thing we really want from IoMem is a generic implementatio=
n of the read*() and write*() functions.

Everything else should be up the the resource itself, see e.g. pci::Bar. He=
nce I think we should just make IoMem a trait instead and just let the reso=
urce implement a getter for the MMIO pointer, etc.

> Wedson wrote a similar abstraction in the past
> (`rust/kernel/io_mem.rs` in the old `rust` branch), with a
> compile-time `SIZE` -- it is probably worth taking a look.
>=20
> Also, there are missing `// SAFETY:` comments here. Documentation and
> examples would also be nice to have.
>=20
> Thanks!
>=20
> Cheers,
> Miguel
>=20

