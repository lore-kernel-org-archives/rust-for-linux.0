Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8444738F924
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985304; cv=pass; b=LR6I4NEWFP9cDPZy/vKUGRKRSzHWxjzg8+9apnR1PczwVQbuXhBmdP116O5+wnws6Z8g8fHuUdMScD26toMLLkUnLao70GAQqFZz5oZ/S0rWSAeA6vwnDeX4Gl7jspmxZsU7D0rOaN4kuXnds0KwKZWkCHVIVTnNhCHDgN9T4Q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985304; c=relaxed/simple;
	bh=+O1gdm1LMU4R5Tdj3xWq5M3jJ2NJgiuWa7PkPi5owNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcIdCW0XBmYKZJT9DWg64aFOndhen41R9OHZuEhUMg/uWsICgFei6cWTnV44qJexkx81ZXzLOjXSkTNOkyMLaP/WtXysBF2jw0Vjiji6+wO77KEktj/1LgGetlLzDBMuhw72TqrgwjOBfnXQEu/yjkjOUgtrapSNjQzfJBGwNYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVjMu46O; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVjMu46O"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12a77005d69so432247c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774985303; cv=none;
        d=google.com; s=arc-20240605;
        b=W1uZxK7Hd2CPpSzKXTDxvDHxxkiIuTxzdeBa+X4ijT7r5oX+SfHltwcYp+GlaRZ+rV
         5N1JmJDvvIF2BSKtrWafq+CnkKfJIPOAfHh6rw6NSUwy9n6dsCKa+UOogMgpNg+O4aPS
         RnNxbieXoM6CkMdX7WUsKuNV4zrYfBWbJcgPI4iOuvpBM3zqst+ZTKm0UwIE0pUC/hhS
         4y6FH3ZiQ33MYZSaWgGYkR6v3Ux/uvxpW9RxQ8BYciqDDeBPi8n9zf44y0j7BkeVxSPd
         gWii3HqlieKFtCE6tu7ekQJCynFwx5xuX45vUpfa3GB9bHc5nCYmt6M7hjcleDJjHF3N
         yYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PROCwt6r5HxrtRuF4dQpEymEA6bnkknhHGwIHf8Upo8=;
        fh=ziMk1Hhq4aOXPYx5mQWjK2Bz1EzbHu4Bo+mUAcJi6Es=;
        b=dsvj3QDDOueqzUTxHU93AWD/HBTMOBqzxs1X2xD41TKr9ieOYRtLziBotLEjTthyNj
         IZ3FVsCD2Qmm8uK41FH/TUa9T+IIOeuoy/mUZtu6XzkORtJS2rrLRfHvrR0qX0DwSgVf
         6N+pbkN3J+eRT0upwXkQitHDXURfEDtnVbNzUeDLXY4CHVjwC8uiCEHtBEXb+cGLkQ+K
         a9U1OdjquNzUf0C5M36JUFHfYMwtTUvmd1GElz2fJ99tmS4SVwy83UZLT9+m3APUWuiT
         SXRGKB69LUaJGn/a0PEho5KVZeFtfMjwubotJGWubfb6YK/VxeNRzVgRRyALn38EXoYh
         imFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985303; x=1775590103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PROCwt6r5HxrtRuF4dQpEymEA6bnkknhHGwIHf8Upo8=;
        b=QVjMu46OTXW5uMe5gPjcAo3UC00yvhQMYYQ6BiY1dP7Pe4eBK33lqTCmbRym/A7oEs
         WN4APWtcKfK6vjsQk7UVrLIFpqPGsH/999Xfub+bKe/C1/9RQbm0fwE80hd0Esm78ydV
         qmfoRuWpUmvd3YVBDjfoRSNQv+ZRK6Nekq6L5oq6Aq5SSr60Pa7IWhwYfM+QZ8FNsJzf
         /1K2PLLU0vVfhXAd1cANb4BTmG6JhuQlQLNxqeT0nu9OxmkcKoSoKQmOZGixImoMe1t8
         5XnxDAEpJ+JrBjQfsX/LKxVU27kEy4Ms+eulEp/jcuXLacpfJ2eCRYEV/gliXQ7UsNAA
         JDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985303; x=1775590103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PROCwt6r5HxrtRuF4dQpEymEA6bnkknhHGwIHf8Upo8=;
        b=iO3jjHpZh62TCbaoaHdF3fBjO8DaB9TEF8co02xvXfbFwVcC/2R+9pMhI9dVgkX1Qq
         j2nlfvV/AcwHxHsaD2kfzB8VvraZvBK3ZCFC9SieuEGGoYjY67XxrdDbjXAknOWiOZEl
         r7Suvp9vlAFDG5noEItSkFRRKMFgMYjeilwdjQDxQp+0jgSDe0oKVJkjtIgT77c98OQg
         uo0lLSDplrCWtjp+wMy3FrRFkKQyfWnJ7QqBao4tlFeUiAAGi7I/LBaLBFXHIgwFL1K1
         BZCGmbwrWlLnxr6l4oHSq98HMAI7s6cLK9nE220a+PdEUK1J3DUczR0Djq/KD8uMwCXc
         OoLQ==
X-Gm-Message-State: AOJu0YzffapvHKGSF0FtDunAE3twPvkpo8cb90Z357erJW2M3LUInMGr
	l3EmGv3WXXxfhEXSAQvloxUz30JezhAdPus8xAlk0pfjT9kOQrGFvjMDPDrl8e91Jj/wVgOTVV2
	VkUFiJUs+STC//cXYs2cOI6tL6Fu6nBY=
X-Gm-Gg: ATEYQzzD8dAMlXN/psMbRn4AMe7w7+mVl3X+Wo/G+eMcYADh0oslqWnDNDGG1pgPUP3
	T8vXQ1vG9HQ/DxVuNNQ1FizAFOdzmbGcCQ+PKROPYxPTzg72PFPre0Maa7NZpomy/Ldh4LKzUtH
	4z5rbFBeqTit6GcePvNNYkiX/9KG1tippRNi6Kp1Wq+IvenpM1vGKMxwcFwe6t5Oju1o1MqsLVs
	2ko7fRzg2VueL1Iv3hSu2/Mn4fXHw/vqL0r/Ni3s2DhCgjoHTgJqcbrzcwIdzhu7VkUFI0lf1l5
	VBFvjYFxAv4OmbCMpkI9FxkZdOcCmXjTUG069K4sSl0E4Rv4hnkwC3MJ4uTwgS6A3KBO4vJFrrd
	lo3mHqYRA/FvEUxj300aQNVs=
X-Received: by 2002:a05:7300:dc8c:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2c930b7e3dfmr137758eec.2.1774985302492; Tue, 31 Mar 2026
 12:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu> <20260331190308.141622-4-david@readahead.eu>
In-Reply-To: <20260331190308.141622-4-david@readahead.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 21:28:10 +0200
X-Gm-Features: AQROBzCoNnkKNuVtUQcnfI8Gd5ZnbKZaPrchhzAZvDqwTV2NzmlHIogaVpfZiz0
Message-ID: <CANiq72kcn=L1yev7YifLuOaruqSmKA3aK_4=FmeBpdNnNOuNPQ@mail.gmail.com>
Subject: Re: [RFC 03/16] rust/alloc: add Vec::into_boxed_slice()
To: David Rheinsberg <david@readahead.eu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:05=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
>  rust/kernel/alloc/kvec.rs | 67 +++++++++++++++++++++++++++++++++++++++

Cc'ing "RUST" and "RUST [ALLOC]".

Cheers,
Miguel
