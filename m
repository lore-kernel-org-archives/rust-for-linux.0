Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1B33EB04
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757449537; cv=none; b=OuuAao7IU2spQWyUp8cg58vNCjr9oLY54D4jUE+/md6QxZxOJ9bJDLwperZnJ++b01wyJiQORd8HhfC6lrjQ07Zh+XuaAKZOU3ezPTdpsbyOYU3rTp4r/YL0mkZNquwIJRvZeD3HAu51zKl3KxcRBgErFo15xFOITMGj4oSETcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757449537; c=relaxed/simple;
	bh=wxDkBYso8klg5m0O4f2q3Mp4Da5hR5830yShKQUo0VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaG3xGnNjoxz5YR8GMLmdK0w0dE6JLbEpi0zmMehk6X21ygLiu7lae1KuoYNktcipXVVKqIptd8FlNuxwnAksZL7H4E2IiLSjxb7cL2LKBuUqor0JIXMZjITV3JiK0sLQlGotoyuP6LJVdPej0V6X8E37MyUAh1/jTv2NS5GItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHmleH+A; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHmleH+A"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3296a9d17d3so508167a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757449535; x=1758054335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxDkBYso8klg5m0O4f2q3Mp4Da5hR5830yShKQUo0VY=;
        b=XHmleH+AU72fWuR9+O0iF/qAe2iCZ0UBWRb+FVt0JdzulAKqKGZuvKV1sQNq+KErzG
         hzbdOqHa0Go+GjfrMDZ0/TN9KQr+ryUEv35vYGKbkt6m9e7ycUEkKLPziv5Ex+tWy0VG
         pjO+Ooe1/AQdb5M+91q81ZCrx3Fbs2i2rVcnHuZCfUlulv8k7dId+xg9XRiTRYfGN7Vl
         0+dQB4ZbloolRiD9FtDoFvhEoMgMDiJmGIyaEtS0RuxAPVIwg4WrBQAYW5HK9sBKBuGB
         eZc72Vm0o+7Qf+zMG4q+0aAU4d5IUlFJVBKEqtpgciVXYnbyJ2imxU7IhONcOtekYquQ
         UhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757449535; x=1758054335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxDkBYso8klg5m0O4f2q3Mp4Da5hR5830yShKQUo0VY=;
        b=vy/QAI1Kfs5pa7zChABA6zB8v+k62Gk73CULHf002oi3h+bZ15n8R279VYYTzjwi7L
         Y5pE4TQ5dKnprDhAR3d8zE1zsEp6JZ8M/cNrM5/vsbnnzJ79bOYeTXiCzaOG6hlaEUcW
         cOVijtXjh0ctUwqPOy2uStgQOubHSbP9lRGYNl0zIR4WqPgpb0n6Ed7vasQ9jWK3XSgd
         oTvwoU9ANsIkb4y5NTrmX5sGqpN8T4yrjLgPn/9EuAi6VeYtJF1XYmnYgyZc3d1AzvZf
         Gz3iGP6MDiMJRyqR7av+i8mnLkK9fGkTFuhut2tSgAeqGfVY311lNWgKUJBK+pAzfgdj
         TFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCViV1dViziO3qDrt1B7s2H7Vh5xTvFM7gw3j9/4iQlFjOEoxd4BeCgqhZD97L3h9yrqlRkxlpufOFUvj8eygg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEFvHa//4bdRRINF8MIjfCoFwwBKlOhqBe1tVw/gJsjca9YLk9
	2sN7IR6sx+8nnd5mxGpi6pS9h+bj6d98XTvxh8eM6ZNIelJxpxmMAyUzwV27EkhbloipYX1N4Ke
	Sg28Epk/wp4teNZF38+wLXh1Hz1e1uIg=
X-Gm-Gg: ASbGnct3OLffnad2TyyKR1obwjdJ3qKPmquqtG1LOYG/J+ubtJh+P+eBQRlcmDdrbF4
	HUr1zsjq3uk4/dKhiOlXgz1bc74GbBPX7kRbzsbX3IR7RjUV6dyeRg1IqbuED8cqoAXJNHGSSgw
	lN2ccm85feLTVpfT9UyfRIv0GaDoxdpJcRf1yY48ktsQdfs/mrZdEDnUMT8ou7F4bUcqjfMzaGb
	xrhIP+LlAGGcMHinY0j2OS/5Z4qss0+LGquuN91F+XaDnLV8Cu2RclsvuIALJ+4Nh/mCQMgxerY
	+ZUsdHP2RWjX1/P5HERq1FnrWn3wyF2t62FM
X-Google-Smtp-Source: AGHT+IHrPuSJF3/HVlVAKPSA02cYiEkxIc6cB43ReX8WFLs27T+peqgFv4ZntBDqLfeLPgMtU2IPc8i+zsxFpWH5p+M=
X-Received: by 2002:a17:90b:1d12:b0:329:7955:5caf with SMTP id
 98e67ed59e1d1-32d43e19c34mr9367597a91.0.1757449535379; Tue, 09 Sep 2025
 13:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909170013.16025-1-work@onurozkan.dev> <20250909170013.16025-2-work@onurozkan.dev>
 <CANiq72=kWpxpo23JUYTqxwpsY=E0uUvCHgotRuepZpL-qUqXqw@mail.gmail.com>
 <20250909204308.74ccedf4@nimda.home> <CANiq72=NrS1cFJec6sm7ZY-UPqrzxHKVvPu67Rze02Fg_xeWpQ@mail.gmail.com>
 <E64F356B-7EC5-4F46-9ADF-610CBF249651@collabora.com>
In-Reply-To: <E64F356B-7EC5-4F46-9ADF-610CBF249651@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 22:25:23 +0200
X-Gm-Features: AS18NWD-q1dZbe0B7ncsGX8Sj9K3t4jhyDGuBBU0miup4atDr7AbXn0cmcwNeLs
Message-ID: <CANiq72kN3C24OEpbppe+AoSPDH3FceDsUh7ErqHequOyRftE+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: refactor to_result to return the original value
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	daniel@sedlak.dev, dirk.behme@de.bosch.com, felipe_life@live.com, 
	tamird@gmail.com, dakr@kernel.org, tmgross@umich.edu, aliceryhl@google.com, 
	a.hindborg@kernel.org, lossin@kernel.org, bjorn3_gh@protonmail.com, 
	gary@garyguo.net, boqun.feng@gmail.com, alex.gaynor@gmail.com, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 10:12=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Merely rebasing on top of the rust tree will crate a conflict with his pr=
evious regulator patch.
>
> My suggestion is to just wait for rc1.

Yes, but note that conflicts may happen either way, i.e. for treewide
patches like this, one may get other code landing that may also need
changing. If what you want is to try to catch as many as those as
possible, then it may be best checking -next.

In any case, I would like to see this on top of the patch adding
documentation I linked, so that we can clearly discuss the intended
semantics, because this is changing them for bigger types.

Cheers,
Miguel
