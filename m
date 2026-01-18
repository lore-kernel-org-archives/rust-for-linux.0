Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B423B63F
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768776464; cv=pass; b=UvMKfxqdgbGQB6OsuXhLCm04rDVHFI7NB+SiDK6DUNEJmTueFkLE5c+ehnESBXIUnUNgFcSRr9hbaIM9tLzyGHTVWn9M6opqac/97Y0yN46IKsTMUrcJuX30zY/B4h0+GCyd41F6OmRgiGfCVcQAKWLUPY5J0IdpigaXoI7dtQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768776464; c=relaxed/simple;
	bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um2TvWX+pktAvjffRSvJZl762GDb8TKLE0JIc/vsQyaw3LPru3MKYHt/EFht712kWOr+ODbYiQmExRceO+VAp9Wo/yCSSrfhpOfHVtWvImfZ8HKY7yP5eEt1xgKlsgCNo8xDUs0InvazMuxQYbivuTDY3Ki7JBfCHUdjZawqX1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcU1bc9y; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcU1bc9y"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2a44d954c24so166471eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 14:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768776462; cv=none;
        d=google.com; s=arc-20240605;
        b=C5KkKK//96E5ptbfH2zqPVUhn4FsLUWePNRT8fQEaXZZ04Qcoxorq5uPkLrHAChsF2
         pK0rUFwni7xPS3spuDJht5BIgS+R8nxsMoorYi2DHUNmnqC+YGGnwBB7RB6ldvvi0nZj
         8AXLxpw2FxvDwewzHGN7ZYHX30n3GOxBLVFwbb5l4THHT0vKaS59pIZlnOQF5nFtZRZ/
         h1DOu6VDbsA8I/kVmY51xPXKmibrQJLMtwT8EmeDOdoF2l3ZjYIiTVsPZArOPpIkteSM
         hKF0hhLEx6uT1QZiN0ja+VJYbHvy2ik3UexJ6Kpj29kr15E0bAgXxU0NOf9oQjOjpi5r
         nMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
        fh=9jQ3ubAKRQnjukwsoCOgVfH+UfEofWiFg5tN0hjQXIc=;
        b=kc7tWhiOwZ5Y93LzrwyBG0D3BilH89QmFFiZStrPMVBBYeTJ2J2xxMAPvRGolVgvzu
         77HRBqra3r9pzKCO7zJbYtOra2ywit25kfCZumfbWrj8eSWPH5emqnJry7Lsnk5fyx0x
         L1F8qwqveeY/hgf52lXsbf5GmnElbjyzShUT5D1LLI2XH2LFb08Qc2gd+Cc3U1Ge9vJu
         H+4IiP16kr+qLsR77KBKzZDtuZ1gy7dIj27SoDmWB2Vof7co59wldxtDxTA/iBtKRKi1
         TDUj9YaKO6dtDIYelaJqM05mQmCwVWd6Z/U7+TH4EQ9kwJNWJpD8SRjyTXpqVN8iljhz
         sjPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768776462; x=1769381262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
        b=JcU1bc9yLzSAF9cw+PoTE81AfRM8da4lFwqQDFoCrw2XBK/zQOjcL4qo67uHdUq5sk
         /NjtTOYTRzFYZuovWkmvWjBZqF0Axh1/WL53w+stBRAMXjzCGQLI3espVlnMSIfXV2R0
         ER/NubyBJrQFf5oXDI6I65IJCtGv4r+2XBZYuskMf+sVL40uAUwjXaSu4s56z6bkFpoN
         Q66DP8PoRgYb2HjNbzxy2qNTX4VtMd0irqOhnnN3Flr5CyuA0E67LFMD2ed5j6MVZK6A
         0mCg1Hqx92KreKtrlQIFXxnf3eRQa0t4eG63Ol+GjA1pa8W30Ktag1YS7wwYd1n7Enfc
         RiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768776462; x=1769381262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
        b=xTizHfDvARUeTlprKV7hLK+INQG++HcNdznH7hP1RXsu1XHllQZEJ9GW9uagxP4xKT
         J11DD/5lnfRvxldD3e7JvXB0rMe3biTiVxz1utkglGaJIDB4qyYAn7HDemCwmjo5FQC9
         H2Xm2d62VyR6XWNIf4mJithabU5BtMW0jvcuWrPxkBQZlPpqLGOrTbAjQiJSlkqTxPUg
         EeG7fOdjtrY3fLTlfHDa3GwL8DKgF59YMJyOwiamWJSzrStRGC3kP1Yoe99IQ78MMxdu
         ZqLleB3f87GgJa0OXUgBWzehvL0ZqkDnMVHzaHeNOlj0mt2JpXrMs5UyEPN1mmULZrSh
         DzHw==
X-Forwarded-Encrypted: i=1; AJvYcCVIPLADS61Whg4O1kDOuZALiANO3Bt/1l40SEg4UXK9z8K4OtBUa190IojJaG0H6UU9ALAbXFoW/3IILCqlhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjb89+mab3ssfGVsfYw6fyvAkqRJfiPz29iz9k9+5LXuTHpv6a
	9HrpvOUFQYhDny/plUXO/+1prNANCptZ2qXAHV8zO7PmJyLAC1rWaxd6ibLBnvEAO8dZTMuDahh
	hD72KMwYx2lR+t9GsSRK00Yr0bBDZjsQ=
X-Gm-Gg: AY/fxX5P46HpOZoKVk9zEG6WPf+Fbamv9l5PRmv9+v3MW6P0+GUANdJt9MS6zj8Zizf
	tdCRgXJAZ6ll01L4w6P/k/NqLPCSKM0caDGPVX42ZhHkDVdrABjWonLuUVbGqMN1nSQ0pCNTj8h
	tdOwEONVNo1a01PxiDg8h2EaV/WrLjTWyqiiBBTwCg1VD7lmFWz5Ds2bpogk0NL8Eq0o7b7eEdN
	eGrAtGeJj/KGVRAmW+BjhiEEb1Ok/g/c2cQJ3iQHwldPVCGXCeapqzzTK/XCbNl6BKG5/LxdfHO
	QdP4mASpoPKG9hCWAoQ74FQLVghQHPnSXAfziKqduW+nk4TtF1lfwowoySYf0IzWNGRF0B/1Mry
	XYZC+yhrpvs4e
X-Received: by 2002:a05:7300:5712:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b6b3ef8367mr4547407eec.2.1768776462060; Sun, 18 Jan 2026
 14:47:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221081659.1742800-1-stijn@linux-ipv6.be> <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
In-Reply-To: <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:47:29 +0100
X-Gm-Features: AZwV_QimENAu73eyfoDTdWFMk-4fufF1OWMRqN4JWmKaT7_EDgF1MS6gjjBEJlk
Message-ID: <CANiq72kw1Fg3wGOfa7E4tOtf7Ko8BNCZffV+XVgQRqW4PoOfYA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
To: stijn@linux-ipv6.be, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Emese Revfy <re.emese@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 11:46=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> change the signature of the functions (and even for variables it just

And by "signature", I should have written "ABI".

Cheers,
Miguel
