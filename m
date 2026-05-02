Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73FF2D7DEF
	for <rust-for-linux@vger.kernel.org>; Sat,  2 May 2026 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777707658; cv=pass; b=qVKJzunXqYlTH29k+szFReFsKTYLcF4EXNQKweu7157915FVtW+f0iJwX+fk0OhqAshDaNtFI8zOycMzixEfc2spKDbeeUyS2VpVfyem/PeD9nfy0voiNnTVIjjEXvp++8Lks6TfzX4xYz5XwV5zNNnfC3FgkUs3c8HRPNmCJLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777707658; c=relaxed/simple;
	bh=XkEc8QKVbVYbpBXXVqxQjdD7NWCMFmYRUsGKBGo0X+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ilr40oGXDV0VdmvzFANpsXeYQmOT+jdhhhDZ2CKJlkp2eX5gHQcMW5IiLnWBvt7/1DYTNcQJloefP8IFevnWiIXo96k+MoI9PtDX3kfTegUsnZu2x0M6u/IDNVs9zxnRM9nyCFsu9xXhb5h/STCwEvY9PrH3t/AuTsiz+etsfT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPvJnoBi; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPvJnoBi"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-68470763896so1344273eaf.1
        for <rust-for-linux@vger.kernel.org>; Sat, 02 May 2026 00:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777707656; cv=none;
        d=google.com; s=arc-20240605;
        b=NBdYnV6Y+FiTcddjZ2MhWoEqiUk8mUE72VLN5PEb7MIdcwAPXh343B3ttpBPv3HOzW
         iYtgxc9q1mobXAqWRSmjpwojWL0j0QViaj8SLuCy6VO5jasBWBFqAjdYDlZinPqHUx/z
         3fOqdUt1VQnNAfUS2iQgbGEiE4+kWScfxIJY5hACPdRkwGIIT4AGXM41dCrWayK5tNjv
         eAwlsHRFZFLfA6PBdX/AWWDrAkyNksHKnBVBQ7m5eWr3UxVMD40iZYu7Y82eVFNqRACE
         aEWAXA5H81Z+DVDFm5hLGWKA+r8I5fU97+UOPiLbLAPzLAPoAJNNcuW/6DD/nyMf1VyC
         +ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IB8wsHvv9tLy7ndiUWkpYM2vJMlTGiSS8uI5yan4PV8=;
        fh=pXvEg9AbsY0OnOc3qgJM/Bp7ARF6UAK0Q1lOdh5NAVs=;
        b=VJQGOYaeLferHD9+lvEk3G2fo5WhpjSPCUQdCf3ViyuJuwDzcrdKVi29oomD6VVOme
         J8vXVpsxeHDmVbsKe8GPT1o6qHluo7iganM598ZtJwn9H6PJT+e7xQQFvvP1pYk5klJe
         tuxnPfGrM8aF1zBc7VEEhnYyDjX2nih+316h02WBXxOZcTWrHxhfdfzhWB9fVnLE0VXt
         1DiA8OTIABB3nzr4QIMu+0BtecONPZilnQ2g0cN9OuZMD7ZmU81gIhE/5V5DWpqTQKv/
         IkSb/nkJ4FsUb4HqyBTgXsiRLB9DTq+TM7KgdjJ/LHY4Mi/v8TLe0BQIhlLVoqDUy9l/
         ABPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777707656; x=1778312456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IB8wsHvv9tLy7ndiUWkpYM2vJMlTGiSS8uI5yan4PV8=;
        b=GPvJnoBi0xPeVSfoN4SzYfz6+wrWIo7yD3FmnTkVVjRhx2eqfc96X/nkjJxtLiDOi0
         QzBR4C4kOide78Ge4gI5+HM7OU2Og5JRgTIIdlJk/kPZgm54mGHqpRaX06go4xCf3wrA
         +IXKM+7qIjXRPdJM1aSdnaHS78XRv+geuATFvEsbo9xFzp5kOxK5TUvsAsO1ON5Le9Jd
         4XaSg005gXXLEIio0Ypg+xBjVoM/34L/n871hXPEQXZy/2FfteZW3fH+C3OXf4OjPuCR
         2ek4KxtPVbYqqlAr9xZGPPR7/U4OuTL1XsUbOXhHBCxUlfRixZLUip74UEy2+ZySpTwY
         vLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777707656; x=1778312456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IB8wsHvv9tLy7ndiUWkpYM2vJMlTGiSS8uI5yan4PV8=;
        b=A9AAZKYH17xbjmXNn9C0DHgRKvXG87xkrcI0VLZlhsVVWqPkaShlrKqsppiJkui34f
         w5yw64XZXv/D5+c8OKAqOd6SqiKLHOHyeGAuY3qSCXGS+iqyVUoCdGYyRAZrZbihaRz8
         aCUUHYPGt8vdw4EzFC1G8Rpb+zeB9tt80//hhbEL+G+CaPdPjFzr3h4BNuYL8D6CbUBv
         ZXd0x6SG+ZOPewoZrKTC8AfGII5NdtrmnCyLeuRAWqVfCYhQOwBGGwIQsxm2+cIZDtR6
         tQDLzn7OY+xgPAvz4XaFPje0RUlKGYnD0k3hycxtsjZdxNttDvITU3yiSIlPfvAAWPtg
         8puA==
X-Forwarded-Encrypted: i=1; AFNElJ+UnRHnZqLzRPFGv4Ceji8f2lr+vvRlio9SuERarjxMZQvJZtsUpPVvnZ1FCwDeVgPHBUAJ4jSMff6iv9HsqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVaZ6KBuX1PCrf8k3l2YyEuaOK2YMSEdAjGFpu3flRDhD9dEDA
	nQ3Tvlt1zg3Mc3YFZUPm65HhFBw0zvaZZBpfll3YvZaT98f/CKcA37W8H0yLb3qVEUKpjLJtbwk
	xPWnc116M5VQRbKBA2seFXAV7Ombg0J8=
X-Gm-Gg: AeBDiesP9l4Tc0tV1SQ3OhGjKyKLx6REYJQhKui7Q97vzeaXtsDnr+8iDOzzawY1Kgy
	auS9Sc8hDGb8115wMBTu7s2PW90zCyhJDUFOLDXT/oeUt+qq0Pm3NllWncez0umX6okP6LvRxPO
	Be8Axiy6s8qa8V5hb6jIM48FbQI+8OTJ1px+GBXQenN9LfueDjjBFlohoYtwdz2SFq5XbMhDVJz
	IZqOq+ckQWC39FQ96bbH1gNBH9EM8zFlZNcgPSMZunLQSfw25+CilRb95Jeo4sNTChqsn8Lwmed
	sH1GhlPHvZwUyDcPqw==
X-Received: by 2002:a05:6820:1793:b0:694:9c71:2772 with SMTP id
 006d021491bc7-696979ec4b0mr1058962eaf.16.1777707655882; Sat, 02 May 2026
 00:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
 <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com> <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
In-Reply-To: <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 2 May 2026 16:40:44 +0900
X-Gm-Features: AVHnY4I4rH6x8ciWTd23XEuuJ5COTveWrl-mJwxSTJdO9ku8jyzPAwoilO6YZq4
Message-ID: <CA+tqQ4L3yeuFS+METfUUn3Wj2ihk-b5yr8iG=G_fzRGXv+TcyQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 11:14=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> On Thu, Apr 30, 2026 at 8:15=E2=80=AFAM Jesung Yang via B4 Relay
> <devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
> >
> > +def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo:
> > +    baselines =3D reversed(RaVersionInfo)
> > +
> > +    version_match =3D re.search(r"\d+\.\d+\.\d+", ra_version_output)
> > +    if version_match:
> > +        version_string =3D version_match.group()
> > +        found_version =3D tuple(map(int, version_string.split(".")))
> > +
> > +        # `rust-analyzer --version` shows a different version string d=
epending on how the binary
> > +        # is built: it may print either the Rust version or the rust-a=
nalyzer version itself.
> > +        # To distinguish between them, we leverage rust-analyzer's ver=
sioning convention.
> > +        #
> > +        # See:
> > +        # - https://github.com/rust-lang/rust-analyzer/blob/fad5c3d2d6=
42/xtask/src/dist.rs#L19-L21
> > +        is_ra_version =3D version_string.startswith(("0.3", "0.4", "0.=
5"))
> > +        if is_ra_version:
> > +            for info in baselines:
> > +                if found_version >=3D info.ra_version:
> > +                    return info
> > +        else:
> > +            for info in baselines:
> > +                if found_version >=3D info.rust_version:
> > +                    return info
> > +
> > +    date_match =3D re.search(r"\d{4}-\d{2}-\d{2}", ra_version_output)
> > +    if date_match:
> > +        found_date =3D datetime.strptime(date_match.group(), "%Y-%m-%d=
")
>
> datetime.strptime throws ValueError on invalid input; perhaps we can
> catch that instead of using a regex match.

I think we still need to use regex to extract the date substring, right?
Since `ra_version_output` is the uncleaned CLI output, `date.strptime`
would always fail if passed the whole string.

Best regards,
Jesung
