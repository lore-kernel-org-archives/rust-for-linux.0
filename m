Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C054A3F0E
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051972; cv=pass; b=T3cLEdNqPgsVRkZeJYvpKEWUTd8RHcE3fX/nvfgkhwQ1LQ0EmDtcG9HkA2Mt1sKXF8XXjHpMBCW50pvASf3qbvpjj4qqxS4SuToDle3n9TZ/b/LSWSg6BwqlRLl0RlANYZ9WB8Mnvbrm1o5Gwc7AXBIhaZD5F+CSBqkJa2DwjHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051972; c=relaxed/simple;
	bh=hERLV2oDnGYQ65m8SRllqSlefpn+X2q6W7ExBrm5XDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBLuxtNh8aEtSfvzZGo684QiysAcenQ3GknPfGQKE6GM13TEq6neUTQKzmW8sOEqaG3Ggh8jlN7MA/oFZri0wo72IyffOIRKcuKOS81rW8tx4sJY2VzlKvS3MvJk9ZSX3QizfivaOeLJc+DPlJDvnNQCsspuoEi3I0JRUMOw43I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJgVl10P; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJgVl10P"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33c30fcf33fso605324eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 01:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792051970; cv=none;
        d=google.com; s=arc-20260327;
        b=RXZsOdq2H+QyRTA1KJ1fsP7nG83iqp8bEt2tyYsJ0yc0BZ5N5vqRzUAb0c7+fETkue
         9oCX5bev4VEF4mXgPVqsjvN9fYhzZ2qH5YlDNH56c1BpV30R2Dfx68dOXBiO5SmJwcej
         Js6wu11WJS/Pb3kNgBaOf2SsIKr00LZdK3JSLj4goDGn8C+BN60UGnjJf9auOqDAvrp6
         o+LTHDGsaMbmpHwYBHH6YV/jIvKmTIc/r8EZlspgtJhczpZJp+mlHuG3g+gVJWz2HK6P
         pdqZKweWsmo8YcFtnBMK7khiTzC0uwUwv1FT7meec0wAh99kzRYi6hedwyxPH6vXT9vG
         cKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hERLV2oDnGYQ65m8SRllqSlefpn+X2q6W7ExBrm5XDI=;
        fh=WaG7/4zDpUhHMAf8MScwYlB5tkdefh5aESR3YPd/cYQ=;
        b=VjCwcbSikx4LJ+e+GhQxySYYpQnjTW4s76SDLr0bSAg81VmOXhDv536ZCi95Rx1xwj
         IwNbufQwmcU2WY92icd1uYWrHQuYnSESG3SsZlgF3aXRPyBO53n0TdyyPnOWRM9EwxL9
         0vH/2m/mn2wPYAgc9Zt9Mqet/5ASTre192ti6P/Z4/Qnb6Q0Ku41Cz+On2stuA8LtGs4
         1yLFXmQfjUY14YqagWscKIhVyK4d6lvx61HvC8O/IgBlAnu5L+GwbRAdw0zTjcHgSywL
         H/NOfOoc+V9MWixalPA4ZT7tYgVmelFR6VxafmuHaPT9DwheKymrbl2ues6iwl5pWmyf
         b5FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051970; x=1792656770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hERLV2oDnGYQ65m8SRllqSlefpn+X2q6W7ExBrm5XDI=;
        b=PJgVl10PGKHHb7/AJ0V//6cljTpG0aTS0iTBVgob58ocDfkNxG+N79VvTQGUxwugB0
         JHNsZ4U5RyseqxQGrJcLqHMwqyoQzlvVtcKQs8XWstiXPiFC1rUmocBR7UTnkwRVi2iB
         ySwpgB/9Elxn2hM8DMKf6s3C2yfJAI//Dn04K1vy1JzDZCcOBzA2Rcy5m113oB+Ov8nM
         Ee2QIwrAZf9yALzN/YwR/vP5S7cnGhWN2zGHDshQbD7dHeeclDOMFWdoH7oiNy5hW9Xm
         65+Y9D6Gpm/SLNm1DtQAravbemcyBUFuqrpHTasfWrpkcMEcyqCPnZYom1jNXy/0teKN
         8XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051970; x=1792656770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hERLV2oDnGYQ65m8SRllqSlefpn+X2q6W7ExBrm5XDI=;
        b=PKxoznf239mGfrDcokKMPJTicScRZalFXuLt/aqGAQSbDmzSssSh7kV/30c1o5Yrrs
         brRpDUMFtDVYN5uCIUkc+0sPyY6e7LGo0SjrbsvDRpXlU6n4jfSNJQdK5NctvPER0Rx4
         ki1EX7IQPiS7L4U8aNCrxvHbeseRNpGrwk1Cmdhsyyobl9fEuf/VKuVILoL3947zBS3d
         hh0mLiMQKJTNg9PFTVeZQcWL3t+iAUKet/eys0JG2RWS5P3m9Xmx4n0VB2q8e/M7tgZw
         5K90v/kALBWK6oxC7Ue9bihe5+En3bqc5IzFpwZr8hNB/7HDZGYhsojtzNy3rOwUW9oD
         p5hw==
X-Forwarded-Encrypted: i=1; AKwUvBy3t79hZp+iyBoIlo4ycwa2ty6LOIv1rpbKXmnEKEs0jFATwkl34U8srVSVHUVUINdEByivf4eGhbzi+rYrQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYILFRID+22xkUnFLMJbviKGTnJUWlUQuHMGgW+yupuNyssfU5bT
	IJ+Z6TNQESNy5fIf8eGYFhaqiXLkSH48xvjJP1q5f1ZvDySOZX6sqdZ1QNZQhKoMUD+H1pH5WOI
	Vxyetdb542Bf4vY+SBF5TyUo/eQifWq4=
X-Gm-Gg: AYBFou26f8b0DWBBe8ljdHEv4Psm7cvhQs2y5vjH+Iil8N922UqqpIUmch6JBYV0zV2
	/ecJFeP8Qzpzrw7jkVhKFK7TP8ofLqN+Esmx/0sexmSaNoPDQSycdaHBIsC8rUSPhbj51BxF/ee
	U2SPPoRKVd4yEkb3KpUKJm0/mstojRcpzPxteWUhBJg3Imrm7/i17gb7AllkAJNv1BS/rBX47sv
	ozEm65wwglPIle82oKgCqa1M56R9Ky1/wcTheXEPdIeorSQhcVRIxG0+ANKL6mS8Ig0fl1iw4ec
	7WiL+BbxqvYj7iZpd2gPlrwHrKGJ91hXZ4ZqCGVONgffZaJfgLonWcygSx11bGyovZQEg0Te9gd
	h1VbkvwJYHaVQT8nVYROEQ/GNJkvENQ1g+VgbLo7gFSN+MEcCSaLM4Dt+LBhmkHVd72bDQQB0IY
	Ipb/5UDrVM8L6qgTdbTIHcvHqAVti8298NZkaRHBXccsTmKxLy/DnSdGqlxhMqPg==
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr38736177eec.0.1792051969948; Thu, 15 Oct 2026
 01:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184809.35143-1-ojeda@kernel.org>
In-Reply-To: <20261013184809.35143-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 10:12:37 +0200
X-Gm-Features: AclHuK-Ovd7eCup_NCIhuKLIB2g9L6osq22nnjuLIywgHYYYtz_K9zuPifQKcLA
Message-ID: <CANiq72=o8OsB62Yr-kNMR_qThB_JEg0kheZxNSW_u0tcjt9UtQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: zerocopy: fix link to upstream `README.md`
To: Miguel Ojeda <ojeda@kernel.org>, Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:48=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Upstream moved the `zerocopy` crate into a `zerocopy/` subdirectory
> of their repository in v0.8.51 [1]. However, in our v0.8.52 update,
> the link was not updated.
>
> Fix it by adding the subdirectory.
>
> Fixes: 2808a3963988 ("rust: zerocopy: update to v0.8.52")
> Link: https://github.com/google/zerocopy/pull/3434 [1]
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied (both) to `rust-next` -- thanks everyone!

As mentioned yesterday in the call, I fixed Jack's Cc address and Josh
already fixed upstream my SPDX report for .63, so that is fine.
Upstream even has now an SPDX check so that we don't hit it again,
which is nice, thanks! :)

By the way, we also discussed a concern after the call regarding the
size of the updates -- it is indeed a bit scary to see the number of
lines changed, even if the actual commits on our side are mostly
mechanical, and even if many of those changed lines are for things we
don't actually use in practice (e.g. Kani, Miri, tests, benches, new
gated features, etc.). I still think we should still take regularly
these bumps, since they contain fixes, and since we don't want to get
too behind upstream anyway given the support they are giving us, but I
thought I would mention it.

We also discussed what will happen when the kernel may want to move to
`syn` 3 in the medium-term -- it could be nice to talk about it in one
of the next calls.

Cheers,
Miguel
