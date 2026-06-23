Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0723932EE
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782243131; cv=pass; b=JMySQT8QnXWDHFJptcjd41qz4iDX7krrYhoZEHJnJB2XY7RebcAWmVNStc1UWWRQ2ET8qdju/MNR65xsQk31z+JHPokRISUoTIbTQL8bgp2ED7551sJ5yJYoXjUjE4Wmgq931PPkQowwee8q3kOWA8Y5/COBff8P2r4V1+lMMn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782243131; c=relaxed/simple;
	bh=ImXM48uO7c1xvqZ1F/r+LQ9zXIkL9GZsbrJhD1U0PSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3H4oZis7lN2xZ0rrrdEi3O/s9w+91jWpo5FOQ5dTx4ZiFt629JnAB7ZIigCJIsi8dPZHv70D28/mnIT6rCmZm6vy+wAUzN1okSptvCoMm5JxWYBzMNiViNNilx0A8iO/H2bGE5BR/1G2FvIQf50d7dWTEsgJOe//ofUN5S6KNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwpU+su9; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwpU+su9"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1365eb2a773so23007c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782243130; cv=none;
        d=google.com; s=arc-20240605;
        b=GWVoDNXUDZ3NG0NucX4gubQqxpUnbnT45Cnyx0gdDoDzdAcoIQfJ/yo340Dn17xmid
         Y7zcn87WdnoRAlbBf6Izv3uGLSXN0tgDKzkpUo3CrmuGrsARMoXX3pyhJuV5RJ5mqq3Y
         hv+Gnpaa6y5tY7r3liH1iSG5tNPgQRLiLBnPgTrD49He2m6D21xoZcis5iweXSd3KSSi
         VBwZiHOZ3gsAtlD0RPU+3Q0YRQM3yYvJMBynF1kzgn0DuPd8bwrO7VpmkTKLSe4mwc10
         HgcJUpVlHebSVt2QgqgPkMflnDslql0W8ESIgEYcekKN9k9aSLozb2IG6vHBQInNb/v6
         Xgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wWlOVTMXJECjjihBC+4xDrHlQOqq/HlWBN8NOFc7uWA=;
        fh=Nd8sR5/9Azl+jRaAy/8wig7Q4YQD7GPc/8aHs6vvKrQ=;
        b=j/FgiDav1XiagvPt/Iyj5t9MEZLOMevpbzYO2qP+sJaGWVBieddZsvObiyxwMXhxAq
         MvYUI2PLQnQ3crX2ifBhFLYrifqkNzQmBhOVoBacO+5EdPFTEv7d/t8OTMUmzXSbWbDM
         PbQ1+JSLbBHRRGfVvTv25WD+qNvWgDTROMHXw+7lpAPcyU03pdFIlRrL8JniWzNaNrLE
         rpULkTub5Kis3m7QEVCYiA6IJEFD+3ZCSan1eLwaqvOifHy6tn53eKeII3IM6wEqo7Pr
         xiiBrFxQO8kN6pXRpVpKHFLou47biFDAflXcwWUSpc9rjaHLOVcn4N9J/HK4x2RuSgIL
         mBlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782243130; x=1782847930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wWlOVTMXJECjjihBC+4xDrHlQOqq/HlWBN8NOFc7uWA=;
        b=HwpU+su9HePt8fkar3RhfHBuXklip35fU4uNphfAvqYB/E7XPWJoFkBJ8LK87Y6k37
         1+31MN5mvrzV1m0WTDJZPvNJoTjo2jcnQB8Pin4jFdcBg8At4Xhpwi8P4Hy3MU7CQwFO
         ZNTbwV9CazYAeY5wVmBX6VS4IlcFKsJlmNFk8y/iajNZmceVnqOnrHYN6BXWJS+jgHBH
         /4cCt+9tFYDmg8wQnDGfmMAx3QZG3SI7F1LXwtGV98K4QGjoPvonAPNJvc6LAbbk6Uzx
         yerwajezLRv7IWR3+czs5CPhJLCjPaDyaThLjQVyBGmagXHSROrYAOyFjp4n8zLgGHmi
         SCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782243130; x=1782847930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWlOVTMXJECjjihBC+4xDrHlQOqq/HlWBN8NOFc7uWA=;
        b=eHGz8BA/9KIRvO6YW2uEuUq+c1pdHKNLy2TqDMOzLC/DiKwZMOfocqieiS70VROBhB
         9w+SPNJ1Hp8ZZTgQCzYch5wJlcL0+6omVArKoaLyjudfO0GuM4F0XRvgOkuWJdr8W/8S
         ayAxnTkCiM5BoIwSw1NnvPY1qsZvEEQJ3RVLL35xpgedg+Qf1bEmDRKrz+7vRU3GAtII
         fqnt9LFVbGLOeY0a5/swbUy52Nky5Zx13NfCWCzKEnmsO7wkl8xu2qVzghnMmGFxlwm8
         XE5Shwx/1Z3LrkMexvscOdr+BMR2T3rOW39SdSXYTporYTLvksJJJo9x8WSKO2aXdkVO
         kmMw==
X-Forwarded-Encrypted: i=1; AHgh+RoWz8yBbYWfhDBS4exMcw12ZJY8iHaOZieIL4aJgHg9YcVI1hV5BHLwiRL9KtzfMrOJcH4BQtJpnAq2dNNkVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9eZ+iypKyRD27VZ4+PJ5Os6ZSkrBMnfhQpIDsoY0n4UsA5vM6
	rVoZGZsekQO8Xs08MG9uB/2BWPQGjiDHiBS937SqZP2EsOblz9DClW3QczXV0JdVKK9efhoH4mJ
	u8SKPCNNhwtMANcs6F1m614l5QOfKSwc=
X-Gm-Gg: AfdE7ckX/MnObK9JC5uV874VJluVASQVWhReYA4fd89DpH3674aB3zhERdm06DwQQek
	6WrOZ+l5kI+ijNfQz3VtTZdHb3GKUjtifpwruLVPzFJRWF2O3F72rcSvBrIfjtUqcQjT0tHlTyP
	ym1iofPzW9dWJzh0D5aO6GKgwPmA/jDmmoRAQccBoPomvA/ewVlnCpRJujUozQ+F6dZeIbNVfKf
	Tf+Bc17NoZxMXxIjBD/Si0dm9bbpjf78Aad88R6H01ZApzlVznziH0by4GIMtuxyEwaaTP8pCqW
	293RDDScLJOMXREjwRX0o9//gDuuQEr5EaQt1O4cvEmLaPCy06gJMDNyFwxmz52QJwVcnjXS058
	j6Ea8ffXu6njY
X-Received: by 2002:a05:693c:25c8:b0:30c:496e:982e with SMTP id
 5a478bee46e88-30c496ea017mr2930193eec.6.1782243129704; Tue, 23 Jun 2026
 12:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com> <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
In-Reply-To: <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jun 2026 21:31:53 +0200
X-Gm-Features: AVVi8Ccs7OEPdkGKWeH8eRzdTeG5uWuJbI9jE4mrLkT6b1MRUrbOGe_15K6dgoU
Message-ID: <CANiq72k-TZyORAaHyB+hWNuG8atBdoGgDNk7gUyc1MXjsyu2gg@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 5:38=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Printing can be very expensive if it occurs often, so printing that can
> be triggered by userspace should be rate limited. For this purpose, add
> a Rust wrapper around `struct ratelimit_state` and use it in the new
> macros.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Link: https://github.com/Rust-for-Linux/linux/issues/122

(I back-linked to this thread from there too.)

> +            // SAFETY: This is a repr(transparent) wrapper, and the inva=
riants are satisfied.

`repr(transparent)`

> +    /// Returns `true` if the action is allowed, and `false` if it shoul=
d be suppressed.

[`true`]
[`false`]

I can change all these on apply.

Cheers,
Miguel
