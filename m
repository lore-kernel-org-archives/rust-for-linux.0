Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94477429CD6
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 20:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272394; cv=none; b=IPuvic6BNLTleQxDaqz76Dyxg84EGYv8VjWGP3LRFzo2FYlAFC3N4Vibaw0Op8GaWMFThMeZgEpyZ8yXDfZo/JbDUUJLJEcj1iTKLdnFWxGxKCRXeUrVZGGEIjX9UgSiwmEgQ0tIj+A/acLpMqqoGmN4RWL+qQwbuBLDpB79DvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272394; c=relaxed/simple;
	bh=N/QyWsYWlb/wTkxijoFPQMdrqD5lE7biQ8nf5cXKQRQ=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:Mime-Version:
	 References:In-Reply-To; b=LM3uzuMPAt+gB/4STLoyPeX9eeNjIGKDVcTs/Cx/RodV7QXj7rExbVxiT3lQgqjRSu8KCR941XN78q/rhmi0m6z1Qi9Jn5AJBQLWVa/71iRn5q11m2svPAv4Vh2rmAA8i2Mp5axB6+x4+q2fXA3CDU0XEnUGpCQbbxi+bCnfTU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=nxmS7sY5; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ZaDuk9rK; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="nxmS7sY5";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ZaDuk9rK"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=nxmS7sY5r0h0aw2fu9l43mdXgaxvzKTie1C/pfEtNW+8TWwklRuaOKTAbh3ZLqPu9IZVFVxaPyGZeXm1T+gMeyCIYKqdnjjG4LT6Q3VRHa+DA+yM/R8VmvubM6+a9Fd5PgwR1i4exvNz2qDI24OgeXpDx/AL8tisYb+g5cToi6ru18bXxtD+nT0KCRP2NQg9g7e2SjACaotocPHlHbB8P7P1msokvNpszbv8VkwoB56DBxt7qDGsqGHhgb0d+JvGvPa6tkfb4q1TSLfbncyUGV2sv/+HRy6xbbjhrjPGkd5g0GsZcIq6tOggl2xv4Op0VQ6ZkD+mnu+gfqkRpc36cw==; s=purelymail3; d=rcpassos.me; v=1; bh=N/QyWsYWlb/wTkxijoFPQMdrqD5lE7biQ8nf5cXKQRQ=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=ZaDuk9rKv/DqOGSaxMkKRqg8WxE8hM09WLEuBWbmpXaHqmuCRz/TxFA2w3EGZMzQpCPvCgNn2x3jgVnKRV/WB6pIKpomjSxR1wBsYb6TY5ETd7JVw2TDH4/FPF0jFFGNPxJ3wydsaxUbamGNR1H0AdG3H4POtH1KhellUfEewLQAU1Kqu0Tga2KMipHBA+CGxRknxaOVkLZFXFP4frGw9L5Bs6f6nJSIQJLgRRkD9QBzUOxTMho8OkXqXaMXDa7rTF9dgps9KFRJJGjHoMU9JDtusDw17Wu9CRDYaL2n/+D7uNjJh4POyMg+nmccKXTWXjxMJfOF6MFc7CyQPy9kLA==; s=purelymail3; d=purelymail.com; v=1; bh=N/QyWsYWlb/wTkxijoFPQMdrqD5lE7biQ8nf5cXKQRQ=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1337069898;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 28 Jul 2026 20:59:48 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 17:59:45 -0300
Message-Id: <DKAI8RPYX25S.ENUL6EQIROC9@rcpassos.me>
Subject: Re: [PATCH] rust_binder: speed up get_node_debug_info using
 lower_bound iter
Cc: "Rafael Passos" <rafael@rcpassos.me>, <arve@android.com>,
 <tkjos@android.com>, "Christian Brauner" <brauner@kernel.org>,
 <cmllamas@google.com>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg KH"
 <gregkh@linuxfoundation.org>, <rust-for-linux@vger.kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260728010717.3075755-1-rafael@rcpassos.me>
 <2026072804-sedation-bogged-6f89@gregkh>
 <CAH5fLgh6jyOOW=nHatA=wOc0fjwk7k5VUJgtk0HNz4zdUScN_g@mail.gmail.com>
In-Reply-To: <CAH5fLgh6jyOOW=nHatA=wOc0fjwk7k5VUJgtk0HNz4zdUScN_g@mail.gmail.com>

Hi Greg and Alice,

On Tue, Jul 28, 2026 at 6:54=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Jul 27, 2026 at 10:03:21PM -0300, Rafael Passos wrote:
> > Finding the next node in the RBTree can be done more efficiently using
> > the cursor_lower_bound, as it reduces cost from O(n) to O(log n).
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1249
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> > ---
>
> Does this actually speed anything up in the binder benchmark tools?

I want to run these benchmarks! I searched and this "Performance testing"
page [1] in android docs was the closest match. Am I correct?

I'm learning more about binder, watching the talks, reading posts etc.
It's really interesting. Any recommendations on how to run in VMs and in
Hardware ? Is the Cuttlefish emulator the recommended setup ?

On Tue Jul 28, 2026 at 2:47 AM -03, Alice Ryhl wrote:
> I don't think I got the email for this patch?

Sorry for the confusion. I had to send it twice because I missed the
list in the first email. The second send is in lore [2].
I will send a v2 with suggestions. This message might reach both
threads (if I manipulated the headers correctly ;P)

[1] Android Performance testing https://source.android.com/docs/core/tests/=
vts/performance
[2] patch resend https://lore.kernel.org/rust-for-linux/amhHBxSfuat8WZ8R@go=
ogle.com/T/#t

Thanks,
Rafael Passos
