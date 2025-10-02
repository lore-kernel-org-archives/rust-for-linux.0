Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECB2652B7
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759446998; cv=none; b=iDlyN+Tb016uq7W78inlVWWuSQgCGJ7e+OnwWMIPorUjRRnmPqefTMfAABsvC1T6GV+aGFB/DYTloMwxPFc4tVbMJOOCWGnN5nJjkXq9hRp9F1Mykao7AhcVdO/plHPizQFJI32ozgEOS4YZ/Owt3DQX/oav1eX8Tq3B46Xic24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759446998; c=relaxed/simple;
	bh=6ce+k7Xq/4AJMLhlBBhOEuJaox3vRmQx5u9antQuDgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blzeEaPemybYP4LyOUmGW6MuCwo1cGNYtuocKvcPj75lfc4fdCEsOY0E9uFxszd8uSWM9rHt2VXeaxQpGoFa6532SOov1/3cszKxNl4hEiZx8SOrhcYCqRnuKaVPZFe0KenS3UXMQskyN8NdkrIoLiizSGByA3HiZXG/oVrOxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=al6pCqjB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="al6pCqjB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-269640c2d4bso2280555ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 16:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759446996; x=1760051796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja9Bn6P2KMK2i3cPP4zfsONf+zHduNfLue2PhQDsu4M=;
        b=al6pCqjBGWg9OOOXeTx0H0GCMbzONy4hG18OPBWyuuwnKRKpUyWa2ipxUcvOYnvAHs
         WXd1EScJRxVWhnHO1/Q8D7XnI6GxLgjMpUDy93wvY1SCz9L4SId+rtUEI+niVQlIovRx
         V1z4AWesgHbEr2b/9iM+hgDrRhj5k0exPpUbatNdAJp87Keeb86LvfNP7PdSfqo4Mmoi
         I9ItEFDC9nCVsN5E7jQcE7IPkaNyRE588Bd7okSWdgq+oarofGeP7+RPHc/Jhj3yBM30
         6TtoTGorGwwyYVWxOKi3kA94QYAMtTw2aSkVzJyXypbzMABb8kygjsrxLQjLdlFbPyRn
         qJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759446996; x=1760051796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja9Bn6P2KMK2i3cPP4zfsONf+zHduNfLue2PhQDsu4M=;
        b=QarZZVrk84Okbm6Q3wZxYaiSE8+hK9WFX94hqmQLojnVP8kzVPidDRZ+n4AkanymPE
         75I5v4FXNnq8pwfOoEJHN/NQcyDysSU3EeST9Z/E9HyXY6rrM41z7jh7Wak2WDm5UnsW
         KGD2sLdHtCMoceV2TyngQBC84Pmse+ZOglKXJKNklZwYqFjFzoxU+9ndo6w4EgGyNQ9m
         ornenWwdLGri1NAf96Kk5fvHjgG6omNxQpLyUs3EkRvgeGU7uhoph3NXbs3qQ6SKyBHC
         42CSmVMv2stc0cxw2CU75lNWstTc25kHUKTw5KRlFVsLUpR/SNA4P/f0HOkUjhMysCqn
         Wy2A==
X-Forwarded-Encrypted: i=1; AJvYcCWUQThGwzlbz5AN5MGfFZEA+mLyE0N0eur+DEAKpq7pUVYBiCmM6o9lhEjwZ7uffQz+t+kQbtJEceAuaFxtew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRNEZ/oMrZUiWVUEA6X4wXHtMGsx8+ngaoE4CHxKRLzNdUFjIP
	1Nf3Foo1QzxxIaXnmXlvHTrGtN6uyx3PV7aj7S9tXBQyg9ZThxz38+Hl25PVViCYXpZJVMwhHaa
	hrGbpE4zUkLezwzo79RzXaLvCIkGoCuY=
X-Gm-Gg: ASbGncvS3MZZCqG61PtFHKpf/x8+ELxfU8WlqkvnLX9ftKMTP+HVcOzF0WPj1hKoeMU
	8oYaYRwCumFKV9a1pkgf6f/qoS6jmnHhLGM1FaV05vDleKn5CzeYIUE9McIF9rWHAKhCF4aPRsC
	b0RD9rBuKodiuclB8IMONam6zkF4NfJohPjEhZdIn/XXiTxC7zQTDNdIP8zx8AxKozsDQrAW09q
	qCQ37ovBgeD98gTVhimUsZRe4ZXgJgyfEwhcM7EJb3W5aebMb6hgtzmscFOl3rimkqXczr1LGx6
	5hxJBY8VIVde9p9S7Rl+VqoaZAqd11C5XnOcQkkfC1BnMzG0gg==
X-Google-Smtp-Source: AGHT+IG1jLZozgPgBjz8il0nnl06KAhRwEmfM28KR42HSA5o1aegNp29hlxSwQoCLtlUe5qlKk2pHpNiYMz9bK5H3V4=
X-Received: by 2002:a17:902:e743:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-28e9a7b381fmr5957375ad.11.1759446996485; Thu, 02 Oct 2025
 16:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com> <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
In-Reply-To: <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 01:16:24 +0200
X-Gm-Features: AS18NWDlCUFdClL2tm6c6Fg5XnZ_OVsyL104Y971QPgVO4IBNtdGQLs-NKBaHY8
Message-ID: <CANiq72=u2Zm+MtArPML9EhQyjB1u-OLKe_NRf-dHv25EKA+qEQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:43=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> Thanks.  As mentioned, today's linux-next is where the problem is being
> observed.

You're welcome -- yeah, I see it in my one of my CIs (the
rust.docs.kernel.org that runs more often), but really, I think we
should help you enable the Rust build -- you take patches for many
things across the tree, so that would be very useful...

Nowadays it should be fairly easy to enable, i.e. even the packages
from some distros work.

I have build-tested the patch on top of mm-hotfixes-unstable now too
(since I don't see it applied yet), so please feel free to pick tags
like:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Or even:

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I test every day -next, so I will see this in my 20251002 run and will
notice if it doesn't go away.

Cheers,
Miguel
