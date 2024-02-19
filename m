Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1572556D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708337180; cv=none; b=g4QbmS9Uw6b61TDLdLtGkLnSAiO9cnRdeaeL5f4EfMbjlYgpZ3kHo7L6fjX5f/CHoi86LFYXQizvj5kyEv4bKMb/0pcHoYwPOpKm+5meFJS3b0l2d1cvmG4Z9LH5nL1FRxgk2w92aXrxEH0Z4elfAJHV0As2+Nilsl367zNQIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708337180; c=relaxed/simple;
	bh=vYBRCWQn5pi6BftlC353rMYRDQYvAkyKACgB5eVnF3g=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=QwNdeVS0hKXUkI9RW/UORIKgXIxSPm6M3+vwgMzO3pg8OynZbBb+KOuMvDkqH2gO37MwygcdizfHVL6wExFUyw871ggyJtbsZA1kZeSugZ1IyED6sY1NnvrBfplq0YSiCN5kvNrutPcYkUJrew8Ng2XNhfFZ8lx5Y4QC9kIIjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=yMP09Cym; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="yMP09Cym"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d118a181fso1937048f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1708337176; x=1708941976; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=vYBRCWQn5pi6BftlC353rMYRDQYvAkyKACgB5eVnF3g=;
        b=yMP09CymWl0tHkfF0ym2yJeh9fsDdUyUJzoAnfF5TApzCG3DoHuSHk/m8FbUm/RyiO
         q2NIHCLbBNhbPXi5GeR9xXOh0BtSgW5xkmCxhgDUS/pQCMLeWsx4tpa6zz3INN4h7tjz
         gkmpjOj07oMblg/WVzwvNzAPlk5mmE8ND6T24+u5sBViJZjGm/m1zi6ToYqJxF6h3/9c
         +7st40P2ZxKzxVkt2YSk3U9ROoGuJCkMsGBqMRLiLhdr5pxH47bxjmtAX2oyjTBz5bS8
         o0AAnooSgsj61et+IdQbScepfmO0Iu22b4xruFLKKpm2joVdOTHa858BUEvKEmKEIYML
         ms2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708337176; x=1708941976;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYBRCWQn5pi6BftlC353rMYRDQYvAkyKACgB5eVnF3g=;
        b=JPg/KvXouxmpGma1a5sXEg2/x0kNeSUbeebjB5f5PbYEVq8dBvyrse0ccQLwroyxR1
         XcyhS1tMMobetB/TbAMfyvJ9qjVtso5qmpVEDdSD41BjGVqLANRbFup7yN8yBM78karA
         dPxMwueFkYB1IpXLz7bNE6DhT18/i9V+nkyzmtGKmboNuMt71FgmRu3eOENA9RPxN66n
         PIam3ze4FefXOSi5/xY6TajxCBn+SstCLCFxb4vXqTRvtusN/1OnPrEa8hGF5Xt50Hma
         pVZk72k0ZmVyE0sDYdHSAbQU4Lxgb0hSAiP+anzs7lrTO3KBzrc4VhvAFfQTaTlA27Zs
         Jtog==
X-Forwarded-Encrypted: i=1; AJvYcCVvfXHP57LttKbFJ9xJMnCZG47nLbHMOS4TFpqjasZ9oPwlKO672Hm1dAwlpiy+YiFDHLIXpF29etmvpUuohqdrC7XFTXleQbQxaYcdGog=
X-Gm-Message-State: AOJu0YwJ4teFySqBrPvNWS1avnhIoHSMaJb13HWBAxE3gfZbqy7oSYxN
	ynK5gdqikDeQxREXCcHjs3Zgum1X9rw2MnshlFe+83gLjfd5Edb0wG1wpHF0MX8=
X-Google-Smtp-Source: AGHT+IHvaWFWKJICK4F7j0G/eSgGRsIOQzy0vgHZmI/yLOGmIzrOYxDsz1f7pKjzXKmoo5Qyz8h8rw==
X-Received: by 2002:a5d:648e:0:b0:33d:3bc2:7acc with SMTP id o14-20020a5d648e000000b0033d3bc27accmr3045129wri.11.1708337176264;
        Mon, 19 Feb 2024 02:06:16 -0800 (PST)
Received: from localhost ([147.161.155.108])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d660f000000b0033b1b1da2adsm9842143wru.99.2024.02.19.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:06:15 -0800 (PST)
References: <20240217002717.57507-1-ojeda@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: Re: [PATCH] rust: upgrade to Rust 1.77.0
Date: Mon, 19 Feb 2024 11:02:33 +0100
In-reply-to: <20240217002717.57507-1-ojeda@kernel.org>
Message-ID: <87ttm4g462.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Miguel Ojeda <ojeda@kernel.org> writes:

> This is the next upgrade to the Rust toolchain, from 1.76.0 to 1.77.0
> (i.e. the latest) [1].

I am a little confused about this patch, since 1.77.0 is not released
yet and the link [1] (currently) points to the release notes for 1.76.

Will there be a new version of this patch when 1.77 is released, or do
we just expect no changes to alloc when the compiler goes from beta to
release?

BR Andreas
