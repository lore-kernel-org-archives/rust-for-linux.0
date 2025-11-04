Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546F93164B0
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245641; cv=none; b=acfCwsHfQ5gzBXVnJ4jk37FNYi9MizOgY0DejfcJ8ACDiz2pxGmAg6wKfObsf0jeJAIZNGlygizjdY6++U1ik1m3dYchX6KDkO2vBOFH1tuhC7Bpgwk4VF00lZQYOVGKovHygOJ/4JyA/OPeE+nk0bA3GoNWSbga9TaYFfs9vdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245641; c=relaxed/simple;
	bh=nAPc+TnO1th3O1GSH7GZu4hL5DC4Eiun1Dex1Kln7u4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ScxIcroHX3x5Hg2dMZSoUOsWXRIJ4QsLhPoVNwjmHtcPEyZcLsgrCAbw1xEVlvBgr7zr4KwhMMhsqeGjE0WZuGPOBqeDu9NWp0vGmE7l1VpgHZcHN6EM3uLdDJPMGtwGTvHu3vvWSEr/iWTWlA7BvZPYs/S61oKFDte4SOLJcPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f2JDe+wC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f2JDe+wC"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47111dc7c5dso27381095e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 00:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762245638; x=1762850438; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mtZrvT74xjLbmtOOFn7GqR44dgC2/dnDitaPuKQQAMI=;
        b=f2JDe+wCkeUza/Ffxe926OnTZfR4l3aN2nofzypBmPvwLSHzKMIx6z+a//pKPq31aW
         /L3/0lC60IlRRoY8qaPZv8md//gefnPP95rQS2i5N+H9lfauXMna55XZfLGPM5dyHYJq
         1zHb6iJEmNG+Ys5fhZ/rd+nzHD7n6PH+xfrOXBrzKVR0Gu7Aotjyh0Z8+FSfRzHzqacC
         iXtc4WPxjcRgD14o/6NioIY0Cv3X9yIin4bR1G9huPY79UUQhdAbqdvBNJdUvGjt2Qqq
         f1WpSIInAURSSkRuldmEB8/pcqE+FBHA3cFYsH0za2eS+5jBdmwhq5jx1KFLQ600CZWt
         JVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245638; x=1762850438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtZrvT74xjLbmtOOFn7GqR44dgC2/dnDitaPuKQQAMI=;
        b=DPjO+e3U015FeZmzmBKWKZ68CQYWfRRzY9n3nc+yJwqY2v5Et85Qbh/G7Z5s2CAH91
         nidghu6eiHHu3NzuT+Dqm3kj/8lAZUEkdGZmaTtDlrrAsY47ZqI47junFhTKY1UbI5Fg
         HLe6OYpGHjAdN3Mqhw2DGWN0A2a1UMlrKtMf6MNJ/nqbOLyiEpU5k2Zpb+1eKSwI3lXx
         Y69NDbEA4kD8JyX3QZj8UuzNEU90F2ioEGktUt1V7QOBlfRZjAPMPjWiVYQ07oahhnWP
         gEN8MKnNTFgxy5PRx0E65BW+NYmmVM0QabO0rq5EmKKi7cuHAhyD0dAVjsZAn1MvtXNt
         Covg==
X-Forwarded-Encrypted: i=1; AJvYcCWhmgekOhg23qr8nOty/juBHubR2tNM3r9v5BrDvcDq6iSCNMzSb/n/8tS4JmGxqVHfqz4+wbWJ7HOebeg5vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2geSaPa1XitfzQintv/OHi6qlv5HuIie0eEkIOmUqg0Lzv+NL
	PiDttbJ72ez2V41J/sQ1pEx7zQmtKu0AizDvYBCSPkp+T8y9G3PksjHc1oal5NI7PnE1TUB+LYZ
	ncf/xZhhXk3YOuloDrw==
X-Google-Smtp-Source: AGHT+IH7uxFg4fxwEB2oL2v1iRpwri8RqfVOUZGlKBwCB/nKMjy3SRSG5luxCaKkKVK2+FpZjZyZipAwKCX3T/o=
X-Received: from wmwo13.prod.google.com ([2002:a05:600d:438d:b0:477:ad4:a2c6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:282:b0:471:793:e795 with SMTP id 5b1f17b1804b1-47754b897e3mr13537495e9.0.1762245637657;
 Tue, 04 Nov 2025 00:40:37 -0800 (PST)
Date: Tue, 4 Nov 2025 08:40:36 +0000
In-Reply-To: <20251103203053.2348783-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103203053.2348783-1-dakr@kernel.org> <20251103203053.2348783-2-dakr@kernel.org>
Message-ID: <aQm8BGphYfoqKZvk@google.com>
Subject: Re: [PATCH 2/2] rust: platform: get rid of redundant Result in IRQ methods
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, kwilczynski@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 03, 2025 at 09:30:13PM +0100, Danilo Krummrich wrote:
> Currently request_irq_by_index() returns
> 
>         Result<impl PinInit<irq::Registration<T>, Error> + 'a>
> 
> which may carry an error in the Result or the initializer; the same is
> true for the other IRQ methods.
> 
> Use pin_init::pin_init_scope() to get rid of this redundancy.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
