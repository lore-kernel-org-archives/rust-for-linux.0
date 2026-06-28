Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B82F1FDF
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782642706; cv=pass; b=RK7vJnHN1JLFFu9krnDEX4d0/TmoMGNDFKz4qo7WS8TYhoPFboMoCsi9Ee400srYGMLJCmnn6yOkMo/dO/NKVvhMt8YeWCMvtJML7qSi3KTuvqFVwNxlY00R22RZJryeECRH/GuyUFITgSgHexPJcDEA0sjtI1aRvn0DqFTdc8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782642706; c=relaxed/simple;
	bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7r6lZPUTnNuO+7rw5VgVrFl/YndtZIPISGLc6eSZlvAJREL074oUrXFbcL/zvBUvDCsUMlm1X0TyuQg+H7BFoNl8GXee0itPscov3i1XLeCyXKOmhU7Q/kKvrjYYpcSlaXUTGco7AZ4SkUc/JCiDADCeVlT9Drq2qsexZRXEVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqh5tpyU; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqh5tpyU"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c5912314fso274060eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 03:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782642704; cv=none;
        d=google.com; s=arc-20260327;
        b=TR6NeqbQjZbcP80LPtsp/vKjHLK/tfHrYZPVnrPKu/HdUKV5wOVqhZgM5+8Kl3qeT5
         9flPMULdvm2daikrcyqMoHuImTTKB+IEjZ0ER4wFJ324H/VcYMp0Ocr2dL/mHvN9rw+i
         Z5rQrxvIrtc1qkBC0TBciP00Kfl5ehMiZ20MT41HrIR6sWfAfMPxavn90NSa87U7aYVR
         zxCh8UAjGDk6gazrWYikbQJx70SqQcX5aFMoyYs4NWbqrQVXVFFydx/LYmj7SOROAEVl
         dB1WCiqHrZ3xf4TviG5hDSs5l6YCDkjZCqD5lzoq9OXgv/WbW4bDnUXWbR3DbvG+GR+t
         wAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
        fh=/StVSxn1pn24WyLv28zbIRvk3q4qN3yKqNy+uh+1vEY=;
        b=k9m7z4sO/DpXy/AmY1ya5dyH9qOEJHvYuZS1cav+jqe+SztIrSzFK+hzdMd3w7masm
         Q1B3O+qpohQGMWu0gaRsJh8alZxjBPp/8o8WyACo3nsMou6J5hBttfKeaMjqz6IP9syE
         M7ELUhfxvUkS+X4dQli1Ld5YJ6FRTZCZ5CA9bZD2Mc1NHH8wUbNPn7d5aRejrRXclZ+N
         IV1LaclZeXJfg8bIO60av4pRB/Vog/i5ugjfqljBlNSpC597Ip2qpWz1U/nhWSVML562
         j3z9BNVkCS8xaOXtPNz4crthjgaPyXKNoVB3v2mKSlzVwNvpW8ExsWaLtVIyDdm0YrL+
         VVSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782642704; x=1783247504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
        b=iqh5tpyUcIs+MSCr89REii8AfVb0zfrKgUJXqFlLxwTuX1PBHGvhHgmqnDj61shC5W
         wOroPMetmH18webWmc4QhqftUYSlIZdVL2uhrMe5wmanraDYurbXSutmf4iUipFitlh2
         Z288mNBwjql9XXbbJJWdAfK//+J59haEoUxzmfavuK/CC5qDW+7MS/UOKvMdAFFw6F8l
         xeKeDYyuMshgH8QneqXOM1ggta1Jf437DR0c8aOrsT5BFICPL7QaApMrzMlbkjnT6FcH
         AtbNRcayda7i8LoDdHOsS4bbwzKPVzYeo2INr51pQJIiDULDeUXBfN1I8+xiZhcu7Nrd
         Y62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782642704; x=1783247504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9T7gPyArMS/KVn5vgGJ/6O04XuwG8iFCNcQCBiuYx4=;
        b=kF4hbRWD/90pX4D3LqUh31Hxwu34/v1daClWHeA330KvzDhkfl5MS9wC5voGE4H8Gq
         mwYoWs39KS3SbaYzIkJ73YDlIZwkoxDK8SZ34kboSCFP1LDYehctjqA1Rg6wweNZ66X7
         x4LmJfMQfnUtFtKWlQI9MBGfzX2YfTNWq9TYW4A8EV5QKJ6XdXCXA8gq6cGiT6Zh8Ou0
         zvVxuaFTPBimI00CMg+mPIRiMKvAXSqkbuBFXAguEiLUm+WHFMDlZncO4zv26lL70eaI
         aL/GABk4gkQ/IKUg7quLMQcY58tbDrnq0kVLcz24lcDOK/wm6CgbyrbJ7Bt5FCGNluKS
         HnQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNO4efAkzEzV5xmf6JyBb++XT8vFXuv9RZHUGlk0WD/Vr2BppxfVQmr9Nd6wzB0/4uf2uQqr0WcqfeOO7Gmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IW/poAng/zyMPEZsDTr8ibwDBNXWOer1seaKErA36ufoJ191
	Lxi0K52nfjTc9nHJpFlyfqovwcqwlFlO9svJGG8axtnryemSKHI59MH7JSlPqQDtGLOa8QeU8W9
	jMbu79PsyBWy+T40i5BN3NnGEfrG4x3k=
X-Gm-Gg: AfdE7cmLTTK+ifyZdFqfI/8unQHL78VQZC7eJOtceVmYGoaKzyDbpB3oU8SLmq0/XlQ
	9HtmSFdiU/LMZ3uAdpw2IgqmYFvHyKYUWwjLpxm8c0SNQHWlgrsy8Dzfif8Nmz4vNtFoTxn2nTZ
	ty53Y3b00h7//FZemtakMQxTv/KxGOCgbqoURJoh+9YlI7Wwwj9MOBT+TDyfdEL3x+JrLTLwt0d
	FZ84zJJmt0plcrwpB08dirVruf9UihX0k5bQaX6XB29kVEIUppOHha5e/2nw/dxzi7NkohSvE2w
	AwsUvBkQq+xgghgxYeQomJ9HVnpG4WdiLmuO9XYPRU3cdg8XMy8RmqBXDvgYuNlZxP14LYY06+W
	3vN7gBqDHQNym
X-Received: by 2002:a05:7300:d517:b0:30b:6192:5b9 with SMTP id
 5a478bee46e88-30c84def54emr5929447eec.8.1782642703979; Sun, 28 Jun 2026
 03:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626203122.713317-1-nico.antinori.7@gmail.com> <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com>
In-Reply-To: <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:31:31 +0200
X-Gm-Features: AVVi8Cfa2gu-uh51v2W-N-eZdtsPgwAWc2f3g7iiuHZxmyLE0nd_b1sk7GagU0s
Message-ID: <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>
Subject: Re: [PATCH] rust: iommu: replace core::mem::zeroed with pin_init::zeroed
To: Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@kernel.org>
Cc: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 10:35=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Note that you can also use `..Zeroable::zeroed()` here since we are not
> in const context. Not sure which one we prefer in this case, but I'd
> personally err on the side of not referring to `pin_init` unless we are
> dealing with a pinned object or need to because of a const requirement.

That sounds reasonable -- Benno/Gary, any comments?

By the way, speaking of that: the docs of `zeroed()` (both of them)
could mention the existence of the other (and the `const fn`
difference).

I guess this will eventually go through IOMMU, but I can also take it
via `rust-next` if needed.

Thanks!

Cheers,
Miguel
