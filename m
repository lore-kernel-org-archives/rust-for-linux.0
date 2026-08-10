Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323813E0097
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370340; cv=pass; b=U8qgh5Kvcj7uDuPaOu3LVh1yds7ehjjN3NQtgb/TL2c2dz/3nPn28Tu5OO5sriSApaswK9HOeo1AUgy1+dW+W0sRAu3xwL28hnwjUpkcVubO9nzYJDCMollEClYBlMc9B9wFD1oBdYQwpxDELzLxeKLeXrhCV1zBpZl01fuatW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370340; c=relaxed/simple;
	bh=HkttM5KKhhOKGITeiw7sgkeYVBLeBzcI/mlWJ64DWLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lxr8Sk+LFcgoXWFvbyJFFzoBWhT3BAHMfpQklWgoduILaY1WOlZPLj/BZjGtsowGJoNH2TUBlucLiFCWDp6MeAmyonsJtryXR6QZb/O4OCt/VvgFxaJDd0d/fvgHLndaXXPypSyRaQ4EjOdbqU7Gu2E3sdVNJ8e2wv3kdBwmdL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRRkShFh; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRRkShFh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceeee8c46bso5422335ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786370338; cv=none;
        d=google.com; s=arc-20260327;
        b=hhxIbB6Vc2ZeOrbN8keeOwfDbwre0qFpvSotGQ8olZdelt4BAghqOsPeuFLtAp1x+Q
         rxxgIgHO9Dgw2tdOG3ARAnxYPMvfPKG8ATiCxj0MYGYAkZ12bwcMaBm9Km0EHo8jJCp0
         Zskn6zBGKFGA/hmKAbIyLRQOgP7VfvHHFv0DQwniaQrhYwKdDdnikBK4neGrNvTWOV55
         r+Dt7grGYxDCX+GawcQ+ZdIZPh83TxdekvdFvT77iIsbIvaYcUjtENM5n+90HZdMJzar
         q+c/EORnUBBOZm1gAr/OhXkryGVT2mlnkkZayHsyyXpi8gUy6qKqmhLg61M5YADTtb0L
         GQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05DIUy/NpaRuA5/kd/i1c9UhZmUtP3acQfVQhsjkOis=;
        fh=uWKe9HcNEFPpqrM9zku04ScXa8zWm+mlv171WiHNsw0=;
        b=rHHMAUFfIBnFFLUFDXHcS28ZgP/y5FymPqw/jXwS5bVM8iJ4yZOmlilxOOIFvIYedx
         bEYf3FtBQo3cQIJk5ImoZt//bbbAvNp7LxFdkH0SNxpRrRRpqL1fF25OArSC6fWk1Vs/
         AJJIb7QGGI4Nt5MDU1uwgeWUtpO1A5GpIcb8Xgfmk/63ERZHz69dPQIFaNZbQPAWNsnd
         ehGIeQk7VTxZzwl5b91Qgfx/ey3D67ze5zaiFNPR97dj0mV8uqkQnwBfByKz+nocEynq
         ughW613pAokjB2MC471vjuiQtouoIEZz7HUenl7u1HhWzIEE8kPFHXObPPC96V0CIYHY
         Qyfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370338; x=1786975138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=05DIUy/NpaRuA5/kd/i1c9UhZmUtP3acQfVQhsjkOis=;
        b=qRRkShFhbOrEr4/em7Y9Vwqh80pCQIfopmsNctAQO/HQ+r4GK4pux3ia0lL9LOFBlS
         yi1xGkaWhoCpLnXy90NE+7XMtk3iOEyWgw7KfCiSoMc4CTrMeeAvybPiJhcn62RUyOXN
         3HHsGY0Hd2Zdwo8hUvuk/CocivQzL92y1AzmAdBojMxQcaN5UMCklszvUkypOs9ugVK6
         7fcLPFi3ES6N2KKokqWmvIX37kdYk4ZVyT2CXwrfAr9lztW1keVT9DAIjZiQ87tloVUu
         B5NjSs70B6abEYh8sw/FYkWiha42RHqzdAmNuLkCkkWqb2ORiarKOnADB9Oq3KJK1+nJ
         kx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370338; x=1786975138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05DIUy/NpaRuA5/kd/i1c9UhZmUtP3acQfVQhsjkOis=;
        b=rUZ149h2eh7C0XVaBNGbqQqHH577tum4LN28Js6ZdgSSgmx0zUecdWZe+2Wc+Hx3xt
         SNR5nUoNmJtvEQswA2y57y/gftCp8FvVYA97SKDGsMrWm1Gie8vEH9WN5gMXoTYk4eKl
         ofmdTsUT8zCQX0dYLbuf4X3F8kTNChUy3d7VYqsmM5R04i/lwG9FrnOQTbRje0fVKUBE
         hC8UhyoRPOcrEX7FgQgWL46/UKBZRIqWv+JJLGphGFEU9LJEL2aORqA4Y85jsfV+0KMQ
         S/4VbdH405xvQWzjggVET5ma/tiCTKmdxTHIBNEFiPiAHbkHg/ZXJQ9v9XPF2p1fiXxc
         xkZg==
X-Forwarded-Encrypted: i=1; AHgh+RpD3LjNoTNKOosvY6HUKba3fBCdxsg01Kq07S0uofXiknxC1aDuh4FESNy9n8E1MN3mo/oyMdECkYvJ2FBd9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8BbIaPCzN0QTAx0tW5SomipCyBE7DbNCRCA1Eaw3/BGsdsWAI
	+VXtXupgNlHdEEuuJTdZ3csCjr3thO6o7a4QcM3jTX6GPSUVXhP/VtWoMzfq+zTqNq836kWLWWf
	4rbO8rWbdpf2bVSlp7jKdU+7engW7BRg=
X-Gm-Gg: AR+sD13EQeGQ8JtDpUh9ZQu1NjdXhPy69h3Sfd/6pgLZnYzL4SYjTNRpsB5EO04W6MD
	dehoGZSp8STy4uxeL72Ar8isEZ6KXwlLk+Zqk8AJEyxBbFS7yUH3YOYmJ9e7d7jubMOVVUnDRbh
	IIuS8qq6DBip7xBjdEOclXR0zaaulp/3igZ1Pqv358S6Bje35L1vLq3ezpi2kfjze/ir7ywOzp1
	NErcdsgXlai1yi3tIzlwG4vwXVtuV17t9DvXwq/pHHduSOXHT8naboO5rLY2+wUoZtkXlBn7W8/
	SDssbnkuh8N1mGTbg3XGD5QVdrQRcIBFTHFHh5mvsEMflLKBG94GSWvjaBcXbEKCkyOgnBXYdlW
	Il6rEq4MGBfirUjQngKpaYJgYFuWifu8sqjMuqkBESDUA2xV4c0dHLyeIR6h+
X-Received: by 2002:a17:903:234c:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d0caa0b9a1mr327336005ad.3.1786370338402; Mon, 10 Aug 2026
 06:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev> <20260810093438.208557-1-alvin.sun@linux.dev>
In-Reply-To: <20260810093438.208557-1-alvin.sun@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 15:58:46 +0200
X-Gm-Features: AUfX_mwNdMa4cwxhR_yu8_zWK9n8NGRcK8PDkSgFu_-7OiYkG2QpsDRCIba5rCg
Message-ID: <CANiq72=v76Tp5jvydeHdYcbpAcG+=a305ZV1GCvAhEU-kWxijQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
To: Alvin Sun <sk.alvin.x@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 11:34=E2=80=AFAM Alvin Sun <sk.alvin.x@gmail.com> w=
rote:
>
>   rust: block: mq: use vertical import style
>   rust: block: mq: remove redundant imports and format
>   rust: block: rnull: use vertical import style
>   rust: doctest: use vertical import style

For the block ones, Jens may be picking them; but if
block/Jens/Andreas prefer, I am happy to do so too of course.

For the doctest script one, I will pick it up right away.

Cheers,
Miguel
