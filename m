Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A431EB4B4
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038665; cv=none; b=ZM2n2I6WDY71eBv0Gwh8yuoWtCIA98f0oakNe0aoBpOuRsmSlZ7/T0QskK4KQyj3xx6/s6FsN4oLsTclb+0vhnKHbnH8i+ciYg+4gvBX8+bT8xwRLi6aZd6bIqKXnZUsaPwAw5O5W7HaZS+MQTsrquFCaB4li95iJYVBhDcHwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038665; c=relaxed/simple;
	bh=dyIJ8vy5nu/QzjrtGXkXdpuUmf4fUKMdYQYha/H4XH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k96PgsqAIEKo5m8sLTk9X3tkyA8NoCgsupR1AABK9SAPM8ClufZjr5ZVVxYZ4NbNk8BaS3YoBXe9/BCGjFRjDwd8R3duxycRdU2Uk06XzpHLJEDRYZJERNZynQG2g8pt75ZGWVSksqi60cXuyPPhc6e+YeOgCedJzTvFL8SjgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WUS/lOY2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WUS/lOY2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367940c57ddso1007590f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723038662; x=1723643462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyIJ8vy5nu/QzjrtGXkXdpuUmf4fUKMdYQYha/H4XH8=;
        b=WUS/lOY2MQ08TLt0L25jdshFv33t38SR/qzH/U2yAHH/Z3Kv5jZGA29+67aeOj4d1b
         4s4l7wddT3QFy8JeFHYSZ6rtKXvTbUwjVv4pXyu4BYJyggsgWtn6wgQSEYgeqp9/zo4o
         MxscnKy7bY/6l7c2hySw/6s7TKXedP5o4O591I/z1Xn5qhESGoKK7OXx0FBoq1j6UlNM
         9rRVQa+utV5czpACUwGuXmYK+bpiDiN1Mcy97bW3niBD7Rre6jEW71DGArLbkE7vk+C/
         ZQ+hJHVr1UnjHeKacKl3F4DjTEFw8OToJmwgFDJpGHMOGl75s20XgIZNvjD4bMgs6RV7
         EZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038662; x=1723643462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyIJ8vy5nu/QzjrtGXkXdpuUmf4fUKMdYQYha/H4XH8=;
        b=bfhTJQkCK8CiGdHuuSKR2KqQoheSfjqltyYpWjPrX8J0RE7876g5CpWuoD/5Zw8Bz7
         NEWuuPPazQlzG7VW0D7cPHk4qKeM8zgQyx2phGiG7BYiBPUmhNzr5WVN61QIDmHot1zn
         1dVIptOh4CSfGj2uQD2EX01ko2RGWMuBUuSduO8LeQVVFr0emCk65qhnapyRN2EQCOj3
         +Ekd0HS+dAUD/KRvY9fDhGtCr5X1h1zGCtLKt+iJz+SjXu7tpGHOfAsuQ4XTNllRbjLh
         AefQudq/GKvAVpP/BizphA7AgKtGaQn2JgARMSjso1Le2kVyDN8BMohKaAxhEpHWz+Xm
         gxKw==
X-Forwarded-Encrypted: i=1; AJvYcCXB3JBWeJnF+ZHCrkTzucpM/dUP1e3/5V0J8uMehklbuOQAHa6o3pqrD88pXcIYEC34sftTxDxbO28/ZHO5EoSZCY/lyATwv1TqxlgRLfM=
X-Gm-Message-State: AOJu0YygQy713+2BKhed44gnkbfH1XZDDMHNInL5rIFMU6EMdfvZljG5
	vQQm+GRZRafcv88gVTu21CeeoEYw34r0HuSr0x2akTUgA6XyDa4/gbhGnM3aZn2RGiXZIO0Nlyq
	XpsQps1wmEwSf93Uo//EwPh2Sd7YEEs4FFTOM
X-Google-Smtp-Source: AGHT+IEd7QHhGVOK7U53YpVkHfrlDIEmw3VTlnK1Ey3F6vYtEqQOJE5l4niRfuoUCTHsWMfO+JRkdS8F5zkv6WrC/nw=
X-Received: by 2002:a5d:4f11:0:b0:368:12ef:92d0 with SMTP id
 ffacd0b85a97d-36bbc1d2d8emr12968493f8f.51.1723038661904; Wed, 07 Aug 2024
 06:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-28-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-28-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 15:50:50 +0200
Message-ID: <CAH5fLggziHs7Z5iVy2R-swGTXKk5xYe3jzf8bbhGkBvuVob=tQ@mail.gmail.com>
Subject: Re: [PATCH v4 27/28] rust: alloc: update module comment of alloc.rs
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Before we remove Rust's alloc crate, rewrite the module comment in
> alloc.rs to avoid a rustdoc warning.
>
> Besides that, the module comment in alloc.rs isn't correct anymore,
> we're no longer extending Rust's alloc crate.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
