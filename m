Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D7F19CC0C
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903879; cv=none; b=EqjxZMsYkQ7OLIN5Y5Tov2Bu9i+a46VdNTFqCH9NyK48ajfHmR/zysD3peHjeOAs5PlPQ2fmXbivyc15DDldfbj5T3EtKdZmoLLVm3a/9lAkN4WJg4caoSPIOVxcH/OBDYRHKSZO8kFXvV+7Ay1RXAzeMcKRxy1+t0bUCEsSv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903879; c=relaxed/simple;
	bh=DoCe7JxWGTYdYqVUaCsDH3VAw3+RGhI8w/LkIHAEVdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evhMDAt+6mUHy5upPknb6AWb33gM2EeTDvjSge2LEYYDqESOCir8mFhe5Vk9PsSmAMd6Df5fqODzc/RCTV80bsuRz6xvvXWYTdCMLqgexOj7kO3BeQorMx+apoM1LX4sjYxqMGtpTcYbK2ZbeKaKIVblM7mWT4YCilPY63pBnbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TmfIRVdY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TmfIRVdY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d447de11dso3015343f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 04:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728903876; x=1729508676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoCe7JxWGTYdYqVUaCsDH3VAw3+RGhI8w/LkIHAEVdE=;
        b=TmfIRVdY92NJWg4KoTvdok06B+PMViP3KyJIpiD1pnTqa2Af91Et44KT3S9PzfxoVi
         m4b5M5fEaQ9bTiHguZHRb+VPQWp682fMBJ1TXOPCoSr5QMD7TFFRzmHnmMwaqrpkj4M2
         CJZ6Ftq8IEEHNQf9Chfxb9yJlps0igSR9yJ9nLg4DC0TyL/krAjXlaiQ+BMf96dPCi7G
         lanCvusr90eZDOYRseCK29eYgIvLb9xpRnMWbNNPwVw+U7yizgreysCLQhbX4LW/KD3P
         KjcDEvqqWF3iHJsz2ef9KJ5s/q9Ty1YZ/3QVEhNKqgQ9m2XF0FbVAheudKfLhIC7Uo3N
         CaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903876; x=1729508676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoCe7JxWGTYdYqVUaCsDH3VAw3+RGhI8w/LkIHAEVdE=;
        b=mRM0X1HmI5cZLg1HEJ8KSflKKQ7jhuxk2jbtOmgyswPAsiuY6xKk70htZfWtuIOLZR
         YzkQmkim/M4xDvkp7IQgYP9nIImUVTNTsRcK7jSlIHVkATxSMKt5DN95H766glneZRxL
         YJeu3J3oPaejcEujuI0GhQfPvUuChhC2pezB8q0k7P7Uq5RMguFVtBDyWaJWoAxtinfy
         mnYzZOeGlXsmCZ1o/Nbjr5851ao+VodBmaBOCS+sXWVCudYJyii8lFA2AIzOzYHoKE60
         aUGJlJ42cinMZ72fSVAuWYU7MmAp+fh+Jt57Sm06SjLjIdnMUXngohfOGW+G/CRfaQne
         PlyA==
X-Forwarded-Encrypted: i=1; AJvYcCXWNaE+GtLIEQYj+elfaU4cpJ4NBsfEDmqENAjNHI1d4S3LaJhf3hQgqpSY1el3jAtkG3eODyaH0R2YqemQYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyORObw8OfFHKNPhWpflvRQyXBKqWXNcBp++wFHoYiklqTWPIq8
	UJKg9l9eLXhX4BUX0JAj4roA2BnDMkakSvwc1/5MF5WwJI+QoiSaMVdEItxf+HOaU190Ca3Mm0O
	7GNikznItH4ebaA7BoKQew1bnWqYOdGZadrFJ
X-Google-Smtp-Source: AGHT+IG0vcxlWp8oOpzZD1e0PNkZb5Z7rfiqa/opvTS/AGs0FHWq5h6FwO7+lfDEtzG1cpZ1FBaIfJOUciaG6My6avU=
X-Received: by 2002:a5d:4244:0:b0:37d:30e7:3865 with SMTP id
 ffacd0b85a97d-37d5521ac3fmr7606788f8f.34.1728903876212; Mon, 14 Oct 2024
 04:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>
 <ZwowM_YKc8Ktzgzr@boqun-archlinux> <Zwowy1ABlKJDbuOb@boqun-archlinux>
In-Reply-To: <Zwowy1ABlKJDbuOb@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 13:04:23 +0200
Message-ID: <CAH5fLghjBnubXnR4x66dRqpAn=yOyNcpHBJ_t9TjkfwsP6gGEQ@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: Enable execution of doctests
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 10:18=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Sat, Oct 12, 2024 at 01:15:47AM -0700, Boqun Feng wrote:
> [...]
> > Otherwise this patch looks good to me.
> >
>
> Oh, but you may want to Cc other Rust maintainers and reviewers next
> time ;-)

It should go to the workqueue maintainers too, especially Tejun Heo.

Alice
