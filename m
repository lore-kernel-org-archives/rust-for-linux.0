Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4B1CB9EA
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733164223; cv=none; b=RYdhHgXBbHmbiB7s4DCgWZP8qBhQliVQv2CLnjNEn6XdO3XYwGeX5x6KVPKc8+LvZY3C9EixHpxWzXelZnaIzXLy+FUOvOooSUB+gCKTzjWok+OYKz2p/Pnr4dK4cHLcZ/lEVizGlzKRDeNods2uKoGniIj528hYiLu8Cq5lVsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733164223; c=relaxed/simple;
	bh=GgmZVBBeUurbTkWGSapkRuZfRSTPNsPGz4hhA5lctAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byhCP0ROs5N6zB8wv0K+Ceus4jEemGcstyyI0pJU7NFhlxRM0ccwuWeHzc11K4Rk6PDB3lLa6wDEentvsX7JMFzSY76c8z8GhmxuFmtu1wPCGxOZpD+KNz+iowW+qfNr5umNDvxrnQvq3FTum7Utm0rvKTIerx1qSJapizvZRR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlpykBLN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlpykBLN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2154d8df140so3589525ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Dec 2024 10:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733164222; x=1733769022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgmZVBBeUurbTkWGSapkRuZfRSTPNsPGz4hhA5lctAY=;
        b=WlpykBLNbdyQt8I/ghwi9irBduZznSjmdh0tlEAP8g1nlQa5ih8bIqYAdEoFRJ97/J
         AzSG4M7jB0xUGIgm3YNc7bPlJuAwOtmSiQUPutzJoaUfS/e/zBsSBZU5sEI5P19UvHd7
         93DSDsAY6gNYWTMUs1MYEstTzesvrhM4k0xqGBGKjHEihmPp2v52Xze8SLxS4fbi1BbU
         hJNEi7rBPkJoVN18dBidpFGW98QWdmFAgfkWBVNSgz+jFwHS2MbeJeb2W42W2+xWzbcU
         CbOmZmGUzgCwY/hu85rcUzq+7RaXhSsNDKNmwGq4mpa6QGMshiRBSAJAZUdJsHmamnV/
         PFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733164222; x=1733769022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgmZVBBeUurbTkWGSapkRuZfRSTPNsPGz4hhA5lctAY=;
        b=QZxRKb7oq/Cbaod2TVtYmSr4KpZd/LxQw0zeu3MBfmwTZdEhbW2/Qx8IZ9DBlG3hoG
         CJSxMp8rnoiC6iQ/zWWAEYtA4PAfPXmyfWr/okRq84+HIzpOwZEHMO79mOz7EPzew1SZ
         Erza71vCAnyCLQgKCEpbVuxY++Uk4TLgBGDaLzx2FeatXif+d4VSkNtn/wMEG8F51Ji/
         7nOtGyp+nu+xJGGRd3Ww1urAEDEMiRza8wtYoBat5OHSICDBLUgxsT1UFgDQ4VCXBkss
         nzQkTc5GY8+aBeQ0ordXyDdasghnUAYKRf2r9TB7mQe3L5YUySt+kggJur3WYIOjcwYW
         KdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTQjglvwqhIyfjkGeUv4/T6J6nNnh4TboIrTxNVPBNOmOaC8UNEZ/fzR39YIuC9ODVUapi3axdzaIfz9Gm4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRUyhUlP1WwU6qvhPDf1a83RCrxW5QMd4d7qWClU0A9HmECSq
	FmJkFqE8LCUiuHrWM22PLW1k+xt4J1GYEgvU31mPMK7wBJ2LT90b7W2bkx8EGfAXQft1Y/sUIoj
	TmKIXKhrBM8Q5HCkNunc/MiRe6Sk=
X-Gm-Gg: ASbGncsMR73THtlU0Jpbwo6WS1EJzLvo/L9YdgPu4W0/u5ZMU378yYFB5ukjqzKG5jJ
	YljaOn4224JRd83nQUWIY6Zh5obqYuuo=
X-Google-Smtp-Source: AGHT+IEjWv80UrMf9i9dtdJmRcy/9e3EOFRGr+UjIZprebXJbZcgwttaY5ZIQaTPk9tcA9N9RzF8ynOK4JZkAERL0VE=
X-Received: by 2002:a17:90b:3850:b0:2ee:b665:12b3 with SMTP id
 98e67ed59e1d1-2eeb66516bemr3277754a91.5.1733164221562; Mon, 02 Dec 2024
 10:30:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202085758.67319-1-bk@alpico.io> <2024120251-plank-rinsing-e63b@gregkh>
 <Z02D7Gg_cuMKPgxQ@mias.mediconcil.de> <Z02KUVQ4GEKPKa_H@pollux>
In-Reply-To: <Z02KUVQ4GEKPKa_H@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Dec 2024 19:30:09 +0100
Message-ID: <CANiq72nyAZO7Yw9ZoYq_=O21C6tPCvjt01NVvGD-bxC4mfBL1w@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce KVec::pop()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bernhard Kauer <bk@alpico.io>, Greg KH <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 12:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I don't think this is needed. You're providing an example that can be exe=
cuted
> as KUnit test already with your patch.

Yeah, the example should be good enough for the time being, as long as
we see an actual user.

Cheers,
Miguel
