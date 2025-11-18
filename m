Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791973730C8
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482867; cv=none; b=dSyyuQHRy2TwfCLmIakpKMyTD+y9dj3u2RbsZYTB6DUwOSzyNowZwFlI1S02Rg/DfvKVGnA6l9N/aKoI5YhYWBIWx0fBdn4LRKfNf7mYpGEmjpFf0Nh0QWWWlKfw0/mHN/3s1AuOkAwo8rIFIKrhE9kmUxg9U3sqfnQOYNNYW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482867; c=relaxed/simple;
	bh=faOfBULiO6Qp0WVmE8McFWL4GEnAP8ye2ZQBGtxMog4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppA6T/AxTec+IlXdxYqrKcNcge/FkuoKeUwzyQbrwNGpgdXDdzM0LiPPmX/u61OxPCGHZli54iInadLGcVgfAknuUTSj22Iy68hmsQgJ7d84LAWhDqNZaPbWWqQkwFPEuUgepONDAuAZf6pOAa82Gr/UIFn3o4IRZzc0jmOmGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zqwcb0P4; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zqwcb0P4"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso454291a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 08:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763482865; x=1764087665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faOfBULiO6Qp0WVmE8McFWL4GEnAP8ye2ZQBGtxMog4=;
        b=Zqwcb0P48+Opg0PaoHzGH2nKmoyDyyWA0N0PNFgCZOOvSciSj3ry1FttgSdglPBrLu
         OvABB3L07dtuewiVowNYjlByh7RpAr2ZENjqlwK8K5b6nbe2CsalMtbjLWt+qQn7I+qP
         p0evDGvas187GEDn4kAZShlo1qDSOjoJlKWiO6ova8+TadWigOgVTkCPOG2rcotHtH7C
         UfQpu+AHtSbVZCssdbrPNPaQuWsHvevEsxO8ss+k8JhTuBvI1QUt40iUmWvjvT+tgn0z
         Xqc5Gz+Ouvx/1vYgVcKShvUxqGgLGR9JtSBlTwyrMAYot+lJRjK+TlDP6ZkKFIugUIWX
         UhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482865; x=1764087665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=faOfBULiO6Qp0WVmE8McFWL4GEnAP8ye2ZQBGtxMog4=;
        b=wNcWtJ1Z1aZMxtNVoSsdzx793bI4bWDsn+F/fdPAkicbltI/1EvAqbMkG+vUG5GL3Q
         AtU72KqP3ZJbIoKU+QWOfawMkGju7zyoTjznPngfmvJfA32qCI1YShivEFZb6gaHPtyg
         p6iuC88m2QF0Q3r4MRWmccGO1mfA8PP/ksbot5jJ7LcQfFv2Vf8diz32oNJByLCZw8vh
         pS01t71vSjTFWewaHSPUzYaIcV2qYaZskWIUFWPo1CWSR03s7Q8p5xamWR5+qTgVBbKk
         2581NDNRnCNxUCu0kqI6rUH4qVrmnDeNY/DMYPNZ8z39AbQfe8PK9ZnwK5cwMbiuDI8H
         bGvw==
X-Forwarded-Encrypted: i=1; AJvYcCUw9kdzwgOXMI6lYKZ17h+WNJz2ljZqWrFCafoVawaltdlo0bDlqxSijMvxNgchaPFf62Ovs/CEi0uV4ZwxYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12Td1LEFiyGG+IRwk9IErTqlkNl+UFwVAuCOz0hhsuspab1/r
	JbD0sN7ve9+foZ21S6/4JvEyYoX91dk7w6l1RUjisSC9nsCdMpw7J1FnCKaZT9c4ACHgjhyD1Bm
	l/IcZDyugM0KttYn1N0p806EJrJO/H9k=
X-Gm-Gg: ASbGncs4tYkOx03qPDMTcb1DJUAAzGpVIL+0M2RDVAGhOrzf+Ai/z/Vhd+K10q5Sa1e
	9W91fXESso6nDn0jytePVTBVIO09QR+A/s1AHSOvHqEFo3zIeI/jWpj9LS6hkZAGPvvR4erNDij
	Ue/NE4yUhHMmsJUiZ6jp5cH0oBOTux7/XV00rXXgFmlhin9aoLrC1UtcRizNLoLawInGmi1ijGD
	wOhnL5XAP+42Q7LGmVhZYN0sR5aeD9fw1SSIhd512dhRAMmg3lX0ooCW93n/lOTgHEvm+hl1zXj
	FnoJOsB0gUtMDZW+TIY4yK15rTYrkdPTAnDfx5cHCaW6sKw/y3t19kkeUTDtODFd3ZRKv4mRe1k
	mrJn+1Dr7kYWJRw==
X-Google-Smtp-Source: AGHT+IFVRdNsejBm6GKYlYca1Ngn1yJHjVdLnMU26Ia9C7PKBAIRtq1oGRAnFqiiyXtONzw3uw69CCzFP8m6+uCM7y0=
X-Received: by 2002:a05:7022:ea46:10b0:11b:65e:f33 with SMTP id
 a92af1059eb24-11c78ddf633mr1026663c88.1.1763482864497; Tue, 18 Nov 2025
 08:21:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <20251118145741.1042013-1-gprocida@google.com>
In-Reply-To: <20251118145741.1042013-1-gprocida@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 17:20:50 +0100
X-Gm-Features: AWmQ_bnVmxUteFT3dr5VfpkhZiAQKyOG1ub40EZh79PVRCrhks9ZqnFaWxh_hDc
Message-ID: <CANiq72nsU1YH3ihkaTiVjF_YUZY2nSKbc7j3xLTcHDC-4-Y5iQ@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Giuliano Procida <gprocida@google.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:58=E2=80=AFPM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> This results in the -T foo option being ignored in the case there were
> no symbols. I think it would be better, consistent with the
> documentation and expectations, for the file to be produced empty.
>
> This means that just the for loop should be skipped, say by adding the
> condition there with &&.
>
> If you disagree, then please update the documentation to match the new
> behaviour.

Sounds reasonable. If there were users relying on that, then it may be
best to keep the behavior as it was. But up to the maintainers what
would make the most sense here of course (moving Sami to the To:).

Since the commit is in mainline and it seems you already thought about
the solution, I imagine a patch would be welcome.

Thanks!

Cheers,
Miguel
