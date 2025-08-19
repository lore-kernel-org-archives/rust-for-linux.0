Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB6318121
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594249; cv=none; b=QU6INJRpAYOqy7DY7jhZpS8HeHMDqLHEzBY/WlErznpxBWaicb0qXbKc5xJHt52+37/zZ70eW/9c6qhNBjSQFqCdYV+0X7w+IOZg8zvEPDW4D6qiZS8N36UBJZBFyin3bXr13v58sIwM0+XdGmEE3tlcepj+pMx16nQc0TGnjyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594249; c=relaxed/simple;
	bh=j1702PwtMzDQe5/1lQ6DecIyL64vgc8wHTrATNQRhR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRhtCc2Udj1sA0YdXVQIY4Syft7XAtRPuC+fErF3i9atM55nQOEtraBkuIaOP9wgnD2E7Z/BMVMGFffGSsYdjnWe4fXf2s4Dwb4H2pUgk9K0NYfeiFxJL8s7XqzIiiDWYbewWjI9Ws1hayRbhH763ayrmIR+R5srpYVcOKRwSEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RO36CdV0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RO36CdV0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so35403425e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755594246; x=1756199046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw4/SYfYTbVLI+W3vVMq9GPldn1oSL4x6P0EM98hAz4=;
        b=RO36CdV04gbgt/gqerVwSTjPhjte3Q9sqG0/tPnAjaRQ6tphy9EyGH5C21NZudgBny
         HaniA+8LnyAYnmqplQ/7RkhOJTbN4r3ffFh0Dy5HNk9Dv4VdfY138UYaIStE/7e4iaDc
         7t96nII9LWMjtS7rIea1bS+e4yry/McaAjJM5pyLIzOsBwffWMnCNsIw0fwxWs53CKsS
         ofg3BSTxkXubERr/rD9LjamKMdy9DLj4ABmzBd9IR/xJlmGEE4HrOrOz0ULRqSrk3qwa
         vx5uUgdwxT84wxqf6A/g6VDUJC2Sr/MCh/2TvRK9HQebf7YW8DVFg3bZgwUMVWW4Vy7x
         8LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594246; x=1756199046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw4/SYfYTbVLI+W3vVMq9GPldn1oSL4x6P0EM98hAz4=;
        b=HhCSqSleQTRnE3zAGf/zQJvMeZheaxx+ChnkeWQVEXDuqnjVl2XlJKOAI2+ACe7AD8
         jviI/8VG2PszvA31OOwHguR4O1sy5yF2lgra06hEGV/rrpWDlEL+wepsCB95tTVmE9Y3
         sNjb6/y65XWtV8vJWLSkOlZZtT+XO3FbQ+4pWvHd1dc9sD73/DsgDznM6b6f6iAdG5VC
         VAC227Iq8IEcXNf5wezuKeO3uL+VPFSzZPa5sUUJj0msrq85QhQS/ORRuIOOu9V/Ixz0
         +swSrEDWwRVgDeU7mbujP5JfvzJegZ86hUnJH2yb6ZyWTtX3/rLQzgR80NI+0wwADV8A
         al4w==
X-Forwarded-Encrypted: i=1; AJvYcCXmP1E1P2bxhEA60KN+MCiv/Z30jHrgow2pSxbRgi5ihEk8OcmUINX5rhdsq2h/raQKYYU5U5meoMAo+uTS4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlNbtFrhfxcUasY0FDbLsatqBKrF07V14y+U7PudWKaIRLHku
	E7cvDNqgfk7g7aYsxepXdOF8/IiQ7PxspQnRWDG368FtlqHpfC569Dv0U2zPQMFF8nEXzHRsa8P
	sSmeZ+Wrut1b2Z2ekuB/rIBY8Wv2EqjBzO9hMWpfP
X-Gm-Gg: ASbGncsD9ym1nn8pRh1jnYd6uUFfCrt0/qiiGasQorFDK+BC5ZtbYfGokSLh1rMksKH
	3mkrZ8oK3By3qySX1/7OQKoS4RrOWIoSkSOd8/9Ezt/i11IMtQd03Ze+SSfqA1mnVFpR5gXeuaL
	doDrw2KyKCZwn3Q3pgUDPmO6NE1es/9RdwqruhLN5Bca/MyWrhMGpCaDThcqqZ5PpkX9FIe5cg0
	qrsrNRiAI0TMjrU6lNELlcxtOmeHX+VVVznyek55NjwisFCLQ4OGcHmYuranD2YHQ==
X-Google-Smtp-Source: AGHT+IHdcHy27qthc6ylIMnNVnNh5YNWX6Vrep+6osB8MyR7vljR5PzozjKPhzxheJhAHt+ndRzWPDYEnKmFRRYqYiI=
X-Received: by 2002:a05:600c:3585:b0:458:bc2c:b2ed with SMTP id
 5b1f17b1804b1-45b43db65f9mr12911025e9.7.1755594246118; Tue, 19 Aug 2025
 02:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813-iov-iter-v4-0-c4f1932b05ef@google.com> <DC19CXUEORB7.241EQY0IXV7WD@kernel.org>
In-Reply-To: <DC19CXUEORB7.241EQY0IXV7WD@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Aug 2025 11:03:54 +0200
X-Gm-Features: Ac12FXzqmfWcGjpWA2_Z1mE6xkkkJkyW-2offzZARxXIQ07VSGbaL_je_9ZDZC4
Message-ID: <CAH5fLgggp0Nkdcuwv6HTZBo=92xCJt=8JfSVvmy2SRR_e9kSFQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust support for `struct iov_iter`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Benno Lossin <lossin@kernel.org>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 1:20=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Aug 13, 2025 at 10:27 AM CEST, Alice Ryhl wrote:
> >  rust/kernel/iov.rs               | 311 +++++++++++++++++++++++++++++++=
++++++++
>
> Does this need an entry in MAINTAINERS?

I think it goes together with the existing uaccess.rs file. We don't
currently have an entry for it. I guess one could be added.

Alice
