Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795528497;
	b=Cgkb59ELWMeWj6Opg2FHoVKEYx1mWsji7QN3p1K+0hIH5GU2zRAqQZWosLIRKEko3NCP
	 SlmMbInP6VRL+WebYIidRuwhOvSqNLjG+8/h0CTg+LSsfDToZ8gQVpQeTOOnYiFbX4HXR
	 J+BXXVFSLhqRm/zdUvhIrDQHC2jwg57PWBld2LhGOHDKzYcDWOszMTa2TjXsl1ioyOf+p
	 nR270up17RPPz6+tW0UQo1t8XB51TIap/PiniaSxOZ6OehiNLczNzA89WLqUIlDH9bo3c
	 633kV2/QXKwLX6P7pnhY6Mwp9T3bYyFs4xrpubPVfedrTw6y/1aImEUbrFj4tIe/O4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hskKhJvrkK2XwN7uok2JUgMgn3MP3IgOcFWu+hlmAzk=;
	b=RnjprzGkB5Nomc+0WA3rGHE8Z0CJk518W5vpeKhJTBmwSvR8S3ZWE4Xj+50VXMy3NQAl
	 Fbj3F9R1/z/7m/UTp0BFar+Mt+QnY+x+jDdktexqbjxLZ3W6w/7MU7f4JabLcUc2cO7Kg
	 hZhLEuwZ9rc1RqU/hFZ4rJg3A64uVZYEFQfDSPfGLn7ip9I6gq7kDAC0wjyn3O7a7TWXi
	 UhubTMjFbYwkSUVG+aLN3XXpACKC7xDaYbdxcRaTA7lYDKlaL0FAzI6+VMM/fK/ORS3gN
	 lLVkReW5KmOc0pI8D7VhgFUtDzFs8X5mxmDQSh+0979KK/5CC84RyZHZj1jMhKtwhbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4Po6J1z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F27606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 13:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F27606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4Po6J1z
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-92107df3f13so44779486d6.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 05:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795528495; cv=none;
        d=google.com; s=arc-20260327;
        b=LVTjh9iq97xNk7LvcKi2n1MZes9F8aKj1RoNLVsbTehTOG5OzOjCWIPDDGYm0DJUUf
         tAUSJE1pfhKkMKIQt7y6i5r69N90s94LyDAs2X07y7qH64WRhcl+La+q7m9rn2L8mBfQ
         wmZRkAEK5yw4WkzcC+0vbdke6KU2Bwgw6rxiYbDN1fWBv5+b6yMdiyBxxK+YZuuMdQK2
         4Zhy5H/wMdWALsRI+tM4/bpwK+fbnsadKezIovBp1pWjnXucIgOilUjfYO+HUY8n3+OX
         qpsqjoS/EH5WlLCG4jY08BrgfLVFhHuVYVPXTv0tQcGfsq2D4omYq0lh5P/JNAbnhxgQ
         LgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hskKhJvrkK2XwN7uok2JUgMgn3MP3IgOcFWu+hlmAzk=;
        fh=bAmZ9VSfVsTJWrpmh7vZh7S1oShDwg1JndmcqN5684o=;
        b=tDsY489CIjGHSrTNb3CX+gsYirkZ9qc6ufGQ2f2scTXialO3+lhunLoy32PLDzSfEx
         O0U8m/3nObTfetfdTMJToQADqWgCfghlb7Tzg462gmD7RDoCGsOqC7eac3/D0t2OEWFd
         GzR8dmoUPziiOGImXevd4YO8EN9xJF+t4iPWQ0Z6e5hrARCzq/Fhz0crbBUtMcCFa3Zu
         NR6tTCDj3+3VvKNYakMawI2LcKY99JMCvwZ7lZm487MmkaFXLobxAqgBHkI3YdimlSCx
         I2Pcz8B0NkAwQ66/1sx57uYZj+V+nWt+s+46gk126eo2zP0+1U1Zs5WOOCqzMvDcxB76
         a31A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528495; x=1796133295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hskKhJvrkK2XwN7uok2JUgMgn3MP3IgOcFWu+hlmAzk=;
        b=r4Po6J1zBe4UbKTm8aiUNZACTZSz5p9Y91b79Fr0ju98PWf7wRw9LT8ZeHES+JprB+
         acPR72ue0hx5MHK4prfu234/CGSJXIAbR8Pb+/X/KoajDVCAPLRq4CeQmlrQOrwC3alm
         uRw1gMOvJkaPXX7uPavQu8jYnXDr/ZIQlIxVfSMGbn97i10bFrG/0mHYx5k1I4gDeWwZ
         pL/wFmzm8J9Gr/nerzxMvbIkPtKschc9woxUBQPLq84S0UGF6HHc0YaORWin+Y9oorC1
         evZ5wKt9dOdWXHgNZhLHa0bFSj456PMNPG9mhgTEJqqSaXnNyiGktpYUIflRiajyLEKp
         BVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528495; x=1796133295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hskKhJvrkK2XwN7uok2JUgMgn3MP3IgOcFWu+hlmAzk=;
        b=oOe+0+luetOPwalB5zjU0hOLbmG2eUWZqHcqYjrUSNA80y5vNyo61QwYMFg5eQiTf9
         A8yJEHfQJmNkusZnDCusEu4rXTsLoOVX1gG1UlT+QbOVLFBg+rEpJx3MLdmmiKwIcWSH
         BnWr0RYjDdyujguHVKwWv4zYav/CgYh6nsCU1vRojfN8Td6o17rvUaYCWBq7MXNv2cXS
         48L3kDEV+y1L7RU/+bOOXDv8y0aoW9PQnmkrkVXJmz3ZbIhO6HMNLED1p6pHMeFB+8VC
         C6gK2C3TIzKJhr6czdd54z4cUIHE3cQaPOnLHOslR4POKPc9J9q5/PxOTBTEC+TZUNEY
         orAA==
X-Forwarded-Encrypted: i=1; AL+hErGHJwHdX9NJFZdLj/7FR63acgKwp2ODmMNV0kx8UuxaFG5zIBRr49RKERpPFkEGTJqZCdPjdQLgd/vmRpHNIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V2yQf+dvvpkKvf2hTZD2iheoa0b5tYAuBDuWZzebUp7dH6cnn
	vATWxmnul0baXCdAI1mhqUGz/bWH7XYYkhSpV8Tl4qmOCCEuZApqhw0aFf4Lr1Z5g0Zx/Obj3OX
	POquOF4DP96IQr/RLPazX0DCvlyJVm3g=
X-Gm-Gg: AZFdTZfBmYaB5Jdplr0fcO66aF9tlRgk3WLnAnpqrWF7p57gTYEmfK6J/ITSJAPLP2o
	KBHW+AAdEuX7dfxm3fIHko8StSl9PNoqKRyd7gIrPgpMV9eRgLd+Lscg9KN62g9dWqb8XI+44de
	tpNzjNrprXaOX/pIiRxPddkc77OuQmEXKPPY2qxcoEYf37bjbwpJHLsfzesSESCNiaP8d2RvxoC
	lD0cFBDMV5J+ymCkB4seOX+IU4edxnwcBmvR1woXAdqBG1FsueXlzIysGyrbIqojTKFJ58aCKrW
	H3bGKPHXV/O8GzLTcbpnA3waC9TfGgNxUp8NzXbQSg5toPvKHddYX2bE6ZNjheX6/syCydJHYFa
	9Yaa/iCG4TiivV9Y2VR6UZXjS5Ly5AYIiJHNm
X-Received: by 2002:a05:6214:6012:b0:921:2569:3a61 with SMTP id
 6a1803df08f44-92134ab82b1mr217590136d6.10.1795528495554; Tue, 24 Nov 2026
 05:54:55 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124132707.101769-1-mbkchelofficialdev@gmail.com> <20261124.225103.2152350984946270550.tomo@flapping.org>
In-Reply-To: <20261124.225103.2152350984946270550.tomo@flapping.org>
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Date: Tue, 24 Nov 2026 15:54:44 +0200
X-Gm-Features: Aa3M54r5lRaC6s6ZVOyblge65-Tre7sMwzRlPmQ59ty0THQcri0vIs804l2d-88
Message-ID: <CA+YDrKAv1_Ot0pmPuzpFuZR97pSbBVQW88RBs=DVNQ4W0OWwhg@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: add warn_once! macro
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, liam@infradead.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fujita,
Thank you very much for the quick review and explanation!
Please go ahead and post your warn_on_once!() patch since it properly
handles all architectures including UML. I'll drop this patch and look
into updating Vma::zap_vma_range() using debug_assert!() +
pr_warn_once!() as Miguel suggested.
Best regards,
Ivan

=D0=B2=D1=82, 24 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 15:5=
1, FUJITA Tomonori <tomo@flapping.org>:
>
> On Tue, 24 Nov 2026 15:27:07 +0200
> Ivan Tverdokhleb <mbkchelofficialdev@gmail.com> wrote:
>
> > Add a Rust counterpart of the C WARN_ONCE() macro. It behaves like
> > warn_on!(), but additionally sets BUGFLAG_ONCE, so the warning is
> > reported only the first time a given call site triggers.
>
> C WARN_ONCE() takes a format string. This macro is the Rust version
> of WARN_ON_ONCE().
>
> > The macro returns the evaluated condition, like warn_on!(), so it can b=
e
> > used directly in an `if`.
> >
> > Use it in Vma::zap_vma_range() to report an invalid range, which
> > resolves the pending TODO there.
> >
> > On configurations where warn_flags!() ignores the flags (UML, ARM and
> > LoongArch), the macro behaves like warn_on!() and warns every time.
>
> C WARN_ON_ONCE() warns only once on these architectures too. I have a
> local warn_on_once!() patch that does the same on all architectures.
> I can post it if needed.
>
> Also, this patch does not build on UML, and test_warn_once fails on
> x86_64.
>
> > --- a/rust/kernel/mm/virt.rs
> > +++ b/rust/kernel/mm/virt.rs
> > @@ -115,8 +115,7 @@ pub fn end(&self) -> usize {
> >      #[inline]
> >      pub fn zap_vma_range(&self, address: usize, size: usize) {
> >          let (end, did_overflow) =3D address.overflowing_add(size);
> > -        if did_overflow || address < self.start() || self.end() < end =
{
> > -            // TODO: call WARN_ONCE once Rust version of it is added
> > +        if crate::warn_once!(did_overflow || address < self.start() ||=
 self.end() < end) {
>
> Miguel said that "Erroneous Behavior" cases like this should use
> debug_assert!() plus pr_warn_once!() [1]. Also, the C side uses
> VM_WARN_ON_ONCE() in __zap_vma_range(), which warns only with
> CONFIG_DEBUG_VM.
>
> [1] https://lore.kernel.org/rust-for-linux/CANiq72=3DtKVD13GD2Bzmt_LnC4Si=
OX1nkHQPcz2BS=3DP=3Db23e0Yw@mail.gmail.com/
