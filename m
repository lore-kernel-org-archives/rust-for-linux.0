Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA214BFA2
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339305; cv=none; b=F//immp/LhjkZs6zIw25oI0ceXxe2+tiMbbo3dxVduZAYE7fzKhPMAa8oH8jxhVXaHphDYNwEdstuzF7/Vuh6T3W7Dgaxi3WA821aVXpfvSVakB0kn3UYBFLZ5A3Rt9EQOZ91fIIhzzIME1caFedSmeicghrgHFWaqgM/Aqd0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339305; c=relaxed/simple;
	bh=j+iWAa0suooh/9BbheNTpR15KyC7Wrafy4/wZyt0F8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZtWOYbm7n5ZlPhin7nG7abopvrJSoKBoIu2oFO+dGHXvCWnL81jy+btUqZhJCNg28sdMfbn0WXu6PLZ+0Awy7E6DuVPKhw+3ODvCnymVQeXaMnf3HHKmNVdcuWgcG6VPYc5TDu2w/FTJIXnfAZgUE+CEO6M9GC2HkfKsEQhDoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=gOmHCpRH; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="gOmHCpRH"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e589c258663so4456371276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745339302; x=1745944102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ/h+SRKg3HKK8qDeGxWSA4UTfkR8SBnHYf8ziXdKBc=;
        b=gOmHCpRHyfwMjWGfVsBTu+W5AOcjKiVXVkKzWE0yS9nwwqCiXnUami/1nRwoUELhPD
         Rv4LStcEtWNyIhMjSP/OVcN2xVH04PH94WYY5AlOtcK17zU8OW3ghM5z0g82LgS3SMiR
         Rfn77PJkuatFRUy90V2HUhiwzt7M1fNuxKYNgba/rNqztu/6DKZZsiYqS1LjTKhHWotY
         de3JCT5+S++6HJ4recCKxQ5C2NPuZ6dSi3MidLzYxJHA1Mj9tMKkasGLWH9ek7eyxW1J
         ZYcCAz56IVvuPhGt1lkZSbahlybyBgSaJume5Cj3xB6N7b45KgNARDxCxI+W6xeBushM
         NqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339302; x=1745944102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ/h+SRKg3HKK8qDeGxWSA4UTfkR8SBnHYf8ziXdKBc=;
        b=qxQP7B7b7VtO07uwc3sfYaZiJdFDQbS2qCw3ZbQHVRMJ2RkZRqzSRpANaSGUYytNND
         jwb/q4CTaOtxeceZbPCEd6LlXy/71CzcML5G2OU0ZRJoYmEoIGox3uq5nOefL7a44LLn
         QO5VTwXGNri/4YWUzT+4DEL0D9WqjcTNdMKDkLKfVnKQ4+s5bTXRZhbv6FwDr0OQB9FI
         twlBpux5TEK6dxgLefzzEESBRZYxCmZncDQ8D/Nc7nj6ZQBmxlS2D+OMgt6EVHdE+IBU
         0djWe0AZBmTIrJ6VVnSKDbB37i+JBqEg9WcAci7Zks0ppwgH8PbR2JN+JXCTmAYH8k5o
         /OgA==
X-Forwarded-Encrypted: i=1; AJvYcCUO7p7pMoJcE+/IUSRICk9UQqwm2lDbM6xrBGfTq/ZuKsmkYqBL6XO6ATuT5nrZ4bBHJA0uzgProty8Jx6QjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZE8vcfwwFhcJgV8KJzYJrE5vKMg3VUBEL2T0Df8eWTJV10g67
	AW7Klh4S+kb1qYFQuJewuQyziTU+PRcuHPpmhMoaE+EgydsDXTqrwGSM4wM2e+OaAi3CHB5NTHd
	bkdciQykivik5pOx30SY5wPXh8iPYN8OhhphwIrrd2Je0Zl4=
X-Gm-Gg: ASbGnctkHhOs9LLqecksVwCfT5R0G2bHvUWSARyjeCNCkE6pbeMNAyXSuYfBunRXrtQ
	fo0QXGUMKVmmaTxjHANv7AseaVCt/bCJlMvJ2eh+5V3zWAJlUhfsjta68nMqCpeD67KgDrpseAW
	woZ1Wvv1hX+mREPREy0cXX0Q==
X-Google-Smtp-Source: AGHT+IFQDSL/ncnLOWK5LRznb2NXOaof3/0NlcAW1YBboG+fEljKszmHQmxJ1eEYy42tv3YqfQtVf9ZlPwKPijpnNCE=
X-Received: by 2002:a05:690c:4443:b0:6fe:bf9d:5de6 with SMTP id
 00721157ae682-706ccb04f2emr232424337b3.0.1745339302344; Tue, 22 Apr 2025
 09:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416213206.26060-2-kernel@o1oo11oo.de> <CAHC9VhS=jWEZqb3MqCtUAJhY9ci8d_N4H6CqWsYU0YmEG=8_yA@mail.gmail.com>
 <c1eb852b-f8aa-4ab0-9579-19eb0d383cb9@o1oo11oo.de>
In-Reply-To: <c1eb852b-f8aa-4ab0-9579-19eb0d383cb9@o1oo11oo.de>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 22 Apr 2025 12:28:11 -0400
X-Gm-Features: ATxdqUHPzGOFeKXTqUOAMaQToBxYYiJZ5vV_2qPozFgBaVAUE1O_hbEaQPAua4U
Message-ID: <CAHC9VhQ2NWr3-zQ8mnQEOV9KzY6A_Vd7AR8uzp5ZZ-FLhkG=yQ@mail.gmail.com>
Subject: Re: [RFC PATCH] lsm: Add Rust bindings with example LSM
To: Lukas Fischer <kernel@o1oo11oo.de>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:22=E2=80=AFAM Lukas Fischer <kernel@o1oo11oo.de> =
wrote:
> On 21.04.25 21:09, Paul Moore wrote:
> > Thanks for sharing this Lukas.  My Rust knowledge is still far too
> > basic to offer any constructive review of the Rust code, but I'm happy
> > to see some effort being put into looking at what would be required to
> > support a LSM written in Rust.
>
> Hi Paul,
>
> that's alright, I was mainly asking the Rust for Linux contributors for f=
eedback
> on that, but I wanted to keep you in the loop as well.
>
> > It isn't clear to me if this is simply an exercise in seeing what
> > Rust/C interfaces would be needed to implement a Rust based LSM, or if
> > you ultimately have a LSM you would like to submit upstream and this
> > is the necessary groundwork so you can implement it in Rust.  Unless
> > it is the latter, I'm not sure this is something that is a candidate
> > for merging into the upstream Linux kernel as we don't merge "demo"
> > type LSMs.  If you are intending to develop a proper LSM, we do have
> > some guidelines that may help explain what is expected:
> >
> > * https://github.com/LinuxSecurityModule/kernel/blob/main/README.md
> thanks for the feedback, I guess I was missing some context in the initia=
l mail.
> The LSM I'm using it for in my thesis is more of a research testbed (or "=
demo"),
> so I never intended to upstream that. Since I still needed to create bind=
ings to
> implement that in Rust, I figured I would post them to the lists to get s=
ome
> feedback and to get things started in case someone wants to implement an =
actual
> upstreamed LSM in Rust in the future. This is why I marked this "RFC PATC=
H", it
> is not intended for upstreaming, only for feedback.
>
> If there is interest in it, I might polish the bindings after the thesis,=
 so
> that they can be properly used for an actual LSM. In the state they are
> currently in they do allow writing an LSM in Rust, but not in a way a saf=
e Rust
> abstraction should.

Thanks for the background, that's helpful.  If anything changes and
you decide that you do want to implement a proper LSM in Rust and
propose it for upstream inclusion please let me know.

--=20
paul-moore.com
