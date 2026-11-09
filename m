Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263743;
	b=ehhXDGomre19LXrUqpC4HSpOF3PPrbZZ/VWAXwWLWgo61MacNpb61k6UGvZwsByUIjrQ
	 5j64Ps0NNgLa+wXc6daWimKM5o3XhmshSqirsuwuEv6bqYg/Ln5mB+qUDMaRdd8YpcZ+z
	 QPdv5yYksltjQtO8WvEPK1dzsLs5IpnlcdfzEYilkGeKbYezOX0GpJRX2gm6aGR3aiObz
	 vmbdl9JIvHfoVtgHyr+jVJfsAfZ4TgeU3CXskC4SonEaHVvUZQPXf/pLIBDh7vpxHUQEL
	 Cf1hsEXj+pDZYukzYwC5zh9Dcirm97QoZUSZ1JlQi/uDnzUcYwbiJoqpNTbXGxkrrxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
	b=i9OpdwZjPNQjxpVfYrUuZ/LhGKxSsVne+TnpRwz5dg3wRUntAG4yuUZWvxoCNqcmN96B
	 gIpYpwJXJetiaTq1lySWoGkGYk00OFQyKWt9hgcmv2lD3onfM7kJO12etSTG5ncxLjZLP
	 BlDOiEFLspA0xJsGZP3WmCmPQPO1f0+6L/z/fi2FWy6SIA1iiiHWIpyQub4vMHBcPNM7l
	 RDrVKRevmfHsYafka7VdHZgYWa5ADZLlF6DB1lO990Mc4G8t0iTorgteR2cYjRXXjOoWY
	 dgi6esUv6joQunr+mtKEF6d65yvcfM6th3NMKjrCoQosE3QCkYtiFUZbZSNUUGfK4Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Z7315H/0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24898606A321
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 22:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24898606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7315H/0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so9547135e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 14:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263741; cv=none;
        d=google.com; s=arc-20260327;
        b=BEVi1cD+MuVPie+C9flCq4VtleXbYdWeTtJH2t5gZmrI8oUAhsCRzCdhfK90ndP2dE
         NDI2uA5U1qiKbuWDJotcXlVFx+TUZmA1z1+3cdOe2w83LeptYLbbig50qGtYqKCZ4eYc
         JXbcThiRUpFB4kK8Nl4M6Puus7lWxnN59ddS0gsiMPebkGyJbN5N1u+MSrTsqaSm5psj
         yvwMHmAd/FM3Npi3gil4Vhd+x3rhk9occB2pFwY3PP3pC/tgDbDvelnRY91OkgCKF7OH
         U5grh49WvjB/kg92G5TrFwck4XYEvhFGyUObEzWb8tQl/oxncg7SGCWxBhfZ+5yceryB
         RiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
        fh=DHmvIDvwTqxNhv/YbkqE34gdzKxbB/GyQ/Hf+/TlPY0=;
        b=lSJHUurbQxFNuAhM6OUBtmpEBxFkGdOEtj2I1/5JEFJWGGG0RjgaUncUo0HFcicei7
         U1zLcYOp41Hb6ZwZAnl3h0OK+o86SS/RRgS68Zz3O19SpVcEJjOkjs/Bi7tEyhUo1Uj/
         b5tFySuTAHR4BSkUFa7mOEKZNaiEsjNuec4gGgtxrng7OD/Xci0uKeNPtUhUTYb4KYlA
         PNZI97704F5EN0QHdlMBnxLRJCgDoZy6F0RiUnZB8gzlAfGvqSfIq5Va/WGRgsyDsgDH
         JzA5IyQKrgCIUpB9teyF4brvgLAkkUJO/VIj6GgEi7dcTmkNivHRLDE+brK3nNX4js6t
         QNgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263741; x=1794868541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
        b=Z7315H/0Km2zQ3FDV2EWUJecKwbasT7mET/f/fQWy52qEG6qLZEU4wXcIoefS7eXiK
         HD37CyfID9UFs/yfH/wPemBpx8nSR8Kvl3Jv+p+8M0sKB5ilsJiPyn85T7Dzh6InFzEn
         JvL9TaS8vmRS3+Li8h8GjaFgnbIfsjRux1FyDrGqvCGTYsEHRhDe48zoZ+fy3nzdgeK/
         nmmw0XWftfSBjn8HHqRhsuXAVR4OSoNAvsGLs2byQJcIOeGYE1ZuNSSzQIWFHpbCJVfi
         Q5GHkaHfL0vaTWa986Oo9p97SB7e6HBjCuP7ud7DUO2Dlazoh2yYhxtSJdYr2s6nQyNd
         lIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263741; x=1794868541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
        b=OgqUCwOQvIyuFW4Kog7q3Bqnq0h4s87CcR7wBx2Z5+MWFz8yiGwrbEb/2t8oRkMjih
         t6HIjFUjwNVYlBfTpASzs+dTp+rNmCurmz2Za4OCDkI0eVJ1xKvzN79FbFkzZFVEg+E7
         f+zeciro6+BmIvgNZW9VrYGZ9T8/HmtY1smBfzfmYbGGa57uRg+2BdFO896RqRn7HMxE
         VxO3krzpVupzZVuRl6GjpweV7G36aZ0vv6H+muSpKKfmkIVOwr+9a6rTpVGY4y92eAX3
         TdbiOkJDDYqJu1PZTNhobj6kAh4/zwXOD8e/tNmOCs4hBoqgGDZ7sdMCTpYMw2ZfBGg7
         YN1Q==
X-Forwarded-Encrypted: i=1; AL+hErGWS0LOgm78A8B3R4vSBXZ6CgwR02BGO3TNEYctoyi+Bf7l8ePGJK+YzhTuoOqZ2NxFGcOu+xee86duH9Y3Xg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8aAzxD2WePZSiMr1iYU/HGtXKJws9eLl+DquLINvWCdXqIWEmV
	YmP9H6OnmLTPH03paO4AABBfklpYxFuTVnY++I1NWWSL5z6mnq5t0s67+GdJgjt4XmHw4fHRu/s
	B6PtVv6CcP8+47J4e7MckQRmhM+IMc8lZw6QyDW1J
X-Gm-Gg: AYBFou2BEJez58l7W+eh1/JBARJhFvY+Ev5qURSkae5EEthQLj0dkrGvJsEVxN0gF8W
	plE0Dt3Vq3kyxiSITj5L2XAj6EfcbQ+cGXo9PlC6NCjhZf6EsgyH7ss9bwZ33gdO5XPwpmXQtf0
	a+WsojtnvbeoZKkWVJgWznKD+c+g2Zqw0JteTN/xrLls8VvNzcRxaetb8BDIkqBwdzrEQ8XCV/v
	Z9m7XDEdpWwlyYtRj8G6zV/5kDlWSLnjaum+lXBVCg+WgWSWAQ32/l+HEb4NvmG8XR5SZSR2GmV
	ZHksuk8EbvafX0zLnwtRUYapg4P2R8iID/k1EUPjDs3MyScArxKJ6Yg4qUQSwmlZQoY6/a5TNX2
	/jFAb4k1Ubtyuvi8yLkg0UsHORZp2SAPNo5QIFyA6GNYdhKd7aYKxcseJam1d7mgUBKY3Tzps7d
	lZDEIVNQYforb15Aw=
X-Received: by 2002:a05:600c:190e:b0:4a1:d97e:cd60 with SMTP id
 5b1f17b1804b1-4ba0234178dmr9170815e9.16.1794263741215; Mon, 09 Nov 2026
 14:35:41 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
 <18e61a8cb2ff887c.3137322e32332e3235332e313736.9d011.0000sendgmr@google.com>
In-Reply-To: <18e61a8cb2ff887c.3137322e32332e3235332e313736.9d011.0000sendgmr@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Nov 2026 23:35:28 +0100
X-Gm-Features: AclHuK_aJUtfmZ40TE6V9dcFQ2Gw7esH26asDQKpi0oS6cQ6henkfr4bldL6-J0
Message-ID: <CAH5fLghTUOHcTAUC9_wqtP0xB18AWsca76xgptN9=wBx6mXUTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust_binder: account for deferred work size in Thread::read()
To: Chris Wiseman <chriswiseman@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:11=E2=80=AFPM Chris Wiseman <chriswiseman@google.c=
om> wrote:
> +                    deferred_size =3D deferred_size.saturating_sub(work.=
size());

If deferred_size is zero, then this evaluates to zero. It'd be ideal
to avoid calling size() here since it's a dynamic call.

Alice
