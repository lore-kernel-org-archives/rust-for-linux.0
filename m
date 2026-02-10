Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021F538A9A8
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746114; cv=pass; b=I7YEIlw/gyX/qVdyR6ypCICKdwiLW9ZCNQGOfNHfu9ygk0QLWL2muYizyuPqoBTp5UrW5hbqd6V2sNhqRsEgAWD4lsfZ0c5GwmdKwiIh+Hz2uvEJic154ricHDGhK1/B5OcwBLla5bTQdBNpXE9Vp0YAw7cvAX+Fw8TONF8zpYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746114; c=relaxed/simple;
	bh=B+poLTmejxVbfYcsSOzRvcKefsrqWl5laZb8BFe0X7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkoCl6Uw6doFuea5qACUdFkb7BuCaT4kNcEaEheJRUty8jlKw0Ox1xQlCDIePA9Q8X4Dt8ZnGE4ua+UjcFu+oKkSlYsF4Gdk4KrFfHCrZUz+kx6STi+7w6EhTsArsNfKR91jLqc+ySnXI+7XFPESaFK5YepOtYcl9loh4/w8iQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2w1LZx2; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2w1LZx2"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1270fde1739so167165c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 09:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770746112; cv=none;
        d=google.com; s=arc-20240605;
        b=RyvDkB8SSlZZpMtC/b1xYIVGIZ4qTwNGpga0XPcwYgyBmpO+n5lZ6+dR7ztGXNDlAz
         cTSBIMrrz/eyQuBn8Osr4IGZRxkyMhGR2PY0ciRklWoUBt20+XFXu3Gm6zw15ziscaXi
         IgNyxx7lO2YSglx6T/t29kUgwro5+NMeFmZPHKofXq36KDmGGhKwkuLYabeRUmYTSoGo
         Mm7owGLdQDDNJYy9m/kdtDA8C/2QItep6xmHSAi9fR1MoD96ia0ClrVugA0exMz8NAk2
         ddkgreOObVbIkMdtx14dU9sEq22jIR6Q+iycHvgVfleJaLCzQsDTsxAQlWPG85CKWKhE
         TydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+poLTmejxVbfYcsSOzRvcKefsrqWl5laZb8BFe0X7o=;
        fh=KIvRCCrW30o1G1oycpLPOv9xV1hyDQhRa1TqY8L46Co=;
        b=g9mCHxgMQ9iDkeGYzmvQb9tDzIboB8jpCzNPU2SlNZTJmwi0ts98ZnAICUPkL1+YxZ
         sHQPGb3LxEmIoyySVGDVKps0TF8Bld6g9iH014NnmurIfJBMjVsq5L7JeufIzc8nzx/I
         sh34YaauPv3d336n8SANAvTIolu72Zj/2tc1CMx3mutmReXRsy6h/2nBGFr+dVeUYDrJ
         ae7G3guaykVmYDlEi37blyuOHkZ0SlatLWjPiaT8naBLMDAGwA2493RRrzIqeRHXNRTJ
         K/EUxe2x/QsQW9UF0sjRhsZTDkyuWwI7I/JJ8s9kdkf+Sk30Xv9V67M2A4v9MZIDn3ys
         79nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770746112; x=1771350912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+poLTmejxVbfYcsSOzRvcKefsrqWl5laZb8BFe0X7o=;
        b=B2w1LZx2UubJP1lM4muBZnwzZ7lJFZP22QOVyBttc5Xhr0zwrNHL1FNNgjEeD+x1nx
         +yFBx3wZrDY4/7h7g1qQG9UnTVMvZutJavXQyAYxbtp6gfQrfARTjz7hHMidcITdyGsD
         5HdrhtHBi9oGe/QEtoZbhOxQSXW4tyRMujmEpttC0dYGUgsmcJnJUsj1RF/svfDTzBqq
         4g0FMSojPJDGl8FHMhX5gpWqeEPiE+kx+NEmiRVhKmY3kL3HZSUFr8BvLqFjxZxg9/M8
         AJGY41KiV12xexyOkerEia5iDLBvQ3QDBiYbqkxLsXYfVA2RIbOVBThGE4t5hKMac7Rr
         8NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770746112; x=1771350912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+poLTmejxVbfYcsSOzRvcKefsrqWl5laZb8BFe0X7o=;
        b=Xgw7LFgyrp8zd1pJP4vYijRy/jrBVr1kb8YkxDDtjSuoJd43WIkA3tv3ZtiO2KN5FZ
         FgRMzAQNq/Km4AJaqC8WaywbZNuS0266SywgXEtazHpMnVbur6j4MVFORDKB3mzBTASC
         NhdJvKIaCEUI3LcOJbIPy/3I/9MIgTew2zwRwOWv8XalxNojL0nudLk/lRUvzLmLHeiW
         PK+moQU8IncycJ41EJljWypMV4uD01Ag1PS0S3eJqF/Zs3XDm8kM4Ti0NNZilPJRhjfr
         Rlfs1ILfZqMFnYEpXorOnN3+3ZQTX62dRfnClHMs6uvCk3/pJ2Uxx9x+uD0yfH2uThkL
         0tkg==
X-Gm-Message-State: AOJu0YxDUx+ECecCDeER+U7QvTE4FwWQPis8GNSVjPjFT6nuE4+bo7yo
	KOPkLrQldSz4kVpgCWNMTp7wc+GCQVHKrnOsGcCNSJrLsZdqEJaj9e7Bl297iEfqyC+V61FyuvB
	/AWoS2rRr/GEsiyjEamBmieXBk0jfXrM=
X-Gm-Gg: AZuq6aJC6gyMckBf0kvMx5rFK/aqPXxbVYxz0Q82X8/BcOowTsaSfAZbcCc57WhlqTy
	dgzw5Mc40WJ0CnVB+wbXmcAMKhL3KYbmO+css+E9puxey9HalM8FvePX8uxHpVNOT5GQUCfKfhn
	MJDCWPyZBlFulOQXR9Ytne9dqJlH5xbwig3CxKjn6gejRJYlKFdkzXh9rgMuEHzoND7ePOiqkA/
	yzR8d8m0CUEFNNEbZ8JefZAlSojxOcnKHwGthxkX8nBzbxWQVqHuyS0F/E5upFYV6e0gIfyNRyK
	TmV5fEaxjrRFQ58PuVbaQe3YuVeIIGCU5zmoSt8gzAi39Vy8/ozOm9aB/Qq4NAfNhFNbzb+0qba
	3ateV3PgE8LprY9+ZGNrTeJDZ
X-Received: by 2002:a05:7300:5728:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2ba8cdc7a85mr628301eec.7.1770746111885; Tue, 10 Feb 2026
 09:55:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com> <20260105-define-rust-helper-v2-9-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-9-51da5f454a67@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 18:54:59 +0100
X-Gm-Features: AZwV_Qg0i0d6Gg0RtB9w2suS8u2wGLp4f8ZY6GbC3pc07HiorcLgIJCxJjCkYHk
Message-ID: <CANiq72=-Xh3wVA=nu7eYOEqR9V8jpLziaVHTFXh2n3jYAsrzvA@mail.gmail.com>
Subject: Re: [PATCH v2 09/27] rust: jump_label: add __rust_helper to helpers
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 2:08=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> This is needed to inline these helpers into Rust code.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Jason Baron <jbaron@akamai.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>

This one is the last one -- I guess if new ones were added during the
merge window, we can have a v3 next cycle with this one plus any new
ones.

Otherwise, I guess I will end up applying it after -rc1 -- and
Acked-by would be nice.

Thanks!

Cheers,
Miguel
