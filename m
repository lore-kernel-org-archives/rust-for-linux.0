Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514367;
	b=1phbDVyB0NB0c+ysjblG50wGOn9meCIFK3ibltj2asfC8j7r13yflJ7L476X8rjiMxpj
	 MEbRH4bUlTbnoxuxFzBA1G1ziTzpt89WfmQBptmK1BMeZvcx1g2iGyk9nBcU2jS2jJHSz
	 gFpQG8N+z9HmdabfkmngzdBSVP7pLNBOGoNxXd6bLYRlh5YWI3yKmxm2fchfsDh5nAFT3
	 R01ndTF6TX235cv30xDtGVmhA796Eha+njLEF/uyzGUogQ1JW+eIIFGIQH7jXwryo8DrM
	 v5rjlBB8qZffpdgeIbJyZLgRgIXHy/azGToLAtEmnrfyRHhO514RNrE8BmzjoQXYzxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
	b=NFOZcKL0dlMljLwlCY/G5aRl/iOdFbY40ZJHb1SO6LPkCZkk5DT/IFsxY51cvxLCYeNt
	 bteB5hoKHCjf4uMc+WUOXKKXxUymG/CXuNaPzTfRYTRyPVulfWFMVasUEH26DmVOk2mpg
	 fefTyMtCE+EpTLQitH1gKiYvZmKa4KDdAV40Dn+ZPDFwerJDG01h1FHNEzX+mO7h3pp2O
	 bN2Q1RN1RDudNqWCiY7eEaloogDTk5kEVjryZAyguPUBv1gm5fJ2HmZ9TrAoSAffyk/Oc
	 tCGE52yG0SDdMa8Cz60QvAwv1HJ01k5/+b6gnnQ+eiW3idxwgydLCPMujUF9JQwR72Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enkbmR5N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5832C606D506
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 16:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5832C606D506
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enkbmR5N
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3584f70a5aaso466416eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 09:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514366; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4yLrXDlIazSiZi+2mZOf2GgwOGHA0ule/TTWO+ZoZeVFa13l6lujAawnnb0gtNQlp
         a/slutH/a9W5r/VSRMgDeYtmI5wk5SHjzVSSksn1UYf3XgOsc1tzjTRyIixkQgU+u2eT
         FPyD8VCwrFolCVIRdtUA1W+z4CunrDoop75BSKji0CCAehGUIWHiFp9E0mpGgPio0VCj
         0qkPyPDNH1oLzHhO8mnxb7SZURh632N+UXwVI3suOk+bIHruSrsIZAzJoOdZji91irpI
         dJinZTlO5Epvzr7lzgOzY8hHpVUqyxquAEIBERBvE2YLzoRkrf3g3ofYrCwmoNc+hKzz
         3sUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        fh=ZDYexUEEREV25LCbL0PNpGmNt3eAPijuZwpEyYAjqH0=;
        b=mPvlUQwV2/kij/s0IqyIoJy120jDng6XXkfXf5FSeMyzph2VO96mFO3PjQtPZb+rL8
         jEjUK/ZAUEwkKTufyLdf2cuhVmS8som6Ph5v5A+zi5784AwtOfPVkpnZbXpGbVviV3E2
         Cz74dllBdFplNQlgW/fZB9Cw5lHqViuya+VZxQexAV/ojI69iQhemei8sIqV0DdqRiVf
         F0FxXsgCyw8SZrnrqHgeh43Kxkeqaj0xBXQ3KxoE1GREcruiwc97Mqig5t+ociz5dWfa
         N9GawEvymtBGt4ySi3eoqoa0vANrbW9mwHaMPQIbOgoItXXYPmb9X5MmtevI77ovRwJ3
         E4+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514366; x=1793119166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        b=enkbmR5NTVbQ3UrlQC171YQTmcaAcweChXaMlD/dH3Kb0NdENuVXXvN6HdylZ9SxOc
         YZDdTFSVaIlTSe+WbxvtGwjaue5Oso8RDImcyW75nMxyHJv4wJLaVJYMckH1jXWy7M4V
         jjVwjSnIkX7ngKBx12o/x0jHhkNsYjaMeEqeYPTlLs2s7qN0vYhvrJk62IysjOGbMHXk
         BKM0oi7e3qstE3umQzjkF5wcADd87bZr9CfbK5CVLXuY0F6yh6vIT1l1N8rExH/j8BuO
         OrzSzEVnZbIAFyjMi9EAa+l25RIvlyXNJ7A3AT9Fn38GUnYn3ohZjgFIHOUUSKMmjmwS
         d0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514366; x=1793119166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        b=jQkSgdW7DjKr8YT7Y0CRKV6Vcs5vNkPDGp2fZXdYkPmY3a0prZIvWWrzUKcg8Pckin
         xMCbVcMrSJKMGEbOLox74J0KIvR4S6yTUYGLuXSrM4a/OMlnl49aBdbo5vzLnxAsDKhl
         QX7jGF5faxv78f8RnSuvM8jH7MGf1GdWzeFGk3i6A5Vps1jvcsrj6+kGXm/YeCN3cqSU
         sJGYPGpS8aTvInraRFYFVFiu+FCFsorZ0g+fl/qpVbpzsoC0EK+pJLAlmTCvmizphybv
         RmZ1xqNgVD7+5Z6uGxchgiZLHyBEFWFL0CK3uINBvxRW9MmmZr++0YjGe9AhLgnp8Pm8
         LDSw==
X-Forwarded-Encrypted: i=1; AKwUvBwlUb1eIBcu7gYR2SlgQM6ciHUGdkZpyilAycmFk4QOEtUZMjFE/l1WjMn+quPyg7MSxqxY/xiGpSSeaHDbZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHdWvTOzqD803Q4++6+ODOo7hsBtSdn1gN6X3zC/gd2eF5aR9J
	VZwQgKmgjpo+e5UGV5CoOhzYEE8yya+LRnKLc8OZiK+r+KTD8Xs2ApD3AsF3Zz0OuofyShJKNzf
	o+IaCH/Jq35bpovxQn/gNaWULf5WFJGE=
X-Gm-Gg: AYBFou1x71MMbB4hUfHD/LiwOOQT1B+Enjlm82QevE5dG7nq0LDFM2cfOH9qMM8CFUl
	fLT4jbjrFqhhcStynY4zPpsI5HF1AoModLnwqrJa7d5VoyxgMz5ScC8kZZdETsOgcUWpkNJxRVC
	svrierEzu94MSibSRU9kLn7P645kavUq6a74HIK9a2rXfTvpBllx/dkIxSLAD+2c5Lkl8QuCwce
	wTB/i0pCUYHP3Q8lZ8PEVslqxpLU8ys7UwuPY5SsgEi0EcQ0v9eXJeZ1IL4chOjMpjLX0KdUDac
	iCD9VMnnEnBna+gXoGDlt5s1200I/zyE6lTLaEb57X3q0M40qeF2bhe2Oud08WRtZT27ooy4uGZ
	URyjFSHxr8itAfWo6s1/fEoWh1ba/IuCYjgjFWtMp1XsicEBYoMrKkaZ8MTtEs57xG1EbZdFEHK
	1Kcj1rtqBDWgoxOahQc2lS9Q58+UGHds8bhMt9x9FVB8D5bd9304i39t6YFHbtepOgBknlmx+yK
	jWLTW3ntqZRyIjgBTXOy/JkzQFe+Xlw9RBN
X-Received: by 2002:a05:7301:da84:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3619b30919emr24534750eec.0.1792514366275; Tue, 20 Oct 2026
 09:39:26 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-rust_leds-v27-0-2c296d8a8e5b@posteo.de>
 <20261016-rust_leds-v27-4-2c296d8a8e5b@posteo.de> <20261019143818.GC2663669@google.com>
 <236149b4c90323f412d6385c034a78908013e2d7.camel@posteo.de>
 <20261019160407.GG2663669@google.com> <14fd9a916dd0792a74ca01ae073e714f95a9c780.camel@posteo.de>
In-Reply-To: <14fd9a916dd0792a74ca01ae073e714f95a9c780.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 18:39:13 +0200
X-Gm-Features: AclHuK8raElhkbPr-7bZyBZSZrGqtKLbWS10csaRXDChmKEDOAjNZ5GlvVMRpWY
Message-ID: <CANiq72mRvmHOM3wHseReRXUCgpWh2Qzbhto5LqG+eOQ_pUGLGA@mail.gmail.com>
Subject: Re: [PATCH v27 4/4] MAINTAINERS: rust: leds: Add rust abstraction entry
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Ira Weiny <iweiny@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:23=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> drivers/ includes rust drivers. (e.g. drivers/pwm/pwm_th1520.rs)
> rust/ is only for the rust abstractions (the layer between the C api
> and the rust drivers).

Yeah, and we will be moving soon even abstractions out of `rust/` too.

i.e. there is no difference between C and Rust in that regard;
subsystems already own their Rust code (unless they explicitly decided
not to).

Cheers,
Miguel
