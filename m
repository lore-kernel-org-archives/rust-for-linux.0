Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A294963BA
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640757; cv=pass; b=VmfCNQjO6QXgjUfhfRFaPF6XVl19WlVorxwyJIb1h91nhrIuB/aZnkdB1dQW7/kj6oo2GlmcDUCwcdtNcyY+y5JQqhycLWVaXOGsRHUdiol0YYDzCs/IsRxXbuGUd+Xbkt77cuXlUO/hpozgLpUbHc8rJPohxE/d0Gb/1/wS35U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640757; c=relaxed/simple;
	bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcmNVLUJe6SCmjk3h56O0s3qH3BS5/uOAXBuA/mkQJ7UIE9PH5ONjdthIgxxhKDvFHq1G5ytImEVBMywF9l49ZCe9E0RyzYwktS1G10y+Kb26V9MrQVfRdBYxCOltjahTp/IWXTxyOxSxNMJ1MIyD4GZpLQ4aAVAValOoYPZPiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0daqiEx; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0daqiEx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccdce28edeso256435ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 10:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786640755; cv=none;
        d=google.com; s=arc-20260327;
        b=JU6CfNYE1QdGHtLhj6xxq4C6Bfb8EY06MoEJcRXt9UbCnwlK8l0JriGX9pHWNwCaz5
         PRGj8mDlKhEV0C11WpTrKt/OZoICYhl8BsIq6AV4B03XkzkSsfOAttisSv7a1Je1PacS
         J7wRFWDKYgbkeZlw9LBE6bf8/7BN4Etz7keGq+1GRm+Oc73BCtFSYc9tnh4fzwOSQvGg
         zNUy41sPhJF9l6lBoy48AV/PyvqNQOnFXkQCLYFYyJ2rzTyt7GzkwHV2ye1n1nCYn7FG
         6oa/7k2zP2Hx6hOKQjGqIcJ4j4sJm44n6b8oQO5zwMWpvIQWdmVoV60SuN9887yQERVf
         IEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
        fh=stSw3kN/Obwf6irmnXTqjzSnpNninkR2Zp/xb76eimQ=;
        b=bKoLrjRj/oQc5VDXrmcuhwnY4tGfH6HwylJ9tpLCNjZ80aFJDZ0S8jjcH3NhaJSQ91
         0RJ0PPxviZ8kw7GoW+WAz0GLp35nm0ghNQ+/ha9NuSrLlvL5y97LU/C+FJ58andTaOLz
         /0WYdjYHVnmRvG3e0eI5l1x6wyoZuqFQcI6/CQgaTh5bycvfJforqXqHAxguwZxpTfGn
         L4biV3EWRfWStSy1araguF4ekdKYhuXQ+vcpVJOGzUP9nr+lEbscFAaIvO+986UqiKQD
         mZLIm2C9+b2N9AHlRV75f07V5r0LAALj8SIGE6ccmU7xSB7Ys45LaFjBTCbwvfc19Z9x
         DAUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786640755; x=1787245555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
        b=N0daqiExJaRR5G4CRXB3X9aHjyt7m17kgpiTw2uRop56klegeJcykE9Eb8Dlqk5k9H
         o6FvQYoJjlOjrJIqjNo+8xh60abrCduyu+DMeyiUrhaCpOKq3Pir3YIKZs9xo9MK7TSw
         SIuHRK210RfnP+3pB1bHhdUG5wGOKhnLdX/MaFIYz30OxQ1dQANGXx8C2rHWDFuUYdRL
         p7/btST94UmycVMPX1g3Y+A5tZrDZZICfTuwMdhxYtpBIchzDf/qtPT053n7jaATN/eN
         cCyW9IfoHjmJVQ1xTyaLDeTC9650mUpurYBQpqeaU1ZSZopK5XBFWOPEIkRQGuFnl15m
         2EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640755; x=1787245555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FobEjU8guTellrxNe6IZRoFv44S9rWM4H5UbUpJahM=;
        b=UCOAk2Pff+mJGOUhy3uU9Ji/JHAFvFehL+PVdwao8OG8UWucDYX7VyfvDa9Y4vf6FR
         4FzoIIQXC8A2idjBEKRr6PxE5RuqDy/z8ZDaza6x2C1XnwyhB5dPffOE8lPffyYOWNpe
         v0kCRRlXJ17ASP5wbXGchEUK7l8h5JFkNWQwX7NzvIrMZy+rwyFghvGxeKiuA7PLSWIw
         9FPfGDITaMT4ScrSwPTt+xdAcgVYq1FMqOfhc0fiGxfbnNW63+f4iqJ7G5Q14wdA05dz
         5j2x8WOfAEvke4k7RmQOc7qfumpry8IxPoU/xEfliUwIwN+XU6P13lK/eXgVLnOoreXB
         /rwg==
X-Forwarded-Encrypted: i=1; AHgh+RqWKF9NTEoZfgIN0JMuJ5AmcVjQN8W28FOoftF/siSL3aJFPMGIBb0PAVGN4W9ADNPJaBSJTrjQ121lflzJ5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqys2lhmRh47dfuMIw9AzuR26LoQuuklJhvD0RA4p2wFtenDMf
	g9oNpl3UAWzxEpIWFppopdoq+MOvecCSgwss/nToOwBWb3xPKOe1BGVVAwhgM8ettcZIkcSd9KY
	5iNJRAsSJRflsQR9egP0k71CJuySSSTQ=
X-Gm-Gg: AR+sD13gJbVziveza4WlSnNpr0yvmY1psLdTyzK6QqY0zC3nj7EaVE6t8yosrQXAcAK
	DuBy2y3bMVlYUBtRPiaeg3e1z0whzaYnUMcCFD11yU3+dHeo5RcB9eWcr21S49oEr8JZ6g6R0lJ
	FbVtJqz4ei7D2T1TMAa7CDzu3nQf4whXhRc5INo8suAiKeKnPewYuE4avQd6eHzZzADCrv0+K1C
	m7NjKSCAB6f+tNgmMeuukXOxGzwki+tkMDQeVupkACQTvnneiCDa+tDcrx+DcX8IW8RY7fzTYAR
	/ArduMLA+8nBwI4ByZOzZZ/Hf+7C7guVSknNh0XjSeDfqv650HEUIiHmjgC+olCxzU4keD/CBLm
	45KVBIY4JkX+RJXqdlKS851jnc0RFcg1gbRPAs7aj2znrJfb6rDGdsO8jl5KD
X-Received: by 2002:a17:902:d4c1:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d389a366b2mr49581025ad.2.1786640755042; Thu, 13 Aug 2026
 10:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813163951.1102583-1-gary@kernel.org>
In-Reply-To: <20260813163951.1102583-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 19:05:42 +0200
X-Gm-Features: AUfX_myJHF_5LSmYH-kRYlFZT_KoS0gQcDzZRYrk0iiteBAvYhXUy-yTToKQj1c
Message-ID: <CANiq72=LQj=f+mdH8FoWZ4X8nyk_crnTUaXZpGP-6sh1CE52zA@mail.gmail.com>
Subject: Re: [PATCH -next] rust_binder: use `LocalModule` for `THIS_MODULE`
To: Gary Guo <gary@garyguo.net>
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-next@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 6:40=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Replace the `THIS_MODULE` static reference in the binder netlink code wit=
h
> `this_module::<LocalModule>()`, consistent with the move of `THIS_MODULE`
> into the `ModuleMetadata` trait.
>
> Cc: Alvin Sun <alvin.sun@linux.dev>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> This is to resolve the semantic conflict between rust-next and
> char-misc-next.

Thanks Gary!

Cheers,
Miguel
