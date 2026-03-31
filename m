Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442E451068
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 21:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993271; cv=pass; b=TsfhuvLOBS59IkHsm2bgbu4NqGAPh3Tu0isSxmxj6xjl17Tlq3p6XaLMIP+XzUCEmsfhdPqckJes/8mKuVvfqOR7ce+GKKpVKhyNoRA1GyxZIAAzzkDVTYIHyVEKCdvw3bLGE+gO3d5d++hRXjS1/3ktpVraJRR7BsukAg6FvU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993271; c=relaxed/simple;
	bh=hajCAiqdpGHxZAP3oy1kZduYbnNL4mzLkRa2PLYDBqc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tdtwDkRjL4DYXCYMXkbJL9PqYhn4E4rVL53C5KCRgifrqEYxwQCoAII7+cAX8QeQOWLRQYTNTIL3BZ5WgH5KOwhAH/xOWV6dEBrDJRNBnc+n5JNI05qmisyDlja8cKUjHC3fd583pLX44jHRWQxnJsV71AB/PVUdFC9xvXQ1vCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVim/BCE; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVim/BCE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so121899a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 14:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774993269; cv=none;
        d=google.com; s=arc-20240605;
        b=ZpK8BVLoCD4MMTAUSASXHAoAxzA4yxGK9NoyMFwixtkT/LP9oiICnFarxs8jO27AVV
         eCQYAr62XHhKnvINgMoZXbormNsKDBNUCBdpcpLxBQrve3V/06J8+dYY9CsZgKtbyYmS
         3wEq4gN9xVuZwWABQArSo4uVd+dR5vKGYffDtgweCc9O7bBobJiV8b5Xa8aRfRu0KzQC
         gBSBdraoNJxXITFdwjGqD8NY9aNN/lCBtJrHGa5mP4zvdRMQdXMIxDWc9yIfQl57HiD1
         273/8gGWA2jrOy+XjGfBJdALWzg+9JoMn0AAtfBeZUvbtz09BgPsVWCFAsoJ3utB9HeU
         h6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ALnniIhIKxPEQ5yzcpkDztfG+JwGBmGPBq+SL0y8rTI=;
        fh=2gAY+jQEkqzCloVObggV/8tg3PkrhrO4dpLwvmjpSFk=;
        b=CCIYzabpPkn7cMUMMPaU0YsRt68PvS6M2lKpH294O7Evjs8ObH2stb1fntcN0L5FJz
         FsHGDXK1lnpUU7uSB5731lqu41RCf7TBLZPF6EM/7JMT+wT4vXBjxAlI6G/ZJzLtNp/f
         1Um1Jug6EO3apa1ucRSnsbbZRwUuLrcUzoTyc7sLJZrI2L2Y3iHs1uy23/qGpa41Q0Dp
         f45DHUSuvQXGACvy3h5pvwnelLeoXOQu0+UU5/konm1aOJAn/hEld5hCc6E6C9suIllt
         jWVPxiMmJ03ssHy+bWf0xmYiBco7hfn43sPIChKFQM/iI2j1GSa4onxj4uLa6LLN7LCg
         lcaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774993269; x=1775598069; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ALnniIhIKxPEQ5yzcpkDztfG+JwGBmGPBq+SL0y8rTI=;
        b=rVim/BCEAud4Zo6JDKtG5cq9uwPRFAdGqTWPx+PezvBL/Zh+Cc8dPf7v6bjx1hRCMh
         HCfJLHdqQH3Oynk0WlwG0JBG7R6SL6sP/iGY6OP5v3oL5WkRHGYrDI7E3jbQwFRWU19/
         ZbJJMdyuE63sen/8TnSxPQvplgyvN8OATL0CFPC+GBwwUfl9r16oTNsHoMgGfmyNPpvQ
         0BBfZh2b1wDGXBqGsDBAZqWuQeOdECAtzJMd7jqiSMnf/8gJc8v8o5UWtFhd5aJ6KV8L
         Ugd71mTMr+EWkAORkrwd7lrzkmwK1qb8T1hVtt9uv/f1cLoFds3Q3q2KB9OLJRD/rwmb
         M8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993269; x=1775598069;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALnniIhIKxPEQ5yzcpkDztfG+JwGBmGPBq+SL0y8rTI=;
        b=SRWgYGkpOSCcU/KvWpgklRROMiDg+/ci0sEin5XdDulul7EBlX3MSLn2gz7MKIWlj1
         5OteiL7qdef/DIxay586PYK3ns0PxO3WE50BHoGwxqfsLvXuBqdQMHXK57zB3mGxeOmg
         ydJlTFliQsW03t4+fd2tfo0AslomyS6EY3ClygYJcjWuaOeawOZRLCWvcsBFMw2T9jxO
         8UM81YSe5la2jnNf4ZJtk+D30/J3HFw/xv1M6hcT6k5Y+ELEgh/3M4NNGKI5PmAoRZR3
         sOc4f05TGEWR34L/IWiPxbwMhg8O8vXFrl81eoQeeYE+iXS9098/PubQtvs38LLx7nX4
         SVOg==
X-Gm-Message-State: AOJu0Yw7HCcfAVG8Lm21s1O92/Lrh3X2Cfb8WlnrYw3/uT8DbGWtEYHB
	EeBzTCjlj471RKELAGOqoL8HaqHGIoz0KS3ucPgASSQOpb4cGq8M9UP7jxrlp6o3s07Uh07FEo1
	rX3z8pyZh9/JMgrfFFsOq3RNQjLTJmpED
X-Gm-Gg: ATEYQzyLP6y8u18gCJUpfHe58e3FaHgtxuMHQBDlAUZX83kyRBzGICN2L1T5pw4+vuW
	7suFvTjqhhRXPZwk2mYIQjhjTMRZKxDhNmRxD7Nw6bUqIk66LMb+aIpSWDlFHpZTfbI3esPqaCT
	fKaCmBFmJiAR2cEP4ab+4Gzb5KFmMuec8/KT7lygjL/iBn9iOq0bkDcqbhp2QTNYGvMwhEC2LdQ
	Nx9VroYrxWL6P3pmx9cP+TYk9f3bYKV+tD54lk6vRzOgSKfcfH2sX7v471tQeapF9iSOHM968Bq
	L80G8G4=
X-Received: by 2002:a17:902:d504:b0:2ae:47b0:dc80 with SMTP id
 d9443c01a7336-2b25ee9ada9mr46821745ad.11.1774993269152; Tue, 31 Mar 2026
 14:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Tue, 31 Mar 2026 23:40:55 +0200
X-Gm-Features: AQROBzArPiqPU8BXEnE81K7BkL_Fx-DbezwFFfAtr3V_BEwi2chUuL1SlWqziMs
Message-ID: <CANBuOYq6d1AQRgzT-6mcQRVVcAdEFwkR5HFc+v4PVBYEEH7q4A@mail.gmail.com>
Subject: Interest in contributing - Rust abstractions for the sound subsystem
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi there,

I'm an independent Linux Kernel contributor primarily specializing in
the sound subsystem (ASoC) and Device Trees.

I'm reaching out because I'd like to start contributing Rust
abstractions for ASoC. The audio subsystem has a lot of patterns,,
codec registration, DAPM widget management, clock handling,  that seem
like strong candidates for safe Rust wrappers, and I'd like to help
move that forward.

Before jumping in, I wanted to ask:

- Is there any existing work or RFC around Rust bindings for ASoC or
the broader sound subsystem?
- Are there specific areas where help would be most useful right now?
- Any recommended starting points for someone familiar with kernel C
(obviously) but still building Rust proficiency?

Happy to start small, even reviews or testing would be a useful way to
get oriented.

Cheers,
