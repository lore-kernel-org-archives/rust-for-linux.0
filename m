Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795283428;
	b=2UsOS+8F5HOVfDt0w3AK+ztsdXA7K+JB8K7kYWtTgWnkRIaN0Ari45UL/uELu21TP79m
	 Ih4LEk29DMdHDYwtCFX6adeA/FQ8rJjQOCu6s7o9T16yUdshXCgrl4yr4W4zew8BG0zLD
	 KxwC6cgl6oZvYu64JRwhvQHzRmd0cvBc4Rbdao95ea9vOQiZqKbK9nrYuWE67LFj08F2B
	 2vs7EQZA5x29oj7fMb2GxTH5hPT3jlDYK3GN+wjjL25Q7OZfyzF56DvaiFv2iIMN6WUEm
	 9/0cjzaKXIELfITJVBf+G1XmGh1LhbYb3Resj2QXmgUMm2BaR57x9ok0sXetIL2PNLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:X-Google-Nh-Sender:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
	b=nU3q+W5VvaCffff948rfHeeHj4vh49ZoTbY/XOIMYjOII/fuTDuC7MoXi6xmkiy6Ye4g
	 /fPno13oVC3aEzIFMKV/1GazcRCLkf1+/vxKkou0QYBBy/HD1kqGZ5j4PJLOU4UMF0+f9
	 T7qfrdneo5cSyqz1IE1VA3d+Pi/k2Djb2iMlHOhj55/WRxuS+sSKHkgstcNeUA8wDPdmv
	 jCLbjpmah1B72XktG7melS0k8wbiMv3Gkrasz2K2kX1u/9DrI9zHJKK3jeptLOkBX2IZz
	 +v0rTpvbTikC23jP3/oZ4v4T+I4lKUvcTTKD8pfxthUZ695t1AUiXvxpZzHTwxu8DIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLk6aNgl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D8606A32C
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 17:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLk6aNgl
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4eab91bcaso11143027b3.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 09:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795283426; cv=none;
        d=google.com; s=arc-20260327;
        b=ARJBzvga7/2ldkVzJt1UUx9jK/adHQsLCq6vV5UoEmj7i0Zf9riAmWZhMhf90VipyB
         m5EY0SoLzZnjflGJfCBmfR+SwWbzqLgl8v0rbQ+DhF24XrZ3BoCI6JvSNagyJ0/lO+BU
         Y3JZimFWOUj774RvUoq6KDCnCFcVEuZfUNU0AHtgkpgYhZKf+IqXAcRReKV3rScQRNX0
         k8/Wj2aAazTVPLfTRFivXaNbgb/PxrXPr5Eycrd5qHWS0c0RHBGsRY+P049e/EToqGFw
         XcgtjD3aYEi1gDQH7IS5Gyj5nqgfwzMZqhWZYg8Ict4FVS66D/IbW5m0/RSU2Jt5+pbe
         87OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
        fh=sQxYWHwIDvNTnhM4n5WuqzYl6SmbHMH1ZuMxLju/W90=;
        b=MYI54GmCH18oejKIPRWe6uEE5gb96HPcINxpthyCakE/ZDsn8NZCdbbvC3c/dPMRRj
         5AufV5pXA88vktyX3PHk9VwQLuiP+QDYgzSVQULAscuJ41id2W3Q8cJFdwnC/7ZJPM6C
         3x5/Wh/8E6QcJGyPxSUQ+F0Mp7VDwTJyaGPdMsZCMUOtV4TwI4/mEsTqpRnJR39Tzkzw
         ycWjcnYAu7q7DsadHDGUbMc+i/gzm5nlUbZHJOz7Sh/G5HVMcTTEK6YHCwq3EjN2/sEh
         oI7pQWUbMmJfhsN5+DCYefH4ieY7e6u3Njvz79FByXHvuyY3wfhlT/CZtT/gh1gbGFlY
         4kZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795283426; x=1795888226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
        b=iLk6aNglaHLSfejsdDCsnc7RX/dVGHcxO+3s4wAzV4vM9SNB+fdAI0/vrzVTvqc6wc
         Svla8+8t3JiJp43AkfHtiCef+rSVtiUNXCNiNnDXv0Dx04IxY9NLHX1ExCHffschAOCp
         zy9jJomDn1DUzt7yRUM0A1XYpKDHMS4SKU7rqS7KN91edKs9iqJeydIhuhyr1Om2NmdV
         lRkMFCB0dne8OaN3X19CagYPJxfBZpEhA+ywtlMj6Y2hGUQw8E3//KydV1ur0kiFCzYP
         oBOPzz4qB5+Klf1SFq2yHbYTX/p3M1ScQrrPlf53r3/tBT4Cy0VAnnSsIel3030+r89S
         czUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283426; x=1795888226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xu4M4Rq3wV8DgH+HqoVMbKaQd8J/D8bo49jgEyUz/XE=;
        b=wzxs7nr6bgncu/AQrtG1ETsIU0C3HrMy7t1FobZxvhfpS1Q1YvkXY9+aFkgJCXkU2m
         Mp+dtBq10Ohqc0kWKW7t7TrRV8UM25Qd1xBULL1G7Z6kmg9a1i7ky7Vh4+dqmfjZNHnI
         ty3HjjheSQ4DHZLDdvnNzACwqe1QMR4QrhgfSsBDUwvxPDU4qqXH+icSVVm2P0+PjsYD
         xgWpVGf/8C0+ZnyyWWgPgu5gvZCG8yXAxci/UX7Aj5binCsuPkjB97Znq2VzBmZYTZpS
         WQt+y2XEIcV1R7qjgoT0pa6KILK06taQ7/zl4Z1P1qyryNVGBsN161V1sSKRjVXnByUN
         z4Dg==
X-Forwarded-Encrypted: i=1; AL+hErG5v2MnBw5ojhHx0zssdnPpILdjYwRNUwoX3h13Ub+/K9zXW4fw/3sSpnsexT1KaMl7nVP9Q1rHzozq0Wwf9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nL0YIr1bD3rDgHxGgnJ38zfUgWzMzbSAT6vSB2Sscki0EUWQF
	W2GDDuBoUkDsLr9y0oTl2ZIP2HN5auXctzGDadrvYbLrpi7hhZqX6eIGqJRzYBovJBmCjQ0jtM9
	yjpj6apjpNnASF4v7hHslh6omeIsXGTs=
X-Gm-Gg: AZFdTZdvTZSFhDQefD4MDJDfiNO8a3fP87qh6e6gpjzR8VDz9sn1g9cbJCz8fhT3NTh
	AuqCFc6GAp5M0CwMLGr5BRLtjItC+SWmVQqfItHPa0xLPr1IalSjwNFwQ6pHZYJMlZytG1j9WTJ
	zX/jnLQ74FW/NX3T20LQvYs0kEwCYXUrDvqjaAnIyG1KzJ1N64DUtVx//JqEvkOsJNhrM8P6tBy
	vVMPM5gNn2kG2U0ETXU7mMVQUvi9pAUq9cnBH6zJWF6nNOIdAm48AMHrzHH0QHLnUPZ0QeUIYHW
	1aVFRUe7FDBi6+3xH7lhQThhXuQhlwZX9A7e+WsMYt2PhVAmCh2++4YofFMY9JEnG01WghKoZqP
	ugDf7MKeoOgKV+YYAX6tHens4cWeSpLVTBwU4CQuC43hH+Kro1b2Ageyr5EmBwYZNR+exvcUB9D
	WzUKXEfBq4VHiJmbXZZZY2B0O2qy/KGI7E7R8nefTCqEjmpcQS5l6IJOI5bkSpIlgJiUPtj5jxs
	KU2tJfNRANmatBEYl1zssVuBzg=
X-Received: by 2002:a05:690c:b86:b0:8b3:4911:2dc1 with SMTP id
 00721157ae682-8b5204ae0e7mr30662797b3.39.1795283425537; Sat, 21 Nov 2026
 09:50:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 12:50:24 -0500
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: peder.bergan@gmail.com
In-Reply-To: <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com>
References: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com> <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com>
X-Google-Nh-Sender: AW_J_UoEym23HGvNQ5zzCr2fkBwchbIS39LY0o3smkAVD0qDlNYdj5QfaNo8KarZLsYzQWlSiaO47uwNu7Ha77BLqJukKxnb1c3zQq1IDN7OFCWayb3yR_WclseoF6OW9P26WFQRXvNRjHgOWmoGpPAk7z_ifQH_LJgp626YEFxxIOIOhhyVgfEATPSFauhLyvCp9Dpd-VJp0i-FFJ0ot5roV2PTcyNx46IlCqKQGMzHu-SbF6WUbJBJ4C6Us7wCCwDfy5Nx
Date: Sat, 21 Nov 2026 12:50:24 -0500
X-Gm-Features: Aa3M54oiSweFMBwEnXr8v5RhNblmDh0i71sIY4AU6gHF4PbmUFHsoRQyMcHMRfA
Message-ID: <nh-eaa5d67e-6d05-468f-9f19-273bc5b23ad0@google.com>
Subject: Re: [PATCH] rust: put C helper exports in a dedicated namespace
To: miguel.ojeda.sandonis@gmail.com
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, mcgrof@kernel.org, petr.pavlu@suse.com, 
	da.gomez@kernel.org, samitolvanen@google.com, atomlin@atomlin.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, wedsonaf@gmail.com, gprocida@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

Thanks for the review. The export formats are literals, so I'll use
:=3D for both. V2 already added the namespace import to KASAN's C
metadata.
https://patch.msgid.link/20261120-rust-helper-namespace-v2-1-14315658f59e@g=
mail.com

For v3, I'll build on Giuliano's assembly conversion and generate
EXPORT_SYMBOL_NS_GPL() directly for the helper list.

1. Would you prefer I wait for Giuliano's series to land or send v3
   with it listed as a prerequisite?
2. Should I keep the KASAN import for v3 or move automatic imports
   into modpost in this series?
3. If you prefer modpost, should it add the import only when a module
   contains a Rust object and references a RUST_HELPERS export?

Cheers,
Peder


On Fri, 20 Nov 2026 22:34:24 +0100, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Nov 20, 2026 at 5:32=E2=80=AFPM Peder Bergan via B4 Relay
> <devnull+peder.bergan.gmail.com@kernel.org> wrote:
> >
> > Suggested-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/216
>
> Nice, thanks for going through these old issues! :)
>
> > +rust_export_macro =3D EXPORT_SYMBOL_RUST_GPL
>
> Do we need a recursively expanded variable?
>
> > +++ b/rust/exports.c
>
> Conflicts ahead; this file happens to be going away with:
>
>   https://lore.kernel.org/rust-for-linux/20261112121512.1670347-3-gprocid=
a@google.com/
>
> Cc'ing Giuliano.
>
> Also, what Sashiko says seems reasonable: if we do it this way, then
> we may need manual `MODULE_IMPORT_NS()`s in some places, which may
> become a bit annoying, even if there aren't that many mixed language
> modules so far.
>
> Actually, perhaps we could just import it in modpost if a Rust module
> has any Rust translation unit in it...
>
> Cheers,
> Miguel
