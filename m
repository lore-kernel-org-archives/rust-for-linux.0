Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601581;
	b=kqEQ2h5K22b+LXKSGuVZUMgKDE0zlE0Sf1/VmEs+xDClAqqrNuSpuZWu59g6Rpa+0MGq
	 VWLVrnPM8D+Q7dNdsHZMUwfoO6CFgc8AJsP8lGXIZEE/oAfjsuizhAlLr7IAEZb5zKp/m
	 8DgCk3AlCQN4rSFNA4zBfrzCRPp7l4pqV7CwmLJMDdSj1M1AsliGFtInDzJCVG1X5MRmw
	 xsGma+MOPrPSHdZ9HpU7CE9nRE0xMWHjwQUMQTLBB8LE5RXiUmgc8vrP+afoi251ZC+Sc
	 czqOZSgURI3IrCLg+osTEeENeDbFLo0utf65olLeTY8Im+C6nC5y1IndlTdYSiu6RUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
	b=fJLO86+w25W93yjlX1W6I12BCy5QurnzLdyOmNzR7UaBfI7YVpbX8vcRVfNxtBQyg3+p
	 TugnSisXe3Cfp6GpPZYlml810PzZEA3plTnIcPHl7lhzpJiXcxBnqVT/fP27FqWgkNlH8
	 Ru4tncB0Kg1Fa0edVCMElL6sLnu/Folmj/SyyHZE7/GfkXn6K4l5FtFxpLJ8UcuSEQbQZ
	 a/M6LphCP/246amoGaXR7WWc8dsqBKu/X5bJto/KAoAHW8F70294QHYEFFPkk2Qz7Jeyf
	 T4entWBu+40m7Gp3C4nnLNVls1qCUKU9t6xqziCjkqcm5DDhDYheCQ2wXGic8tPTeyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAWZhUlj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A7F606A330
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 20:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A7F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAWZhUlj
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f22a8515eso198643185a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 12:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601580; cv=none;
        d=google.com; s=arc-20260327;
        b=JFTWePJRf7BOkJWJZ7gVwKBlUTD1uj4dv52TxCIgzCASWTsoWdmGgyi7uUu3a5xeXT
         HN+xLdAZwMDCQHiYUHBPO79VwGhBTREMAHg3/+A0mJJTZodfnIW3uzAI0Y9wqfJOjdFK
         N1AYIntBWT818WEFB98o8Jl5oTIijqisxs2DjeuucLFsqKZYTkK70fWt+Jo8+SdndTRU
         +alNABxS9bPoasOcnuuOlgOl8kIKFBusDbdBR/GVEnKLBDHErrLcYKjMpgjZpM1sl7pw
         SKOBdXRDMVPKS5Lx4ea3+G+nC1eq4L8035v8rDz6buZBox+QSuMztpvQjNkmTKKuN9XI
         fNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
        fh=bPZKp4+be9raxpgjJr5Z1w3upNIacUrCExtZb5M9b+g=;
        b=WL70gw0gHl3FtTdfpgOTa60UNIeo3c8RiMKZzLWEVbrmcWn96Hf+09HMZokxc6raaZ
         5wk/PsjwHTYYkWJexKCyUzsPs3bG4JfXd43Rs0SKndr7jNs/HZWGcaZer7cJSli90r6n
         9mAbUX1o3HT2dZpWV2phuCH9FUS+xXMNo7FDv/Ff6UCZF7vF0rK1ikXTtFeRGgoaA4Bb
         B+nMVEhjxyWkWRWhMx4BCMXbbKWFkMzg0TvmF5Kgx4SiJyM/7qerFPuXvjoyCUbNVeYB
         QATsPe8/ghw3xLAhuqQDry92S25hNtwWBCFqzafEJcygIiS+XaPDKFnzI78wolLoi/Qn
         hGOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601580; x=1795206380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
        b=xAWZhUljpSj4GwEG5edXxo6lINEjsx85vjIUzWJhw/LQW+vjQFg+VQZpnvBlLnAT0K
         7t3cmzjH5jUHNzUfWx4PDsIwPZpYxYCA5w1os/pb5TNthu8XeIB0xjgf3B7ZhI5ReVH2
         bOPigVWTzSjcjbnh/6w2cBFJIdF+tp64QXr9nPDhy/rhIAYlpzNo7oc0HRCGEzg86v3/
         qxB+Te0DMVATtMQzWt/dJ71BmmiA0GOF072vtHmRm6ujw/2T9eyf8mKPT9EZt4wDhW82
         /61/dguUNKOHnb5rEdnRfzzyumKudLkEaH90yzaKusaIQYnQzBQC7awjusAsdK9kcM3z
         7nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601580; x=1795206380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
        b=2NP7QDWn/lKXO6OVfriF3kSmCFFKK41m1PWN+B6yrLqLcYZIXOLqLsQkOIKQUcAgrN
         jFugNO8vYEyDF1QMiD27URP0IlYDNalIoMY8L+7ZO8eRhJ1nwpgar3nH1XzsoQAo2NRP
         jPsyjDcMvlVec+9Bexd4oVSACAtIATOnbIQXbmAKng4APAfzJfTgWeMVXvQPCVYURK7E
         lemJSfA3XFGvRikRvGs8IFh33Dr5V6//7rV73NCI56XpunR/Eh+0kFxKfA/sMZ66JDt8
         +79dPIcI0e6Y38HIc3E7ie7gSlBJ4V8NiWes1gujk+GFqdZ5G9J7j4nrPUfU4PDBIVT1
         aESA==
X-Forwarded-Encrypted: i=1; AL+hErEWbY11r1nvWRPq8GnS01xQ+pbwI+CQaPOgVxLEtyVlgltZzGeMUq4U3yZ4WbzYzHLzDNTdeTOlMmOvLWphjA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lBWVaCokKNXy19il9eoSJ63/3mheuqmhjo+DWWp7Nmom2/TC0
	O1wxwj0lVB2hAoFi25SlrQH/4VPc2NKBrWw3GfrZ4rCu0STOWCWl8FoemWhpuX1RoOE3cYICRPI
	LLlFXK8bTK524qSUaM6kNKXzD3Bxtekw=
X-Gm-Gg: AYBFou1BeMrFWYR+ks6vI5G8OVQznh4zSklB0TuCfsKLngj0AzSpt2SZfkiS91el+hk
	dYTGi7MAzaQAr7mfc+kTZjPhQ5KPweUpR32aUfWHG508+KzJgm+T6TYfkigaTm445ga2MDqKoMD
	7OiLM7/ZDzZzQAcvquYBsV0mBIYzhHp87t67WjtaVVxD6RNP/AcikmJgnoPxFukRbN9G4cjhXFA
	aXLXTkUMUF31iOiq3z47VmA54o/fjI5K/irf2vrd6eVocEa/Roa2AMt6kqp4NpuETCCmR/+H4fO
	zlNFFileEe1rpPDjEPklfaz5CXhZuEHwTgSqe5W3AR039DBxutrs4jn93P8VoWJUAOwo7Fv4v43
	qEl+tyo7K2ZUf5C4xuaKVOaHH4GOtsV4+iUe2
X-Received: by 2002:a05:620a:450b:b0:93c:5f3c:f485 with SMTP id
 af79cd13be357-9494bc63eabmr628029685a.53.1794601580206; Fri, 13 Nov 2026
 12:26:20 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com> <CA+YDrKBAPZ9MHB46wVSsD4Vd-R8L1Kkz=Vp-F32+WyfJ5FDaoQ@mail.gmail.com>
In-Reply-To: <CA+YDrKBAPZ9MHB46wVSsD4Vd-R8L1Kkz=Vp-F32+WyfJ5FDaoQ@mail.gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Fri, 13 Nov 2026 22:26:08 +0200
X-Gm-Features: AclHuK-nt_pkf71fgXmv9aasF6EhY7Hz67dSrcbsHeSkY4RsXRic0A5k2swbL1c
Message-ID: <CA+YDrKDyME4fAYMCRvz2Nau78nKJp1H8W4C0yLFp550GwRjvSw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Friendly ping on this patch.

Thanks,
Ivan

=D1=87=D1=82, 29 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 15:33, MBK=
CHEL <mbkchelofficialdev@gmail.com>:
>
> Hi,
>
> Please note that I made a typo in my last name in the "From" and
> "Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".
>
> If the patch is accepted, could you please apply it with the corrected na=
me?
>
> Thanks,
> Ivan
>
> =D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, I=
van Tverdohleb <mbkchelofficialdev@gmail.com>:
> >
> > Add documentation for the emit_base method within the ModInfoBuilder
> > struct. Explain its role in formatting metadata strings, handling the
> > differentiation between built-in and loadable modules, and managing
> > linker sections and conditional compilation.
> >
> > Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
> > ---
> >  rust/macros/module.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> > index 0a7b9e24c..6f361013f 100644
> > --- a/rust/macros/module.rs
> > +++ b/rust/macros/module.rs
> > @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
> >          }
> >      }
> >
> > +    /// Emits a single metadata entry into the module information tabl=
e.
> > +    ///
> > +    /// This method formats a `field=3Dcontent\0` byte string and plac=
es it into the
> > +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=
=3D true`), the string
> > +    /// is prefixed with the module name (`module.field=3Dcontent\0`) =
to avoid naming
> > +    /// collisions in the final monolithic kernel binary.
> > +    ///
> > +    /// It automatically generates a unique static identifier using an=
 internal counter
> > +    /// and applies appropriate conditional compilation attributes (`#=
[cfg(MODULE)]` or
> > +    /// `#[cfg(not(MODULE))]`) based on the target type.
> >      fn emit_base(&mut self, field: &str, content: &str, builtin: bool,=
 param: bool) {
> >          let string =3D if builtin {
> >              // Built-in modules prefix their modinfo strings by `modul=
e.`.
> > --
> > 2.56.0
> >
