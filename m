Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1369B42AA9
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228693; cv=pass; b=mUto8AS2kGyLX2gR1HJWnu4rHnIvfhUv1CLjtaT19x0WMDNDPWvSqjaWp5Xeblcpn1mpaGcI9a9Zk33rQEH0EV+rhX7sG2qyruI5RxK3uRCacIJRB03cLA88O885n7yhkG2QvARQ3eiQgwSiL5P3MlyJ6WH2U7BV24Knhr1PDnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228693; c=relaxed/simple;
	bh=bjCBOw5hM3jeWKG9BnhEVI7eCm1DRY3OWMW+Bu0MtP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mg/Hj7sJradvLxeEatxT7d5/KRKCFMD5B29aZ87aSgYOGAmJuVaw2I3M4T1U27wnjN6sigzuNBT/pGj+qc6HCZ2TMuU994u0lcfI8At0uPKXRkkti6h9Xj99ZXsU0BZ3DcYHCHM3nHORg2s+M3PRyc7BzVK6CuNiP8K/EC1Cid4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RI9F4XPt; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RI9F4XPt"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b807f85e10so443790eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 10:11:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770228692; cv=none;
        d=google.com; s=arc-20240605;
        b=Xift2PIeRXqcz3iX835q8BQIiG9lTEFAYzfBYoVVB33P4aHUt8bkCh/9QbsoUXQOwA
         sUWWONwP4L1Y9VrgJdS/Ig0hx//fCVRgXfcipJLoTJ+zzVTPCLMUe8VCeuDAgtul2TX7
         WWfXWvBqsf4+7S+hUzG3XHOhDv9znfrjKkt2qwLjIEqzD2cVnKM3a+s9kFi4T7sT32n3
         uE1xEeYyRO8p3Le/gsLRM0kMGQ0b6MVAFEkM60qTVBFngxaQjP0Bn86gc/eT/f/c6eJu
         mfD0omevznAaPlOfzW8gxCjVoLb2DKSi00UnokUmvAOkydW50mxGUlBNKW+5SL9IoG/x
         6Izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bjCBOw5hM3jeWKG9BnhEVI7eCm1DRY3OWMW+Bu0MtP8=;
        fh=L5hnqdUYXLgQ1/2+cyQssiL2buB1SLwQNne7zgGV9/M=;
        b=bYd3Q/UIVSFb6f1NwAQka19c1ZjZqBiN4P1WVUovKZAEjtX3INHkSxGnQE2cqw1G2F
         E3ySOxE+OD33WgoenaFeBjcIoWYfDyTMYA6zXKrXbOPXRND1oaqjHS/IbGH2lxUftXFd
         VTHdK2qpJaR+5BJJTTilIqlR71No/lrASBZkMN57F/7fVDJm6rYy2JqsBwIugah9V0Nc
         0HXkz8Tm8IZBXAxuJrxgP1q3A8XM6NGn+X9lP4VpN/VeCAFPJBrPPNtXZsafMz8nPaqb
         9M8fOgoxgghtrPNYrbfO6Z/7I3Qknn5N5ww8xSaT8ibYslgGE3zWgemaHROUHntgI1BJ
         spXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770228692; x=1770833492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjCBOw5hM3jeWKG9BnhEVI7eCm1DRY3OWMW+Bu0MtP8=;
        b=RI9F4XPt1P9Y0oJ7keoFJaLkQex/pzutxpt4JESWs6Oi1sMPhWY8JTAmr/8Ft9eiu1
         JHsEAAT6lKxGFEPR68dVlZ8Vh1z8gNMcXKEYYl4fnESzQP6iHV9nDChOFnEgQr0Doc2H
         DVC7gyJf5FEm4K+cvgZPb3rfDNYIN0GeOcHYzkyuZa0qUjumTBXFAaw+EyP5fseKCE2q
         R040Tx96Tog9t4zeYPj1073WAA+xiqLbFqJq9AFV6JIpMQ6gZ+ohzqtObQ1WEowYcJ90
         lr9PzimGzeJRaklqa54SyJ1TacJOJs4wvBG35is5zKGyVe8fpDkQrGQ0BJJv7lJ1sT6v
         Rgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228692; x=1770833492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjCBOw5hM3jeWKG9BnhEVI7eCm1DRY3OWMW+Bu0MtP8=;
        b=COqDE6/A1t1XDooxrzX57tFrkeu4gQIyEljRjZHVYDGhQBnXRNiKFpMy+hy3zmYSOD
         1b2V+FG+VvAbvjjnqiKLfwMp1Cc7EjNxQ0cXUvhlWjJ9Eu2wTh5RyIexL2uTz3VjaHzm
         EGOeVVP2vggBllxPiyhz9qeDFO8dA3TgvUrpgk+zM7zGXM/YOt69Belst4YKifZtNX/o
         LBsTSdOUJWSb9ANghU2X5GPE5lRwFJgBmM/3uQULI6Cfr92I4qf8fwYSLsvuOX3Qf3YT
         TrV/M/F8wKkr2a3UF1S4HZTzrOD3up6jA3DoRXHSd4rJSFjbXRF6nrC0bUM4/loFjkkq
         Tkxw==
X-Forwarded-Encrypted: i=1; AJvYcCVCu0Z2p2lAhs/ljrOmaKE3UKcBdQ0RrF8ggiTOKPOqoJNDA3yOTlP2J9TSOm4QI6PqwqsGc8rwzPqECT1VHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0Dsd5ekEnWiLYOjuryaU3z86D71SoslDzx8C62LdP4aOdlaF
	tXlGvFT7jDT1TDY9rKCQ09WSCuuzz4DJKIOoepKOqnzofwk7j2SVcssUbXXRp96ohuhu7mAGvVl
	f7/YE1fWwAO4zSmyuebkGl3RVJB/swof+vJPDqWM=
X-Gm-Gg: AZuq6aLggcLTrnv+5RECmMdcQvT0gvoTJwTeXACcJWszkr4SJ2SgIQW2WiVEVrkhuNe
	dgZNpVvLi+yEdsGV679roVapS2Wuav35TYfkBMTXg71cfRRcDKkdw1hmdqEfnFw8Pj5cUrXvc84
	uyHQLIfODR9EdugfUz6Mt5Pnmz1nJC4oF/StQR2XCjBHxnlj40VoCAp9fzYfL6g5VTIms0olOrF
	9FIMSCfh4at5JAEIDcOdZMhy6ac5Ou7zqKpLwEwY6y2u05DLASCjUrEdGYGNLgmEjSBVt61XxlJ
	IxXp1bO7YjD5i2gMKsQIhk78HsOYAc46I9OAOwNkdWEkjBrJMxkgRTTcLB/nPk+avoHB+gjC/qE
	mJ84uNDNIAHCV
X-Received: by 2002:a05:7301:3f16:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b83296f948mr880155eec.4.1770228692199; Wed, 04 Feb 2026
 10:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
 <20260203152542.45017-1-jason.kei.hall@gmail.com> <20260203184933.23c92f8f@nimda>
In-Reply-To: <20260203184933.23c92f8f@nimda>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 19:11:19 +0100
X-Gm-Features: AZwV_Qh0apKy-GgpqMbQeQ0MVsMvr4gZ6MgcbXOOCbEVytBptsjhiz05vP9XfAA
Message-ID: <CANiq72kiJU4sLqLNnz8ZV7JbVo4M77119LwZ9+FBj6Wr6nE0Uw@mail.gmail.com>
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Jkhall81 <jason.kei.hall@gmail.com>, dirk.behme@de.bosch.com, joe@perches.com, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 4:49=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev>=
 wrote:
>
> Me neither. I wonder why we are doing this instead of using the
> unwrap_used and expect_used linting rules from clippy. This would
> catch the problem much earlier than checkpath since many of us build
> the kernel with CLIPPY=3D1 flag.

Please see my reply to Dirk and the context I link there, but
regarding the existing Clippy lints: we want to have the `// TAG`
style comments, rather than attributes, so we are waiting for the
Clippy lints on this.

Cheers,
Miguel
