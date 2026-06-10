Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58532B9BB
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101646; cv=pass; b=M6mi/QnR6nUh+lVKaldKMcb4dNY81lGOKgI1ps1zMzqumeeOCbGuIok0i1cPl6PaFJldNiWQKZWM0g2Br77NMNapdBsqZYche/zWe9CBCw32XI2igvlr/1PKgVFCoURmPv9gSNStpV0J50ZZKgRCcEczpB1JshPsZzKmE7CXzm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101646; c=relaxed/simple;
	bh=Ok/rbqLeCzI2OFP50FHtyotHAoqNQ7UvvpP27mkh7rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quUvFB8sJ0yMkYGsQ/tgg4phuParoxlsHB9cPMz7/8oz12LS0K9Pap8m3iwz5PLxFC6oroWwtwvV6DXS0w+7+At3ZSP/pbMv5KH09ig2gF/+/K6F0ht1Cts7V1iZA5/jdI8IwxZw2cNzxJB6mVhktkrUB6bp8oI6hkK11PH9k0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jub2Kb0r; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jub2Kb0r"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d4e57d33so325917eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781101644; cv=none;
        d=google.com; s=arc-20240605;
        b=NyvE1+JRMMs5vsRHGVQ0qVTBZNCDgh4z9yAJwugQ05HW44Or9UHouS1ZUpW/VHlf35
         Oqk4aYZ0Q80rP48+lC5w6Zbhj6WlC+LhBe/b//y+7//ZNtr2tuw2QivYq5+Twl/qn11w
         ZnB8mO7mIW/wRKLdUKofI7mc0kkdEm2tljUPjnKOd3I5pU+NzbjQKDqZX/KSnouA//8B
         zUyGjbZlVAWCyqh3ZkQs0QCf78bHGLLFxf5bipEfs1Yvf3N3syOJKSQZhZbZmn4D/o1f
         LC8/xSrqTw+Lk7zf/jqiF7MFSQ7ocly9xwxTOaNwjXJmdgn2yCdcfMw7aXChUvboW/JD
         Gptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y+ePQdXcu6Ws/M7mxUxyentMKwvQYHKiXci8ZFhewXA=;
        fh=8+f/0K0NwyDU04E3iTfXLo6RuQmSWmMcGMZhGuSoyPI=;
        b=RaBWLfgjkQJ76OauiHqC+A6iQuAw6IaZ5zdoekPTGb6uD9MDxzxZoneu201dceSzyE
         LMVCqjr+kIpvBPjOWOMX4IrPH1rylJkFzi+c3ioABYYClcw0+p5f2g6UO1Nyaq/jAyMv
         4C4bEySioDHTAl2VuzId8cUv74kVxXPACTFT2YRswUaGVWOWREvbhFSdPMZrNC617Xcy
         3IC4T9dwymXTbITyMP36BsBwvrMgOGv9GYFXnaNmBx+ZGUUo1Cx3gcHHtmjQ5gPhlNLf
         JoUBnf2MJ9TtwMZ3IN9iJyKPz0hsvCTHqKhdqvm1shxlVi877Mv0CZQ8l7gIHD/k33Fe
         u2dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781101644; x=1781706444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+ePQdXcu6Ws/M7mxUxyentMKwvQYHKiXci8ZFhewXA=;
        b=jub2Kb0rq1eHF2sz1CqwcJN74SSZBsU2qtMBnTRwrSyikyFnrU0gb+C5s1G/ii73Cu
         1bIg6B1dXsNR+pGcv80B5eDZiLGbctnezQ3fwb77DFSXK+SEZMoPmwcTP5TklR/L1qJe
         w3DA+tN/bxqEKmU78lJn7shZitpH31sy2pZeUilfyZl4ots5IZ/LTiqjkOCSqffGj3xy
         DRghVSMQn/x334KFQ/qMbWWceftT88Xnqf4e84iEaBUaeGXK9DCSwahciXiokKgHG1Zu
         SHDPmttWoOoCCNf9hSqKS1JPcD9UpWt2U9AUGAZpnlqZpfDwiIXpGMgUPrtWe8NbqYnY
         050w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101644; x=1781706444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y+ePQdXcu6Ws/M7mxUxyentMKwvQYHKiXci8ZFhewXA=;
        b=kmFAjiUOfLCZzL/z6ZdWS5Aj12MJQf7BFi4dFTmVuValC/FqKpkhl89VtrHxqtoyPs
         xoNHbfitSrpbcJL3CR5D8TBd/G23b0Xstqd06++xar4GejUPwnXH9aUljCFyVsCXpOD3
         oqK5yvBNjKV4jW2T1gaHAwBIS0FI5YQDTTmV0qIyV9G/TOyICE6Cu8hKJPX+jQeUxv1u
         +HjrhPhgfUBUaCSFX5kTrsmdDzr/fguFRe0Lz0X0zywNE0DdbujRTlfdX64Mo04gZgQM
         1wSU6zgivvobF5/FG2Z9FK2WQL7uaVA3kW9STRAKCAlkq5LY/gFBQaA6MzyFCDWQVN20
         PrQg==
X-Forwarded-Encrypted: i=1; AFNElJ+L+dvZApqw0gZMxGpDQ6sYOtQ3KhsNpHEFaaF+3jiaHXnDSCuUdHc6lU50GUJforlLo9bGmuOHRdju2tJ0mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01wQFvx992yqKxfX5mj7/P4eXQXobiwjay7WhT4GzXxnSPzof
	5Fk0lMhkrM8JpB5pZgqDGO0J+34BKsV2cb6M3id2AgWN7LaV5opDiBW0zA6ihq1tNs93XUj7uG1
	m6dseTkncPoxNxRuAcAjzRuN9kqEq1RM=
X-Gm-Gg: Acq92OE4D8Z/d3HYtMXGCyvMvbSnu1rzC9KgSurduliUXvbRnyNf7ASbJKJsfYkZ2G8
	z5cZH9suZoGl34qA1V4yqHqpq6j4a8Ef74tbMtiMNPPNhxABL1cUDJ7b3AVfeZ857BNvYn1zfEg
	Stwec1ge5mYej2q4ZFSHCiGF29BD7MkvHUyCNbd5mDbbeGpsypMhLk8lbqI0q6mi9Qy4Q3R/HLJ
	kUzWU/gtv2nvk/YGXw3yfU0P11e0vA+EdWijrWi0k0uLIRlkaX3XXUexxnushsnNLlv1bv9J/p6
	3BsusWoapzaWgo+xLggr0ykEE8HC4eZOIlK6/1Rlz0KMZMXfIBRqUK9gM28gsSyV1HuVHMS4R6K
	B4BUNSiciNCsJQ5T+UnwYXXJY4vNy9GuTVw==
X-Received: by 2002:a05:7300:7647:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-307d5cee0b8mr2539116eec.2.1781101643966; Wed, 10 Jun 2026
 07:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-6-ojeda@kernel.org>
 <aibUgUSlz-p2oxvX@derry.ads.avm.de> <CANiq72nWBSTXz8VBkMuf_Bcs2MgZ31nocL3o_s7HYv=HbVK_-g@mail.gmail.com>
 <20260609-hungry-rigorous-moth-e9f5ab@l-nschier-z2>
In-Reply-To: <20260609-hungry-rigorous-moth-e9f5ab@l-nschier-z2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 16:27:11 +0200
X-Gm-Features: AVVi8CdNTACvsmFU6UOWLNDhT801et9Gg-2ARDVRjHMqpbCeGAkmYDy9SpFVkkI
Message-ID: <CANiq72nmPPF=6AUp5mcDJVni80ORQr0AQ-4uCZaE+CzB5kV=eg@mail.gmail.com>
Subject: Re: [PATCH 05/18] rust: kbuild: define `procmacro-extension` variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 1:40=E2=80=AFPM Nicolas Schier <n.schier@fritz.com> =
wrote:
>
> Ah thanks!  If only that filename extension ('so' or 'dylib') is wanted,
> I'd rather expected the use of the '$(suffix)' function instead, as it
> may be easier to understand w/o knowing the name conversion rustc does:
>
>   procmacro-extension :=3D $(suffix $(call procmacro-name,dummy-crate-nam=
e))
>
> but that's bike-shedding.

Good point, I didn't consider `suffix` at all, so we can definitely do
that. Do you want to submit a patch?

Although from a quick test, `suffix` keeps the period, so we need
changes elsewhere (also we cannot use `-` in the crate name, so
`dummy` or the current `name` should suffice).

Thanks!

Cheers,
Miguel
