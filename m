Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832B33ADA7
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014823; cv=pass; b=GQGgTmVec5H/QSgPnlMz6Cs89qmV3N9yuPE3ZCHwuK/ZNVVLeTI/gI/5IB1/XMdmjdBqO18Ty0ZvZy7ule1K+a1QcWqY/4r6MCpKNGUpPrDUaOtnTDjYoP+Kz7jS80qOzQlMec21dDOjVT6aKxSQl80ympozgc7b65rIzMZcaXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014823; c=relaxed/simple;
	bh=TOm9y+/mhaIt+WJ3XhAryBy1CJ5N7kLgO3K/VS3uHKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz5f2aXw5GXZOhZLKOAiRlUH0Ll27jmU/GLqnsfA6+rb8MFNz6ZOKrfycZQRK/0X29N7faGHEnX4U7zCP6kacIF1POVhrokg/xYYyQ4nlMjxaAT3miII/rNMQilqXOhPAGAqSLxu0qm2INCQvAxATO1dP+m7ZhXBE9afEXFGJJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtDGkl7M; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtDGkl7M"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304f8e80b7eso401082eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 07:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781014822; cv=none;
        d=google.com; s=arc-20240605;
        b=K2VKk9vFg++taxg+6z0rgHV0ORzD7Z24pYLD3Hm6eMDF4PimYIRrmVwPZkCHNUgfaG
         ogwx0IjEsWm/CxToKPGNJydERzIMrXOutPxMFnesii5Lk2hi+YBZgQkEz7S3K5LRbdTq
         MltfQCk0cYL60yGMVCO3kfV0mHUB8Iff5CyPnkg07bqCPrbejXmgUTQ2v6bw9UHHHsaZ
         9qvfjUaq8uNWuHSsjQpCJxZ2Rz1U/c9hhtSOfdHOLUeSa/9CdGFos/Hhj21PsWVjEFlX
         LMGn0I6t1UXOVV6PLdmI7cfSQcJabLK1d0iGqN48rOQnnOhYG1CJ+eLowVs/antLQ/0W
         YQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TOm9y+/mhaIt+WJ3XhAryBy1CJ5N7kLgO3K/VS3uHKY=;
        fh=tQY+oQtThTHb9KM7SnYeG8nnuaQOTOhN3txg0RZZ7sY=;
        b=kGaVJD2HCyWJo3mHJbLYH38NwoyWW0ttzvX1iYEdRiKqkX8k82OcrXCUfHgzitG4Sw
         iLo4kAJCzHrnbMQcvKnBoIVSaljdHVxyQS5sj8BiOxJlOSmuZgoLYDqEi6HWrVBZ1GAO
         d7hna3mdcm5XTVYWKxhi2iLMpGDUhyrcaUHpwi22swU8EUhC9W9+T9AQRyTgKLH8hefE
         RPhQE6zpIXvcxeK/AK2ufc7QpZBirUM0ZtBGKWusThsgyXZQco+6rBj1SkY1QSOeEQNs
         qAyBX3VbwG7L8nFYQPPJAWNXn5AZn0rxTW3kq3y3h4kEfxpcmPXO07ipbStDZlXMD7pp
         iILw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014822; x=1781619622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOm9y+/mhaIt+WJ3XhAryBy1CJ5N7kLgO3K/VS3uHKY=;
        b=EtDGkl7MgIIn85UzF7NjNMBjQfc+byHqHECOSyAQcMhqOZR21u5CvLku+rl9uGWuC1
         eSq+Pl6c6vI73EO3RGJvSyfyH0nmRRWZeTl4YZUhJA/u8pQDopxDvf8oB4dz5A/Ip/6z
         JV8kh56dyt9LkU05PIQq8yEljZ6ZFG4HUv9/Eyy/o/B9EBEtvyiL7sE++vEpFN1tT/rB
         QMbSK+xKhhNtIBX4EcURxj2BbkR3mSCamZKlhR4e9qF4aORhqHjGuxDhRoM+QVpiKV0W
         vjwVHjL5IWSyRAwKndQYUE7O83pDn9QycFkDKcMgqsGc6e5Gzb9SHkQBlfqFTkACxaSX
         MnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014822; x=1781619622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOm9y+/mhaIt+WJ3XhAryBy1CJ5N7kLgO3K/VS3uHKY=;
        b=nfM+S+TKiSSo9QhaJxRzK7k7AbDoPtKu3SEKqFAbc0dzg6bW1NZkHPqbqzfEiiU9xW
         AKI1NMbvICRKj8vjd8ukS9wfdyAaDYeopNdTH3wIwJ7TUHKpQ/ePZ1aNgc9uEtB8eyqc
         KU6s2dScK3kaTiS6go+jxCyuzzUOjBfDJNWngW6UbVQRR3LEFKpLjLCKUVjDCpN0rgWv
         +SaZYwY7T3PvYHkRvj1SI9LrNhHEbHUp2KzkI7nMh9LwlOheLnpqBSi00ZI9AheEEqNL
         hZPZA5rJEoQHalTx6V9Pr0NTHd9QGiz4XYSmdbucdFC+kRUraFcCmxbLqbucGHscgAt1
         foMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BQZU6ZB5OuDG2brtVwQMzTa4aDJLjunLfZocvV1HsMxljGVwiG4zvZLqXS+/0q+hxHHDKvJacie8C/JPxMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziuaxScLvUGJikV0idKgBYfQRF++G8R8kaT5EuLJkJBUJjf4g2
	uus2eSxGyfaDFENvfAr+NLJ0CetAUwNjr7II/uj6HipAx8E6kHP5YHdtpYBIuht2Pc77cUQrbDv
	SSIIWkI8B/Sokd+eohhRUdCB6BC1nfIM=
X-Gm-Gg: Acq92OHnhWJ8MXYx4/4H8jn6lTeWihIjo4ONOAJvnip7+iegxixpQJp0ObKKmyEwEhC
	AvN/TdlXpWoBIVUfSxiksMam6vThX9ee8BGSpIh6JAx6sgJ3SyOFPheXmNloniYBUqmsuISWIAV
	Y9ZOoCNEWm8Pkj9bkTh+MgkAKA9mCKbvagMsRgNwWmLKiuq4X3Y6KWwCUqSCxyLDueWr67fiutD
	a2WUwZBadXAEzYSIvmvRhJTDa96YrGzpRTeTa9VC1xVvpJdpWJdNQoLBtP0Qm4h6AaYSe5xU7KI
	rxLfuCR5HyJeYtw4Xy9ds0e9pAtC0B2oteRBqUsQECPZ5Jt0LsIjC6JO2cT0RHKgv0A401tHcqg
	xcFUcA9/DEo9MG8cKxc+Lw9Kn8mURulQMSg==
X-Received: by 2002:a05:7300:320e:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-3077b76ab86mr6029176eec.6.1781014821449; Tue, 09 Jun 2026
 07:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-queue-data-sync-v1-1-0efff051aaf3@kernel.org>
In-Reply-To: <20260608-queue-data-sync-v1-1-0efff051aaf3@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 16:20:08 +0200
X-Gm-Features: AVVi8Cdwuvw2Lhq2Nlb7NyGOFSjHIC5QLy-H5VBQV6Qi0GBVUV_8tPxmh6vs6C8
Message-ID: <CANiq72mGmRTfauU-HUOyBVSG0GM7q39=6aP8p1djN2cHr5C_Kw@mail.gmail.com>
Subject: Re: [PATCH] rust: block: require `Sync` for `Operations::QueueData`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 10:25=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Fixes: 90d952fac8ac ("rust: block: add `GenDisk` private data support")

Should this be Cc: stable given the hash is old? i.e. 6.18.y+

Cheers,
Miguel
