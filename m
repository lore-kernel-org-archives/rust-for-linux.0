Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575889;
	b=rAicYg4bNy6SF8jUiHp3wq4K33XgwuKOg6cdwT5697U7xzAy0pW906eq9VcbJC5EkUwv
	 +BepkrS1ddLGO/BBCY7AHjHR2m4bWeFFIYlVmZCZj8cjxxtbZVouSkclYCKa5s98jYvzo
	 KlCr2XKB9llfoqxGQKrdCfYmEcEwMkEZIPk68es6K57/sW8HzM8oubK6sJYKwOHMjdy2j
	 mhrQHIBJH+WZyD6woC2DmVwan9PcIhEfVp1ER2By43VGwk1y7A+QBlwLkEUXcAiWXUanr
	 wGpZQhKimvghnTjv1I3e0LepIQsYAAlcHK4mn56y/B1sS+WDKvERgsCn8HOqx4VYjMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4wdEo8+3sGqfbZwZCNWKmwnBJlPn4YSxWgWSRHqE+f4=;
	b=rxzZ6k0t5kbM6dsmDXuk7sCYRe5Q0mRLYZxYoJZKDu5pcRrqD6jikI9rx1YstkYh1H+8
	 p8jCOPqvYPlJrd/P/A//6vnsxaK4dVKd+Pk9adZzFIaO12s+Bvw0Rj7kuwyyqMCEMkdNR
	 xMqI4hAW0fBkY67G00osJJtBsAcq+7whcm9zMu+Zo67/QOzU3Bye3Fk5wglMjTlwSfZxZ
	 0ePuOfnS9EuUDKPNUvr2dOBHyFCFqEgT/St0u8aXzscWoO+PbYKj62A3KGuRTsJY7yCF7
	 OYFvayNSUq78lw4oo35/ykFNofRoIxR8C44JY3ucRZJNSsTu5yorl0hMQclGOYG2k3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hBUBamqX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1809606A32A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1809606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hBUBamqX
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3550dd02c9cso50156eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575888; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0vKh17IoCZGNJSEWSB1EpxE4VvytHNfwMnG/0R3wR399qCNstUN56KbI1nZp4UZrg
         xgc7/ZewtF1CeJz6fe+amUw1EGUqPVx0opZMnr4in4lJeqNQlc+5rWxZVDzC0cZ6Jxug
         1jjWyjRmpGV5em/0yT4WrncyZXKM8VRsnFfcSr8tzzI5H2zQ4PzRfw1SVZ7eH2tNilJd
         tDnYO3a/rQ7+QgOT8hd1g0BKZAmawhqd4dclXi19hCHFx7pfJa72ic+jbD4TjKYD6zR2
         VRP+MYc3MGUY1IJWy/qAGYhrg4s8VfOief6/ehZ/N45NCYdiEEJUGCd6ut2KzgY9L29X
         ZH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4wdEo8+3sGqfbZwZCNWKmwnBJlPn4YSxWgWSRHqE+f4=;
        fh=EMCwy+a0VeYAXJ3Pclyu59uHZujFBRhRxKU3hcdd0Xw=;
        b=qwy1vffXbP+XSnewfmjLPOzsP2HIvw7kFFgFaPxoC7xmD1IZutc4dd79Y5wV0GnuAn
         60Ds5JxjLqyzN7mty4QEGF0Hu6BhRwbJoQJXkYFz441LcQLR3Uvnyt/z6iAEXgGr4Oe2
         Dns40aYHtQwKqZetUsBGOF8HuLefIrADzvRdZmXrJ5j/ZO/X5Oz2fc62oh1UFkI7Td1b
         kizl6Me7AGLrnVM6JgG/2/byQg3CdlRBKpQSAYCqXffD1YbhGLQj9rHKNZ3r094wTHlv
         i5+jZKxRVW5PuqnZRcwcSP6hsEtpYpFcD+p5USuj8CGlw/NMJieGlrcjYRWb9KBhPyqz
         yOjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575888; x=1793180688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wdEo8+3sGqfbZwZCNWKmwnBJlPn4YSxWgWSRHqE+f4=;
        b=hBUBamqXA+oWdt5ptEKRaT4hVRRRU3E8B9VaN7HeCDsMa0JJvk1/GJFvem6KOjjNnl
         X7+5hi6GfgiuAmUjEmReh8JP+zNeLccgjrAHtTQzGruOIGbItqMDvxhhTGlk1Ib2xt3A
         3j3yEFYPd5CG7jZeBRRTc5Bw7uWtjrkjkPp9sMnb4vi9lHew+RswdQsBmzbcQmjc8dPr
         NvF+UHp/WostECPHLJ3T2jgAKqTI8sWrUuTgRwXUH7VTDGEPqQ4A7k8T2qAAESMvhOQe
         mz7c7sPNVfaQpFfMPexPfeNV1ZOUr4NJ61GoqGRxgxHfe87J07Bqo8IrWfiR6qNCd4Y6
         GQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575888; x=1793180688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wdEo8+3sGqfbZwZCNWKmwnBJlPn4YSxWgWSRHqE+f4=;
        b=WMmfcaVQx9Mo7Rq9reW8jHefncwOidsZ3N30k5gF/K2SreMkgvlvPuRO+7AQSgcUo3
         SuDbexLTPZBWKTf03l08PL3W8i70pAfEOUmN3PUswp1jCDrzrtdLL7qkV7B4idTN3P1m
         IcqnmPJSxeVolfxrz45wK2lVLdYqmUasoD9BPUsQkY6TFE2q8uu0RPRd/uP1JbeBxYA0
         0EFS41GkuFm2q7nmB2sl9qvGAo9rsnTqUtEJgl1xfJg5GFCEIPDNxx3guhtKizGpjUrp
         DCmfrB4kkOtblQyWhA/T2N4n04+Eg6z4Pada8C0noyC6BQpL3bwifU8YXWeZxGVbnnPD
         aJMw==
X-Forwarded-Encrypted: i=1; AKwUvBzhU8IMGHzIYg9tBaTgIqksbWdkCtcTUnkRY1ABngXDRFwTT0z4xqwU+udCafP39AxIg8++/R0RSamxzxaZjw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6EXD8P7aUroOzFLh94rXwvIOXaPXaC8knxVeGNcw7UN41OdKt
	v1Rh/noMraZ+g+t5Nwltyjglv0vHoblLONJJNuNJSXMjCqcNVW1aNqvHE0MS550SFRBBgWaFi1w
	/C8LlO9kzcyLNUu4ulKBPdNpejRYhrWk=
X-Gm-Gg: AYBFou1+9FFNBoQesdUt0+QEDseYoKKNRl5XpjT5SkX1XZ49WqpK9FYY9F7hiSTCb7t
	LXijuTukKoA7loB0eAgNmUdm9H7T+acik8G1kKUBhy16gCJCMbqLT+Tpkg1mIhnEtCcAOGQHyN9
	nNvk6SW9B7eEQCMYMjVcYabvZcm+otfEaQAFQPsy4ihbkKop9UdnxaAh9j4SgUoU7mkLqW7rY4O
	nLgcNTzYRW5gQPqPxxBTIkGXItrbMhsRMrW/yzaNlwZeSlfxDWix7OygxZiexXJCSWIO1/gw5vS
	OVWrIwvVu+AFa3xbHhIbWZCIAvNbk2C48BDO7YXo0Psefwi4+lPTIykCpNqxRRgqEu09FcjhlbS
	Buxku8MLwaN6U8pHO8hof38I1CNM2clE0Ov0JxyCgG7jPH5ZSMYWRjMgK0in0Ev18gahI4pXdYz
	Bcs9Q9dPQfleqG9lQy9o5xY7qzuodASyluSKTgFZNSP9HmU2np0v9kj7CTy42IhajCvXL8mVZ96
	pQj9JDr10cNfR90XGMeHqM9LBjZh6jbEPsm
X-Received: by 2002:a05:7301:18a5:b0:35c:492b:e310 with SMTP id
 5a478bee46e88-3674866f609mr4077866eec.0.1792575888075; Wed, 21 Oct 2026
 02:44:48 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151243.1595858-1-gprocida@google.com> <CANiq72nqq4oGBWVtSMBhXS6G4H7fYg07ysD7SjnOWWt7R9_ajw@mail.gmail.com>
 <0736f8a2-4f02-486a-9552-dfec74032fad@suse.com>
In-Reply-To: <0736f8a2-4f02-486a-9552-dfec74032fad@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 11:44:34 +0200
X-Gm-Features: AclHuK8amX5EU3v7dgjd5CokhSsYsGgsy-NTiRUBGb12KSwkI1ip79L6KXWAwqg
Message-ID: <CANiq72n8V9=-Wwz9aQOo+VrO5pMqJ5w5hd-44jGjxJ8kXF-Gkw@mail.gmail.com>
Subject: Re: [PATCH] rust: exports: emit ___EXPORT_SYMBOL without C declarations
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Giuliano Procida <gprocida@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:27=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> It should be also ok to move EXPORT_SYMBOL_RUST_GPL() directly into
> include/linux/export.h.

Yeah, that sounds great to me. Probably with a small comment added,
and removing the one in Nova too (which this patch should do anyway --
it is going away, but still).

Cheers,
Miguel
