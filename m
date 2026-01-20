Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC6B40F8C5
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916329; cv=pass; b=VASB+Jdgc624S+XBTEkvaaKY94hTJuNAqrAFzHaeXWZKwezoKwfyFAfhhBlsYYVJ1ga2LAB4yG9fMr4svQCMDi2nYFwUfI4Lutc+iLP0Pd1Nj+/irYBMayva3X1IXASww6w+2TzJiDsE6ataFWZGPHeBHwc9yeAChw5lBZF8lZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916329; c=relaxed/simple;
	bh=SznF6db3fgh7dj6jHEF0swLk5Nz5mEnPdExmVdEzVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1jItd33DolmKzGfQMruMfjgKEk2mwOUucFGcph6hD85enYTtuWBGD7ismBgQAFPHTVtVE06GJwndmZ0CFNK8hazQXYn/s+/CtycHpf6ca1i98RKx5+DnixgipdhmKWpJDHwBqJVpYXXUtTZxcIrd0X3p6BdXtGRfssZnrh0XHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEuHPMSv; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEuHPMSv"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1233608c7e9so347268c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 05:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768916325; cv=none;
        d=google.com; s=arc-20240605;
        b=JmytYP4+zgfClU+BIbcL0FtgbD3MsF2NiLIK/9ZgeOhYtoNjr33Q/DsUrhucOgIE1L
         qgEQ1IK1JJ68wXQ8BlrlVXaC8f1PAwOD2WkNaIvfjAKkYXPNcpS+MjT+djcVoGxhSkVz
         CutvhM9L+FRrQ7K+qrqmSUGTpAu35chj7LqBubmISfG9+e28lTAABtfFNg2w8y+v3WDq
         HgIehkbkqlUGFjHjhr0L8LiYZMDobQMlRsu8xErDYuE0AOGWVh09IupwaO8OzbAV8y+1
         Tn5LonRVoFC9OUk+AHs7IFIcOr6sTWYSimUy2oYvQLq2cFOCjXUFAW7i3WZduCyBhygu
         dktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhVXI4ukImXiW/E1rib2cPI5kyplJP0Bh1o3PRKkVpU=;
        fh=WbzGDuLosCHRKkENxgCA/DOfe/tt+J+3biyakts7Bi8=;
        b=OhVT8eBSn8aIyralqKHnuj+HPca4JT2oAgjYZNWcALAktKy7oO6ofh2Dp7vI604u3I
         aPYuDjoRxCKIiXwUIQhvip4H3HU7BNQ/dJmunj186DDCQtH0dTGr9tz0VgAFjLMEODtV
         6chO1Qeq2z2snLVBQ68lL9Z75fp3/t8nM65a316FM8irIJvZ5zk/1RVQ5dR2A+yJEStK
         Wbhd5opR26cb7pvleJjcjNnkknvbcimrTIVl/4sWqXTq7nMJydVBajE0pnh2TIoB65lJ
         kW+sqjADQIXOQkj93hmcY5HTFgIBdALPX+TLL3CcvJcQ3NyIjXnmAE2lmzQg0WbVmd/i
         ueDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768916325; x=1769521125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhVXI4ukImXiW/E1rib2cPI5kyplJP0Bh1o3PRKkVpU=;
        b=hEuHPMSvFs9GdU+eJBe5bS/t0AAj1l9gCq6u20cwYpmqjL4Sa7PWqBXRegRTNzE7NA
         +61piqBdXdI+PGXEcVUeLsptJk6gS/SMh7uVVRl3cRr4IZuCCMGUynVHfJjoNBq8kgjm
         p9f6qXvdN0SYFc21OsMDzMmVX4dmfIt38qc/VQB3vHPCAQRR+P3W+4kx2HW7XIpWpGtd
         ZFKteuAyh5+2d4nR5mdWj008yOjPPQin0oJDF2JMMM/xgbcUdli3fcdvHEXMpK6APWoU
         882uNX9p9zntEewghQFWwuQapLEwLP/qKC30yTV+kVQDmKFFDMZ0mmp6GG4o4NukER6+
         QFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916325; x=1769521125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhVXI4ukImXiW/E1rib2cPI5kyplJP0Bh1o3PRKkVpU=;
        b=ONZXHQRbOvBPkuS0UccysbL9EA7ZSr/4yT9B7pSBCbgNBrGoeniHRJqE63Pi/mNdL6
         by+PM20Qc/ljpALtNpL+Ay7E6wo3ySa9n60dU9gTqXPPImrt4PuQxAXntiiy8E1h6jMV
         UWYLHCbHLDyPvajkPb5erBWLtVHwLtTRA8aNeUvPgOrxpU69hkP5+xPbtmhLTLGjQZuo
         8PXoRsFp8pnx+yZuCDEQz01CdBKa/IJVZLLZNbMydYGlVW6SeH6cNzB5w2Jb3j0091nL
         vWGkkz59HHOpm12oKsvkMRLu8YoZAh43pQ35Z6SYz3BWGdYw7v2arW/L9R/NuTuNj16J
         OO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpEyXj3KexcsKEPHgfnaIrTdjj485hJh+rGijRmMUfognKHOcc1baO/cqC/NsuykDOIW150vKmZXYtVyVvBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUmCy9g47fR6G5p89Vic1Ix75A/fHprisnhlvKJOojWANGpzi
	ygUqLzg+GipVN+J3KqbpKwVsl1walL+Ilc/3TBaIj7TZUWYQ45GePvNl7smNpfm6cvTrTt4eAhf
	fkBIuT+WOf2n1Q9cSrrDWkLI11YvWRVE=
X-Gm-Gg: AZuq6aIefOTtIEEZOtCBzAlPy4toQgUxmCzYA++6iRhwvuJHNt3oZoM/wwjh+fm3kg4
	md2+2T4hFlTpa4aJDPaqCJY25nZcobFdFQwkCRtmSYrKFjOLcGYNMDxR9VD5g/8vU0PDBkeZ5Xo
	c8lppvTxjmebAkKNO0d/4FyJSnqa0Ks35cKH8DAHA4d4ZLkMPjOVbsaj2/OdW9aBYQRW5ligPjQ
	myHIrakdOQWm2bTQx9FeQ7vBz2YSQYYsLURBhamVx6Eu5grzhBRgrPYK0j91bYNRXE5an0aORtr
	Rh4kjGYAavBAFv1Bb+3YplmXOAIdrK10QbbxKdeutFqOo2wOBICH/3UsTL60ctjYIwNWYq/DeVF
	IAwbC5dGF9gEK
X-Received: by 2002:a05:7301:3f19:b0:2ac:2f3f:250f with SMTP id
 5a478bee46e88-2b6b3efe903mr6404610eec.3.1768916324925; Tue, 20 Jan 2026
 05:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 14:38:32 +0100
X-Gm-Features: AZwV_Qjz1wuPfQWkIWoNT_Z25qaYTJnwL7_LlXbJYtFdbq30ZnczlTtp-GgGmgo
Message-ID: <CANiq72nEW9H2nhTpz1X9LoBos_taVOuzHX+LHFpPiiYJV4Viwg@mail.gmail.com>
Subject: Re: [PATCH 0/6] scripts: generate_rust_analyzer: improve
 rust-project.json generation
To: Eliot Courtney <ecourtney@nvidia.com>, Tamir Duberstein <tamird@kernel.org>, 
	Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> This series improves rust-analyzer rust-project.json generation by:

Cc'ing Tamir and Jesung, who are becoming maintainer and reviewer of
the rust-analyzer support:

    https://lore.kernel.org/rust-for-linux/20260115214545.63262-1-ojeda@ker=
nel.org/

> There is some overlap between this patch series and ones already sent
> but not applied, but it's unclear to me what the status of those are.

There is overlap, yeah. The multi-version support (which I could
imagine they may possibly want to land first before tackling other
things) is fairly clearly on the "being discussed/reviewed" side since
it was sent some days ago:

    https://lore.kernel.org/rust-for-linux/20260109-ra-fix-primitive-v2-0-2=
49852a4145a@gmail.com/

Thanks!

Cheers,
Miguel
