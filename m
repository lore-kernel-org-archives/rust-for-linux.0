Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2340D589
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163185; cv=pass; b=pDTd20gS0IEulDEvDZJW+uKwK5KGKdRwmNgtcqRCnLJHKw9I+yfInt87dZ7KGoiw8e/GzjyG/rnHh23LVvadOGbEGeY9Ffvzgr09K0CembxRft01eQeuWfUHW3LebdIyoTKW8zyStEnILUxtWw3S7AJIxF02KqYlYUmvJIMELXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163185; c=relaxed/simple;
	bh=Bn3EnBHfkP6gImyPH7TD72VAQaqad5HMgVHCeA3f1VQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRze8jfeUh09to8bvwo4wjvEzkYpqllGs+FVj9I5A1Y7eP9EYzPu+g4HPRy/NJHqUIvaPCUhWM/PDgDwE1firBAc4W3I3WQkvMUoh+B1e8bc4dLLHTpzb0SnS+BW7ku2gAsi5zDphfqPSPWT9p9Cpy+1RDBW6qCbJXylSaYIwe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6D09883; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6D09883"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304eb0fc233so697604eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 00:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781163184; cv=none;
        d=google.com; s=arc-20240605;
        b=BDlwYLkXyGmUwSj2jZHIUng53bcWlVfY6gad7+yeUgVNerWo8mor005ZXzWRlnpjTA
         EVaCELDIxMSp66XwI0WAAEYlpk6NrZqpNM2yNFjNjRXOH9HDveCmbosP4WDayFS9TQVW
         T4vIbwybYQpUBFH79hldFtVKc8ZW7FUwGL9MiVlogmuHYIiAc9Ql3oyaFEqmA7DCfTM3
         UvwS5vb5Iyk8BGNmZUNLTNo2SoAgxrlExb2Bzyv0yqw8yWTBiWrcgXonn+TNw500FPTg
         O6pDsRthAIDNcYusoppuyEcpKTL2tzF0vIg+uN7/5BvPviur0Jauf4ZPi2OFjQrydN9d
         RoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7aaFi9ftWqsXPgCpvnLACAdtxJeDiLmPHFUiwt4nVA=;
        fh=NWb43u+R4M9GbvS+DyFdoIKTvmE5gbBkbb79PTsu72A=;
        b=GzCPV1lm8yliYs2wt7nVL1c7KZpnvhuCI1WujyMHW8MJvKIdI7rdZFVKfr29BO8MzM
         Tj71VQCjghKKUbOAEPlY2h3TGVi5ndzrkBMCpS58TPSIGuKszJFgYOdNM6FH4TveuqMN
         waqHAjTmAtEEkDxIe/YbRkSuegEeXcRyZK2n3jVEwuNSueLOTaXAOtdTQe4Tup6INhAe
         88O7EMIVA+NtafBhsYV4Hhc1hBgEG4s6Bcu5wBVFCcsp1W1kB4W1aOpM5xhl2p9FLNLE
         uWQYK6+C5HxACzHD3euY0JHYb10JrJ1xhDsbj48Jc3+PhrMP/NoMRdYOjPrT4AhO0Dsk
         EWYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781163184; x=1781767984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7aaFi9ftWqsXPgCpvnLACAdtxJeDiLmPHFUiwt4nVA=;
        b=H6D09883bLMFNUI6huqoQxBNzoozIz6Ty0Cni0y5PVzMk+P9O1rXg4gxpvDTygxN8l
         +z84uWORF/8RsEMc+lkiIddiLdbue2QlcTWyNjYX66rTHz2swxHGkZuizymPDAB4HLqB
         5levxSVirtd6dPP36iDujBgKZ0K2iV2V3lwkL24G5RS5/o6n1JsDDIKEeLVPBm8etaP0
         8quFLR9RmKax0kO+CfDYqlAUN002KkCnZ1YqYMQNv9UPfWP/AmkNx4juNafAWLz47WEf
         ckEeA87nYhN75sibippt/S7Vie09BW3KMSrUdK44upK2NPhbrikKDywZf320ZKr4ucbS
         wx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163184; x=1781767984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7aaFi9ftWqsXPgCpvnLACAdtxJeDiLmPHFUiwt4nVA=;
        b=M5zYhYexeGg8xbd1baqHKjqw9rKjf1L3676uPb3zT5hiCESBDM2OxxD9CDTOUxRbz+
         /jGnRi89Y7nQ4Y2fS3Q6MvfwDP2NkdH8QHM3FnPcjaQBiamom3sLMy+SqX/yCAg3WDHd
         tsckoIlC0RMFuCvK57gpcQAeI942+2bYLzzhklbTNGYN2Xx/fQ/HhOetfuBpdXfmGkIb
         IQMZriG8/BJdl9O9vbhOWnAhdb3B5dQoKJVYWRM0nw8cyWWux0q4sUY6r/cJ5BMLqwBK
         58CmB+4WAPs+utweRpAvV9DCDqPQx74ONsmxAB3L/Njt9gp1SB4DXciG5Jtwg/Eo3XIx
         rtNw==
X-Forwarded-Encrypted: i=1; AFNElJ9Mouky+dxWieRq1GgSGxvQK7DM4YN5VVwFJBvlM47KNFOR5dU89osN8fPXS6wvVebbTRsx8Qz1dukoAfW3eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmrd8HPN36RhgqWrCuEbWUXvgiqziwfITXYxTpZBKOGsdqhNh
	Doywkpq7NfAw5AY9YJKWxDVQFtNx9KJHoBgIw2jLjepi8vKj7kPQizPYX8YLmhZCR0TWEk+K3Qx
	Ay3jI/GFC4YL0QT6oo2Ow59iQ0ha4XeY=
X-Gm-Gg: Acq92OFsJ6GrlY9+fQzGduBQ1tpuX5Q1E0iZ5snqF4YMl0rmFpc4nmjswgm6diYLiUf
	atq5swfpR43IuJtjqjOLbZBtq9odBdNiiM6saXYhvv9PqE+/eY4xJAKmUt8hwY8cJtNVwZMwpWq
	EGIC6Xt2Snn1Ka37ZYsZzWAatcLf12R6ESi4o5+nSxfjUW/+K1bL5XCj6kWWTfAeFPeuO2cZjgH
	GklzPiq/n0nnUs9zTgg2L55be2YD9g1pEUTe0N4iUAImh5GNWd0nmol/e6qVHbkgAwnJYlShQxq
	fHP6jzsProuAXL2iFg925jMJkhPO5DjkSkthfyTQ6GiK5Elgnz88HOcditYvXso/dPWQDDTX66Z
	8qqxdvQxwzaBbInXbVJANr//gvuuSAuzCGg==
X-Received: by 2002:a05:7300:8606:b0:304:8860:74dd with SMTP id
 5a478bee46e88-30804cd9ebbmr561035eec.8.1781163183579; Thu, 11 Jun 2026
 00:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611003220.3512652-1-yuantan098@gmail.com>
In-Reply-To: <20260611003220.3512652-1-yuantan098@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 09:32:48 +0200
X-Gm-Features: AVVi8Cco51ZUFpFSA8bcoUADhAgE8DZ9MPZ_w0DEB3uCKsG9ETpglatFmEhgDSc
Message-ID: <CANiq72mJ7JuN_j7WwApewjULvhpW_G0Vya9NuNz3uAHYE7ONnA@mail.gmail.com>
Subject: Re: [PATCH v3] block: rust: fix `Send` bound for `GenDisk`
To: Yuan Tan <yuantan098@gmail.com>
Cc: a.hindborg@kernel.org, boqun@kernel.org, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, zhiyunq@cs.ucr.edu, ardalan@uci.edu, 
	pgovind2@uci.edu, dzueck@uci.edu, Yuan Tan <ytan089@ucr.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 2:32=E2=80=AFAM Yuan Tan <yuantan098@gmail.com> wro=
te:
>
> I am not sure whether it is appropriate for me to take Andreas' patch and
> only adjust the trailers. Please correct me, and my apologies if this is
> not the right way to handle it.

It is OK to re-send a patch from someone else, but you need to make
sure you give the proper attribution etc.

In particular, you should keep the authorship from Andreas if he was
the author of the actual fix (though it sounds like Andreas is OK with
you as author due to v1 (?)), and you should also keep the existing
Signed-off-by (again, assuming you were actually picking his patch,
which I don't know if it is the case here), adding your own afterwards
because you carried the patch. And if you make any changes to the
patch, you are supposed to mention that too, inside square brackets,
etc.

Furthermore, if you reported the issue but you are not the author,
then you should use Reported-by for yourself too (even if you have a
Signed-off-by because you are re-sending his patch). Either way, a
Link tag to the original report would be nice if one is available.

In addition, the Fixes tag means there should likely be a Cc: stable
tag too, given the hash covers other stable releases, unless it
shouldn't be backported (in which case, it should be justified).

The document that explains these tags etc. is at:

  https://docs.kernel.org/process/submitting-patches.html

I hope that helps!

Cheers,
Miguel
