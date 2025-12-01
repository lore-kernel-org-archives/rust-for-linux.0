Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E22F616B
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606736; cv=none; b=joyz1NWtXEVaMgTz6f0L8VkbUD5h/i5wDKdUSYvozYmtLLQzFuj/72+5j3r0kpIsjfKxrUHXcbgNADyj7lL2jV4regWq7DyW+shhk7MRtoQMo2RZkjmaQ4Rz3kiZcYDqUt6wQj7GlCZAYxAyfURMGu53Kqdo1KzKDmVylMdD1I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606736; c=relaxed/simple;
	bh=sw6lbfdaMYOrwnUAK6JJqbnSFVu5NtCzD19L3bQZnvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca0Xq4dFywJq+regephLU6C8jwz95cn3jDT8FH5ziiGjYJXzpeJIr/Nbe02BM/+9UnH5/R7WlIY1v9HmqEfv28ukFMG1KP/bEtB3H8yoMmW1EvSawf/F1lS2dRm9wSBngrUaPk2QUw549TRyfk47n2h/w/1wE5Roo2jK2G1KjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIrPlRu+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIrPlRu+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bdd38966c74so112821a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764606734; x=1765211534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sw6lbfdaMYOrwnUAK6JJqbnSFVu5NtCzD19L3bQZnvw=;
        b=nIrPlRu+/q7x/wK/sT062eP8PGC4iV4/ZI9+3KSmGiqU0ALe2wRM4EVGLq89Ja9HMF
         JwvTSWEQ6kCWs/sguNAFhvmd08aMUGdCWHd+IaqaygJRtRFhKQwJxFb05Hph/IekcSid
         skDcIsj/kh1Qdbx/kvi+LgihYOyJH0KGEm7tQoypdNQ6XJ9uqtb3av3dutzgbHx9nHXx
         FJTpZIxq5MoG6WUJ3Q1uQG+3xKPKQQoxb8DhwHWDG0I7FWrcRGIOIArGr8PjpfyKR2X/
         MojD54s+C0brKnyFvLeY3ejigCJi5PAHvm8zF0dojSag7NWygxrsznovgS/sntsAPyxQ
         caSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606734; x=1765211534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sw6lbfdaMYOrwnUAK6JJqbnSFVu5NtCzD19L3bQZnvw=;
        b=UI4iJ7L2PP9QUM6aoiYc2/FDl/XoNkk/SIUbofIR180zBrqPYLPHAkckaXwmV8M7RW
         LJpGv8eTr+cVbd33Nig4Be0NDrX2hABSF12fsblJ3U/ypl6lhjOqgQR6f25dRlaR6jth
         9GnEaXcmNtVZvLW42LFXEhz2SxeIM99dTaPtH0JJz5cl8LCofZaSO4cW7i+RkhFAmbFw
         g4/SRbxVSPoUbiw91H29Ue3cAiXOu1kOx8r7rDTrT3EIdZasLQ5Ez8byq9oOth03kUaX
         Ls87Xtu2CYw/c8wptvlux229falluumUS58sVFnT8QMXrk9SNDJKC6TuKSxdTbC/6xha
         YgBw==
X-Forwarded-Encrypted: i=1; AJvYcCXAdyKC72v4/oK4ovxDAoJoY8cJGx+uAgyTGOviG4+rPcqG7mVS+Ue7Wr5V/L+S3xKeKX5gbjqVtlPpJfJtPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygWk6fSRopbMR6w6TadkaXhwXGWTgG3P/5G1S3DBAWW/oyOaHt
	ohwObKfr6FlGKsXe/BxHnshjzZGi+EkFVDl0j67hYm3fs9J6QRs7Yoiy+wIj+u3YNxN5khxfSX4
	lAjBCRj35NIQqGLLGM/GkhQ8uiVSSVzA=
X-Gm-Gg: ASbGncsIrGvwsFgsLLwQ4vYVdrp3zLrl6kVfKgkR8Y3Inr7kOGNqEC2S6xyKxHXqWI8
	4fyCAPFGLL8dNLvBrvTMvQrhqPSIj3f5NPGXOU6T6CO3i07hA/f48BU/nrKdosg+CxUudNlxLXK
	NIu53O7xPZSToAvexwyV292BxVMxtNnQyhGiSROGIQmqWyLzyaP9FYbm/4KiySdm9mD+2SuOqVq
	2RGWtNbaLyUzNZRkxRNpb9XFG0b9joj/9FdbT62B08azprpk+GLNyM3AFZTkMi7HJh4sGh0bd+u
	Qlzq/RXCqSCXXE6tBjlCUq85LWJ/Z5bm36kmkYxpFiHTDG7Etfs6MYAkDQtOJ5ZzAOeEtONlNed
	ehVEe35fK37o/gA==
X-Google-Smtp-Source: AGHT+IFSaSNSYsK9skLd9L3+GD87nHsBSTQ18ZktTY/G96pIsxF9X+6Kz0gUfJMhuXFXa1pntC2ut2LHSu9bZOjPBzc=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr21871944eec.0.1764606733811; Mon, 01 Dec 2025
 08:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201021659.1729308-1-ojeda@kernel.org> <20251201091514.0bea544b@pumpkin>
In-Reply-To: <20251201091514.0bea544b@pumpkin>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 17:32:00 +0100
X-Gm-Features: AWmQ_bkmIhVv2rJrH-FGssiwc-d63OARlmBA3UX_0DtxkLH5hJJvHYQu-4zaClg
Message-ID: <CANiq72nvzDmhDvFoOx5eyGGmHkpNyJSy-c9mZK4yu_fDKfeS9w@mail.gmail.com>
Subject: Re: `KSYM_NAME_LEN` strikes again
To: david laight <david.laight@runbox.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 10:15=E2=80=AFAM david laight <david.laight@runbox.c=
om> wrote:
>
> Given that is even more unreadable than a typical C++ name is it actually=
 worth printing?
> Looking at it, perhaps some of the inner <...> could be replaced with a h=
ash
> (possibly with the last real name added) with the ability to look up the =
hash
> in a separate table if needed.

For printing, yeah, parts could be skipped. But if we are looking into
replacing parts of the mangling scheme, then at that point we could go
with the single hash (although, yes, at least seeing "something" could
perhaps clarify in some cases).

> I think that is equivalent to using a short name for a type?

Do you mean skipping the paths and/or the generics etc.?

(That expansion I showed is actually already a "short" version in at
least one way: it doesn't print add the actual crate hash, which e.g.
the GNU c++filt prints without `--no-verbose`, and typically appears
between brackets, e.g. `kernel[e6083e32b3c2ec6]::sync::lock...).

Cheers,
Miguel
