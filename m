Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2D39184D
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733034; cv=pass; b=a6jxkLE292rUTJE6xZ6VWE3fXvtm/xJe8VH23cd1LlVhPQWMI8/hKwnWNsznATb2C7DCqRENrfdRMR5xtGJaTj6XaCI/dDFtUIZLOlt7bnSsNERi5rbugIlqY9l8cdknaez93qe65aXXWGtIpkx6GGy4u0leWY1/WSSjY0Y7v6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733034; c=relaxed/simple;
	bh=E0B6xp0wJyvQ6PdHIwJ2lqaw6PipcVBjD7iOAyWuQQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMTKe4T2Z18YhSPewvvyTSHry+1y5BDPrRWn2JRo4eAaGpSF+onTAO8tAcGfGTxXiKDDBKhi/QCx89/YJl+R+OjNqefzEid9IUYb0SiDbI3yk4hO9NcUX04LRNCOvYVBfmTJlV9vydYcOWvK54J/lBjjz88rtTax3Tkh6K9vGf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrJwNFv+; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrJwNFv+"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128edc72f3eso386378c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 00:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773733030; cv=none;
        d=google.com; s=arc-20240605;
        b=Ii+nuwbVRxW3J+gIJ4wGVleKJbHiIlBg32QmkWoe1R/k2BcCY/ERUr7xDD5Fj4rUNp
         yfvDATs/XjjPFv+JGYgbXRbDUXAGGmAsNjE8h1zrkg6OeeywsXnt8BosVvjO8yTqMQ+R
         ezm1iVgt4shk10plo5maDQcmc6/5BYVtvxHPa51XHZaEoE89ObtRjR0YQuXx9wwfSxIn
         kHbKXGbAVS4fQxV6Q4ozgv9kVAG/eqnYsNf5qU0jdAsFSSTEi80XBAIUJqsklio/XYm6
         1gIgYXer3XC9Tvc7qKVBsNeLAkSZ3spaitr3MUAMBKzuq77UVRLSl8wIRmLOilaNknL0
         lIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0B6xp0wJyvQ6PdHIwJ2lqaw6PipcVBjD7iOAyWuQQI=;
        fh=FBnGvh6UC4pnFR/2/49FTjqzMxaeN7QsSsDfb3et34o=;
        b=TX/qRvkjqYWtml3oKdH1OpiA6M1sDjTFVP8riUE6lTcVZKHdYMm8prUDQGOlgn9Te2
         Lb5ADzk+DbqfOCYZQEl+zyWZSHawuoT0uKjxvdLvGfVCulOHnH9qrCakEMhjQCHBAHV8
         kBs87YNCA3uV0zPqNnyIsEXzjf4FQYRTvQJWhlMrphnxYDAcDRN1iXWZd9FGi8/aHstr
         sRoRuZKZG31L/3mQ69K5FnYxKlmwuxE0bQW0kQ5CL5sqBsB7bulb5hcwX9mRHaIlTKUe
         tKRnnJN3eg51rKsYZp5aMQaijmHCTEXI/BCiEmCrvzh8DkAJ1NaVs19mL2yXJwrC7UD9
         qPEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773733030; x=1774337830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0B6xp0wJyvQ6PdHIwJ2lqaw6PipcVBjD7iOAyWuQQI=;
        b=DrJwNFv+qJ+OkVj3u3T75e1Zwk5mDgFeoYXTSIHD1XHeqSpNxHpXkJ32aqxUf1MDC6
         XW3M130T+VkPLzZQbvFarB8MPLJxhORqRTTRayjFUHoyJK6I9lO+EQxVo1ctNJG/TkZX
         14L0SVjZM6uQP1gmimmOISU/QCMGoXTrTqfkJoZl/F8S2VUtVWc0YEFACfRN5bmkm2Eo
         TdrtnXb6f1A4rGWAhaTPUx3dBPt/VTZQ87SZM9YpmQ6IN6iVkYUGTqsLLD5mSd9tz1us
         WOqGLFUJ0oub2vkQPCYwW6BL7TSBKz5rjQgOQFLcAu+t4419Zl8SKhNMsWLv7V8Lukr3
         fPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733030; x=1774337830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0B6xp0wJyvQ6PdHIwJ2lqaw6PipcVBjD7iOAyWuQQI=;
        b=S7Ngff3AN1UT1A1SYwI5xhmIfArY6gKIsoOT05Kgwo9bAGiULR4jds2WkHwIqMTqM3
         C7u9Jn2ZtNvLouls8evGSpbbOckwb9rtZYnyUmdAteoU3jSRpfWYMaCgefdsOmpYKYQ4
         RGcFOAZ7NNleiq8VFDVWeHVzoOeliyISS3r+JGd55o/UBSO9548Rn9HH+1nEVAnXYb1F
         9+LbtEfOngTUIokriRNIFq6XvYJyClGQNTB4D0WjUefnN9VALxm1kFjak0yxYVxwRiQZ
         MtM0ZK8wf/2yJVWg+JOIdvPjkhQBUfDK/j/6Ocdywwh2u6hvlv+2lBEdOGRG8+un6lTo
         abbA==
X-Forwarded-Encrypted: i=1; AJvYcCUrhytwqNW5kW4JpC0G0RzXilLlcD1W1kVfqdEAO0+zqXetERZdP5SoCU0Kv78DTiaAm4hdeF2wz6C34j0Fpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9KE8PN0bY9Y4f7VPYP5+P4jn+xYSDPrBvZZ6rwogiSKFSP44y
	vJgibLDHwXZMVgXUdQEdNSqrasqZGI7NbRFDgW1uLERjVFFrUdhx/qS7ZDctKGbzSgE+hfWoXnS
	LrXp2xHcoaASEOt4NNnLsCH4k2b8ZKag=
X-Gm-Gg: ATEYQzwWM9Uj5UP+b6rpWviGEP1JwWweg/j60yryQGE4RfErXn7SQud1msRGHyaL14y
	qdgRo8BqAV20GqVoLrSEsCMXcddRL14uulYNI6SyZGaS691BX5b7AQeg804VpLsKV9Cq3UIS40N
	z279NQA5kMQJTo+C1GCsOYQQdhKI+DlujdEsVZIQecTjXFL0EIPm+Cmadk/pwf05GUfKkDt485x
	imW5GKLlsKbxCn7UWC9XNaKZYQQaRBXmDDdNkvKmxX5VHN2GuxBYOnpB6mOsA8IqYHjalOEeRYv
	nW8igpodPQi1tnQyVSuSpXPRdnv+shu0cDlwVXEVqdBhrAtbLr7m1nmmLerTiavZZ8rUWGKdyj5
	PbJxhR1Qhxtk0QH3Z+aIP34A=
X-Received: by 2002:a05:7301:fa8b:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2bea5537069mr3995398eec.3.1773733030216; Tue, 17 Mar 2026
 00:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <878qcpbux5.fsf@kernel.org> <87ikb2mrib.fsf@t14s.mail-host-address-is-not-set>
 <abiXkTSpZ8CWbJVx@kbusch-mbp> <7a4dfa82-41af-401f-aa92-5bd19fe6f654@suse.de>
In-Reply-To: <7a4dfa82-41af-401f-aa92-5bd19fe6f654@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 08:36:57 +0100
X-Gm-Features: AaiRm53AuTsuPzxhbX3fcIx0pIKfHjonAsAVpgz9qlBMfy9W6L4Yw7Mbrtmdy1c
Message-ID: <CANiq72mMtRqXxeCsa1ys8YbxnH5-fm6SsdbD7TPFOsttdytadQ@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC][RESEND] Status of Rust in the block subsystem
To: Hannes Reinecke <hare@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	lsf-pc@lists.linux-foundation.org, linux-block@vger.kernel.org, 
	Bart Van Assche <bvanassche@acm.org>, Chaitanya Kulkarni <chaitanyak@nvidia.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Daniel Gomez <da.gomez@samsung.com>, 
	Hans Holmberg <Hans.Holmberg@wdc.com>, Jan Kara <jack@suse.cz>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, John Pittman <jpittman@redhat.com>, 
	John Stultz <jstultz@google.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Ming Lei <ming.lei@redhat.com>, 
	Niklas Cassel <cassel@kernel.org>, Nitesh Shetty <nj.shetty@samsung.com>, 
	Oliver Mangold <oliver.mangold@pm.me>, Pankaj Raghav <kernel@pankajraghav.com>, 
	"Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>, Theodore Tso <tytso@mit.edu>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, gost.dev@samsung.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 8:18=E2=80=AFAM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> While I do see the original appeal to have a rust-nvme driver, having
> one will just lead to confusion on all sides, especially for distros.
> (Why is it there? should it be preferred to the original one? Do we
> have to support both of them? Are there features missing in either
> of these drivers?)
> In general we are trying hard to avoid duplication in the linux kernel,
> especially on the driver side. We constantly have to fight^Wargue
> with driver vendors why duplicating existing drivers to support new
> hardware is a bad idea, so we really should not start now just because
> the driver is written in another language.
> (That really might be giving vendors bad ideas :-)

I think when Andreas refers to "reference driver" he may be referring
to the https://rust-for-linux.com/rust-reference-drivers framework. If
so, those are meant to be exceptional, temporary and well-justified.

So vendors cannot use it as an excuse to try to duplicate stuff (they
may try, but it should be clear it is not the same case).

And, for users, we should make it so that it is pretty clear they are
not intended to be used. Perhaps they could be gated behind EXPERT or
BROKEN or staging or similar. Perhaps even a new Kconfig option to
mark the ones we have (proposed in the list and in-tree) and that
allows to easily grep and to tweak the conditions under they can be
enabled etc.

Now, with that said, like Keith mentions, it should nevertheless be
clear what the final user of the abstractions are, i.e. the goal is to
bootstrap other code which will not be dead.

I hope that helps...

Cheers,
Miguel
