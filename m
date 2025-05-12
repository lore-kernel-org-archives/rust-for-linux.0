Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ED94A08
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053524; cv=none; b=tlokwMf3YDTyDbFRqE8ckQh8QQXvVey8nzIGNvG7IionfCixRJYtqJ1+LQt+fR9KFDE2p+lWqIs0wynOiTG/s9UK48uYmDI6njtqIhuV5PLrebUKZovqu+MMHMw0eWmivG5XW2udNVfNpvcaydtLDQr5ID0bAp6JFnZBbIZCPfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053524; c=relaxed/simple;
	bh=L2vR12jukEHB8wkI6/8ITyfRSdlOZ7QdM2sX73UrN6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHNwrL8UUNzbqfMn3qZVjM9uy32/IE1WC91lAqchqiGF4GTM8KllJtGM9fS8rVoq0Fay9eHdNnLMzE2KoGBgZGYFRaSgrYQ0/sILnsqmpmwGv9G8oRRdMfEmL40ySCJSZ9ENjS8GoE6XW7uwvqaRYJ6rn5dhlNuZ7a0u946FOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0IpzyF1; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0IpzyF1"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1ff8a0a13cso738417a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747053522; x=1747658322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2vR12jukEHB8wkI6/8ITyfRSdlOZ7QdM2sX73UrN6c=;
        b=a0IpzyF1gV5WDrBtPEQFMqnPSYK8r/Tp1+nyQdUjgcGiv16+IB/77pCzlVSPhtJwGe
         ahanAmEMWOhdWA6T2YgaRRJQHZXW/zkeYcl3Iw8Xcya7vXnPIHK58a+hH90rACjyx4gd
         soCIyBBEkFSx1WckoL5fFLRFxApdlrrV2NjhgK5WNq0hUt51B9ZhYUADRxbbrrd1/GRk
         OcEM16+KXDD0r5DvYX8CWukZm/CAmOg8pOKe8xf35HNljehAtU4eidRuK6aeHUe41DZe
         HXieta5oQ+Zl6RBMLfqHp/ACxHOZMgX6LrWzOWLugq6AGBrOxabGIVge/mm/GAsNwPh6
         19Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053522; x=1747658322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2vR12jukEHB8wkI6/8ITyfRSdlOZ7QdM2sX73UrN6c=;
        b=pPi4+vCCxKqrTzesKsdvDmb23+hWtlj2DUGdsLcnrceHYLaOclqFtR8nO5yoYDcnjq
         RBBHFayEEmnZCxXhgHn9bhUdRupa1jK8WQ+QS9oGETHeTlZ24w3EH/ctF5BztIeaF6ws
         PMLHwWiWg/K+EXY5LdIlbOAzkr4HClMWzpyQ2uxDs2L83McTHiP5FFhVNFwFpHTdYl+F
         zbcd4Pq7JtoxDNDlK2hO9WVUz/lpJz/eUMIbrr1Kr9unnePEoZKteDAfDdCFbuwywLbQ
         cr8JWDyTiTKhE0pS4wFrQOfYL700Dj2d9D9qoh6buKQ150xfO24pcgD1mLnf4dnYVVP9
         gsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqX18YDXZeHFsQj+koRzgF92/OxhSSOXB9obLKzRlhojBTSR1p/Sh3Pk51rvWrbCfK/JHRm8peJwpYLqHrDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQdkyBlogq/l6mpww12GvjgSWaM8C65SOh32LwfzHG+Y5ENEe3
	WrCXe68VDugGEdjNqdf8nt4dH+zmdlCVfZ1RESwV0zU8j6J1YG6papesHMyM1QA/KBvOov3t/tZ
	Kc9Cx1ejLQcmbAFF6rPzAdRpBJxs=
X-Gm-Gg: ASbGncuQjvo1kifPiPgjzqwYJBVVqaS4jewqQYyHeSbI63TWkquNq3iPc7LMEYV7GXV
	2uRPTbC/WfVTaWp5VgBRpY4GwGOxQdejh9JnIGRn5Q0EZBBiGHK7do8awqqbvmp2nuerf1hUhre
	2b1ANXwEW2/EpQHSVBLzuq963LyEsucvmX
X-Google-Smtp-Source: AGHT+IEYqcS6EXB4bIsasmrb2iRFTXQLZPzpehKramsuR+1+ds9b4AEMvbC9xZkWHCXsZPKqLPabOXW06X/TVCmz/oY=
X-Received: by 2002:a17:902:ecc2:b0:224:1005:7281 with SMTP id
 d9443c01a7336-22fc8b7ae74mr65103295ad.7.1747053522145; Mon, 12 May 2025
 05:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410235546.43736-1-dakr@kernel.org> <20250410235546.43736-8-dakr@kernel.org>
 <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com> <aCHk4286hSrq2pym@pollux>
In-Reply-To: <aCHk4286hSrq2pym@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 14:38:30 +0200
X-Gm-Features: AX0GCFvggQ_DN2wFmgfdRWsgwN3vMQlTeCFDKNSKjT_vFgvFDR_6caKO8FxgrNY
Message-ID: <CANiq72kshyTc8iK7a456wAKoJ9pD6omC_+zTZHf+k4Y=ME+aLQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, lina@asahilina.net, 
	daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 2:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Lyude's series [1] should address this and the other one you pointed out.

Great, thanks!

Cheers,
Miguel
