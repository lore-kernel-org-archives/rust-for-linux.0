Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6131134DCD7
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750118; cv=pass; b=uVTJQ1DhjpepWFXtzjovCr74sepRG2AWafr0hX5rppHmlpEPuL2k/NGYCKBewsRg37TsORZc0fWTkqFyL2n/aC4XkLyobY9SXiBCtyayRYYGMOyrYBjms/A4BOAbClcieD78X+yaS6kd4h5mn55xU5oAJU5PBIUVWrligTl7koA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750118; c=relaxed/simple;
	bh=A89nutLXD+xCwMO7XzgDrk89kKheCA65T31Am2jfSn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1x3Rw4QV3JF3Py7B8Y4TMa751OugPMl5VS/uIyy+JRzZyc1ie7/5Raw+CtJPXLKfyOZHl7L9wxiJczmcFht1k7xkZLdMz4yzIKRdHfj6JK7mjj5dhj2ujvZY/HJ6KF6ZgVQZf6ZmfLsU5tzzQiUjhQOPOR8NZYNSDBUBHbzuY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9wUlXm2; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9wUlXm2"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1363f6f7535so161723c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 05:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780750116; cv=none;
        d=google.com; s=arc-20240605;
        b=Ks9xBKDcc99zB49/1EtVgpAtPh2VHUdftmw0Ouqs9fCVNSs6ia3+78Qd2YkfBnRvKC
         t/UGh14SGQFjxKU7+202S0FtktY6Ru4isCJ+M0tGQ5dsbO/ySKFtp1zovUIBiERGmLbM
         7ZIpYtiU+JvTyacvTBMetukaeWtAyaLGQmXsiYu+/IKAJxCRjm26+bs47LKlE7IzPI5n
         vcWAl/dWwy9i+yiabEFKlXvPPFPEkcn+DY/ZRVvTeWhlDVmBUIU1+Kie0tSQcufGRdkr
         QU7G3EJyfmpIhznV5S8u4PlgVSgT4tY9/9u0rhVI6Y2C0Gy53CSxES2tQZp6vDiHVb60
         lSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A89nutLXD+xCwMO7XzgDrk89kKheCA65T31Am2jfSn8=;
        fh=LH7YdV4S6P9MfIz7XLg4gCZN2zCa1GqeDdiuFjkySmg=;
        b=QIbXzVCEhG4Ee0acuuTDejdRgaRoLPc526kpp76MGPixXIb3d1HF7Pyx6PVAh+lZVs
         55R0BVOHuD8IEMDr/q55oU/PG4NPeUtTsKii0TfdcZ29M75dec8/NHgdT5ii+XnG9dSZ
         bqiFtqDFW0DheN6KnzZDn0ZMuXtY1cxnsErMTTZx/vhV7eP0DZsdbeEPNSKvOtXLiVhe
         B0B3t/f15WOfwXsh0Shdt0lgW2lWpOQTQAlbxkGI/6EiKmq4ejrPuyDrWqJ5mPfBLjkk
         6oJxW50gcEYvcHegXlQQLbYuy9nTqkSiNPvJoMPdvvwFdugeUcTC0MGQCHaX04MB4yCB
         q+vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780750116; x=1781354916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A89nutLXD+xCwMO7XzgDrk89kKheCA65T31Am2jfSn8=;
        b=q9wUlXm254dwdVTD57kLMyvGkFJ8c4EY3x8yBNxpiNyEf867Oq50Su9WmLSiQF6AMJ
         nYXdYVncOD0DkV7Zi+fIxYtyYTR+I7nqh93MRRhhhvkP6WP4QFkYwaS8b75YlveTp56d
         lRQflAsYLppEozFXkoyc9ki29Oz8pbWoWufCtT3qezsJUOjz2QVA2bbmpClnrk+EIkUX
         32iEglUNDr8rKs0e1VoWFyBdqiNAa1p7R6o3bOWmPOzivEWcdctGEzKSwr+Rt3P60sBA
         nJ8Ft/meBfBz6xVxT0XMYvvNlPPD7p3SgbAUg7SoFjYUcoIlEoQOGa6xi/fr08SAGt9Y
         D9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780750116; x=1781354916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A89nutLXD+xCwMO7XzgDrk89kKheCA65T31Am2jfSn8=;
        b=VXRm7Oe+7+fGHoFXxKmwGgqYusGWi4SOUGUVjM79HeXgyqMFmmAd3oa/DxcqrwoXcB
         aRz+s1qKf+pWm2YUms6ETHBKCzEO4GXabcF0J/wZdp/th4kQwBGOKam87rfYtyjD7sIH
         sujUleMJVA8GOMua03wELQH9zbn2W1hccNfTlpMU3cJ9+0ONHev6aqy5jonyAa+H+TPH
         Vpf7PKEQZBDclrOQyqppXQM93WWMyIgt7yYyb7jboJ024uI1gwjhmWFfHszlu+BDMpWZ
         jvrEUKi8wnP2joIs9zYtI0X130Cl5aIKXHhNg7RkTFoIe2McgCPmb6i8eqdgWPvn+uTk
         oeYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+b3S/s3yitXFB39G3DE9giye87NLikn0tL0LsXposGrpU3WeELiVaG/+qy9snoHjAUScwAe/2uwagrDVZhRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR1LOsA8eI7l4jrKCmqbHrmj17EoeYb9tu4tk6OSdlVXupaZm
	5y2RdHLEjEtCzqKQeKf3mFwWntIAsHYKKi0K8jr8EgHRdpa18lip1aNoJpaZFftXdijWDpPlT6s
	XV/MzIFSGx4unIywJg0eEI8WDHhsrbTY=
X-Gm-Gg: Acq92OHlwD9ni3SEramIdQdvPXB2bMrRdtJXZmzK3DheO7v7BC8mywsffHMKOr5jv7f
	kAq5bIq2Bu5lEoDIaFyxDkfT2q/KR9oMlNGt53MZTBqPYO4MBSzNMBVkkV4bednFTrszeNfVExZ
	R4oPeV7To53xzxxbIENw0xkYpPQmYZvKXwT8J8TwnffD8RJp0NW6xL8XAOtv5J6Ic7a2bPwwUkS
	dYYXw2z9UrTvvyae+24/vAMwEK1NpEs/3Wue/dyNG4l+oQCaE37bVEWJJmLq5hn/HEvD38mS7yz
	FqZ0a3TTJLCzWRhy8mC7sv+S/EV23xqXDcCaerRuymfdWFj5VpSQLEnAsK9I+1XvChBRXEX7FNJ
	ta3/i5vga7QxPWJhKQZqKlak+8cZJJKLdYA==
X-Received: by 2002:a05:7300:230b:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-3077b258b31mr1847841eec.2.1780750116397; Sat, 06 Jun 2026
 05:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602163949.2215642-1-gary@kernel.org> <CANiq72n3t1VW5oTFeEZt-raBFnhO-uw_Fjm17vEY2SuvR8XNWA@mail.gmail.com>
 <DJ1Z03DMKJOI.APL4BE9O9B4F@garyguo.net>
In-Reply-To: <DJ1Z03DMKJOI.APL4BE9O9B4F@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 6 Jun 2026 14:48:23 +0200
X-Gm-Features: AVVi8Cd28LdV8m7fs1rqB1c8bkUK2NFlIWlTOaGSeyiYVZG9GAPCUeir4H6obm4
Message-ID: <CANiq72khM5sfLSRKHft5VKKkUBxiVmttiomM7nO_7T+1eeLgTg@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.2-rc1
To: Gary Guo <gary@garyguo.net>
Cc: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 2:37=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> pin-init's CHANGELOG.md is following a passive voice style and I was foll=
owing
> that style when writing the tag messages.
>
> I'll make sure to use imperative mood for the kernel side of tags next ti=
me.
> (Maybe the pin-init changelog could use imperative mood too?)

Ah, that explains it -- no worries, if sometimes something slips it is
fine, I can reword on my side if needed, but yeah, it helps to have it
already that way to minimize possible mistakes on my side while
rewording.

And it was your very first PR anyway, from a quick look, so it is
completely fine.

Which makes me recall that I should have said: congratulations on your
first PR! :)

Cheers,
Miguel
