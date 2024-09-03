Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA201D58B5
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Sep 2024 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725407015; cv=none; b=rl97jNpXc4ffkg26evw1qvnljXOlLP3mlJZW+9YsMmB50DjnkQL06s7u73c0eXuHhgBNgRubqBmG72FzHtIZamEMhnxsLSG1VC9c6C2U7kKalHszUay/YmTDqYqvq2QNsaDchtit3lobfWBZPCohnrLsZLECHD+mQonUXUoRuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725407015; c=relaxed/simple;
	bh=dRWeIz+ubJrojnqheq1wHauzuvHp2VInC5LvS5KJ2X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+0UiQa5GC/81Qi6asWADL+yu6JDHgne6q/Yi25Zvs+gbu7dLIceCvpJYESiBYRLhm7eFuYqIsCPHdara/zZQQ79a1GWl/dednizjtDg3FurkPdnBIEA+l4Sv7TOjgBim4JhH/KDF+1hiW9MAwMZnBwUkek2eTuKi78/Y7oblDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=PT8+wQmW; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="PT8+wQmW"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6cdae28014dso1421197b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Sep 2024 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1725407012; x=1726011812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlCnxIZL2Il1OI5y0fydGu2G23DBSVnD0BItXQgCoF0=;
        b=PT8+wQmWS6MLQDBhaDKPBexl0TYL/Vp+WmJou8jm05d8Da5MkPa1vpatT3N0DSyUnT
         ZU61ZMcBLhIAENUmi+Uow2opRfG+xX7ynrsvrBpneCl07GvloTrOBzkqq4UHe2JIhO/q
         jLzpl9fVdfyry+RACyuyt9D3JPHL1QegtbnNa3w87Xe5vsU2R02zhUsG82PWb78iWCxw
         llFJW+XxV77O4N/ycoSJe4zxD8L4B+BDpAqdyTljD/mFVJy9vCd/6fINN9cAzNaGBWgn
         hpFiEa8/TMU0Jbi5hUSDECi8/bfs0Md4XjEGBxaNOsuNio3ziJltKgqSWMHxYWWGXm09
         zKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725407012; x=1726011812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlCnxIZL2Il1OI5y0fydGu2G23DBSVnD0BItXQgCoF0=;
        b=jWBXFARXLG2VUxC6QNns62/xSsIpe4GKp0DLEAE07m7gKrw+OOTnuDWoMDiRgz8XAv
         lYeS8pRt+C1dm52lCspQIKzpvL1DThpmQJKUDUy8pz4/XrvEACn/+uhvYa9/vNN1mKp1
         bAvFeSjmn74tmcXrLme17+kkw5o0NMxL1iHxlYbvjdcgCIBsHO/As//D5fjP6F9XqLWd
         HDhrpWoA4fkf6aEUUqWA9gWmx5BAioB+sN7N9vX0c4tp76+0cXD2AFAMRibfQGd5oqWn
         4rQ3fjTr1eq7tOHAZkBdwAaKMrjO64FIbaUMtjB4sOTUiKA+RKahUUk+9po3khnBNzWa
         h6GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaHAK+SYiNXHpAY+JGGAKEDJQKnd019Bz/3LFmgKEnA5NXJSD0elecEbGV7rXCneVV2USgNvplnap8glk3SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/3uSdY5IXneH6IN6I03guVFGvVF79MrfCN8ApMUiOehUbq+P/
	WfFk0XjFZluJz/qJymwcGZR4+81lzwbsLzMFPqYMB/K5RbO0D8rf9Nt3sjbUhwaTqaqxAtnvTFs
	Rb7BkbPKWo7JRslsC+9pY6XlXaya7L2oj1C2Gqg==
X-Google-Smtp-Source: AGHT+IFrQMIAF4flYNUpK76WrQSCNNRsT5DiFAql0jr+5EnBkw560S9E7XVDmYuoVKDvvbmn5wWUKdeul1GdgNXPNN4=
X-Received: by 2002:a05:690c:2891:b0:64a:445c:6 with SMTP id
 00721157ae682-6db25fcd975mr1453357b3.17.1725407012635; Tue, 03 Sep 2024
 16:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io>
In-Reply-To: <62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 3 Sep 2024 19:43:21 -0400
Message-ID: <CALNs47s8Qzbckjf_f_-Cr2rVmAf4sbo1MaSBFagdhZS4KcpQNQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: arch/um: Rust modules support for UML
To: Zigit Zo <zig@iorw.io>
Cc: ojeda@kernel.org, bjorn3_gh@protonmail.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	tglx@linutronix.de, mingo@redhat.com, nathan@kernel.org, 
	ndesaulniers@google.com, gary@garyguo.net, rust-for-linux@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 9:10=E2=80=AFAM Zigit Zo <zig@iorw.io> wrote:
>
> The series make Rust modules running under x86_64 UML, as a supplement
> for the previous work:
> - https://lore.kernel.org/rust-for-linux/20221217044436.4138642-1-davidgo=
w@google.com/
>
> The previous work by David (many thanks!) has made the Rust UML compiles,
> and for the builtin modules, it works as expected. But for loadable
> modules, the UML will complain
>
>   'Unknown rela relocation: 9'
>
> when we try to 'insmod rust_print.ko'. That's because the modules are
> compiled against '-Crelocation-model=3Dpie', makes the LLVM treat the
> modules as PIE executables, but they are just static modules.
>
> Besides, the Rust's code model for x86_64 UML is still 'kernel', leading
> some relocations "overflowed", we keep it the same as 'KBUILD_CFLAGS'
> set in UML ('large' here) to address it.
>
> Now we can test our Rust modules in UML.
>
> Regards,
> -- Zigit
>
> Zigit Zo (2):
>   rust: arch/um: use 'static' relocation model for uml modules
>   rust: arch/um: use 'large' code model for uml

Hi Zigit,

Thanks for sending this. It looks like the patches may have gotten
split from the cover letter because the In-Reply-To header isn't exact
for whatever reason (the two patches reply to
<20240903130606.292935-1-zig@iorw.io>, but the original has ID
<62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io>).

No worries for this initial rev, but just double check this if there
is a v2 :) archive links of the individual patches for reference:

[1/2]: https://lore.kernel.org/lkml/FD7D773099A0C7EC+20240903130606.292935-=
2-zig@iorw.io/
[2/2]: https://lore.kernel.org/lkml/54FC087D02C52990+20240903130606.292935-=
3-zig@iorw.io/

- Trevor
