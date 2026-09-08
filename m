Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE64A49BB
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857386; cv=pass; b=D4aXVrx/3jb1zwq5vUaLSuSQUqlH/Q1KpRR2CMTsIxqEmZ6dG0oBw2dIbPVcF8OBhTTvXbLmXpaOGbvt4qXK+lxOBiIwkwDrVVnnhrmfHGnDQHaHRk+9FDo3pvz+Do+b/JGLjXvPJ4OLe1LMAEQB4yPIeYJLlU9tGabmf48QHUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857386; c=relaxed/simple;
	bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwhm1NTIyhtS0o7YPd4Q39aERMkZ3tKbj7S9J24gt/0jkm8+WKMvr7FFxcCLPaZkp8+OLmus0Nu7g3kRIms8abLxYENkNRZ22n+K0Vv89vkkU0wLcixnhxiKW7uYH26vbp7bhBhAIpIM67/Bnu3uB0qE24opkwXq1OcHnWXJlQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ja3tTzjK; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ja3tTzjK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-485888b3c3dso4460195f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 01:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788857378; cv=none;
        d=google.com; s=arc-20260327;
        b=DQLh9CCys+RJOPYA5tdgeToWcMqSfmi3MA84Dzym8qmxuZpH4NNpIaS2yvhA11W7NJ
         biOf1epOxv2NB8QXd30FDdScCf2vKlrsrIpg+7F0n6WpajbDHfKDZ5J3ZBogKcK+Erzm
         3PUgZIK5S8lnJ7IGF+4eyReaGRd5CAUmGqLJ8Zkr9IlItG+b6S3CJjlIjjtbKj57g1Bv
         mS/TuVdpyuyC91cgGeHmqFkSE4PAsAqA7N9kjdvsLPbidyuz5AISHE8sG3GLvXv8xWDc
         Pynz+pPNtE5Stbq+rf2cAURZoPykbfkbNA3mvPiwx4E4pE6SLppAApR3pfqeuJOPwqFb
         mYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        fh=ok/xdoGvGk1cgN4NphYLEbfKyADo/FYXYDnGc52GEeg=;
        b=gzm/+uClZzP4+p1/nV2ns0xNUobHMrqrfE17b2qzf+mz8j26qANDz8UmiGH0o1XecX
         uoKStOg0SSYlZHibPNcI4tH4JBhlE75iKV1AHnWCGo+l1ru5Iz3iiWIxMfpXrSZxNrMu
         VyoVHN/fO0YWdppTm1isl75NBO01C8SbqrhscizyzrWHroZKV3N1xPWDr1HzEij6ZlBL
         gZ+Cryo/MhxtJ9v29pZ03tUe70MpVhuOqsFtch5IqecLs05IOvxTJhbtgbErg9z0jXy5
         Yx/C9vx0lZ9tulqhDyTNv56c8Sy44cELL2nZ60pAu6BzjZ1Ok48SckyQN8912YDyZTlm
         DDxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788857378; x=1789462178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        b=Ja3tTzjKLEI0EspicWD/xjfbSz6p8h/8kekpbV4awed9gO5PNOZUW1h5gZB1wVgyfa
         8zVdstTwVB31K68NTPa4JMYYOFV6jEdJpUmALtQ4hEEONE/4ZdHfVMehj6jkfBmwTMDZ
         XqxD2HWqcBynlhRJLv3HCYqinbKIMEDAPr5xBI4w0UQrqQHMy+Ds0PW1zNzYlNZt0pmu
         tpynEroKxXbO1DYqSatFCeqmJIzUOMd6HYbrVxOtEKPFyJD8KwMIyvR/Elqvdz6C8lGb
         0LqPc+KhHDB0JZLtJyKf7uRH8iH4vt4/Ivt4hxt90tK9AJUusExz7cU4AoovzCvwOihB
         +Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857378; x=1789462178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlUILLLz6j/ItrW8OiGkI/9S62d/o220tqGa9E3WryY=;
        b=Lxkrqmso9orX45iMDkOex4PJF5WfFRtXNaNaY5DbpAqTcn57pfd99TJnhVO0efsMuw
         frG1NJaLXkuuM6mTVYGeXXhZLZ74zeXcgghDGp/N2CBx1LTx1lP7m5+r2wdImJI1qodh
         OcXMpFaqjrEKmXOryWnjVHTWpBEUnAnlfow6dPk6d3u6D27bkD2FPQVXkEY0ccNsPwwc
         cyZDL0I6SEmGajMhndGoJPi4kzJye4sINiknXi9KVgOsLGC0w655iquNoVnGCGZn1I/v
         5kp/zuzqbkKqP1WCztQRuTCeVqsoYrasPH0YjdEoj7c6Jx98WQOboZlIbKKjq0/oBr3I
         013Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0pPufqG1EhGaQeq3a6GDYDiDDqdUxfO84uJkEbKVCpFJeth4vNZM0wD7mN0qVdaOKAyFo5poLk4ak3lZG3A==@vger.kernel.org
X-Gm-Message-State: AFuF++lpKPzE9FjV34i5sOqJ22BxAPyj7gQjH4/f95IY67rt2NhJRLtR
	0gaHQxUKAgwV1gioDQzAuUUcTGJPQ333oNvz6zgF2G0dGVfdFfJ+VCS8wENhVWdoea/HxnIIM9B
	smhUo5nuh+18s1FQyIGRlsgEvbyBITn5ZNzP02fn9
X-Gm-Gg: AYBFou3UR2RRDHlLKWC4xhgrgqBDKbng64yZwlvjezlTTiUWm3IvW7LpTA05XBD4J8g
	/RUUpePphe6Xpswv05NqG5Jto19Hj9PCiTyZfZ6T3muDXXBfN3zun6HO7r/xekFHHlsVLc0NpDn
	kBQqR3K9UEYvny5P45j57EJXD8npQZ7b2sx3bg99hirlTdS3HgHEB46uRmte0zEvvUoqmGc6n+Y
	4eIAYIsb3jcBqXvUw8j63XSzd0BEUJiWkMfh57ALCZYFtYJqzjwYkZ1GaXw3eyTQklQip+/GG+I
	XzQo1D/Riddk3pFyzOTflAuHmEGBizxhsEgnw111Lf9lODxszr1IW96rGIfkJzG+Lw2sIlJbh3h
	mi0GdzcyMxtHtaATeEvqfdAyL2WmVBbB15p43gW23
X-Received: by 2002:a5d:6f1e:0:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-4858c166129mr26214143f8f.42.1788857377473; Tue, 08 Sep 2026
 01:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
In-Reply-To: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Sep 2026 10:49:25 +0200
X-Gm-Features: AcwNN1UnrR9dkVHvDMvsysJouh6r2YnSm2JySmMBpuB4OQ_lYYOQ4OyEmCZHEfw
Message-ID: <CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tnp28V0JDmYg@mail.gmail.com>
Subject: Re: [PATCH] rust: maple_tree: implement Send and Sync for MapleTree
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: "Liam R. Howlett" <liam@infradead.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, maple-tree@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.com=
> wrote:
> +// SAFETY: `&MapleTree<T>` never hands out `&T`; all entry access is ser=
ialized
> +// by `ma_lock` or `&mut Guard`, so `T: Send` suffices (`T: Sync` not re=
quired).
> +unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}

This is true now, but will change if load_rcu() from
https://lore.kernel.org/all/20260116-rcu-box-v1-2-38ebfbcd53f0@google.com/
got merged.

It might be better to just pre-emptively require T: Sync now?

Alice
