Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793192512;
	b=Ars/rAX1SPgxvyEdRSnQZnPuAGTusH97OtCkTLt/Gr6aYL+Ii4x56aVz6XlKl2mNvOie
	 YcilzY4VKMKuN3mouMYyoyRMxydih4h9n4uWH3MHCrYoDg9mBAztV2S4kOLiOxADp3VU6
	 JfqWXWZVafDox2LgXxRDk+okmW13MrtD8D4oX+O/92K4czGjICYtbd8/SpN5n4kPxXSdT
	 iEetwrcR/iltFAmyCJB0ozAJLCi9chb8oAU9+9qf+ToBfQ38OQ7nwzInavFlEnKWd9nYu
	 91mzAXTiE3kEhApSzI3pcmAi/XOsEdR4P54ikwvi4xxDDmKOTwiBJpcwUeOurBMmpbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
	b=FW6R4khPatRRliW+TE9nnohjtabQECkvu5rrHBj+s4PgS6DyBIfbiheD33x/3UXOJD5K
	 uw5+fFSeg4NfUTXWif62TNzo7VH1WHEexRLp+W0DDlIwf73m8/4DxQvBM+plpmZObg2sH
	 zW8dqQvq/WvUTevKhSsInc4fC4/lmia8nrNkSwDegRSE+bahZIIKvUPnMae76PDnJwbBm
	 YB2N8MA/oW+CSaG3+zWaWpRx0TraCY6MDyvybLUxIVkPnUqipIMaWjukoYCcY0ruNwVek
	 roTihEmZo9SDg7147bBc94KQL+WkykE7r5I2nRTq+XsCrd/Z5dhmsGZBofePDGcqFyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24A606A32A
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 13:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB24A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369fc2e984fso93653eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 06:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793192503; cv=none;
        d=google.com; s=arc-20260327;
        b=dEISKXg66Ua+GBtHVj1wSa/Pc0C+u0//7AehxN+qPEX2fvQWesL8zb/xjbrp3B97PU
         RvEIiDq1cqI5jv/EA9yK+4v4VOqLFEaj9RIs6xzbyis1dbmRgaVUS3qjLZ5eYad4brhi
         rYb/NqeiZw8tPsiZAK9aEeaouuMUrEQN1cAhcxeb376/Pw6xcj7C+VXlsB1Qn47wQSzL
         A13UWAfeZay2F1vxb8vogw8fNt0janl0zbgaFQUQaWYSCm5Hewyp2xRe0ISQDOc0RaIi
         k8QZ/7ez7NQ7X+N/2oZ2hKIUWCnD4Wzq7BhNyZAabZiXcPL8nXNPsdyAJvC636Li1w+I
         8r7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
        fh=U4kwjUpazFJqhiknr/YFEtHAxt57M81Bpgxd1WyEbmY=;
        b=qDJscP/Ql4T6j4tOwKDin52GfMZ19sqg4TqpsU9PGeuhsMOvuEF+1hRMPV/U7VEViz
         3Aix+RomYV2OIlqTE3hKzQqWLByHy7NdIT91l2zxUy6heTt/zq/jpfDOGCWP4nlFHyTw
         gEupFiKzURQTn2PPSm3aK05yq3qlzDltMEaU5eG61FpOPQJGqHdaiFOyFefQAt+k24i4
         R1V4pE2HPd+WuFxc9JovevLWAW9jMPaOJsnd8Z2jTBhNAk3EFx2cuMugu/Ca0Edo0cmP
         X7Vrp62Lq9+1Nbix8DZOSLjdcq5PNrey4J9OnzyxdQszdPbze2kaLhnqAlblwlnaHJUN
         tg3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793192503; x=1793797303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
        b=UVSo07jab76HC06BUzMCuuAf4Tz45imTAmpBAesaFsMWt5m39KDj9ge8xqSoQaGSEf
         9OFdRo94QXfpgOXEuPfp0p6Kz1flJvmFZ8z1Pl9XTHj4jWMD19eD7tpH2ifu9Nuol6he
         4/krJMHORCuqwn9mP8TkZOXKrZTL/BydxOhYruHKdVglNsJSGhG5Y8kd+qim7MPqF01d
         t/FwO2FqJDyrYBUpcd0oNvi8bo0cvg96UT5rsjYopYf/9Jjymc39dFGpgPyE3DgCSmqe
         4qka2O5RhZeZRWzDe5NxXroFSk24lN1FtluEs0uvqTF5hE/6fdOwAQ7No368fQ1B/wmL
         M6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192503; x=1793797303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
        b=WrfVPD2crHeCtazOXlHveBZGID5uliQeDgT9E5Qya/lczHIMPAzCG0v592w3KRI91L
         JfQ4Upbe2hMb9lm1ASO3XGvWuJOp1f/GGbu3x6eQcixZwlsHshP+vALJux4zaerUtG8r
         j19ccjuX4+PEkG5fYS44p2MOeNdXEIzizRe0VbDC02xEVDmyhf5uN2cCbAbY9WkWDzLP
         ErIYIMk1AoP0HM33cMyHABstlOIc7oGUHKnnz2ZA3JwUKaUUrdU6KDi4qNTeMhZ1oDs7
         iolt4UT/KqWNU3ZQuPiKPkbbpoyXPuT+GBoP2XkfCqMbNwcB1c00qaqVzr1Q39N8q9MP
         abdw==
X-Forwarded-Encrypted: i=1; AKwUvBweX5yJKPBequ4SVYHfQhmLBrAxtKErIo7l9pcYv2Z50obHUfLQyVL+KmJrYPEYfYgsswKsRnJRwcoxS1sbOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ50owh/syHmYRn0PSEeMAm+ZiXGd41REdRv4HRBoMMDYL+JLoA
	X4//vBBnaAkCJv1q87Uf3gZwu9g6YoB20+JYyqVVL58mrnOm25D51urtDd1lNMZa9MbkZc5dt9O
	rugAC5CmF/oRHQ5G0yB/IHeZ+RO4nxeA=
X-Gm-Gg: AYBFou0ckASwuF9tMfb45KDYqzKIDGzvtCLEW9XIzLw2AjSD42ok3khXMb3paHNr5Rf
	gCwkzq9eIaqDCDgMUAwj3hocoRbpMnmfAyWgP2FEHGs9Rh7uvTrqXcV3TlcljzGWtRzuV5Rn70K
	+waYvuVgCfSysXqaYlUMHoLmIC4rzobxSSiTt/aaFvNAZzajK34R2Z4sX0Ztr0n6ZjYjoka8ZK9
	ntPYQNw7URd16EIXumhCnOxR9WiOSDNPLhibyiIrsRr1V9TtF1F//ibXhHYMWTZyIiOToNgmsJa
	PD2wAEQK7F5K3KQ7rpJzdtVdhcrVvaIm6XMtfedph+9QVwuJ9EYYYoEEMTj4n1A/DkTelsb1axA
	G6+ppmSl0k3Ha9q4nd95OUJnuLS9IijeN9NsHQwTJKMJMYp23bnY4NAh0DVbdNe5shfFzGxC3ZK
	YpAUTUIiDvjOiB5uWH+SI3pvecT4Oabdh496wU4ZNEsZaPO5+7jgNfN6OxU+ISJAsZwvj64nzci
	mzg2fjUOH1xmIToJ43LtP36gbeS0ELqFN90
X-Received: by 2002:a05:693c:88d1:20b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a1ffffc09mr5566328eec.2.1793192502694; Wed, 28 Oct 2026
 06:01:42 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io>
In-Reply-To: <20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Oct 2026 14:01:29 +0100
X-Gm-Features: AclHuK_S8S9ncRlLn5nkdZ6xCOig49JrX3uIQWvfnFY_1dU8G-aUzOG8uo1jV0E
Message-ID: <CANiq72m_S1uKpg1q-en41cV91QDrzGEsFMZqbqdxUtxEA8Y+kg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: str: parse_int: match kstrtol() sign and
 newline handling
To: git@younes.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:10=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> The documentation of `ParseInt` says that any string parsed by
> `kstrtol()` or `kstrtoul()` is also parsed by `from_str()`. That does
> not hold today, and `from_str()` also accepts strings that `kstrtol()`
> rejects:
>
>     input     kstrtoint()   i32::from_str()
>     "0x-5"    -EINVAL       Ok(-5)
>     "0x+5"    -EINVAL       Ok(5)
>     "-+5"     -EINVAL       Ok(-5)
>     "+0x5"    5             Err(EINVAL)
>     "5\n"     5             Err(EINVAL)

I think these are indeed fixes in that the docs do not match the code,
though it seems nobody depends on this except the sample, so probably
they will go in rust-next.

Not sure about backporting -- I guess in principle an external module
could be relying on the old behavior by chance, while nobody needs the
new one in-tree.

By the way, should we add:

    assert!(i32::from_str(b_str!("-0x+5")).is_err());

to the first patch for completeness?

Also, in the commit message examples, you mention `kstrtoint()` (also
above), but since the docs talk about specifically about `kstrtol()`
and `kstrtoul()`, maybe it is best to refer to them directly. Not a
big deal, though.

Finally, that:

    /// Returns [`EINVAL`] if the digits start with a sign, which
    /// `from_str_radix()` would otherwise accept.

could mention which `from_str_radix()` it is talking about and why
(e.g. "so that the result can be passed to ...").

Thanks!

Cheers,
Miguel
