Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793282773;
	b=4ybLJguMRR+IA4JeB083B7t5GlkD334zZhi2Zoye4iKUu327QYz+0kYdVvry9IfS4dCT
	 dyvfNbTbfwCcPXUf0UGqKEwGbDyfdTLZTldt9t52CH7Ic7tYduegkZjAmC8nlDo2OwROH
	 IrXI/vAF71Ey7cdwjlrSxVaxlqhT1g+dEUGr5GMc2QbTtIntjL9RXvTDUkduUeBXgKcHL
	 ClH/q+Rp85q9P/MdmaQTgggEsvpJ2Q9v7u2YKpkDX6MswJ6K0Ax0K063n8gKnTsp4ddrS
	 Isw5hbQDEupyYe0wXJz5mpPUlffrKqGt7hPPBFrZx4wnxs6+5WjRRsxyRNr+IrRs5Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
	b=KpSznWA/MZZ9RKfJfFEksZCY5Op1iwpZHdUK/NN68/M/Zq2nBx5g0yJhmgzsf1A19QZZ
	 FK05apxwit22qKPJW9yzeyoOHjqQYiMPPzSElft+2A5MhxEt1e51PZoOjitgs0t0CYolj
	 dvMLnaTyOJg4K1cNQ9FCeL8bLLcrMImEx/3yHbBBXptB09vLgODz3ntTxANyXxU9NgrfV
	 kleT3RUQioaayOddL/6gsDWCxP1kJz/V+jO91ddPKR+LyQTU5VVF1EUsg3cfyaSIKVHli
	 Cv6iVkUcG0uYN2Y4F1NRv2eyKY6XkefJCyxRpVHpJrVs7tHrMpNJEYt487fRqtKgZqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PUMIvSwQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD5606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9CD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PUMIvSwQ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso3341990eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 07:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793282772; cv=none;
        d=google.com; s=arc-20260327;
        b=s3cW4Y/UHRrmLU/RWitjgOLeo6T02CJhfm/KA9+ISS8XYJNm2GUPI5O1eXc7r+Y9EL
         D9gk7iXQR3+9tUec2nfhmEg3bi6FFXFbhawXz2RxNBn72SPlkrlOcL3o0BhHOizVZYv0
         w8n+OLAvl6EmWvD29npb+asiDZKO5NcUiTEoTL+oN+tb4WwUjiwAYkdLSraSpAChNiKG
         jYJtXm1aoUEWgk381orFqMMIZnqVZLTJUtC+cQKEkdXdQp6tD8bkuqCY1BN7ngsYHyCF
         Yj485QizJNZgs03h/2zs7LOo05cO1k5KB0Ld09zQ5JFckY36Hwy38fRH/CU7Liz9QL9U
         970Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        fh=RAeS8p37pum5zup+kMSqUv1yxrzrkfC87oTcywNoWl4=;
        b=c4lB77CJ9awbybDRfWjzGS+4tsx7y7UZWOzxVkcSMnh9J1kMXw3G6xB2736Kh97nWB
         aV4pQnFBHbWMfjJ43FuKhBr9TmrIHYFyxGavCRrog4djNiFUl9IH13twYCue4pXqrtlC
         zNSKBRmGNVvCthlf7JNB4ap9oXbtDln0+yK2jUpyJEdzkLBIcO3eNqGsh3ltEy+bg6+L
         Yoy6LHc/jRSgCksDH+vLO+sCL9wuXe5bj7JfS5Cbi2qfsFAnkczEa4iqF2e3hSEl71S4
         fGHMTqI8YEDuGUEvqj+oMRpU6EHW2DnT91GRfQMoB7QC5SOVZmawaDjVUZXPbe7eyXbP
         B0mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793282772; x=1793887572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        b=PUMIvSwQU+R4CLSlB5Lx/jStEGM2g7fWdLaGdT88RoWpXvqMpGBFUnGMn2je4Drajj
         zKzZ/hcw+7aDkUlZ/mLyWEAepcg+lcT2wAP9YwRBYWCHSm1fGMKyYQHabWrLx0tfNecl
         ZgT/Fr+HfZJcaDm5h0++hm+hv05vSxLNZmr+n+rexbNQKK/oTL0E1qhRj9DnN9pa1IzP
         59zS2mtCLGf6oE8pmIY0NttEBy+BRG6jCoqzuUu0RbrqveTk5tPtZCo6/mlPDaA5gbhR
         OBhC58I/7yWrg1nDGhyv0T5mjPl9FUGXaGN49B6cE6vUwOWF4pqrp6UArrajWppcGDSx
         gKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282772; x=1793887572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        b=sLjgmhjCDMPHmw0WR8wR6yQPhCvB91rctVA28deGXOWWhjXF9D6JWFB9VevWdUpvJ8
         tZ23PV4FDiIJ0GD2kY0xtKxq1Ad557c4HaXfYsJHfI9O/LjTZtEzH8BEsdjIHB6ibOE5
         p7k0GOORPozIvCDHEX8Td5xliAgSQenJxLvoSCU6oIu46AKSOaIwTWxDnyav5xA66exc
         EhHKGI77acLH+bPbntJxMe1DvIg/htEz599EqDvZ/6SuUj9FDINLM/Y5kEpqn6LDaqSE
         u/M2kfhWaaNFAOaC9uIqOHOky+fCO70wzEOMAaf2fImL39WwTQRD3A9I91GftxawK6by
         G/QQ==
X-Forwarded-Encrypted: i=1; AKwUvByeSnS9PSjFmnz7sIefiXOfj2EAUWuURnBonru9wlIZGNVo+W2r2fG7CJ/m3600/RUT/c638M9Mz5nOTkY9GQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLipoyMBuwlqXQ6TCxkNtxc6q08r13/BYpcovRcGSAjTTAljGpT
	vxBkHMn0vMxrLRjFK8U/aqiNcRmPHADNvkR0VpSBZMnDtDEjfF/AZ151hF0Ijo6sJSxwC43db2T
	Fo9NlNgHyxt2oYiJnAsgDXBXzCUD5r5330AVpJweH
X-Gm-Gg: AYBFou2OYpvYT/0JdOr9aSTccQEHC3wbhnxuAib2QWzLBj2qYb6ilMO8dvtoCb7+Se/
	0GZYkJYRU6IJ2C3dUuSWGeg/kFtR+sL/Pdev3cIZ2AJCIXYl1Mlsyb5O2xnOQ0b8zl5y4ANQlzq
	njfvVhtASMWlrLnXgE5S1w72LWWWvamqs+G0lSqfTeLPbuQSnBaTu0uW8w3jI7diPPBQBzBWpEh
	w7OQ8QWe/HZK+kL6GROoVXkz97qIzuEzGe7d+5aBZvolqlRCErvliIhAL83dyeQzKEnZ4IovE9h
	4f9hg39BM69258uyoBqal77jSCGJgSaG0mXsB66BuX/tjQG8LXWqFNEGq6Ai0Dn398WOfMtMXa5
	bcAmHguqtPiqeTetZsgkUl4KssXeSx8sqyDBaQsv9lHHBjeWS3xtEKUMTr5hMBPkJapilopzzrD
	JvI0Z64CYbaNLZ60cqRqlCTsG51rbYe7YC2tTZTX0MwiYBiwz/gNTFpaeJ+rBD5bUx
X-Received: by 2002:a05:693c:87d0:20b0:369:daea:812a with SMTP id
 5a478bee46e88-36a203e04ebmr7980604eec.30.1793282771027; Thu, 29 Oct 2026
 07:06:11 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022162116.2282295-2-phasta@kernel.org>
In-Reply-To: <20261022162116.2282295-2-phasta@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 29 Oct 2026 15:05:53 +0100
X-Gm-Features: AclHuK_SoizvoU1-Dr6Iy33-0wETUO3c6OG-X77GiKNsKuJD9voK4ASEhNNET7I
Message-ID: <CAH5fLgiDRJuid2usngucBVNd4tP3R6Xavx-WWoKpN7xMQqv+zQ@mail.gmail.com>
Subject: Re: [PATCH] rust: DmaFence: Implement Deref for FenceContext
To: Philipp Stanner <phasta@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:21=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> A FenceContext carries data, which the user should be able to access.
>
> Implement Deref for FenceContext.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
