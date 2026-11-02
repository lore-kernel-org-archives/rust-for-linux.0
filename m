Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793633628;
	b=nE9fzkuRc+VL3skIzXdDhCk4mmwtkRk639iy9szDlrILjauoK8mIUkG3fMNNZym9wCUK
	 8ZnvaLDDOIyspvYW3IbW1qVDSFJc4WW+PxorDJuBGX58JV2aUgGRYFceV3MYxAwcRhwhN
	 xkA46X7FdoePsDQrJNq4DYrnV4DfsXugAE7MNUXxt2j4jjWQIDwNHafPbdUAU+xx95C0L
	 7NJzQX/SRoimGkjvL2BUhvFlFqBuBni+cqPJIJSmcvKxh0zXZOUwxJciuyEX58mC4X2fL
	 Yc6lnNw4V1Hif+UVZl352R/jLYzDajUO4tIW3tkr9tVxNM8eN7u/KzjdIYKGulTbueg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fyou/fJqjaTqJGYGz9GXKCyYm3nQLAoQbUXl4Lxg+kM=;
	b=Qd+uPkT9XTR2rO9zDK3MU99fr14tAipeL+LG6/TetHG6rJi06EndRzF3ufIbOkSeZw0l
	 9dudf+luvEjB1hBolHcM9mnHOxVnkYKAL+1k65//9rwIY9td0STfykCJkcfAhWPg8DSNE
	 7fEct7xCdAu7DqY04TG1B3kv2F9ymseAOj1f/9CHhyY5tV941Y2D3CVhhojKvSS7BJRna
	 KGI+IoWeuEXCd5IZNm3lmIzOcpYHxouBXJAY8OnDrmAq6KexO1QGwfNdo4JUaKmP1nTZH
	 8r5O7fRmdK4FUL5YsnQMtikRiaa+LKWBn/pcL40EKy/fRZ65aJiFsPjcAAFgJgRwKqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DDZQkbY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D4609FDA2
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 15:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61D4609FDA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DDZQkbY3
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab3fc6e388so6188351fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 07:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793633626; cv=none;
        d=google.com; s=arc-20260327;
        b=T+T1fy1B1v53lYYnAyZCyUIODsDNjVnpZ2HUgXrnm95/u9EEJo6xoyNxdEIAMLmszm
         utuQWBcOUDeDL3Ekdq6ZJKif0RlfWfm4t1Mga9BDEvqIBnyScLP8LDjE7aa6J/6vpQ3O
         kTZ4YK3DiYzvnwiOpsbtm8SX6xYQ9rmbGuELzq5Q/vFJE/Wo73wirpnDVboD71Z4Ab0K
         NYkkDQAx6tMrMoIS9MJ0wOsT8tOz+YzeqmGZGv+z9f1xDigSLODm2VYAZ06X9rRi2V43
         xe6sbQhv2TB9MW6o6eZr2UZOTfXa+lyd+3cqD3tGeQq1Vh0g1bBBfW+UKLjHwGO4TG/k
         bnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fyou/fJqjaTqJGYGz9GXKCyYm3nQLAoQbUXl4Lxg+kM=;
        fh=Ex1s5EaGC3rBUN8TOdW8FtAbVyoElUoQxoJGc8T68T0=;
        b=pY2G8oQSSPJR0Kt1E1Mf4C41Y7GZ5MKPjnlH5ti2cKXvXF9Q4q+hxS1Vhtj5KCQ9eb
         JlgGULkT6LcRrJgXY1QP73Mb9T+vEkm9IgBF3sEOtdlw41d17uM6ndWPDlyRokjQhofF
         AS/uLLMV/5dswMczfCijQBHrZy/CY+AvsVw2aI5lW9j56AJTxeDVpz514cJIsjBB4KKI
         nlJInF76VDFrq38hsbyhmY3id1HSmPujZs0LInRD6GJ9+NMmgh1Xcv/ovsDWnkuSoUk4
         ArF0eU9B06DglsAwF6Wq0MlROj0IPZp4GLtxCTNMS1/LRCIEIEPr+r2SRjnToyf4v8Em
         CTkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793633626; x=1794238426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fyou/fJqjaTqJGYGz9GXKCyYm3nQLAoQbUXl4Lxg+kM=;
        b=DDZQkbY3f/MS7LqQ0eEKNUiWx6CVonZ2Kwc4mwu5fay0NKxUREQsf/QCavCwwaqxKs
         72aHo38RiClj34EZjfLwZxaMl29OG/b2i5qRN4DVhANz/cpkhnLU7SVBMphMMjDrIziV
         8CJ8AF8B/p3+ihnEAT9XWCSOOmIhp/54uPHWZKHYPmI6uLYM1q8sc+925svmjisK8vVj
         jTcFmnRP6xUYge4HiWNjriTY0rYyBS5LB4fjg+Di0A+sHvQArgZwDsjIQyyTW6rJDv5m
         28PS0fHHZDbJWEFydUV0+/CwGDkEAnyqBiosi/QrT6RQJ7GQvIpMymE3hLwUawfMobmV
         Fjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633626; x=1794238426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyou/fJqjaTqJGYGz9GXKCyYm3nQLAoQbUXl4Lxg+kM=;
        b=WC7VBMEL+pSMSkxvU+o03+Ko1Q8UM8TyrDnQlQ7fXvwexVNnq1NmXH59zBF1mUcZwf
         c3h2NYlBMMGUHZTTmETL3NMQuDUYBNOnJfNHZ/vFEpNA1BtV+zkzk0Tds0rqdFIzUQXG
         gQoo49GgewQ1qIMPmlQErfOAK8+iYxIRAQ/ENbpFQRdfTfQzZWnDXJw/udtJW/1c3iSz
         EEA/9s462x/iydf2N9DXBKJvboA9A4G7VbxQr+zkLLD/n2knK7UbBlOKcfwr4Lgs4+sC
         5vLPKDTcSiuopINQd3PcLe9nWuAQJpKp3BORZzJnRnMGtcK8DMbaOH9gEOjuYX+wNYko
         /lIg==
X-Forwarded-Encrypted: i=1; AKwUvBzjd/tcKUnFilAsWxDEDWMmhxuVboLXw0EdV00oFqv1WgDtgLVdOmz1F9+eOPAcG48V9fDoYbAnOH3uU3aWvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HPwRZ32MMx0Wf4YBm2MUpPvSoA3QjTP1U7RL3OpBLNK2E9SS3
	ncuZGabqilPc5wkye+awx11ncvR/+B1Rfyt5gzobksH/1Y72AYOdxA7JNVHbO+KWnjX3319JLoC
	6X3jbTUsfIjUA5nmRj04PwxRULyB+PjQ=
X-Gm-Gg: AYBFou1mOTPRmkkYV4j4a4UUIN7Wt1hnBnLmelqEGHsY1n5+LACvMpdGQXgVvMIqATH
	Nh4sz2g6X6BauGDHRBHwGqUOuoNuWVB14hEe3SgyfP0ZOXjyeu3NA1Vr/hOr/WAvJRdeNckoyjO
	MdxoeLlUD3TRLOA7vyAAIRG8VmvSxYfYqgTbu3QZkcwwaonhZzGhnaVZlAlTXBZwIiWQV9d/vTe
	R0LdlaWBhC1N7zWF2lM57rFmY8UgOKXJSw+5LfSEb6hkdz7N4EpPaPVc5DS3o9EJIMhG12WkqcW
	yOaOeRgeDMy/T7AegANm6yI9wsHKs0Gqwd949i79DexDgc424PmIvXvL9fyF7eN3Dt6IswKix/m
	FrJZMXQnuvfyficA6BOrOOucNX+JqdiYiketmOH7yZOH9ip6r0e3ufCjYuwbRa+kkaOohERZSfI
	XmR6I9+neJLJwcKZjRrMPFbkEPYZ8aQEU2+hF/5DE8SbIlfcyZ8JBV/SExNPZkuE2F786mXXPEE
	wpEMEIpoFHpFrXZy2l6m+iggSzI0fcyq9FW
X-Received: by 2002:a05:6512:4041:b0:5bf:a48b:7807 with SMTP id
 2adb3069b0e04-5bfd952024bmr3541751e87.1.1793633626006; Mon, 02 Nov 2026
 07:33:46 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
 <20261031003334.4161188-1-tomo@flapping.org> <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 16:33:26 +0100
X-Gm-Features: AclHuK8-KbB94fn8EBdbNfyJoSwQYIWyY5n1m1PL_m5ogGvNtA1ZGSAK02W1_3c
Message-ID: <CANiq72mjFLQbgfW_f7vAJ+M-95d5s54sBTRfMGYekcRmm7xTAg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, boqun@kernel.org, ojeda@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:08=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Orthogonal, but I dislike the shorthand `Sec` and `Nsec`. I would much
> prefer `Seconds` and `NanoSeconds`. Opinions?

I guess it matches things like `NSEC_PER_USEC`? i.e. C.

(Personally, I don't mind longer identifiers and I tend to prefer them
where reasonable, but sometimes there are other factors to take into
account.)

Another point is whether we should align also our methods too (e.g.
"nanos", which comes from upstream Rust), i.e. with your suggestion,
we would have all `NSEC`, `nanos` and `NanoSeconds`.

Cheers,
Miguel
