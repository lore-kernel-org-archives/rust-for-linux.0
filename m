Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA830B536
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769805763; cv=pass; b=nvgo7lhUdt6myqRolxgykuN/At/Y7BwYBvdqVbLgKBazC9MbvO02VihuaiY7WW8fSR0Hv7EJ6Q1zL+AO8/0BFwN6LTnmiFlgPU1QkRiIeRssTHvsNY+ws3Fo6N39i1L1EpCFFPqy3C9RsC4duLb7+YsY+Nf0J/23/ZEGwNlyVCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769805763; c=relaxed/simple;
	bh=7hlzpkdfvmZ59e0wN+PjlMCN48/j9XjVL5iblgjh+Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYdJhBpiU6bb+HT2OoNczyYUOC8KEhvJthU9EBV8xoL/EuoH1+F9MwD+A9o+4kmfPEsxYR+kcveJab0w8zFknfPiIN4nDrnWgg0VzglIq9O03asbSM2UWBWPJAjGsbPYRlIrnS7pE/+fHQYsFfz28nzn0K5usJmRTOvsQnl3n5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVGAeMhC; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVGAeMhC"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b71e7dab12so110818eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769805762; cv=none;
        d=google.com; s=arc-20240605;
        b=SB9ap0dP7QT4+9rrWnELih3xMSXGyy5oYERB/d0qPF3cWtmqte/2/uVvY9JwaCDX9Z
         15lQCrYfsugsizIy+rFjMoXE6PewTxAGB4Qye6/IGOwcuieWfeHJrmid6h00sQvXYoic
         8wa4YiD1Xz9B5rFQ+hIe2osyNQHL4wofqetFYOlTJ4WOgHuhz25ptbRLhpZQaZBZtiO/
         JF3j2Su1Jpjy3eaucxyinlPaqzJGNF3zvfPukjD4SbLSu0yHj5yHN87db92WAd35/HHJ
         S3wGNB/fVCUBD05u2mknF+ZyZ6CNn8FfuVU0yASK3Lb0zCTmqw4OWAHpMZcXuQEflxP6
         DZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hlzpkdfvmZ59e0wN+PjlMCN48/j9XjVL5iblgjh+Zw=;
        fh=YjE5/UawlfiKF6fif/ukbWdeMQo79o/02cnMiR2n4Eg=;
        b=S5bi3XLbhkPS/2wBWuljW0r2ys68axx/Kg4HPqy/U1NSY9FAcfrQmv9uo/L+mfUsdj
         Slbcp6qE2ZVmkRSBGwL85XU8tPWZRU9H4UdONZalN9LMPgcC4DzPBQri3xsTCXrL3jdj
         j2AYT+ao7NUz5paNsLH7hkaiToqtZgyRf9vSaiYijsB7jeHyjmMrdj58/bDvTRZUaVni
         T4Olh/n3ri5rBoUC1ZAQ1IUmHaOe8DQDV+R0fZyNyGKofa6XRHuonXRUw19vZHAA3LuO
         +wUkMAmUSJyDJFyDtcXzJiT1K/d0RhlJMocDPplKZl+56g7zs5emgu/NTp4IhjvRoiAe
         yFiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769805762; x=1770410562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hlzpkdfvmZ59e0wN+PjlMCN48/j9XjVL5iblgjh+Zw=;
        b=hVGAeMhC+U1Wc+oczlXSMtEnCou7QsWzKkuTlVqzSTGnN8KT3WD/aqtjEfDRR7D68O
         5aziVV2zhh+yg5bFetl3Sh5icMX9Flyd5XsbUeCTeQtNEkriESivHDcGkjY2arl0uWIl
         d6BxCR+3YGWcbN2eB5P/EHGSr3w8cHTvyItMx/jDBmsxk2NxBuQdWbi9cLE71AL0d7G5
         xoPJA/9bSDyVBpk8Tb6XaWKPgSUvnXB5e5EhMx/97nfxynsp+Bee2Meb96o2rTq3K1+e
         qYTSJoPfrRepCUlBD+BhZVHxyqgrwpFFAn6pkEhlmR8tlJD76mYFVb7OkEXnEDALmvx7
         5QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769805762; x=1770410562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hlzpkdfvmZ59e0wN+PjlMCN48/j9XjVL5iblgjh+Zw=;
        b=R3jTBQO+WfC3NIFqPSdpFcsk1eUxXgQKq4P+5vEUv1lxfnhagYowLBlTT0ScdBDKnU
         Cdz2NkrBbB0Byvn3YyxFOogMCS2K0t7CJnfnCS6UQEJoqcDrkDS20PUFF33dhTHLUbrv
         BWhWDcbM8DxpidmJm4RFdzJZS9JiRATanuWW2Lj4a57SfBAG/sF5gqI6awc6/s3XoGYo
         ehF/67JjlnEVa3IVsC8rutmnr6f7574zNLjTo+3lnN/uE8sBXevrb7RrNFhNWI3GSQeo
         JK56ZSvSxg5ui1ebl1iWPmAJwSVCN6jxlEdcivPiW/uYc7NAxTxZvjwVaRejMs2hN7Ls
         /YGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgybKGQCnVkWK3NtrqlaRg6T+L2SPVj4WiyKmEKex766SPY1yI32TAHxjQdh5ezI47MPBJOyv+nBgC/+vbOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG7nlCrROf/HkjYOEoJXJBI0MbQ3DJqEQW5QY0/bVgKmDZ5oy6
	G2dZMBw1FwyLwdOrlnIxn67pYCM4Gtc6zdNRpwfdoKghfXFDnhT0alm+wT9KaEBSv8s6lN+h1Yu
	urJcxUexW0t4UULbb8BNAFIcVmnJfUno=
X-Gm-Gg: AZuq6aLGtijYBan0Q6+vt0Q55VV6CgQxM9TUpTbsNkFl453rmZuoPkxtBCdV8v0xvlq
	+etNJNkqsdE5d3Ee7D5vF+jNQeP61gMwvZ7PwjfpXq9QvBwwpjBKjS2X4kCpaGJRnp/6L641cTZ
	ZIigDNmH1v+NqvRaQyffFH8WCVCDRKLn7iLx3Y+twE48g4GG+aLYlYE4cPgRUfwuVgokhLb/tRE
	YaRlER/61n5UHEjqZVt5st5/DxTTMiaxemblyqxB2TtqvWevwz2bZZywkNxwLhZGdHNgl7AEnhJ
	YQXaPxCWPFq7V7uRKuEdFXNEypB29+PkUEVIK3qEPo6ReJceAtRy/+iIxd7p87YRR8eN6TXfJq7
	+7FcUZ/03vp/xZS9cudys3K0=
X-Received: by 2002:a05:7300:6d21:b0:2b7:b88d:b75d with SMTP id
 5a478bee46e88-2b7c852452bmr1046608eec.0.1769805761795; Fri, 30 Jan 2026
 12:42:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
 <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
 <CANiq72k=WkiuKCQoOQFewbCcKATm7KZMV4jYBFmSSFryNKEAhQ@mail.gmail.com>
 <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com> <CAJ-ks9=h9qTU8Lwf8YGziE2Go800+Qqt2h=5wafYd2pedhSc4A@mail.gmail.com>
In-Reply-To: <CAJ-ks9=h9qTU8Lwf8YGziE2Go800+Qqt2h=5wafYd2pedhSc4A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 21:42:28 +0100
X-Gm-Features: AZwV_QgQgVurM9G4uX5_KT9Hb8vvFbo2UFjWBg3lub_rSOkTMQpko6gue6QIE4o
Message-ID: <CANiq72nvzdypum2jZ535tWiWU_Dd30cBPSfODXKC8K+VA1uHNg@mail.gmail.com>
Subject: Re: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add type hints
To: Tamir Duberstein <tamird@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 9:32=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Apologies for the whiplash, I reset the branch back to rc7. In the
> meantime, these commits are available in
> https://github.com/tamird/linux/tree/ra-next for folks working on the
> next round of improvements.

No worries at all, there is no harm done (linux-next was already done
today, and it will likely be closed until Monday).

We can go through the usual timelines and how to prepare a PR etc. in
the call (i.e. the usual bits I explain to new maintainers -- in the
first call we didn't have time for much).

Thanks!

Cheers,
Miguel
