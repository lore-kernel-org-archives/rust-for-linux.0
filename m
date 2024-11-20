Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6C1487C5
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093114; cv=none; b=X+ow22Scmr34mf/j0g/Dkc8SGWVybaGLUwM7nvJAYw6nOV+b+XdIYP1PcL+VYSz9Cso2MuxpiaKNkw7ZCl4XdiWKBUUGr5UZMXbj20b9xzOejAM1l7G0P6RXwv8kdOwfThphCruzknNoTKkPqj35W60sBwNj9f/PhsLIA2VMR/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093114; c=relaxed/simple;
	bh=eGfZA7Tj1K+edre/AtIqNZLh5ShiJY/TfXPXhiXcDNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmxzSbftpksRi/piSkk78dbd/YEPQhyZE1HPMxjB67+EMAM/n/W3LvM+0VVJPhUEp5DWP2AJjmL1UwQwwK0ku9hb2Jt8BoKQiIl7MjGykoGiDNDdTJBtQ9K+eshynL5tNjxvqYMdMptzppvxnIEfrZNsoZWie7eoKIQv40j/JY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OzeMFR5Q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OzeMFR5Q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso15763125e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 00:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732093110; x=1732697910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGfZA7Tj1K+edre/AtIqNZLh5ShiJY/TfXPXhiXcDNE=;
        b=OzeMFR5QqR/bZYqMHNAMCOkvBqMldDtng45n9SzBJAQYdFJTEPf7M5AXjK2smoMWLl
         z29yO/AJ5hFLDG689i3X9nDabRgy8WSusqsGhVfP0EVL5/9KFzmTJ8tEbhZUnjOzyrgD
         DSZDMa1u71MvQwR5lDopoF8s6PjXKMpGMF2M0mkmWlt7jetibd9fIxgCMRWGyDsXA5vb
         asgKORO1INOdOue/rZN4f5Lye7KgccujJKPBNXOKrY1054qLYftT7Jwk4HzY3VR6DFyF
         JCE0lV1zppOEc06IR15w0Whzajlh8G2pPVebuZjj0an4sXzPYMHZ7IEIEKH6hPJgwBRp
         43QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093110; x=1732697910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGfZA7Tj1K+edre/AtIqNZLh5ShiJY/TfXPXhiXcDNE=;
        b=e9T3n7ab7F5MuKBeWsYwSPdjp7b7EOKUyVC4oqjSI0KY3RBzgGGg2aHLeIMAZcpzpi
         28spC/tPYNlGdO/vC8EZewb0oVeOP/Yk3ht6jXCmJUdK+EYkKO6Wm2lDGOoOUiQVxBwh
         lp0OQl8QIsVxRrAUUlaTp/tCh+onvM+bzVsD/ClpIov6Wsox8v6oNNmfzIvWTb3c1gqO
         e9ipZ9QYLCWyelNMOHWKilw+/zSb0EzdpX+H3W4234XW33/bVD1JfyTPZ6WQAlNX+F4i
         IQRehlvFj/LxSi5NDjFxmsKm+gbOv+HYkQV0m43m3Gq+fg8DMHVx7/CvIFlfo9JZNMV9
         +m4w==
X-Gm-Message-State: AOJu0Yyp8JX9egWPRGK8xg440lKVsqoO+wFy2oJm3jUKTdW1hI3LBRaD
	2jG1wrZ2+3FnfQsiVeGSWtlS4wtpggqiotrpm++1X4x193vKihocvjzjZPF9Lb63xeDIeUHb2Q2
	xBJ5AcutZaKqIcFjRy3qUhwJURnzZJhyBGv3F
X-Google-Smtp-Source: AGHT+IFfNwfjsLMApiQUq1xNqp6wB3AL69xER9iSG2KEzJp0AcTMPtrPijjY0U56Za4jVuCLNxgca1MN8dowGoPj+ps=
X-Received: by 2002:a5d:5f94:0:b0:382:488d:dfd1 with SMTP id
 ffacd0b85a97d-38254b217f2mr1440409f8f.44.1732093109712; Wed, 20 Nov 2024
 00:58:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119231146.2298971-1-lyude@redhat.com> <20241119231146.2298971-2-lyude@redhat.com>
In-Reply-To: <20241119231146.2298971-2-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 20 Nov 2024 09:58:17 +0100
Message-ID: <CAH5fLgjJhM5mi_hOF=xhOKxwBWDBh_TEFtqx-1LR_yj2t_HiQA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: sync: Add Lock::from_raw() for Lock<(), B>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Filipe Xavier <felipe_life@live.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 12:11=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> The KMS bindings ( https://patchwork.freedesktop.org/series/131522/ ) hav=
e
> a few bindings that require manually acquiring specific locks before
> calling certain functions. At the moment though, the only way of acquirin=
g
> these locks in bindings is to simply call the C locking functions directl=
y
> - since said locks are not acquired on the rust side of things.
>
> However - if we add `#[repr(C)]` to `Lock<(), B>`, then given `()` is a Z=
ST
> - `Lock<(), B>` becomes equivalent in data layout to its inner `B::State`
> type. Since locks in C don't have data explicitly associated with them
> anyway, we can take advantage of this to add a `Lock::from_raw()` functio=
n
> that can translate a raw pointer to `B::State` into its proper `Lock<(),
> B>` equivalent. This lets us simply acquire a reference to the lock in
> question and work with it like it was initialized on the rust side of
> things, allowing us to use less unsafe code to implement bindings with lo=
ck
> requirements.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
