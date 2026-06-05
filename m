Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08EC3F4849
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665097; cv=none; b=YKr3zacVICdQq3GK0+SJUpIhZrJxyG3rg/KQ7PGr2qegFQv/VLAStjGEBjjrn5eO5j9UomVcRzQJGCH0cKuTi4JLatsXjM15iZP+AnrpbsXrN5J8XgfLpcxUJDEf2/zPBJIundu9X1XSMW5XX7Vm437h9EfQAWtAkOacE3a2Nmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665097; c=relaxed/simple;
	bh=2adyeZcH22koCIaVV37qMXdzsfR1yVcEuF5WXqkK9d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2WW6AKCIqlSzVtn865fzz1ayz69OfWc8BhimK1KZakjLa3MtDTDXnFDADBFW3ELiEuv5nrBb8di4U431rXRuJ7pyB+s6Gm5TwrDn+SAebUa02q9qb+7qkEHDHGpjY/iFDHNmZn9U0G2S5odvuiHx0JNToBXTytglwmTH7gb8MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=XAGlTJcE; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="XAGlTJcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1780665089; x=1780924289;
	bh=2adyeZcH22koCIaVV37qMXdzsfR1yVcEuF5WXqkK9d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XAGlTJcEWFO9F6/CZM3gFRTK1BvQFQz/8lahqNu61XFJ51z6AO1TQAjgdnmKDkXgh
	 iZSmTRI/gIkKg6F20KZDoFo2Mo4suBNHjUs3rlsmveyxjBh0Oi1zMXZSck90xbcans
	 dSB9EKKB6+gZkAUZjtB+ktVKoTQTa7rzKm/jTZsko9khKLDhZ2yCmkZQSeLlIBiVIJ
	 toITMGzd4brLepypHGybA3Tpvebqt2FCbHDGVYFPZzo0V1jhF5NyGu5tHXjB3SjmEH
	 pJ+sZrjQBqMs8IWckwBRvMAnuN9FSPL+5USaOZ/mJ/KRGBOHMB3rC104knIcPU0DlC
	 axMYjGbsZLT0w==
X-Pm-Submission-Id: 4gX1zL4cNCz1DF7r
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>,
	Yuan Tan <ytan089@ucr.edu>,
	ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org,
	zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust: firmware: return empty slice for zero-size firmware
Date: Fri,  5 Jun 2026 16:11:21 +0300
Message-ID: <20260605131124.24241-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <CANiq72nE9H34DzEthWmRSmDxgaDW+XLLbrA=T6ywy=hB5FAMrg@mail.gmail.com>
References: <20260605041134.38290-1-ytan089@ucr.edu> <20260605071104.135675-1-work@onurozkan.dev> <DJ0YRJ6MHAU7.WVR4P2MQ4HIX@garyguo.net> <20260605091632.313084-1-work@onurozkan.dev> <DJ10CJ31GS5I.1ZD6WPPWGZTQN@garyguo.net> <CANiq72nE9H34DzEthWmRSmDxgaDW+XLLbrA=T6ywy=hB5FAMrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 05 Jun 2026 13:15:32 +0200=0D
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:=0D
=0D
> On Fri, Jun 5, 2026 at 11:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote=
:=0D
> >=0D
> > Oh right. Arguably the wrong error code, but it does prevent the path f=
rom being=0D
> > hit. xz decompression always grow at least 1 page and thus won't hit NU=
LL case=0D
> > as well.=0D
> >=0D
> > So indeed under no paths we will have a sucessful `request_firmware` wi=
th=0D
> > `buffer` is NULL.=0D
> =0D
> If we are not expecting it in practice, then at least a=0D
> `debug_assert!` would be nice, or perhaps even making it an invariant?=0D
=0D
I think `debug_assert!` would be nice.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Cheers,=0D
> Miguel=0D
