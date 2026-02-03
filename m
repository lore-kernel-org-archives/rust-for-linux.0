Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE937E310
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050778; cv=none; b=qx4hfmNYW4b93eMGQE4uHz9myyNVacUjGmgb1ZwifR3E2DV5y3pbf6NQ7VS7AUIL4MbR722iFGmoaRvYxR5dMRAAuuPguAFFkFrZDSseB3q5uP7TQ+f9cF6eqXxqQl47kpoX/XwplPz+WMP5AdaPRx1wGU0fw7USSt/TV0lbqEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050778; c=relaxed/simple;
	bh=Usnw3Gatub1oxTffhK0WXeLvi39STFWovIQLvfzLBCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOevJm1msYH8kLN5cJXHSIiq2J2PEH+O5GDIoiv2Re4l6+LQ4WqXjfv+/lfvh+4R+3nxs52OlfZdRhivrMqs4y2ZkLL9jG+UZL6IScQHqm6EbdaXnrA0yDwsuTzNj7coKEIVrFALeVAj5z3MX1CKygn2G0hJ1pgqyAJCaSJ+EJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFYww28O; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFYww28O"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a8a7269547so44982085ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 08:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050776; x=1770655576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvR2bhtkwHdzvpnOA5ZJ9EggNv6gPLY0gAmo2EM4ZPc=;
        b=GFYww28OQF8Dt84Qq7csZWIgO2vhu9SOwyI6XVChd0pfU96XGkMYq6Agk7NJfC7Dvj
         zGzbXup7E7vH3ke55ih/rNk62b/v0JI1qY6Fn+p1QHnOp+vCVSUW0vmS6EPQ5nC3aIIV
         3o0eMRccaZ2eYrrPy9rr6RQ7+bKjr2veApxyv84HbiIpdFC0TT01STJJDcGhnI6N4O0c
         +rqE3LWL/cMQPP3O+iyshlASpINeJx4EWaaLgrxFsqTvE/OScwkfTmFdBO9EbNG+QkAL
         9SOYfEhJNTpqubDwx5phWZn5wEpf1ltVrOpngDcEONeGX4zbQRcU2fOUQMKTofsKWOWb
         jupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050776; x=1770655576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvR2bhtkwHdzvpnOA5ZJ9EggNv6gPLY0gAmo2EM4ZPc=;
        b=UxVryBr3eYpkmTaQb7sCKoULduiPPBueoy/CPDuGPHDAFZvBcNp6+vz05QV0R7tCKU
         H/7cQk/LNoySOejBgjbVIoOLJZ9DA8UXMyJsgBbIjKjug1jvJWOnifIYoV7XAiBxa7j7
         GwuW/ryRrQ10Zp+OEFAsMN5Dz/JtjNnEc+5s3tG5VwfVBr8x38QB+b7DioXc7ClfT1SR
         7F+tZzeCkx9YR9szcYm77/TLzFMzNelwyMQOIIZvNdPrGlpAoJYI37WNE6fhlucjXEB/
         /XdRqEO4SEyaKDhXfCWe9Xs8Sx0Yd9KRgwGljIeq1ntlD/4+L8vXafVZxRGCI5WGuRE1
         j43w==
X-Forwarded-Encrypted: i=1; AJvYcCWvOqux11JgwqJq9LuwJdd6Mv4gh5iPziCyNEFPnm5DP6kEqViJdSZwGKEempLi3mhrwK6Ul2gLrypXbfkCSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXKuxAInOAq7Lq7XezG/mhUiN07cO6FKTMVohvjNXfFe7pvp2
	PWS3JHrWcxuA3wwAblR5FjSb5k8jXocgfrU4u4BEZuf4qWAxaIau2jXv
X-Gm-Gg: AZuq6aJxLgwa4Uyel8tYOHxkiMEJ2wLOONfTj96uBS7IUn+Xxtspbpo/6ce8Q37ee1i
	GdSgTcdil+YZhbzAVRMOx3x/GZsS8CCH2LroVeFV3C08eh1CXBabDcXRMlpdHh4gTOr+dc8FBJ6
	Mo7iNp4ksW545EqH/V3xc6IlUsK/7yVj4yCBCabm98LkrU2nk+hOTIaR0Z/sb49o9xIO+QX/mI0
	wT5TvNbeaqS4tJ3xqUW8bDXWbWmakvXAu7zePhP/J2dbYJPmU7zSSFgzIINSCuFvTq/qnu//9iv
	/LMLnC3JkGN/BQpN5S+bN0jlybQVmPS+CwG6ZpFygd8biGXTf805xuuhor55GIAJTYh0TI9K+ze
	bUB6PsvtE+rmgzKjaPMLTQW/11+3ciiV20p1UYRzyGvU1fUBSc4l/GUZXs4UXtstp1yI5xt03IG
	ZUDPI=
X-Received: by 2002:a17:903:2b07:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a8d96b1051mr138969065ad.20.1770050776360;
        Mon, 02 Feb 2026 08:46:16 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd74e9bbsm129294195ad.95.2026.02.02.08.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:46:16 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mlksvender@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Tue,  3 Feb 2026 10:46:13 +0900
Message-ID: <20260203014613.2708234-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
References: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 3 Feb 2026, Miguel Ojeda wrote:
> On Mon, Feb 3, 2025 at 1:09 AM HeeSu Kim <mlksvender@gmail.com> wrote:
> >
> > The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
> > handle a rustdoc bug (rust-lang/rust#144521) where target modifiers
> > were not properly saved.
> >
> > This bug was fixed in Rust 1.90.0 (rust-lang/rust#144523). Restrict
>
> We tend to use `Link:` tags for these. Typically we write a line like:
>
>     Link: https://github.com/rust-lang/rust/issues/144521
>
> If you want to reference it inline, you can also just put the full URL.
>
> > Suggested-by: Gary Guo <gary@garyguo.net>
>
> Please add a `Link:` tag after this one pointing to his message.
>
> > Fixes: abbf9a449441 ("rust: workaround `rustdoc` target modifiers bug")
>
> I am not so sure this is a fix -- after all, when you use `1.88` or
> `1.89`, nothing would change. So it is more of a feature? i.e. the
> ability to use `1.90`.
>
> But I guess it could also be understood as "we should have applied
> this only for affected versions to begin with", but then it would be
> from a "code documentation" perspective, which is fine, but it is not
> something that e.g. we would need to backport. So I am leaning towards
> not having a `Fixes:` here.
>
> And this has another issue (though a different patch): the `sanitizer`
> modifier.
>
> By the way, I wonder if we would want at least a `rustc-max-version`
> (or an `-until` variant, or whatever) so that we can easily express
> that range in a single call, and document the bounds together (I could
> imagine that we could end up with a few of these over time, and then
> they start to shift versions, they get spread across lines, etc.).
>
> Perhaps the Kbuild maintainers can comment on whether that would be a
> good idea or whether they already have something.
>
> Cheers,
> Miguel

Thanks for the detailed feedback.

For v3, I will:
- Use full Link: tags for GitHub references instead of shorthand
- Add Link: tag after Suggested-by pointing to Gary's lore message
- Remove the Fixes: tag
- Add Cc: stable@vger.kernel.org # Useful in 6.18.y and later.

Regarding rustc-max-version, it would be useful for reading the code.
I'll wait for Kbuild maintainers' reply.

Best regards,
HeeSu Kim
