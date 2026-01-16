Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8066C3A0B01
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574598; cv=pass; b=dDkGPfKfdzRwuWJl1U7b0KYwn3X6qKXj+jgnfwZXn4ZdIupgmikugz1aa0cm6ajN3cbp88Pwgfu89wB9PA5zL7M736WFJ1oerO2L9LZ7LzzA7f3ZYgF2ZnSHNnO/aRg2CP+71z9N0vMc+1s+mP2icXSejVMdnw1vZCirH2fdGoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574598; c=relaxed/simple;
	bh=2CLIV10bQuTgiOMg9YS+3Nr791qXTIVYs2YFt1tUITY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBf2oVuo8ZAglYoO9QYW4zojIAcarzez6VOhnu0Mp42NUPDzp8cqbMPTeHyWYu+V+a3zNGmnCYnH63bqpokmTRYlWy55HZuCrnxCF0uBjIAQCeQCDR3Du4YaSF97VE5z0sA7PqyFFG8jfOsHI/c6AdnKwYaaj2Ls37U/6M4XFjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3DqIK0J; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3DqIK0J"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ae5283dae8so164025eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 06:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768574596; cv=none;
        d=google.com; s=arc-20240605;
        b=MwEKU7miZ7twyOdDjN7qkLfQHvoj0nyOj3stgRwHdat3Dts5gxTIzifX4AaJrBurge
         2Nb2o9GJ/gTmYhAqenJBeVd1ogqufLGDI3G//zBLdAwpgYk77ikA2viZ1NktloiVWfCF
         Z0o45GmoG8kl7th4PX1+WWMqWoUDfG51Jjx1I+m+3s+xRcj5h2Ulpwfl2Vt0j8Il/54/
         5ywCtvoLq3vxr90qJSpn7rroOmgWuviG/0RKP3+rOP8259+QOdjwCqRA2XSrPFimvRuj
         DhakYLtCW1emDmSWgHmBRDiLvdwQdp7Y3kh3I1Q/7MZ8BpjL6RtCuK96x1OXQg9NmGg6
         SPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2CLIV10bQuTgiOMg9YS+3Nr791qXTIVYs2YFt1tUITY=;
        fh=h1GuVb4cX/ArE+v8LEsUpAMfnfrbj5HZw+yOMcH0RDc=;
        b=QGSVWnPjZthzZWx6uTPXPy6glULjhr5QziYY2WMtNY35gcgyFWAcncZKRUpUne4g14
         x65ABtL7v445rhj4bciHpHUgXNA66XpfDn82ow9oztdmyLm9UVEoy3YRNztlZfcfG+Go
         QYAqIEeIKKyTDL4tUVxWgSxYTWJAnBKQ86lY3tW0ks+eExNmxd1Mjtzysk4eeNFLKnww
         xMtW0NG7MFpu/FrKOoxgsvcJWH0mNtfDZpn4IjhzDusFPfCQj2s6MYNallh9SbK0oPud
         n/cDKVB8s3gRDYra0FXWAs4NMgXyLxHNQU9BockLN2kt0JP/Qsol3/Iz9YavbYBgp4BA
         tQXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768574596; x=1769179396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CLIV10bQuTgiOMg9YS+3Nr791qXTIVYs2YFt1tUITY=;
        b=I3DqIK0JD6jycH6v+GmF+t4RIiDQgxmSjPJt/Ls5CIoEHTGbDJYJ3gb8oJQEe+K9R9
         A8X+s/1aRREpoFaSGdlcxBmpYZtmfNcNPPm9xyluYwJWEh7qR/bnRAWHD4aO1SmmLxcW
         38em5InYbU2dyRmjqbwkc6zRPPqkqcaV7JgHio2pAob852IliK8yqG1Lxo6s5yzrzz5X
         N26+3sYydZ3vzYc9EwC7eeAfFGdkXOLW5Wy2frVcrQX1x/MSaAlz4TFqD9RFksuVRmUR
         M1RovSlbPoo6+ftCui1uLba++L9ZrSgLjegDooix5RWCkJyXNJc6laxdod0BPIe0vewf
         hhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768574596; x=1769179396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2CLIV10bQuTgiOMg9YS+3Nr791qXTIVYs2YFt1tUITY=;
        b=bGqkp+kLfYN49znaPp/5yCKf/m/dwwcPFx31rNI32p/X/9kSbCCfmnShAs9ZNfg1Jq
         v60RuRD6YtpuhPm+oruXbpLgath3dzzbqMZiVnFNb5cUu1DCNCGJVFThisqqFwlkCobV
         VXlfg0cwC/x6Qdbi08fzazfAxNBY8kP+qKWWXlBuBG2Fex3z9iJUThgkDa2UiUZDxXat
         fkTnSMHCQvoBs5AqvxF//GGLMWWgLtLK8wUrS3gIuBi2fjwLokSXfHs3+N5bw+QZiMLb
         b/xvBo7uSfXFODrGr4PSXR5ipa1yfMV46YzrNQU6SaKA2Yd+LjQ2Zq35I845UpnEfP11
         WTVA==
X-Forwarded-Encrypted: i=1; AJvYcCUnS4nxVGV5B5haUZZ3K7RnNqnbISjxwQKrhrRyYJJaGFAc15qs26HkQEuOhpfJrM5uJx8qHtOHr0suI2XRdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7uNMaIH7BIE+g7NtLNEV0TyHrL1cUvaaIqqw4W5ODJmWWOQxU
	tie43Pl6lPWCjkob2+EGy9+p1/ueM1A/WRKly/3Pv9zxtFTiwr6qaag8ThkyBX68FYH9q4TlQpn
	H25Imjzr1vnpohVNiq5WcZh6O00GgjrzzdApQ
X-Gm-Gg: AY/fxX5DFSTWoztyXbwcmdBxo0/BbzkoRDp79OGx8+YDisV4vq3VxdxUaHjlAMs5ZSf
	b/cIv+wz7CaA7av6Qloj6DgOk8/3SnK2Jm4rTuJM8zCKkZ20ih729Oj/WtHeHTXGkkr58lniP1g
	UIIuj9Y+9GfXlGeAAcvIUTGb1tLHKRKgCh8FQSOhZalZFqkIeCbjRBsBIMWPe5XS4Ep4HeYQRqa
	NyUd+7xo+Hnz9m9B1b4oxW+j4qUdUjn7PofksXyoYYrQ3KqFKFWB+hqE0ib3roa+MDhuvJa5cJQ
	s25PsVvwYEY4gduCd2mLrLpysMg2wXElbrtpbglRnqELqUVo6E2ZKXnNsgQDSJCLTg/HWlSH30H
	bEU4Agcx5pV1HbM2+1OLgaGc=
X-Received: by 2002:a05:7301:fa0e:b0:2ae:5abf:ecff with SMTP id
 5a478bee46e88-2b6b41078c7mr1342012eec.7.1768574594954; Fri, 16 Jan 2026
 06:43:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
 <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
 <DFPQG929N5CE.34Y24PGBZN2ED@gmail.com> <DFPZRKQC7ZHT.BVYWCE0GGW96@garyguo.net>
 <CAJ-ks9k_VLyJyxL_pXrq2dW2r+0birOWUmW72Zq9QLXPNjabrg@mail.gmail.com>
In-Reply-To: <CAJ-ks9k_VLyJyxL_pXrq2dW2r+0birOWUmW72Zq9QLXPNjabrg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jan 2026 15:43:01 +0100
X-Gm-Features: AZwV_Qg8eV_38hoIp1d_U33SKqphNmdLAAbbmggoRf2sXBF2Rl3naIu2VFlmBrQ
Message-ID: <CANiq72kMNBm8AJwDAQz3D9yq_Gy9iAKoQ2bpoJ69yTpW86HCsA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Tamir Duberstein <tamird@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:03=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> On Fri, Jan 16, 2026 at 6:53=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote=
:
> >
> > We don't build std nor proc-macro ourselves in rust/Makefile, so I don'=
t think
> > this should got there.
> >
> > I wonder if we should encode the fact about Rust version -> crate editi=
on
> > mapping inside the Rust analyzer script? then we still call the variabl=
e
> > core-edition (which is the crate we need to build).
>
> If that's the approach we want to take, that would likely build on
> https://lore.kernel.org/all/20260109-ra-fix-primitive-v2-1-249852a4145a@g=
mail.com/.

For fixes, we try to keep them simple as possible in general, i.e.
like this patch. Or, actually, even simpler: we could keep the
variable name but use it as the sysroot edition on the other side,
since it happens to match at the moment.

After all, it is a script call -- the script wants the sysroot
edition, and we happen to have it from our `core` edition, so it all
works fine.

i.e. we can just drop the `rust/Makefile` side change for the fix,
which also means a smaller backport (if we don't use the
prerrequisite).

Another option is dropping these, if there are no practical
consequences (did you notice anything very broken using rust-analyzer?
It would be nice to mention those in the commit message, if you saw
any), but it seems best to fix it, especially since it comes from the
sysroot and thus I imagine it could have an impact later on due to
change in upstream code.

Cheers,
Miguel
