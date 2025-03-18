Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3EE146D6A
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289785; cv=none; b=WqmugWmAo/dxgyIkZGceKgy+PPtDpTgZCO/QiaQtrdByMOXxRI5AlLcwZulVJZvoKLW0mFkFXt2D110vYLr0OAaoUnU83efradsonIgT9EcgTPwUUKqyWoK7qfu29qPemU0+dpVvhM0pJEhxTPkQSyqNuN+dx4WD4Lc/UhDIj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289785; c=relaxed/simple;
	bh=2+u3XFAq+HNGl3DBJY3s8alh1DCk6KVZIPBdA22WHZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e+Jms+LwIWmXdLauxENm4zyj6BWk6RspFdumQ80bB5IR6EsNPra1yxB3fpKes40HcNl7ZnwyV/GuTusxRpAqTxsQrvuxlTpdGQVY5aAfZOZOt6TZFf4ZhxXtmNNQzykjREVhAXTTJkALtPG1DGLlPnXTxkCAKE00MuwyPMLfiMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HjGlJnuV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HjGlJnuV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso17173555e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 02:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742289782; x=1742894582; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCfC0RAJNFEk2a2N1WlDQjbNqq6fpBI9L3zZ4i8ZQK4=;
        b=HjGlJnuVlAdFvqs4E/c3W4uAAgSzlbNWtlg0cVLd85xlUsWCeilgrsjxouvl9FhDyt
         4B3yX4W7X4xeu6A3oGOMB+/Q7w05v+6ZjmgrpQjZIltEjvf4IUOoGJoWGpof/tPt8e/H
         9S573zTnWv2XN6wrMrzbuQhrWamQQtHqCSd2blMQqPHLwWbqwB5ZktGLxu7l49oVmYyk
         GlFl6UNWxkhS2uu8OBNV0ZedF8HSvAtmA+BFR+EmXr1fOKKLp0QALctKlVHGToZ5QhFS
         ycncG3Xqj4e4Dq9XrIoo1FqPvyS0ylrTdMUUOrQrNOvSXt0E8GRDWyddCpZ9ZlekxcF9
         8hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289782; x=1742894582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCfC0RAJNFEk2a2N1WlDQjbNqq6fpBI9L3zZ4i8ZQK4=;
        b=YFgnF2Eu2PwQYhNe7pygcqiQDYP9a9db24RxT3aKwNHjO/spjFC0UVFsF6hJz2AzSe
         rym12Ddz6K5Ju25PNjOvpCu0Kt18h9400aPUnUtht4NZ4fnnIaHbkYkzA9crGMYNhen8
         S88t8tpDd/kdex2wHEm6K/QcstYVS8i4GPNhKbtF5TGjeoW01sh/y973qi8x16x9ovNE
         eCl/Lc8s7Ybxy5qplewZmySZ1THzNHWKrXTrMf4IkMpspSfqUS6iHaauqr45dx6u6kM/
         /OR3gew0MR59XcIiaS6OiKur++ecT2iV7XwQkHBi/znytnUtTCV4SKig0AJLTE2p7vxV
         kWJw==
X-Forwarded-Encrypted: i=1; AJvYcCVHwpMC4tdXMoBlwE5N/Qrkp0BtX9Dl0+gH4qwP9Itbf+c3HNtLEsPlJ4JxbuwdK6ZlGSWm0cHAiDDxFb0svg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0sjo4Edg/pAS4WPTdpRvVg8WYN/IP9OoOfT2htNEMd9yX/GL
	KcO8KGkCqK4/hI3AXmbEzEucQWADVbful4lW4r9ygkm4XYnYZmPdnhKZeRKJ5mqq7ObFnwdDdJM
	w/hzs4qQs+2hn4A==
X-Google-Smtp-Source: AGHT+IGDaUl0eiyBgeANVIDFXN9j+DuNssJhnHkyeFJipmKrSIp0Fec7Cw1iykbVuNIh3z7M3e3iHmbEpO1331s=
X-Received: from wmsp8.prod.google.com ([2002:a05:600c:1d88:b0:43d:1873:dbaf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138b:b0:43c:eea9:f45a with SMTP id 5b1f17b1804b1-43d3b94ffe9mr15418345e9.4.1742289781906;
 Tue, 18 Mar 2025 02:23:01 -0700 (PDT)
Date: Tue, 18 Mar 2025 09:22:59 +0000
In-Reply-To: <CAJ-ks9=xLLXovsaduKFBfxvkfzYgTaSPhhW_oRN5y1QOuKJFkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317-vec-push-use-spare-v1-1-7e025ef4ae14@gmail.com>
 <D8IM66U67XBD.28KWYO1XSF8ZQ@proton.me> <CAJ-ks9kq1cQ2-ZNzG9P4SBvk-AjXxT+na-89K33imB4fsCvu4A@mail.gmail.com>
 <Z9hXMcFVdF8MMusU@cassiopeiae> <D8IPQUN25M12.2CIZR4QHJ201N@proton.me>
 <Z9hcT4KPwgtHmiTT@cassiopeiae> <D8IQ5BDTLCLZ.1UBNYUXLK12X0@proton.me> <CAJ-ks9=xLLXovsaduKFBfxvkfzYgTaSPhhW_oRN5y1QOuKJFkQ@mail.gmail.com>
Message-ID: <Z9k7cwE5UNOIyoXR@google.com>
Subject: Re: [PATCH] rust: alloc: use `spare_capacity_mut` to reduce unsafe
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 17, 2025 at 01:55:18PM -0400, Tamir Duberstein wrote:
> > >
> > >       fn dec_len(&mut self, count: usize) -> &mut [T] {
> > >           self.len = self.len.saturating_sub(count);
> > >
> > >           // Potentially broken, since maybe `count > self.len`, hence need an
> > >           // additional check.
> > >           unsafe { slice::from_raw_parts_mut(self.as_mut_ptr().add(self.len), count) }
> > >       }
> >
> > Ah sorry, in my mental model the function returned `()`. Do we need the
> > return value?
> 
> The return value is the whole genesis of `dec_len`, we want to return
> something to let the caller know they need to drop or copy the memory.

Hold on .. it returns &mut [T]. You're usually not allowed to take
ownership of or drop values behind a mutable reference.

Alice
