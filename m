Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DEE4A5EB9
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057297; cv=pass; b=j8cJMFc591SuU4Oie1UqTEeVfHIThh4O5eBbfjdBF4QnbwcwYmS/bfRtNPDx283+/W5SSVk1nEPblgpcVo4hu0g/qZUfXxDa+qcj+j4mn08u1zQ68BxSmYlaP0EFfIys01zW5XcmssTabA3yrqxyo8Y3WLDrBmB98B+bw6a9LV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057297; c=relaxed/simple;
	bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsbtSUnRS4UdVyTbXehjUtg8yoNT7RZ0xmHDkvl3KOCwm4ollKCjCmZa7GnutmhK6t3B45p85tcHfX/SBTNIgK0+Ajgyb/VqN8TpGzPICXKjCntNnw/SNf7jr9rt328CrHW8XEYRLff+gHgyz4LL1rIJL2P/zEcKJxvNQqduq40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n7o66xOh; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n7o66xOh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so2866070f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 23:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790057294; cv=none;
        d=google.com; s=arc-20260327;
        b=p+ETTsn78/Akfwky1mZzg5Ki0t95D8bIgfKlWqBSpty8MYREiR1pFyv1pJ9UKcn725
         iCwRWFzY4TVcvYgba5mS+0vJiv2mFZPDfzqrdLb3+Jj1twzKajXciBMmLq/OS4hhkSsT
         Tzf2O0Mq4QzSwuNSk5gIese0zNvWBuv4+gbOmiVqhJPHSWCRF/JJ04OewU65VBlf2bsV
         yB9GzEsokYHFYcc2dgxmWwQU98HPD9PNV50xo1aWrT6qRevAL1hjRin1zlQUMEm1kVLj
         bLIBBC5Lsk/MqT1QhAaLrqHlsbzGw6AEkdsjTl2v1059FOq1ifCeEPd3K/e4XrsmJl2P
         +oNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
        fh=N7peuODEpphQgZ38XJDTlK8mfXdGbC/go0JOO1hSetA=;
        b=O89fZH3Tzwj+qFDCjKrhkG5dlOOfZbLiJesWjZLMhbyGPGNlfy0CLBgXN/anVtCKs9
         BRPjMzZx+/m2hXy54Ze5xztZCtOYi409eZGeOxdtAebYyp3r4fo0OtgXO/fYZLMGVooA
         h9itelofbgF8mtRtfoLHs2y0oVJfiRHgHmM/AGm8LHpui8+RVTUlyk0VhSBFV6Cl1eBA
         /heYKFaGK5l7C03cezgLZc44lMOjuq8pl5ZRGxt9I6Ju1T+KHgqsOICc2MqxXTPZs8sw
         M3Fa+Pmq3IHYEk3t5KfQ78iGjUN7OFg3gwE5jOVJTbCRUd7QMj0c56CQ3rof7fgSwe3H
         R7LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790057294; x=1790662094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
        b=n7o66xOh2geGJFF7Egtfk005j/bjOKadlFXEBURGCGMidFQslP4iu9WgkJvRvumiDs
         RakR2ENIuIL0rYsQwTvD1C29WM7j6xRC51h4uF57CJK7q5dAe9E0QvQpvcOz54lAmXNl
         KSg6ePpcIUht32HnH2+OH9kMqhtg3IoISWotL9EkGvmcDa8NyC1d1izUPcn19HUGACWv
         AVW3PD6cfY4T2iqSxf3RGTFU2J9ZLdl9VqLoJ259LzMuzEQ4HpChQeXLEGX606SCGcOC
         gbhkwSlvP9Tcpv6lVQsHUzdMa8mW1f8MnLWnaJa0gIV6goBVkIkkZTmcMGeUsuxnm/hU
         5tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057294; x=1790662094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
        b=vl/FTY3YhyaCuU//+Ct1p2dcLmlHqlEN3TyrRrYnLb2bdPCZKwkQjCWw/N44decEy3
         GbkDqksdStfPYAJdcF+EeIj2GiuZxu3m6s1gF87Rebfx1X5ZQrso416vyh0ioJM1BnrT
         2NPmx38ROqO6QCiKAowxo1zw6cLsP2z+9YPMRbC+6jOb/qq2SA3a2LBYfFVS2iERcs1S
         2C+c9Q5sB9VL+vtpQ7lxhCBfyBmlX5+g3vMyTB/BCtEeSUJQrywxE3tNYyEsVkwaIbqR
         7DHWEpTWEtELQNuZOFh27+J6NUmXv1MZWkft6URpZYHOHvHbqaH7SARzgSZKxLwnLj/H
         Ehpw==
X-Forwarded-Encrypted: i=1; AKwUvByhAOoZvUD/AT+QneSXuYxlZUlnsVuFB8psrGQDMawSx2PE2Gv1D/kM90Vm2ESLToNuw70U5aON17p3Z2kHIA==@vger.kernel.org
X-Gm-Message-State: AFuF++maAWqBIYSXOVFlsJzAeqIUoefgAs9saVSx+gH9mUMt7KsoTkTt
	o83SVC74YyMQ9Vj5E22+q+4Yrcj1c747Qcp5JeuMuZIHEnIBgS7fNfpDELznm80uN7yJOftPr0A
	sXSCY3UqSnijfdLes6WKfZ4zTvcTVnH1rP2PqbXBB
X-Gm-Gg: AYBFou0+bb69PLCoITvmFPFyne82O33zyb6o8PBWG/cnpzGppDBtHxlTLbUrn+c2vjQ
	k3iUy7HJ8GaDZhr83t43yPyMPYxUy5bqNM+ATIX0GbGdJtew9vRsmjFKRTokkaQGwEfJethuZeV
	YBb8isMDHolfaC1P3505p1fKICxJutPj7V3BS3IkbIheFyMDA4UVeIWr+11ejyPVX5i9LQhBp6S
	HkMhry4BNDjikeBt7sVIZ1Y+YumMQnopX0Ki576yAQ8MD5kOLC/FZMZAb2ww+Qgnxq02aEsjvXc
	dq7QnLACmexLWgihDsyTNY/ZhxgrwKvDiKZ3CsPZvkcO4Skf/yEc2/Bwep9KxzKVKOl20WxcAaE
	T5Lu5XLApzCTUROG7QMLbtzDe9a94OQE=
X-Received: by 2002:a05:6000:220e:b0:486:ecc3:2d1a with SMTP id
 ffacd0b85a97d-4871e269d01mr19262668f8f.31.1790057293398; Mon, 21 Sep 2026
 23:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918100016.100988-1-sagartaunk@proton.me> <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
In-Reply-To: <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Sep 2026 08:07:59 +0200
X-Gm-Features: AcwNN1UppsBdP80xwxwz1vqmCSvIj2SXiUZijx9yJ0g1QECx8Yr30-wQ14vxhbg
Message-ID: <CAH5fLgiCrx=XkMETY8eCMTXwpCJiJRGRkdujR5WqQfd=GVrkUQ@mail.gmail.com>
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 4:31=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me> =
wrote:
>
>
>
>
> Hello, are there any updates for this?
>
> Also, I wanted to ask is it fine if I keep fixing stuff pointed out by sa=
shiko for now ? (I.e pre-existing issues pointed out by it in other's patch=
es or should I ask the original authors of it first ?)

You already added my Reviewed-by, and I'm ok with the patch, so for
now we're just waiting for netdev to pick it up.

You're welcome to patch things pointed out by sashiko if they're real
issues. But note that sashiko can make mistakes, so if you're not sure
that something is a bug, it may be better to ask first.

Alice
