Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692339;
	b=WIIfluwRNzOYWyDZYCA30frxszfysCv8gAa9WclFYZlbLGjZoPyGYgXs93P40BsZFz8f
	 Z/jfSi9CV+nYw1IGj7d8du1CwTm1o13Zp9RHoO47QIIoxuonqxqGjOJmdGdYu0zZJUiRF
	 EDYlIZRwbsMFDReGavt3TUOnfqcIJxvnaj52QUOFu5b24dgPB5Fajd0ueOVIHnjTCVosi
	 UaQhXwkfFRKcTo7H/7qcz1kBrwQ0H5E/z1+J0eIscVXnUBu4ANgFg68HSzbwBQHfkUb9U
	 eyqk1RL1/ostxMvu68IYlkKiqnkF25aa1bubf+hOO5HOhqRIsdwoK6PTmoPDyzApp8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692339;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=XSe4nQaPVvSh1m8GNLDefCvo1h12oVijF6wU0EAGZno=;
	b=Q7CQPJWdJAL/dEOkiVe3Mj8OjVUHXBO1rlXWf1uM4++gDOVHTCJ92vYi1NnEpvznzQ0R
	 YDJuWi9wbvj3UNUGBcK3Nspbg+FEpi/sgp36YkSu270pwEYK/jUdBna5nbXesrKTr3SRo
	 0nzV0FuSFIJFrrMSUa8l6ZDuaGu//sSsowTyVuFrwu34FzEm3jGLwZCzuwx9veyfOhr+s
	 vtjqQWbfshhHcbJzzveM4DJ/auuGoxXKT5nKji69OpFcCl4WvnTBcQHN+smxUxwsAfw6t
	 5kP9rLMhUMRXJ/JFFf5Am4hoQ5V0ueZvyw0s6+4oiPWNwX9mxescgLclEP3rq+qQsRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=N2s1DyPW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QOFBd9EP;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01436606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 11:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01436606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=N2s1DyPW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QOFBd9EP
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2308A14002E9
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 06:25:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 26 Nov 2026 06:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795692338;
	 x=1795778738; bh=XSe4nQaPVvSh1m8GNLDefCvo1h12oVijF6wU0EAGZno=; b=
	N2s1DyPWBMY18/yvfq48isK0oiWyzkLbqZy5A95dKFxPN1Fnc4sYHYd4hdWHP9ha
	krR8gAOJBhCRTZmeIKsyK0ooO9CnGqw+jDY3Csew8eB2NBCKaN6QNeUgFAtK0Vuu
	xx96k8T2NziybLKVjukQtfYg/9H/WkZtT5zkMa4ityNQkui2iJ7LJ2/SMmWSwrPO
	IKiDZO89zorIZL0lkjrHmLIyPDzl3V32GN4LcATlgr8hXcPCYSBbEarw3YxgWRR5
	ckx77aPGHq1R8w0n9qhl1RoQJIz19xfccL5Hqfn6shaWU0Sn8uqUQvZaIO9qKZuM
	JEeSYNvU23yZCyuXMN82cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795692338; x=
	1795778738; bh=XSe4nQaPVvSh1m8GNLDefCvo1h12oVijF6wU0EAGZno=; b=Q
	OFBd9EPLc500XrJCry21QoXPfukHHnrcAbE/ndb3QvzfuOZk+NmwSplTChAQ3Dhy
	obTeXf0U++EY/Fv/TCfYLwaNlR6mjQQd5PwHquDmg2Ii3Xk/g7C01buyhtbq480T
	/YQxz5Yc7wJ48b7SP9zOrQa+k1ssY2WrnYah+8STt1LChdreCKL6u5Zy8V6gAroP
	GpHA3kc4SffhmjVsJlVF2aNCkonISMnyRlZm5Hfqc6Dpe1PVsWcppHhImn6qyWyw
	UHD/2/zxjf2h+syzhVuVCy61dFk2cGb1Rl1fEc24bzQapC8rL6Xf9UJ2p1d0JJEW
	gt3766wklNlru6JZNAe+w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795692338; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:BARXbe+avwkmjJcRD522kEI5gQidglw5jpNllveeRQjF7KB
	59Z6kGo8DdWrDNObQ3H4HcpiQ1iSQByBsVXWKikn9fChmaAOUJqIocE5I7WlDNA5
	MYQrqLy9VZWMCTrLR5vLl0OownNZ0Y4nofPEDqhS5/VUMee1Va32HgdxlgWkGFSb
	49qbJ9r505YwxbJ+vuFgb3bXAxRgW7Q1YJ4IKFEvoQ4o8m7Qtedf2hI69QHQ6O4u
	9BX5dRhNU98UJ1AH+Ua5YoUfbO+wt7vQajKjHzuP6vHaANHI9XDyMMDZZzyUVfUk
	3+dHz1/YKDqa+R1rWTi2uycGmd70tIL4TGcPGWw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qTOl7lUwf+GmKoN4POrAbArC+HO0ppiARC4hTlU01yA=:hJmUFYcGWIAetiTKwGm19NINzKro7Mj7gZ8iw44+Plo=;
X-ME-Sender: <xms:MRcIa_PGkshct23ehyWMKsYrWlqI6rlAa1ngEURj4Gx9M7GNGpsAng>
    <xme:MRcIa7S4EgXN-hoowI_jirsz29TUhIck0F6tBtmkbRuYGBa7Ptd7u96WKAs6ZUIYh
    5Nc89atcMPdt5CXQiBMYoxuuy9G2TOda_wmaJzPFLLRzYy1KMtd5Obc>
X-ME-Received: <xmr:MRcIay5hCfRWSdFgp6uOGvp09-q7BKDxJYov_26xSEGJ6NEWmJ7037FLApqMKXhwpQgudRWeM0_LrQRMtJba7W_O>
X-ME-Proxy-Cause: dmFkZTETYMbP3iRRj/UkGAVUrE3lUNmjjfwo1zwuLtykPFAvEb2wZ/KoIVFTBBXNx++Oet
    +vPO64tPuxDsaT0qHqauCd0ag2pvvaR4BQR5+QC4babDlJ1/3AtGwyob8Wq8DK7q5hW2SA
    HHCarjPpXt/Jms8KA87KrsVdEFcZIVj9wd3MdbcJFxJ2oCLzqZwivLeaFIOrbDWV0NOwBf
    7Xmfl0DUN2/mSJtuiBQUEmj71bDk8v6uPZiDoDee9y69SxgE/UulmTWssu/QLlGdT12XFa
    heJElzdgoWOF4R+B8D8su7ZnFTsPdvN31Zs/OrVz8ysmUvJPEFLPTIP7FdWwVIsFEz/7mi
    I1gDRgea0CqG9d5FGoq2st1XlOxa+NurOx/Qh24mINJZG5mEW/YXJPiNym74mtZt8zR5fi
    QRp3FeWzmcP3GejFBQ5OemMWX1wE+OkaAZyvr7P7nXORkyuqUt7C48oVOj+Eoteb5Iqa7x
    CgkYlzXBat9X1yOfnH2uvuA+TTwlXyy6KD/Tuej4Hx4hotDqEldWyh0bgyoIrgw7e46dhj
    vA6mq+SF6BjwtR3agNBaHhIDGUOOvwfIbbv8FeyLO2osn2GQAtN8I37+skYOQOCdqZoOM2
    Hj7ynU6KkdmhFr/y0BKiVg8jKXzLy+WvfrXJQqI1/AfvTyk5hMuwiRE8qWzg
X-ME-Proxy: <xmx:MRcIa2ZccXrRAKik8-peIVrFbgaDCv3erme_-NZopkqUj5rzGgvMLg>
    <xmx:MRcIa-aYdeOgdd7vvfz38feyDL12FSY51gh3Qqo_li9igBbUw08EmA>
    <xmx:MRcIax2F5QOnGzgYHFRo6wvU4YUmM0bHqGAWOZD6OuBHM2MhWqO7HQ>
    <xmx:MRcIa-b-y497F3MLTcVvNjoL5ai3bPec9h-LMh088JBpHXQDkG4T3w>
    <xmx:MhcIa9YUczOUjKidaLNO3RYvizxcJCeyNiNFgcDq6MCddaYQl68QpRMo>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 06:25:33 -0500 (EST)
Date: Thu, 26 Nov 2026 20:25:30 +0900 (JST)
Message-Id: <20261126.202530.1337423276496737821.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: time: implement `Debug` for `Delta`
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261126-time-delta-display-v3-1-aeeecc72f3a8@kernel.org>
References: <20261126-time-delta-display-v3-1-aeeecc72f3a8@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 11:51:14 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
> +        let value = U::repr_to_i64(self.value);
> +
> +        if value < 0 {
> +            f.write_str("-")?;
> +        }
> +
> +        // `unsigned_abs` is used because the magnitude of `i64::MIN` is not
> +        // representable as an `i64`.
> +        let mut magnitude = value.unsigned_abs();
> +
> +        // Split the magnitude into groups of three digits, least significant
> +        // group first. A `u64` holds at most 20 digits, so 7 groups suffice.
> +        //
> +        // Dividing by the constant keeps the compiler from emitting a check for
> +        // a division by zero with a potential panic.
> +        let mut groups = [0u64; 7];
> +        let mut used = 0;
> +
> +        for group in groups.iter_mut() {
> +            *group = magnitude % 1000;
> +            magnitude /= 1000;

Code that uses this Debug impl fails to build on 32-bit ARM, for
example the doctests:

ld.lld-20: error: undefined symbol: __aeabi_uldivmod
>>> referenced by doctests_kernel_generated.ea22ff07120af58c-cgu.0
>>>               rust/doctests_kernel_generated.o:(<kernel::fmt::Adapter<&kernel::time::Delta<kernel::time::Jiffy>> as core::fmt::Debug>::fmt) in archive vmlinux.a

div64_u64() in my series [1] should work here:

    let quotient = div64_u64(magnitude, 1000);
    *group = magnitude - quotient * 1000;
    magnitude = quotient;

If you prefer, we could also add div_u64_rem() to the math module.

[1] https://lore.kernel.org/rust-for-linux/20261118224826.2491684-1-tomo@flapping.org/
