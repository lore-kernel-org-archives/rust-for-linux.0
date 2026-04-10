Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7032B99E
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 05:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799792; cv=pass; b=S8SUhZphO7/4RF8cfNpaDaUnhhPPYdUE1/MKhpWNComEybHuttYhhTv2Hti8hLK9ESF1kq6Bh/HfP67wQ3Ikn187R2EeJmXpUOxlDvZtMUqVyhhfUCiaPijNC6nXU1uHXhab1s3hnUoP4lne+F9eAbkqraIb0xtkFu5QEMm6w/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799792; c=relaxed/simple;
	bh=rklJJS3t0AHyQ4VzOjeh+EUsSSkGxZFW3T222h2Zcd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0zZj/UI8ZzuMeDQHwMJDuFSREReq9nFxTOg1zfHgi7ViCYdS8PPuG/BmxvKox7AFolw4Xpq4xnjPB/jN4ZHdBKqjrWCsu4MJcTBMeZvqubsDfi2YRcbUwH0WvpLqtckV0pVWt560o7DrqzfflstSc/Q1hXbYeQNoWeGWr0gmqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LpnP5sWD; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LpnP5sWD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so1429629f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Apr 2026 22:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775799790; cv=none;
        d=google.com; s=arc-20240605;
        b=XfgC8vDIpOvNYVAhZweS+istq7Auzbkr/CzASDyEdd2yJOjl1ja2uPEfm7tXXNvRu7
         vNhTNa4ySCjpHFHNtYPvqsLT+3s9Tegd5s2Zgj3WJ3KiTsgYZtKwtBNvuquJdlMBSLSC
         +IxE5hJFOpnfpCeihJrnz8N7RgSrnMvFk7Z0sYkxjVuY1XaWemLxs3Q+oXQ7ElfnbhkA
         QQYuPlj9AhmvR0mVrvaHFgE3a4UlwkDjSJ0H6X2FywXF3VbPCjH6175Mh1udJ8S/bjar
         k9Ix1MJmkFchpE5TGFmkhbzmYDU+hdDBsaRY5PY+9/FZgBbj04rWdlEg1Yhx1As+/aq5
         rt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U1pt5x+EZNVQ/9L2esCcdERqDp98YgPBmh2Q0zovV4k=;
        fh=P+670AUcOGVQIC7MnpYzYRxWZm8KEESLqiX1x+Ecsk4=;
        b=llfA/ODeHN36j2Xvsflcfm5hBeWUON0zjLOWs6+jzzpUytKN6Xh5+agx7NUZe7DMDT
         NAQGZLfSRqxQDG97DQwIa3Y/yszAbsFOF+tCDrL/XENjpftgM/KP6SNr1PgtcykcaodA
         3CDWm3WWpm5RrI/9QyAyfxqItAg3LFm/yRyb1vcrsKGYD7pIw/1qKJdjBlVnJ/rwdxZA
         QY9bKbHMRTlUph+oIc1mDv+qiIB+t0A2ekKEJU3CgVyKHmzwciWQv44WWJsIyqcIja52
         9UdZzpE/Q93nWJph8xHzUGLi3dq7dgXDBcMp0+CcRRmEGZEU/h1rRCl34gwf6wyHuJXe
         tLBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775799790; x=1776404590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1pt5x+EZNVQ/9L2esCcdERqDp98YgPBmh2Q0zovV4k=;
        b=LpnP5sWDaSoNsUiasi5E9KniRmzzBItM0KsLGn1QFlpiY9/HtV73Bj4z/DpaAlkxee
         4Az9kAcG8e6dSfBJyDqRGOYcKBRTzzlJoW8tyNRFS4/xZdgKh2+AmsIa/VlkH8AWYjql
         kM3De+g1Zgftgyp2zzaYtS52ihZgyO01mA3u0nczU6qcrLUKbL4cIcz+nbuCJlYQweJg
         n16HCQumAGeGrc8BCaMH8eG0JIrxz22MxkTlt0ZEJYy8P+7F8YVoxSCA8cmmROl7H7wG
         sDN7iEm8bMKQw2+l4lB/go5/iCMg0+PpAGI/v7wo1WdeCZLwDyoVCXz5sw2A0pegVnqf
         lrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775799790; x=1776404590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1pt5x+EZNVQ/9L2esCcdERqDp98YgPBmh2Q0zovV4k=;
        b=IzBaF/d3F6bESdZzK14cNQxjCorB8o0XqQknmSareRJtoq0VucArwmhQogaICPvogX
         +EXDGmrMZYX7aBHW4zST+afWr/6tjlZv0PjBR2JK4lWcqvZuWhnBzq/ZWvua3klRAVUH
         NxmElofkmcte/zRJuK2nQ131jytFjCV7clJaZTewMRUY7tUD6WLhU2YoaWY7HRvLCvee
         VmAt8rG9uCigWd4LwKCbil1T+NxevHpG18z3IMcBEOkBGrg6hBK3L9Ra/ewY0OKGIBxm
         R2n8KDCICVW9g9RlHNTg/ZQHgwcTTSnVzzB5JlWZNHrHLHxe1pWdt6g/wzTXjg/RO4zR
         bAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF2jAaRC3OJI3IhYtD2F/mg3aFfJWC8BRjGu/f3de8ylaK8DQUil0EU+QrynHJTzVm0Ya4vm0CvnI328Y9pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1gqXUdixbbPPJ2pMvYaKYE4s+8CBwCwpvQUiNFv1oAWQOzqaj
	k05wy6uaVrsPRI0+K+Ea72KNVG4QVKbfqrn59iu/LTb/l6J9O/RIoQXIbsd5PgyCEyz825Vsc6/
	JT+45e2bAqlV3ZQLgEF4ObAsxEvJwD3Ezl3sqcufT
X-Gm-Gg: AeBDieuGc7paal1q9hl2JsciKZrqbKvgpFKbspnSvTpLABWEFipEKh8flEb1rHXVQJw
	5ZatrBKnvSBI0ZKGcNpbnyZ7sRxhdbSMvK4KcxAU2PsxwQwrfhc4KirERGWhXsXB02tx4I4u9kL
	/Yoz1oXfhJajBFe6dSmoxOigOjPGwbyFR8Hji7MXFTaj4AxYGlWENFjlL0rALGB2uNtR3YNlXsm
	Od9+ok2w6v9Suq+kaHdpvWIiE6eVZ229JrG3gzIzYnP6HsAif2+FFJ0rDAak9PEBxq/e5vlv4XR
	o49esllolGYcCuHz4c1EtfK8GOAsMyhw+ByDkkac7nZbqxxJ4+PkNrsNyWY=
X-Received: by 2002:a5d:5d0b:0:b0:439:b59e:5e65 with SMTP id
 ffacd0b85a97d-43d6427b770mr2432728f8f.6.1775799789589; Thu, 09 Apr 2026
 22:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-binder-netlink-v2-0-c0d327d15435@google.com>
 <20260408-binder-netlink-v2-1-c0d327d15435@google.com> <a12cc023-629e-457d-af02-4c481024dda0@lunn.ch>
In-Reply-To: <a12cc023-629e-457d-af02-4c481024dda0@lunn.ch>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Apr 2026 07:42:57 +0200
X-Gm-Features: AQROBzDO1-pXW1WE9egnGqp-vaAZUj57O5qVLNjOBzOqwnHEiR-EFGeoLY8CTpg
Message-ID: <CAH5fLgii7gkjpn5bkj-dd8VWkFGr_uTHjc292+GM9OA5qUJ+PQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: netlink: add raw netlink abstraction
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 11:50=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +__rust_helper void rust_helper_genlmsg_cancel(struct sk_buff *skb, voi=
d *hdr)
> > +{
> > +     return genlmsg_cancel(skb, hdr);
> > +}
> > +
> > +__rust_helper void rust_helper_genlmsg_end(struct sk_buff *skb, void *=
hdr)
> > +{
> > +     return genlmsg_end(skb, hdr);
> > +}
> > +
> > +__rust_helper void rust_helper_nlmsg_free(struct sk_buff *skb)
> > +{
> > +     return nlmsg_free(skb);
> > +}
>
> It is a bit odd for a void function to call return like this,
> especially when the functions they are calling are also void
> functions.

Oh you're right. I think that's what we call a copy-paste mistake.
I'll fix it up in the next version.

Alice
