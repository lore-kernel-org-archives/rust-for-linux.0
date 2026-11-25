Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795608355;
	b=cNkqo2LXgdJYLE6/IeDFbXn8SPgFyA2se7prPAwaa2G8O8X/1X4s4Y3yYtesPQBVoAmR
	 O5Y+X1l27yUHoM73BPFkLE+Eu7qJ9KBxJfgFHWXwSbdMmSA+PgVoBRkdsxx+4jL1J4BMh
	 fqa448Ag6pzR80ilGAzPBX36q4cpScmGolGjgC0mTkxQd6dv4V6NQWmKDzV6pMfYdNo6Y
	 NC/uIFGon/6ChUjwvTMfDh+LBsR+Hdylw8SV/s2xFlas7f34rhzBPrCYS6FQtTmOWFtg6
	 TUozt9Tc5GTLpdBQ854s3oqoS/G8kQsgWuOtndrSf+oSf+otuH4eVp24dSzVCVA8hEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
	b=BERcIhvnyKg53CKIOJFJ9gdFMyhk0Jg85qDEIV2fN5JH3DtltTJIVSwmky2NlwIaL6NE
	 owHgBGJu3ip9NRcr58F20ouhhjEzqfN8ZWkYz2llriD7FxI3s2DZLQ1dqjmzrEXzTbMr5
	 8Yj8Y/STuOOjrcOqcG5Q25klq0CdwX4hx4dzzsflQ8ecqOWhVQUouEU/7lTG8d4B28tWM
	 66xx/Gyo6XMyNY3ixHcn7EhUqtuCKImdF9U5Hb7qeMV9ODGzi8UEGqeuPu4i3Q1jAjWmC
	 U17HVl2x1Lif6982v8K71ZXRbmnusk2afkwJ3KCYJEBkfsn9W/5KXfhA1/qBqgoAllA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pjX6QKXG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF32606A323
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 12:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF32606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pjX6QKXG
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3329603f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 04:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608353; cv=none;
        d=google.com; s=arc-20260327;
        b=ghDtPFxVbVWLa+a/w6GAVsx67rqkvYaA8Iy8Ck5xWM+n/SaUdcUMKRbgiPCYlm49Df
         a8AINiMj7mf6AQyGZpW9YK9vTd9ov43fEnl16AEz0nY5RnV77pIijLTUjhNE/nkdojB3
         nrcN2pSD1kxoTQTN0cbfyx1shmXOuKZOHtL9+r30p3xnR6Vksr3D+vnbPcG2xJE++IN5
         BW6WbJrQdW9M7XIl731rYAwEkMAkxApp17w61Wyw+ymCAObK2GehHNV27bwtYD4o7+Dr
         7pipeci5WLA9gnGxGGnFQYCZQhxkQRGkQLDIIp9ROQlAu4hCiuVQqr4q9AqmLwCx06va
         QtJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        fh=y3kG97Jj+Q47TnK+bWGTTn5deuWc6SoUdXeOM4G8g44=;
        b=sT2atZacLVCNlKYhLuwv8T8qptHhL3ZgXnSNYjCpTTyePJLqFR2tSzMsuUXLOHnzlu
         Ppc2n7LGbfdEYOCHpe5zUexnTu5671r2/M3pZ7FL+9qJQLmbTj2IHidI5Mg8qtsFP6E4
         sqvNABwKvN6zi6hC1bdNgqo2wKrLgCqAcLQG5t1iwPeN0M0YOwVV3sxNXUxK5w2GRgoA
         vXrw6Jb0ioFljgfWFFl/XdVR8lAOH2rM93zf0npYg6k9WCD589KJWxweE9U8/gWtH5an
         clC5ArOCG/5xHmF36VaGMv8bIvNMk+54hUyrKyRaBnlE6R0l9g1OQRpx3wpMFl52CJin
         /xBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795608353; x=1796213153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        b=pjX6QKXG1IYWPuNjl0k+8QjE5ymS8vtEytzSOtJkfs1RHFY0DcWjq5Ki3RkEBzUwjr
         fET2ZoGdpDQVz76KNEMLQ3W3K4BGMAqGag+pH2GQDU8ylUe9pUwzC9r10veWdEZhjwFf
         RVfga+T1900YQda9M99rTh3z82hVG8MYmNK5nq6POAKh1DSNZmbD4OeZl4P7IG/ruDyt
         e1TOEFMvwZsON5XeNlcDp70bR/0lYIKov3PlwK+VAn9QLLQo52NE0o17/I7r1j3n+Sl6
         cxWNQuMvE0tun2uMMH4uMbUmrTM5cOVIjjaDXz8yjG8O7Vv5XfB7f3KvBmtBwISInZOY
         dL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608353; x=1796213153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        b=nm0WtoIIqQLELMWD1COM+YAcLF/YaKnWS+d6WNM24ORriHrMNee+QVRIxtyi5YVUpw
         8cWNSH75Kme3uDUZoniHraTcL+/6Bf5rRyRc5lHCJW9ZccE6OnA8waW7dnnLXMIw7L9+
         +pcK9CPdlm4JtW16bKi4EHti/2ABqkoK6lu/kZ3YaJ7VblBFjG7zg7YShavrEuHVvF30
         CKCOs378+vksqv8MlkqYdOVDPsCdLM5lLHxlK43TU0r7SoFYQ1j0JWEnXEh7bWo5lYy9
         Dl60P5tviDGLHHt/LjCIrSmdJEXxrwobgQBexti6QmEKRvAGjQG0q/2nsLvIKDMWcqP8
         ti1Q==
X-Forwarded-Encrypted: i=1; AL+hErGSQU0tHBNcCaQFVhwNx5Exw+Lb2/blzcu04AZeD2Y1x1qC4QUW+sdmfhMmHPrhwzzxr1L5uHjRIG3bFVhDgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zqWy3Vr76Mn7w/MBkZ4GpoMXiOg5+D8/dMuXpGt9CQD1ymLxh
	Z/yQ6Ik48fwE9o9prKhQxjXHzzmsy7ShoMjw/IuoXrmsTKxblp+HUeL/ch9erDvY5TcR7qh4jGj
	rx2w7Yft2L6uAtIvunb3Y0Pp3whTUGxXr/sqCGgzF
X-Gm-Gg: AZFdTZcstmV+bUInbnIo1ls51y85+PJTMjq3RzkipnJLVkXnGhRbcsmdgEDMrUYk6ag
	Bsy1eLqlumnfnNx+Tm0bkg8hZ/JefRA5lAYvauuXxsDDoUp7GWD8j3RL2hlrfsHrzWaq8eRmhOj
	MGjzMaTEKrcO4f2q6pgdoQh/yvRQlpmiCKY37/nlDe09+fclR3CBXou+ma9j+ECZZq3wcJZRtVh
	kh8MBLDVGaPyiowNroqRX3wnULoXxaBdY6zozDs9z8MxMLYXncQrSgKlT1FCl5hL19VVQhR8H0S
	oO102s2F/bguPr9Fpu93I2VIvYmR2WcmLhpoO5TEPOLPRCAxmPnc9K2gud8ixQ1QEksE10H4eTw
	8dlCrOrcRYmjI6qIDYg6PsjIVqjLnpk4BpPI3+4kMcM2QMdfnuzJ7tpQ/wMfbki2YMUNXfBl9LO
	/Qc3prfSmGOWtDKmRjQoAy+kkf7SDe11KfXpUt//g69sDd
X-Received: by 2002:a05:6000:490a:b0:4b7:80c1:11bd with SMTP id
 ffacd0b85a97d-4b780c1127cmr8568730f8f.35.1795608352904; Wed, 25 Nov 2026
 04:05:52 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
 <20261118-ordered-wq-cancel-v1-1-916e01f9affe@google.com> <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
In-Reply-To: <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Nov 2026 12:05:38 +0000
X-Gm-Features: Aa3M54oB_Bc5JJabfyDqaJiI78UWC2_tVPgPCR0cvXKqYj-o-7hWp3ZKJEhfypQ
Message-ID: <CAH5fLgh7b7vFj4y7Pi-s2-4KuwUQg1C1HD6VdDTTkd+xRWaURg@mail.gmail.com>
Subject: Re: [PATCH 1/2] workqueue: fix cancel_work_sync() on ordered workqueues
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:29=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Alice.
>
> On Wed, Nov 18, 2026 at 05:09:51PM +0000, Alice Ryhl wrote:
> > +             if (unlikely(pwq->wq->flags & __WQ_ORDERED)) {
> > +                     struct pool_workqueue *oldest_pwq =3D
> > +                             list_first_or_null_rcu(&pwq->wq->pwqs,
> > +                                                    struct pool_workqu=
eue,
> > +                                                    pwqs_node);
> > +
> > +                     if (oldest_pwq)
> > +                             offq_pool =3D oldest_pwq->pool;
> > +             }
>
> @pwq still has @work queued on it here, so it's linked on wq->pwqs and th=
e
> list can't be empty. Maybe drop the NULL check? e.g.
>
>   if (unlikely(pwq->wq->flags & __WQ_ORDERED))
>         offq_pool =3D list_entry_rcu(pwq->wq->pwqs.next, struct pool_work=
queue,
>                                    pwqs_node)->pool;
>
> Thanks.

Updated!

While I have you, is there any chance you could look at
https://lore.kernel.org/all/20261119-rust-workqueue-v4-0-707c68994940@googl=
e.com/
?

If possible, once folks from the Rust side have reviewed it, I'd like
to land it through drm-rust-next together with the things that depend
on it.

Alice
